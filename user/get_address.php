<?php
    include 'connection.php';
    $currentUserId = $_POST['current_user_id'];
    $query = "select * from address where uid='$currentUserId'";
    $result = mysqli_query($connectNow, $query);

    if ($result) {
		$arr = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$arr[] = $row;
		}
		echo json_encode($arr);
    } else {
        echo json_encode(['error' => 'Error executing the query']);
    }
?>