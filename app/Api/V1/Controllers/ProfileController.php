<?php

namespace App\Api\V1\Controllers;

use SiteHelper;
use App\Http\Controllers\Controller;
use App\Models\Attendance;
use App\Models\Config;
use App\Models\Site;
use App\Models\SiteAttachment;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\User;
use JWTAuth;
use Auth;
use App\Query\Profile\QueryProfile;
use Hash;

class ProfileController extends Controller
{
    public function __construct(Request $request)
    {
        $by_login  = (empty(Auth::guard()->user()->id) ? 0 : Auth::guard()->user()->id);
        $by_uniq = SiteHelper::send_uniq_id($request->uniq_id);
        $this->user_id = ($by_login == 0) ? $by_uniq : $by_login;

        $this->address = (empty($request->address) ? '' : $request->address);
        $this->city = (empty($request->city) ? '' : $request->city);
        $this->province = (empty($request->province) ? '' : $request->province);

        $this->header = 'ProfileController';

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
        if (empty($request->name)) {
            $name = '';
        } else {
            $name = $request->name;
        }

        $response = [];
        $sql = QueryProfile::index(0, $name);

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['user_id'] = $data->id;
            $tmp['email'] = $data->email;
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
            $tmp['role_id'] = $data->role_id;
            $tmp['role_name'] = $data->role_name;

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
    public function show(Request $request)
    {
        $response = [];
        $sql = QueryProfile::index($this->user_id, '');

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['user_id'] = $data->id;
            $tmp['email'] = $data->email;
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
            $tmp['role_id'] = $data->role_id;
            $tmp['role_name'] = $data->role_name;

            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        return SiteHelper::convertJson($response);
    }

    public function list_role(Request $request)
    {
        $response = [];
        if (empty($request->role_id)) {
            $role_id = 0;
        } else {
            $role_id = $request->role_id;
        }

        $sql = QueryProfile::list_row($role_id);

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['name'] = $data->name;
            $tmp['created_at'] = $data->created_at;

            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        return SiteHelper::convertJson($response);
    }

    public function edit(Request $request)
    {

        DB::beginTransaction();
        try {

            DB::table('users')->where('id', $request->user_id)
            ->update(array(
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'is_active' => $request->active,
                'role_id' => $request->role_id,
                'employe_id' => $request->employe_id,
                'updated_at' => Carbon::now()
            ));

            DB::commit();
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }

        $user = User::where('id', $request->user_id)->first();
        return response()->json([
            'success' => true,
            'data' => $user
        ], 200);
    }

    public function update(Request $request)
    {

        DB::beginTransaction();
        try {

            DB::table('users')->where('email',$request->email)
            ->update(array(
                'email' => $request->email,
                'uniq_id' => $request->uniq_id,
                'updated_at' => Carbon::now()
            ));

            DB::commit();
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }

        $user = User::where('email',$request->email)->first();
        return response()->json([
            'success' => true,
            'data' => $user
        ], 200);
    }

    public static function upload_user(Request $request)
    {
        $user_id = $this->user_id;
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
                    DB::table('users')->insert(array(
                        'email' => $importData[0],
                        'password' => Hash::make($importData[1]),
                        'role_id' => $importData[2],
                        'employe_id' =>  self::get_id_employee($importData[3]),
                        'is_active' => 1,
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

    public static function get_id_employee($refference_no)
    {
        $sql = DB::table('employment')->where('refference_no', $refference_no)->first();

        return $sql->id;
    }

    public static function validate_uniq_id(Request $request){
        $get_params = $request->uniq_id;

        $uniq_id = User::where('uniq_id', $get_params)->first();

        $next_request = (empty($uniq_id->id) ? 0 : 1);
        $user = User::where('uniq_id', $request->uniq_id)->first();

        if($next_request == 1){
            return response()->json([
                'success' => true,
                'data' => $user
            ], 200);
        }else{
            return response()->json([
                'success' => false,
                'data' => 'Uniq ID tidak ditemukan!'
            ], 402);
        }


       
    }
}
