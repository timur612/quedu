<?php
require ("bd.php");
$get=$_GET[quest];
$number=$_GET[question];
$otvet=$_GET[otvet];
$result=mysqli_query ($db,"SELECT * FROM question WHERE Quest_id='$get' AND Number_id='$number'");
$content=mysqli_fetch_array ($result);
echo "$content[Answer] - правильный ответ </br>$otvet  - Ваш ответ</br> ";
if ($content[Answer]==$otvet) {echo 'Вы ответили правильно!';} else {echo 'Ответ неверный';}
echo "</br><a href='quest.php?quest=$get'>Вернуться назад</a>";
?>