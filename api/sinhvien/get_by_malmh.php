<?php
include '../../config.php';
include '../../objects/sinhvien.php';

$sinhvien = new SinhVien();
$sinhvien->MaLopMH = $MaLopMH = ($_POST['MaLopMH']) ? $_POST['MaLopMH'] : null;

$data = $sinhvien->getByMaLopMH($MaLopMH);

echo json_encode($data, JSON_UNESCAPED_UNICODE);
