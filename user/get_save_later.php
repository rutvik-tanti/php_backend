<?php
include 'connection.php';

if (isset($_POST['uid'])) {
    $currentUserId = $_POST['uid'];
    $query = "SELECT * FROM save_later JOIN product_table ON save_later.pid = product_table.product_id WHERE save_later.uid = '$currentUserId'";
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
} else {
    // Handle missing "uid" parameter
    echo json_encode(['error' => 'Missing "uid" parameter']);
}
?>
