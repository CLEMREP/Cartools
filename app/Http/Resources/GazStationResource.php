<?php

namespace App\Http\Resources;

use App\Models\GazStation;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class GazStationResource extends JsonResource
{
    /** @var GazStation */
    public $resource;

    /**
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->resource->getKey(),
            'station_id' => $this->resource->gaz_station_id,
            'name' => $this->resource->name,
            'brand' => $this->resource->brand,
            'latitude' => $this->resource->latitude,
            'longitude' => $this->resource->longitude,
            'postal_code' => $this->resource->postal_code,
            'city' => $this->resource->city,
            'address' => $this->resource->address,
            'pop' => $this->resource->pop,
            'prices' => PriceResource::collection($this->whenLoaded('prices')),
        ];
    }
}
