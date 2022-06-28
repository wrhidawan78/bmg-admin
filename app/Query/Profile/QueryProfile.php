<?php

namespace App\Query\Profile;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class QueryProfile
{
    public static function index($user_id, $name, $customer)
    {
        $sql = "SELECT u.id,
                u.email,
                ud.name AS emp_name,
                '' as emp_birth_date,
                e.division_id,
                d.name as division_name,
                ud.phone_number as mobile_phone,
                '' as religion,
                ud.gender as gender,
                CASE
                WHEN u.is_active = 1 THEN 'Active' ELSE 'Non Active'
                END AS status,
                '' as address,
                '' as join_date,
                '' as resign_date,
                ''as supervisor_id,
                '' as supervisor,
                u.role_id,
                r.name as role_name
                from users u
                join user_detail ud on (u.id = ud.user_id)
                JOIN employment e ON (u.employe_id = e.id)
                LEFT OUTER JOIN division d ON (e.division_id = d.id)
                LEFT JOIN role r ON (u.role_id = r.id)
                WHERE u.is_active = 1";

        if ($user_id > 0) {
            $sql .= " AND u.id = $user_id";
        }
        if ($name != '') {
            $sql .= " AND u.email LIKE '%$name%'";
        }

        if ($customer != ''){
            $sql .= " AND ud.project_customer LIKE '%$customer%'";
        }
        return $sql;
    }
    public static function list_row($role_id)
    {
        $sql = "SELECT * FROM role";

        if ($role_id > 0) {
            $sql .= " AND id = $role_id";
        }
        return $sql;
    }
}
