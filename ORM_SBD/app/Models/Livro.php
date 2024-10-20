<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Livro extends Model
{
    use HasFactory;

    protected $table = 'sbd_livros'; // Nome da tabela
    protected $primaryKey = 'livro_id'; // Chave primária
    protected $fillable = ['titulo', 'autor', 'isbn', 'ano_publicacao', 'status']; // Campos que podem ser preenchidos
}
