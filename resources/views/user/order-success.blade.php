@extends('layouts.app')

@section('title', 'Order Success | E-Commerce')

@section('content')
<div class="container py-5 text-center">
    <div class="alert alert-success">
        <h2 class="mb-3">✅ Thank you for your order!</h2>
        <p>Your order was placed successfully and is being processed.</p>
        <p>We’ll notify you when your items are on the way. 📦</p>
        <a href="{{ route('products.index') }}" class="btn btn-primary mt-4">Continue Shopping</a>
    </div>
</div>
@endsection
