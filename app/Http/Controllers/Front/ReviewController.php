<?php

namespace App\Http\Controllers\Front;

use App\Shop\Customers\Customer;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Shop\Reviews\Review;
use App\Http\Requests\ReviewRequest;
use Session;

class ReviewController extends Controller
{
    public function store(ReviewRequest $request)
    {
//        return($request->all());

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
}
