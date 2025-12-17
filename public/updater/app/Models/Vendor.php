<?php

namespace App\Models;

use App\Models\Instrument\Equipment;
use App\Models\Instrument\EquipmentReview;
use App\Models\Project\Project;
use App\Models\Property\Property;
use App\Models\Property\PropertyContact;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;

class Vendor extends Model implements AuthenticatableContract
{
    use HasFactory, Authenticatable;

    protected $fillable = [
        'photo',
        'email',
        'phone',
        'username',
        'password',
        'status',
        'amount',
        'facebook',
        'twitter',
        'linkedin',
        'avg_rating',
        'email_verified_at',
        'show_email_addresss',
        'show_phone_number',
        'show_contact_form',
    ];

    public function vendor_infos()
    {
        return $this->hasMany(VendorInfo::class);
    }
    public function vendor_info()
    {
        return $this->hasOne(VendorInfo::class);
    }

    //support ticket
    public function support_ticket()
    {
        return $this->hasMany(SupportTicket::class, 'vendor_id', 'id');
    }

    public function memberships()
    {
        return $this->hasMany(Membership::class);
    }


    public function agents()
    {
        return $this->hasMany(Agent::class, 'vendor_id', 'id');
    }
    
    public function properties()
    {
        return $this->hasMany(Property::class, 'vendor_id', 'id');
    }

    public function projects()
    {
        return $this->hasMany(Project::class, 'vendor_id', 'id');
    }

    public function propertyMessages(){
        return $this->hasMany(PropertyContact::class,'vendor_id','id');
    }
}
