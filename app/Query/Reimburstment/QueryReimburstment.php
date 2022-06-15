<?php

namespace App\Query\Reimburstment;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Site;

class QueryReimburstment
{

    public static function get_header_type($id)
    {
        $sql = "SELECT * FROM reimburstment_type WHERE header_id is null";

        if ($id > 0) {
            $sql .= " AND id = $id";
        }
        return $sql;
    }

    public static function get_type($header_id)
    {
        $sql = "SELECT * FROM reimburstment_type WHERE header_id is not null";

        if ($header_id > 0) {
            $sql .= " AND header_id = $header_id";
        }
        return $sql;
    }

    public static function index($emp_id, $from, $to, $mobile, $user_id)
    {
        $sql = "SELECT r.*,
                CASE 
                WHEN r.status = 0 THEN 'Need Approval'
                WHEN r.status = 1 THEN 'Approved'
                WHEN r.status = 2 THEN 'Rejected' END AS status_name,
                e.name AS creator_name,
                empapprover.name AS approver_name
                FROM reimburstment r
                LEFT JOIN users creator ON (r.submited_by = creator.id)
                LEFT JOIN users approver ON (r.approved_by = approver.id)
                LEFT OUTER JOIN employment e ON (creator.employe_id = e.id)
                LEFT OUTER JOIN employment empapprover ON (approver.employe_id = empapprover.id)
                WHERE r.id != - 1 AND r.reimburstment_date BETWEEN '$from' AND '$to'";

        if ($mobile > 0) {
            $sql .= " AND r.submited_by = $user_id";
        }
        if ($emp_id > 0) {
            $sql .= " AND e.id = $emp_id";
        }
        $sql .= " ORDER BY r.id DESC";

        return $sql;
    }
}
