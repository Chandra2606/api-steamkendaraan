<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PaketCucianSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            [
                'id_paket' => 'PKT0001',
                'nama_paket' => 'Cuci Basic Mobil Kecil',
                'jenis_cucian' => 'Mobil Kecil',
                'jenis_kendaraan' => 'Mobil',
                'harga' => 35000,
            ],
            [
                'id_paket' => 'PKT0002',
                'nama_paket' => 'Cuci Basic Mobil Sedang',
                'jenis_cucian' => 'Mobil Sedang',
                'jenis_kendaraan' => 'Mobil',
                'harga' => 40000,
            ],
            [
                'id_paket' => 'PKT0003',
                'nama_paket' => 'Cuci Basic Mobil Besar',
                'jenis_cucian' => 'Mobil Besar',
                'jenis_kendaraan' => 'Mobil',
                'harga' => 50000,
            ],
            [
                'id_paket' => 'PKT0004',
                'nama_paket' => 'Cuci Premium Mobil Kecil',
                'jenis_cucian' => 'Mobil Kecil',
                'jenis_kendaraan' => 'Mobil',
                'harga' => 50000,
            ],
            [
                'id_paket' => 'PKT0005',
                'nama_paket' => 'Cuci Premium Mobil Sedang',
                'jenis_cucian' => 'Mobil Sedang',
                'jenis_kendaraan' => 'Mobil',
                'harga' => 60000,
            ],
            [
                'id_paket' => 'PKT0006',
                'nama_paket' => 'Cuci Premium Mobil Besar',
                'jenis_cucian' => 'Mobil Besar',
                'jenis_kendaraan' => 'Mobil',
                'harga' => 75000,
            ],
            [
                'id_paket' => 'PKT0007',
                'nama_paket' => 'Cuci Motor Matic Basic',
                'jenis_cucian' => 'Motor Matic',
                'jenis_kendaraan' => 'Motor',
                'harga' => 15000,
            ],
            [
                'id_paket' => 'PKT0008',
                'nama_paket' => 'Cuci Motor Sport Basic',
                'jenis_cucian' => 'Motor Sport',
                'jenis_kendaraan' => 'Motor',
                'harga' => 20000,
            ],
            [
                'id_paket' => 'PKT0009',
                'nama_paket' => 'Cuci Motor Besar Basic',
                'jenis_cucian' => 'Motor Besar',
                'jenis_kendaraan' => 'Motor',
                'harga' => 25000,
            ],
            [
                'id_paket' => 'PKT0010',
                'nama_paket' => 'Cuci Motor Matic Premium',
                'jenis_cucian' => 'Motor Matic',
                'jenis_kendaraan' => 'Motor',
                'harga' => 25000,
            ],
            [
                'id_paket' => 'PKT0011',
                'nama_paket' => 'Cuci Motor Sport Premium',
                'jenis_cucian' => 'Motor Sport',
                'jenis_kendaraan' => 'Motor',
                'harga' => 30000,
            ],
            [
                'id_paket' => 'PKT0012',
                'nama_paket' => 'Cuci Motor Besar Premium',
                'jenis_cucian' => 'Motor Besar',
                'jenis_kendaraan' => 'Motor',
                'harga' => 35000,
            ],
            [
                'id_paket' => 'PKT0013',
                'nama_paket' => 'Detail Mobil Kecil',
                'jenis_cucian' => 'Mobil Kecil',
                'jenis_kendaraan' => 'Mobil',
                'harga' => 150000,
            ],
            [
                'id_paket' => 'PKT0014',
                'nama_paket' => 'Detail Mobil Sedang',
                'jenis_cucian' => 'Mobil Sedang',
                'jenis_kendaraan' => 'Mobil',
                'harga' => 175000,
            ],
            [
                'id_paket' => 'PKT0015',
                'nama_paket' => 'Detail Mobil Besar',
                'jenis_cucian' => 'Mobil Besar',
                'jenis_kendaraan' => 'Mobil',
                'harga' => 200000,
            ],
            [
                'id_paket' => 'PKT0016',
                'nama_paket' => 'Detail Motor Matic',
                'jenis_cucian' => 'Motor Matic',
                'jenis_kendaraan' => 'Motor',
                'harga' => 75000,
            ],
            [
                'id_paket' => 'PKT0017',
                'nama_paket' => 'Detail Motor Sport',
                'jenis_cucian' => 'Motor Sport',
                'jenis_kendaraan' => 'Motor',
                'harga' => 85000,
            ],
            [
                'id_paket' => 'PKT0018',
                'nama_paket' => 'Detail Motor Besar',
                'jenis_cucian' => 'Motor Besar',
                'jenis_kendaraan' => 'Motor',
                'harga' => 100000,
            ],
            [
                'id_paket' => 'PKT0019',
                'nama_paket' => 'Salon Mobil Complete',
                'jenis_cucian' => 'Mobil All Type',
                'jenis_kendaraan' => 'Mobil',
                'harga' => 500000,
            ],
            [
                'id_paket' => 'PKT0020',
                'nama_paket' => 'Salon Motor Complete',
                'jenis_cucian' => 'Motor All Type',
                'jenis_kendaraan' => 'Motor',
                'harga' => 250000,
            ],
        ];

        foreach ($data as $item) {
            $item['created_at'] = now();
            $item['updated_at'] = now();
            DB::table('paket_cucian')->insert($item);
        }
    }
}
