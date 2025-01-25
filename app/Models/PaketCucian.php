<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaketCucian extends Model
{
    protected $table = 'paket_cucian';
    protected $primaryKey = 'id_paket';
    public $timestamps = true;

    protected $fillable = [
        'id_paket',
        'nama_paket',
        'jenis_kendaraan',
        'jenis_cucian',
        'harga',
        'gambarpaket',
        'gambarpaketthumb',

    ];
}
