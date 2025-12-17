<?php

namespace App\Models\Property;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Spacification extends Model
{
    use HasFactory;

    protected $table = 'property_spacifications';

    protected $guarded = [];

    public function specificationContents()
    {
        return $this->hasMany(SpacificationCotent::class, 'property_spacification_id', 'id');
    }
}
