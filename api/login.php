<?php
include '../config.php';
if (!$_SESSION['MaGV']) {
    include '../objects/login.php';
    $login = new Login();

    $login->username = isset($_POST['username']) ? $_POST['username'] : null;
    $login->password = isset($_POST['password']) ? $_POST['password'] : null;
    $login->type = isset($_POST['type']) ? $_POST['type'] : null;

//    echo $_POST['username'];

    if ($login->username && $login->password) {
        if ($login->type == 'PH') {
            $do = $login->login_PH();
        } else {
            $do = $login->login();
        }
        if ($do) {
            $_SESSION['MaGV'] = $login->gvInfo['MaGV'];
            echo json_encode(array('status' => 'success', 'data' => $login->gvInfo), JSON_UNESCAPED_UNICODE);
        } else
            echo json_encode(array('status' => 'error', 'msg' => 'Username or password mismatched'), JSON_UNESCAPED_UNICODE);
    } else echo json_encode(array('status' => 'error', 'msg' => 'Username and password required'), JSON_UNESCAPED_UNICODE);
} else echo json_encode(array('status' => 'error', 'msg' => 'Already logged in'), JSON_UNESCAPED_UNICODE);
