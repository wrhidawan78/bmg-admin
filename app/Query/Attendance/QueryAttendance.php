<?php

namespace App\Query\Attendance;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Site;

class QueryAttendance
{
    public static function index($user_id, $from, $to)
    {
        $sql = "SELECT a.*, ud.name AS username, ms.name AS site_name 
                FROM attendance a
                LEFT OUTER JOIN users u ON (a.user_id = u.id)
                LEFT OUTER JOIN employment e ON (u.employe_id = e.refference_no)
                LEFT OUTER JOIN user_detail ud ON (ud.user_id = u.id)
                LEFT OUTER JOIN master_site ms ON (a.site_id = ms.id)
                WHERE a.id != -1 AND DATE(a.check_in) BETWEEN '$from' AND '$to'";
        // LEFT OUTER JOIN employment e ON (u.employe_id = e.id)
        if ($user_id > 0) {
            $sql .= " AND a.user_id = $user_id";
        }

        $sql .= " GROUP BY a.id ORDER BY a.id DESC";


        return $sql;
    }

    public static function get_attachment($id, $type)
    {
        $sql = DB::table('attendance_attachment')->where('attendance_id', $id)->where('type', $type)->first();

        if (empty($sql->full_path)) {
            return null;
        } else {
            return $sql->full_path;
        }
    }

    public static function attendance_logs($emp_id,$from,$to)
    {
        $sql = "SELECT al.*, e.name AS emp_name, ms.site_id FROM attendance_logs al
                LEFT OUTER JOIN users u ON (al.user_id = u.id)
                LEFT OUTER JOIN employment e ON (u.employe_id = e.id)
                LEFT OUTER JOIN master_site ms ON (al.site_no = ms.id)
                WHERE DATE(al.created_at) BETWEEN '$from' AND '$to'";

        if($emp_id > 0){
            $sql .= " AND e.id = $emp_id";
        }
        
        $sql .= " ORDER BY al.id DESC";
                

        return $sql;
    }
}
