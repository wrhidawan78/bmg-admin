<?php

namespace App\Api\V1\Controllers;
use JWTAuth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Dingo\Api\Routing\Helpers;
use Carbon\Carbon;
use App\Models\Cluster;
use Auth;


class ClusterController extends Controller
{
    //
    use Helpers;

    /*
     * View All Cluster
     */

    public function index() {
        $response = [];

        $clusters = Cluster::select('clusters.*', 'city.name as city_name', 'area.name as area_name','region.name as region_name')
                     ->leftJoin('area', 'area.id', '=', 'clusters.area_id')
                     ->leftJoin('city', 'city.id', '=', 'clusters.city_id')
                     ->leftJoin('region', 'region.id', '=', 'clusters.region_id')
                     ->orderBy('clusters.id')
                     ->get();

        foreach ($clusters as $cluster) {

            $tmp = [];
            $tmp['id'] = $cluster->id;
            $tmp['area'] = $cluster->area;
            $tmp['name'] = $cluster->name;
            $tmp['city_name'] = $cluster->city_name;
            $tmp['area_name'] = $cluster->area_name;
            $tmp['region_name'] = $cluster->region_name;
            
            array_push($response, $tmp);
        }

        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);

    }

     /*
     * View Selected Cluster
     */

    public function show(Request $request, $id)
    {
        $response = [];
        $Cluster = Cluster::select('*')
            ->where('id', $id)
            ->first();

        if (!$Cluster) {
            return response()->json([
                'success' => false,
                'message' => 'Cluster tidak ditemukan'
            ], 500);
    
        }   
       
        $response['id'] = $Cluster->id;
        $response['code'] = $Cluster->code;
        $response['name'] = $Cluster->name;
        
        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);
    }

    /*
     * Save Cluster Data
     */

    public function store(Request $request) {
        try {
            //validate data
            $validatedData = $request->all();
            $validator = Validator::make($request->all(), [
                'area_id' => 'required',
                'region_id' => 'required',
                'city_id' => 'required',
                'name' => 'required',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->messages()->first()
                ], 500);
            }

            Cluster::insert([
                'area_id' => $validatedData['area_id'],
                'region_id' => $validatedData['region_id'],
                'city_id' => $validatedData['city_id'],
                'name' => $validatedData['name'],
                'created_at' => Carbon::now()
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Data Cluster berhasil disimpan'
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
             ], 500);
        }
    }


    /*
     * Update All Cluster
     */

    public function update(Request $request)
    {
        try {
            //validate data
            $validatedData = $request->all();
            $validator = Validator::make($request->all(), [
                'area_id' => 'required',
                'region_id' => 'required',
                'city_id' => 'required',
                'name' => 'required',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->messages()->first()
                ], 500); 
            }

            //update Division
            $update = Cluster::where('id', $request['id'])
                ->update([
                    'area_id' => $validatedData['area_id'],
                    'region_id' => $validatedData['region_id'],
                    'city_id' => $validatedData['city_id'],
                    'name' => $validatedData['name'],
                    'updated_at' => Carbon::now()
                ]);
    
            if($update){
                return response()->json([
                    'success' => true,
                    'message' => 'Perubahan Data Cluster berhasil disimpan'
                ], 200);
            }else{
                return response()->json([
                    'success' => false,
                    'message' => 'Perubahan Data Cluster gagal'
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
     * Delete Cluster
     */

    public function delete(Request $request, $Id)
    {
        
        try {
             Cluster::where('id', $Id)
                        ->delete();

             return response()->json([
                'success' => false,
                'message' => 'data cluster berhasil dihapus'
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    } 


}
