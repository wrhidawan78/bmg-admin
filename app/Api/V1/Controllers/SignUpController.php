<?php

namespace App\Api\V1\Controllers;

use SiteHelper;
use Config;
use App\User;
use Illuminate\Support\Facades\Crypt;
use Tymon\JWTAuth\JWTAuth;
use App\Http\Controllers\Controller;
use App\Api\V1\Requests\SignUpRequest;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\CheckUserHttpException;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Storage;

class SignUpController extends Controller
{
    public function signUp(SignUpRequest $request, JWTAuth $JWTAuth)
    {
        $if_emp_exist = DB::table('employment')->where('refference_no', $request->employe_id)->first();

        if(empty($if_emp_exist)){
            throw new HttpException(500," NIK Karyawan belum terdaftar");
        }else{
            $if_user_exist = DB::table('users')->where('employe_id', $request->employe_id)->first();

            if(empty($if_user_exist)){
                $user = new User($request->all());
                if (!$user->save()) {
                    throw new HttpException(500, "proses registrasi gagal");
                }

                if (!Config::get('boilerplate.sign_up.release_token')) {
                    $users = User::where('email',$request->email)->first();
                    $picture = $request->file('picture_profile');
                    if(isset($picture))
                    {
                        if(empty($picture) || empty($picture))
                        {
                            $picture_profile = '';
                        }
                        else
                        {
                            $picture_profile = "P" . $users->id . rand(1, 99999);
                            move_uploaded_file($picture, public_path("/storage/profile/images/".$picture_profile . ".jpg"));//Error in this line
                        }
                    }

                    $picture_ktp = $request->file('picture_ktp');
                    if(isset($picture_ktp))
                    {
                        if(empty($picture_ktp) || empty($picture_ktp))
                        {
                            $ktp_no = '';
                        }
                        else
                        {
                            $ktp_no = $request->employe_ktp;
                            move_uploaded_file($picture_ktp, public_path("/storage/profile/images/".$ktp_no . ".jpg"));//Error in this line
                        }
                    }
                    DB::table('user_detail')->insert(array(
                        'user_id' => $users->id,
                        'name' => $request->name,
                        'picture_profile' => SiteHelper::path_file($folder,  $picture_profile),
                        'gender' => $request->gender,
                        'employe_id' => $request->employe_id,
                        'employe_ktp' => $request->employe_ktp,
                        'picture_ktp' => SiteHelper::path_file($folder,  $ktp_no),
                        'phone_number' => $request->phone,
                        'project_customer' => $request->customer,
                        'position' => $request->position,
                        'region' => $request->reqion,
                        'area' => $request->area,
                        'cluster' => $request->cluster,
                        'sertificate' => $request->sertificate,
                        'created_at' => Carbon::now()
                    ));

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
                throw new HttpException(500, "NIK ini sudah terdaftar");
            }
        }
    }
    
}