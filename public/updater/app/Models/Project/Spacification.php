<?php

namespace App\Models\Project;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Spacification extends Model
{
    use HasFactory;

    protected $table = 'project_spacifications';
    protected $guarded = [];

    public function specificationContents()
    {
        return $this->hasMany(SpacificationContent::class, 'project_spacification_id', 'id');
    }
}
