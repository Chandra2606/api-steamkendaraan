<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    protected $table = 'transaksi';
    protected $primaryKey = 'faktur';
    public $incrementing = false;
    protected $keyType = 'string';
    protected $fillable = ['faktur', 'tanggal', 'id_pelanggan', 'id_user', 'total_bayar'];
    public $timestamps = true;
}
