<?php
include 'connection.php';

$oid = isset($_POST['oid']) ? $_POST['oid'] : "";
$sqlQuery = "SELECT * FROM ship";

if(isset($_POST['oid']))
{
    $sqlQuery .= " WHERE oid = '$oid' ";
}
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