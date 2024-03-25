<?php
    include 'connection.php';

    $imageData = $_POST['image_data'];
	$imageName = $_POST['image_name'];
	$uemail = $_POST['uemail'];
	
	if($imageName!=""){
		$path = "img/$imageName";
		file_put_contents($path,base64_decode($imageData));
	}else{
		$path = "null";
	}
	
	$sqlQuery = "UPDATE user_pro SET uimage = '$path' WHERE uemail = '$uemail'";

    $resuletOfQuery = $connectNow->query($sqlQuery);

    if($resuletOfQuery) {	
        echo json_encode(array("success"=>true));
    } else {
        echo json_encode(array("success"=>false));
    }
?>