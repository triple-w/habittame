<?php

namespace App\Models\Property;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use HasFactory;
    protected  $table  = 'property_cities';
    protected $guarded = [];


    public function cityContents()
    {
        return $this->hasMany(CityContent::class, 'city_id', 'id');
    }

    public function cityContent()
    {
        return $this->hasOne(CityContent::class, 'city_id', 'id');
    }
    public function getContent($langId)
    {
        return $this->cityContents()->where('language_id', $langId)->first();
    }
    public function country()
    {
        return $this->belongsTo(Country::class, 'country_id', 'id');
    }

    public function state()
    {
        return $this->belongsTo(State::class, 'state_id', 'id');
    }

    public function properties()
    {
        return $this->hasMany(Property::class, 'city_id', 'id');
    }
}
