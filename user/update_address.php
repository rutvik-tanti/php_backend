<?php
	include 'connection.php';

	$name = $_POST['name'];
	$mono = $_POST['mono'];
	$pincode = $_POST['pincode'];
	$state = $_POST['state'];
	$city = $_POST['city'];
	$street = $_POST['street'];
	$landmark = $_POST['landmark'];
	$id = $_POST['id'];

	$sqlQuery = "UPDATE address SET name='$name', mono='$mono', pincode='$pincode', state='$state', city='$city', street='$street', landmark='$landmark' WHERE id='$id'";
	try{
		$resuletOfQuery = $connectNow->query($sqlQuery);
		if($resuletOfQuery) {
			echo json_encode(array("success"=>true));
		} else {
			echo json_encode(array("success"=>false));
		}
	}catch(Exception $e){
		echo json_encode(array("success"=>false, "error" => $e->getMessage()));
	}
?>
