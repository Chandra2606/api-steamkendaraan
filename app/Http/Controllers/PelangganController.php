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
            $query->where('id_pelanggan', 'LIKE', "%$search%")
                ->orWhere('nama_pelanggan', 'LIKE', "%$search%");
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
            'id_pelanggan' => 'required|unique:pelanggan,id_pelanggan|max:20',
            'nama_pelanggan' => 'required',
            'no_hp' => 'required|numeric',
            'alamat' => 'required|max:20'
        ]);
        $pelanggan = PelangganModel::create([
            'id_pelanggan' => $request->id_pelanggan,
            'nama_pelanggan' => $request->nama_pelanggan,
            'no_hp' => $request->no_hp,
            'alamat' => $request->alamat
        ]);
        return response()->json([
            'message' => 'Data Berhasil Tersimpan',
            // 'data' => $pelanggan
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id_pelanggan)
    {
        $pelanggan = PelangganModel::where('id_pelanggan', $id_pelanggan)->first();

        if (!$pelanggan) {
            return response()->json(['message' => 'Data pelanggan tidak ditemukan'], 404);
        }

        return response()->json($pelanggan, 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id_pelanggan)
    {
        $validation = $request->validate([
            'nama_pelanggan' => 'required',
            'no_hp' => 'required|numeric',
            'alamat' => 'required|max:20',
        ]);

        $pelanggan = PelangganModel::findOrFail($id_pelanggan);

        // Update data
        $pelanggan->nama_pelanggan = $request->nama_pelanggan;
        $pelanggan->no_hp = $request->no_hp;
        $pelanggan->alamat = $request->alamat;

        $pelanggan->save();

        return response()->json([
            'message' => 'Data berhasil diperbarui',
            'data' => $pelanggan,
        ], 200);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id_pelanggan)
    {
        $pelanggan = PelangganModel::findOrFail($id_pelanggan);
        if ($pelanggan) {
            $pelanggan->delete();
            return response()->json([
                'message' => 'Data Berhasil Dihapus',
            ], 200);
        }
    }
}
