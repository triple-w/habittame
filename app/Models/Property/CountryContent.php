<?php

namespace App\Models\Property;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CountryContent extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $table = 'property_country_contents';
}
