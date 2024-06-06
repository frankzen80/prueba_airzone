<?php

namespace Database\Factories;

use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class PostFactory extends Factory
{
    protected $model = Post::class;

    public $timestamps = false;

    public function definition()
    {   
        $title = $this->faker->sentence(2);
        $slug = Str::slug($title);
        $content = $this->faker->text(random_int(90, 300));
        $short_ccontent = substr(str_replace('.', '', $this->faker->unique()->text(25)), 0, 25);

        return [
            'user_id' => User::factory(),
            'title' => $title,
            'slug' => Str::slug($title),
            'picture' =>  $this->faker->imageUrl(900, 300),
            'short_content' => $short_ccontent,
            'content' => $content,
        ];
    }
}
