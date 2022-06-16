<?php

namespace App\Api\V1\Controllers;

use SiteHelper;
use App\Http\Controllers\Controller;
use App\Models\Attendance;
use App\Models\Config;
use App\Models\SiteAttachment;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\User;
use App\Site;
use JWTAuth;
use Auth;
use App\Query\Employee\QueryEmployee;

class EmployeeController extends Controller
{
    public function __construct(Request $request)
    {
        $by_login  = (empty(Auth::guard()->user()->id) ? 0 : Auth::guard()->user()->id);
        $by_uniq = SiteHelper::send_uniq_id($request->uniq_id);
        $get_role = SiteHelper::send_uniq_id($request->uniq_id);
        $this->user_id = ($by_login == 0) ? $by_uniq : $by_login;
        $this->role_id = ($by_login == 0) ? $get_role : $by_login;

        $this->address = (empty($request->address) ? '' : $request->address);
        $this->city = (empty($request->city) ? '' : $request->city);
        $this->province = (empty($request->province) ? '' : $request->province);

        $this->header = 'EmployeeController';

        $this->myPage = $request->page;
        $this->myUrl = $request->url();
        $this->query = $request->query();

        if (empty($request->perpage)) {
            $this->perPage = 10;
        } else {
            $this->perPage = $request->perpage;
        }
    }

    public function show(Request $request)
    {
        $employe_id = $request->employe_id;
        $response = [];
        $sql = QueryEmployee::show($employe_id);

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['emp_name'] = $data->emp_name;
            $tmp['emp_birth_date'] = $data->emp_birth_date;
            $tmp['division_id'] = $data->division_id;
            $tmp['division_name'] = $data->division_name;
            $tmp['mobile_phone'] = $data->mobile_phone;
            $tmp['religion'] = $data->religion;
            $tmp['gender'] = $data->gender;
            $tmp['status'] = $data->status;
            $tmp['address'] = $data->address;
            $tmp['join_date'] = $data->join_date;
            $tmp['resign_date'] = $data->resign_date;
            $tmp['supervisor_id'] = $data->supervisor_id;
            $tmp['supervisor'] = $data->supervisor;

            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        return SiteHelper::convertJson($response);
    }
    public function list(Request $request)
    {
        if (empty($request->name)) {
            $name = '';
        } else {
            $name = $request->name;
        }

        $response = [];
        $sql = QueryEmployee::list($name);
        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['name'] = $data->name;
            $tmp['refference_no'] = $data->refference_no;
            $tmp['division'] = $data->division;
            $tmp['gender'] = $data->gender;
            $tmp['status'] = $data->status;
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

    public function division_list(Request $request)
    {
        if (empty($request->division_id)) {
            $division_id = 0;
        } else {
            $division_id = $request->division_id;
        }

        $response = [];


        $sql = QueryEmployee::division_list($division_id);

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['division_id'] = $data->division_id;
            $tmp['name'] = $data->name;
            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);


        return SiteHelper::convertJson($response);
    }

    public function religion_list(Request $request)
    {
        if (empty($request->religion_id)) {
            $religion_id = 0;
        } else {
            $religion_id = $request->religion_id;
        }

        $response = [];


        $sql = QueryEmployee::religion_list($religion_id);

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['name'] = $data->name;
            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);


