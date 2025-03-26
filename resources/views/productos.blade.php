@extends('layouts.app')

@section('content')
    <div class="container mx-auto px-4">
        <div class="flex items-center mb-6">
            <a href="{{ route('subcategorias.index', $subcategoria->categoria) }}" class="text-blue-600 hover:text-blue-800">
                <svg class="w-6 h-6 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                </svg>
                Volver a {{ $subcategoria->categoria->nombre }}
            </a>
        </div>

        <h1 class="text-center text-gray-800 text-2xl font-medium mb-6">
            Productos en {{ $subcategoria->nombre }}
        </h1>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            @foreach($productos as $producto)
                <a href="{{ route('productos.show', $producto) }}" class="block">
                    <div class="bg-white shadow-lg rounded-lg overflow-hidden hover:shadow-xl transition-shadow duration-300">
                        <img class="w-full h-48 object-cover" src="{{ $producto->imagen_url }}" alt="{{ $producto->nombre }}">
                        <div class="p-4">
                            <h2 class="text-xl font-semibold text-gray-800 mb-2">{{ $producto->nombre }}</h2>
                            <p class="text-gray-600 mb-2 line-clamp-2">{{ $producto->descripcion }}</p>
                            <div class="flex justify-between items-center">
                                <span class="text-lg font-bold text-green-600">${{ number_format($producto->precio_dolares, 2) }}</span>
                                <span class="text-sm text-gray-500">Stock: {{ $producto->stock }}</span>
                            </div>
                        </div>
                    </div>
                </a>
            @endforeach
        </div>
    </div>
@endsection 