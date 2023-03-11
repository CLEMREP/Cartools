<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CarController;
use App\Http\Controllers\GazStationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/register', [AuthController::class, 'register'])->name('register');
Route::post('/login', [AuthController::class, 'login'])->name('login');

Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/gaz-stations', [GazStationController::class, 'index'])->name('gaz-stations.index');

    Route::prefix('/car')->name('car.')->group(function () {
        Route::get('/', [CarController::class, 'index'])->name('index');
        Route::get('/{car}', [CarController::class, 'show'])->name('show');
        Route::post('/', [CarController::class, 'store'])->name('store');
        Route::put('/{car}', [CarController::class, 'update'])->name('update');
    });

    Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
});

Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user()->load('car');
});
