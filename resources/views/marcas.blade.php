@extends('layouts.app')

@section('content')
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-center text-gray-800 text-2xl font-medium mb-8">
            Nuestras Marcas
        </h1>

        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
            @foreach($marcas as $marca)
                <a href="{{ route('marcas.productos', $marca) }}" class="block">
                    <div class="bg-white shadow-lg rounded-lg overflow-hidden hover:shadow-xl transition-shadow duration-300">
                        <div class="p-4 flex flex-col items-center">
                            @if($marca->logo_url)
                                <div class="w-32 h-32 flex items-center justify-center mb-4">
                                    <img src="{{ $marca->logo_url }}" 
                                         alt="{{ $marca->nombre }}" 
                                         class="max-w-full max-h-full object-contain">
                                </div>
                            @else
                                <div class="w-32 h-32 flex items-center justify-center mb-4 bg-gray-100 rounded-lg">
                                    <span class="text-4xl text-gray-400">
                                        {{ strtoupper(substr($marca->nombre, 0, 1)) }}
                                    </span>
                                </div>
                            @endif

                            <h2 class="text-xl font-semibold text-gray-800 text-center">{{ $marca->nombre }}</h2>
                            
                            @if($marca->codigo_pais)
                                <span class="mt-2 text-sm text-gray-500">
                                    País: {{ $marca->codigo_pais }}
                                </span>
                            @endif

                            <div class="mt-4">
                                <span class="text-sm text-gray-600">
                                    {{ $marca->productos_count ?? $marca->productos()->count() }} productos
                                </span>
                            </div>
                        </div>
                    </div>
                </a>
            @endforeach
        </div>
    </div>
@endsection