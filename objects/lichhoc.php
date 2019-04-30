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
                    /*count(ctdd_vp.MaSV) vp,
                    count(ctdd_vkp.MaSV) vkp*/
                    ctdd.*
				FROM tbl_lichhoc lich
                LEFT JOIN tbl_diemdanh dd
                    ON dd.MaLichHoc = lich.MaLichHoc
                JOIN tbl_lopmonhoc lh
                    ON lh.MaLMH = lich.MaLMH AND lh.MaLMH = ?
                
                /*LEFT JOIN tbl_chitietdiemdanh ctdd_vp
                    ON (ctdd_vp.MaDiemDanh = dd.MaDiemDanh
                        AND ctdd_vp.TrangThai = -1)
                LEFT JOIN tbl_chitietdiemdanh ctdd_vkp
                    ON (ctdd_vkp.MaDiemDanh = dd.MaDiemDanh
                        AND ctdd_vkp.TrangThai = -2)*/

                LEFT JOIN tbl_chitietdiemdanh ctdd
                    ON ctdd.MaDiemDanh = dd.MaDiemDanh

                /*GROUP BY lich.MaLichHoc*/
                ORDER BY lich.Ngay DESC";

		$stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $maLMH);
		$stmt->execute();

		$this->all_list = array();

        $comat = array();
        $vp = array();
        $vkp = array();
        $order = array();

		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            /*if ($row['MaGVC'] == $teacherID) {
                $row['role'] = 'GVC';
            }*/
            if ($row['MaDiemDanh'] != null) {
                $row['DaDiemDanh'] = true;
            } else {
                $row['DaDiemDanh'] = false;
            }
            //$row['tongvang'] = (int)($row['vp']) + (int)($row['vkp']);
            
            $row['Ngay'] = date("d/m/Y", strtotime($row['Ngay']));

            // $this->all_list[$row['MaLichHoc']][] = $row;
            // $this->all_list[] = $row;

            if (!$comat[$row['MaLichHoc']]) {
                $comat[$row['MaLichHoc']] = 0;
            }
            if (!$vp[$row['MaLichHoc']]) {
                $vp[$row['MaLichHoc']] = 0;
            }
            if (!$vkp[$row['MaLichHoc']]) {
                $vkp[$row['MaLichHoc']] = 0;
            }
            // if (!$order[$row['MaLichHoc']]) {
            //     $order[$row['MaLichHoc']] = count($order);
            //     $this->all_list[$order[$row['MaLichHoc']]] = $row;
            // } else {
            //     $ord = $order[$row['MaLichHoc']];
            // }

            if (!$this->all_list[$row['MaLichHoc']]) {
                $this->all_list[$row['MaLichHoc']] = $row;
            }
            $ord = $row['MaLichHoc'];

            if ($row['TrangThai'] == 1) $comat[$row['MaLichHoc']]++;
            if ($row['TrangThai'] == -1) $vp[$row['MaLichHoc']]++;
            if ($row['TrangThai'] == -2) $vkp[$row['MaLichHoc']]++;


            $this->all_list[$ord]['comat'] = $comat[$row['MaLichHoc']];
            $this->all_list[$ord]['vp'] = $vp[$row['MaLichHoc']];
            $this->all_list[$ord]['vkp'] = $vkp[$row['MaLichHoc']];
            $this->all_list[$ord]['tongvang'] = $vp[$row['MaLichHoc']] + $vkp[$row['MaLichHoc']];
        }
        // return json_decode(json_encode($this->all_list), true);
        return array_reverse(array_reverse($this->all_list));
    }


    public function getByMaLMH_PH ($maLMH, $maSV) {
        $query = "SELECT
                    lich.*,
                    lh.*,
                    dd.MaDiemDanh, dd.NgayDiemDanh,
                    ctdd.TrangThai TrangThai_SV, ctdd.GhiChu, ctdd.MaChitietDiemdanh
				FROM tbl_lichhoc lich
                JOIN tbl_lopmonhoc lh
                    ON lh.MaLMH = lich.MaLMH AND lh.MaLMH = ?

                LEFT JOIN tbl_diemdanh dd
                    ON dd.MaLichHoc = lich.MaLichHoc

                LEFT JOIN tbl_chitietdiemdanh ctdd
                    ON (ctdd.MaDiemDanh = dd.MaDiemDanh
                        AND ctdd.MaSV = ?)
                ORDER BY lich.Ngay DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $maLMH);
        $stmt->bindParam(2, $maSV);
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

            $row['Ngay'] = date("d/m/Y", strtotime($row['Ngay']));

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
