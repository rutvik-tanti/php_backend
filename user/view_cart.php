<?php
    include 'connection.php';

    $currentUserId = $_POST['current_user_id'];

    $sqlQuery = "SELECT * FROM cart_table JOIN product_table ON cart_table.product_id = product_table.product_id WHERE cart_table.current_user_id = '$currentUserId'";

    $resuletOfQuery = $connectNow->query($sqlQuery);
    
    $userRecord = array();
    while($rowFound = $resuletOfQuery->fetch_assoc()) {
        $userRecord[] = $rowFound; 
    }
    echo json_encode($userRecord);
?>