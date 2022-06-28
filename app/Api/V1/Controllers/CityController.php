<?php

namespace App\Api\V1\Controllers;
use JWTAuth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Dingo\Api\Routing\Helpers;
use Carbon\Carbon;
use App\Models\City;
use Auth;


class CityController extends Controller
{
    //
    use Helpers;

    /*
     * View All City
     */

    public function index() {
        $response = [];

        $cities = City::select('*')            
                     ->orderBy('id')
                     ->get();

        foreach ($cities as $city) {

            $tmp = [];
            $tmp['id'] = $city->id;
            $tmp['code'] = $city->code;
            $tmp['name'] = $city->name;
            array_push($response, $tmp);
        }

        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);

    }

     /*
     * View Selected City
     */

    public function show(Request $request, $id)
    {
        $response = [];
        $city = City::select('*')
            ->where('id', $id)
            ->first();

        if (!$city) {
            return response()->json([
                'success' => false,
                'message' => 'City tidak ditemukan'
            ], 500);
    
        }   
       
        $response['id'] = $city->id;
        $response['code'] = $city->code;
        $response['name'] = $city->name;
        
        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);
    }

    /*
     * Save City Data
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

            City::insert([
                'code' => $validatedData['code'],
                'name' => $validatedData['name'],
                'created_at' => Carbon::now()
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Data City berhasil disimpan'
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
             ], 500);
        }
    }


    /*
     * Update All City
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
            $update = City::where('id', $request['id'])
                ->update([
                    'code' => $validatedData['code'],
                    'name' => $validatedData['name'],
                    'updated_at' => Carbon::now()
                ]);
    
            if($update){
                return response()->json([
                    'success' => true,
                    'message' => 'Perubahan Data City berhasil disimpan'
                ], 200);
            }else{
                return response()->json([
                    'success' => false,
                    'message' => 'Perubahan Data City gagal'
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
     * Delete City
     */

    public function delete(Request $request, $Id)
    {
        
        try {
             City::where('id', $Id)
                        ->delete();

             return response()->json([
                'success' => false,
                'message' => 'data City berhasil dihapus'
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    } 


}
