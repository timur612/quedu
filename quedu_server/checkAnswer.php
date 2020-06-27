<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
require ("bd.php");

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
$quest_id=$input[Quest_id];
$user_id=$input[User_id];
$question_number=$input[Id];
$answer_true=$input[Answer_true];
$answer=$input[Answer];
$result=mysqli_query($db,"SELECT * FROM user_answers WHERE Quest_id='$quest_id' AND Question_id='$question_number' AND User_id='$user_id'");
$content=mysqli_fetch_array($result);
if (isset($content[Id])) {echo "Ваш ответ успешно изменен";
$result=mysqli_query ($db,"UPDATE user_answers SET Answer='$answer',Answer_true='$answer_true' WHERE Id='$content[Id]'");
} else {
	
$result=mysqli_query ($db,"INSERT INTO user_answers (Quest_id,Question_id,User_id,Answer,Answer_true) VALUES ('$quest_id','$question_number','$user_id','$answer','$answer_true')");
echo "Ответ принят";
}
?>