<?php
include '../../config.php';
include '../../objects/lichhoc.php';

$lichhoc = new LichHoc();
$lichhoc->MaLMH = $MaLMH = ($_POST['MaLMH']) ? $_POST['MaLMH'] : null;
$lichhoc->MaSV = $MaSV = ($_POST['MaSV']) ? $_POST['MaSV'] : null;

$data = $lichhoc->getByMaLMH_PH($MaLMH, $MaSV);

echo json_encode($data, JSON_UNESCAPED_UNICODE);
