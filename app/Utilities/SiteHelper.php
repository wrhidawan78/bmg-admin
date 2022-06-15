<?php

namespace App\Utilities;

use Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Auth;
use Carbon\Carbon;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use App\User;

class SiteHelper
{
    static function exec_query($data)
    {
        return DB::select(DB::raw($data));
    }

    static function convertJson($data)
    {
        return response()->json([
            'success' => true,
            'data' => $data
        ], 200);
    }

    static function createLogs($ip, $method, $url, $header, $body, $user_id, $address, $city, $province)
    {
        $get_ip = "$ip" . "(user:$user_id)";
        $data_body = join(", ", $body);

        DB::beginTransaction();
        try {

            DB::table('logs_api')
                ->insert(array(
                    'ip' => $get_ip,
                    'method' => $method,
                    'url' => $url,
                    'headers' => $header,
                    'body' => $data_body,
                    'address' => $address,
                    'city' => $city,
                    'province' => $province,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now()
                ));

            // Commit Transaction
            DB::commit();
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }

    public static function arr_pagination($myArray, $page, $perPage, $url, $query)
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $total = count($myArray);
        $currentpage = $page;
        $offset = ($currentpage * $perPage) - $perPage;
        $itemstoshow = array_slice($myArray, $offset, $perPage);
        $dataArray = new LengthAwarePaginator(
            $itemstoshow,
            $total,
            $perPage,
            $page,
            ['path' => $url, 'query' => $query]

        );

        return response()->json($dataArray, 200);
    }

    public static function Pagination($arr, $page, $perPage, $url, $query)
    {

        return self::arr_pagination(
            $arr,
            $page,
            $perPage,
            $url,
            $query
        );
    }


    public static function path_file($folder, $file_name)
    {
        $path = "http://127.0.0.1:8000/storage/$folder/images/$file_name.jpg";

        return $path;
    }

    public static function send_uniq_id($params){
        $get_params = $params;

        $uniq_id = User::where('uniq_id', $get_params)->first();

        $next_request = (empty($uniq_id->id) ? 0 : $uniq_id->id);
        return $next_request;
    }

    public static function get_role_by_uniq_id($params){
        $get_params = $params;

        $uniq_id = User::where('uniq_id', $get_params)->first();

        $next_request = (empty($uniq_id->id) ? 0 : $uniq_id->role_id);
        return $next_request;
    }
}
