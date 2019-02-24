<?php
include '../../config.php';
include '../../objects/sinhvien.php';

$sinhvien = new SinhVien();
$sinhvien->MaLop = $maLop = ($_POST['MaLop']) ? $_POST['MaLop'] : null;

$data = $sinhvien->getByMaLop($maLop);

echo json_encode($data, JSON_UNESCAPED_UNICODE);
