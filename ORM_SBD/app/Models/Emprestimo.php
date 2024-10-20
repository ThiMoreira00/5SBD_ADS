<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Emprestimo extends Model
{
    use HasFactory;

    protected $table = 'sbd_emprestimos'; // Nome da tabela
    protected $primaryKey = 'emprestimo_id'; // Chave primária
    protected $fillable = ['usuario_id', 'livro_id', 'data_emprestimo', 'data_devolucao_prevista', 'data_devolucao']; // Campos que podem ser preenchidos

    // Relacionamento com Usuario
    public function usuario()
    {
        return $this->belongsTo(Usuario::class, 'usuario_id', 'usuario_id');
    }

    // Relacionamento com Livro
    public function livro()
    {
        return $this->belongsTo(Livro::class, 'livro_id', 'livro_id');
    }
}
