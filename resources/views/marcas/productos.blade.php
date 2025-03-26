@extends('layouts.app')

@section('content')
    <div class="container mx-auto px-4">
        <div class="flex items-center mb-6">
            <a href="{{ route('marcas.index') }}" class="text-blue-600 hover:text-blue-800">
                <svg class="w-6 h-6 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                </svg>
                Volver a Marcas
            </a>
        </div>

        <div class="flex items-center justify-center mb-8 space-x-4">
            @if($marca->logo_url)
                <img src="{{ $marca->logo_url }}" alt="{{ $marca->nombre }}" class="h-16 object-contain">
            @endif
            <h1 class="text-center text-gray-800 text-2xl font-medium">
                Productos de {{ $marca->nombre }}
            </h1>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            @foreach($productos as $producto)
                <a href="{{ route('productos.show', $producto) }}" class="block">
                    <div class="bg-white shadow-lg rounded-lg overflow-hidden hover:shadow-xl transition-shadow duration-300">
                        <div class="relative w-full pt-[75%] bg-gray-50">
                            <img class="absolute inset-0 w-full h-full object-contain p-4" 
                                 src="{{ $producto->imagen_url }}" 
                                 alt="{{ $producto->nombre }}">
                        </div>
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

        @if($productos->isEmpty())
            <div class="text-center text-gray-600 mt-8">
                No hay productos disponibles para esta marca.
            </div>
        @endif
    </div>
@endsection