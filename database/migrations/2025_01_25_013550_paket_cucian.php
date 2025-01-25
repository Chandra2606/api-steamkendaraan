<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('paket_cucian', function (Blueprint $table) {
            $table->char('id_paket', 10)->primary();
            $table->string('nama_paket');
            $table->string('jenis_kendaraan');
            $table->string('jenis_cucian');
            $table->double('harga');
            $table->string('gambarpaket')->nullable();
            $table->string('gambarpaketthumb')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('paket_cucian');
    }
};
