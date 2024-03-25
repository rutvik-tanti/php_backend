<?php
include 'connection.php';

$w = "";
$currentUserId = isset($_POST['uid']) ? $_POST['uid'] : "";
$pid = isset($_POST['pid']) ? $_POST['pid'] : "";
$w = isset($_POST['uid']) ? "WHERE review.uid = '$currentUserId'" : "";
$w .= isset($_POST['pid']) ? ($w ? " AND " : "WHERE ") . "review.pid = '$pid'" : "";

$query = "SELECT * FROM review 
          INNER JOIN user_pro ON review.uid = user_pro.uid 
          INNER JOIN product_table ON review.pid = product_table.product_id
          $w";

$result = mysqli_query($connectNow, $query);

if ($result) {
    $arr = array();
    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $arr[] = $row;
    }
    echo json_encode($arr);
} else {
    // Handle query execution error
    echo json_encode(['error' => 'Error executing the query']);
}
?>
