<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;

class SubcategoriaController extends Controller
{
    public function index(Categoria $categoria)
    {
        $subcategorias = $categoria->subcategorias()->where('estado_auditoria', 'A')->get();
        return view('subcategorias', compact('subcategorias', 'categoria'));
    }
} 