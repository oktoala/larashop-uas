<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class BookOrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'order_id' => $this->faker->numberBetween(1, 12),
            'book_id' => $this->faker->numberBetween(1, 14),
        ];
    }
}
