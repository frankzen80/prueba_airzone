<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    // Usa el trait HasFactory para permitir la creación de instancias del modelo utilizando Factory.
    use HasFactory;


    public $timestamps = false;
    
    protected $table = 'comments';
    protected $primaryKey = 'id';
    protected $fillable = ['post_id', 'user_id', 'content', 'datetime'];
    protected $casts = [
        'datetime' => 'datetime',
    ];

    // Relacion (1:1): Indica que este modelo está asociado a una publicación específica de la table 'post'.
    public function post()
    {
        return $this->belongsTo(Post::class);
    }

    // Relacion (1:1): Indica que este modelo está asociado a un usuario específico de la table 'user'.
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /** 
     * Relacion (1:1): Indica que este modelo está asociado a un usuario específico de la table 'user' 
     * utilizando 'user_id' como la clave foránea en lugar de la clave predeterminada.
     **/ 
    public function writer()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
