<?php

namespace App\Http\Controllers;
use App\Models\PelangganModel;
use Illuminate\Http\Request;

class PelangganController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = PelangganModel::query();
        $search = $request->input('search');

        if ($search) {
            $query ->where('kodepelanggan_2110003','LIKE',"%$search%")
            ->orWhere('namapelanggan_2110003','LIKE',"%$search%");
        }
        $dataPelanggan = $query->paginate(10);
        return response()->json($dataPelanggan);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = $request->validate([
            'kodepelanggan' => 'required|unique:pelanggan_2110003,kodepelanggan_2110003|max:20',
            'namapelanggan' => 'required',
            'nohp' => 'required|numeric',
            'alamat' => 'required|max:20'
            ]);
            $pelanggan = PelangganModel::create([
                'kodepelanggan_2110003' => $request->kodepelanggan,
                'namapelanggan_2110003' => $request->namapelanggan,
                'nohp_2110003' => $request->nohp,
                'alamat_2110003' => $request->alamat
            ]);
            return response()->json([
                'message' =>'Data Berhasil Tersimpan',
                'data' => $pelanggan
            ], 201);

    }

    /**
     * Display the specified resource.
     */
    public function show($kodepelanggan)
    {
    $pelanggan = PelangganModel::where('kodepelanggan_2110003', $kodepelanggan)->first();

    if (!$pelanggan) {
        return response()->json(['message' => 'Data pelanggan tidak ditemukan'], 404);
    }

    return response()->json($pelanggan, 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $kodepelanggan)
    {
    $validation = $request->validate([
        'namapelanggan' => 'required',
        'nohp' => 'required|numeric',
        'alamat' => 'required|max:20',
    ]);

    $pelanggan = PelangganModel::findOrFail($kodepelanggan);

    // Update data
    $pelanggan->namapelanggan_2110003 = $request->namapelanggan;
    $pelanggan->nohp_2110003 = $request->nohp;
    $pelanggan->alamat_2110003 = $request->alamat;

    $pelanggan->save();

    return response()->json([
        'message' => 'Data berhasil diperbarui',
        'data' => $pelanggan,
    ], 200);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($kodepelanggan)
    {
        $pelanggan = PelangganModel::findOrFail($kodepelanggan);
        if ($pelanggan) {
            $pelanggan->delete();
            return response()->json([
                'message' => 'Data Berhasil Dihapus',
            ],200);

        }
    }
}