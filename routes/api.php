<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\PaketCucianController;
use App\Http\Controllers\PelangganController;
use App\Http\Controllers\TempKeranjangController;
use App\Http\Controllers\PenjualanController;
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
    Route::apiResource('paketcucian', PaketCucianController::class);
    // Upload gambar barang berdasarkan kode barang
    Route::put('/paketcucian/upload/{id_paket}', [PaketCucianController::class, 'uploadImage']);

    // CRUD untuk pelanggan
    Route::apiResource('pelanggan', PelangganController::class);

    // Logout user
    Route::post('logout', [AuthController::class, 'logout']);

    // Routes untuk TempKeranjang (keranjang sementara)
    Route::post('/insert-temp/{nameUser}', [TempKeranjangController::class, 'insertTemp']);
    Route::get('/total-items/{nameUser}', [TempKeranjangController::class, 'getTotalItems']);
    Route::get('/get-keranjang/{nameUser}', [TempKeranjangController::class, 'getKeranjang']);
    Route::get('/total-pembayaran/{nameUser}', [TempKeranjangController::class, 'getTotalPembayaran']);
    Route::delete('/hapus-item-keranjang/{nameUser}/{itemId}', [TempKeranjangController::class, 'destroy']);

    // Routes untuk transaksi penjualan
    Route::post('/simpan-transaksi', [PenjualanController::class, 'simpanTransaksi']);
    Route::get('/laporan-penjualan', [PenjualanController::class, 'getLaporanPenjualan']);
    Route::get('/download-laporan-penjualan', [PenjualanController::class, 'downloadLaporanPenjualan']);
});
