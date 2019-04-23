<?php

namespace App\Shop\Sellers\Repositories;

use App\Shop\Base\BaseRepository;
use App\Shop\Sellers\Seller;
use App\Shop\Sellers\Exceptions\SellerNotFoundException;
use App\Shop\Sellers\Repositories\Interfaces\SellerRepositoryInterface;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Collection;
use DB;

class SellerRepository extends BaseRepository implements SellerRepositoryInterface
{
    public function __construct(Seller $seller)
    {
        $this->model = $seller;
    }
    /**
     * List all the employees
     *
     * @param string $order
     * @param string $sort
     * @return array
     */
    public function listSellers(string $order = 'id', string $sort = 'desc') : array
    {
        $list = $this->model->orderBy($order, $sort)->get();
        return collect($list)->all();
    }
    /**
     * Create the employee
     *
     * @param array $params
     * @return Seller
     */
    public function createSeller(array $params) : Seller
    {
        $collection = collect($params);
        $seller = new Seller($collection->all());
        $seller->save();

        return $seller;
    }
    /**
     * Find the employee by id
     *
     * @param int $id
     * @return Seller
     */
    public function findSellerById(int $id) : Seller
    {
        try {
            return $this->findOneOrFail($id);
        } catch (ModelNotFoundException $e) {
            throw new SellerNotFoundException;
        }
    }
    /**
     * Update employee
     *
     * @param array $params
     * @return bool
     */
    public function updateSeller(array $params) : bool
    {
        $fields = [
            "name" => $params['name'],
            "phone_no" => $params['phone_no'],
            "sex" => $params['sex'],

        ];

        return $this->model->update($fields);
    }


    public function searchSeller(string $text) : Collection
    {
        return $this->model->search($text)->get();
    }
}