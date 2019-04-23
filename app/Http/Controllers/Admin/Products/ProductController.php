<?php

namespace App\Http\Controllers\Admin\Products;

use App\Shop\Attributes\Repositories\AttributeRepositoryInterface;
use App\Shop\AttributeValues\Repositories\AttributeValueRepositoryInterface;
use App\Shop\Brands\Repositories\BrandRepositoryInterface;
use App\Shop\Categories\Repositories\Interfaces\CategoryRepositoryInterface;
use App\Shop\ProductAttributes\ProductAttribute;
use App\Shop\Products\Exceptions\ProductInvalidArgumentException;
use App\Shop\Products\Exceptions\ProductNotFoundException;
use App\Shop\Products\Product;
use App\Shop\Products\Repositories\Interfaces\ProductRepositoryInterface;
use App\Shop\Products\Repositories\ProductRepository;
use App\Shop\Products\Requests\CreateProductRequest;
use App\Shop\Products\Requests\UpdateProductRequest;
use App\Http\Controllers\Controller;
use App\Shop\Products\Transformations\ProductTransformable;
use App\Shop\Tools\UploadableTrait;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Database\QueryException;
use App\Shop\Products\Requests\CreateAttributeCombination;
use App\Shop\Sellers\Repositories\Interfaces\SellerRepositoryInterface;
use App\Shop\Sellers\Repositories\SellerRepository;
use App\Shop\Sellers\Seller;
use DateTime;
use DateTimeZone;

use Intervention\Image\Facades\Image;

class ProductController extends Controller
{
    use ProductTransformable, UploadableTrait;

    /**
     * @var ProductRepositoryInterface
     */
    private $productRepo;

    /**
     * @var CategoryRepositoryInterface
     */
    private $categoryRepo;

    /**
     * @var AttributeRepositoryInterface
     */
    private $attributeRepo;

    /**
     * @var AttributeValueRepositoryInterface
     */
    private $attributeValueRepository;

    /**
     * @var ProductAttribute
     */
    private $productAttribute;

    /**
     * @var BrandRepositoryInterface
     */
    private $brandRepo;

	private $sellerRepo;

	/**
	 * ProductController constructor.
	 *
	 * @param ProductRepositoryInterface $productRepository
	 * @param CategoryRepositoryInterface $categoryRepository
	 * @param AttributeRepositoryInterface $attributeRepository
	 * @param AttributeValueRepositoryInterface $attributeValueRepository
	 * @param ProductAttribute $productAttribute
	 * @param BrandRepositoryInterface $brandRepository
	 */
	public function __construct(
		ProductRepositoryInterface $productRepository,
		CategoryRepositoryInterface $categoryRepository,
		AttributeRepositoryInterface $attributeRepository,
		AttributeValueRepositoryInterface $attributeValueRepository,
		ProductAttribute $productAttribute,
		SellerRepositoryInterface $sellerRepository,
		BrandRepositoryInterface $brandRepository
	){
		$this->productRepo = $productRepository;
		$this->categoryRepo = $categoryRepository;
		$this->attributeRepo = $attributeRepository;
		$this->attributeValueRepository = $attributeValueRepository;
		$this->productAttribute = $productAttribute;
		$this->sellerRepo =$sellerRepository;
		$this->brandRepo = $brandRepository;
	}

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $list = $this->productRepo->listProducts('id');

        if (request()->has('q') && request()->input('q') != '') {
            $list = $this->productRepo->searchProduct(request()->input('q'));
        }

		$sellers = new SellerRepository(new Seller());
		$products = $list->map(function (Product $item) use ($sellers) {
			$item->sellers = $sellers->findSellerById($item->seller_id);
			return $this->transformProduct($item);
		})->all();

		return view('admin.products.list', [
			'products' => $this->productRepo->paginateArrayResults($products, 25),
			'sellers' => $sellers
		]);
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		$categories = $this->categoryRepo->listCategories('name', 'asc')->where('parent_id', 1, 0);

