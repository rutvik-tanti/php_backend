<?php
include 'connection.php';

$uid = isset($_POST['uid']) ? $_POST['uid'] : "";
$sqlQuery = "SELECT * FROM user_pro";

if(isset($_POST['uid']))
{
    $sqlQuery .= " WHERE uid = '$uid' ";
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