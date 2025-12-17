<?php

namespace App\Models\Property;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CityContent extends Model
{
    use HasFactory;
    protected  $table  = 'property_city_contents';
    protected $guarded = [];
}
