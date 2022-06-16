<?php

namespace App\Api\V1\Controllers;

use Config;
use App\User;
use Illuminate\Support\Facades\Crypt;
use Tymon\JWTAuth\JWTAuth;
use App\Http\Controllers\Controller;
use App\Api\V1\Requests\SignUpRequest;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\NikHttpException;
use Symfony\Component\HttpKernel\Exception\CheckUserHttpException;
use Symfony\Component\HttpKernel\Exception\CodeNotMatchHttpException;
use Illuminate\Support\Facades\DB;

class SignUpController extends Controller
{
    public function signUp(SignUpRequest $request, JWTAuth $JWTAuth)
    {
        $if_emp_exist = DB::table('employment')->where('refference_no', $request->employe_id)->first();

        if(empty($if_emp_exist)){
            throw new NikHttpException();
        }else{
            $if_user_exist = DB::table('users')->where('employe_id', $request->employe_id)->first();

            if(empty($if_user_exist)){
                $user = new User($request->all());
                if (!$user->save()) {
                    throw new HttpException(500);
                }

                if (!Config::get('boilerplate.sign_up.release_token')) {
                    $users = User::where('email',$request->email)->first();

                    return response()->json([
                        'status' => 'ok',
                        'data' =>  $users
                    ], 201);
                }

                $token = $JWTAuth->fromUser($user);
                return response()->json([
                    'status' => 'ok',
                    'token' => $token
                ], 201);
            }else{
                throw new CheckUserHttpException();
            }
        }
    }
}
