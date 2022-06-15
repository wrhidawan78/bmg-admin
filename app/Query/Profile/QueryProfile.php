<?php

namespace App\Query\Profile;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class QueryProfile
{
    public static function index($user_id, $name)
    {
        $sql = "SELECT u.id,
                    u.email,
                    e.name AS emp_name,
                    e.birthday_date AS emp_birth_date,
                    e.division_id,
                    d.name AS division_name,
                    e.mobile_phone,
                    e.religion,
                    CASE
                    WHEN e.gender = 1 THEN 'MALE' ELSE 'Female'
                    END AS gender,
                    CASE
                    WHEN e.status = 1 THEN 'Active' ELSE 'Non Active'
                    END AS status,
                    e.address,
                    e.join_date,
                    e.resign_date,
                    e.supervisor_id,
                    supervisor.name AS supervisor,
                    u.role_id,
                    r.name AS role_name
            FROM users u
            JOIN employment e ON (u.employe_id = e.id)
            LEFT OUTER JOIN division d ON (e.division_id = d.id)
            LEFT JOIN employment AS supervisor ON (e.supervisor_id = supervisor.id)
            LEFT JOIN role r ON (u.role_id = r.id)";

        if ($user_id > 0) {
            $sql .= "  WHERE u.id = $user_id";
        }
        if ($name != '') {
            $sql .= " AND u.email LIKE '%$name%'";
        }
        return $sql;
    }
    public static function list_row($role_id)
    {
        $sql = "SELECT * FROM role";

        if ($role_id > 0) {
            $sql .= " WHERE id = $role_id";
        }
        return $sql;
    }
}
