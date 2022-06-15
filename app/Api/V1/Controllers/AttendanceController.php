<?php

namespace App\Api\V1\Controllers;

use SiteHelper;
use App\Http\Controllers\Controller;
use App\Models\Attendance;
use App\Models\Config;
use App\Models\Site;
use Maatwebsite\Excel\Facades\Excel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\User;
use JWTAuth;
use Auth;
use App\Query\Attendance\QueryAttendance;
use Hash;
use App\Exports\AttendanceExport;

class AttendanceController extends Controller
{
    public function __construct(Request $request)
    {
        // $currentUser = JWTAuth::parseToken()->authenticate();
        $by_login  = (empty(Auth::guard()->user()->id) ? 0 : Auth::guard()->user()->id);
        $by_uniq = SiteHelper::send_uniq_id($request->uniq_id);
        $this->user_id = ($by_login == 0) ? $by_uniq : $by_login;

        $this->address = (empty($request->address) ? '' : $request->address);
        $this->city = (empty($request->city) ? '' : $request->city);
        $this->province = (empty($request->province) ? '' : $request->province);

        $this->header = 'AttendanceController';
        $this->folder = 'attendance';

        $this->myPage = $request->page;
        $this->myUrl = $request->url();
        $this->query = $request->query();

        if (empty($request->perpage)) {
            $this->perPage = 10;
        } else {
            $this->perPage = $request->perpage;
        }
    }
    public function index(Request $request)
    {
        if (empty($request->emp_id)) {
            $emp_id = 0;
        } else {
            $emp_id = $request->emp_id;
        }

        $response = [];
        $sql = QueryAttendance::index($emp_id, $request->from, $request->to);

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {
            $ci_photo = QueryAttendance::get_attachment($data->id, 1);
            $co_photo = QueryAttendance::get_attachment($data->id, 2);

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['employe'] = $data->username;
            $tmp['site_id'] = $data->site_id;
            $tmp['site_name'] = $data->site_name;
            $tmp['check_in'] = $data->check_in;
            $tmp['check_out'] = $data->check_out;
            $tmp['check_in_lat'] = $data->check_in_lat;
            $tmp['check_in_long'] = $data->check_in_long;
            $tmp['check_in_photo'] = $ci_photo;
            $tmp['check_out_lat'] = $data->check_out_lat;
            $tmp['check_out_long'] = $data->check_out_long;
            $tmp['check_out_photo'] = $co_photo;


            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        return SiteHelper::Pagination(
            $response,
            $this->myPage,
            $this->perPage,
            $this->myUrl,
            $this->query
        );
    }
    public function attendance_in(Request $request)
    {

        $photo_in = $request->file('photo');
        if ($photo_in) {
            $file_name = rand(1, 999999999);
            $destination = public_path("/storage/attendance/images");
            $photo_in->move($destination, $file_name . ".jpg");

            try {

                DB::table('attendance')
                    ->insert(array(
                        'user_id' => $this->user_id,
                        'site_id' => $request->site_id,
                        'check_in' => Carbon::now(),
                        'check_in_lat' => $request->latitude,
                        'check_in_long' => $request->longitude
                    ));

                $get_last_id = DB::table('attendance')->where('user_id', $this->user_id)->orderBy('id', 'DESC')->first();
                $attendance_last_id = $get_last_id->id;
                $path = SiteHelper::path_file($this->folder, $file_name);
                DB::table('attendance_attachment')
                    ->insert(array(
                        'created_by' => $this->user_id,
                        'attendance_id' => $attendance_last_id,
                        'type' => 1,
                        'full_path' => $path
                    ));
                // Commit Transaction
                DB::commit();
                SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

                return response()->json([
                    'success' => true
                ], 200);
            } catch (Exception $e) {
                // Rollback Transaction
                DB::rollback();
            }
        }
    }

    public function attendance_out(Request $request)
    {
        $photo_out = $request->file('photo');
        if ($photo_out) {
            $file_name = rand(1, 999999999);
            $destination = public_path("/storage/attendance/images");
            $photo_out->move($destination, $file_name . ".jpg");

            try {

                DB::table('attendance')->where('id', $request->id)
                    ->update(array(
                        'check_out' => Carbon::now(),
                        'check_out_lat' => $request->latitude,
                        'check_out_long' => $request->longitude
                    ));

                $path = SiteHelper::path_file($this->folder, $file_name);
                DB::table('attendance_attachment')
                    ->insert(array(
                        'created_by' => $this->user_id,
                        'attendance_id' => $request->id,
                        'type' => 2,
                        'full_path' => $path
                    ));
                // Commit Transaction
                DB::commit();
                SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

                return response()->json([
                    'success' => true
                ], 200);
            } catch (Exception $e) {
                // Rollback Transaction
                DB::rollback();
            }
        }
    }

    public function export_attendance(Request $request)
    {
        $filename = "AttendanceList";
        $back_month = date('m') - 1;
        $from = (empty($request->from)) ? date("Y-$back_month-d") : $request->from;
        $to = (empty($request->to)) ? date('Y-m-d') : $request->to;
        $emp_id = (empty($request->emp_id)) ? 0 : $request->emp_id;
        return Excel::download(new AttendanceExport($from, $to, $emp_id), "$filename.xlsx");
    }

    public function create_logs(Request $request){
        try {

            DB::table('attendance_logs')
                ->insert(array(
                    'user_id' => $this->user_id,
                    'site_no' => $request->site_id,
                    'lat' => $request->latitude,
                    'long' => $request->longitude,
                    'address' => $request->address,
                    'city' => $request->city,
                    'province' => $request->province,
                    'created_at' => Carbon::now()
                ));

            // Commit Transaction
            DB::commit();

            return response()->json([
                'success' => true
            ], 200);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }

    public function view_logs(Request $request)
    {
        $emp_id = (empty($request->emp_id)) ? 0 : $request->emp_id;
        $back_month = date('m') - 1;
        $from = (empty($request->from)) ? date("Y-$back_month-d") : $request->from;
        $to = (empty($request->to)) ? date('Y-m-d') : $request->to;

        $response = [];
        $sql = QueryAttendance::attendance_logs($emp_id,$from,$to);

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {
            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['latitude'] = $data->lat;
            $tmp['longitude'] = $data->long;
            $tmp['site_no'] = $data->site_no;
            $tmp['site_id'] = $data->site_id;
            $tmp['address'] = $data->address;
            $tmp['city'] = $data->city;
            $tmp['province'] = $data->province;
            $tmp['employee'] = $data->emp_name;
            $tmp['time'] = $data->created_at;

            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        return SiteHelper::Pagination(
            $response,
            $this->myPage,
            $this->perPage,
            $this->myUrl,
            $this->query
        );
    }


}
