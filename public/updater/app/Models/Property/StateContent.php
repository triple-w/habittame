<?php

namespace App\Models\Property;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StateContent extends Model
{
    use HasFactory;
    protected $table = 'property_state_contents';
    protected $guarded = [];
}
