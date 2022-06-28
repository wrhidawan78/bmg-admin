<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin Eloquent
 * @mixin Builder
 */

class Customer extends Model
{
    protected $table = 'customer';
    public $timestamps = false;
}
