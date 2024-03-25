<?php
include 'connection.php';

$selectedCategories = isset($_POST['selectedCategories']) ? json_decode($_POST['selectedCategories']) : [];
$priceRange = isset($_POST['priceRange']) ? json_decode($_POST['priceRange']) : [];
$search = isset($_POST['search']) ? mysqli_real_escape_string($connectNow, $_POST['search']) : '';

$whereClause = '';

if (!empty($selectedCategories)) {
    $categoryConditions = array_map(function ($category) use ($connectNow) {
        $escapedCategory = mysqli_real_escape_string($connectNow, $category);
        return "product_category LIKE '%$escapedCategory%'";
    }, $selectedCategories);
    $whereClause .= '(' . implode(' OR ', $categoryConditions) . ')';
}

if (!empty($selectedBrands)) {
	if (!empty($selectedCategories)) {
		$whereClause .= ' AND ';
	}
    $brandConditions = array_map(function ($brand) use ($connectNow) {
        $escapedBrand = mysqli_real_escape_string($connectNow, $brand);
        return "product_brand LIKE '%$escapedBrand%'";
    }, $selectedBrands);
    $whereClause .= '(' . implode(' OR ', $brandConditions) . ')';
}

if (!empty($priceRange)) {
	if (!empty($selectedCategories) || !empty($selectedBrands)) {
		$whereClause .= ' AND ';
	}
    $priceConditions = array();
    for ($i = 0; $i < count($priceRange); $i++) {
        if ($priceRange[$i]) {
            switch ($i) {
                case 0:
                    $priceConditions[] = 'product_price <= 10000';
                    break;
                case 1:
                    $priceConditions[] = 'product_price > 10000 AND product_price <= 15000';
                    break;
                case 2:
                    $priceConditions[] = 'product_price > 15000 AND product_price <= 20000';
                    break;
                case 3:
                    $priceConditions[] = 'product_price > 20000 AND product_price <= 30000';
                    break;
                case 4:
                    $priceConditions[] = 'product_price > 30000';
                    break;
            }
        }
    } 
    $whereClause .= '(' . implode(' OR ', $priceConditions) . ')';
}


if (!empty($search)) {
    if (!empty($whereClause)) {
        $whereClause .= ' AND ';
    }
    $whereClause .= "product_name LIKE '%$search%'";
}

$sql = "SELECT * FROM product_table";

if (!empty($whereClause)) {
    $sql .= " WHERE $whereClause";
}
$result = $connectNow->query($sql);

if ($result) {
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode($data);
} else {
    echo json_encode(array("success" => false, "error" => $connectNow->error));
}

// Close the database connection
$connectNow->close();
?>
