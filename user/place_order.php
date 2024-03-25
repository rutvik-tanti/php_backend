<?php
    include 'connection.php';
	
	if(isset($_POST['cancelReason'])){
		$o_id = "".$_POST['o_id'];
		$date = "".$_POST['date'];
		$cancelReason = "".$_POST['cancelReason'];
		$sqlQuery = "UPDATE placeorder SET date_of_delivery = '$date', status = 'Cancel',cancelReason ='$cancelReason' WHERE o_id = '$o_id'";
    }else{
		$o_id = $_POST['o_id'];
		$u_add = "".$_POST['u_add'];
		$u_id = "".$_POST['u_id'];
		$total_discounts = "".$_POST['total_discounts'];
		$paymentid = "".$_POST['paymentid'];
		$date_of_delivery = "".$_POST['date_of_delivery'];

		$sqlQuery = "INSERT INTO placeorder SET o_id = $o_id, u_address = '$u_add', uid = '$u_id', total_discounts = '$total_discounts',paymentid = '$paymentid',status = 'Confirmed', date_of_delivery = '$date_of_delivery'";
	}
		
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