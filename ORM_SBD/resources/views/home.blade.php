@extends('layouts.app')

@section('content')
<div class="text-center">
    <h1 class="mt-5">Bem-vindo ao Sistema de Biblioteca</h1>
    <p class="lead">Gerencie usuários, livros e empréstimos de forma simples e eficiente.</p>
    <div class="mt-4">
        <a href="{{ route('usuarios.index') }}" class="btn btn-primary btn-lg">Usuários</a>
        <a href="{{ route('livros.index') }}" class="btn btn-secondary btn-lg">Livros</a>
        <a href="{{ route('emprestimos.index') }}" class="btn btn-success btn-lg">Empréstimos</a>
    </div>
</div>
@endsection
