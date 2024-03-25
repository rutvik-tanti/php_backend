<?php
include 'connection.php';
$sqlQuery = "INSERT INTO `b` (`id`, `name`, `mono`, `pincode`, `state`, `city`, `street`, `landmark`, `uid`) VALUES ('', 'srxgfv', 'szdvg', '', '', '', '', '', '')";
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