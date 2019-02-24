<?php
include '../../config.php';
include '../../objects/monhoc.php';

$monhoc = new MonHoc();

$data = $monhoc->readAll();

echo json_encode($data, JSON_UNESCAPED_UNICODE);
