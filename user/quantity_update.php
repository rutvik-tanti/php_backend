<?php
    include 'connection.php';
    
    $cartId = "".$_POST['cart_id'];
    $quantity = "".$_POST['product_quantity'];

    $sqlQuery = "UPDATE cart_table SET product_quantity = '$quantity' WHERE cart_id = '$cartId'";

    $resuletOfQuery = $connectNow->query($sqlQuery);

    if($resuletOfQuery) {
        echo json_encode(array("success"=>true));
    } else {
        echo json_encode(array("success"=>false));
    }
?>