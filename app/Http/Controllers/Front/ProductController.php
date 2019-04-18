<?php

namespace App\Http\Controllers\Front;

use App\Shop\AttributeValues\AttributeValue;
use App\Shop\ProductAttributes\ProductAttribute;
use App\Shop\Products\Product;
use App\Shop\Products\Repositories\Interfaces\ProductRepositoryInterface;
use App\Http\Controllers\Controller;
use App\Shop\Products\Transformations\ProductTransformable;
use App\Shop\Wishlists\Wishlist;
use App\Shop\Reviews\Review;
use Session;
use DB;
use Illuminate\http\Request;
use Illuminate\Support\Collection;

class ProductController extends Controller
{
    use ProductTransformable;

    /**
     * @var ProductRepositoryInterface
     */
    private $productRepo;

    /**
     * ProductController constructor.
     * @param ProductRepositoryInterface $productRepository
     */
    public function __construct(ProductRepositoryInterface $productRepository)
    {
        $this->productRepo = $productRepository;
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */

//    public function index()
//    {
//        $list = $this->productRepo->listProducts('id');
//
//        $products = $list->map(function (Product $product) {
//            return $this->transformProduct($product);
//        })->sortByDesc('id');
//
//        return view('front.products.list', [
//            'products' => $this->productRepo->paginateArrayResults($products->all(), 10),
//        ]);
//    }

    public function search()
    {
        $list = $this->productRepo->listProducts();

        if (request()->has('q') && request()->input('q') != '') {
            $list = $this->productRepo->searchProduct(request()->input('q'));
        }

        $products = $list->map(function (Product $item) {
            return $this->transformProduct($item);
        });

        return view('front.products.product-search', [
            'products' => $this->productRepo->paginateArrayResults($products->all(), 12)
        ]);
    }

     public function filter(Request $request)
    {
        $categories = $request->categories;
        $min_price = $request->min_price;
        $max_price = $request->max_price;


        $products = DB::table("products")->select("products.id", "products.sku", "products.name", "products.slug", "products.description"
                                                , "products.specification", "products.cover", "products.in_stock", "products.quantity", "products.price"
                                                , "products.status", "products.created_at", "products.updated_at", "categories.slug AS cslug")
                                    ->join('category_product', 'products.id', '=', 'category_product.product_id')
                                    ->join('categories', 'categories.id', '=', 'category_product.category_id')->where(function($query) use ($categories, $min_price, $max_price ){
                if(isset($min_price) && isset($max_price)) {
                    if (isset($categories)) {
                        foreach ($categories as $category) {
                            $query-> orWhere('price','>=',$min_price);
                            $query-> where('price','<=',$max_price);
                            $query->where('categories.slug', '=', $category);
                        }
                    }

                    $query-> where('price','>=',$min_price);
                    $query-> where('price','<=',$max_price);
                }
         
        })->get();
//	    'products' => $this->productRepo->paginateArrayResults($products->all(), 10),
//	     $html = view('front.products.filter', compact('\'products\' => $this->productRepo->paginateArrayResults($products->all(), 10)'))->render();

            $html = view('front.products.filter', compact('products'))->render();

            return $html;
    }
    /**
     * Get the product
     *
     * @param string $slug
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(string $slug)
    {
        $product = $this->productRepo->findProductBySlug(['slug' => $slug]);
        $images = $product->images()->get();
        $category = $product->categories()->first();
        $productAttributes = $product->attributes;
        $wishlist = Wishlist::all();
//        $reviews = Review::all();

        $reviews = Review::where('status', '=', 1)->get();

//	    $reviews = Review::orderBy('created_at', 'asc')->paginate(25);

//	    return($reviews);
        return view('front.products.product', compact(
            'product',
            'images',
            'productAttributes',
            'category',
            'combos',
            'wishlist',
            'reviews'
        ));
    }
}
