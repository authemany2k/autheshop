<?php

namespace App\Shop\Sellers\Repositories\Interfaces;

use App\Shop\Base\Interfaces\BaseRepositoryInterface;
use App\Shop\Sellers\Seller;
use Illuminate\Support\Collection;

interface SellerRepositoryInterface extends BaseRepositoryInterface
{
    public function listSellers(string $order = 'id', string $sort = 'desc') : array;

    public function createSeller(array $params) : Seller;

    public function findSellerById(int $id) : Seller;

    public function updateSeller(array $params) : bool;

    public function searchSeller(string $text) : Collection;

}