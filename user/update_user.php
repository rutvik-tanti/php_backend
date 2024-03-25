<?php
    include 'connection.php';

    $userMono = $_POST['umono'];
    $userName = $_POST['uname'];
    $userEmail = $_POST['uemail'];

    $sqlQuery = "UPDATE user_pro SET uname = '$userName', umono = '$userMono' WHERE uemail = '$userEmail'";

    $resuletOfQuery = $connectNow->query($sqlQuery);

    if($resuletOfQuery) {	
        echo json_encode(array("success"=>true));
    } else {
        echo json_encode(array("success"=>false));
    }
?>