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
            'avatar' => 'avatars/nopic.png',
            'address' => 'Sarmili, Bintaro, Tanggerang Selatan'
        ]);

        $this->command->info("Berhasil Buat Admin");

        User::create([
            'username' => 'yogatra',
            'name' => 'Oktavian Yoga',
            'email' => 'yoga@gmail.com  ',
            'roles' => json_encode(["CUSTOMER"]),
            'phone' => '0823',
            'password' => Hash::make("makan"),
            'avatar' => 'avatars/nopic.png',
            'address' => 'Sangasanga'
        ]);


        User::factory(14)->create();

        $this->command->info("Berhasil Buat Random User");
    }
}
