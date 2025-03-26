<?php

namespace App\Http\Controllers;

use App\Models\Subcategoria;
use App\Models\Producto;
use Illuminate\Http\Request;

class ProductoController extends Controller
{
    public function index(Subcategoria $subcategoria)
    {
        $productos = $subcategoria->productos()->where('estado_auditoria', 'A')->get();
        return view('productos', compact('productos', 'subcategoria'));
    }

    public function show(Producto $producto)
    {
        $producto->load(['marca', 'imagenes']);
        return view('productos.show', compact('producto'));
    }

    public function todos()
    {
        $productos = Producto::where('estado_auditoria', 'A')->get();
        return view('todos-productos', compact('productos'));
    }
}