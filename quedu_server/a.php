<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
require ("bd.php");
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
<<<<<<< Updated upstream

$yes=count($input[answers]);
echo $yes;
$yes=count($input[answers][0]);
echo "  ".$yes;
print_r($input);
=======
function check_true($text_true) {
	if ($text_true=="да") {return 1;} else {return 0;}
}

>>>>>>> Stashed changes
$Name=$input[questName];


$result=mysqli_query ($db,"SELECT Name FROM quest WHERE Name='$Name'");
$result=mysqli_fetch_array($result);
<<<<<<< Updated upstream
if (isset($result[Name])) { die ("Uzhe est' takoy quest");}
=======
if (isset($result[Name]) or ($Name==''))
	{ die ("Uzhe est' takoy quest");}
>>>>>>> Stashed changes
$result=mysqli_query ($db,"INSERT INTO quest (Name) VALUES('$Name')");
$idd=mysqli_insert_id($db);
echo $idd." квест     ";
$quest_id=$idd;
$i=0;
$ques=count($input[quesions]);
for ($i;$i<$ques;$i++) { 

$result_question=mysqli_query ($db,"INSERT INTO question (Quest_id,Number_id,Question) VALUES('$quest_id','$i','".$input["quesions"]["$i"]."')");
$idd=mysqli_insert_id($db);
$answers_count=count($input[answers][$i]);
$j=0;
for ($j;$j<$answers_count;$j++) {
<<<<<<< Updated upstream
$result_answers=mysqli_query ($db,"INSERT INTO answers (Question_id,Answer,True_answer) VALUES ('$idd','".$input["answers"]["$i"]["$j"]["answer"]."','1')");
=======
$result_answers=mysqli_query ($db,"INSERT INTO answers (Question_id,Answer,True_answer) VALUES ('$idd','".$input["answers"]["$i"]["$j"]["answer"]."','".check_true($input["answers"]["$i"]["$j"]["rightAns"])."')");
>>>>>>> Stashed changes
}
}
//print_r ($input);
?>