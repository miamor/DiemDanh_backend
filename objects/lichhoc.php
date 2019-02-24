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
				FROM
					" . $this->table_name . "
				$cond
                ORDER BY Ngay DESC";

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
				WHERE MaLichHoc = ?";
        $stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $this->MaLMH);

		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);

        return ($row['MaLichHoc'] ? $row : null);
    }

}

 ?>
