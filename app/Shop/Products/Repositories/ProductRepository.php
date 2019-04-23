<?php

namespace App\Shop\Products\Repositories;

use App\Shop\AttributeValues\AttributeValue;
use App\Shop\Products\Exceptions\ProductCreateErrorException;
use App\Shop\Products\Exceptions\ProductUpdateErrorException;
use App\Shop\Tools\UploadableTrait;
//use Jsdecena\Baserepo\BaseRepository;
use App\Shop\Brands\Brand;
use App\Shop\ProductAttributes\ProductAttribute;
use App\Shop\ProductImages\ProductImage;
use App\Shop\Products\Exceptions\ProductNotFoundException;
use App\Shop\Products\Product;
use App\Shop\Products\Repositories\Interfaces\ProductRepositoryInterface;
use App\Shop\Products\Transformations\ProductTransformable;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use App\Shop\Products\Exceptions\ProductInvalidArgumentException;
use App\Shop\Base\BaseRepository;

use Intervention\Image\Facades\Image;

class ProductRepository extends BaseRepository implements ProductRepositoryInterface
{
    use ProductTransformable, UploadableTrait;

    /**
     * ProductRepository constructor.
     * @param Product $product
     */
    public function __construct(Product $product)
    {
        parent::__construct($product);
        $this->model = $product;
    }

    /**
     * List all the products
     *
     * @param string $order
     * @param string $sort
     * @param array $columns
     * @return Collection
     */
    public function listProducts(string $order = 'id', string $sort = 'desc', array $columns = ['*']) : Collection
    {
        return $this->all($columns, $order, $sort);
    }

    /**
     * Create the product
     *
     * @param array $data
     *
     * @return Product
     * @throws ProductCreateErrorException
     */
    public function createProduct(array $params) : Product
    {
        try {
            $product = new Product($params);
            $product->save();

            if (isset($params['thumbnails'])) {
                $this->saveThumbnails($params['thumbnails'], $product);
            }

            return $product;
        } catch (QueryException $e) {
            throw new ProductInvalidArgumentException($e->getMessage());
        }
    }

    /**
     * Update the product
     *
     * @param array $data
     *
     * @return bool
     * @throws ProductUpdateErrorException
     */
    public function updateProduct(array $params, int $id) : bool
    {
        $product = $this->find($id);
        try {
            if (isset($params['thumbnails'])) {
                $this->saveThumbnails($params['thumbnails'], $product);
            }
            return $this->update($params, $id);
        } catch (QueryException $e) {
            throw new ProductInvalidArgumentException($e->getMessage());
        }
    }

    /**
     * Find the product by ID
     *
     * @param int $id
     *
     * @return Product
     * @throws ProductNotFoundException
     */
    public function findProductById(int $id) : Product
    {
        try {
            return $this->transformProduct($this->findOneOrFail($id));
        } catch (ModelNotFoundException $e) {
            throw new ProductNotFoundException($e->getMessage());
        }
    }

    /**
     * Delete the product
     *
     * @param Product $product
     *
     * @return bool
     * @throws \Exception
     * @deprecated
     * @use removeProduct
     */
    public function deleteProduct(Product $product) : bool
    {
        $product->images()->delete();
        return $product->delete();
    }

    /**
     * @return bool
     * @throws \Exception
     */
    public function removeProduct() : bool
    {
        return $this->model->where('id', $this->model->id)->delete();
    }

    /**
     * Detach the categories
     */
    public function detachCategories()
    {
        $this->model->categories()->detach();
    }

    /**
     * Return the categories which the product is associated with
     *
     * @return Collection
     */
    public function getCategories() : Collection
    {
        return $this->model->categories()->get();
    }

    /**
     * Sync the categories
     *
     * @param array $params
     */
    public function syncCategories(array $params)
    {
        $this->model->categories()->sync($params);
    }

    /**
     * @param $file
     * @param null $disk
     * @return bool
     */
    public function deleteFile(array $file, $disk = null) : bool
    {
        return $this->update(['cover' => null], $file['product']);
    }

    /**
     * @param string $src
     * @return bool
     */
    public function deleteThumb(string $src) : bool
    {
        return DB::table('product_images')->where('src', $src)->delete();
    }

