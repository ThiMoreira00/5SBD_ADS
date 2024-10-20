<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\LivroController;
use App\Http\Controllers\EmprestimoController;

Route::get('/', function () {
    return view('home'); // Redireciona para a view home.blade.php
})->name('home'); // Nomeia a rota como 'home'

// Supondo que você já tenha suas rotas de CRUD definidas
Route::resource('usuarios', UsuarioController::class);
Route::resource('livros', LivroController::class);
Route::resource('emprestimos', EmprestimoController::class);