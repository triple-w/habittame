<?php

namespace App\Models\Property;

use App\Models\Amenity;
use App\Models\AmenityContent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropertyAmenity extends Model
{
    use HasFactory;

    protected $guarded = [];
    public function amenityContent()
    {
        return $this->belongsTo(AmenityContent::class, 'amenity_id', 'amenity_id');
    }

    public function amenity()
    {
        return $this->belongsTo(Amenity::class, 'amenity_id', 'id');
    }
}
