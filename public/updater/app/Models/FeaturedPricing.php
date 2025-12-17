<?php

namespace App\Models;

use App\Models\Property\FeaturedProperty;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FeaturedPricing extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function feturedProperties()
    {
        return $this->hasMany(FeaturedProperty::class, 'featured_pricing_id', 'id');
    }
}
