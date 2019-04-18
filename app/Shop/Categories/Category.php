<?php

namespace App\Shop\Categories;

use App\Shop\Products\Product;
use App\Shop\Sellers\Seller;
use App\Shop\Reviews\Review;
use Illuminate\Database\Eloquent\Model;
use Sofa\Eloquence\Eloquence;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use SoftDeletes, Eloquence;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'slug',
        'description',
        'cover',
        'status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    public function products()
    {
        return $this->belongsToMany(Product::class);
    }

    public function parent()
    {
        return $this->belongsTo(static::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(static::class, 'parent_id');
    }

    public function sellers()
    {
        return $this->hasMany(Seller::class);
    }

    public function reviews()
    {
        return $this->belongsToMany(Review::class);
    }
}