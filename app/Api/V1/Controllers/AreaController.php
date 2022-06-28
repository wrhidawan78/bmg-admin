<?php

namespace App\Api\V1\Controllers;
use JWTAuth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Dingo\Api\Routing\Helpers;
use Carbon\Carbon;
use App\Models\Area;
use Auth;


class AreaController extends Controller
{
    //
    use Helpers;

    /*
     * View All Area
     */

    public function index() {
        $response = [];

        $areas = Area::select('*')            
                     ->orderBy('id')
                     ->get();

        foreach ($areas as $area) {

            $tmp = [];
            $tmp['id'] = $area->id;
            $tmp['area'] = $area->area;
            $tmp['name'] = $area->name;
            array_push($response, $tmp);
        }

        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);

    }

     /*
     * View Selected Area
     */

    public function show(Request $request, $id)
    {
        $response = [];
        $area = Area::select('*')
            ->where('id', $id)
            ->first();

        if (!$area) {
            return response()->json([
                'success' => false,
                'message' => 'Area tidak ditemukan'
            ], 500);
    
        }   
       
        $response['id'] = $area->id;
        $response['area'] = $area->area;
        $response['name'] = $area->name;
        
        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);
    }

    /*
     * Save Area Data
     */

    public function store(Request $request) {
        try {
            //validate data
            $validatedData = $request->all();
            $validator = Validator::make($request->all(), [
                'area' => 'required',
                'name' => 'required',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->messages()->first()
                ], 500);
            }

            Area::insert([
                'area' => $validatedData['area'],
                'name' => $validatedData['name'],
                'created_at' => Carbon::now()
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Data area berhasil disimpan'
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
             ], 500);
        }
    }


    /*
     * Update All Area
     */

    public function update(Request $request)
    {
        try {
            //validate data
            $validatedData = $request->all();
            $validator = Validator::make($request->all(), [
                'area' => 'required',
                'name' => 'required',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->messages()->first()
                ], 500); 
            }

            //update Division
            $update = Area::where('id', $request['id'])
                ->update([
                    'area' => $validatedData['area'],
                    'name' => $validatedData['name'],
                    'updated_at' => Carbon::now()
                ]);
    
            if($update){
                return response()->json([
                    'success' => true,
                    'message' => 'Perubahan Data area berhasil disimpan'
                ], 200);
            }else{
                return response()->json([
                    'success' => false,
                    'message' => 'Perubahan Data area gagal'
                ], 500);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /*
     * Delete Area
     */

    public function delete(Request $request, $Id)
    {
        
        try {
             Area::where('id', $Id)
                        ->delete();

             return response()->json([
                'success' => false,
                'message' => 'data area berhasil dihapus'
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    } 


}
