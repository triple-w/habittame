<?php

namespace App\Models\Journal;

use App\Models\Journal\BlogInformation;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
  use HasFactory;

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $guarded = [];

  public function information()
  {
    return $this->hasMany(BlogInformation::class);
  }

  public function isActive(): Attribute
  {
    return Attribute::make(
      get: function ($value) {
        $attributeName = 'status'; // Change this to match your attribute name

        // Check if the attribute exists and is not null
        if ($this->attributes[$attributeName]) {
          if ($this->attributes[$attributeName] == 1) {
            return true;
          }
          return false;
        }

        return false; // Return false if the attribute is null or doesn't exist
      },

    );
  }
}
