@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h2 class="mb-0">{{ __('Dashboard') }}</h2>
                </div>
                <div class="card-body">
                    <div class="text-muted fs-5">
                        👋 {{ __("Welcome back,") }} {{ Auth::user()->name }}!
                        <br><br>
                        🛍️ You are logged in as a <strong>user</strong>. Start shopping <a href="{{ route('products.index') }}" class="text-primary text-decoration-underline">here</a>.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection