<?php
include '../../config.php';
include '../../objects/diemdanh.php';

$diemdanh = new DiemDanh();
$diemdanh->CTDD = $CTDD = ($_POST['CTDD']) ? $_POST['CTDD'] : null;
$diemdanh->MaLichHoc = ($_POST['MaLichHoc']) ? $_POST['MaLichHoc'] : null;
$diemdanh->NgayDiemDanh = ($_POST['NgayDiemDanh']) ? $_POST['NgayDiemDanh'] : null;
$diemdanh->MaGV = ($_POST['MaGV']) ? $_POST['MaGV'] : null;

$do = $diemdanh->submit();

if ($do) {
    echo json_encode(array('status' => 'success'), JSON_UNESCAPED_UNICODE);
} else {
    echo json_encode(array('status' => 'error'), JSON_UNESCAPED_UNICODE);
}
//echo json_encode(array('stt' => 'fuck'), JSON_UNESCAPED_UNICODE);
