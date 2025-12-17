<?php

namespace App\Models\Property;

use App\Models\Vendor;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FeaturedProperty extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected function isExpired(): Attribute
    {
        return Attribute::make(
            get: function ($value) {
                $attributeName = 'end_date'; // Change this to match your attribute name

                // Check if the attribute exists and is not null
                if ($this->attributes[$attributeName]) {
                    // Assuming expiry_date is a dateTime format
                    $expiryDate = Carbon::parse($this->attributes[$attributeName]);

                    // Check if the expiry date is in the past
                    return $expiryDate->isPast();
                }

                return false; // Return false if the attribute is null or doesn't exist
            },
        );
    }

    public function property()
    {
        return $this->belongsTo(Property::class, 'property_id', 'id');
    }
    public function vendor()
    {
        return $this->belongsTo(Vendor::class, 'vendor_id', 'id');
    }
    public function categoryContent()
    {
        return $this->belongsTo(PropertyCategoryContent::class, 'category_id', 'category_id');
    }
}
