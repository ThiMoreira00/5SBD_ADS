@extends('layouts.app')

@section('content')
<h1>Lista de Livros</h1>
<a href="{{ route('livros.create') }}" class="btn btn-success mb-3">Adicionar Livro</a>
<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Autor</th>
            <th>ISBN</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        @foreach($livros as $livro)
        <tr>
            <td>{{ $livro->livro_id }}</td>
            <td>{{ $livro->titulo }}</td>
            <td>{{ $livro->autor }}</td>
            <td>{{ $livro->isbn }}</td>
            <td>
                <a href="{{ route('livros.edit', $livro) }}" class="btn btn-warning btn-sm">Editar</a>
                <form action="{{ route('livros.destroy', $livro) }}" method="POST" style="display:inline;">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-danger btn-sm">Excluir</button>
                </form>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
@endsection
