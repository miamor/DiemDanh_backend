<?php
class Stat extends Config
{
    public function __construct()
    {
        parent::__construct();
    }

    public function stat_PH($maSV)
    {
        $query = "SELECT

                    (select count(distinct MaLMH)
                    from tbl_chitietlopmonhoc
                    where MaSV = '1054030007'
                    ) total_lmh,

                    (select count(distinct MaDiemDanh)
                    from tbl_chitietdiemdanh
                    where MaSV = '1054030007'
                    ) total_lessons,

                    (select count(distinct MaDiemDanh)
                    from tbl_chitietdiemdanh
                    where MaSV = '1054030007'
                    ) total_comat

                ";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $this->all_list = array();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $this->all_list[] = $row;
        }
        return $this->all_list;

    }

    public function stat_PH_details($maSV)
    {
        $query = "SELECT

                    /*(select count(distinct MaLMH)
                    from tbl_chitietlopmonhoc
                    where MaSV = '1054030007'
                    ) total_lmh,*/
                    /*count(distinct dd.MaLMH) total_lmh,*/

                    ctdd.*,
                    lich.*
                FROM tbl_chitietdiemdanh ctdd

                JOIN tbl_diemdanh dd
                    ON (dd.MaDiemDanh = ctdd.MaDiemDanh)
                JOIN tbl_lichhoc lich
                    ON (dd.MaLichHoc = lich.MaLichHoc)

                JOIN tbl_sinhvien sv
                    ON (sv.MaSV = ctdd.MaSV
                        AND sv.MaSV = ?)
                ";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $maSV);
        $stmt->execute();

        $this->all_list = array();
        $lopMH = array();

        $data = array('total_lmh' => 0, 'total_lessons' => 0, 'total_comat' => 0, 'total_vp' => 0, 'total_vkp' => 0, 'details' => array());
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            if ($row['TrangThai'] == 1) {
                $data['total_comat']++;
            } else if ($row['TrangThai'] == -1) {
                $data['total_vp']++;
            } else if ($row['TrangThai'] == -2) {
                $data['total_vkp']++;
            }
            $data['total_lessons']++;

            if (!in_array($row['MaLMH'], $lopMH)) {
                $lopMH[] = $row['MaLMH'];
            }

            $data['details'][] = $row;
        }
        $data['total_lmh'] = count($lopMH);

        return $data;

    }

    public function noti_PH($maSV)
    {

        $query = "SELECT
                    ctdd.*,
                    lich.*,
                    lmh.MaLMH, lmh.TongSoBuoi,
                    mh.TenMH
                FROM tbl_chitietdiemdanh ctdd

                JOIN tbl_diemdanh dd
                    ON (dd.MaDiemDanh = ctdd.MaDiemDanh)
                JOIN tbl_lichhoc lich
                    ON (dd.MaLichHoc = lich.MaLichHoc)
                JOIN tbl_lopmonhoc lmh
                    ON (lmh.MaLMH = lich.MaLMH)
                JOIN tbl_monhoc mh
                    ON (lmh.MaMH = mh.MaMH)

                JOIN tbl_sinhvien sv
                    ON (sv.MaSV = ctdd.MaSV
                        AND sv.MaSV = ?)
                ";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $maSV);
        $stmt->execute();

        $data = array();
        $tot_buoi = array(); // tong so buoi
        $tot_vang = array(); // tong so buoi nghi
        $name = array();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            // if (!$tot_buoi[$row['MaLMH']]) $tot_buoi[$row['MaLMH']] = 0;
            // $tot_buoi[$row['MaLMH']]++;
            if (!$tot_buoi[$row['MaLMH']]) $tot_buoi[$row['MaLMH']] = $row['TongSoBuoi'];

            if (!$tot_vang[$row['MaLMH']]) $tot_vang[$row['MaLMH']] = 0;
            if ($row['TrangThai'] == -1 || $row['TrangThai'] == -2) {
                $tot_vang[$row['MaLMH']]++;
            }
            $name[$row['MaLMH']] = $row['TenMH'];

        }
        
        foreach ($tot_vang as $i => $v) {
            if ($v > 1) {
                $data[$i] = array(
                    'TenLMH' => $name[$i],
                    'tongsobuoi' => $tot_buoi[$i],
                    'tongvang' => $v
                );
            }
        }

        return $data;

    }

}
