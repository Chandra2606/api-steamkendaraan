<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PenjualanDetailModel extends Model
{

use HasFactory;
protected $table = 'penjualan_detail_2110003';
protected $primaryKey = 'id_2110003';

public $timestamps = true;

protected $fillable = [
'detfaktur_2110003',
'detkodebarang_2110003',
'qty_2110003',
'subtotal_2110003',
];
}