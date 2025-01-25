<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetailTransaksi extends Model
{
    protected $table = 'detail_transaksis';
    protected $primaryKey = 'id_detail';
    public $incrementing = false;
    protected $keyType = 'string';
    protected $fillable = ['detailfaktur', 'detailid_paket', 'subtotal'];
    public $timestamps = true;
}
