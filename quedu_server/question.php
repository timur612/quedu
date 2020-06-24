<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
function trytocount($my_array) {
	$oll='';
$tryit= count($my_array);
	$inet=0;
for ($inet;$inet<$tryit;$inet++) {
	if ($inet+1 != $tryit) {
	$oll=$oll.'["'.$my_array[$inet].'"],';} else
	{
	$oll=$oll.'["'.$my_array[$inet].'"]';
	}
}
	return $oll;
}

$prov=100;
require ("bd.php");


$number= file_get_contents('php://input');
$result=mysqli_query ($db,"SELECT * FROM question where Quest_id='$number'");
$content=mysqli_fetch_array($result);
$question=[];
$question_id=[];
if (isset($content[Quest_id])) {
do {

array_push($question,$content[Question]);
array_push($question_id,$content[Number_id]);

	}
while ($content=mysqli_fetch_array($result)); }
$json='{ 
"Question": ['.trytocount($question).'],
"Question_numbers": ['.trytocount($question_id).'] 
}';
echo $json;
?>