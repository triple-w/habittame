<?php

namespace App\Models\Property;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    use HasFactory;
    protected $table = 'property_countries';
    protected $guarded = [];

    public function countryContents()
    {
        return $this->hasMany(CountryContent::class, 'country_id', 'id');
    }
    public function countryContent()
    {
        return $this->hasOne(CountryContent::class, 'country_id', 'id');
    }
    public function getContent($langId)
    {
        return $this->countryContents()->where('language_id', $langId)->first();
    }
    public function states()
    {
        return $this->hasMany(State::class, 'country_id', 'id');
    }

    public function cities()
    {
        return $this->hasMany(City::class, 'country_id', 'id');
    }
    public function properties()
    {
        return $this->hasMany(Property::class, 'country_id', 'id');
    }
}
