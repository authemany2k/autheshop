<?php

namespace App\Http\Controllers\Front;

use App\Shop\Addresses\Repositories\Interfaces\AddressRepositoryInterface;
use App\Shop\Cart\Requests\CartCheckoutRequest;
use App\Shop\Carts\Repositories\Interfaces\CartRepositoryInterface;
use App\Shop\Carts\Repositories\CartRepository;
use App\Shop\Carts\Requests\PayPalCheckoutExecutionRequest;
use App\Shop\Carts\Requests\PaystackExecutionRequest;
use App\Shop\Couriers\Repositories\Interfaces\CourierRepositoryInterface;
use App\Shop\Customers\Customer;
use App\Shop\Customers\Repositories\CustomerRepository;
use App\Shop\Customers\Repositories\Interfaces\CustomerRepositoryInterface;
use App\Shop\OrderDetails\OrderProduct;
use App\Shop\OrderDetails\Repositories\OrderProductRepository;
use App\Shop\Orders\Order;
use App\Shop\OrderDetails\Repositories\Interfaces\OrderProductRepositoryInterface;
use App\Shop\Orders\Repositories\Interfaces\OrderRepositoryInterface;
use App\Shop\PaymentMethods\Paypal\Exceptions\PaypalRequestError;
use App\Shop\PaymentMethods\Paypal\Repositories\PayPalExpressCheckoutRepository;
use App\Shop\PaymentMethods\Paystack\Exceptions\PaystackChargingErrorException;
use App\Shop\PaymentMethods\Paystack\PaystackRepository;
use App\Shop\PaymentMethods\Payondelivery\Exceptions\PayondeliveryChargingErrorException;
use App\Shop\PaymentMethods\Payondelivery\PayondeliveryRepository;
use App\Shop\Products\Repositories\Interfaces\ProductRepositoryInterface;
use App\Shop\Products\Transformations\ProductTransformable;
use App\Shop\Shipping\ShippingInterface;
use Exception;
use App\Shop\Carts\ShoppingCart;
use App\Http\Controllers\Controller;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
//use App\PayPal\Api\Payment;
use DB;
use Carbon\Carbon;
use PayPal\Exception\PayPalConnectionException;
use Paystack;
use Ramsey\Uuid\Uuid;
use Illuminate\Support\Facades\Mail;
use Gloudemans\Shoppingcart\CartItem;

class CheckoutController extends Controller
{
    use ProductTransformable;

    private $cartRepo;
    private $courierRepo;
    private $addressRepo;
    private $customerRepo;
    private $productRepo;
    private $orderRepo;
    private $courierId;
    private $orderProductRepo;
    private $payPal;
    private $shippingRepo;

    public function __construct(
        CartRepositoryInterface $cartRepository,
        CourierRepositoryInterface $courierRepository,
        AddressRepositoryInterface $addressRepository,
        CustomerRepositoryInterface $customerRepository,
        ProductRepositoryInterface $productRepository,
        OrderRepositoryInterface $orderRepository,
        OrderProductRepositoryInterface $orderProductRepository,
	    ShippingInterface $shipping
    )
    {
        $this->middleware('checkout');
        $this->cartRepo = $cartRepository;
        $this->courierRepo = $courierRepository;
        $this->addressRepo = $addressRepository;
        $this->customerRepo = $customerRepository;
        $this->productRepo = $productRepository;
        $this->orderRepo = $orderRepository;
        $this->orderProductRepo = $orderProductRepository;

        $payPalRepo = new PayPalExpressCheckoutRepository();
        $this->payPal = $payPalRepo;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $customer = $this->customerRepo->findCustomerById($this->loggedUser()->id);
        $this->courierId = request()->session()->get('courierId', 1);
        $courier = $this->courierRepo->findCourierById($this->courierId);
        $shippingCost = $this->cartRepo->getShippingFee($courier);

        $addressId = request()->session()->get('addressId', 1);
        $paymentId = request()->session()->get('paymentName', 'paystack');

	    $products = $this->cartRepo->getCartItems();
	    $rates = null;
	    $shipment_object_id = null;

	    if (env('ACTIVATE_SHIPPING') == 1) {
		    $shipment = $this->createShippingProcess($customer, $products);
		    if (!is_null($shipment)) {
			    $shipment_object_id = $shipment->object_id;
			    $rates = $shipment->rates;
		    }
	    }

        // Get payees
        $paymentMethods = config('payees.name');
        $payees = explode(',', $paymentMethods);
//        dd($paymentMethods);

        $paymentGateways = collect($payees)->transform(function ($name) {
            return config($name);
        })->filter()->all();

//        return($paymentGateways);

        $courier = $this->courierRepo->findCourierById(1);
        $shippingFee = $this->cartRepo->getShippingFee($courier);

        return view('front.checkout', [
            'customer' => $customer,
            'addresses' => $customer->addresses()->get(),
            'products' => $this->cartRepo->getCartItems(),
            'subtotal' => $this->cartRepo->getSubTotal(),
            'shipping' => $shippingCost,
            'tax' => $this->cartRepo->getTax(),
            'total' => $this->cartRepo->getTotal(2, $shippingCost),
            'couriers' => $this->courierRepo->listCouriers(),
            'selectedCourier' => $this->courierId,
            'selectedAddress' => $addressId,
            'selectedPayment' => $paymentId,
            'payments' => $paymentGateways,
            'cartItems' => $this->cartRepo->getCartItemsTransformed(),
            'shipment_object_id' => $shipment_object_id,
            'rates' => $rates
        ]);
    }

