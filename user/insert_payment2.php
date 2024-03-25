<?php
    include 'connection.php';

    $pdata = $_POST['pdata'];
    $o_id = $_POST['o_id'];

    $sqlQuery = "INSERT INTO payment2 SET pdata = '$pdata',o_id = '$o_id'";

    $resultOfQuery = $connectNow -> query($sqlQuery);

    if($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }

?>
