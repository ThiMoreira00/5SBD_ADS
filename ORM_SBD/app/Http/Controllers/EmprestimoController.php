<?php

namespace App\Http\Controllers;

use App\Models\Emprestimo;
use App\Models\Usuario;
use App\Models\Livro;
use Illuminate\Http\Request;

class EmprestimoController extends Controller
{
    public function index()
    {
        $emprestimos = Emprestimo::with(['usuario', 'livro'])->get();
        return view('emprestimos.index', compact('emprestimos'));
    }

    public function create()
    {
        $usuarios = Usuario::all();
        $livros = Livro::all();
        return view('emprestimos.create', compact('usuarios', 'livros'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'usuario_id' => 'required|exists:sbd_usuarios,usuario_id',
            'livro_id' => 'required|exists:sbd_livros,livro_id',
            'data_emprestimo' => 'required|date',
            'data_devolucao_prevista' => 'required|date',
        ]);
        Emprestimo::create($request->all());
        return redirect()->route('emprestimos.index');
    }

    public function show(Emprestimo $emprestimo)
    {
        return view('emprestimos.show', compact('emprestimo'));
    }

    public function edit(Emprestimo $emprestimo)
    {
        $usuarios = Usuario::all();
        $livros = Livro::all();
        return view('emprestimos.edit', compact('emprestimo', 'usuarios', 'livros'));
    }

    public function update(Request $request, Emprestimo $emprestimo)
    {
        $request->validate([
            'usuario_id' => 'required|exists:sbd_usuarios,usuario_id',
            'livro_id' => 'required|exists:sbd_livros,livro_id',
        ]);
        $emprestimo->update($request->all());
        return redirect()->route('emprestimos.index');
    }

    public function destroy(Emprestimo $emprestimo)
    {
        $emprestimo->delete();
        return redirect()->route('emprestimos.index');
    }
}
