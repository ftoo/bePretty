<?php
require_once ('conn.php');
include_once 'AfricasTalkingGateway.php';
$apikey = "5e0c6a9a33d7e784989dc2a949e1963da4078f46cfe7f991a64926250754021e";
$APIusername   = "Rketter";



                @$client_name = $_POST["client_name"];
		@$artist_no = $_POST["artist_no"];
		@$client_no = $_POST["client_no"];
		@$service= $_POST["service"];
		@$date= $_POST['date'];
		
		
		

		$sql = "INSERT INTO book (client_name, artist_no,client_no,service,date) 
		VALUES ('$client_name', '$artist_no', '$client_no','$service','$date');";
		$results = mysqli_query($conn,$sql) or die(mysql_error());
		if($results) {

			$response["success"] = 1;
		        $response["message"] = "your ad has been submitted successfully";
			$response["message"] = $sql;
                  $type=3;
                $message="Hello, ".$client_name." has book your service: ".$service." on ".$date." Contacts: ".$client_no." \n By BePretty.";
                
    	        $gateway    = new AfricasTalkingGateway($APIusername, $apikey);
		$gateway->sendMessage($artist_no, $message, $type);
		} else {
			$response["error"] = 0;
			$response["message"] = "An error occured while processing the request. Please try again";
		}
echo json_encode($response);​


?>
