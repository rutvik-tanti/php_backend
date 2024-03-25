<?php

include 'connection.php';
$uid = "".$_POST['uid'];
$sqlQuery = "DELETE FROM cart_table WHERE current_user_id = '$uid'";

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
