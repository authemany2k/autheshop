<?php

namespace App\Http\Controllers\Front;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Shop\Products\Repositories\Interfaces\ProductRepositoryInterface;
use App\Shop\Customers\Repositories\Interfaces\CustomerRepositoryInterface;
use App\Shop\Wishlists\Wishlist;
use Session;

class WishlistController extends Controller
{

    private $productRepo;

    /**
     * ProductController constructor.
     * @param ProductRepositoryInterface $productRepository
     */
    public function __construct(ProductRepositoryInterface $productRepository, CustomerRepositoryInterface $customerRepository)
    {

        $this->productRepo = $productRepository;
        $this->customerRepo = $customerRepository;
    }
    /**
     * @param string $slug
     * @return \Illuminate\Http\RedirectResponse
     */

    public function add($slug)
    {
        if(\Auth::check()){
        $product = $this->productRepo->findProductBySlug(['slug' => $slug]);
        Wishlist::create([
            'customer_id' => Auth::user()->id,
            'product_id' => $product->id,
        ]);
        }
        else{
            return redirect('login');
        }
        return redirect()->back()->with('notificationText', "Product added into your Wishlist successfully!!");

    }


    /**
     * Display Wishlist List inside my account page.
     * @return \Illuminate\Http\RedirectResponse
     */
    public function mylist()
    {
        $product = $this->productRepo->findProductImages();
        $wishlists = Wishlist::where([
            'customer_id' => Auth::user()->id,
        ])->get();
        return view('front.accounts')
            ->with('wishlists', $wishlists, $product);
    }


    /**
     *  Destroy Product from user Wish list.
     *
     * @param string $slug
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($slug)
    {
        $product = $this->productRepo->findProductBySlug(['slug' => $slug]);
        Wishlist::where([
            'customer_id' => Auth::user()->id,
            'product_id' => $product->id,
        ])->delete();
        Session::flash('notificationText', 'Product removed from your Wishlist successfully!');
        return redirect()->back()->with('notificationText', 'Product removed from your Wishlist successfully!!');
    }

}
