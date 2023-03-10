<?php

namespace App\Repositories;

use App\Models\GazStation;
use Illuminate\Database\Eloquent\Collection;

class GazStationRepository
{
    public function __construct(
        private readonly GazStation $model
    ) {
    }

    /**
     * @return Collection<int, GazStation>
     */
    public function getGazStations(): Collection
    {
        return $this->model->with('prices')->get();
    }
}
