@extends('layouts.app')

@section('content')
<h1>Criar Novo Livro</h1>
<form action="{{ route('livros.store') }}" method="POST">
    @csrf
    <div class="mb-3">
        <label for="titulo" class="form-label">Título</label>
        <input type="text" class="form-control" id="titulo" name="titulo" required>
    </div>
    <div class="mb-3">
        <label for="autor" class="form-label">Autor</label>
        <input type="text" class="form-control" id="autor" name="autor" required>
    </div>
    <div class="mb-3">
        <label for="isbn" class="form-label">ISBN</label>
        <input type="text" class="form-control" id="isbn" name="isbn" required>
    </div>
    <div class="mb-3">
        <label for="ano_publicacao" class="form-label">Ano de Publicação</label>
        <input type="number" class="form-control" id="ano_publicacao" name="ano_publicacao">
    </div>
    <div class="mb-3">
        <label for="status" class="form-label">Status</label>
        <select class="form-select" id="status" name="status">
            <option value="Disponível">Disponível</option>
            <option value="Emprestado">Emprestado</option>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Criar</button>
    <a href="{{ route('livros.index') }}" class="btn btn-secondary">Voltar</a>
</form>
@endsection
