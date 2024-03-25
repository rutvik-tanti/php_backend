<?php
    include 'connection.php';
    
    $o_id = "".$_POST['o_id'];
    $p_quantity = "".$_POST['p_quantity'];
    $p_id = "".$_POST['p_id'];
    $uid = "".$_POST['uid'];

    $sqlQuery = "INSERT INTO order_items SET uid = $uid,o_id = '$o_id',p_quantity = '$p_quantity', p_id = '$p_id'";

    $resuletOfQuery = $connectNow->query($sqlQuery);
	
	$sqlQuery = "UPDATE product_table SET total_sell = total_sell + $p_quantity, product_stock = product_stock - $p_quantity WHERE product_id = '$p_id'";

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