<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class OrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $status = ['SUBMIT', 'PROCESS', 'FINISH', 'CANCEL'];
        return [
            'user_id' => $this->faker->numberBetween(1, 14),
            'invoice_number' => $this->faker->swiftBicNumber(),
            'status' => $this->faker->randomElement($status),
        ];
    }
}
