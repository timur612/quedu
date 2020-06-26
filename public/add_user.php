<?
header('Access-Control-Allow-Origin: http://localhost');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
require ("bd.php");
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
print_r($input);
//setcookie("name",$input[name]);
//setcookie("email",$input[email]);
//setcookie("password",$input[password]);
?>