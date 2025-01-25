<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PelangganModel extends Model
{
    use HasFactory;
    protected $table = 'pelanggan';
    protected $primaryKey = 'id_pelanggan';

    protected $keyType = 'string';
    public $incrementing = false;

    public $timestamps = true;

    protected $fillable = [
        'id_pelanggan',
        'nama_pelanggan',
        'no_hp',
        'alamat'
    ];
}
