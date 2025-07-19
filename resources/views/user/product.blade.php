@extends('layouts.app')

@section('title', $product->name . ' | E-Commerce')

@section('content')
<div class="container mt-5">
    <div class="row">
        {{-- Product Image --}}
        <div class="col-md-5">
            @if($product->image)
                <img src="{{ asset('storage/' . $product->image) }}" class="img-fluid rounded" alt="{{ $product->name }}">
            @else
                <img src="https://via.placeholder.com/500x350?text=No+Image" class="img-fluid rounded" alt="No Image">
            @endif
        </div>

        {{-- Product Details --}}
        <div class="col-md-7">
            <h2>{{ $product->name }}</h2>
            <h5 class="text-muted">₹{{ number_format($product->price, 2) }}</h5>
            <p class="mt-3"><strong>Category:</strong> {{ $product->category->name ?? 'N/A' }}</p>
            <p>{{ $product->description }}</p>

            {{-- Add to Cart Form --}}
            <form action="{{ route('cart.add', $product->id) }}" method="POST" class="mt-4">
                @csrf
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" name="quantity" id="quantity" class="form-control w-25" min="1" value="1" required>
                </div>
                <button type="submit" class="btn btn-success">Add to Cart</button>
                <a href="{{ route('products.index') }}" class="btn btn-secondary ms-2">Back to Products</a>
            </form>
        </div>
    </div>
</div>
@endsection
