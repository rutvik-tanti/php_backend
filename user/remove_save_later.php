<?php
    include 'connection.php';

    $sid = $_POST['sid'];

    $sqlQuery = "DELETE FROM save_later WHERE sid = '$sid'";

    $resultOfQuery = $connectNow -> query($sqlQuery);

    if($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }

?>