<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;

Route::apiResource('api/v1/categories', CategoryController::class);