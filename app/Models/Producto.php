<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    protected $table = 'productos';
    protected $primaryKey = 'id_producto';

    protected $fillable = [
        'id_subcategoria',
        'id_marca',
        'id_proveedor',
        'codigo',
        'nombre',
        'descripcion',
        'especificaciones',
        'precio_dolares',
        'stock',
        'imagen_url',
        'informacion_fabricante_url',
        'estado_auditoria',
        'fecha_creacion_auditoria'
    ];

    public $timestamps = false;

    public function subcategoria()
    {
        return $this->belongsTo(Subcategoria::class, 'id_subcategoria', 'id_subcategoria');
    }

    public function marca()
    {
        return $this->belongsTo(Marca::class, 'id_marca', 'id_marca');
    }

    public function imagenes()
    {
        return $this->hasMany(ProductoImagen::class, 'id_producto', 'id_producto');
    }
} 