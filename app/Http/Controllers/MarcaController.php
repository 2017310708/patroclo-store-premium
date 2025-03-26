<?php

namespace App\Http\Controllers;

use App\Models\Marca;
use Illuminate\Http\Request;

class MarcaController extends Controller
{
    public function index()
    {
        $marcas = Marca::where('estado_auditoria', 'A')
            ->orderBy('nombre')
            ->get();
        
        return view('marcas', compact('marcas'));
    }

    public function productos(Marca $marca)
    {
        $productos = $marca->productos()
            ->where('estado_auditoria', 'A')
            ->get();
        
        return view('marcas.productos', compact('marca', 'productos'));
    }
}