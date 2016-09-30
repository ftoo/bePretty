<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once ('conn.php');


                $name = $_POST["name"];
		$mobile_no = $_POST["mobile_no"];
		$service= $_POST["service"];
		$price= $_POST['price'];
		$city= $_POST["city"];
		$area = $_POST["area"];
		
		

		$sql = "INSERT INTO artist_details (`name`, `mobile_no`,`service`,`price`,`city` ,`area`) 
		VALUES ('$name', '$mobile_no','$service', '$price','$city','$area');";
		$results = mysqli_query($conn,$sql) or die(mysql_error());
		if($results) {
			$response["success"] = 1;
		        $response["message"] = "your ad has been submitted successfully";
			$response["message"] = $sql;
		} else {
			$response["error"] = 0;
			$response["message"] = "An error occured while processing the request. Please try again";
		}
echo json_encode($response);​


?>


