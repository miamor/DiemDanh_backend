<?php
include '../../config.php';
include '../../objects/lopmonhoc.php';

$lopmonhoc = new LopMonHoc();
$lopmonhoc->MaSV = $MaSV = ($_POST['MaSV']) ? $_POST['MaSV'] : null;

$my_date = date('d-m-Y'); 
$week = date("W", strtotime($my_date)); // get week
$y =    date("Y", strtotime($my_date)); // get year

$dates_in_week = array();
//$dates_in_week['Mon'] = date('d-m-Y',strtotime($y."W".$week)); //first date 
$dates_in_week[0] = date('Y-m-d',strtotime($y."W".$week)); //first date 

for ($i = 1; $i < 7; $i++) {
    $timestamp = strtotime("+$i day", strtotime($dates_in_week[0]));
    $dates_in_week[$i] = date("Y-m-d", $timestamp);
    //$timestamp = strtotime("+$i day", strtotime($dates_in_week['Mon']));
    //$dayname = date("D", $timestamp);
    //$dates_in_week[$dayname] = date("d-m-Y", $timestamp);
}

$data = $lopmonhoc->readAllFromMaSVInWeek($MaSV, $dates_in_week);

echo json_encode($data, JSON_UNESCAPED_UNICODE);