		return view('admin.products.create', [
			'categories' => $categories,
			'brands' => $this->brandRepo->listBrands(['*'], 'name', 'asc'),
			'default_weight' => env('SHOP_WEIGHT'),
			'weight_units' => Product::MASS_UNIT,
			'product' => new Product,
			'selectedIds' => [],
			'sellers' => $this->sellerRepo->listSellers('id')
		]);
	}

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateProductRequest $request
     *
     * @return \Illuminate\Http\Response
     */
    public function store(CreateProductRequest $request)
    {
        $data = $request->except('_token', '_method');
        $data['slug'] = str_slug($request->input('name'));

		$date = new DateTime('now', new DateTimeZone(config('app.timezone')));
		$folder = $date->format('U');

		if ($request->hasFile('cover')) {
			$data['cover'] = $this->uploadOne(request()->file('cover'), "products/$folder", 'uploads', 'cover');



            // $data['cover'] = Image::make($this->uploadOne(request()->file('cover'), "products/$folder", 'uploads', 'cover'))->resize(320, 300);

             //      Image::make($path)->encode('png')->fit(40, 40, function($c) {
             //                $c->upsize();
             //            })->save();


		}

//        $product = $this->productRepo->createProduct($data);
//
//        $productRepo = new ProductRepository($product);

		if ($request->hasFile('image')) {
			$thumbs = collect($request->file('image'))->transform(function (UploadedFile $file) use ($folder) {
				return $this->uploadOne($file, "products/$folder");
			})->all();
  // dd($data['thumbnails']);
			$data['thumbnails'] = $thumbs;
		}

		$product = $this->productRepo->createProduct($data);

		if ($request->has('categories')) {
			$product->categories()->sync($request->input('categories'));
		} else {
			$product->categories()->detach();
		}

		return redirect()->route('admin.products.index')->with('message', 'Create successful');
	}

    /**
     * Display the specified resource.
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        $product = $this->productRepo->findProductById($id);
        return view('admin.products.show', compact('product'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function edit(int $id)
    {
        $product = $this->productRepo->findProductById($id);
        $productAttributes = $product->attributes()->get();

        $qty = $productAttributes->map(function ($item) {
            return $item->quantity;
        })->sum();

        if (request()->has('delete') && request()->has('pa')) {
            $pa = $productAttributes->where('id', request()->input('pa'))->first();
            $pa->attributesValues()->detach();
            $pa->delete();

            request()->session()->flash('message', 'Delete successful');
            return redirect()->route('admin.products.edit', [$product->id, 'combination' => 1]);
        }

		$categories = $this->categoryRepo->listCategories('name', 'asc')
		                                 ->where('parent_id', 1, 0);
		$sellers = $this->sellerRepo->listSellers('id');

        return view('admin.products.edit', [
            'product' => $product,
            'images' => $product->images()->get(['src']),
            'categories' => $categories,
            'selectedIds' => $product->categories()->pluck('category_id')->all(),
            'attributes' => $this->attributeRepo->listAttributes(),
            'productAttributes' => $productAttributes,
            'qty' => $qty,
            'brands' => $this->brandRepo->listBrands(['*'], 'name', 'asc'),
            'weight' => $product->weight,
            'default_weight' => $product->mass_unit,
            'weight_units' => Product::MASS_UNIT,
            'sellers' => $sellers,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateProductRequest $request
     * @param  int $id
     *
     * @return \Illuminate\Http\Response
     * @throws \App\Shop\Products\Exceptions\ProductUpdateErrorException
     */
    public function update(UpdateProductRequest $request, int $id)
    {
        $product = $this->productRepo->findProductById($id);
//        $productRepo = new ProductRepository($product);

        if ($request->has('attributeValue')) {
            $this->saveProductCombinations($request, $product);
            return redirect()->route('admin.products.edit', [$id, 'combination' => 1])
                ->with('message', 'Attribute combination created successful');
        }

        $data = $request->except(
            'categories',
            '_token',
            '_method',
            'default',
            'image',
            'productAttributeQuantity',
            'productAttributePrice',
            'attributeValue',
            'combination'
        );

        $data['slug'] = str_slug($request->input('name'));

		$date = new DateTime('now', new DateTimeZone(config('app.timezone')));
		$folder = $date->format('U');
		if ($request->hasFile('cover')) {
			$data['cover'] = $this->uploadOne(request()->file('cover'), "products/$folder", 'uploads', 'cover');
		}

		if ($request->hasFile('image')) {
			$thumbs = collect($request->file('image'))->transform(function (UploadedFile $file) use ($folder) {
				return $this->uploadOne($file, "products/$folder");
			})->all();

			$data['thumbnails'] = $thumbs;
		}
		$this->productRepo->updateProduct($data, $product->id);

		if ($request->has('categories')) {
			$product->categories()->sync($request->input('categories'));
		} else {
			$product->categories()->detach();
		}

//        $productRepo->updateProduct($data);

        return redirect()->route('admin.products.index')
            ->with('message', 'Update successful');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy($id)
    {
        $product = $this->productRepo->findProductById($id);
        $product->categories()->sync([]);
        $productAttr = $product->attributes();

        $productAttr->each(function ($pa) {
            DB::table('attribute_value_product_attribute')->where('product_attribute_id', $pa->id)->delete();
        });

        $productAttr->where('product_id', $product->id)->delete();

        $productRepo = new ProductRepository($product);
        $productRepo->removeProduct();
//	    $this->productRepo->delete($id);
        return redirect()->route('admin.products.index')->with('message', 'Delete successful');
    }

    /**
     * @param Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function removeImage(Request $request)
    {
        $this->productRepo->deleteFile($request->only('product', 'image'), 'uploads');
        return redirect()->back()->with('message', 'Image delete successful');
    }

    /**
     * @param Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function removeThumbnail(Request $request)
    {
        $this->productRepo->deleteThumb($request->input('src'));
        return redirect()->back()->with('message', 'Image delete successful');
    }

    /**
     * @param Request $request
     * @param Product $product
     * @return boolean
     */
    private function saveProductCombinations(Request $request, Product $product): bool
    {
        $fields = $request->only(
            'productAttributeQuantity',
            'productAttributePrice',
            'sale_price',
            'default'
        );

        if ($errors = $this->validateFields($fields)) {
            return redirect()->route('admin.products.edit', [$product->id, 'combination' => 1])
                ->withErrors($errors);
        }

        $quantity = $fields['productAttributeQuantity'];
        $price = $fields['productAttributePrice'];

        $sale_price = null;
        if (isset($fields['sale_price'])) {
            $sale_price = $fields['sale_price'];
        }

        $attributeValues = $request->input('attributeValue');
        $productRepo = new ProductRepository($product);

        $hasDefault = $productRepo->listProductAttributes()->where('default', 1)->count();

        $default = 0;
        if ($request->has('default')) {
            $default = $fields['default'];
        }

        if ($default == 1 && $hasDefault > 0) {
            $default = 0;
        }

        $productAttribute = $productRepo->saveProductAttributes(
            new ProductAttribute(compact('quantity', 'price', 'sale_price', 'default'))
        );

        // save the combinations
        return collect($attributeValues)->each(function ($attributeValueId) use ($productRepo, $productAttribute) {
            $attribute = $this->attributeValueRepository->find($attributeValueId);
            return $productRepo->saveCombination($productAttribute, $attribute);
        })->count();
    }

    /**
     * @param array $data
     *
     * @return
     */
    private function validateFields(array $data)
    {
        $validator = Validator::make($data, [
            'productAttributeQuantity' => 'required'
        ]);

        if ($validator->fails()) {
            return $validator;
        }
    }
	/**
	 * @param Request $request
	 * @param Product $product
	 */
	private function saveProductImages(Request $request, Product $product)
	{
		if ($request->hasFile('image')) {
			$this->productRepo->saveProductImages(collect($request->file('image')), $product);
		}
	}

}
