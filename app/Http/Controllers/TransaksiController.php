<?php

namespace App\Http\Controllers;

use App\Models\PaketCucian;
use App\Models\DetailTransaksi;
use App\Models\TempKeranjangModel;
use App\Models\Transaksi;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PDF;

class TransaksiController extends Controller
{
    public function simpanTransaksi(Request $request)
    {
        try {
            DB::beginTransaction();

            $dataUser = User::where('name', '=', $request->iduser)->first();
            //Generate Faktur
            $faktur = now()->format('dmYhis');

            //Simpan ke tabel transaksi
            $transaksi = Transaksi::create([
                'faktur' => $faktur,
                'tanggal' => now(),
                'id_pelanggan' => $request->kodepelanggan,
                'id_user' => $dataUser->id,
                'total_bayar' => $request->totalbayar,
            ]);

            //ambil data tempkeranjang
            $tempKeranjang = TempKeranjangModel::where('tempid_user', $dataUser->id)->get();

            //simpan ke tabel penjualan_detail
            foreach ($tempKeranjang as $item) {
                $barang = PaketCucian::where('id_paket', $item->tempid_paket)->first();

                DetailTransaksi::create([
                    'detailid_paket' => $item->tempid_paket,
                    'qty' => $item->qty_2110003,
                    'subtotal' => $barang->harga_2110003 * $item->qty_2110003,
                    'detailfaktur' => $faktur,
                ]);
            }

            //hapus data dari keranjang
            TempKeranjangModel::where('userid_2110003', $dataUser->id)->delete();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Transaksi berhasil disimpan',
                'faktur' => $faktur,
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Terjadi Kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function getLaporanTransaksi(Request $request)
    {
        $startDate = Carbon::parse($request->query('start'))->format('Y-m-d');
        $endDate = Carbon::parse($request->query('end'))->format('Y-m-d');

        $laporan = Transaksi::join('pelanggan', function ($join) {
            $join->on(
                DB::raw('BINARY pelanggan.id_pelanggan'),
                '=',
                DB::raw('BINARY transaksi.id_pelanggan')
            );
        })
            ->whereBetween(DB::raw('DATE(tanggal)'), [$startDate, $endDate])
            ->get([
                'transaksi.faktur',
                'transaksi.tanggal',
                'transaksi.total_bayar',
                'pelanggan.nama_pelanggan'
            ]);

        return response()->json([
            'success' => true,
            'laporan' => $laporan,
        ]);
    }

    public function downloadLaporanPenjualan(Request $request)
    {
        $startDate = Carbon::parse($request->query('start'))->format('Y-m-d');
        $endDate = Carbon::parse($request->query('end'))->format('Y-m-d');

        $laporan = Transaksi::join('pelanggan', function ($join) {
            $join->on(
                DB::raw('BINARY pelanggan.id_pelanggan'),
                '=',
                DB::raw('BINARY transaksi.id_pelanggan')
            );
        })
            ->whereBetween(DB::raw('DATE(tanggal)'), [$startDate, $endDate])
            ->get(['transaksi.faktur', 'transaksi.tanggal', 'transaksi.total_bayar', 'pelanggan.nama_pelanggan']);

        $pdf = PDF::loadView('laporan_transaksi_pdf', compact('laporan', 'startDate', 'endDate'));

        return $pdf->download("laporan_penjualan_{$startDate}_{$endDate}.pdf");
    }
}