        return SiteHelper::convertJson($response);
    }

    public function create(Request $request)
    {
        DB::beginTransaction();
        try {

            DB::table('employment')
                ->insert(array(
                    'name' => $request->name,
                    'birthday_date' => $request->birthday_date,
                    'refference_no' => $request->refference_no,
                    'division_id' => $request->division_id,
                    'cluster_id' => $request->cluster_id,
                    'mobile_phone' => $request->mobile_phone,
                    'gender' => $request->gender,
                    'religion' => $request->religion,
                    'address' => $request->address,
                    'status' => $request->status,
                    'join_date' => $request->join_date,
                    'supervisor_id' => $request->supervisor_id,
                    'created_at' => Carbon::now()
                ));

            DB::commit();

            return response()->json([
                'success' => true
            ], 200);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }
    public function edit(Request $request)
    {
        DB::beginTransaction();
        try {

            DB::table('employment')->where('id', $request->employe_id)
                ->update(array(
                    'name' => $request->name,
                    'birthday_date' => $request->birthday_date,
                    'refference_no' => $request->refference_no,
                    'division_id' => $request->division_id,
                    'cluster_id' => $request->cluster_id,
                    'mobile_phone' => $request->mobile_phone,
                    'gender' => $request->gender,
                    'religion' => $request->religion,
                    'address' => $request->address,
                    'status' => $request->status,
                    'join_date' => $request->join_date,
                    'resign_date' => $request->resign_date,
                    'supervisor_id' => $request->supervisor_id
                ));

            DB::commit();

            return response()->json([
                'success' => true
            ], 200);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }

    public function division_create(Request $request)
    {
        DB::beginTransaction();
        try {

            DB::table('division')
                ->insert(array(
                    'name' => $request->name,
                    'division_id' => $request->division_id,
                    'created_at' => Carbon::now()
                ));

            DB::commit();

            return response()->json([
                'success' => true
            ], 200);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }

    public function religion_create(Request $request)
    {
        DB::beginTransaction();
        try {

            DB::table('religion')
                ->insert(array(
                    'name' => $request->name
                ));

            DB::commit();

            return response()->json([
                'success' => true
            ], 200);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }

    public function area_list(Request $request)
    {
        if (empty($request->area_id)) {
            $area_id = 0;
        } else {
            $area_id = $request->area_id;
        }

        $response = [];


        $sql = QueryEmployee::area_list($area_id);

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['area'] = $data->area;
            $tmp['name'] = $data->name;
            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);


        return SiteHelper::convertJson($response);
    }

    public function area_create(Request $request)
    {
        DB::beginTransaction();
        try {

            DB::table('area')
                ->insert(array(
                    'area' => $request->area,
                    'name' => $request->name,
                    'status' => $request->status,
                    'created_at' => Carbon::now()
                ));

            DB::commit();

            return response()->json([
                'success' => true
            ], 200);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }

    public function area_edit(Request $request)
    {
        DB::beginTransaction();
        try {

            DB::table('area')->where('id', $request->area_id)
                ->update(array(
                    'area' => $request->area,
                    'name' => $request->name,
                    'status' => $request->status,
                    'created_at' => Carbon::now()
                ));

            DB::commit();

            return response()->json([
                'success' => true
            ], 200);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }

    public static function cluster_list(Request $request)
    {
        if (empty($request->cluster_id)) {
            $cluster_id = 0;
        } else {
            $cluster_id = $request->cluster_id;
        }

        $response = [];


        $sql = QueryEmployee::cluster_list($cluster_id);

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['name'] = $data->name;
            $tmp['area_id'] = $data->area_id;
            $tmp['area_name'] = $data->area_name;
            $tmp['status'] = $data->status;
            $tmp['created_at'] = $data->created_at;
            $tmp['updated_at'] = $data->updated_at;


            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), '', $request->all(), 1, '', '', '');


        return SiteHelper::convertJson($response);
    }

    public function add_cluster(Request $request)
    {
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        $area_name = QueryEmployee::get_area_name($request->area_id);
        DB::beginTransaction();
        try {

            DB::table('clusters')
                ->insert(array(
                    'area' => $area_name,
                    'area_id' => $request->area_id,
                    'name' => $request->name,
                    'status' => $request->status,
                    'created_at' => Carbon::now()
                ));

            DB::commit();

            return response()->json([
                'success' => true
            ], 200);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }
    public function cluster_edit(Request $request)
    {
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);
        $area_name = QueryEmployee::get_area_name($request->area_id);

        DB::beginTransaction();
        try {

            DB::table('clusters')->where('id', $request->cluster_id)
                ->update(array(
                    'area' => $area_name,
                    'area_id' => $request->area_id,
                    'name' => $request->name,
                    'status' => $request->status,
                    'updated_at' => Carbon::now()
                ));

            DB::commit();

            return response()->json([
                'success' => true
            ], 200);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }

    public static function upload_employee(Request $request)
    {

        $user_id = Auth::guard()->user()->id;
        $file = $request->file('uploaded_file');
        if ($file) {
            $filename = $file->getClientOriginalName();
            $extension = $file->getClientOriginalExtension(); //Get extension of uploaded file
            $tempPath = $file->getRealPath();
            $fileSize = $file->getSize(); //Get size of uploaded file in bytes
            //Check for file extension and size
            self::checkUploadedFileProperties($extension, $fileSize);
            //Where uploaded file will be stored on the server 
            $location = 'uploads'; //Created an "uploads" folder for that
            // Upload file
            $file->move($location, $filename);
            // In case the uploaded file path is to be stored in the database 
            $filepath = public_path($location . "/" . $filename);
            // Reading file
            $file = fopen($filepath, "r");
            $importData_arr = array(); // Read through the file and store the contents as an array
            $i = 0;
            //Read the contents of the uploaded file 
            while (($filedata = fgetcsv($file, 1000, ",")) !== FALSE) {
                $num = count($filedata);
                // Skip first row (Remove below comment if you want to skip the first row)
                if ($i == 0) {
                    $i++;
                    continue;
                }
                for ($c = 0; $c < $num; $c++) {
                    $importData_arr[$i][] = $filedata[$c];
                }
                $i++;
            }
            fclose($file); //Close after reading
            $j = 0;
            foreach ($importData_arr as $importData) {
                $j++;
                try {
                    DB::table('employment')->insert(array(
                        'name' => $importData[0],
                        'birthday_date' => $importData[1],
                        'refference_no' => $importData[2],
                        'division_id' => $importData[3],
                        'cluster_id' => $importData[4],
                        'mobile_phone' => $importData[5],
                        'gender' => $importData[6],
                        'religion' => $importData[7],
                        'address' => $importData[8],
                        'status' => $importData[9],
                        'join_date' => $importData[10],
                        'resign_date' => $importData[11],
                        'supervisor_id' => $importData[12],
                        'created_at' => Carbon::now()

                    ));
                    DB::commit();
                } catch (\Exception $e) {
                    //throw $th;
                    DB::rollBack();
                }
            }
            return response()->json([
                'message' => "$j records successfully uploaded"
            ]);
        } else {
            //no file was uploaded
            echo "haha";
        }
    }

    public static function checkUploadedFileProperties($extension, $fileSize)
    {
        $valid_extension = array("csv", "xlsx"); //Only want csv and excel files
        $maxFileSize = 2097152; // Uploaded file size limit is 2mb
        if (in_array(strtolower($extension), $valid_extension)) {
            if ($fileSize <= $maxFileSize) { } else {
                echo '413 error';
            }
        } else {
            echo '415 error';
        }
    }
}
