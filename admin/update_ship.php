<?php
    include 'connection.php';

    $tname = $_POST['tname'];
    $tnumber = $_POST['tnumber'];
    $tlink = $_POST['tlink'];
    $ttime = $_POST['time'];
    $oid = $_POST['oid'];

    
    $sqlQuery = "UPDATE ship SET ttime = '$ttime',tname = '$tname', tnumber = '$tnumber' , tlink = '$tlink' WHERE oid = $oid";

    $resultOfQuery = $connectNow->query($sqlQuery);

    if ($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }
?>