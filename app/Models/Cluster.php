<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin Eloquent
 * @mixin Builder
 */

class Cluster extends Model
{
    protected $table = 'clusters';
    public $timestamps = false;
}
