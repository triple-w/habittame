<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AmenityContent extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function amenity()
    {
        return $this->belongsTo(Amenity::class, 'amenity_id', 'id');
    }
}
