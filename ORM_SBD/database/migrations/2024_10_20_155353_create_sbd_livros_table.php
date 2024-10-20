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
        Schema::create('sbd_livros', function (Blueprint $table) {
            $table->id('livro_id');
            $table->string('titulo');
            $table->string('autor');
            $table->string('isbn', 20)->unique();
            $table->integer('ano_publicacao')->nullable();
            $table->enum('status', ['Disponível', 'Emprestado'])->default('Disponível');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sbd_livros');
    }
};
