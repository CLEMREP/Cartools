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
        Schema::create('electrical_terminals', function (Blueprint $table) {
            $table->id();
            $table->string('electrical_terminal_id')->nullable();
            $table->string('name');
            $table->string('full_address');
            $table->bigInteger('latitude');
            $table->bigInteger('longitude');
            $table->string('implementation');
            $table->integer('power');
            $table->string('free');
            $table->string('bank_card');
            $table->string('other_payment');
            $table->string('reservation');
            $table->string('access_condition');
            $table->date('last_update');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('electrical_terminal');
    }
};
