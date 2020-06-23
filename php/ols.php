<?php
require ("bd.php");
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

$arrayName=[];
$arrayId=[];
$result=mysqli_query ($db,"SELECT * FROM quest");
$content=mysqli_fetch_array ($result);
if (isset($content[Name])) {
do {
	array_push($arrayName,$content[Name]);
	array_push($arrayId,$content[Id]);
}
while($content=mysqli_fetch_array($result));
 }


$json='{
	"Id":[ '.trytocount($arrayId).' ] ,
	"Name":[ '.trytocount($arrayName).' ] 
	
}';
echo "$json";
?>