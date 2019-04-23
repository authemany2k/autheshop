<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Shop\Customers\Requests\SendInquiryRequest;
use App\Mail\Inquiry;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;

/**
 * Admin routes
 */
Route::namespace('Admin')->group(function () {
    Route::get('admin/login', 'LoginController@showLoginForm')->name('admin.login');
    Route::post('admin/login', 'LoginController@login')->name('admin.login');
    Route::get('admin/logout', 'LoginController@logout')->name('admin.logout');
});
Route::group(['prefix' => 'admin', 'middleware' => ['admin','auth:admin','role:superadmin'], 'as' => 'admin.' ], function () {

    Route::namespace('Admin')->group(function () {
        Route::namespace('Customers')->group(function () {
            Route::resource('customers', 'CustomerController');
            Route::resource('customers.addresses', 'CustomerAddressController');
        });
        Route::namespace('Orders')->group(function () {
            Route::resource('orders', 'OrderController');
            Route::resource('order-statuses', 'OrderStatusController');
            Route::get('orders/{id}/invoice', 'OrderController@generateInvoice')->name('orders.invoice.generate');
        });
        //    Reviews
        Route::namespace('Reviews')->group(function () {
            Route::resource('reviews', 'ReviewController', [
                'only' => ['index', 'update','edit','destroy']
            ]);
        });
        Route::resource('employees', 'EmployeeController');
        Route::get('employees/{id}/profile', 'EmployeeController@getProfile')->name('employee.profile');
        Route::put('employees/{id}/profile', 'EmployeeController@updateProfile')->name('employee.profile.update');
        Route::resource('addresses', 'Addresses\AddressController');
        Route::resource('countries', 'Countries\CountryController');
        Route::resource('countries.provinces', 'Provinces\ProvinceController');
        Route::resource('countries.provinces.cities', 'Cities\CityController');
        Route::resource('couriers', 'Couriers\CourierController');
        Route::resource('payment-methods', 'PaymentMethods\PaymentMethodController');
        Route::resource('attributes', 'Attributes\AttributeController');
        Route::resource('attributes.values', 'Attributes\AttributeValueController');
        Route::resource('brands', 'Brands\BrandController');
        Route::resource('sellers', 'Sellers\SellerController');
    });
//      role and permission route
//      roles
    Route::resource('roles', 'RoleController');
//      permissions
    Route::resource('permissions', 'PermissionController');
//      settings
    Route::get('settings', ['as' => 'settings.index', 'uses' => 'SettingsController@show']);
    Route::patch('settings/update', ['as' => 'settings.update', 'uses' => 'SettingsController@update']);
});

Route::group(['prefix' => 'admin', 'middleware' => ['admin','auth:admin'], 'as' => 'admin.' ], function () {

    Route::namespace('Admin')->group(function () {
        Route::get('/', 'DashboardController@index')->name('dashboard');
        Route::namespace('Products')->group(function () {
            Route::resource('products', 'ProductController');
            Route::get('remove-image-product', 'ProductController@removeImage')->name('product.remove.image');
            Route::get('remove-image-thumb', 'ProductController@removeThumbnail')->name('product.remove.thumb');
        });
        Route::namespace('Categories')->group(function () {
            Route::resource('categories', 'CategoryController');
            Route::get('remove-image-category', 'CategoryController@removeImage')->name('category.remove.image');
        });
    });
});
Route::post('/pay', 'PaymentController@redirectToGateway')->name('pay');
Route::get('payment/callback', 'PaymentController@handleGatewayCallback');

/**
 * Frontend routes
 */
Auth::routes();
Route::namespace('Auth')->group(function () {
    Route::get('cart/login', 'CartLoginController@showLoginForm')->name('cart.login');
    Route::post('cart/login', 'CartLoginController@login')->name('cart.login');
    Route::get('logout', 'LoginController@logout');
});

Route::namespace('Front')->group(function () {
    Route::get('/', 'HomeController@index')->name('home');
    Route::group(['middleware' => ['auth']], function () {
        Route::get('accounts', 'AccountsController@index')->name('accounts');
    });
    Route::resource('cart', 'CartController');
    Route::get('clearCart', 'CartController@clearCart');
    Route::resource('customer', 'CustomerController');
    Route::resource('customer.address', 'CustomerAddressController');
    Route::get('checkout', 'CheckoutController@index')->name('checkout.index');
    Route::post('checkout', 'CheckoutController@store')->name('checkout.store');
    Route::get('checkout/execute', 'CheckoutController@execute')->name('checkout.execute');
    Route::get('checkout/cancel', 'CheckoutController@cancel')->name('checkout.cancel');
    Route::get('checkout/success', 'CheckoutController@success')->name('checkout.success');
    Route::get("category/{slug}", 'CategoryController@getCategory')->name('front.category.slug');
    Route::get("search", 'ProductController@search')->name('search.product');
    Route::get('/filter_products', 'ProductController@filter');
    Route::get("{product}", 'ProductController@show')->name('front.get.product');

    Route::get('/wishlist/add/{slug}', ['as' => 'wishlist.add', 'uses' => 'WishlistController@add']);
    Route::get('/accounts/wishlist', ['as' => 'wishlist.list', 'uses' => 'WishlistController@mylist']);
    Route::get('/wishlist/remove/{slug}', ['as' => 'wishlist.remove', 'uses' => 'WishlistController@destroy']);

    Route::resource('review', 'ReviewController');
    Route::post('/review', ['as' => 'review.store','uses' => 'ReviewController@store']);
});

Route::post('inquire', function (SendInquiryRequest $request) {
    Mail::to(env('INQUIRY_MAIL'))->send(new Inquiry($request));
    $request->session()->flash('message', 'Your message was successfully delivered! Please wait for us to get back to you. <3');
    return redirect()->route('home');
})->name('inquiry.store');


