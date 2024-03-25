<?php
    include 'connection.php';

    $productId = $_POST['product_id'];

    $sqlQuery = "DELETE FROM product_table WHERE product_id = $productId";

    $resuletOfQuery = $connectNow->query($sqlQuery);

    if($resuletOfQuery) {
        echo json_encode(array("success"=>true));
    } else {
        echo json_encode(array("success"=>false));
    }
?>