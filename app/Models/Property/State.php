<?php

namespace App\Models\Property;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    use HasFactory;

    protected $table = 'property_states';
    protected $guarded = [];

    public function stateContents()
    {
        return $this->hasMany(StateContent::class, 'state_id', 'id');
    }

    public function stateContent()
    {
        return $this->hasOne(StateContent::class, 'state_id', 'id');
    }

    public function getContent($langId)
    {
        return $this->stateContents()->where('language_id', $langId)->first();
    }

    public function country()
    {
        return $this->belongsTo(Country::class, 'country_id', 'id');
    }

    public function cities()
    {
        return $this->hasMany(City::class, 'state_id', 'id');
    }

    public function properties()
    {
        return $this->hasMany(Property::class, 'state_id', 'id');
    }
}
