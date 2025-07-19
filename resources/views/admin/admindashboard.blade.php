@extends('layouts.app')

@section('title', 'Admin Dashboard')

@section('content')
<div class="container">
    <h1 class="mb-4">👑 Admin Dashboard</h1>

    {{-- Overview Stats --}}
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card text-bg-primary">
                <div class="card-body">
                    <h5 class="card-title">Products</h5>
                    <p class="card-text fs-4">{{ $stats['productsCount'] }}</p>
                    <a href="{{ route('admin.products.create') }}" class="btn btn-sm btn-light mt-2">➕ Add Product</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-bg-info">
                <div class="card-body">
                    <h5 class="card-title">Categories</h5>
                    <p class="card-text fs-4">{{ $stats['categoriesCount'] }}</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-bg-success">
                <div class="card-body">
                    <h5 class="card-title">Users</h5>
                    <p class="card-text fs-4">{{ $stats['usersCount'] }} users / {{ $stats['adminCount'] }} admins</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-bg-dark">
                <div class="card-body">
                    <h5 class="card-title">Revenue</h5>
                    <p class="card-text fs-4">₹{{ number_format($stats['totalRevenue'], 2) }}</p>
                </div>
            </div>
        </div>
    </div>

    {{-- Orders Summary --}}
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card text-bg-secondary">
                <div class="card-body">
                    <h5 class="card-title">Total Orders</h5>
                    <p class="card-text fs-4">{{ $stats['totalOrders'] }}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-bg-warning">
                <div class="card-body">
                    <h5 class="card-title">Pending Orders</h5>
                    <p class="card-text fs-4">{{ $stats['pendingOrders'] }}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-bg-success">
                <div class="card-body">
                    <h5 class="card-title">Completed Orders</h5>
                    <p class="card-text fs-4">{{ $stats['completedOrders'] }}</p>
                </div>
            </div>
        </div>
    </div>

    {{-- Recent Products + CRUD --}}
    <h4 class="mt-5">🆕 Recent Products</h4>
    <div class="table-responsive mb-4">
        <table class="table table-striped align-middle">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Created</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($recentProducts as $product)
                    <tr>
                        <td>{{ $product->name }}</td>
                        <td>{{ $product->category->name ?? 'N/A' }}</td>
                        <td>₹{{ $product->price }}</td>
                        <td>{{ $product->created_at->diffForHumans() }}</td>
                        <td>
                            <a href="{{ route('admin.products.edit', $product->id) }}" class="btn btn-sm btn-warning">✏️ Edit</a>

                            <form action="{{ route('admin.products.destroy', $product->id) }}" method="POST" class="d-inline"
                                  onsubmit="return confirm('Are you sure you want to delete this product?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-danger">🗑 Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    {{-- Recent Users --}}
    <h4 class="mt-5">👥 Recent Users</h4>
    <div class="table-responsive mb-4">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Joined</th>
                </tr>
            </thead>
            <tbody>
                @foreach($recentUsers as $user)
                    <tr>
                        <td>{{ $user->name }}</td>
                        <td>{{ $user->email }}</td>
                        <td>{{ $user->created_at->diffForHumans() }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    {{-- Top Selling Products --}}
    <h4 class="mt-5">🔥 Top Selling Products</h4>
    <div class="table-responsive mb-4">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Total Sold</th>
                </tr>
            </thead>
            <tbody>
                @foreach($topProducts as $product)
                    <tr>
                        <td>{{ $product->name }}</td>
                        <td>{{ $product->total_sold ?? 0 }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    
    {{-- Monthly Revenue --}}
    <h4 class="mt-5">📈 Monthly Revenue (Last 6 Months)</h4>
    <ul class="list-group mb-5">
        @foreach($monthlyRevenue as $entry)
            <li class="list-group-item d-flex justify-content-between align-items-center">
                {{ $entry['month'] }}
                <span class="badge bg-success rounded-pill">₹{{ number_format($entry['revenue'], 2) }}</span>
            </li>
        @endforeach
    </ul>
</div>
@endsection
