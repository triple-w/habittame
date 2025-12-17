<?php

namespace App\Models\Project;

use App\Models\Agent;
use App\Models\Vendor;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    protected $guarded = [];
    // protected $table = 'projects';

    public function proejctContents()
    {
        return $this->hasMany(ProjectContent::class);
    }

    public function projectContent()
    {
        return $this->hasOne(ProjectContent::class);
    }
    public function getContent($langId)
    {
        return $this->proejctContents()->where('language_id',$langId)->first();
    }

    public function vendor()
    {
        return $this->belongsTo(Vendor::class, 'vendor_id', 'id');
    }
    public function agent()
    {
        return $this->belongsTo(Agent::class, 'agent_id', 'id');
    }

    public function projectTypes()
    {
        return $this->hasMany(ProjectType::class, 'project_id', 'id');
    }

    public function specifications()
    {
        return $this->hasMany(Spacification::class, 'project_id', 'id');
    }

    public function galleryImages()
    {
        return $this->hasMany(ProjectGalleryImage::class, 'project_id', 'id');
    }

    public function floorplanImages()
    {
        return $this->hasMany(ProjectFloorplanImage::class, 'project_id', 'id');
    }

    public function projectTypeContents()
    {
        return $this->hasManyThrough(ProjectTypeContent::class, ProjectType::class);
    }
}
