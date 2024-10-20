@extends('layouts.app')

@section('content')
<h1>Editar Livro</h1>
<form action="{{ route('livros.update', $livro) }}" method="POST">
    @csrf
    @method('PUT')
    <div class="mb-3">
        <label for="titulo" class="form-label">Título</label>
        <input type="text" class="form-control" id="titulo" name="titulo" value="{{ $livro->titulo }}" required>
    </div>
    <div class="mb-3">
        <label for="autor" class="form-label">Autor</label>
        <input type="text" class="form-control" id="autor" name="autor" value="{{ $livro->autor }}" required>
    </div>
    <div class="mb-3">
        <label for="isbn" class="form-label">ISBN</label>
        <input type="text" class="form-control" id="isbn" name="isbn" value="{{ $livro->isbn }}" required>
    </div>
    <div class="mb-3">
        <label for="ano_publicacao" class="form-label">Ano de Publicação</label>
        <input type="number" class="form-control" id="ano_publicacao" name="ano_publicacao" value="{{ $livro->ano_publicacao }}">
    </div>
    <div class="mb-3">
        <label for="status" class="form-label">Status</label>
        <select class="form-select" id="status" name="status">
            <option value="Disponível" {{ $livro->status == 'Disponível' ? 'selected' : '' }}>Disponível</option>
            <option value="Emprestado" {{ $livro->status == 'Emprestado' ? 'selected' : '' }}>Emprestado</option>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Atualizar</button>
    <a href="{{ route('livros.index') }}" class="btn btn-secondary">Voltar</a>
</form>
@endsection
