<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Http\Controllers\CategoryController;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

use Mockery;

class CategoryCRUDTest extends TestCase
{
    use DatabaseTransactions; // Trait para resetear la base de datos antes de cada prueba

    /**
     * Prueba para el método index que devuelve todas las categorías.
     */
    public function testIndex()
    {
        $categories = Category::factory()->count(3)->make();
        $categoryMock = Mockery::mock(Category::class);
        $categoryMock->shouldReceive('all')->andReturn($categories);

        $controller = new CategoryController();
        $response = $controller->index();

        $this->assertEquals(200, $response->status());
    }

    /**
     * Prueba para el método store que crea una nueva categoría.
     */
    public function testStore()
    {
        // Datos para la nueva categoría
        $data = [
            'name' => 'Categoría de Prueba',
            'slug' => 'Descripción de la categoría de prueba',
            'visible' => true
        ];

        // Creamos una instancia de Request con los datos de la nueva categoría
        $request = new Request($data);

        // Creamos una categoría ficticia usando el factory con los datos
        $category = Category::factory()->make($data);

        // Simulamos que el método Category::create() devuelve la categoría creada
        $categoryMock = Mockery::mock(Category::class);
        $categoryMock->shouldReceive('create')->andReturn($category);

        // Creamos una instancia del controlador
        $controller = new CategoryController();

        // Llamamos al método store y obtenemos la respuesta
        $response = $controller->store($request);

        // Verificamos que la respuesta tenga un código de estado 201 (Created)
        $this->assertEquals(201, $response->status());
    }


    /**
     * Prueba para el método show que muestra una categoría específica.
     */
    public function testShow()
    {
        // Creamos una categoría ficticia usando el factory
        $category = Category::factory()->make();

        // Creamos una instancia del controlador
        $controller = new CategoryController();

        // Llamamos al método show y obtenemos la respuesta
        $response = $controller->show($category);

        // Verificamos que la respuesta tenga un código de estado 200 (OK)
        $this->assertEquals(200, $response->status());

    }

    /**
     * Prueba para el método update que actualiza una categoría existente.
     */
    public function testUpdate()
    {
        // Creamos una categoría ficticia usando el factory
        $category = Category::factory()->make();

        // Datos para actualizar la categoría
        $data = [
            'name' => 'Cake',
            'slug' => 'cake',
            'visible' => true
        ];

        // Creamos una instancia de Request con los nuevos datos
        $request = new Request($data);

        // Simulamos que el método $category->update() devuelve true
        $categoryMock = Mockery::mock(Category::class);
        $categoryMock->shouldReceive('update')->andReturn($category);

        // Creamos una instancia del controlador
        $controller = new CategoryController();

        // Llamamos al método update y obtenemos la respuesta
        $response = $controller->update($request, $category);

        // Verificamos que la respuesta tenga un código de estado 200 (OK)
        $this->assertEquals(200, $response->status());

    }

    /**
     * Prueba para el método destroy que elimina una categoría existente.
     */
    public function testDestroy()
    {
        // Creamos una categoría ficticia usando el factory
        $category = Category::factory()->make();
        
        // Creamos una categoría ficticia usando el factory
        $categoryMock = Mockery::mock(Category::class);
        $categoryMock->shouldReceive('delete')->andReturn($category);

         // Creamos una instancia del controlador
        $controller = new CategoryController();
        
        // Llamamos al método destroy y obtenemos la respuesta
        $response = $controller->destroy($category);

        // Verificamos que la respuesta tenga un código de estado 204 (No Content)
        $this->assertEquals(204, $response->status());

        // Verificamos que el contenido del JSON sea "['success' => 'Registro ' . $category->id . ' eliminado']"
        $this->assertEquals(['success' => 'Registro ' . $category->id . ' eliminado'], $response->getData(true));
    }
}