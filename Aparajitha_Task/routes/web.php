<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RoleController; 
use App\Http\Controllers\UsersController; 
use App\Http\Controllers\ExpenseController;


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

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/userslist', function () {
    return view('userslist');
})->middleware(['auth'])->name('userslist');

 require __DIR__.'/auth.php';

Route::get('/logout', [App\Http\Controllers\Auth\LoginController::class, 'logout'])->name('logout');


Route::get('/usermanagement', [UsersController::class, 'index'])->name('user.management');
Route::get('/userslist', [UsersController::class, 'index'])->name('userslist');
Route::get('/usercreate', [UsersController::class, 'create'])->name('usercreate');
Route::post('/usersave', [UsersController::class, 'store'])->name('usersave');

//Roles routes
Route::get('/rolesmanagement', [RoleController::class, 'index'])->name('role.management') ->middleware(['auth', 'can:viewAny,App\Models\Role']);
Route::get('/add-roles', [RoleController::class, 'addRoles'])->middleware(['auth', 'can:create,App\Models\Role']);
Route::post('/rolesave', [RoleController::class, 'store'])->name('rolesave')->middleware(['auth', 'can:store,App\Models\Role']);
Route::get('/create-roles', [RoleController::class, 'createRoles']);

//Expense routes
Route::get('/expenses', [ExpenseController::class, 'index'])
    ->middleware(['auth', 'can:viewAny,App\Models\Expense'])->name('expense.index');

Route::get('/expenses/create', [ExpenseController::class, 'create'])->name('expense.create')
->middleware(['auth', 'can:create,App\Models\Expense']);
    
Route::post('/expenses', [ExpenseController::class, 'store'])->name('expense.store')
    ->middleware(['auth', 'can:create,App\Models\Expense']);

Route::get('/expenses/{expense}/edit', [ExpenseController::class, 'edit'])->name('expense.edit')
    ->middleware(['auth', 'can:edit,App\Models\Expense']);
    
Route::put('/expenses/{expense}', [ExpenseController::class, 'update'])->name('expense.update')
    ->middleware(['auth', 'can:update,App\Models\Expense']);

Route::delete('/expenses/{expense}', [ExpenseController::class, 'destroy'])->name('expense.destroy')
    ->middleware(['auth', 'can:delete,App\Models\Expense']);


