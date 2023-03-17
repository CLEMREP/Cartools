<?php

namespace App\Jobs;

use App\Models\ElectricalTerminal;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class FetchElectricalTerminalJob implements ShouldQueue
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
        ini_set('memory_limit', '-1');
        $path = 'https://www.data.gouv.fr/fr/datasets/r/7eee8f09-5d1b-4f48-a304-5e99e8da1e26';

        /** @var string $json */
        $json = file_get_contents($path);

        /** @var array $terminals */
        $terminals = json_decode($json, true);

        foreach ($terminals['features'] as $terminal) {
            ElectricalTerminal::updateOrCreate([
                'electrical_terminal_id' => $terminal['properties']['id_station_local'] ?? null,
                'name' => $terminal['properties']['nom_station'],
                'full_address' => $terminal['properties']['adresse_station'],
                'latitude' => $terminal['properties']['consolidated_latitude'],
                'longitude' => $terminal['properties']['consolidated_longitude'],
                'implementation' => $terminal['properties']['implantation_station'],
                'power' => $terminal['properties']['puissance_nominale'],
                'free' => $terminal['properties']['gratuit'],
                'bank_card' => $terminal['properties']['paiement_cb'],
                'other_payment' => $terminal['properties']['paiement_autre'],
                'reservation' => $terminal['properties']['reservation'],
                'access_condition' => $terminal['properties']['condition_acces'],
                'last_update' => $terminal['properties']['date_maj'],
            ]);
        }
    }
}
