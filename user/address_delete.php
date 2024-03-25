<?php
    include 'connection.php';

    $id = $_POST['id'];

    $sqlQuery = "DELETE FROM address WHERE id = '$id'";

    $resultOfQuery = $connectNow -> query($sqlQuery);

    if($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }

?>