    /**
     * Checkout the items
     *
     * @param CartCheckoutRequest $request
     * @return \Illuminate\Http\RedirectResponse
     * @codeCoverageIgnore
     */

    public function store(CartCheckoutRequest $request)
    {
        $courier = $this->courierRepo->findCourierById($request->input('courier'));
        $shippingFee = $this->cartRepo->getShippingFee($courier);

        switch ($request->input('payment')) {

            case 'paypal':
                return $this->payPal->process($courier, $request);
                break;

            case 'paystack':
                $order = new Order;
                $cartRepo = new CartRepository(new ShoppingCart);
                $orderProductRepo = new OrderProductRepository(new OrderProduct);

                $order->reference = $request->reference;
                $order->courier_id = $request->courier;
                $order->customer_id = Auth::user()->id;
                $order->address_id = $request->address;
                $order->order_status_id = 2;
//                $order->payment_method_id = $request->payment_method_id;
                $order->payment = $request->payment;
                $order->discounts = 0.00;
                $order->total_products = $request->subtotal;
                $order->tax = $request->tax;
                $order->total = $request->total;
                $order->save();

//                return ($request->total);
                $orderProductRepo->buildOrderDetails($order, $cartRepo->getCartItems());
                Cart::destroy();
//                return ($request->total);
//                return(Cart::total());
                return Paystack::getAuthorizationUrl()->redirectNow();
                break;

            case 'payondelivery':
                $order = new Order;
                $cartRepo = new CartRepository(new ShoppingCart);
                $orderProductRepo = new OrderProductRepository(new OrderProduct);

                $order->reference = Uuid::uuid4()->toString();
                $order->courier_id = $request->courier;
                $order->customer_id = Auth::user()->id;
                $order->address_id = $request->address;
                $order->order_status_id = 4;
                $order->discounts = 0.00;
//                $order->payment_method_id = $request->payment_method_id;
                $order->payment = $request->payment;
                $order->total_products = $request->subtotal;
                $order->tax = $request->tax;
                $order->total = $request->total;
                $order->save();

                $orderProductRepo->buildOrderDetails($order, $cartRepo->getCartItems());
                Cart::destroy();

                $data = [
                    'order' => $order,
                    'products' => $order->products,
                    'customer' => $order->customer,
                    'courier' => $order->courier,
                    'address' => $order->address,
                    'status' => $order->orderStatus,
                    'payment' => $order->paymentMethod
                ];

                $customer = $order->customer;
                Mail::send('emails.customer.sendOrderDetailsToCustomer', $data, function ($message) use ($customer) {
//                $this->orderRepo->sendEmailToCustomer();
                    $message->to($customer->email, $customer->name);
                    $message->replyTo(config('mail.reply_to.address'), config('mail.reply_to.name'));
                    $message->subject('Your Order from AuthemanShop');
                });

                Mail::send('emails.admin.OrderNotificationEmail', $data, function ($message) use ($customer) {
//                $this->orderRepo->sendEmailNotificationToAdmin();
                    $message->to('info@authemanshop.com', 'AuthemanShop')->subject('Order From a Customer on AuthemanShop');
                    $message->from('info@authemanshop.com', 'AuthemanShop');
                });

                return view('front.payondelivery', compact('order'));
//            return redirect()->route('checkout.success');

        break;

    default:
    }
}

    /**
     * Execute the PayPal payment
     *
     * @param PayPalCheckoutExecutionRequest $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function executePayPalPayment(PayPalCheckoutExecutionRequest $request)
    {
        try {
            $this->payPal->execute($request);
            $this->cartRepo->clearCart();

            return redirect()->route('checkout.success');
        } catch (PayPalConnectionException $e) {
            throw new PaypalRequestError($e->getData());
        } catch (Exception $e) {
            throw new PaypalRequestError($e->getMessage());
        }
    }

    /**
     * @param PaystackExecutionRequest $request
     * @return \Stripe\Charge
     */
    public function charge(PaystackExecutionRequest $request)
    {
        try {
            $customer = auth()->user();
            $paystackRepo = new PaystackRepository($customer);

            return $paystackRepo->execute(
                $request->all(),
                Cart::total(),
                Cart::tax()
            );
        } catch (PaystackChargingErrorException $e) {
            Log::info($e->getMessage());
            return redirect()->route('checkout.index')->with('error', 'There is a problem processing your request.');
        }
    }

    /**
     * Cancel page
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function cancel(Request $request)
    {
        return view('front.checkout-cancel', ['data' => $request->all()]);
    }

    /**
     * Success page
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function success()
    {
        return view('front.checkout-success');
    }

    /**
     * @param Customer $customer
     * @param Collection $products
     *
     * @return mixed
     */
    private function createShippingProcess(Customer $customer, Collection $products)
    {
        $customerRepo = new CustomerRepository($customer);

        if ($customerRepo->findAddresses()->count() > 0 && $products->count() > 0) {

            $this->shippingRepo->setPickupAddress();
            $deliveryAddress = $customerRepo->findAddresses()->first();
            $this->shippingRepo->setDeliveryAddress($deliveryAddress);
            $this->shippingRepo->readyParcel($this->cartRepo->getCartItems());

            return $this->shippingRepo->readyShipment();
        }
    }
}
