<?php

namespace App\Http\Requests;

use Illuminate\Support\Facades\Auth;
use App\Shop\Customers\Customer;
use Illuminate\Foundation\Http\FormRequest as Request;

class ReviewRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        if (!Auth::check()) {
            $validateArray['name'] = 'required|max:255';
            $validateArray['email'] = 'required|max:255|email';
        }

        $validateArray['star'] = 'required|max:255';
//        $validateArray['comment'] = 'required';

        return $validateArray;
    }
}
