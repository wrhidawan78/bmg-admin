<?php

namespace App\Query\Employee;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Site;

class QueryEmployee
{
    public static function list($name)
    {
        $sql = "SELECT e.id, e.name, e.refference_no, d.name AS division,
                CASE WHEN e.gender = 1 THEN 'MALE' ELSE 'FEMALE' END AS gender,
                CASE WHEN e.status = 1 THEN 'ACTIVE' ELSE 'INACTIVE' END AS status
                FROM employment e
                LEFT OUTER JOIN employment supervisor  ON (e.supervisor_id = supervisor.id)
                LEFT OUTER JOIN division d ON (e.division_id = d.id)
                WHERE e.id != -1";

        if ($name != '') {
            $sql .= " AND e.name LIKE '%$name%'";
        }

        $sql .= " ORDER BY e.id ASC";


        return $sql;
    }

    public static function show($employe_id)
    {
        $sql = "SELECT e.id, e.name AS emp_name,
                    e.birthday_date AS emp_birth_date,
                    e.division_id,
                    d.name AS division_name,
                    e.mobile_phone,
                    r.name AS religion,
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
                    supervisor.name AS supervisor
            FROM employment e
            LEFT OUTER JOIN division d ON (e.division_id = d.id)
            LEFT JOIN employment AS supervisor ON (e.supervisor_id = supervisor.id)
            LEFT OUTER JOIN religion r ON (e.religion = r.id)
            WHERE e.id = $employe_id";

        return $sql;
    }

    public static function division_list($division_id)
    {
        $sql = "SELECT * FROM division WHERE id != -1";
        if ($division_id > 0) {
            $sql .= " AND id = $division_id";
        }

        $sql .= " ORDER BY id ASC";


        return $sql;
    }

    public static function religion_list($religion_id)
    {
        $sql = "SELECT * FROM religion WHERE id != -1";
        if ($religion_id > 0) {
            $sql .= " AND id = $religion_id";
        }

        $sql .= " ORDER BY id ASC";


        return $sql;
    }

    public static function lisdaat($id, $name)
    {
        $sql = "SELECT *
                FROM master_site WHERE site_id != ''";

        if ($id > 0) {
            $sql .= "  AND id = $id";
        }
        if ($name != '') {
            $sql .= " AND name LIKE '%$name%'";
        }
        return $sql;
    }

    public static function get_latest_added_site()
    {
        $sql = DB::table('master_site')->select('id')->latest()
            ->first();

        return $sql->id;
    }

    public static function check_distance($lat, $long)
    {
        $get_max_distance = DB::table('config')
            ->where('param_code', 'max_radius_km')
            ->first();
        $max_distance = $get_max_distance->param_value;
        $sql = "SELECT id, name, `long`, `lat`, address, (6371*acos(cos(radians('$lat'))*cos(radians(`lat`)) 
                        *cos(radians(`long`) - radians('$long'))+sin(radians('$lat'))*sin(radians(`lat`)))) AS distance 
                    FROM master_site
                    WHERE status = 1
                    HAVING distance < $max_distance
                    ORDER BY distance";

        return $sql;
    }

    public static function area_list($area_id)
    {
        $sql = "SELECT * FROM area WHERE id != -1";
        if ($area_id > 0) {
            $sql .= " AND id = $area_id";
        }

        $sql .= " ORDER BY id ASC";


        return $sql;
    }
    public static function cluster_list($cluster_id)
    {
        $sql = "SELECT c.*, a.name as area_name FROM clusters c
                LEFT JOIN area a ON (c.area_id = a.id)
                WHERE c.id != -1";
        if ($cluster_id > 0) {
            $sql .= " AND c.id = $cluster_id";
        }

        $sql .= " ORDER BY c.id ASC";


        return $sql;
    }

    public static function get_area_name($area_id)
    {

        $sql = DB::table('area')->where('id', $area_id)->first();

        return $sql->name;
    }
}
