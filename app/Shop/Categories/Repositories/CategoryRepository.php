<?php

namespace App\Shop\Categories\Repositories;

use App\Shop\Base\BaseRepository;
use App\Shop\Categories\Category;
use App\Shop\Categories\Exceptions\CategoryInvalidArgumentException;
use App\Shop\Categories\Exceptions\CategoryNotFoundException;
use App\Shop\Categories\Repositories\Interfaces\CategoryRepositoryInterface;
use App\Shop\Products\Product;
use App\Shop\Products\Transformations\ProductTransformable;
use App\Shop\Tools\UploadableTrait;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use DB;

class CategoryRepository extends BaseRepository implements CategoryRepositoryInterface
{
    use UploadableTrait, ProductTransformable;
    private $categoryRepo;
    /**
     * CategoryRepository constructor.
     * @param Category $category
     */
    public function __construct(
        Category $category
//        CategoryRepositoryInterface $categoryRepository
    )
    {
        parent::__construct($category);
        $this->model = $category;
//        $this->categoryRepo = $categoryRepository;
    }

    /**
     * List all the categories
     *
     * @param string $order
     * @param string $sort
     * @param array $except
     * @return \Illuminate\Support\Collection
     */
    public function listCategories(string $order = 'id', string $sort = 'desc', $except = [])
    {
        return $this->model->orderBy($order, $sort)->get()->except($except);
    }

    /**
     * Create the category
     *
     * @param array $params
     * @return Category
     * @throws CategoryInvalidArgumentException
     */
    public function createCategory(array $params) : Category
    {
        try {

            $collection = collect($params);
            if (isset($params['name'])) {
                $slug = str_slug($params['name']);
            }

            if (request()->hasFile('cover')) {
                $file = request()->file('cover', 'products');
                $cover = $this->uploadOne($file, 'categories');
            }

            $merge = $collection->merge(compact('slug', 'cover'));

            $category = new Category($merge->all());

            if (isset($params['parent'])){
                $parent = $this->findCategoryById($params['parent']);
                $category->parent()->associate($parent);
            }

            $category->save();
            return $category;

        } catch (QueryException $e) {
            throw new CategoryInvalidArgumentException($e->getMessage());
        }
    }

    /**
     * Update the category
     *
     * @param array $params
     * @return Category
     */
    public function updateCategory(array $params) : Category
    {
        $category = $this->findCategoryById($this->model->id);
        $collection = collect($params)->except('_token');
        $slug = str_slug($collection->get('name'));

        if (request()->hasFile('cover')) {
            $file = request()->file('cover', 'products');
            $cover = $this->uploadOne($file, 'categories');
        }

        $merge = $collection->merge(compact('slug', 'cover'));
        if (isset($params['parent'])) {
            $parent = $this->findCategoryById($params['parent']);
            $category->parent()->associate($parent);
        }

        $category->update($merge->all());
        return $category;
    }

    /**
     * @param int $id
     * @return Category
     * @throws CategoryNotFoundException
     */
    public function findCategoryById(int $id) : Category
    {
        try {
            return $this->findOneOrFail($id);
        } catch (ModelNotFoundException $e) {
            throw new CategoryNotFoundException($e->getMessage());
        }
    }

    /**
     * Delete a category
     *
     * @return bool
     */
    public function deleteCategory() : bool
    {
        return $this->model->delete();
    }

    /**
     * Associate a product in a category
     *
     * @param Product $product
     * @return \Illuminate\Database\Eloquent\Model
     */
    public function associateProduct(Product $product)
    {
        return $this->model->products()->save($product);
    }

    /**
     * Return all the products associated with the category
     *
     * @return mixed
     */
    public function findProducts()
    {
        return collect($this->model->products)->map(function (Product $product) {
            return $this->transformProduct($product);
        })->sortByDesc('id');
    }

    /**
     * @param array $params
     */
    public function syncProducts(array $params)
    {
        $this->model->products()->sync($params);
    }


    /**
     * Detach the association of the product
     *
     */
    public function detachProducts()
    {
        $this->model->products()->detach();
    }

    /**
     * @param $file
     * @param null $disk
     * @return bool
     */
    public function deleteFile(array $file, $disk = null) : bool
    {
        return $this->update(['cover' => null], $file['category']);
    }

    /**
     * Return the category by using the slug as the parameter
     *
     * @param array $slug
     * @return Category
     */
    public function findCategoryBySlug(array $slug) : Category
    {
        try {
            return $this->findOneByOrFail($slug);
        } catch (ModelNotFoundException $e) {
            throw new CategoryNotFoundException($e->getMessage());
        }
    }

    /**
     * Find products under a specific category
     *
     * @param int $id
     * @return mixed
     */

    public function findProductsInCategory(int $id)
    {
//        $category = $this->categoryRepo->findCategoryById($id);
//        $paginated = $this->categoryRepo->paginateArrayResults($category->products, 10);
//        dd($paginated);

          $category = $this->findCategoryById($id);
          return $category->products->sortByDesc('id');

    }

//    public function findProductsInCategory(int $id)
//    {
//        $category = $this->findCategoryById($id);
//        $pagenateResults = DB::table('products')->paginate(12);
//        $category->products = $pagenateResults;
//        return $pagenateResults->sortByDesc('id');
//    }

    /**
     * @return mixed
     */
    public function findParentCategory()
    {
        return $this->model->parent;
    }

    /**
     * @return mixed
     */
    public function findChildren()
    {
        return $this->model->children;
    }

//    public function searchCategory(string $text) : Collection
//    {
//        return $this->model->search($text)->get();
//    }
}