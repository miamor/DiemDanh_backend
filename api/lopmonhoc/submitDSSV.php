<?php
include '../../config.php';
include '../../objects/lopmonhoc.php';

$lopmonhoc = new LopMonHoc();
$lopmonhoc->MaLMH = ($_POST['MaLMH']) ? $_POST['MaLMH'] : null;

$lopmonhoc->DSSV = ($_POST['DSSV']) ? $_POST['DSSV'] : null;

$do = $lopmonhoc->submitDSSV();

if ($do) {
    echo json_encode(array('status' => 'success'), JSON_UNESCAPED_UNICODE);
} else {
    // echo json_encode(array('status' => 'error'), JSON_UNESCAPED_UNICODE);
    echo json_encode(array('status' => 'error', 'msg' => $lopmonhoc->msg), JSON_UNESCAPED_UNICODE);
}
//echo json_encode(array('stt' => 'fuck'), JSON_UNESCAPED_UNICODE);
