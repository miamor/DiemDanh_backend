<?php
class LopMonHoc extends Config {

    private $table_name = "tbl_lopmonhoc";

    public function __construct() {
		parent::__construct();
	}


    public function readAll () {
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

    public function readAllFromTeacher ($teacherID) {
        $cond = 'WHERE MaGVC = '.$teacherID.' OR MaGVP = '.$teacherID;
        $query = "SELECT 
                    gvc.HoTen as TenGVC,
                    gvp.HoTen as TenGVP,
                    mh.*,
                    lopMH.*,
                    lop.*
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

                -- $cond
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


    public function readOne () {
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

 ?>
