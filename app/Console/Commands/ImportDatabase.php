<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class ImportDatabase extends Command
{
    protected $signature = 'db:import {file}';
    protected $description = 'Import a MySQL database from a .sql file';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        $file = $this->argument('file');

        if (!File::exists($file)) {
            $this->error('File does not exist.');
            return;
        }

        $sql = File::get($file);
        DB::unprepared($sql);

        $this->info('Database imported successfully.');
    }
}
