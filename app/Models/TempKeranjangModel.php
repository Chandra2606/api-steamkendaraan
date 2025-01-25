<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TempKeranjangModel extends Model
{
use HasFactory;
protected $table = 'tempkeranjang_2110003';
protected $primaryKey = 'id_2110003';

public $timestamps = true;

protected $fillable = [
'userid_2110003',
'tempkodebarang_2110003',
'qty_2110003'
];
}
