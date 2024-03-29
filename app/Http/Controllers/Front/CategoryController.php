<?php

namespace App\Http\Controllers\Front;

use App\Shop\Wishlists\Wishlist;
use App\Shop\Reviews\Review;
use App\Shop\Categories\Repositories\CategoryRepository;
use App\Shop\Categories\Repositories\Interfaces\CategoryRepositoryInterface;
use App\Http\Controllers\Controller;

class CategoryController extends Controller
{
    /**
     * @var CategoryRepositoryInterface
     */
    private $categoryRepo;

    /**
     * CategoryController constructor.
     *
     * @param CategoryRepositoryInterface $categoryRepository
     */
    public function __construct(CategoryRepositoryInterface $categoryRepository)
    {
        $this->categoryRepo = $categoryRepository;
    }

    /**
     * Find the category via the slug
     *
     * @param string $slug
     * @return \App\Shop\Categories\Category
     */
    public function getCategory(string $slug)
    {
        $category = $this->categoryRepo->findCategoryBySlug(['slug' => $slug]);

        $repo = new CategoryRepository($category);

        $products = $repo->findProducts()->where('status', 1)->all();

	    $wishlist = Wishlist::all();
	    $reviews  = Review::all();

	    return view('front.categories.category', [
			'category' => $category,
			'wishlist' => $wishlist,
			'reviews'  => $reviews,
			'products' => $repo->paginateArrayResults($products, 12 )
//            'products' => $repo->findProducts()
		] );
	}
}
