<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Temp extends Model
{
    protected $table = 'temps';
    protected $primaryKey = 'id';
    public $timestamps = true;
    public $incrementing = false;
    protected $keyType = 'string';
    protected $fillable = ['tempid_user', 'tempid_paket'];
}
