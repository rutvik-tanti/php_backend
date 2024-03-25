<?php
    include 'connection.php';

	$currentUserId = $_POST['uid'];
    $query = "select * from recent_view JOIN product_table ON recent_view.pid = product_table.product_id WHERE recent_view.uid = '$currentUserId'";
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
