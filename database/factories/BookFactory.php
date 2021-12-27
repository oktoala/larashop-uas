<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class BookFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $status = ['PUBLISH', 'DRAFT'];
        $title = $this->faker->sentence(3);
        $slug = Str::slug($title);
        return [
            'title' => $title,
            'description' => $this->faker->text(300),
            'author' => $this->faker->name(),
            'publisher' => $this->faker->company(),
            'price' => 100000,
            'status' => $this->faker->randomElement($status),
            'slug' => $slug,
            'created_by' => $this->faker->numberBetween(1, 10),
            'cover' => 'books-cover/nocover.png',
        ];
    }
}
