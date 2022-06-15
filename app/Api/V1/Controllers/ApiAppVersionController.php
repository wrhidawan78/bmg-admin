<?php

namespace App\Api\V1\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Controllers\AppVersionContoller;
use Illuminate\Http\Request;
use App\Modules\PaginationArr;
use Illuminate\Support\Facades\DB;
use Auth;
use JWTAuth;
use SiteHelper;

class ApiAppVersionController extends Controller
{
    public static function checkversion(Request $request)
    {
        // $currentUser = JWTAuth::parseToken()->authenticate();
        $response = [];

        $sql = "SELECT id,app_version FROM app_version
                WHERE inactive = 0
                ORDER BY id DESC
                LIMIT 1";

        $version = DB::select(DB::raw($sql));

        foreach ($version as $data) {
            $ver = str_replace(".", "", $data->app_version);

            $ip = $request->ip();
            $filename = "http://$ip/storage/apk/bmg-absensi-v$ver.apk";
            $tmp = [];
            $tmp['app_version'] = $data->app_version;
            $tmp['url'] = $filename;

            array_push($response, $tmp);
        }

        return SiteHelper::convertJson($response);
    }
}
