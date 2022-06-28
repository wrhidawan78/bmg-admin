<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin Eloquent
 * @mixin Builder
 */

class City extends Model
{
    protected $table = 'city';
    public $timestamps = false;
}
