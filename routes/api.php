<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\PaketCucianController;
use App\Http\Controllers\PelangganController;
use App\Http\Controllers\TempController;
use App\Http\Controllers\TransaksiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route untuk mendapatkan user yang sedang login (memerlukan token autentikasi)
Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Routes untuk autentikasi (tanpa perlu autentikasi)
Route::controller(AuthController::class)->group(function () {
    Route::post('register', 'register');
    Route::post('login', 'login');
});

// Routes yang memerlukan autentikasi Sanctum
Route::middleware('auth:sanctum')->group(function () {

    // CRUD untuk barang
    Route::apiResource('paket', PaketCucianController::class);
    // Upload gambar barang berdasarkan kode barang
    Route::put('/paket/upload/{id_paket}', [PaketCucianController::class, 'uploadImage']);

    // CRUD untuk pelanggan
    Route::apiResource('pelanggan', PelangganController::class);

    // Logout user
    Route::post('logout', [AuthController::class, 'logout']);

    // Routes untuk TempKeranjang (keranjang sementara)
    Route::post('/insert-temp/{nameUser}', [TempController::class, 'insertTemp']);
    Route::get('/total-items/{nameUser}', [TempController::class, 'getTotalItems']);
    Route::get('/get-keranjang/{nameUser}', [TempController::class, 'getKeranjang']);
    Route::get('/total-pembayaran/{nameUser}', [TempController::class, 'getTotalPembayaran']);
    Route::delete('/hapus-item-keranjang/{nameUser}/{itemId}', [TempController::class, 'destroy']);

    // Routes untuk transaksi penjualan
    Route::post('/simpan-transaksi', [TransaksiController::class, 'simpanTransaksi']);
    Route::get('/laporan-transaksi', action: [TransaksiController::class, 'getLaporanTransaksi']);
    Route::get('/download-laporan-transaksi', [TransaksiController::class, 'downloadLaporanTransaksi']);
});
