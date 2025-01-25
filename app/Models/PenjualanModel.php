<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PenjualanModel extends Model
{
use HasFactory;

protected $table = 'penjualan_2110003';
protected $primaryKey = 'faktur_2110003';

protected $keyType = 'string';
public $incrementing = false;

public $timestamps = true;

protected $fillable = [
    'faktur_2110003',
    'tanggal_2110003',
    'kodepel_2110003',
    'iduserinput_2110003',
    'totalbayar_2110003'
 ];
}

