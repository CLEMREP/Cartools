<?php

namespace App\Console\Commands;

use App\Jobs\FetchElectricalTerminalJob;
use Illuminate\Console\Command;

class FetchElectricalTerminalCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'electrical-terminals:fetch';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Fetch electrical terminals from the API';

    /**
     * Execute the console command.
     */
    public function handle(): void
    {
        FetchElectricalTerminalJob::dispatch();
    }
}
