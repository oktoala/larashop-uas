<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Models\Category;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Auth::routes();

Route::match(["GET", "POST"], "/register", function() {
    return redirect("/login");
})->name("register");

Route::get('/', function() {
    return view("auth.login");
});

Route::resource("users", UserController::class);
Route::resource("categories", Category::class);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
