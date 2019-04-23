<?php

//namespace Jsdecena\Baserepo;
namespace App\Shop\Base\Interfaces;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;
use League\Fractal\Scope;
use League\Fractal\TransformerAbstract;

interface BaseRepositoryInterface
{
    public function create(array $attributes);

    public function update(array $attributes, int $id);

    public function all($columns = array('*'), string $orderBy = 'id', string $sortBy = 'desc');

    public function find(int $id);

    public function findOneOrFail(int $id);

    public function findBy(array $data);

    public function findOneBy(array $data);

    public function findOneByOrFail(array $data);

	public function delete(int $id);

    public function paginateArrayResults(array $data, int $perPage = 50);

    public function processItemTransformer(
        Model $model,
        TransformerAbstract $transformer,
        string $resourceKey,
        string $includes = null
    ) : Scope;

    public function processCollectionTransformer(
        Collection $collection,
        TransformerAbstract $transformer,
        string $resourceKey,
        string $includes = null,
        $perPage = 25
    ) : Scope;
}