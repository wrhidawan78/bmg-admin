<?php

namespace App\Api\V1\Controllers;
use JWTAuth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Dingo\Api\Routing\Helpers;
use Carbon\Carbon;
use App\Models\Division;
use Auth;


class DivisionController extends Controller
{
    //
    use Helpers;

    /*
     * View All Division
     */

    public function index() {
        $response = [];

        $divisions = Division::select('*')            
                     ->orderBy('id')
                     ->get();

        foreach ($divisions as $division) {

            $tmp = [];
            $tmp['id'] = $division->id;
            $tmp['division_id'] = $division->division_id;
            $tmp['name'] = $division->name;
            array_push($response, $tmp);
        }

        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);

    }

     /*
     * View Selected Division
     */

    public function show(Request $request, $id)
    {
        $response = [];
        $division = Division::select('*')
            ->where('id', $id)
            ->first();

        if (!$division) {
            return response()->json([
                'success' => false,
                'message' => 'Division tidak ditemukan'
            ], 500);
    
        }   
       
        $response['id'] = $division->id;
        $response['division_id'] = $division->division_id;
        $response['name'] = $division->name;
        
        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);
    }

    /*
     * Save Division Data
     */

    public function store(Request $request) {
        try {
            //validate data
            $validatedData = $request->all();
            $validator = Validator::make($request->all(), [
                'division_id' => 'required',
                'name' => 'required',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->messages()->first()
                ], 500);
            }

            Division::insert([
                'division_id' => $validatedData['division_id'],
                'name' => $validatedData['name'],
                'created_at' => Carbon::now()
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Data divisi berhasil disimpan'
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
             ], 500);
        }
    }


    /*
     * Update All Division
     */

    public function update(Request $request)
    {
        try {
            //validate data
            $validatedData = $request->all();
            $validator = Validator::make($request->all(), [
                'division_id' => 'required',
                'name' => 'required',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->messages()->first()
                ], 500); 
            }

            //update Division
            $update = Division::where('id', $request['id'])
                ->update([
                    'division_id' => $validatedData['division_id'],
                    'name' => $validatedData['name'],
                    'updated_at' => Carbon::now()
                ]);
    
            if($update){
                return response()->json([
                    'success' => true,
                    'message' => 'Perubahan Data divisi berhasil disimpan'
                ], 200);
            }else{
                return response()->json([
                    'success' => false,
                    'message' => 'Perubahan Data divisi gagal'
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
     * Delete Division
     */

    public function delete(Request $request, $Id)
    {
        
        try {
             Division::where('id', $Id)
                        ->delete();

             return response()->json([
                'success' => false,
                'message' => 'data divisi berhasil dihapus'
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    } 


}
