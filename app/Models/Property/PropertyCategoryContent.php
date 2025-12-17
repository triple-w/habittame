<?php

namespace App\Models\Property;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropertyCategoryContent extends Model
{
    use HasFactory;
    protected $guarded = [];

    protected function slug(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => createSlug($value),

        );
    }
}
