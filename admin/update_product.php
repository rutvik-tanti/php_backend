<?php
    include 'connection.php';

    $productId = $_POST['product_id'];
    $productName = $_POST['product_name'];
    $productTitle = $_POST['product_title'];
    $productDesc = $_POST['product_desc'];
    $productCategory = $_POST['product_category'];
    $productBrand = $_POST['product_brand'];
    $productPrice = $_POST['product_price'];
	$productMrp = $_POST['product_mrp'];
    $productstock = $_POST['product_stock'];

    if ($_POST['image_name'] != "") {
        $imageName = $_POST['image_name'];
        $imageData = $_POST['image_data'];
        $path = "upload/$imageName";
        file_put_contents($path, base64_decode($imageData));
        $sqlQuery = "UPDATE product_table SET product_brand = '$productBrand', product_mrp = '$productMrp', product_stock = '$productstock' , product_image = '$path', product_name = '$productName', product_title = '$productTitle', product_desc = '$productDesc', product_category = '$productCategory', product_price = '$productPrice' WHERE product_id = $productId";
    } else {
        $sqlQuery = "UPDATE product_table SET product_brand = '$productBrand', product_mrp = '$productMrp', product_stock = '$productstock' , product_name = '$productName', product_title = '$productTitle', product_desc = '$productDesc', product_category = '$productCategory', product_price = '$productPrice' WHERE product_id = $productId";
    }

    $resultOfQuery = $connectNow->query($sqlQuery);

    if ($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }
?>