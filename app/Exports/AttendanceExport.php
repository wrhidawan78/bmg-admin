<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;

class AttendanceExport implements FromCollection, WithHeadings, ShouldAutoSize, WithEvents
{
    /**
     * @return \Illuminate\Support\Collection
     */
    function __construct($from, $to, $emp_id)
    {
        $this->from = $from;
        $this->to = $to;
        $this->emp_id = $emp_id;
    
    }
    public function collection()
    {
        set_time_limit(0);
        $from = $this->from;
        $to = $this->to;
        $emp_id = $this->emp_id;

        $sql = "SELECT a.*, e.name AS username, ms.name AS site_name FROM attendance a
                LEFT OUTER JOIN users u ON (a.user_id = u.id)
                LEFT OUTER JOIN employment e ON (u.employe_id = e.id)
                LEFT OUTER JOIN master_site ms ON (a.site_id = ms.id)
                WHERE a.id != -1 AND DATE(a.check_in) BETWEEN '$from' AND '$to'";

        if($emp_id > 0){
            $sql .= " AND e.id = $emp_id";
        }

        $exec_sql = DB::select(DB::raw($sql));
        foreach ($exec_sql as $data) {
            $no = 1;
            $output[] = [
                $no++,
                $data->username,
                $data->site_name,
                $data->check_in,
                $data->check_out,
                $data->check_in_lat,
                $data->check_in_long,
                $data->check_out_lat,
                $data->check_out_long,
                $data->remark,
            ];
        }
        return collect($output);
    }
    public function headings(): array
    {
        return [
            'No.',
            'Name',
            'Site Name',
            'Attendance IN',
            'Attendance OUT',
            'Latitude IN',
            'Longitude IN',
            'Latitude OUT',
            'Longitude OUT',
            'Note',

        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $cellRange = 'A1:J1'; // All headers
                $event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setSize(14);
            },
        ];
    }
}
