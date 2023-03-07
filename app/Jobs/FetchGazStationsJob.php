<?php

namespace App\Jobs;

use App\Models\GazStation;
use App\Models\Price;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Storage;
use ZipArchive;

class FetchGazStationsJob implements ShouldQueue
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
        $path = 'https://donnees.roulez-eco.fr/opendata/instantane';
        /** @phpstan-ignore-next-line */
        Storage::disk('public')->put('tmp.zip', file_get_contents($path));

        $zip = new ZipArchive;

        $res = $zip->open(Storage::path('public/tmp.zip'));

        if ($res === true) {
            /** @var string $xmlFile */
            $xmlFile = $zip->getFromIndex(0);
            $zip->close();
            $xml = simplexml_load_string($xmlFile);
            /** @var string $json */
            $json = json_encode($xml);
            /** @var array $array */
            $array = json_decode($json, true);

            foreach ($array['pdv'] as $item) {
                $gazStation = GazStation::updateOrCreate(
                    ['gaz_station_id' => $item['@attributes']['id']],
                    [
                        'gaz_station_id' => $item['@attributes']['id'],
                        'latitude' => $item['@attributes']['latitude'],
                        'longitude' => $item['@attributes']['longitude'],
                        'postal_code' => $item['@attributes']['cp'],
                        'pop' => $item['@attributes']['pop'],
                        'address' => $item['adresse'],
                        'city' => $item['ville'],
                    ]
                );

                if (array_key_exists('prix', $item)) {
                    foreach ($item['prix'] as $price) {
                        if (array_key_exists('@attributes', $price)) {
                            Price::updateOrCreate(
                                ['gaz_station_id' => $gazStation->getKey(), 'carburant_id' => $price['@attributes']['id']],
                                [
                                    'gaz_station_id' => $gazStation->getKey(),
                                    'fuel_type' => $price['@attributes']['nom'] ?? null,
                                    'carburant_id' => $price['@attributes']['id'] ?? null,
                                    'price' => $price['@attributes']['valeur'] ?? null,
                                    'last_update' => Carbon::parse($price['@attributes']['maj']),
                                ]
                            );
                        }
                    }
                }
            }
        } else {
            logger('Erreur de zip');
        }
    }
}
