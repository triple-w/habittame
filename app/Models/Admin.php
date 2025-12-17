<?php

namespace App\Models;

use App\Models\Property\Property;
use App\Models\RolePermission;
use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Admin extends Model implements AuthenticatableContract
{
  use HasFactory, Authenticatable;

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
    'role_id',
    'first_name',
    'last_name',
    'image',
    'username',
    'email',
    'password',
    'status',
    'address',
    'details',
    'phone',
    'show_contact_form',
    'show_phone_number',
    'show_email_addresss',
  ];

  /**
   * The attributes that should be hidden for arrays.
   *
   * @var array
   */
  protected $hidden = ['password'];

  public function role()
  {
    return $this->belongsTo(RolePermission::class, 'role_id', 'id');
  }

  public function adminInfos()
  {
    return $this->hasMany(AdminInfo::class);
  }
  public function adminInfo()
  {
    return $this->hasOne(AdminInfo::class);
  }
}
