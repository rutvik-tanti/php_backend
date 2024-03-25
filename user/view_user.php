<?php
include("connection.php");
if(isset($_POST['parameter'])&&isset($_POST['value']))
{
	$parameter = $_POST['parameter'];
	$value = $_POST['value'];
	$query = "select * from user_pro where $parameter='$value'";
	$res = mysqli_query($connectNow, $query);
	$arr = array();
	while ($row = mysqli_fetch_array($res, MYSQLI_ASSOC)) {
		$arr[] = $row;
	}
	echo json_encode($arr);
}
?>
