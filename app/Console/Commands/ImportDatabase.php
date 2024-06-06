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
        try {
            
            // Obtener el argumento 'file' proporcionado al comando, que representa la ruta del archivo SQL.
            $file = $this->argument('file');

            // Verificar si el archivo especificado existe en el sistema de archivos.
            if (!File::exists($file)) {
                // Mostrar un mensaje de error si el archivo no existe y terminar el proceso.
                $this->error('El fichero no existe');
                return;
            }

            // Leer el contenido del archivo SQL.
            $sql = File::get($file);
            
            // Ejecutar las declaraciones SQL contenidas en el archivo sin preparación previa.
            // Esto es útil para ejecutar múltiples declaraciones SQL a la vez.
            DB::unprepared($sql);

            // Mostrar un mensaje de éxito si la importación de la base de datos fue exitosa.
            $this->info('Database imported successfully.');
          
        } catch (\Exception $e) {
            
                // Capturar cualquier excepción que ocurra durante el proceso y mostrar el mensaje de error.
                $this->info($e->getMessage());
        }   
    }
}
