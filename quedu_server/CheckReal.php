<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
require ("bd.php");
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
$id=$input[Id];
$hash=$input[Hash];
$result=mysqli_query($db,"SELECT Hash FROM users WHERE Id='$id'");
$content=mysqli_fetch_array($result);
$righthash=$content[Hash];
if ($hash==$righthash) {echo '1';} else {echo '0';}

?>