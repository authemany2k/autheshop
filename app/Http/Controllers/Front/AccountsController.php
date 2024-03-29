<?php

namespace App\Http\Controllers\Front;

use App\Shop\Products\Product;
use App\Shop\Wishlists\Wishlist;
use App\Shop\Reviews\Review;
use App\Shop\Couriers\Repositories\Interfaces\CourierRepositoryInterface;
use App\Shop\Customers\Repositories\CustomerRepository;
use App\Shop\Customers\Repositories\Interfaces\CustomerRepositoryInterface;
use App\Http\Controllers\Controller;
use App\Shop\Orders\Order;
use App\Shop\Orders\Transformers\OrderTransformable;

class AccountsController extends Controller
{
    use OrderTransformable;

    private $customerRepo;
    private $courierRepo;

    public function __construct(
        CourierRepositoryInterface $courierRepository,
        CustomerRepositoryInterface $customerRepository
    )
    {
        $this->customerRepo = $customerRepository;
        $this->courierRepo = $courierRepository;
    }

    public function index()
    {
        $wishlists = Wishlist::where([
            'customer_id' => \Auth::user()->id,
        ])->get();
        $products = Product::all();
        $customer = $this->customerRepo->findCustomerById(auth()->user()->id);

        $customerRepo = new CustomerRepository($customer);
        $orders = $customerRepo->findOrders();

        $orders->transform(function (Order $order) {
            return $this->transformOrder($order);
        });

        $addresses = $customerRepo->findAddresses();

        return view('front.accounts', [
            'customer' => $customer,
            'orders' => $this->customerRepo->paginateArrayResults($orders->toArray(), 3),
            'addresses' => $addresses,
            'wishlists' => $wishlists,
            'products' => $products
        ]);
    }
}