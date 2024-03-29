<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;


class Category extends Model
{

    protected $table = "categories";

    protected $fillable = ["id", "parent", "name","count"];

    public function children()
    {
        return $this->hasMany(self::class, 'parent', 'id')->whereNull('deleted_at')->select('id','name','parent','count');
    }
}
