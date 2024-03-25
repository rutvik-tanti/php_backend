<?php
    include 'connection.php';

    $uid = $_POST['uid'];
	$status = isset($_POST['status']) ? "AND status='" . $_POST['status']."'" : "";

	$sqlQuery = "SELECT placeorder.*, payment.*
				FROM placeorder 
				LEFT JOIN payment ON payment.merchantTransactionId = placeorder.o_id
				WHERE placeorder.uid = '$uid' $status";

				
	if(isset($_POST['oid'])){
		$sqlQuery .= " and o_id = ".$_POST['oid'];
	}
	
	$sqlQuery .= " ORDER BY ounique_id DESC";

    $result = $connectNow->query($sqlQuery);

    if ($result) {
        $data = array();

        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        echo json_encode($data);
    } else {
        // Handle query execution error
        echo json_encode(array("success" => false, "error" => $connectNow->error));
    }
?>
