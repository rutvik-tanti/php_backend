<?php
    include 'connection.php';

    $tname = $_POST['tname'];
    $tnumber = $_POST['tnumber'];
    $tlink = $_POST['tlink'];
	$oid = $_POST['oid'];
	$ttime = $_POST['time'];
    $sqlQuery = "INSERT INTO ship SET ttime = '$ttime',tname = '$tname',tnumber = '$tnumber',tlink = '$tlink',oid='$oid'";
	$sqlQuery2 = "UPDATE placeorder SET status='Ship' WHERE o_id='$oid'";

    $resultOfQuery = $connectNow -> query($sqlQuery);
	$resultOfQuery = $connectNow -> query($sqlQuery2);

    if($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }

?>