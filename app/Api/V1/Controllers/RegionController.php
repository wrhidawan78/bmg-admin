<?php

namespace App\Api\V1\Controllers;
use JWTAuth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Dingo\Api\Routing\Helpers;
use Carbon\Carbon;
use App\Models\Region;
use Auth;


class RegionController extends Controller
{
    //
    use Helpers;

    /*
     * View All Region
     */

    public function index() {
        $response = [];

        $regions = Region::select('*')            
                     ->orderBy('id')
                     ->get();

        foreach ($regions as $region) {

            $tmp = [];
            $tmp['id'] = $region->id;
            $tmp['code'] = $region->code;
            $tmp['name'] = $region->name;
            array_push($response, $tmp);
        }

        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);

    }

     /*
     * View Selected Region
     */

    public function show(Request $request, $id)
    {
        $response = [];
        $region = Region::select('*')
            ->where('id', $id)
            ->first();

        if (!$region) {
            return response()->json([
                'success' => false,
                'message' => 'Region tidak ditemukan'
            ], 500);
    
        }   
       
        $response['id'] = $region->id;
        $response['code'] = $region->code;
        $response['name'] = $region->name;
        
        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);
    }

    /*
     * Save Region Data
     */

    public function store(Request $request) {
        try {
            //validate data
            $validatedData = $request->all();
            $validator = Validator::make($request->all(), [
                'code' => 'required',
                'name' => 'required',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->messages()->first()
                ], 500);
            }

            Region::insert([
                'code' => $validatedData['code'],
                'name' => $validatedData['name'],
                'created_at' => Carbon::now()
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Data region berhasil disimpan'
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
             ], 500);
        }
    }


    /*
     * Update All Region
     */

    public function update(Request $request)
    {
        try {
            //validate data
            $validatedData = $request->all();
            $validator = Validator::make($request->all(), [
                'code' => 'required',
                'name' => 'required',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->messages()->first()
                ], 500); 
            }

            //update Division
            $update = Region::where('id', $request['id'])
                ->update([
                    'code' => $validatedData['code'],
                    'name' => $validatedData['name'],
                    'updated_at' => Carbon::now()
                ]);
    
            if($update){
                return response()->json([
                    'success' => true,
                    'message' => 'Perubahan Data region berhasil disimpan'
                ], 200);
            }else{
                return response()->json([
                    'success' => false,
                    'message' => 'Perubahan Data region gagal'
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
     * Delete Region
     */

    public function delete(Request $request, $Id)
    {
        
        try {
             Region::where('id', $Id)
                        ->delete();

             return response()->json([
                'success' => false,
                'message' => 'data region berhasil dihapus'
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    } 


}
