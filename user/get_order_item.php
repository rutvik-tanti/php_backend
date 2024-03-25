<?php
    include 'connection.php';

    $o_id = "".$_POST['o_id']; // Replace with the actual user ID

    $sqlQuery = "SELECT *
                 FROM order_items
                 INNER JOIN product_table ON product_table.product_id = order_items.p_id
                 WHERE o_id = '$o_id'";

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
