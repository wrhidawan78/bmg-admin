<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;

class ReimburstExport implements FromCollection, WithHeadings, ShouldAutoSize, WithEvents
{
    /**
     * @return \Illuminate\Support\Collection
     */
    function __construct($from, $to, $emp_id, $status)
    {
        $this->from = $from;
        $this->to = $to;
        $this->emp_id = $emp_id;
        $this->status = $status;
    
    }
    public function collection()
    {
        set_time_limit(0);
        $from = $this->from;
        $to = $this->to;
        $emp_id = $this->emp_id;
        $status = $this->status;
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

        if($emp_id > 0){
            $sql .= " AND e.id = $emp_id";
        }

        $sql .= " AND r.status IN ('$status')";
        

        $exec_sql = DB::select(DB::raw($sql));
        foreach ($exec_sql as $data) {
            $no = 1;
            $output[] = [
                $no++,
                $data->document_no,
                $data->title,
                $data->reimburstment_date,
                $data->creator_name,
                $data->total,
                $data->status_name,
                $data->note,
            ];
        }
        return collect($output);
    }
    public function headings(): array
    {
        return [
            'No.',
            'Document No.',
            'Title',
            'Date',
            'Employee',
            'Amount',
            'Status',
            'Note',

        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $cellRange = 'A1:H1'; // All headers
                $event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setSize(14);
            },
        ];
    }
}
