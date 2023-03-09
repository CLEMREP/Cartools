<?php

namespace App\Repositories;

use App\Models\Car;
use Illuminate\Database\Eloquent\Collection;

class CarRepository
{
    public function __construct(
        private readonly Car $model
    ) {
    }

    public function all(): Collection
    {
        return $this->model->all();
    }

    public function create(array $data): Car
    {
        return $this->model->create($data);
    }

    public function update(array $data, Car $car): bool
    {
        return $car->update($data);
    }
}
