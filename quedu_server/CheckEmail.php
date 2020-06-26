<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
function generateCode($length=50) {
    $chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $code = "";
    $clen = strlen($chars) - 1;
    while (strlen($code) < $length) {
            $code .= $chars[mt_rand(0,$clen)];
    }
    return $code;
}

require ("bd.php");
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
$inputid=$input[name];
$result=mysqli_query ($db, "SELECT Hash FROM users WHERE Id='$input[Id]'");
$content=mysqli_fetch_array ($result);
$rightid= $content[Hash];
if ($inputid==$rightid) {
	$hash=generateCode();
	$alldone=mysqli_query ($db,"UPDATE users SET Author='1',Hash='$hash' WHERE Id='$input[Id]'");
	echo '
	{
		"Hash": "'.$hash.'" 
	}';
} else {
	echo "Не верно";
}
?>