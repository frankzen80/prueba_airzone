<?php

namespace Tests\Feature;

use App\Models\Post;
use App\Models\User;
use App\Models\Comment;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class PostTest extends TestCase
{
    use DatabaseTransactions; // Trait para resetear la base de datos antes de cada prueba

    /**
     * Prueba para el método show que muestra un post con sus relaciones.
     */
    public function testShowPost()
    {
        // Crear un owner (usuario) utilizando una fábrica
        $owner = User::factory()->create();

        // Crear un post y asociar el owner (usuario) al post
        $post = Post::factory()->create(['user_id' => $owner->id]);


        // Crear comentarios asociados al post
        $comments = Comment::factory(2)->create(['post_id' => $post->id]);

        // Hacer una petición GET a la ruta /api/post/{id}
        $response = $this->getJson("/api/post/{$post->id}");

        // Verificar que la respuesta tenga un estado 200 y que el JSON devuelto coincida con los datos del post creado
        $response->assertStatus(200)
                 ->assertJson([
                     'body' => [
                         'post' => [
                             'id' => $post->id,
                             'title' => $post->title,
                             'short_content' => $post->short_content,
                             'owner' => [
                                 'id' => $owner->id,
                                 'name' => $owner->full_name,
                             ],
                             'users' => $comments->map(function ($user) {
                                 return [
                                     'id' => $user->user->id,
                                     'user' => $user->user->username,
                                     'full_name' => $user->user->full_name,
                                 ];
                             })->toArray(),
                             'comments' => $comments->map(function ($comment) {
                                 return [
                                     'id' => $comment->id,
                                     'comment' => $comment->content,
                                 ];
                             })->toArray(),
                         ],
                     ],
                 ]);
    }

    
}