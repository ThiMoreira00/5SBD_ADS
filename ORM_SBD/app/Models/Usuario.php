<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    use HasFactory;

    protected $table = 'sbd_usuarios'; // Nome da tabela
    protected $primaryKey = 'usuario_id'; // Chave primária
    protected $fillable = ['nome', 'endereco', 'telefone', 'email']; // Campos que podem ser preenchidos
    public $timestamps = false; // Desabilita timestamps
}
