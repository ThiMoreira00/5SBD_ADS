<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sbd_emprestimos', function (Blueprint $table) {
            $table->id('emprestimo_id');
            $table->unsignedBigInteger('usuario_id');
            $table->unsignedBigInteger('livro_id');
            $table->date('data_emprestimo');
            $table->date('data_devolucao_prevista');
            $table->date('data_devolucao')->nullable();
            
            // Definindo as chaves estrangeiras
            $table->foreign('usuario_id')->references('usuario_id')->on('sbd_usuarios')->onDelete('cascade');
            $table->foreign('livro_id')->references('livro_id')->on('sbd_livros')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sbd_emprestimos');
    }
};
