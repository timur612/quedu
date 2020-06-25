<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
require ("bd.php");
function check_true($text_true) {
	if ($text_true=="да") {return 1;} else {return 0;}
}
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
print_r ($input);
$i=0;
$ques=count($input[quesions]);
for ($i;$i<$ques;$i++) {
$answers_count=count($input[answers][$i]);
$j=0;
echo "$asnwers_count";
for ($j;$j<$answers_count;$j++) {
print_r ($input[answers][$i][$j][rightAns]);
}
}
?>