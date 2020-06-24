<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
require ("bd.php");
<<<<<<< Updated upstream
echo ($inputJSON);
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
//print_r ($input);
=======
function check_true($text_true) {
	if ($text_true=="да") {return 1;} else {return 0;}
}
//echo check_true('нет');
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
//print_r ($input);
$i=0;
$ques=count($input[quesions]);
for ($i;$i<$ques;$i++) {
$answers_count=count($input[answers][$i]);
$j=0;
echo "$asnwers_count";
for ($j;$j<$answers_count;$j++) {
//$result_answers=mysqli_query ($db,"INSERT INTO answers (Question_id,Answer,True_answer) VALUES ('$idd','".$input["answers"]["$i"]["$j"]["answer"]."','".check_true($input["answers"]["$i"]["rightAns"])."')");
print_r ($input[answers][$i][$j][rightAns]);
}
}
>>>>>>> Stashed changes
?>