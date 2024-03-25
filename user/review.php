<?php
include("connection.php");

$pid = $_POST['pid'];
$o_id = $_POST['o_id'];
$uid = $_POST['uid'];
$rtitle = $_POST['rtitle'];
$rdes = $_POST['rdes'];
$rating = $_POST['rating'];
$imageData = $_POST['image_data'];
$imageNameArray = [];
$images="";

$sqlQuery = "INSERT INTO review SET o_id = '$o_id',rating = '$rating', pid = '$pid', uid = '$uid', rtitle = '$rtitle', rdes = '$rdes'";

if($imageData != ""){
$imageArray = explode(',', $imageData);

	foreach ($imageArray as $encodedImage) {
		$binaryData = base64_decode($encodedImage);

		$imageName = uniqid() . ".png";
		array_push($imageNameArray, $imageName);
		file_put_contents("img/$imageName", $binaryData);
	}
	$images = json_encode($imageNameArray);
	$sqlQuery .= " , rimages = '$images'";
}

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery) {
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false));
}
?>
