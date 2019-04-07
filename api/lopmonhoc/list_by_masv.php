<?php
include '../../config.php';
include '../../objects/lopmonhoc.php';

$lopmonhoc = new LopMonHoc();
$lopmonhoc->maSV = $maSV = ($_POST['MaSV']) ? $_POST['MaSV'] : null;

$data = $lopmonhoc->readAllFromMaSV($maSV);

echo json_encode($data, JSON_UNESCAPED_UNICODE);
