<?php
include '../../config.php';
include '../../objects/lichhoc.php';

$lichhoc = new LichHoc();
$lichhoc->MaLMH = $maLMH = ($_GET['MaLMH']) ? $_GET['MaLMH'] : null;

$data = $lichhoc->getByMaLMH($maLMH);

echo json_encode($data, JSON_UNESCAPED_UNICODE);
