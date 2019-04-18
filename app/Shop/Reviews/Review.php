<?php

namespace App\Shop\Reviews;

use App\Shop\Products\Product;
use App\Shop\Customers\Customer;
use App\Shop\Categories\Category;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $customer_id
 * @property int $product_id
 * @property int $category_id
 * @property float $star
 * @property string $comment
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 * @property Customer $customer
 * @property Product $product
 * @property Category $category
 */
class Review extends Model
{
    /**
     * @var array
     */
    protected $fillable = ['customer_id', 'product_id', 'category_id', 'star', 'comment', 'status', 'created_at', 'updated_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function customer()
    {
        return $this->belongsTo('App\Shop\Customers\Customer');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo('App\Shop\Products\Product');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function category()
    {
        return $this->belongsTo('App\Shop\Categories\Category');
    }


    public function getProductNameAttribute()
    {
        return $this->product->name;
    }

    public function getCustomerNameAttribute()
    {
        return $this->user->name;
    }
}
