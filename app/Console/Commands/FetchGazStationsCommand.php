<?php

namespace App\Console\Commands;

use App\Jobs\CompleteGazStationsJob;
use App\Jobs\FetchGazStationsJob;
use Illuminate\Console\Command;

class FetchGazStationsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'gaz-stations:fetch';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Fetch date from roulez-eco.fr';

    /**
     * Execute the console command.
     */
    public function handle(): void
    {
        FetchGazStationsJob::dispatch();
        CompleteGazStationsJob::dispatch();
    }
}
