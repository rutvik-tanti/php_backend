<?php
    include 'connection.php';
    $admin_email = $_POST['admin_email'];

	$query = "select * from admin_pro where admin_email='$admin_email'";
	$res = mysqli_query($connectNow, $query);
	$arr = array();
	while ($row = mysqli_fetch_array($res, MYSQLI_ASSOC)) {
		$arr[] = $row;
	}
	echo json_encode($arr);

?>
