@extends('layouts.app')

@section('title', 'Profile')

@section('content')
<div class="container py-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold">👤 My Account</h2>
        <p class="text-muted">Manage your personal information, change password, or delete your account.</p>
    </div>

    <div class="row justify-content-center">
        {{-- Update Profile Information --}}
        <div class="col-md-8 mb-4">
            <div class="card shadow border-0">
                <div class="card-header bg-primary text-white">
                    <i class="bi bi-person-lines-fill me-2"></i>Update Profile Information
                </div>
                <div class="card-body">
                    @include('profile.partials.update-profile-information-form')
                </div>
            </div>
        </div>

        {{-- Update Password --}}
        <div class="col-md-8 mb-4">
            <div class="card shadow border-0">
                <div class="card-header bg-warning text-dark">
                    <i class="bi bi-lock-fill me-2"></i>Change Password
                </div>
                <div class="card-body">
                    @include('profile.partials.update-password-form')
                </div>
            </div>
        </div>

        {{-- Delete Account --}}
        <div class="col-md-8 mb-4">
            <div class="card shadow border-0">
                <div class="card-header bg-danger text-white">
                    <i class="bi bi-trash-fill me-2"></i>Delete Account
                </div>
                <div class="card-body">
                    <p class="text-danger fw-semibold mb-3">
                        ⚠️ Deleting your account is irreversible. All your data will be permanently removed.
                    </p>
                    @include('profile.partials.delete-user-form')
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
