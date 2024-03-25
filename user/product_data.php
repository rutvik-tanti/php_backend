<?php
	include("connection.php");
    $query = "select * from product_table WHERE product_stock > 0";
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
