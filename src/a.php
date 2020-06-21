<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
require ("bd.php");
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
$Name=$input[questName];


$result=mysqli_query ($db,"SELECT Name FROM quest WHERE Name='$Name'");
$result=mysqli_fetch_array($result);
if (isset($result[Name])) { die ("Uzhe est' takoy quest");}
$result=mysqli_query ($db,"INSERT INTO quest (Name) VALUES('$Name')");


$result=mysqli_query ($db,"SELECT Id FROM quest WHERE Name='$Name'");
$result=mysqli_fetch_array($result);
$quest_id=$result[Id];

echo "$result[Id]";
$i=0;
$ques=count($input[quesions]);
for ($i;$i<$ques;$i++) { 

$result=mysqli_query ($db,"INSERT INTO question (Question_id,Number_id,Question,Answer) VALUES('$quest_id','$i','".$input["quesions"]["$i"]."','".$input["answers"]["$i"]."')");

}
//print_r ($input);
?>