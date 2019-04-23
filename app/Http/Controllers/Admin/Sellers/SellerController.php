<?php

namespace App\Http\Controllers\Admin\Sellers;

use App\Shop\Categories\Category;
use App\Shop\Categories\Repositories\Interfaces\CategoryRepositoryInterface;
use App\Shop\Sellers\Seller;
use App\Shop\Sellers\Repositories\Interfaces\SellerRepositoryInterface;
use App\Shop\Sellers\Repositories\SellerRepository;
use App\Shop\Sellers\Requests\CreateSellerRequest;
use App\Shop\Sellers\Requests\UpdateSellerRequest;
use App\Http\Controllers\Controller;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use DB;

class SellerController extends Controller
{
    /**
     * @var SellerRepositoryInterface
     */
    private $sellerRepo;
    private $categoryRepo;


    public function __construct(
        SellerRepositoryInterface $sellerRepository,
        CategoryRepositoryInterface $categoryRepository
    )
    {
        $this->sellerRepo = $sellerRepository;
        $this->categoryRepo = $categoryRepository;

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $searchq = request()->input('q');
//        $sellers = $this->sellerRepo->listSellers('id');
//        $sellers = Seller::paginate(10);
	    $sellers = Seller::orderBy('name', 'asc')->paginate(25);

        $categories = $this->categoryRepo->listCategories('id');


//        if (request()->has('q')) {
        if (request()->has('q') && request()->input('q') != '') {
//            $sellers = $this->sellerRepo->searchSeller(request()->input('q'));
            $sellers = Seller::where('name', 'LIKE', "%{$searchq}%")->get();
        }

        $pagenateResults = DB::table('sellers')->paginate(25);

        return view('admin.sellers.list', [
            'sellers' => $sellers,
            'pagenateResults' =>$pagenateResults,
            'categories' => $categories
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.sellers.create', [
            'categories' => $this->categoryRepo->listCategories('name', 'asc')->where('status', 1),
        ]);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateSellerRequest $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateSellerRequest $request)
    {
        $seller = new Seller();

        $seller->name = $request->name;
        $seller->phone_no = $request->phone_no;
        $seller->sex = $request->sex;

        $category_name = $request->category_name;
        if ($category_name != "") {
            $category_name = implode('; ', $category_name);

        }

        $seller->category_name = $category_name;
        $seller->save();

        $request->session()->flash('message', 'Create successful');
        return redirect()->route('admin.sellers.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        $seller = $this->sellerRepo->findSellerById($id);

        return view('admin.sellers.show', [
            'seller' => $seller
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit(int $id)
    {
        $categories = $this->categoryRepo->listCategories('id');
        $seller = $this->sellerRepo->findSellerById($id);
        return view('admin.sellers.edit', [
            'seller' => $seller,
            'categories' => $categories
        ]);
    }


    public function update(UpdateSellerRequest $request, $id)
    {
        $seller = Seller::find($id);
        $seller->name = $request->name;
        $seller->phone_no = $request->phone_no;
        $seller->sex = $request->sex;

//            $seller->assetType_id = $request->assetType_id;

        $category_name = $request->category_name;
        if ($category_name != "") {
            $category_name = implode('; ', $category_name);

        }
        $seller->category_name = $category_name;

        $seller->save();


        $request->session()->flash('message', 'Update successful');
        return redirect()->route('admin.sellers.index');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
//        $seller = $this->sellerRepo->findSellerById($id);
        Seller::find($id)->delete();
        request()->session()->flash('message', 'Delete successful');
        return redirect()->back();
    }

}

