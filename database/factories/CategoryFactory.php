<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Generator;
use Illuminate\Support\Str;

class CategoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */


    protected $categories = [
        'Fantasy',
        'Action',
        'Thriller',
        'Horror',
        'Isekai',
        'Comedy',
        'Romance',
        'Slice Of Life',
        'Martial Art'
    ];
    public function definition()
    {
        // $output = new \Symfony\Component\Console\Output\ConsoleOutput();
        $name = $this->faker->randomElement($this->categories);
        $slug = Str::slug($name, '-');
        $i = array_search($name, $this->categories);
        array_splice($this->categories, $i, 1);

        return [
            'name' => $name,
            'image' => 'categories-image/nopic.png',
            'created_by' => $this->faker->numberBetween(1, 10),
            'slug' => $slug
        ];
    }
}
