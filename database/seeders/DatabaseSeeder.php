<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;
use App\Models\Product;
use App\Models\User;
use App\Models\Order;
use App\Models\OrderItem;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Create categories with products
        Category::factory(5)->create()->each(function ($category) {
            Product::factory(10)->create(['category_id' => $category->id]);
        });

        // Create users and orders
        User::factory(10)->create()->each(function ($user) {
            $orders = Order::factory(2)->create(['user_id' => $user->id]);

            foreach ($orders as $order) {
                $items = OrderItem::factory(rand(1, 5))->create(['order_id' => $order->id]);

                // Set order total
                $total = $items->sum(fn ($item) => $item->price * $item->quantity);
                $order->update(['total' => $total]);
            }
        });

        // Create an admin user
        User::factory()->create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'role' => 'admin',
            'password' => bcrypt('admin123'),
        ]);
    }
}
