<?php

namespace App\Http\Resources;

use App\Models\Price;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PriceResource extends JsonResource
{
    /** @var Price */
    public $resource;

    public function toArray(Request $request): array
    {
        return [
            'id' => $this->resource->getKey(),
            'gaz_station_id' => $this->resource->gaz_station_id,
            'carburant_id' => $this->resource->carburant_id,
            'fuel_type' => $this->resource->fuel_type,
            'price' => $this->resource->price,
            'last_update' => $this->resource->last_update,
        ];
    }
}
