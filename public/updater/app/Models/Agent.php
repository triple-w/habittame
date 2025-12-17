<?php

namespace App\Models;

use App\Models\Project\Project;
use App\Models\Property\Property;
use App\Models\Property\PropertyContact;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;

class Agent extends Model implements AuthenticatableContract
{
    use HasFactory, Authenticatable;

    protected $guarded = [];

    public function vendor()
    {
        return $this->belongsTo(Vendor::class, 'vendor_id', 'id');
    }
    public function agent_infos()
    {
        return $this->hasMany(AgentInfo::class, 'agent_id', 'id');
    }
    public function agent_info()
    {
        return $this->hasOne(AgentInfo::class, 'agent_id', 'id');
    }

    public function projects()
    {
        return $this->hasMany(Project::class, 'agent_id', 'id');
    }

    public function properties()
    {
        return $this->hasMany(Property::class, 'agent_id', 'id');
    }

    public function property_messages(){
        return $this->hasMany(PropertyContact::class,'agent_id','id');
    }
}
