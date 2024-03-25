<?php

$merchantId = 'PGTESTPAYUAT';
$merchantTransactionId = '1709400013831';

$url = "https://api-preprod.phonepe.com/apis/pg-sandbox/pg/v1/status/{$merchantId}/{$merchantTransactionId}";

$headers = [
    'Accept: text/plain',
    'Content-Type: application/json',
];

$curl = curl_init($url);

curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

$response = curl_exec($curl);

if (curl_errno($curl)) {
    echo 'Curl error: ' . curl_error($curl);
}

curl_close($curl);

echo $response;

?>
