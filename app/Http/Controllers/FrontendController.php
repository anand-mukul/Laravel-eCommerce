<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FrontendController extends Controller
{
    /**
     * Show home page with products and categories
     */
    public function home()
    {
        $products = Product::latest()->paginate(12);
        $categories = Category::all();

        return view('user.products', compact('products', 'categories'));
    }

    /**
     * Show all products
     */
    public function products()
    {
        $products = Product::latest()->paginate(12);
        $categories = Category::all();

        return view('user.products', compact('products', 'categories'));
    }

    /**
     * Show single product
     */
    public function showProduct($id)
    {
        $product = Product::findOrFail($id);
        return view('user.product_detail', compact('product'));
    }

    /**
     * Show cart page
     */
    public function cart()
    {
        $cart = session()->get('cart', []);
        return view('user.cart', compact('cart'));
    }

    /**
     * Add product to cart
     */
 public function addToCart(Request $request, $id)
{
    $product = Product::findOrFail($id);

    $cart = session()->get('cart', []);

    if (isset($cart[$id])) {
        $cart[$id]['quantity']++;
    } else {
        $cart[$id] = [
            'id' => $product->id,
            'name' => $product->name,
            'price' => $product->price,
            'quantity' => 1,
        ];
    }

    session()->put('cart', $cart);

    return redirect()->back()->with('success', 'Product added to cart!');
}

    /**
     * Remove product from cart
     */
    public function removeFromCart($id)
    {
        $cart = session()->get('cart', []);

        if (isset($cart[$id])) {
            unset($cart[$id]);
            session()->put('cart', $cart);
        }

        return redirect()->back()->with('success', 'Product removed from cart.');
    }

    /**
     * Show checkout page
     */
    public function checkout()
    {
        $cart = session()->get('cart', []);

        if (empty($cart)) {
            return redirect()->route('products.index')->with('error', 'Your cart is empty.');
        }

        return view('user.checkout');
    }

    /**
     * Process the checkout form and place the order
     */
    public function processCheckout(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email',
            'address' => 'required|string',
        ]);

        $cart = session()->get('cart', []);

        if (empty($cart)) {
            return redirect()->route('products.index')->with('error', 'Cart is empty.');
        }

        $order = new Order();
        $order->user_id = Auth::id();
        $order->total = collect($cart)->sum(fn($item) => $item['price'] * $item['quantity']);
        $order->address = $request->address;
        $order->save();

        foreach ($cart as $productId => $item) {
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $productId,
                'quantity' => $item['quantity'],
                'price' => $item['price'],
            ]);
        }

        session()->forget('cart');

        return redirect()->route('order.success');
    }

    /**
     * Show order success page
     */
    public function orderSuccess()
    {
        return view('user.order-success');
    }
}
