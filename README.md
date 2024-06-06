## Despliegue del proyecto

1. Importamos la base de datos ejecutando el comando ImportDatabase que he creado en ***app/console/Command/ImportDatabase.php***
    Este primer paso solo es necesario hacerlo en caso de crear un proyecto desde 0 pues la base de dato ya se encuentra importada en dicho proyecto.
```
	php artisan db:import /ruta/del/fichero.sql
```

2. Ejecutamos Factories y Seeders
```
    php artisan db:seed
```