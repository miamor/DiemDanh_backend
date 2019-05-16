<?php
class LopMonHoc extends Config
{

    private $table_name = "tbl_lopmonhoc";
    public $msg;

    public function __construct()
    {
        parent::__construct();
    }

    public function readAll()
    {
        $cond = '';
        $query = "SELECT
				    *
				FROM
					" . $this->table_name . "
				{$cond}
                ORDER BY MaLMH DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $this->all_list = array();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $row['Ngay'] = date("d/m/Y", strtotime($row['Ngay']));

            $row['MaHK'] = substr($row['MaHK'], 4, 5) . ', ' . substr($row['MaHK'], 0, 4);

            $this->all_list[] = $row;
        }
        return $this->all_list;
    }

    public function readAllFromMaSV($maSV)
    {
        $query = "SELECT
                    gvc.HoTen as TenGVC,
                    gvp.HoTen as TenGVP,
                    mh.*,
                    lopMH.*,
                    COUNT(ctlmh.MaSV) sv_total,
                    COUNT(dd.MaDiemDanh) total_dd,
                    COUNT(ctdd_cm.MaChitietDiemdanh) total_comat,
                    COUNT(ctdd_vp.MaChitietDiemdanh) total_vp,
                    COUNT(ctdd_vkp.MaChitietDiemdanh) total_vkp
                FROM tbl_lopmonhoc lopMH
                JOIN tbl_chitietlopmonhoc ctlmh
                    ON (ctlmh.MaLMH = lopMH.MaLMH
                        AND ctlmh.MaSV = ?)
                LEFT JOIN tbl_monhoc mh
                    ON mh.MaMH = lopMH.MaMH
                /*LEFT JOIN tbl_lop lop
                    ON lop.MaLop = lopMH.MaLop*/
                LEFT JOIN tbl_giangvien gvc
                    ON gvc.MaGV = lopMH.MaGVC
                LEFT JOIN tbl_giangvien gvp
                    ON gvp.MaGV = lopMH.MaGVP
                /*LEFT JOIN tbl_bomon bomon
                    ON bomon.MaBM = mh.MaBM*/
                LEFT JOIN tbl_lichhoc lh
                    ON lh.MaLMH = lopMH.MaLMH
                LEFT JOIN tbl_diemdanh dd
                    ON dd.MaLichHoc = lh.MaLichHoc
                LEFT JOIN tbl_chitietdiemdanh ctdd_cm
                    ON (ctdd_cm.MaDiemDanh = dd.MaDiemDanh
                        AND ctdd_cm.MaSV = ? AND ctdd_cm.TrangThai = 1)
                LEFT JOIN tbl_chitietdiemdanh ctdd_vp
                    ON (ctdd_vp.MaDiemDanh = dd.MaDiemDanh
                        AND ctdd_vp.MaSV = ? AND ctdd_vp.TrangThai = -1)
                LEFT JOIN tbl_chitietdiemdanh ctdd_vkp
                    ON (ctdd_vkp.MaDiemDanh = dd.MaDiemDanh
                        AND ctdd_vkp.MaSV = ? AND ctdd_vkp.TrangThai = -2)
                /*LEFT JOIN tbl_sinhvien sv
                    ON sv.MaSV = ctlmh.MaSV*/
                GROUP BY lopMH.MaLMH

                -- ORDER BY MaLichHoc DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $maSV);
        $stmt->bindParam(2, $maSV);
        $stmt->bindParam(3, $maSV);
        $stmt->bindParam(4, $maSV);
        $stmt->execute();

        $this->all_list = array();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            /*if ($row['MaGVC'] == $teacherID) {
            $row['role'] = 'GVC';
            }*/
            if ($row['MaLMH'] != null) {
                // $row['Ngay'] = date("d/m/Y", strtotime($row['Ngay']));

                $row['MaHK'] = substr($row['MaHK'], 4, 5) . ', ' . substr($row['MaHK'], 0, 4);

                $this->all_list[] = $row;
            }
        }
        return $this->all_list;
    }

    public function readAllFromMaSVInWeek($maSV, $dates_in_week)
    {
        $dates_in_week_str = '(\'' . implode('\',\'', $dates_in_week) . '\')';
        $query = "SELECT
                    gvc.HoTen as TenGVC,
                    gvp.HoTen as TenGVP,
                    mh.*,
                    lopMH.*,
                    lop.*,
                    lich.*,
                    COUNT(ctlmh.MaSV) sv_total
                FROM tbl_lopmonhoc lopMH
                LEFT JOIN tbl_monhoc mh
                    ON mh.MaMH = lopMH.MaMH
                LEFT JOIN tbl_lop lop
                    ON lop.MaLop = lopMH.MaLop
                LEFT JOIN tbl_giangvien gvc
                    ON gvc.MaGV = lopMH.MaGVC
                LEFT JOIN tbl_giangvien gvp
                    ON gvp.MaGV = lopMH.MaGVP
                LEFT JOIN tbl_bomon bomon
                    ON bomon.MaBM = mh.MaBM
                LEFT JOIN tbl_chitietlopmonhoc ctlmh
                    ON (ctlmh.MaLMH = lopMH.MaLMH
                        AND ctlmh.MaSV = ?)

                LEFT JOIN tbl_lichhoc lich
                    ON (lich.MaLMH = lopMH.MaLMH
                        AND lich.Ngay IN $dates_in_week_str )
                ";

        //echo $query;

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $maSV);
        //$stmt->bindParam(3, $dates_in_week_str);

        $stmt->execute();

        $this->all_list = array(
            'Mon' => array('date' => date("d/m", strtotime($dates_in_week[0])), 'data' => array()),
            'Tue' => array('date' => date("d/m", strtotime($dates_in_week[1])), 'data' => array()),
            'Wed' => array('date' => date("d/m", strtotime($dates_in_week[2])), 'data' => array()),
            'Thu' => array('date' => date("d/m", strtotime($dates_in_week[3])), 'data' => array()),
            'Fri' => array('date' => date("d/m", strtotime($dates_in_week[4])), 'data' => array()),
            'Sat' => array('date' => date("d/m", strtotime($dates_in_week[5])), 'data' => array()),
            'Sun' => array('date' => date("d/m", strtotime($dates_in_week[6])), 'data' => array()),
        );

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            //print_r($row);
            $dayname = date("D", strtotime($row['Ngay']));

            $row['Ngay'] = date("d/m/Y", strtotime($row['Ngay']));

            $row['MaHK'] = substr($row['MaHK'], 4, 5) . ', ' . substr($row['MaHK'], 0, 4);

            $this->all_list[$dayname]['data'][] = $row;
        }
        return $this->all_list;
    }

    public function readAllFromTeacherInWeek($teacherID, $dates_in_week)
    {
        $dates_in_week_str = '(\'' . implode('\',\'', $dates_in_week) . '\')';
        $query = "SELECT
                    gvc.HoTen as TenGVC,
                    gvp.HoTen as TenGVP,
                    mh.*,
                    lopMH.*,
                    lop.*,
                    lich.*,
                    COUNT(ctlmh.MaSV) sv_total
                FROM tbl_lopmonhoc lopMH
                JOIN tbl_monhoc mh
                    ON (lopMH.MaGVC = ? OR MaGVP = ?)
                        AND mh.MaMH = lopMH.MaMH
                JOIN tbl_lop lop
                    ON lop.MaLop = lopMH.MaLop
                JOIN tbl_giangvien gvc
                    ON gvc.MaGV = lopMH.MaGVC
                JOIN tbl_giangvien gvp
                    ON gvp.MaGV = lopMH.MaGVP
                /*JOIN tbl_bomon bomon
                    ON bomon.MaBM = mh.MaBM*/
                JOIN tbl_chitietlopmonhoc ctlmh
                    ON ctlmh.MaLMH = lopMH.MaLMH

                JOIN tbl_lichhoc lich
                    ON (lich.MaLMH = lopMH.MaLMH
                        AND lich.Ngay IN $dates_in_week_str )
                ";

        //echo $query;

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $teacherID);
        $stmt->bindParam(2, $teacherID);
        //$stmt->bindParam(3, $dates_in_week_str);

        $stmt->execute();

        $this->all_list = array(
            'Mon' => array('date' => date("d/m", strtotime($dates_in_week[0])), 'data' => array()),
            'Tue' => array('date' => date("d/m", strtotime($dates_in_week[1])), 'data' => array()),
            'Wed' => array('date' => date("d/m", strtotime($dates_in_week[2])), 'data' => array()),
            'Thu' => array('date' => date("d/m", strtotime($dates_in_week[3])), 'data' => array()),
            'Fri' => array('date' => date("d/m", strtotime($dates_in_week[4])), 'data' => array()),
            'Sat' => array('date' => date("d/m", strtotime($dates_in_week[5])), 'data' => array()),
            'Sun' => array('date' => date("d/m", strtotime($dates_in_week[6])), 'data' => array()),
        );

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            //print_r($row);
            $dayname = date("D", strtotime($row['Ngay']));
            $row['Ngay'] = date("d/m/Y", strtotime($row['Ngay']));

            $row['MaHK'] = substr($row['MaHK'], 4, 5) . ', ' . substr($row['MaHK'], 0, 4);

            $this->all_list[$dayname]['data'][] = $row;
        }
        return $this->all_list;
    }

    public function readAllFromTeacher($teacherID)
    {
        $query = "SELECT
                    gvc.HoTen as TenGVC,
                    gvp.HoTen as TenGVP,
                    mh.*,
                    lopMH.*,
                    lop.*,
                    COUNT(ctlmh.MaSV) sv_total
                FROM tbl_lopmonhoc lopMH
                LEFT JOIN tbl_monhoc mh
                    ON (lopMH.MaGVC = $teacherID OR MaGVP = $teacherID)
                        AND mh.MaMH = lopMH.MaMH
                LEFT JOIN tbl_lop lop
                    ON lop.MaLop = lopMH.MaLop
                LEFT JOIN tbl_giangvien gvc
                    ON gvc.MaGV = lopMH.MaGVC
                LEFT JOIN tbl_giangvien gvp
                    ON gvp.MaGV = lopMH.MaGVP
                LEFT JOIN tbl_bomon bomon
                    ON bomon.MaBM = mh.MaBM
                LEFT JOIN tbl_chitietlopmonhoc ctlmh
                    ON ctlmh.MaLMH = lopMH.MaLMH
                /*LEFT JOIN tbl_sinhvien sv
                    ON sv.MaSV = ctlmh.MaSV*/
                GROUP BY lopMH.MaLMH

                -- ORDER BY MaLichHoc DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $this->all_list = array();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            /*if ($row['MaGVC'] == $teacherID) {
            $row['role'] = 'GVC';
            }*/
            $row['Ngay'] = date("d/m/Y", strtotime($row['Ngay']));

            $row['MaHK'] = substr($row['MaHK'], 4, 5) . ', ' . substr($row['MaHK'], 0, 4);

            $this->all_list[] = $row;
        }
        return $this->all_list;
    }

    public function readOne()
    {
        $query = "SELECT
					*
				FROM
					" . $this->table_name . "
				WHERE MaLMH = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->MaLMH);

        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return ($row['MaLMH'] ? $row : null);
    }

    public function submitDSSV()
    {
        $ok = true;
        foreach ($this->DSSV as $dk => $sv) {
            // check if this sinhvien is in db
            $query = "SELECT * FROM tbl_sinhvien WHERE MaSV = ? LIMIT 0,1";

            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(1, $sv['MaSV']);
            $stmt->execute();
            $sv_record = $stmt->fetch(PDO::FETCH_ASSOC);
            // $this->msg = $sv_record;
            if (!$sv_record['MaSV']) {
                // add sinhvien
                $query = "INSERT INTO
                            tbl_sinhvien
                        SET
                            MaSV = ?, HoTen = ?, NgaySinh = ?";

                $stmty = $this->conn->prepare($query);
                $stmty->bindParam(1, $sv['MaSV']);
                $stmty->bindParam(2, $sv['HoTen']);
                $stmty->bindParam(3, date("Y-m-d H:i:s", strtotime(str_replace('/', '-', $sv['NgaySinh']))));

                if (!$stmty->execute()) {
                    $ok = false;
                    break;
                }
            }

            // check if this sinhvien is in this lopmonhoc
            $query = "SELECT * FROM tbl_chitietlopmonhoc WHERE MaSV = ? AND MaLMH = ? LIMIT 0,1";

            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(1, $sv['MaSV']);
            $stmt->bindParam(2, $this->MaLMH);
            $stmt->execute();
            $ctlmh_record = $stmt->fetch(PDO::FETCH_ASSOC);
            if (!$ctlmh_record['ID']) {
                // add this sinhvien to this lopmonhoc
                $query = "INSERT INTO
                            tbl_chitietlopmonhoc
                        SET
                            MaSV = ?, MaLMH = ?";

                $stmty = $this->conn->prepare($query);
                $stmty->bindParam(1, $sv['MaSV']);
                $stmty->bindParam(2, $this->MaLMH);

                if (!$stmty->execute()) {
                    $ok = false;
                    break;
                }
            }
        }

        return $ok;

    }

    public function stat()
    {
        $query = "SELECT
                    sv.MaSV, sv.HoTen,
                    lich.MaLichHoc,
                    ctdd.*
                FROM tbl_sinhvien sv
                LEFT JOIN tbl_chitietlopmonhoc ctlmh
                    ON ctlmh.MaLMH = ? AND ctlmh.MaSV = sv.MaSV
                RIGHT OUTER JOIN tbl_lichhoc lich
                    ON lich.MaLMH = ctlmh.MaLMH
                LEFT OUTER JOIN tbl_diemdanh dd
                    ON dd.MaLichHoc = lich.MaLichHoc
                LEFT OUTER JOIN tbl_chitietdiemdanh ctdd
                    ON ctdd.MaDiemDanh = dd.MaDiemDanh
                ";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->MaLMH);
        $stmt->execute();

        $this->all_list = array();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            if (!$this->all_list[$row['MaSV']]) {
                $this->all_list[$row['MaSV']] = array();
            }
            $this->all_list[$row['MaSV']][$row['MaLichHoc']] = $row;
        }

        return $this->all_list;
    }

    public function stat_by_lichhoc()
    {
        $query = "SELECT
                    sv.*,
                    lich.*,
                    ctdd.*
                FROM tbl_chitietdiemdanh ctdd
                LEFT JOIN tbl_diemdanh dd
                    ON ctdd.MaDiemDanh = dd.MaDiemDanh
                LEFT JOIN tbl_chitietlopmonhoc ctlmh
                    ON ctlmh.MaLMH = ?
                RIGHT JOIN tbl_lichhoc lich
                    ON (lich.MaLMH = ctlmh.MaLMH AND dd.MaLichHoc = lich.MaLichHoc)
                LEFT JOIN tbl_sinhvien sv
                    ON ctlmh.MaSV = sv.MaSV
                ";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->MaLMH);
        $stmt->execute();

        $this->all_list = array();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            if (!$this->all_list[$row['MaLichHoc']]) {
                $this->all_list[$row['MaLichHoc']] = array();
            }
            if ($row['MaSV']) {
                $this->all_list[$row['MaLichHoc']][$row['MaSV']] = $row;
            }
        }

        return $this->all_list;
    }

}
