<?php

namespace App\Models;

use App\Models\Project\ProjectAmenities;
use App\Models\Property\PropertyAmenity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Amenity extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function amenityContents()
    {
        return $this->hasMany(AmenityContent::class, 'amenity_id', 'id');
    }

    public function amenityContent()
    {
        return $this->hasOne(AmenityContent::class, 'amenity_id', 'id');
    }

    public function propertyAmenities()
    {
        return $this->hasMany(PropertyAmenity::class, 'amenity_id', 'id');
    }
}
