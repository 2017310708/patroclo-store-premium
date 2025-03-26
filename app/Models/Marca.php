<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Marca extends Model
{
    protected $table = 'marcas';
    protected $primaryKey = 'id_marca';

    protected $fillable = [
        'nombre',
        'codigo_pais',
        'logo_url',
        'estado_auditoria',
        'fecha_creacion_auditoria'
    ];

    public $timestamps = false;

    public function productos()
    {
        return $this->hasMany(Producto::class, 'id_marca', 'id_marca');
    }
} 