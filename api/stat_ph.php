<?php
include '../config.php';
include '../objects/stat.php';
$stat = new Stat();

$stat->MaSV = $MaSV = isset($_POST['MaSV']) ? $_POST['MaSV'] : null;

if ($stat->MaSV) {
    $data = $stat->stat_PH_details($MaSV);
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
} else {
    echo json_encode(array('status' => 'error', 'msg' => 'Missing fields'), JSON_UNESCAPED_UNICODE);
}
