<?php

namespace App\Api\V1\Controllers;
use JWTAuth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Dingo\Api\Routing\Helpers;
use Carbon\Carbon;
use App\Models\Customer;
use Auth;


class CustomerController extends Controller
{
    //
    use Helpers;

    /*
     * View All Customer
     */

    public function index() {
        $response = [];

        $customers = Customer::select('*')            
                     ->orderBy('id')
                     ->get();

        foreach ($customers as $customer) {

            $tmp = [];
            $tmp['id'] = $customer->id;
            $tmp['code'] = $customer->code;
            $tmp['name'] = $customer->name;
            array_push($response, $tmp);
        }

        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);

    }

     /*
     * View Selected Customer
     */

    public function show(Request $request, $id)
    {
        $response = [];
        $customer = Customer::select('*')
            ->where('id', $id)
            ->first();

        if (!$customer) {
            return response()->json([
                'success' => false,
                'message' => 'customer tidak ditemukan'
            ], 500);
    
        }   
       
        $response['id'] = $employee->id;
        $response['code'] = $employee->code;
        $response['name'] = $employee->name;
        
        return response()->json([
            'success' => true,
            'data' => $response
        ], 200);
    }

    /*
     * Save Customer Data
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

            Customer::insert([
                'code' => $validatedData['code'],
                'name' => $validatedData['name'],
                'created_at' => Carbon::now()
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Data customer berhasil disimpan'
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
             ], 500);
        }
    }


    /*
     * Update All Customer
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

            //update customer
            $update = Customer::where('id', $request['id'])
                ->update([
                    'code' => $validatedData['code'],
                    'name' => $validatedData['name'],
                    'updated_at' => Carbon::now()
                ]);
    
            if($update){
                return response()->json([
                    'success' => true,
                    'message' => 'Perubahan Data customer berhasil disimpan'
                ], 200);
            }else{
                return response()->json([
                    'success' => false,
                    'message' => 'Perubahan Data customer gagal'
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
     * Delete Customer
     */

    public function delete(Request $request, $Id)
    {
        
        try {
             Customer::where('id', $Id)
                        ->delete();

             return response()->json([
                'success' => false,
                'message' => 'data customer berhasil dihapus'
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    } 


}
