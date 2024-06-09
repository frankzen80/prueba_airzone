## Despliegue del proyecto

1. Importamos la base de datos ejecutando el comando ImportDatabase que he creado en ***app/console/Command/ImportDatabase.php***
Puntualizar que he realizado los siguientes cambios en la base de datos antes de importarla:
* Por la versión de MariaDB que tengo instalar me obligaba a que algunos campos requerían tener un valor definido por defecto, a lo que he predefinido valor NULL.
* Para evitar conflitcto tabla IF EXISTS
* 

```
	php artisan db:import /ruta/del/fichero.sql
```


2. Ejecutamos Factories y Seeders
```
    php artisan db:seed
```


3. API-CRUD para categorias

* Listar todo
```
curl -i -H "Accept: application/json" -H "Content-type: application/json" http://127.0.0.1:8001/api/categories
```

* Crear nuevo registro
```
curl -i -H "Accept: application/json" -H "Content-type: application/json"  -d '{"name":"Symfony", "slug":"symfony","visible":true}' http://127.0.0.1:8001/api/categories
```

* Actualizar registro

```
curl -i -H "Accept: application/json" -H "Content-type: application/json"  -d '{"name":"CodeIgniter", "slug":"code-igniter", "visible":true}' -X PATCH http://127.0.0.1:8001/api/categories/{id}
```

* Eliminar registro
```
curl -i -H "Accept: application/json" -H "Content-type: application/json" -X DELETE http://127.0.0.1:8001/api/categories/{id}
```