<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\PostController;

Route::resource('categories', CategoryController::class);
Route::get('post/{id}', [PostController::class, 'show']);