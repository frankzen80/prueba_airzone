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
            
            $post = Post::with(['owner', 'comments.user'])->findOrFail($id);

            $post = [
                'id' => $post->id,
                'title' => $post->title,
                'short_content' => $post->short_content,
                'owner' => [
                    'id' => $post->owner->id,
                    'name' => $post->owner->full_name,
                ],
                'users' => $post->comments->map(function ($user) {
                    return [
                        'id' => $user->user->id,
                        'user' => $user->user->username,
                        'full_name' => $user->user->full_name,
                    ];
                }),
                'comments' => $post->comments->map(function ($comment) {
                    return [
                        'id' => $comment->id,
                        'coment' => $comment->content,
                    ];
                }),
            ];

            return response()->json([
                'body' => [
                    'post' => $post
                ]
            ], 200, [], JSON_PRETTY_PRINT);

        } catch (ModelNotFoundException $e) {

            return response()->json(['error' => 'Post no encontrado'], 404);

        } catch (\Exception $e) {

            return response()->json(['error' => 'Se produjo un error'], 500);
            
        }
        
    }
}
