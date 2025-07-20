<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\AdminDashboardController;
use App\Http\Controllers\FrontendController;

// ----------------------------------
// Public Routes
// ----------------------------------

// Home Page
Route::get('/', [FrontendController::class, 'home'])->name('home');

// Product Listing & Details
Route::get('/products', [FrontendController::class, 'products'])->name('products.index');
Route::get('/product/{id}', [FrontendController::class, 'showProduct'])->name('products.show');

// Cart
Route::get('/cart', [FrontendController::class, 'cart'])->name('cart.view');
Route::post('/cart/add/{id}', [FrontendController::class, 'addToCart'])->name('cart.add');
Route::post('/cart/remove/{id}', [FrontendController::class, 'removeFromCart'])->name('cart.remove');

// ----------------------------------
// Authenticated User Routes
// ----------------------------------

Route::middleware(['auth', 'verified'])->group(function () {
    // Dashboard
    Route::get('/dashboard', fn () => view('dashboard'))->name('dashboard');
    
    // Profile
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Checkout
    Route::get('/checkout', [FrontendController::class, 'checkout'])->name('checkout.form');
    Route::post('/checkout', [FrontendController::class, 'processCheckout'])->name('checkout.process');

    // Order success
    Route::get('/order-success', [FrontendController::class, 'orderSuccess'])->name('order.success');
});

// ----------------------------------
// Admin Routes (Requires role: admin)
// ----------------------------------

Route::middleware(['auth', 'App\Http\Middleware\CheckRole:admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/dashboard', [AdminDashboardController::class, 'index'])->name('admindashboard');
    Route::resource('categories', CategoryController::class);
    Route::resource('products', ProductController::class);
});

// ----------------------------------
// Auth Routes (Breeze/Fortify/etc.)
// ----------------------------------

Route::get('/test-role', function () {
    return 'Role middleware works!';
})->middleware('rolemiddleware:admin');

Route::get('/check-container', function() {
    try {
        app('role');
        return 'Role binding exists in container';
    } catch (\Exception $e) {
        return 'Role binding error: ' . $e->getMessage();
    }
});

Route::get('/health', fn() => response()->json(['status' => 'OK']));

require __DIR__.'/auth.php';
