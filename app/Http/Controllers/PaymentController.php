<?php

namespace App\Http\Controllers;

use App\Shop\Address;
use Illuminate\Http\Request;
use App\Shop\Addresses\Repositories\Interfaces\AddressRepositoryInterface;
use App\Shop\Carts\Repositories\Interfaces\CartRepositoryInterface;
use App\Shop\Couriers\Repositories\Interfaces\CourierRepositoryInterface;
use App\Shop\Customers\Repositories\Interfaces\CustomerRepositoryInterface;
use App\Shop\Orders\Order;
use App\Shop\Orders\Repositories\Interfaces\OrderRepositoryInterface;
use App\Shop\Products\Repositories\Interfaces\ProductRepositoryInterface;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use Paystack;
use Auth;

class PaymentController extends Controller
{

    private $cartRepo;
    private $courierRepo;
    private $addressRepo;
    private $customerRepo;
    private $productRepo;
    private $orderRepo;
    public function __construct(

        CartRepositoryInterface $cartRepository,
        CourierRepositoryInterface $courierRepository,
        AddressRepositoryInterface $addressRepository,
        CustomerRepositoryInterface $customerRepository,
        ProductRepositoryInterface $productRepository,
        OrderRepositoryInterface $orderRepository
    )
    {
        $this->cartRepo = $cartRepository;
        $this->courierRepo = $courierRepository;
        $this->addressRepo = $addressRepository;
        $this->customerRepo = $customerRepository;
        $this->productRepo =  $productRepository;
        $this->orderRepo = $orderRepository;
    }


    public function index()
    {
//        $order = Order::all();
//        return view('pscheckout', compact(  'order', 'item', 'product' ));
    }

    public function redirectToGateway(Request $request)
    {

        return Paystack::getAuthorizationUrl()->redirectNow();
    }
    /**
     * Obtain Paystack payment information
     * @return void
     */
    public function handleGatewayCallback()
    {
//        $customer = $this->customerRepo->findCustomerById($this->loggedUser()->id);
        $paymentDetails = Paystack::getPaymentData();
        $payment_status = ($paymentDetails['data']['status']);
        $payment_reference = ($paymentDetails['data']['reference']);
        $payment_date = ($paymentDetails['data']['transaction_date']);
        $payment_date= Carbon::parse($payment_date)->format('d-m-Y H:i:s') ;
        $payment_made = ($paymentDetails['data']['amount']);
        //return($payment_status.$payment_reference.$payment_date.$payment_made);
        if($payment_status == 'success'){
            $order = Order::where('reference', $payment_reference)->first();
            $order->order_status_id = 5;
            $order->total_paid = ($payment_made)/100;
            $order->save();

            $data = [
                'order' => $order,
                'products' => $order->products,
                'customer' => $order->customer,
                'courier' => $order->courier,
                'address' => $order->address,
                'status' => $order->orderStatus,
                'payment' => $order->payment
            ];

            $customer= $order->customer;
            Mail::send('emails.customer.sendOrderDetailsToCustomer', $data, function ($message) use ($customer)
            {
                $message->to($customer->email, $customer->name);
                $message->replyTo(config('mail.reply_to.address'), config('mail.reply_to.name'));
                $message->subject('Your Order from AuthemanShop');
            });

            Mail::send('emails.admin.OrderNotificationEmail', $data, function($message) use ($customer)
            {
                $message->to('info@authemanshop.com', 'AuthemanShop')->subject('Order From a Customer on AuthemanShop');
                $message->from('info@authemanshop.com','AuthemanShop');
            });


            return view('front.pscheckout', compact( 'payment_made','payment_status','order', 'customer', 'payment_date'));
        } else {
            return view('checkout-fail');
        }

        // Now you have the payment details,
        // you can store the authorization_code in your db to allow for recurrent subscriptions
        // you can then redirect or do whatever you want
    }
}