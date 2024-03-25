<?php
include 'connection.php';

$o_id = $_POST['o_id'];
$sqlQuery = "SELECT * FROM payment2 where o_id = '$o_id'";

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