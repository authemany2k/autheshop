<?php

namespace App\Shop\Sellers;
use App\Shop\Categories\Category;
use App\Shop\Products\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Sofa\Eloquence\Eloquence;

/**
 * @property int $category_id
 * @property int $id
 * @property string $name
 * @property string $phone_no
 * @property boolean $sex
 * @property string $created_at
 * @property string $updated_at
 * @property Category $category
 * @property Product[] $products
 */
class Seller extends Model
{
    use Eloquence;

//    use SoftDeletes, Eloquence;

    /**
     * @var array
     */
    protected $fillable = ['category_id',  'name', 'phone_no', 'sex'];

    protected $dates = ['deleted_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function category()
    {
        return $this->belongsTo('App\Shop\Categories\Category');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function products()
    {
        return $this->hasMany('App\Shop\Products\Product');
    }

}
