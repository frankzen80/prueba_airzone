<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class CategoryFactory extends Factory
{
    protected $model = Category::class;

    public function definition()
    {
        $category_name = fake()->title();

        return [
            'name' => $category_name,
            'slug' => Str::slug($category_name),
            'visible' => true,
        ];
    }
}
