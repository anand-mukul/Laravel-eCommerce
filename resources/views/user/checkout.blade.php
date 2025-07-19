@extends('layouts.app')

@section('title', 'Checkout | E-Commerce')

@section('content')
<div class="container mt-5">
    <h2 class="mb-4">🧾 Checkout</h2>

    @if(session('cart') && count(session('cart')) > 0)
        <form action="{{ route('checkout.process') }}" method="POST">
            @csrf

            <div class="row mb-4">
                <div class="col-md-6">
                    <h5>🧍‍♂️ user Info</h5>
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name"
                               value="{{ auth()->user()->name }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email"
                               value="{{ auth()->user()->email }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Shipping Address</label>
                        <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                    </div>
                </div>

                <div class="col-md-6">
                    <h5>🛍️ Order Summary</h5>
                    <ul class="list-group mb-3">
                        @php $grandTotal = 0; @endphp
                        @foreach(session('cart') as $item)
                            @php
                                $total = $item['price'] * $item['quantity'];
                                $grandTotal += $total;
                            @endphp
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                {{ $item['name'] }} × {{ $item['quantity'] }}
                                <span>₹{{ number_format($total, 2) }}</span>
                            </li>
                        @endforeach
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <strong>Total</strong>
                            <strong>₹{{ number_format($grandTotal, 2) }}</strong>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-primary">Place Order</button>
            </div>
        </form>
    @else
        <div class="alert alert-warning">
            Your cart is empty. <a href="{{ route('products.index') }}">Shop now</a>.
        </div>
    @endif
</div>
@endsection
