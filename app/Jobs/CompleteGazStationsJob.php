<?php

namespace App\Jobs;

use App\Models\GazStation;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class CompleteGazStationsJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $path = 'https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/prix_des_carburants_j_7/exports/json?lang=fr&timezone=Europe%2FParis';
        /** @var string $json */
        $json = file_get_contents($path);

        /** @var array $stations */
        $stations = json_decode($json, true);

        foreach ($stations as $station) {
            $stationExists = GazStation::where('gaz_station_id', $station['id'])->first();
            if ($stationExists) {
                $stationExists->update([
                    'brand' => $station['brand'],
                    'name' => $station['name'],
                ]);
            }
        }
    }
}
