<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCarRequest;
use App\Http\Requests\UpdateCarRequest;
use App\Models\Car;
use App\Repositories\CarRepository;
use Illuminate\Http\JsonResponse;

class CarController extends Controller
{
    public function __construct(
        private readonly CarRepository $carRepository,
    ) {
    }

    public function store(StoreCarRequest $request): JsonResponse
    {
        /** @var array $data */
        $data = $request->validated();

        $car = $this->carRepository->create($data);

        return response()->json($car, 201);
    }

    public function show(Car $car): JsonResponse
    {
        return response()->json($car);
    }

    public function update(UpdateCarRequest $request, Car $car): JsonResponse
    {
        /** @var array $data */
        $data = $request->validated();

        $this->carRepository->update($data, $car);

        return response()->json($car);
    }
}
