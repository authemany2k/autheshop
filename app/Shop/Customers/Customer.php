<?php

namespace App\Shop\Customers;

use App\Shop\Addresses\Address;
use App\Shop\Orders\Order;
use App\Shop\Reviews\Review;
use App\Shop\Wishlists\Wishlist;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Sofa\Eloquence\Eloquence;
use Laratrust\Traits\LaratrustUserTrait;

class Customer extends Authenticatable
{
    use LaratrustUserTrait;
    use Notifiable, SoftDeletes, Eloquence;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'phone_no',
        'status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $dates = ['deleted_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function addresses()
    {
        return $this->hasMany(Address::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function getNameAttribute()
    {
        return $this->attributes['name'];
    }

    public function isInWishlist($productId)
    {
        $wishList = Wishlist::where('customer_id', '=', $this->attributes['id'])
            ->where('product_id', '=', $productId)->get();
        if (count($wishList) <= 0) {
            return false;
        }
        return true;
    }


    public function reviews()
    {
        return $this->hasMany(Review::class);
//        return $this->hasMany('App\Shop\Reviews\Review');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function wishlists()
    {
        return $this->hasMany(Wishlist::class);
//        return $this->hasMany('App\Shop\Wishlists\Wishlist');
    }

}
