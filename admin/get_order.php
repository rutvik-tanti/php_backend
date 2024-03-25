<?php
include 'connection.php';

$status = isset($_POST['status']) ? $_POST['status'] : "";
$uid = isset($_POST['uid']) ? $_POST['uid'] : "";

$sqlQuery = "SELECT * FROM placeorder ";

if(isset($_POST['status']))
{
    if($status == "All"){
        $sqlQuery .= "WHERE placeorder.status != '' ";
    }
    else{
        $sqlQuery .= "WHERE placeorder.status = '$status' ";
    }
}

if(isset($_POST['oid']))
{
    $sqlQuery .= "where o_id = '".$_POST['oid']."'";
}

if(isset($_POST['uid']))
{
    $sqlQuery .= "where placeorder.uid = '$uid'";
}

$sqlQuery .= " ORDER BY ounique_id DESC";
$result = $connectNow->query($sqlQuery);

if ($result) {
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode($data);
} else {
    // Handle query execution error
    echo json_encode(array("success" => false, "error" => $connectNow->error));
}
?>