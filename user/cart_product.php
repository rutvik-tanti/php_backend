<?php
    include 'connection.php';
    
    $productId = "".$_POST['product_id'];
    $quantity = "".$_POST['product_quantity'];
    $currentUserId = "".$_POST['current_user_id'];

    $sqlQuery = "INSERT INTO cart_table SET product_id = '$productId',current_user_id = '$currentUserId', product_quantity = '$quantity'";

    $resuletOfQuery = $connectNow->query($sqlQuery);

    if($resuletOfQuery) {
        echo json_encode(array("success"=>true));
    } else {
        echo json_encode(array("success"=>false));
    }
?>