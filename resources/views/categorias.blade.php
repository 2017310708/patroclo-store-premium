@extends('layouts.app')


@section('content')
    <h1 class="text-center text-gray-800 text-2xl font-medium">Elige una categoria</h1>

    <div class="flex flex-wrap justify-evenly mt-4 gap-4">

        @foreach($categorias as $categoria)

            <a href="{{ route('subcategorias.index', $categoria) }}" class="block">
                <div class="bg-gray-200 hover:bg-gray-300 w-[300px] h-[200px] p-4 rounded cursor-pointer">
                    <img class="h-[130px] w-full object-cover rounded" src="{{ $categoria->imagen_url }}" alt="{{ $categoria->nombre }}">
                    <p class="text-center mt-3 font-medium text-gray-800">{{ $categoria->nombre }}</p>
                </div>
            </a>

        @endforeach

    </div>

@endsection
