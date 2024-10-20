@extends('layouts.app')

@section('content')
<h1>Lista de Empréstimos</h1>
<a href="{{ route('emprestimos.create') }}" class="btn btn-success mb-3">Adicionar Empréstimo</a>
<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Usuário</th>
            <th>Livro</th>
            <th>Data de Empréstimo</th>
            <th>Data de Devolução Prevista</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        @foreach($emprestimos as $emprestimo)
        <tr>
            <td>{{ $emprestimo->emprestimo_id }}</td>
            <td>{{ $emprestimo->usuario->nome }}</td>
            <td>{{ $emprestimo->livro->titulo }}</td>
            <td>{{ $emprestimo->data_emprestimo }}</td>
            <td>{{ $emprestimo->data_devolucao_prevista }}</td>
            <td>
                <a href="{{ route('emprestimos.edit', $emprestimo) }}" class="btn btn-warning btn-sm">Editar</a>
                <form action="{{ route('emprestimos.destroy', $emprestimo) }}" method="POST" style="display:inline;">
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
