<?php

namespace App\Shop\Warehouse;
use App\Shop\Categories\Category;
use App\Shop\Products\Product;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Stock.
 *
 * @package Laracommerce\Core\Warehouse
 */
class Stock extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'stocks';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'product_id', 'product_attribute_id', 'warehouse_id', 'quantity', 'price',
    ];
}
