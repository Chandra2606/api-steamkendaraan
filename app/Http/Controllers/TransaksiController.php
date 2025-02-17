<?php

namespace App\Http\Controllers;

use App\Models\PaketCucian;
use App\Models\DetailTransaksi;
use App\Models\Temp;
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
                'id_pelanggan' => $request->id_pelanggan,
                'id_user' => $dataUser->id,
                'total_bayar' => $request->totalbayar,
            ]);

            //ambil data tempkeranjang
            $tempKeranjang = Temp::where('tempid_user', $dataUser->id)->get();

            //simpan ke tabel penjualan_detail
            foreach ($tempKeranjang as $item) {
                $barang = PaketCucian::where('id_paket', $item->tempid_paket)->first();

                DetailTransaksi::create([
                    'detailfaktur' => $faktur,
                    'detailid_paket' => $item->tempid_paket,

                ]);
            }

            //hapus data dari keranjang
            Temp::where('tempid_user', $dataUser->id)->delete();

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
            ->join('detail_transaksis', 'transaksi.faktur', '=', 'detail_transaksis.detailfaktur')
            ->join('paket_cucian', 'detail_transaksis.detailid_paket', '=', 'paket_cucian.id_paket')
            ->whereBetween(DB::raw('DATE(transaksi.tanggal)'), [$startDate, $endDate])
            ->select([
                'transaksi.faktur',
                'transaksi.tanggal',
                'transaksi.total_bayar',
                'pelanggan.id_pelanggan',
                'pelanggan.nama_pelanggan',
                'pelanggan.alamat',
                'pelanggan.no_hp',
                'paket_cucian.nama_paket',
                'paket_cucian.harga as harga_paket',
            ])
            ->orderBy('transaksi.tanggal', 'desc')
            ->get()
            ->groupBy('faktur')
            ->map(function ($group) {
                $firstItem = $group->first();
                return [
                    'faktur' => $firstItem->faktur,
                    'tanggal' => $firstItem->tanggal,
                    'total_bayar' => $firstItem->total_bayar,
                    'pelanggan' => [
                        'id' => $firstItem->id_pelanggan,
                        'nama' => $firstItem->nama_pelanggan,
                        'alamat' => $firstItem->alamat,
                        'no_hp' => $firstItem->no_hp
                    ],
                    'items' => $group->map(function ($item) {
                        return [
                            'nama_paket' => $item->nama_paket,
                            'harga' => $item->harga_paket,
                        ];
                    })
                ];
            })->values();

        return response()->json([
            'success' => true,
            'laporan' => $laporan,
        ]);
    }
    public function downloadLaporanTransaksi(Request $request)
    {
        try {
            $startDate = Carbon::parse($request->query('start'))->format('Y-m-d');
            $endDate = Carbon::parse($request->query('end'))->format('Y-m-d');

            $laporan = Transaksi::join('pelanggan', function ($join) {
                $join->on(
                    DB::raw('BINARY pelanggan.id_pelanggan'),
                    '=',
                    DB::raw('BINARY transaksi.id_pelanggan')
                );
            })
                ->join('detail_transaksis', 'transaksi.faktur', '=', 'detail_transaksis.detailfaktur')
                ->join('paket_cucian', 'detail_transaksis.detailid_paket', '=', 'paket_cucian.id_paket')
                ->whereBetween(DB::raw('DATE(transaksi.tanggal)'), [$startDate, $endDate])
                ->select([
                    'transaksi.faktur',
                    'transaksi.tanggal',
                    'transaksi.total_bayar',
                    'pelanggan.id_pelanggan',
                    'pelanggan.nama_pelanggan',
                    'pelanggan.alamat',
                    'pelanggan.no_hp',
                    'paket_cucian.nama_paket',
                    'paket_cucian.harga as harga_paket',
                ])
                ->orderBy('transaksi.tanggal', 'desc')
                ->get();

            $groupedLaporan = $laporan->groupBy('faktur')
                ->map(function ($group) {
                    $firstItem = $group->first();
                    return [
                        'faktur' => $firstItem->faktur,
                        'tanggal' => $firstItem->tanggal,
                        'total_bayar' => $firstItem->total_bayar,
                        'pelanggan' => [
                            'id' => $firstItem->id_pelanggan,
                            'nama' => $firstItem->nama_pelanggan,
                            'alamat' => $firstItem->alamat,
                            'no_hp' => $firstItem->no_hp
                        ],
                        'items' => $group->map(function ($item) {
                            return [
                                'nama_paket' => $item->nama_paket,
                                'harga' => $item->harga_paket,
                            ];
                        })->values()->toArray()
                    ];
                })->values();

            $data = [
                'laporan' => $groupedLaporan,
                'startDate' => $startDate,
                'endDate' => $endDate,
                'totalPendapatan' => $groupedLaporan->sum('total_bayar'),
                'totalTransaksi' => $groupedLaporan->count(),
            ];

            $pdf = PDF::loadView('laporan_transaksi_pdf', $data);
            $pdf->setPaper('A4', 'portrait');

            return $pdf->download("laporan_transaksi_{$startDate}_{$endDate}.pdf");
        } catch (\Exception $e) {
            \Log::error('PDF Generation Error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Gagal menghasilkan PDF: ' . $e->getMessage()
            ], 500);
        }
    }
}
