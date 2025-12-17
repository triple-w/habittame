<?php

namespace App\Models\Property;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Mews\Purifier\Facades\Purifier;

class PropertyContact extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function property()
    {
        return $this->belongsTo(Property::class, 'property_id', 'id');
    }
    protected function message(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => Purifier::clean($value),
            get: fn ($value) => Purifier::clean($value)

        );
    }
}
