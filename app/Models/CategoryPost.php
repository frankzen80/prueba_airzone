<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoryPost extends Model
{
    // Usa el trait HasFactory para permitir la creación de instancias del modelo utilizando Factory.
    use HasFactory;

    protected $table = 'category_post';
    protected $primaryKey = 'id';
    protected $fillable = ['category_id', 'post_id'];

    // Relación (1:1): Cada registro en la tabla 'category_post' está asociado a una categoría.
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    // Relación (1:1): Cada registro en la tabla 'category_post' está asociado a un registro especifico de la tabla 'posts'.
    public function post()
    {
        return $this->belongsTo(Post::class);
    }
}
