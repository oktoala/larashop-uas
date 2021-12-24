<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'username' => 'admin',
            'name' => 'Site Administrator',
            'email' => 'admin@larashop.test',
            'roles' => json_encode(["ADMIN"]),
            'phone' => '0823',
            'password' => Hash::make("larashop"),
            'avatar' => 'nopic.png',
            'address' => 'Sarmili, Bintaro, Tanggerang Selatan'
        ]);

        $this->command->info("Berhasil Buat Admin");
    }
}
