<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
     // Usa el trait HasFactory para permitir la creación de instancias del modelo utilizando Factory.
    use HasFactory;

    protected $table = 'categories';
    protected $primaryKey = 'id';
    protected $fillable = ['name', 'slug', 'visible'];

    //  Las reglas de validación para el modelo Category.
    protected $rules = [
        'name' => 'required|string|max:255',
        'slug' => 'required|string|max:255|unique:categories,slug',
        'visible' => 'required|boolean',
    ];

    /**
     * Relación (1:N): Indica que una categoría puede estar asociada con muchas publicaciones.
     * Utiliza la tabla intermedia 'category_post' para definir la relación.
     **/
    public function posts()
    {
        return $this->belongsToMany(Post::class, 'category_post');
    }
}
