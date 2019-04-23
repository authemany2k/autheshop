<?php

namespace App\Shop\Base;

use App\Shop\Base\Interfaces\BaseRepositoryInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Input;
use League\Fractal\Manager;
use League\Fractal\Pagination\IlluminatePaginatorAdapter;
use League\Fractal\Scope;
use League\Fractal\TransformerAbstract;
use League\Fractal\Resource\Collection as FractalCollection;
use League\Fractal\Resource\Item as FractalItem;

abstract class BaseRepository implements BaseRepositoryInterface
{
    protected $model;

    /**
     * BaseRepository constructor.
     * @param Model $model
     */
    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    /**
     * @param array $attributes
     * @return mixed
     */
    public function create(array $attributes)
    {
        return $this->model->create($attributes);
    }

    /**
     * @param array $data
     * @return bool
     */
    public function update(array $attributes, int $id) : bool
    {
        return $this->find($id)->update($attributes);
    }

    /**
     * @param array $columns
     * @param string $orderBy
     * @param string $sortBy
     * @return mixed
     */
    public function all($columns = array('*'), string $orderBy = 'id', string $sortBy = 'asc')
    {
        return $this->model->orderBy($orderBy, $sortBy)->get($columns);
    }

    /**
     * @param int $id
     * @return mixed
     */
    public function find(int $id)
    {
        return $this->model->find($id);
    }

    /**
     * @param int $id
     * @return mixed
     * @throws ModelNotFoundException
     */
    public function findOneOrFail(int $id)
    {
        return $this->model->findOrFail($id);
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function findBy(array $data)
    {
        return $this->model->where($data)->all();
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function findOneBy(array $data)
    {
        return $this->model->where($data)->first();
    }

    /**
     * @param array $data
     * @return mixed
     * @throws ModelNotFoundException
     */
    public function findOneByOrFail(array $data)
    {
        return $this->model->where($data)->firstOrFail();
    }

	/**
	 * @param int $id
	 * @return bool
	 */
	public function delete(int $id) : bool
	{
		return $this->model->find($id)->delete();
	}
    /**
     * @param array $data
     * @param int $perPage
     * @return LengthAwarePaginator
     */
    public function paginateArrayResults(array $data, int $perPage = 50)
    {
        $page = request()->get('page', 1);
        $offset = ($page * $perPage) - $perPage;

        return new LengthAwarePaginator(
            array_slice($data, $offset, $perPage, false),
            count($data),
            $perPage,
            $page,
            [
                'path' => request()->url(),
                'query' => request()->query()
            ]
        );
    }

    /**
     * @param int $id
     * @return bool
     */
    public function processItemTransformer(
        Model $model,
        TransformerAbstract $transformer,
        string $resourceKey,
        string $includes = null
    ) : Scope {
        $manager = new ItemAndCollectionManager(new Manager);
        $item = new FractalItem($model, $transformer, $resourceKey);

        $included = explode(',', $includes);
        return $manager->createItemData(
            $item,
            $included
        );
    }

    /**
     * @param Collection $collection
     * @param TransformerAbstract $transformer
     * @param string $resourceKey
     * @param string $includes
     * @param int $perPage
     * @return Scope
     */
    public function processCollectionTransformer(
        Collection $collection,
        TransformerAbstract $transformer,
        string $resourceKey,
        string $includes = null,
        $perPage = 25
    ) : Scope {
        $manager = new ItemAndCollectionManager(new Manager);

        $page = app('request')->input('page', 1);
        $fractalCollection = new FractalCollection($collection->forPage($page, $perPage), $transformer, $resourceKey);

        $paginator = $this->paginateArrayResults($collection->all(), $perPage);
        $queryParams = array_diff_key($_GET, array_flip(['page']));
        $paginator->appends($queryParams);
        $fractalCollection->setPaginator(new IlluminatePaginatorAdapter($paginator));

        if (!is_null($includes)) {
            $included = explode(',', $includes);
            return $manager->createCollectionData(
                $fractalCollection,
                $included
            );
        } else {
            return $manager->createCollectionData(
                $fractalCollection
            );
        }
    }
}