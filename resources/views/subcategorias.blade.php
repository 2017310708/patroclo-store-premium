@extends('layouts.app')

@section('content')
    <div class="container mx-auto px-4">
        <div class="flex items-center mb-6">
            <a href="{{ route('categorias.index') }}" class="text-blue-600 hover:text-blue-800">
                <svg class="w-6 h-6 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                </svg>
                Volver a Categorías
            </a>
        </div>

        <h1 class="text-center text-gray-800 text-2xl font-medium mb-6">
            Subcategorías de {{ $categoria->nombre }}
        </h1>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            @foreach($subcategorias as $subcategoria)
                <a href="{{ route('productos.index', $subcategoria) }}" class="block">
                    <div class="bg-white shadow-lg rounded-lg overflow-hidden hover:shadow-xl transition-shadow duration-300">
                        <img class="w-full h-48 object-cover" src="{{ $subcategoria->imagen_url }}" alt="{{ $subcategoria->nombre }}">
                        <div class="p-4">
                            <h2 class="text-xl font-semibold text-gray-800">{{ $subcategoria->nombre }}</h2>
                        </div>
                    </div>
                </a>
            @endforeach
        </div>
    </div>
@endsection 