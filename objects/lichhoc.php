<?php
class LichHoc extends Config {

    private $table_name = "tbl_lichhoc";

    public function __construct() {
		parent::__construct();
	}


    public function getByMaLMH ($maLMH) {
        $cond = 'WHERE MaLMH = '.$maLMH;
        $query = "SELECT
                    *
				FROM tbl_lichhoc lich
                LEFT JOIN tbl_diemdanh dd
                    ON dd.MaLichHoc = lich.MaLichHoc
                LEFT JOIN tbl_lopmonhoc lh
                    ON lh.MaLMH = lich.MaLMH
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
