<?php
class SinhVien extends Config {

    private $table_name = "tbl_sinhvien";

    public function __construct() {
		parent::__construct();
	}

    public function getByMaLop($maLop) {
        $cond = 'WHERE MaLop = '.$maLop;
        $query = "SELECT
				    *
				FROM
					" . $this->table_name . "
				$cond
                ORDER BY HoTen DESC";

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

    public function getByMaLopMH($maLopMH) {
        //$cond = 'WHERE MaLop = '.$maLopMH;
        $query = "SELECT
				    ctlmh.MaLMH,
                    sv.*
				FROM tbl_chitietlopmonhoc ctlmh
                LEFT JOIN tbl_sinhvien sv
                    ON sv.MaSV = ctlmh.MaSV
                JOIN tbl_lopmonhoc lmh
				    ON ctlmh.MaLMH = '{$maLopMH}' 
                        AND lmh.MaLMH = ctlmh.MaLMH
                ORDER BY sv.HoTen DESC";

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

    public function readAll () {
        $cond = '';
        $query = "SELECT
				    *
				FROM
					" . $this->table_name . "
				{$cond}
                ORDER BY HoTen DESC";

		$stmt = $this->conn->prepare($query);
		$stmt->execute();

		$this->all_list = array();

		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $this->all_list[] = $row;
        }
        return $this->all_list;
    }

    public function readOne () {
        $query = "SELECT
					*
				FROM
					" . $this->table_name . "
				WHERE MaSV = ?";
        $stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $this->MaSV);

		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);

        return ($row['MaSV'] ? $row : null);
    }

}

 ?>