    /**
     * Get the product via slug
     *
     * @param array $slug
     *
     * @return Product
     * @throws ProductNotFoundException
     */
    public function findProductBySlug(array $slug) : Product
    {
        try {
            return $this->findOneByOrFail($slug);
        } catch (ModelNotFoundException $e) {
            throw new ProductNotFoundException($e->getMessage());
        }
    }

    /**
     * @param string $text
     * @return mixed
     */
    public function searchProduct(string $text) : Collection
    {
        if (!empty($text)) {
	        return $this->model->search($text)->get();
        } else {
            return $this->listProducts();
        }
    }

    /**
     * @return mixed
     */
    public function findProductImages() : Collection
    {
        return $this->model->images()->get();
    }

    /**
     * @param UploadedFile $file
     * @return string
     */
    public function saveCoverImage(UploadedFile $file) : string
    {
        return $file->store('products', ['disk' => 'public']);
    }

    /**
     * @param Collection $collection
     *
     * @return void
     */
    public function saveProductImages(Collection $collection, Product $product)
    {
        $collection->each(function (UploadedFile $file) use ($product) {
            $filename = $file->store('products', ['disk' => 'public']);
            $productImage = new ProductImage([
                'product_id' => $product->id,
                'src' => $filename
            ]);
            $product->images()->save($productImage);

          // Image::make(Input::file('photo'))->resize(40, 40)->save('foo.jpg');


          //   Image::make($filename)->encode('png')->fit(40, 40, function($c) {
          //                   $c->upsize();
          //               })->save();


            // Image::make($product->images())->resize(40, 40)->save($productImage);



        });
    }

    /**
     * Associate the product attribute to the product
     *
     * @param ProductAttribute $productAttribute
     * @return ProductAttribute
     */
    public function saveProductAttributes(ProductAttribute $productAttribute) : ProductAttribute
    {
        $this->model->attributes()->save($productAttribute);
        return $productAttribute;
    }

    /**
     * List all the product attributes associated with the product
     *
     * @return Collection
     */
    public function listProductAttributes() : Collection
    {
        return $this->model->attributes()->get();
    }

    /**
     * Delete the attribute from the product
     *
     * @param ProductAttribute $productAttribute
     *
     * @return bool|null
     * @throws \Exception
     */
    public function removeProductAttribute(ProductAttribute $productAttribute) : ?bool
    {
        return $productAttribute->delete();
    }

    /**
     * @param ProductAttribute $productAttribute
     * @param AttributeValue ...$attributeValues
     *
     * @return Collection
     */
    public function saveCombination(ProductAttribute $productAttribute, AttributeValue ...$attributeValues) : Collection
    {
        return collect($attributeValues)->each(function (AttributeValue $value) use ($productAttribute) {
            return $productAttribute->attributesValues()->save($value);
        });
    }

    /**
     * @return Collection
     */
    public function listCombinations() : Collection
    {
        return $this->model->attributes()->map(function (ProductAttribute $productAttribute) {
            return $productAttribute->attributesValues;
        });
    }

    /**
     * @param ProductAttribute $productAttribute
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function findProductCombination(ProductAttribute $productAttribute)
    {
        $values = $productAttribute->attributesValues()->get();

        return $values->map(function (AttributeValue $attributeValue) {
            return $attributeValue;
        })->keyBy(function (AttributeValue $item) {
            return strtolower($item->attribute->name);
        })->transform(function (AttributeValue $value) {
            return $value->value;
        });
    }

    /**
     * @param Brand $brand
     */
    public function saveBrand(Brand $brand)
    {
        $this->model->brand()->associate($brand);
    }

    /**
     * @return Brand
     */
    public function findBrand()
    {
        return $this->model->brand;
    }
	/**
	 * Upload the image
	 *
	 * @param $image
	 * @param string $folder
	 * @return false|string
	 */
	public function uploadOneImage(UploadedFile $image, $folder = 'products')
	{
		return $this->uploadOne($image, $folder);
	}

	/**
	 * @param array $thumbnails
	 * @param Product $product
	 */
	private function saveThumbnails(array $thumbnails, Product $product)
	{
		collect($thumbnails)->each(function ($filename) use ($product) {
			DB::table('product_images')->insert([
				'product_id' => $product->id,
				'src' => $filename
			]);
		});
	}

}
