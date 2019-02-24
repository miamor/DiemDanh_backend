<?php
include '../../config.php';
include '../../objects/lopmonhoc.php';

$lopmonhoc = new LopMonHoc();
$lopmonhoc->gvID = $teacherID = ($_POST['gvID']) ? $_POST['gvID'] : null;

$data = $lopmonhoc->readAllFromTeacher($teacherID);

echo json_encode($data, JSON_UNESCAPED_UNICODE);
