<?php

namespace App\Http\Controllers;

use App\Models\Temp;
use App\Models\User;
use Illuminate\Http\Request;

class TempController extends Controller
{
    // Menambahkan item ke keranjang
    public function insertTemp(Request $request, $nameUser)
    {
        $dataUser = User::where('name', $nameUser)->first();

        if (!$dataUser) {
            return response()->json([
                'success' => false,
                'message' => 'User tidak ditemukan'
            ], 404);
        }

        $temp = new Temp();
        $temp->tempid_user = $dataUser->id;
        $temp->tempid_paket = $request->paket;
        $temp->save();

        return response()->json([
            'success' => true,
            'message' => 'Item berhasil ditambahkan ke keranjang'
        ]);
    }

    // Mendapatkan total jumlah item dalam keranjang
    public function getTotalItems($nameUser)
    {
        $dataUser = User::where('name', $nameUser)->first();

        if (!$dataUser) {
            return response()->json([
                'success' => false,
                'message' => 'User tidak ditemukan'
            ], 404);
        }

        $totalItems = Temp::where('tempid_user', $dataUser->id)->sum('tempid_paket');

        return response()->json([
            "success" => true,
            "totalItems" => $totalItems,
        ]);
    }

    // Mendapatkan daftar item di keranjang
    public function getKeranjang($nameUser)
    {
        $dataUser = User::where('name', $nameUser)->first();

        if (!$dataUser) {
            return response()->json([
                'success' => false,
                'message' => 'User tidak ditemukan'
            ], 404);
        }

        $items = Temp::join('paket_cucian', 'temps.tempid_paket', '=', 'paket_cucian.id_paket')
            ->where('temps.tempid_user', $dataUser->id)
            ->get([
                'paket_cucian.id_paket as id_paket',
                'paket_cucian.nama_paket as nama_paket',
                'paket_cucian.harga as harga',
                'paket_cucian.gambar as gambar',
            ]);

        return response()->json([
            "success" => true,
            "data" => $items,
        ]);
    }

    // Mendapatkan total harga pembayaran
    public function getTotalPembayaran($nameUser)
    {
        $dataUser = User::where('name', $nameUser)->first();

        if (!$dataUser) {
            return response()->json([
                'success' => false,
                'message' => 'User tidak ditemukan'
            ], 404);
        }

        $totalPembayaran = Temp::join('paket_cucian', 'temps.tempid_paket', '=', 'paket_cucian.id_paket')
            ->where('temps.tempid_user', $dataUser->id)
            ->selectRaw('SUM(paket_cucian.harga) as total')
            ->first();

        return response()->json([
            "success" => true,
            "total" => $totalPembayaran->total ?? 0,
        ]);
    }

    // Menghapus item dari keranjang
    public function destroy($nameUser, $itemId)
    {
        $dataUser = User::where('name', $nameUser)->first();

        if (!$dataUser) {
            return response()->json([
                'success' => false,
                'message' => 'User tidak ditemukan'
            ], 404);
        }

        $item = Temp::where('tempid_user', $dataUser->id)
            ->where('tempid_paket', $itemId)
            ->first();

        if ($item) {
            $item->delete();
            return response()->json([
                'success' => true,
                'message' => 'Item berhasil dihapus dari keranjang'
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Item tidak ditemukan dalam keranjang'
            ]);
        }
    }
}
