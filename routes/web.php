<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\SubcategoriaController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\MarcaController;

Route::get('/', function () { return view('welcome'); });

Route::get('/categorias', [CategoriaController::class, 'index'])->name('categorias.index');
Route::get('/categorias/{categoria}/subcategorias', [SubcategoriaController::class, 'index'])->name('subcategorias.index');
Route::get('/subcategorias/{subcategoria}/productos', [ProductoController::class, 'index'])->name('productos.index');
Route::get('/productos', [ProductoController::class, 'todos'])->name('productos.todos');
Route::get('/productos/{producto}', [ProductoController::class, 'show'])->name('productos.show');
Route::get('/marcas', [MarcaController::class, 'index'])->name('marcas.index');
Route::get('/marcas/{marca}/productos', [MarcaController::class, 'productos'])->name('marcas.productos');
