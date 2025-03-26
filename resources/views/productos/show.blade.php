@extends('layouts.app')

@section('content')
    <div class="container mx-auto px-4 py-8">
        <div class="flex items-center mb-6">
            <a href="{{ route('productos.index', $producto->subcategoria) }}" class="text-blue-600 hover:text-blue-800">
                <svg class="w-6 h-6 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                </svg>
                Volver a {{ $producto->subcategoria->nombre }}
            </a>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <!-- Carousel -->
            <div class="relative" x-data="{ activeSlide: 0 }">
                <div class="relative">
                    @foreach($producto->imagenes as $index => $imagen)
                        <div x-show="activeSlide === {{ $index }}"
                             x-transition:enter="transition ease-out duration-300"
                             x-transition:enter-start="opacity-0 transform scale-90"
                             x-transition:enter-end="opacity-100 transform scale-100"
                             class="aspect-w-4 aspect-h-3">
                            <img src="{{ $imagen->imagen_url }}" alt="{{ $producto->nombre }}" class="object-cover rounded-lg shadow-lg">
                        </div>
                    @endforeach

                    <!-- Prev/Next Arrows -->
                    <div class="absolute inset-0 flex">
                        <div class="flex items-center justify-start w-1/2">
                            <button 
                                class="bg-gray-900 text-white p-2 rounded-full bg-opacity-50 hover:bg-opacity-75 focus:outline-none ml-2"
                                x-on:click="activeSlide = activeSlide === 0 ? {{ count($producto->imagenes) - 1 }} : activeSlide - 1">
                                ❮
                            </button>
                        </div>
                        <div class="flex items-center justify-end w-1/2">
                            <button 
                                class="bg-gray-900 text-white p-2 rounded-full bg-opacity-50 hover:bg-opacity-75 focus:outline-none mr-2"
                                x-on:click="activeSlide = activeSlide === {{ count($producto->imagenes) - 1 }} ? 0 : activeSlide + 1">
                                ❯
                            </button>
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="absolute w-full flex justify-center gap-2 -bottom-10">
                        @foreach($producto->imagenes as $index => $imagen)
                            <button 
                                class="w-3 h-3 rounded-full transition-colors duration-200"
                                :class="activeSlide === {{ $index }} ? 'bg-blue-600' : 'bg-gray-300'"
                                x-on:click="activeSlide = {{ $index }}">
                            </button>
                        @endforeach
                    </div>
                </div>
            </div>

            <!-- Product Info -->
            <div class="space-y-6">
                <div class="border-b pb-6">
                    <h1 class="text-3xl font-bold text-gray-900 mb-2">{{ $producto->nombre }}</h1>
                    <div class="flex items-center gap-4">
                        @if($producto->marca)
                            <div class="flex items-center">
                                @if($producto->marca->logo_url)
                                    <img src="{{ $producto->marca->logo_url }}" alt="{{ $producto->marca->nombre }}" class="h-8 w-auto">
                                @endif
                                <span class="ml-2 text-gray-600">{{ $producto->marca->nombre }}</span>
                            </div>
                        @endif
                        <span class="text-2xl font-bold text-green-600">${{ number_format($producto->precio_dolares, 2) }}</span>
                    </div>
                </div>

                <div class="space-y-4">
                    <div>
                        <h2 class="text-xl font-semibold mb-2">Descripción</h2>
                        <p class="text-gray-600">{{ $producto->descripcion }}</p>
                    </div>

                    <div>
                        <h2 class="text-xl font-semibold mb-2">Especificaciones</h2>
                        <p class="text-gray-600">{{ $producto->especificaciones }}</p>
                    </div>

                    <div class="flex items-center gap-4">
                        <span class="text-gray-600">Stock disponible: {{ $producto->stock }}</span>
                        <span class="text-gray-600">Código: {{ $producto->codigo }}</span>
                    </div>

                    @if($producto->informacion_fabricante_url)
                        <a href="{{ $producto->informacion_fabricante_url }}" 
                           target="_blank"
                           class="inline-block bg-gray-100 hover:bg-gray-200 text-gray-800 px-4 py-2 rounded">
                            Información del fabricante
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection 