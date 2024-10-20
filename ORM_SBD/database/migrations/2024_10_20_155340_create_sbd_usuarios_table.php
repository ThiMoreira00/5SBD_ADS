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
        Schema::create('sbd_usuarios', function (Blueprint $table) {
            $table->id('usuario_id');
            $table->string('nome');
            $table->string('endereco')->nullable();
            $table->string('telefone', 15)->nullable();
            $table->string('email', 100)->unique();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sbd_usuarios');
    }
};
