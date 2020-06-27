<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
require ("bd.php");
function trytocount($my_array) {
	$oll='';
$tryit= count($my_array);
	$inet=0;
for ($inet;$inet<$tryit;$inet++) {
	if ($inet+1 != $tryit) {
	$oll=$oll.'["'.$my_array[$inet].'"],';} 
	else {
		$oll=$oll.'["'.$my_array[$inet].'"]';
		 }
	}
return $oll;
}

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
$number=$input[number_id];
$quest=$input[questId];
$result=mysqli_query ($db,"SELECT Id FROM question WHERE Quest_id='$quest' AND Number_id='$number'");
$content=mysqli_fetch_array($result);
$array_answer=[];
$array_true=[];
$question_id=$content[Id];
$result=mysqli_query ($db,"SELECT * FROM answers WHERE Question_id='$question_id'");
$content=mysqli_fetch_array($result);
if (isset($content[Answer])) { 
	do {
		array_push ($array_answer,$content[Answer]);
		array_push ($array_true,$content[True_answer]);
		} 
	while ($content=mysqli_fetch_array($result)) ;
}
$json=' {
"answer" : ['.trytocount($array_answer).'],
"true_answer" : ['.trytocount($array_true).']
}';
echo $json;
?>