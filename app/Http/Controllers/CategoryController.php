<?php

namespace App\Http\Controllers;

use App\Models\Category;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Validation\ValidationException;
use Exception;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {

            $categories = Category::all();
            return response()->json($categories);

        } catch (Exception $e) {

            return response()->json(['error' => 'Se produjo un error'], 500);
        }

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {

            $validatedData = $request->validate(Category::rules());
            $validatedData['slug'] = Str::slug($validatedData['name']);

            $category = Category::create($validatedData);

            return response()->json($category, 201, [], JSON_PRETTY_PRINT);

        } catch (ValidationException $e) {

            return response()->json(['error' => 'Error al intentar actualizar datos', 'messages' => $e->errors()], 422);

        } catch (Exception $e) {

            return response()->json(['error' => 'Se produjo un error'], 500);

        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Category $category)
    {
        try {

            return response()->json($category);

         } catch (ModelNotFoundException $e) {

            return response()->json(['error' => 'Categoría no encontrada'], 404);

        } catch (\Exception $e) {

            return response()->json(['error' => 'Se produjo un error'], 500);
            
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Category $category)
    {
        try {

            $validatedData = $request->validate(Category::rules());
            $validatedData['slug'] = Str::slug($validatedData['name']);

            $category->update($validatedData);

            return response()->json(['success' => 'Registro ' . $category->id . ' actualizado correctamente']);

        } catch (ValidationException $e) {

            return response()->json(['error' => 'Error al actualizar', 'messages' => $e->errors()], 422);

        } catch (Exception $e) {

            return response()->json(['error' => 'Se produjo un error'], 500);

        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Category $category)
    {
        try {

            $category->delete();
            return response()->json(['success' => 'Registro '.$category->id.' eliminado'], 204);

        } catch (Exception $e) {

            return response()->json(['error' => 'Se produjo un error al intentar eliminar un registro'], 500);

        }
    }
}