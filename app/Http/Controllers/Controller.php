<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;

/**
 * Base application controller.
 * Extend this in all your other controllers.
 */
abstract class Controller extends BaseController
{
    // Common controller logic (middlewares, shared helpers) can go here.
}
