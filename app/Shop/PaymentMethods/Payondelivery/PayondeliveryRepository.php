<?php

namespace App\Shop\PaymentMethods\Payondelivery;

use App\Shop\Checkout\CheckoutRepository;
use App\Shop\Couriers\Courier;
use App\Shop\Couriers\Repositories\CourierRepository;
use App\Shop\Customers\Customer;
use App\Shop\Customers\Repositories\CustomerRepository;
use App\Shop\PaymentMethods\Payondelivery\Exceptions\PayondeliveryChargingErrorException;
use Gloudemans\Shoppingcart\Facades\Cart;
use Ramsey\Uuid\Uuid;
use Stripe\Charge;

class PayondeliveryRepository
{
    /**
     * @var Customer
     */
    private $customer;

    /**
     * PayondeliveryRepository constructor.
     * @param Customer $customer
     */
    public function __construct(Customer $customer)
    {
        $this->customer = $customer;
    }

    /**
     * @param array $data Cart data
     * @param $total float Total items in the cart
     * @param $tax float The tax applied to the cart
     * @return Charge Payondelivery charge object
     * @throws PayondeliveryChargingErrorException
     */
    public function execute(array $data, $total, $tax) : Charge
    {
        try {
            $courierRepo = new CourierRepository(new Courier);
            $courierId = $data['courier'];
            $courier = $courierRepo->findCourierById($courierId);

            $totalComputed = $total + $courier->cost;

            $customerRepo = new CustomerRepository($this->customer);
            $options['source'] = $data['paystackToken'];
            $options['currency'] = config('cart.currency');

            if ($charge = $customerRepo->charge($totalComputed, $options)) {
                $checkoutRepo = new CheckoutRepository;
                $checkoutRepo->buildCheckoutItems([
                    'reference' => Uuid::uuid4()->toString(),
                    'courier_id' => $courierId,
                    'customer_id' => $this->customer->id,
                    'address_id' => $data['address'],
                    'order_status_id' => 1,
                    'payment' => strtolower(config('paystack.name')),
                    'discounts' => 0,
                    'total_products' => $total,
                    'total' => $totalComputed,
                    'total_paid' => $totalComputed,
                    'tax' => $tax
                ]);

                Cart::destroy();
            }

            return $charge;
        } catch (\Exception $e) {
            throw new PayondeliveryChargingErrorException($e);
        }
    }
}
