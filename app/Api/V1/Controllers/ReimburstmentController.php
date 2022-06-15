<?php

namespace App\Api\V1\Controllers;

use SiteHelper;
use App\Http\Controllers\Controller;
use App\Models\Attendance;
use App\Models\Config;
use App\Models\Site;
use App\Exports\ReimburstExport;
use Carbon\Carbon;
use Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\User;
use JWTAuth;
use Auth;
use App\Query\Reimburstment\QueryReimburstment;
use Hash;
use Maatwebsite\Excel\Facades\Excel;

class ReimburstmentController extends Controller
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

        $this->header = 'ReimbursmentController';
        $this->folder = 'reimburstment';

        $this->myPage = $request->page;
        $this->myUrl = $request->url();
        $this->query = $request->query();

        if (empty($request->perpage)) {
            $this->perPage = 10;
        } else {
            $this->perPage = $request->perpage;
        }
    }

    public function header_type(Request $request)
    {
        if (empty($request->id)) {
            $id = 0;
        } else {
            $id = $request->id;
        }

        $response = [];
        $sql = QueryReimburstment::get_header_type($id);

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

    public function type(Request $request)
    {
        if (empty($request->header_id)) {
            $header_id = 0;
        } else {
            $header_id = $request->header_id;
        }

        $response = [];
        $sql = QueryReimburstment::get_type($header_id);

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

    public function index(Request $request)
    {
        $time_from = date('m') - 1;
        if (empty($request->emp_id)) {
            $emp_id = 0;
        } else {
            $emp_id = $request->emp_id;
        }
        if (empty($request->from)) {
            $from = date("Y-$time_from-d");
        } else {
            $from = $request->from;
        }
        if (empty($request->to)) {
            $to = date('Y-m-d');
        } else {
            $to = $request->to;
        }
        if (empty($request->mobile)) {
            $mobile = 0;
        } else {
            $mobile = $request->mobile;
        }

        $response = [];
        $sql = QueryReimburstment::index($emp_id, $from, $to, $mobile, $this->user_id);

        $exec_sql = SiteHelper::exec_query($sql);
        foreach ($exec_sql as $data) {
            $tmp = [];
            $tmp['id'] = $data->id;
            $tmp['document_no'] = $data->document_no;
            $tmp['title'] = $data->title;
            $tmp['total'] = $data->total;
            $tmp['note'] = $data->note;
            $tmp['km_mobil'] = $data->km_mobil;
            $tmp['genset_start'] = $data->genset_start;
            $tmp['genset_end'] = $data->genset_end;
            $tmp['genset_total'] = $data->genset_total;
            $tmp['no_genset'] = $data->no_genset;
            $tmp['date'] = $data->reimburstment_date;
            $tmp['status_id'] = $data->status;
            $tmp['status_name'] = $data->status_name;
            $tmp['employee'] = $data->creator_name;

            $get_attachment = self::get_attachment_reimburst($data->document_no);
            $exe_get_attachment = SiteHelper::exec_query($get_attachment);
            foreach ($exe_get_attachment as $list) {
                $image = [];
                $image['image'] = $list->full_path;

                $tmp['attachment'][] = $image;
            }

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

    public function update(Request $request)
    {

        if (empty($request->reason)) {
            $reason = null;
        } else {
            $reason = $request->reason;
        }
        DB::beginTransaction();
        try {
            $status = $request->status;
            if ($status == 1) {
                DB::table('reimburstment')->where('id', $request->id)
                    ->update(array(
                        'status' => $request->status,
                        'approved_by' => $this->user_id,
                        'approved_at' => Carbon::now()
                    ));
            } else if ($status == 2) {
                DB::table('reimburstment')->where('id', $request->id)
                    ->update(array(
                        'status' => $request->status,
                        'reject_by' => $this->user_id,
                        'reject_reason' => $reason,
                        'reject_at' => Carbon::now()
                    ));
            }


            DB::commit();

            return response()->json([
                'success' => true
            ], 200);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }

    public function add_reimburst(Request $request)
    {
        $type = $request->type;

        $date = date('Y-m-d');
        $fileupload = $request->all();
        $data = ['fileupload'];
        $rand = date('Ymd') . $type . rand(1, 9999);
        $doc_no = $rand;
        $tmp = [];

        switch ($type) {
            case 1;
                DB::table('reimburstment')->insert(array(
                    'document_no' => $doc_no,
                    'title' => 'bbm_ops',
                    'note' => $request->data1,
                    'total' => $request->data2,
                    'km_mobil' => $request->data3,
                    'reimburstment_date' => $date,
                    'submited_by' => $this->user_id,
                    'submited_at' => Carbon::now()
                ));

                break;

            case 2;
                DB::table('reimburstment')->insert(array(
                    'document_no' => $doc_no,
                    'title' => 'bbm_genset',
                    'genset_start' => $request->data1,
                    'genset_end' => $request->data2,
                    'genset_total' => $request->data3,
                    'no_genset' => $request->data4,
                    'total' => $request->data5,
                    'note' => $request->data6,
                    'reimburstment_date' => $date,
                    'submited_by' => $this->user_id,
                    'submited_at' => Carbon::now()
                ));

                break;
            case 3;
            case 4;
            case 5;
                if ($type == 3) {
                    $title = 'vehicle_ops';
                }
                if ($type == 4) {
                    $title = 'coordinate_fee';
                }
                if ($type == 5) {
                    $title = 'material_fee';
                }
                DB::table('reimburstment')->insert(array(
                    'document_no' => $doc_no,
                    'title' => $title,
                    'note' => $request->data1,
                    'total' => $request->data2,
                    'reimburstment_date' => $date,
                    'submited_by' => $this->user_id,
                    'submited_at' => Carbon::now()
                ));

                break;
        }


        if ($data1 = $request->file('photo1')) {
            $file1 = [];
            $file1['name_file'] = "R" . date('Ymd') . rand(1, 9999999999);
            $file1['asset_type_name'] = $request->asset_type_name;
            $tmp['list1'][] = $file1;

            $destination = public_path("/storage/reimburstment/images");
            $data1->move($destination, $file1['name_file'] . ".jpg");

            DB::table('reimburstment_attachment')->insert(array(
                'reimburse_no' => $doc_no,
                'full_path' => SiteHelper::path_file($this->folder,  $file1['name_file']),
                'created_at' => Carbon::now()
            ));
        }
        if ($data2 = $request->file('photo2')) {
            $file2 = [];
            $file2['name_file'] = "R" . date('Ymd') . rand(1, 9999999999);
            $file2['asset_type_name'] = $request->asset_type_name;
            $tmp['list2'][] = $file2;

            $destination = public_path("/storage/reimburstment/images");
            $data2->move($destination, $file2['name_file'] . ".jpg");

            DB::table('reimburstment_attachment')->insert(array(
                'reimburse_no' => $doc_no,
                'full_path' => SiteHelper::path_file($this->folder,  $file2['name_file']),
                'created_at' => Carbon::now()
            ));
        }
        if ($data3 = $request->file('photo3')) {
            $file3 = [];
            $file3['name_file'] = "R" . date('Ymd') . rand(1, 9999999999);
            $file3['asset_type_name'] = $request->asset_type_name;
            $tmp['list3'][] = $file3;

            $destination = public_path("/storage/reimburstment/images");
            $data3->move($destination, $file3['name_file'] . ".jpg");

            DB::table('reimburstment_attachment')->insert(array(
                'reimburse_no' => $doc_no,
                'full_path' => SiteHelper::path_file($this->folder,  $file3['name_file']),
                'created_at' => Carbon::now()
            ));
        }
        if ($data4 = $request->file('photo4')) {
            $file4 = [];
            $file4['name_file'] = "R" . date('Ymd') . rand(1, 9999999999);
            $file4['asset_type_name'] = $request->asset_type_name;
            $tmp['list4'][] = $file4;

            $destination = public_path("/storage/reimburstment/images");
            $data4->move($destination, $file4['name_file'] . ".jpg");

            DB::table('reimburstment_attachment')->insert(array(
                'reimburse_no' => $doc_no,
                'full_path' => SiteHelper::path_file($this->folder,  $file4['name_file']),
                'created_at' => Carbon::now()
            ));
        }

        if ($request->signature) {
            $image_64 = $request->signature; //your base64 encoded data

            $extension = explode('/', explode(':', substr($image_64, 0, strpos($image_64, ';')))[1])[1];   // .jpg .png .pdf

            $replace = substr($image_64, 0, strpos($image_64, ',') + 1);

            // find substring fro replace here eg: data:image/png;base64,

            $image = str_replace($replace, '', $image_64);

            $image = str_replace(' ', '+', $image);

            $imageName = "RS" . date('Ymd') . rand(1, 9999999999) . '.' . $extension;

            $output_file = 'storage/reimburstment/images/' . $imageName;

            Storage::disk('public')->put($output_file, base64_decode($image));

            DB::table('reimburstment_attachment')->insert(array(
                'reimburse_no' => $doc_no,
                'full_path' => SiteHelper::path_file($this->folder,  $imageName),
                'created_at' => Carbon::now()
            ));
        }

        array_push($data, $tmp);

        return response()->json([
            'success' => true,
            'data' => $data
        ], 200);
    }

    public static function get_attachment_reimburst($reimburse_no)
    {
        $sql = "SELECT * FROM reimburstment_attachment WHERE reimburse_no = $reimburse_no";

        return $sql;
    }

    public function export_reimburst(Request $request)
    {
        $filename = "ReimburstList";
        $back_month = date('m') - 1;
        $from = (empty($request->from)) ? date("Y-$back_month-d") : $request->from;
        $to = (empty($request->to)) ? date('Y-m-d') : $request->to;
        $emp_id = (empty($request->emp_id)) ? 0 : $request->emp_id;
        $status = (empty($request->status)) ? '1,2,3' : $request->status;

        return Excel::download(new ReimburstExport($from, $to, $emp_id,$status), "$filename.xlsx");
    }
}
