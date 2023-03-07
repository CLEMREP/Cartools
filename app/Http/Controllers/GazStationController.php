<?php

namespace App\Http\Controllers;

use App\Http\Resources\GazStationResource;
use App\Repositories\GazStationRepository;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class GazStationController extends Controller
{
    public function __construct(
        private readonly GazStationRepository $gazStationRepository
    ) {
    }

    public function index(Request $request): AnonymousResourceCollection
    {
        return GazStationResource::collection($this->gazStationRepository->getGazStations());
    }
}
