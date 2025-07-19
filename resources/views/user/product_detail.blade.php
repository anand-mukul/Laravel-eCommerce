@extends('layouts.app')

@section('title', $product->name . ' | E-Commerce')

@section('content')
<div class="container mt-5">
    <div class="row">
        <!-- Product Image -->
        <div class="col-md-6">
            <img src="{{ asset('storage/' . $product->image) }}" alt="{{ $product->name }}" class="img-fluid rounded shadow-sm">
        </div>

        <!-- Product Details -->
        <div class="col-md-6">
            <h2 class="mb-3">{{ $product->name }}</h2>

            @if($product->category)
                <p class="text-muted">Category: <strong>{{ $product->category->name }}</strong></p>
            @endif

            <h4 class="text-success mb-3">₹{{ number_format($product->price, 2) }}</h4>

            <p class="text-muted">{{ $product->description }}</p>

            @if($product->stock > 0)
                <p class="text-success fw-bold">In Stock: {{ $product->stock }}</p>
                <!-- Add to Cart Form -->
                <form action="{{ route('cart.add', $product->id) }}" method="POST" class="mt-4">
                    @csrf
                    <div class="input-group mb-3" style="max-width: 150px;">
                        <input type="number" name="quantity" class="form-control" min="1" max="{{ $product->stock }}" value="1">
                        <button class="btn btn-primary" type="submit">Add to Cart</button>
                    </div>
                </form>
            @else
                <p class="text-danger fw-bold">Out of Stock</p>
            @endif

            <a href="{{ route('products.index') }}" class="btn btn-outline-secondary mt-3">← Back to Products</a>
        </div>
    </div>
</div>
@endsection
