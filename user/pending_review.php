<?php
    include 'connection.php';

    $uid = "".$_POST['uid']; // Replace with the actual user ID

    $sqlQuery = "SELECT order_items.*, product_table.*
				 FROM order_items
				 INNER JOIN product_table ON product_table.product_id = order_items.p_id
				 INNER JOIN placeorder ON placeorder.o_id = order_items.o_id
				 WHERE order_items.uid = '$uid' 
				 AND placeorder.status = 'Deliver'";


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
