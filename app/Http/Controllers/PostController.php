<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Renderer\Exception;
use Illuminate\Http\Request;
use App\Models\Post;

class PostController extends Controller
{
    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        try {
            // Busca un registro de Post en la base de datos utilizando el método findOrFail
            // y carga las relaciones 'owner' (Usuario propietario del post) y 'comments.user' (Usuarios de los comentarios)
            // de donde obtendremos tanto
            $post = Post::with(['owner', 'comments.user'])->findOrFail($id);

            // Crea un nuevo array con los datos del post y sus relaciones
            $post = [
                'id' => $post->id, // ID del post
                'title' => $post->title, // Título del post
                'short_content' => $post->short_content, // Contenido corto del post
                'owner' => [ // Datos del usuario propietario del post
                    'id' => $post->owner->id, // ID del usuario propietario
                    'name' => $post->owner->full_name, // Nombre completo del usuario propietario
                ],
                'users' => $post->comments->map(function ($user) { // Mapeo de los usuarios de los comentarios
                    return [
                        'id' => $user->user->id, // ID del usuario del comentario
                        'user' => $user->user->username, // Nombre de usuario del usuario del comentario
                        'full_name' => $user->user->full_name, // Nombre completo del usuario del comentario
                    ];
                }),
                'comments' => $post->comments->map(function ($comment) { // Mapeo de los comentarios
                    return [
                        'id' => $comment->id, // ID del comentario
                        'comment' => $comment->content, // Contenido del comentario
                    ];
                }),
            ];

            // Retorna una respuesta JSON con los datos del post y sus relaciones
            return response()->json([
                'body' => [
                    'post' => $post
                ]
            ], 200, [], JSON_PRETTY_PRINT);

        } catch (ModelNotFoundException $e) {
            // Si no se encuentra el post, retorna una respuesta JSON con un error 404 (No encontrado)
            return response()->json(['error' => 'Post no encontrado'], 404);

        } catch (\Exception $e) {
            // Si ocurre cualquier otra excepción, retorna una respuesta JSON con un error 500 (Error interno del servidor)
            return response()->json(['error' => 'Se produjo un error'], 500);
        }
    }
}
