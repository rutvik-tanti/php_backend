<?php
    include 'connection.php';

    $oid = $_POST['oid'];
    $status = $_POST['status'];
    $date = $_POST['date'];


    $sqlQuery = "UPDATE placeorder SET status = '$status' , date_of_delivery = '$date' WHERE o_id = $oid";

    $resultOfQuery = $connectNow->query($sqlQuery);

    if ($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }
?>