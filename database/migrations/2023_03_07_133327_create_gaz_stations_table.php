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
        Schema::create('gaz_stations', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('brand')->nullable();
            $table->integer('gaz_station_id');
            $table->bigInteger('latitude');
            $table->bigInteger('longitude');
            $table->string('postal_code');
            $table->string('city');
            $table->string('address');
            $table->string('pop');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('gaz_stations');
    }
};
