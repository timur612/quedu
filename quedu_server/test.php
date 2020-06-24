<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
require ("bd.php");
echo ($inputJSON);
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
//print_r ($input);
?>