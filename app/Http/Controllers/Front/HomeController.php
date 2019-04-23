<?php

namespace App\Http\Controllers\Front;

use App\Shop\Categories\Repositories\Interfaces\CategoryRepositoryInterface;
use App\Http\Controllers\Controller;
use App\Shop\Products\Transformations\ProductTransformable;
use App\Shop\Wishlists\Wishlist;
use App\Shop\Reviews\Review;

class HomeController extends Controller
{
    use ProductTransformable;

    /**
     * @var CategoryRepositoryInterface
     */
    private $categoryRepo;

    /**
     * HomeController constructor.
     * @param CategoryRepositoryInterface $categoryRepository
     */
    public function __construct(CategoryRepositoryInterface $categoryRepository)
    {
        $this->categoryRepo = $categoryRepository;
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $category4 = $this->categoryRepo->find(4);
        $category11 = $this->categoryRepo->find(11);
        $newests = $this->categoryRepo->findProductsInCategory($category4->id)->take(12);
        $features = $this->categoryRepo->findProductsInCategory($category11->id)->take(12);
	    $wishlist = Wishlist::all();
	    $reviews = Review::all();

	    return view('front.index', compact('newests', 'features','category4','category11','wishlist','reviews'));
    }
}
