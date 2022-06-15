<?php

namespace App\Query\Site;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Site;

class QuerySite
{
    public static function index($id)
    {
        $sql = Site::select(
            'master_site.*',
            'image.full_path',
            'e.name as employe_name',
            'se.id as site_employe_id'
        )
            ->leftJoin('master_site_attachment as image', 'master_site.id', '=', 'image.site_id')
            ->leftJoin('site_employees as se', function ($q) {
                $q->on('se.site_id', 'master_site.id')
                    ->whereRaw('se.deleted_at is null');
            })
            ->leftJoin('employment as e', function ($q) {
                $q->on('e.id', 'se.employe_id')
                    ->where('e.status', 1)
                    ->whereRaw('e.deleted_at is null');
            })
            ->where('master_site.id', $id)
            ->groupBy('master_site.id')
            ->get();

        return $sql;
    }

    public static function list($id, $name)
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
            ->where('param_code', 'max_radius_m')
            ->first();
        $max_distance = $get_max_distance->param_value / 1000;
        $sql = "SELECT id, name, `long`, `lat`, address, (6371*acos(cos(radians('$lat'))*cos(radians(`lat`)) 
                        *cos(radians(`long`) - radians('$long'))+sin(radians('$lat'))*sin(radians(`lat`)))) AS distance 
                    FROM master_site
                    WHERE status = 1
                    HAVING distance < $max_distance
                    ORDER BY distance";

        return $sql;
    }
    public static function list_radius($id)
    {
        $sql = "SELECT * FROM config";

        if ($id > 0) {
            $sql .= " WHERE id = $id";
        }
        
        return $sql;
    }
}
