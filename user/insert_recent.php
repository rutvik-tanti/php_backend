<?php
    include 'connection.php';

    $uid = $_POST['uid'];
    $pid = $_POST['pid'];

    $sqlQuery = "INSERT INTO recent_view SET uid = '$uid',pid = '$pid'";

    $resultOfQuery = $connectNow -> query($sqlQuery);

    if($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }

?>