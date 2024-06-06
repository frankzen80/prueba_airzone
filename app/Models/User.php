<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class User extends Model
{
    // Usa el trait HasFactory para permitir la creación de instancias del modelo utilizando Factory.
    use HasFactory;

    protected $table = 'users';
    protected $primaryKey = 'id';
    protected $fillable = ['username', 'full_name'];

    // Desactivar los campos created_at y updated_at
    public $timestamps = false;

    // Relación (1:N): Indica que este modelo puede tener muchas publicaciones asociadas.
    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    // Relacion (1:N): Indica que este modelo puede tener muchos comentarios asociados.
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    /**
    * Relacion (N:N): Indica que este modelo puede estar asociado a muchas categorías.
    * Utilizando la tabla pivote category_user
    **/
    public function userCategories()
    {
        return $this->belongsToMany(Category::class, 'category_user');
    }

}
