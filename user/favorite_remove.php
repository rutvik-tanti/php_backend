<?php
    include 'connection.php';

    $uid = $_POST['uid'];
    $pid = $_POST['pid'];

    $sqlQuery = "DELETE FROM favorite_table WHERE uid = '$uid' AND pid = '$pid'";

    $resultOfQuery = $connectNow -> query($sqlQuery);

    if($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }

?>
