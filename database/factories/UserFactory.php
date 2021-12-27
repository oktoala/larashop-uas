<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $roles = ['ADMIN', 'STAFF', 'CUSTOMER'];

        return [
            'username' => $this->faker->userName(),
            'name' => $this->faker->name(),
            'email' => $this->faker->email(),
            'roles' => json_encode($this->faker->randomElements($roles, $this->faker->numberBetween(1, 3))),
            'phone' => $this->faker->phoneNumber(),
            'password' => Hash::make("makan"),
            'avatar' => 'avatars/nopic.png',
            'address' => $this->faker->address()
        ];
    }

    /**
     * Indicate that the model's email address should be unverified.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    public function unverified()
    {
        return $this->state(function (array $attributes) {
            return [
                'email_verified_at' => null,
            ];
        });
    }
}
