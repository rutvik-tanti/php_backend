<?php
    include 'connection.php';

    $sqlQuery = "SELECT * FROM product_table";

    $resuletOfQuery = $connectNow->query($sqlQuery);
    
    $userRecord = array();
    while($rowFound = $resuletOfQuery->fetch_assoc()) {
        $userRecord[] = $rowFound; 
    }
    echo json_encode($userRecord);

?>
