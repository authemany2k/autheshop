<?php

namespace App\Shop\Warehouse\Repositories;

use App\Shop\Base\BaseRepository;
use App\Shop\ProductAttributes\ProductAttribute;
use App\Shop\Products\Product;
use App\Shop\Warehouse\Repositories\Interfaces\WarehouseRepositoryInterface;
use App\Shop\Warehouse\Stock;
use App\Shop\Warehouse\Warehouse;
use Illuminate\Support\Collection;

/**
 * Class WarehouseRepository.
 *
 * @package Laracommerce\Core\Warehouse\Repositories
 */
class WarehouseRepository extends BaseRepository implements WarehouseRepositoryInterface
{
    /**
     * WarehouseRepository constructor.
     * @param Warehouse $warehouse
     */
    public function __construct(Warehouse $warehouse)
    {
        parent::__construct($warehouse);
        $this->model = $warehouse;
    }

    /**
     * List all the warehouses.
     *
     * @param string $order
     * @param string $sort
     * @param array $columns
     * @return Collection
     */
    public function listWarehouses(string $order = 'id', string $sort = 'desc', array $columns = ['*']) : Collection
    {
        return $this->all($columns, $order, $sort);
    }

    /**
     * Save a stock level of a product with given product attributes.
     *
     * @param Warehouse $warehouse
     * @param Product $product
     * @param ProductAttribute $productAttribute
     *
     * @return Stock
     */
    public function saveStock(Warehouse $warehouse, Product $product, ProductAttribute $productAttribute = null) : Stock
    {
        $quantity = (null === $productAttribute) ? $product->quantity : $productAttribute->quantity ;
        $price = (null === $productAttribute) ? $product->price : $productAttribute->price ;

        $stock = Stock::firstOrNew([
            'product_id' => $product->id,
            'product_attribute_id' => optional($productAttribute)->id,
            'warehouse_id' => $warehouse->id,
        ]);
        $stock->quantity = $quantity;
        $stock->price = $price;
        $stock->save();

        return $stock;
    }

    /**
     * Get a warehouse.
     *
     * @param string $name
     *
     * @return Warehouse|null
     */
    public function getWarehouseByName(string $name)
    {
        $warehouse = $this->model->where('name', '=', $name)->first();

        if (Warehouse::DEFAULT_NAME === $name && null === $warehouse) {
            $warehouse = $this->createWarehouse(Warehouse::DEFAULT_NAME);
        }

        return $warehouse;
    }

    /**
     * Create new warehouse.
     *
     * @param string $name
     *
     * @return mixed
     */
    public function createWarehouse(string $name)
    {
        return Warehouse::create([
            'name' => $name,
        ]);
    }
}
