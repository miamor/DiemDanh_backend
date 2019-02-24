<?php
include '../../config.php';
include '../../objects/lopmonhoc.php';

$lopmonhoc = new LopMonHoc();
$lopmonhoc->MaLMH = ($_POST['MaLMH']) ? $_POST['MaLMH'] : null;

$data = $lopmonhoc->readOne();

echo json_encode($data, JSON_UNESCAPED_UNICODE);
