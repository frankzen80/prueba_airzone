## Despliegue del proyecto
1. Descargamos, instalamos y configuramos  la aplicación:

* Obtenemos el proyecto del repositorio
```
    git clone https://github.com/frankzen80/prueba_airzone.git
    cd prueba_airzone
```

* Instalamos dependencias:
```
    composer install
    npm install
```

* Copiamos el fichero .env, generamos la application key del proyecto:
```
    cp .env_example .env
    php artisan key:generate
``` 

Ponemos la application key y configuramos la base de datos en el fichero .env:
```
    ...

    APP_KEY=application_key

    ...

    DB_CONNECTION=mariadb
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=dbprueba_airzone
    DB_USERNAME=usuario
    DB_PASSWORD=clave

    ...

```

2. Importamos la base de datos situada, dentro de la carpeta del proyecto, situada en la ruta ***documents/prueba_tecnica_2024-02-13.sql*** ejecutando el comando ***import*** que he creado en ***app/console/Command/ImportDatabase.php***

```
    php artisan db:import documents/prueba_tecnica_2024-02-13.sql
```

Puntualizar que he realizado los siguientes cambios en la base de datos antes de importarla:
* Por la versión de MariaDB que tengo instalar me obligaba a que algunos campos requerían tener un valor definido por defecto, a lo que he predefinido valor NULL.
* Para evitar posibles conflitctos con tablas que pudieran existir he añadido *** IF EXISTS *** en el comando "CREATE TABLE ...".

3. Ejecutamos Factories y Seeders
```
    php artisan db:seed
```


4. API-CRUD para categorias

* Listar todo
```
    curl -i -H "Accept: application/json" -H "Content-type: application/json" http://127.0.0.1:8000/api/categories
```

* Crear nuevo registro
```
    curl -i -H "Accept: application/json" -H "Content-type: application/json"  -d '{"name":"Symfony", "slug":"symfony","visible":true}' http://127.0.0.1:8000/api/categories
```

* Actualizar registro

```
    curl -i -H "Accept: application/json" -H "Content-type: application/json"  -d '{"name":"CodeIgniter", "slug":"code-igniter", "visible":true}' -X PATCH http://127.0.0.1:8000/api/categories/{id}
```

* Eliminar registro
```
    curl -i -H "Accept: application/json" -H "Content-type: application/json" -X DELETE http://127.0.0.1:8000/api/categories/{id}
```

5. API - Consutar post
```
curl -i -H "Accept: application/json" -H "Content-type: application/json" http://127.0.0.1:8000/api/post/3
```

6. Ejecutamos PHPUnit para hacer tesing

Encontrarás los ficheros de testing en la ruta ***tests/Unit***.
```
php artisan test --testsuite=Unit
```

