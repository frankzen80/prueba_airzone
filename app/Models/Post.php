<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{   
    // Usa el trait HasFactory para permitir la creación de instancias del modelo utilizando Factory.
    use HasFactory;

    public $timestamps = false;

    protected $table = 'posts';
    protected $primaryKey = 'id';
    protected $fillable = ['user_id', 'title', 'slug', 'picture', 'short_content', 'content', 'added', 'updated', 'comment', 'pending', 'public', 'active'];
    protected $casts = [
        'added' => 'datetime',
        'updated' => 'datetime',
    ];

    // Relacion (1:1): Indica que este modelo está asociado a un usuario específico de la table 'user'.
    public function user()
    {
        return $this->belongsToMany(User::class);
    }


    // Relación (1:N): Indica que este modelo puede tener muchos comentarios asociados.
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    /**
    * Relación (N:N): Indica que este modelo puede estar asociado a muchas categorías.
    * Utiliza la tabla intermedia 'category_post' para definir la relación.
    *
    **/
    public function categories()
    {
        return $this->belongsToMany(Category::class, 'category_post');
    }


     /** 
     * Relacion (1:1): Indica que este modelo está asociado a un usuario específico de la table 'user' 
     * utilizando 'user_id' como la clave foránea en lugar de la clave predeterminada.
     **/ 
    public function owner()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

}
