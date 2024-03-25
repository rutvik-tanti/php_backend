<?php
    include 'connection.php';

    $uname = $_POST['uname'];
    $uemail = $_POST['uemail'];
    $upass = $_POST['upass'];
    $umono = $_POST['umono'];
    $imageName = $_POST['image_name'];
    $imageData = $_POST['image_data'];

	$sqlQuery = "INSERT INTO user_pro SET uname = '$uname',uemail = '$uemail',upass= '$upass'";

	if($umono!=""||$umono!=null){
		$sqlQuery .= ",umono = '$umono'";
	}

	if($imageName!=""||$imageName!=null){
		$path = "img/$imageName";
		file_put_contents($path,base64_decode($imageData));
		$sqlQuery .= ",uimage = '$path'";
	}
	
	try {
		$resultOfQuery = $connectNow->query($sqlQuery);

		if ($resultOfQuery) {
			echo json_encode(array("success" => true));
		} else {
			echo json_encode(array("success" => false));
		}
	} catch (Exception $e) {
		echo json_encode(array("success" => false, "error" => $e->getMessage()));
	}

?>
