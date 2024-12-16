<?php

namespace App\Http;

use Illuminate\Foundation\Http\Kernel as HttpKernel;

class Kernel extends HttpKernel
{
    protected $middleware = [
    // Other global middleware...
   
];

    protected $middlewareGroups = [
        'web' => [
            // Web middleware
             
        ],
        'api' => [
            // API middleware
        ],
    ];

    protected $routeMiddleware = [
        // Define route-specific middleware here
    ];
}
