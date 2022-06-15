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
use App\Query\Site\QuerySite;

class SiteController extends Controller
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

        $this->header = 'ProfileController';
        $this->header = 'SiteController';

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
        $response = QuerySite::index($request->id);

        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        return SiteHelper::convertJson($response);
    }
    public function index(Request $request)
    {
        if (empty($request->id)) {
            $id = 0;
        } else {
            $id = $request->id;
        }

        if (empty($request->name)) {
            $name = '';
        } else {
            $name = $request->name;
        }

        $response = [];
        $sql = QuerySite::list($id, $name);
        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['site_id'] = $data->site_id;
            $tmp['name'] = $data->name;
            $tmp['long'] = $data->long;
            $tmp['lat'] = $data->lat;
            $tmp['metadata'] = $data->metadata;
            $tmp['address'] = $data->address;
            $tmp['pic'] = $data->pic;
            $tmp['created_at'] = $data->created_at;
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

    public static function create(Request $request)
    {
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), "SiteController", $request->all());
        $save_photos = $request->file('photo');
        if ($save_photos) {
            $file_name = rand(1, 999999999);
            $destination = public_path("/storage/sites/images");
            $save_photos->move($destination, $file_name . ".jpg");

            DB::beginTransaction();
            try {
                if ($this->role_id  == 1 || $this->role_id  == 2) {
                    DB::table('master_site')
                        ->insert(array(
                            'site_id' => $request->site_id,
                            'name' => $request->name,
                            'lat' => $request->latitude,
                            'long' => $request->longitude,
                            'address' => $request->address,
                            'pic' => $request->pic,
                            'status' => 1,
                            'image_attachment' => $file_name,
                            'created_at' => Carbon::now(),
                            'created_by' => $this->user_id 
                        ));

                    $employe_id = explode(',', $request->employe_id);

                    $latest_id = QuerySite::get_latest_added_site();
                    foreach ($employe_id as $data) {
                        DB::table('site_employees')
                            ->insert(array(
                                'site_id' => $latest_id,
                                'employe_id' => $data,
                                'status' => 1,
                                'created_at' => Carbon::now()
                            ));
                    }
                } else if (($this->role_id  == 3)) {
                    DB::table('master_site')
                        ->insert(array(
                            'site_id' => $request->site_id,
                            'name' => $request->name,
                            'lat' => $request->latitude,
                            'long' => $request->longitude,
                            'address' => $request->address,
                            'pic' => $request->pic,
                            'status' => 1,
                            'image_attachment' => $file_name,
                            'created_at' => Carbon::now(),
                            'created_by' => $this->user_id
                        ));

                    $latest_id = QuerySite::get_latest_added_site();

                    DB::table('site_employees')
                        ->insert(array(
                            'site_id' => $latest_id,
                            'employe_id' => $this->user_id,
                            'status' => 1,
                            'created_at' => Carbon::now()
                        ));
                }

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
    }

    public static function edit(Request $request)
    {

        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), "SiteController", $request->all());
        $save_photos = $request->file('photo');
        if ($save_photos) {
            $file_name = rand(1, 999999999);
            $destination = public_path("/storage/sites/images");
            $save_photos->move($destination, $file_name . ".jpg");

            try {

                DB::table('master_site')->where('id', $request->id)
                    ->update(array(
                        'site_id' => $request->site_id,
                        'name' => $request->name,
                        'lat' => $request->latitude,
                        'long' => $request->longitude,
                        'address' => $request->address,
                        'status' => $request->status,
                        'image_attachment' => $file_name,
                        'created_at' => Carbon::now(),
                        'created_by' => $this->user_id
                    ));
                // Commit Transaction
                DB::commit();
                // $employe_id = explode(',', $request->employee_id);

                // $latest_id = QuerySite::get_latest_added_site();
                // foreach ($employe_id as $data) {
                //     DB::table('site_employees')
                //         ->update(array(
                //             'site_id' => $latest_id,
                //             'employe_id' => $data,
                //             'status' => 1,
                //             'created_at' => Carbon::now()
                //         ));
                // }

                return response()->json([
                    'success' => true
                ], 200);
            } catch (Exception $e) {
                // Rollback Transaction
                DB::rollback();
            }
        }
    }

    public function delete(Request $request, $Id)
    {
        Site::where('id', $Id)
            ->update([
                'deleted_at' => Carbon::now('+07:00'),
                'deleted_by' => session('id')
            ]);

        return response()->json([
            'success' => true
        ], 200);
    }
    public function check_distance(Request $request)
    {
        $response = [];
        $sql = QuerySite::check_distance($request->latitude, $request->longitude);
        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['name'] = $data->name;
            $tmp['lat'] = $data->lat;
            $tmp['long'] = $data->long;
            $tmp['address'] = $data->address;
            $tmp['distance'] = $data->distance;
            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        return SiteHelper::convertJson($response);
    }

    public static function upload_site(Request $request)
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
                    DB::table('master_site')->insert(array(
                        'site_id' => $importData[0],
                        'name' => $importData[1],
                        'long' => $importData[2],
                        'lat' => $importData[3],
                        'address' => $importData[4],
                        'pic' => $importData[5],
                        'status' => 1,
                        'created_at' => Carbon::now(),
                        'created_by' => $user_id

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

    public function create_radius(Request $request)
    {
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        DB::beginTransaction();
        try {

            DB::table('config')
                ->insert(array(
                    'param_code' => 'max_radius_km',
                    'param_title' => $request->title,
                    'param_value' => $request->radius,
                    'message' => $request->remark
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

    public function current_radius(Request $request)
    {
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        $sql = DB::table('config')->where('inactive', 0)->first();
        return SiteHelper::convertJson($sql->param_value);

    }

    public function list_radius(Request $request)
    {
        $response = [];
        $radius_id = (empty($request->id)) ? 0 : 1;

        $sql = QuerySite::list_radius($radius_id);
        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {

            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['title'] = $data->param_title;
            $tmp['value'] = $data->param_value;
            array_push($response, $tmp);
        }
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);

        return SiteHelper::convertJson($response);

    }

    public function update_radius(Request $request)
    {
        SiteHelper::createLogs($request->ip(), $request->method(), $request->url(), $this->header, $request->all(), $this->user_id, $this->address, $this->city, $this->province);
        $id = $request->id;
        DB::beginTransaction();
        try {

            DB::table('config')->where('id', '!=', $id)
                ->update(array(
                    'inactive' => 1
                ));

            DB::table('config')->where('id', $id)
                ->update(array(
                    'inactive' => 0
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

}
