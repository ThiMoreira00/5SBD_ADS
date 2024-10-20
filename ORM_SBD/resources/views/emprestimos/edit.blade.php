@extends('layouts.app')

@section('content')
<h1>Editar Empréstimo</h1>
<form action="{{ route('emprestimos.update', $emprestimo) }}" method="POST">
    @csrf
    @method('PUT')
    <div class="mb-3">
        <label for="usuario_id" class="form-label">Usuário</label>
        <select class="form-select" id="usuario_id" name="usuario_id" required>
            @foreach($usuarios as $usuario)
                <option value="{{ $usuario->usuario_id }}" {{ $usuario->usuario_id == $emprestimo->usuario_id ? 'selected' : '' }}>
                    {{ $usuario->nome }}
                </option>
            @endforeach
        </select>
    </div>
    <div class="mb-3">
        <label for="livro_id" class="form-label">Livro</label>
        <select class="form-select" id="livro_id" name="livro_id" required>
            @foreach($livros as $livro)
                <option value="{{ $livro->livro_id }}" {{ $livro->livro_id == $emprestimo->livro_id ? 'selected' : '' }}>
                    {{ $livro->titulo }}
                </option>
            @endforeach
        </select>
    </div>
    <div class="mb-3">
        <label for="data_emprestimo" class="form-label">Data de Empréstimo</label>
        <input type="date" class="form-control" id="data_emprestimo" name="data_emprestimo" value="{{ $emprestimo->data_emprestimo }}" required>
    </div>
    <div class="mb-3">
        <label for="data_devolucao_prevista" class="form-label">Data de Devolução Prevista</label>
        <input type="date" class="form-control" id="data_devolucao_prevista" name="data_devolucao_prevista" value="{{ $emprestimo->data_devolucao_prevista }}" required>
    </div>
    <button type="submit" class="btn btn-primary">Atualizar</button>
    <a href="{{ route('emprestimos.index') }}" class="btn btn-secondary">Voltar</a>
</form>
@endsection
