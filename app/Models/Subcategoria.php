<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Subcategoria extends Model
{
    protected $table = 'subcategorias';
    protected $primaryKey = 'id_subcategoria';

    protected $fillable = [
        'id_categoria',
        'nombre',
        'imagen_url',
        'estado_auditoria',
        'fecha_creacion_auditoria'
    ];

    public $timestamps = false;

    public function categoria()
    {
        return $this->belongsTo(Categoria::class, 'id_categoria', 'id_categoria');
    }

    public function productos()
    {
        return $this->hasMany(Producto::class, 'id_subcategoria', 'id_subcategoria');
    }
} 