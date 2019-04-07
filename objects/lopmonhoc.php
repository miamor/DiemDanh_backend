<?php
class LopMonHoc extends Config
{

    private $table_name = "tbl_lopmonhoc";

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
                    ON sv.MaSV = ctlmh.MaSV
                GROUP BY lopMH.MaLMH*/

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
                $this->all_list[] = $row;
            }
        }
        return $this->all_list;
    }

    public function readAllFromTeacherInWeek($teacherID, $dates_in_week)
    {
        $dates_in_week_str = '(\''.implode('\',\'', $dates_in_week).'\')';
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
                    ON (lopMH.MaGVC = ? OR MaGVP = ?)
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

                LEFT JOIN tbl_lichhoc lich
                    ON (lich.MaLMH = lopMH.MaLMH
                        AND lich.Ngay IN $dates_in_week_str )
                ";

        //echo $query;
        
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $teacherID);
        $stmt->bindParam(2, $teacherID);
        //$stmt->bindParam(3, $dates_in_week_str);
        
        $stmt->execute();

        $this->all_list = array('Mon'=>array(), 'Tue'=>array(), 'Wed'=>array(), 'Thu'=>array(), 'Fri'=>array(), 'Sat'=>array(), 'Sun'=>array());

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            //print_r($row);
            $dayname = date("D", strtotime($row['Ngay']));

            $this->all_list[$dayname][] = $row;
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
                    ON sv.MaSV = ctlmh.MaSV
                GROUP BY lopMH.MaLMH*/

                -- ORDER BY MaLichHoc DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $this->all_list = array();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            /*if ($row['MaGVC'] == $teacherID) {
            $row['role'] = 'GVC';
            }*/
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

}
