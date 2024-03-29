<?php

namespace App\Shop\Customers\Requests;

use App\Shop\Base\BaseFormRequest;

class CreateCustomerRequest extends BaseFormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */

    public function rules()
    {
        return [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:customers',
            'password' => 'required|string|min:6|confirmed',
        ];
    }
//    public function rules()
//    {
//        return [
//            'name' => ['required'],
//            'email' => ['required', 'email', 'unique:customers'],
//            'password' => ['required', 'min:8']
//        ];
//    }
}
