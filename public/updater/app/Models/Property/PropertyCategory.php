<?php

namespace App\Models\Property;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropertyCategory extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function categoryContents()
    {
        return $this->hasMany(PropertyCategoryContent::class, 'category_id', 'id');
    }

    public function categoryContent()
    {
        return $this->hasOne(PropertyCategoryContent::class, 'category_id', 'id');
    }

    public function properties()
    {
        return $this->hasMany(Property::class, 'category_id', 'id');
    }
}
