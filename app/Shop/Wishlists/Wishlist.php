<?php

namespace App\Shop\Wishlists;
use App\Shop\Products\Product;
use App\Shop\Customers\Customer;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $customer_id
 * @property int $product_id
 * @property string $created_at
 * @property string $updated_at
 * @property Customer $customer
 * @property Product $product
 */
class Wishlist extends Model
{
    /**
     * @var array
     */
    protected $fillable = ['customer_id', 'product_id', 'created_at', 'updated_at'];

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
}
