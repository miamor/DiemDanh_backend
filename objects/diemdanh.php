<?php
class DiemDanh extends Config
{

    public function __construct()
    {
        parent::__construct();
    }

    public function submit()
    {
        $query = "INSERT INTO
                tbl_diemdanh
            SET
                MaLichHoc = ?, NgayDiemDanh = ?, MaGV = ?";
        $stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $this->MaLichHoc);
        $stmt->bindParam(2, $this->NgayDiemDanh);
        $stmt->bindParam(3, $this->MaGV);

        if ($stmt->execute()) {
            $query = "SELECT
                    *
                FROM
                    tbl_diemdanh
                WHERE MaLichHoc = ? AND NgayDiemDanh = ? AND MaGV = ?
                ORDER BY MaDiemDanh DESC
                LIMIT 0,1";
            $stmtq = $this->conn->prepare($query);
            $stmtq->bindParam(1, $this->MaLichHoc);
            $stmtq->bindParam(2, $this->NgayDiemDanh);
            $stmtq->bindParam(3, $this->MaGV);
            $stmtq->execute();
            $row = $stmtq->fetch(PDO::FETCH_ASSOC);

            $ok = true;

            foreach ($this->CTDD as $dk => $dd) {
                if ($dd['GhiChu']) {
                    $dd['GhiChu'] = content($dd['GhiChu']);
                    $query = "INSERT INTO
                            tbl_chitietdiemdanh
                        SET
                            MaDiemDanh = ?, MaSV = ?, TrangThai = ?, GhiChu = ?";

                    $stmty = $this->conn->prepare($query);
                    $stmty->bindParam(1, $row['MaDiemDanh']);
                    $stmty->bindParam(2, $dd['MaSV']);
                    $stmty->bindParam(3, $dd['TrangThai']);
                    $stmty->bindParam(4, $dd['GhiChu']);
                } else {
                    $dd['GhiChu'] = content($dd['GhiChu']);
                    $query = "INSERT INTO
                            tbl_chitietdiemdanh
                        SET
                            MaDiemDanh = ?, MaSV = ?, TrangThai = ?";

                    $stmty = $this->conn->prepare($query);
                    $stmty->bindParam(1, $row['MaDiemDanh']);
                    $stmty->bindParam(2, $dd['MaSV']);
                    $stmty->bindParam(3, $dd['TrangThai']);
                }
                //$stmty->execute();

                if (!$stmty->execute()) {
                    $ok = false;
                    break;
                }
            }

            return $ok;
        } else return false;
    }

}
