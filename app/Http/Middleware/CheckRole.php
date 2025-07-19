<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class CheckRole
{
    public function handle(Request $request, Closure $next, string $role): Response
    {
        \Log::debug("CheckRole middleware triggered for role: $role");

        if (!Auth::check()) {
            \Log::debug('User not authenticated, redirecting to login');
            return redirect()->route('login');
        }

        \Log::debug('Authenticated user', [
            'id' => Auth::id(),
            'role' => Auth::user()->role
        ]);

        if (Auth::user()->role !== $role) {
            \Log::warning('Unauthorized access attempt', [
                'required_role' => $role,
                'actual_role' => Auth::user()->role
            ]);
            abort(403, 'Unauthorized access');
        }

        return $next($request);
    }
}
