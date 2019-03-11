<?php
include '../../config.php';
include '../../objects/diemdanh.php';

$diemdanh = new DiemDanh();
$diemdanh->MaLichHoc = $MaLichHoc = ($_POST['MaLichHoc']) ? $_POST['MaLichHoc'] : null;

$data = $diemdanh->getByMaLichHoc($MaLichHoc);

echo json_encode($data, JSON_UNESCAPED_UNICODE);
