<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class PelangganSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create('id_ID');

        for ($i = 1; $i <= 100; $i++) {
            DB::table('pelanggan')->insert([
                'id_pelanggan' => 'PLG' . str_pad($i, 7, '0', STR_PAD_LEFT),
                'nama_pelanggan' => $faker->name,
                'no_hp' => $faker->numerify('08##########'),
                'alamat' => $faker->address,
                'created_at' => $faker->dateTimeBetween('-1 year', 'now'),
                'updated_at' => now(),
            ]);
        }
    }
}
