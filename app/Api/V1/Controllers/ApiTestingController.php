<?php

namespace App\Api\V1\Controllers;

use JWTAuth;
use App\Http\Controllers\Controller;
use App\Http\Controllers\ProjectListController;
use App\Http\Controllers\ProjectBudgetController;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\DB;
use App\Query\QueryProjectBudget;


class ApiTestingController extends Controller
{

    public function __construct()
    {
        $currentUser = JWTAuth::parseToken()->authenticate();

        $this->user_id = Auth::guard()->user()->id;
        $this->user_level = Auth::guard()->user()->approval_level;
        $this->user_division = Auth::guard()->user()->division_id;
    }
    public function test(Request $request)
    {


        $inactive_status =  QueryProjectBudget::get_first_budget_created_date(3800);

        return $inactive_status;
    }
}
