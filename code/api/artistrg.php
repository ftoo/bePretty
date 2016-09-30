<?php

include "conn.php";

$response = array();

$emergencyQuery = $mysqli ->query("SELECT name, location, mobile_no FROM artist_details");
$response=array();
if ($emergencyQuery) {
	while ($row=$emergencyQuery->fetch_assoc()) {
		$emergencyArray = array();
		$emergencyArray['name']=$row["name"] ;
		$emergencyArray['location']=$row["location"];
		$emergencyArray['mobile_no']=$row["mobile_no"];
		
		array_push($response, $emergencyArray);
	}

}else {
echo "error Message";

}

echo json_encode($response);


?>