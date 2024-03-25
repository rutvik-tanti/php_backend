<?php
    include 'connection.php';

    $merchantTransactionId = $_POST['merchantTransactionId'];
    $transactionId = $_POST['transactionId'];
    $payment_state = $_POST['payment_state'];
    $payment_type = $_POST['payment_type'];
    $pgTransactionId = $_POST['pgTransactionId'];
    $bankTransactionId = $_POST['bankTransactionId'];
    $pgAuthorizationCode = $_POST['pgAuthorizationCode'];
    $bankId = $_POST['bankId'];
    $brn = $_POST['brn'];

    $sqlQuery = "INSERT INTO payment SET merchantTransactionId = '$merchantTransactionId',transactionId = '$transactionId',
				payment_state= '$payment_state',payment_type = '$payment_type',pgTransactionId = '$pgTransactionId',
				bankTransactionId = '$bankTransactionId',pgAuthorizationCode = '$pgAuthorizationCode',
				bankId = '$bankId',brn = '$brn'";

    $resultOfQuery = $connectNow -> query($sqlQuery);

    if($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }

?>
