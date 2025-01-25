<?php

namespace App\Http\Controllers;

use App\Models\PaketCucian;
use Illuminate\Http\Request;
use View;

class PaketCucianController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = PaketCucian::query();

        $search = $request->input('search');
        if ($search) {

            $query->where('id_paket', 'LIKE', "%$search")
                ->orWhere('nama_paket', 'LIKE', "%$search");
        }

        $dataPaketCucian = $query->paginate(10);

        return response()->json($dataPaketCucian);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validate = $request->validate([
            'id_paket' => 'required|unique:paket_cucian,id_paket|max:20',
            'nama_paket' => 'required',
            'jenis_kendaraan' => 'required',
            'jenis_cucian' => 'required',
            'harga' => 'required',
        ]);
        $paketCucian = PaketCucian::create([
            'id_paket' => $request->id_paket,
            'nama_paket' => $request->nama_paket,
            'jenis_kendaraan' => $request->jenis_kendaraan,
            'jenis_cucian' => $request->jenis_cucian,
            'harga' => $request->harga,
        ]);

        return response()->json([
            'message' => 'Data berhasil disimpan',
            'data' => $paketCucian
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id_paket)
    {
        $paketCucian = PaketCucian::where('id_paket', $id_paket)->first();

        if (!$paketCucian) {
            return response()->json(['message' => 'Data Paket Cucian Tidak Ditemukan'], 404);
        }

        return response()->json($paketCucian, 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id_paket)
    {
        $validation = $request->validate([
            'nama_paket' => 'required',
            'harga' => 'required|numeric',
            'jenis_kendaraan' => 'required',
            'jenis_cucian' => 'required',
        ]);

        $paketCucian = PaketCucian::findOrFail($id_paket);



        //update data
        $paketCucian->nama_paket = $request->nama_paket;
        $paketCucian->harga = $request->harga;
        $paketCucian->jenis_kendaraan = $request->jenis_kendaraan;
        $paketCucian->jenis_cucian = $request->jenis_cucian;
        $paketCucian->save();

        return response()->json([
            'message' => 'Data Berhasil diperbaharui',
            'data' => $paketCucian
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id_paket)
    {
        $paketCucian = PaketCucian::findOrFail($id_paket);
        if ($paketCucian) {
            if ($paketCucian->gambarpaket && file_exists(public_path($paketCucian->gambarpaket))) {
                unlink(public_path($paketCucian->gambarpaket));
                unlink(public_path($paketCucian->gambarpaketthumb));
            }
            $paketCucian->delete();
            return response()->json([
                'message' => 'Data berhasil dihapus',
            ], 200);
        }
    }

    public function uploadImage(Request $request, $id_paket)
    {
        // Cek apakah barang ada
        $paketCucian = PaketCucian::find($id_paket);
        if (!$paketCucian) {
            return response()->json([
                'message' => 'Data Barang tidak ditemukan'
            ], 404);
        }

        $validatedData = $request->validate([
            'gambar' => 'required|image|mimes:jpeg,png,jpg,gif|max:5120',
        ], [
            'gambar.required' => 'Gambar harus diunggah.',
            'gambar.image' => 'File yang diunggah harus berupa gambar.',
            'gambar.mimes' => 'Gambar harus memiliki format jpeg, png, jpg, atau gif.',
            'gambar.max' => 'Ukuran gambar maksimal 5MB.',
        ]);

        if ($request->hasFile('gambar')) {
            // Hapus gambar lama jika ada
            if ($paketCucian->gambarpaket && file_exists(public_path($paketCucian->gambarpaket))) {
                unlink(public_path($paketCucian->gambarpaket));
                unlink(public_path($paketCucian->gambarpaketthumb));
            }

            // Proses upload gambar baru
            $file = $request->file('gambar');
            $fileName = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('images'), $fileName);

            // Kompres ukuran gambar
            $filePath = public_path('images') . '/' . $fileName;
            $fileName_Thumb = 'thumb_' . $fileName;
            $thumbPath = public_path('images/thumb') . '/' . $fileName_Thumb;

            switch ($file->getClientOriginalExtension()) {
                case 'jpeg':
                case 'jpg':
                    $resource = imagecreatefromjpeg($filePath);
                    break;
                case 'png':
                    $resource = imagecreatefrompng($filePath);
                    break;
                default:
                    return response()->json(['message' => 'Unsupported image type'], 400);
            }

            if (!$resource) {
                return response()->json(['message' => 'Error processing image'], 500);
            }

            // Resize dan simpan gambar thumbnail
            imagejpeg($resource, $thumbPath, 10);
            imagedestroy($resource);

            // Menyimpan path gambar di database
            $paketCucian->gambarpaket = '/images/' . $fileName;
            $paketCucian->gambarpaketthumb = '/images/thumb/' . $fileName_Thumb;
            $paketCucian->save();

            return response()->json([
                'message' => 'Image Gambar Berhasil dilakukan',
                'data' => $paketCucian
            ], 200);
        }
    }
}
