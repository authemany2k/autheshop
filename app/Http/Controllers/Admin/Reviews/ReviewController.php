<?php

namespace App\Http\Controllers\Admin\Reviews;

use App\Shop\Customers\Customer;
use App\Shop\Products\Product;
use App\Http\Controllers\Controller;
use App\Shop\Customers\Repositories\CustomerRepository;
use App\Shop\Customers\Repositories\Interfaces\CustomerRepositoryInterface;
use Illuminate\Support\Facades\Auth;
use App\Shop\Reviews\Review;
use App\Http\Requests\ReviewRequest;
use Carbon\Carbon;
use Session;
use DB;


class ReviewController extends Controller
{
    /**
     * BizcentersController constructor.
     */
    public function __construct(CustomerRepositoryInterface $customerRepository)
    {
        $this->customerRepo = $customerRepository;
        $this->middleware('auth');
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $searchq = request()->input('q');
        $customers = Customer::all();
        $products = Product::all();
//	    $reviews = Review::all()->sortByDesc("created_at");
	    $reviews = Review::orderBy('created_at', 'desc')->paginate(25);
//        $reviews = Review::paginate(10);
        if (request()->has('q') && request()->input('q') != '') {
//            $sellers = $this->sellerRepo->searchSeller(request()->input('q'));
            $reviews = Review::where('comment', 'LIKE', "%{$searchq}%")->get();
        }

        $pagenateResults = DB::table('reviews')->paginate(25);
        return view('admin/reviews/list', compact( 'customers', 'products','reviews', 'pagenateResults'));
    }


    public function store(ReviewRequest $request)
    {

        if (!Auth::check()) {

            $customer = Customer::where('email', '=', $request->get('email'))->get()->first();

            if (null === $customer) {

                $requestData = $request->all();

                $password = bcrypt(str_random($length = 6));

                $requestData['password'] = $password;
                $requestData['status'] = 'GUEST';

//                dd($requestData->all());
                $customer = Customer::create($requestData);

            }
        } else {
            $customer = \Auth::user();
        }

        $request->merge(['customer_id' => $customer->id]);
        Review::create($request->all());

        Session::flash('notificationText', 'Review Added SucessFully!');
        return redirect()->back()->with('notificationText', 'Review Added SucessFully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $customers = Customer::all();
        $review = Review::findOrFail($id);
        return view('admin/reviews/edit', compact( 'customers',  'review'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(ReviewRequest $request, $id)
    {
        $review = Review::findOrFail($id);
        $review->star = $request->star;
        $review->comment = $request->comment;
        $review->update();
        Session::flash('notificationText', 'Review updated SucessFully!');
        return redirect('admin/reviews')->with('success', 'Review Item updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */


    public function destroy($id)
    {
        $request_delete = Review::where('status','=', 1)
            ->where('id', $id)
            ->first();
        $request_delete->status = 0;
        $request_delete->update();

        Session::flash('notificationText', 'Review deleted SucessFully!');
        return redirect('admin/reviews')->with('success', 'Review Item deleted successfully');
    }

}
