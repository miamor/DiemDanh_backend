<?php
class LichHoc extends Config {

    private $table_name = "tbl_lichhoc";

    public function __construct() {
		parent::__construct();
	}


    public function getByMaLMH ($maLMH) {
        $cond = 'WHERE MaLMH = '.$maLMH;
        $query = "SELECT
                    lich.*,
                    lh.*,
                    dd.MaDiemDanh, dd.NgayDiemDanh,
                    count(ctdd_comat.MaSV) comat,
                    count(ctdd_vp.MaSV) vp,
                    count(ctdd_vkp.MaSV) vkp
				FROM tbl_lichhoc lich
                LEFT JOIN tbl_diemdanh dd
                    ON dd.MaLichHoc = lich.MaLichHoc
                LEFT JOIN tbl_lopmonhoc lh
                    ON lh.MaLMH = lich.MaLMH

                LEFT JOIN tbl_chitietdiemdanh ctdd_comat
                    ON (ctdd_comat.MaDiemDanh = dd.MaDiemDanh
                        AND ctdd_comat.TrangThai = 1)
                LEFT JOIN tbl_chitietdiemdanh ctdd_vp
                    ON (ctdd_vp.MaDiemDanh = dd.MaDiemDanh
                        AND ctdd_vp.TrangThai = -1)
                LEFT JOIN tbl_chitietdiemdanh ctdd_vkp
                    ON (ctdd_vkp.MaDiemDanh = dd.MaDiemDanh
                        AND ctdd_vkp.TrangThai = -2)
                GROUP BY lich.MaLichHoc
                ORDER BY lich.Ngay DESC";

		$stmt = $this->conn->prepare($query);
		$stmt->execute();

		$this->all_list = array();

		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            /*if ($row['MaGVC'] == $teacherID) {
                $row['role'] = 'GVC';
            }*/
            if ($row['MaDiemDanh'] != null) {
                $row['DaDiemDanh'] = true;
            } else {
                $row['DaDiemDanh'] = false;
            }
            $this->all_list[] = $row;
        }
        return $this->all_list;
    }


    public function getByMaLMH_PH ($maLMH, $maSV) {
        $query = "SELECT
                    lich.*,
                    lh.*,
                    dd.MaDiemDanh, dd.NgayDiemDanh,
                    ctdd.TrangThai TrangThai_SV, ctdd.GhiChu, ctdd.MaChitietDiemdanh
				FROM tbl_lichhoc lich
                LEFT JOIN tbl_lopmonhoc lh
                    ON lh.MaLMH = lich.MaLMH

                LEFT JOIN tbl_diemdanh dd
                    ON dd.MaLichHoc = lich.MaLichHoc

                LEFT JOIN tbl_chitietdiemdanh ctdd
                    ON (ctdd.MaDiemDanh = dd.MaDiemDanh
                        AND ctdd.MaSV = ?)
                ORDER BY lich.Ngay DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $maSV);
		$stmt->execute();

		$this->all_list = array();

		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            /*if ($row['MaGVC'] == $teacherID) {
                $row['role'] = 'GVC';
            }*/
            if ($row['MaDiemDanh'] != null) {
                $row['DaDiemDanh'] = true;
            } else {
                $row['DaDiemDanh'] = false;
            }
            if ($row['TrangThai_SV'] == 1) {
                $row['TrangThai_SV_Text'] = 'Có mặt';
            } else if ($row['TrangThai_SV'] == -1) {
                $row['TrangThai_SV_Text'] = 'Vắng phép';
            } else if ($row['TrangThai_SV'] == -2) {
                $row['TrangThai_SV_Text'] = 'Vắng không phép';
            }
            $this->all_list[] = $row;
        }
        return $this->all_list;
    }


    public function readOne () {
        $query = "SELECT
					*
				FROM
					" . $this->table_name . "
				WHERE MaLichHoc = ?";
        $stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $this->MaLMH);

		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);

        return ($row['MaLichHoc'] ? $row : null);
    }

}

 ?>
