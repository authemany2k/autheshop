<?php

namespace App\Shop\Warehouse;
use App\Shop\Categories\Category;
use App\Shop\Products\Product;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Warehouse.
 *
 * @package Laracommerce\Core\Warehouse
 */
class Warehouse extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'warehouses';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name'
    ];

    /**
     * Default name of a warehouse.
     */
    const DEFAULT_NAME = 'default';
}
