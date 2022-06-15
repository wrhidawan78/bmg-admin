<?php

namespace App\Query\Product;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class QueryProduct
{
    public static function show_products($search,$category)
    {
        $sql = "SELECT p.*, pc.category_name , uom.abbr AS uom,
                (
                    SELECT uc.name FROM users uc WHERE uc.id = p.created_by
                )AS user_creator,
                (
                    SELECT uc.name FROM users uc WHERE uc.id = p.updated_by
                )AS user_updater
                FROM 0_products p
                LEFT OUTER JOIN 0_product_category pc ON (p.category_id = pc.id)
                LEFT OUTER JOIN 0_item_units uom ON (p.uom_id = uom.id)
                WHERE p.id != -1";
        $sql .= " AND p.product_name LIKE '%$search%'";
        $sql .= " OR pc.category_name LIKE '%$category%'";
        $sql .= "ORDER BY p.id DESC";

        return $sql;
    }

    public static function view_product($product_id)
    {
        $sql = "SELECT p.*, pc.category_name , uom.abbr AS uom,
                (
                    SELECT uc.name FROM users uc WHERE uc.id = p.created_by
                )AS user_creator,
                (
                    SELECT uc.name FROM users uc WHERE uc.id = p.updated_by
                )AS user_updater
                FROM 0_products p
                LEFT OUTER JOIN 0_product_category pc ON (p.category_id = pc.id)
                LEFT OUTER JOIN 0_item_units uom ON (p.uom_id = uom.id)
                WHERE p.id = $product_id";

        return $sql;
    }

    public static function product_detail($product_id)
    {
        $sql = "SELECT * FROM 0_product_details WHERE id_product = $product_id";

        return $sql;
    }
    public static function show_category($search, $category_id)
    {
        $sql = "SELECT pc.*,
                (
                    SELECT uc.name FROM users uc WHERE uc.id = pc.created_by
                )AS user_creator,
                (
                    SELECT uc.name FROM users uc WHERE uc.id = pc.updated_by
                )AS user_updater
                FROM 0_product_category pc
                WHERE pc.created_by != -1";
        $sql .= " AND pc.id = $category_id";
        $sql .= " OR pc.category_name LIKE '%$search%'";
        $sql .= " ORDER BY pc.id DESC";

        return $sql;
    }
    public static function create_category($arr)
    {
        $params = $arr['variable'];
        $user_id = $arr['user_id'];
        DB::beginTransaction();
        try {
            DB::table('0_product_category')
                ->insert(array(
                    'category_name' => $params['name'],
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                    'created_by' => $user_id
                ));
            // Commit Transaction
            DB::commit();

            // Semua proses benar

            return response()->json([
                'success' => true,
                'data' => $params
            ]);
        } catch (Exception $e) {
            // Rollback Transaction
            DB::rollback();
        }
    }
}