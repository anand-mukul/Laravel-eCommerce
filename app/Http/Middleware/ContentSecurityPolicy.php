<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ContentSecurityPolicy
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): \Symfony\Component\HttpFoundation\Response  $next
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function handle(Request $request, Closure $next): Response
    {
        $response = $next($request);

        $response->headers->set('Content-Security-Policy', "
            default-src 'self';
            style-src 'self' 'unsafe-inline';
            script-src 'self' 'unsafe-inline' 'unsafe-eval';
            img-src 'self' data:;
            font-src 'self';
            connect-src 'self';
        ");

        return $response;
    }
}
