<?php
    include 'connection.php';

	$currentUserId = $_POST['uid'];
    $query = "select * from favorite_table JOIN product_table ON favorite_table.pid = product_table.product_id WHERE favorite_table.uid = '$currentUserId' and product_table.product_stock > 0";
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
