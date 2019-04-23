<?php

namespace App\Http\Requests;

use Illuminate\Support\Facades\Auth;
use App\Shop\Customers\Customer;
use Illuminate\Foundation\Http\FormRequest as Request;

class SellerRequest extends Request
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
        return [
            'name' => ['required']
        ];
    }

    public function messages()
    {
        return [

//            'password.confirmed' => 'The passwords do not match.'
        ];
    }
}
