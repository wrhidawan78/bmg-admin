<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use JWTAuth;
use Auth;
use Illuminate\Support\Facades\DB;
use Dingo\Api\Routing\Helpers;
use Carbon\Carbon;
use Validator,Redirect,Response,File;

class UserController extends Controller
{
    public static function get_user_area(){
        $currentUser = JWTAuth::parseToken()->authenticate();
        $user_id = Auth::guard()->user()->old_id;

        $get_user_area = DB::table('0_users')
        ->where('id',$user_id)
        ->first();
        $area_id = $get_user_area->area_id;

        return $area_id;
    }

    public static function get_emp_no($emp_id){
    
        $sql = DB::table('0_hrm_employees')
        ->where('emp_id',$emp_id)
        ->first();
        $emp_no = $sql->id;

        return $emp_no;
    }
    public static function get_info_user_devosa($emp_id){

        $users = DB::connection('pgsql')->table('adm_user')
        ->where('employee_id', $emp_id)->first();

        return $users;
    }

    public static function get_user_info($id){

        $user_id = explode(',', $id);
        $users = DB::table('users')
        ->whereIn('id', $user_id)->first();

        return $users;
    }

    public static function get_emp_id_by_person_id($person_id){

        $users = DB::table('users')
        ->where('person_id', $person_id)->first();

        return $users->emp_id;
    }
}
