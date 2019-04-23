<?php

namespace App\Shop\Warehouse\Repositories\Interfaces;

use App\Shop\Base\Interfaces\BaseRepositoryInterface;
use Illuminate\Support\Collection;
use App\Shop\ProductAttributes\ProductAttribute;
use App\Shop\Products\Product;
use App\Shop\Warehouse\Stock;
use App\Shop\Warehouse\Warehouse;

/**
 * Interface WarehouseRepositoryInterface
 * @package Laracommerce\Core\Warehouse\Repositories\Interfaces
 */
interface WarehouseRepositoryInterface extends BaseRepositoryInterface
{
    /**
     * List all the warehouses.
     *
     * @param string $order
     * @param string $sort
     * @param array $columns
     * @return Collection
     */
    public function listWarehouses(string $order = 'id', string $sort = 'desc', array $columns = ['*']) : Collection;

    /**
     * Save a stock level of a product with given product attributes.
     *
     * @param Warehouse $warehouse
     * @param Product $product
     * @param ProductAttribute $productAttribute
     *
     * @return Stock
     */
    public function saveStock(Warehouse $warehouse, Product $product, ProductAttribute $productAttribute = null) : Stock;

    /**
     * Get a warehouse.
     *
     * @param string $name
     *
     * @return Warehouse|null
     */
    public function getWarehouseByName(string $name);
}
