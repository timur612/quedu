<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');

$prov=100;
require ("bd.php");
$number= file_get_contents('php://input');
$result=mysqli_query ($db,"SELECT * FROM question where Quest_id='$number'");
$content=mysqli_fetch_array($result);
if (isset($content[Quest_id])) {
do {
if ($prov!=$content[Number_id]) {
echo "$content[Question] Вопрос номер - $content[Number_id]</br>";
}
$prov=$content[Number_id];
	}
while ($content=mysqli_fetch_array($result)); }
?>