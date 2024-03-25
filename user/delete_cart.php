<?php
    include 'connection.php';

    $cartId = $_POST['cart_id'];
    $currentUserId = $_POST['current_user_id'];

    $sqlQuery = "";
    if ($cartId != "") {
        $sqlQuery = "DELETE FROM cart_table WHERE cart_id = $cartId";
    } else {
        $sqlQuery = "DELETE FROM cart_table WHERE current_user_id = $currentUserId";
    }

    $resuletOfQuery = $connectNow->query($sqlQuery);

    if($resuletOfQuery) {
        echo json_encode(array("success"=>true));
    } else {
        echo json_encode(array("success"=>false));
    }
?>