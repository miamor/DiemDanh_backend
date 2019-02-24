<?php
class MonHoc extends Config {

    private $table_name = "tbl_monhoc";

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
                ORDER BY TenMH DESC";

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
				WHERE MaMH = ?";
        $stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $this->MaSV);

		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);

        return ($row['MaMH'] ? $row : null);
    }

}

 ?>
