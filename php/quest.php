<?php
$prov=100;
require ("bd.php");
$get=$_GET[quest];
$result=mysqli_query ($db,"SELECT * FROM question where Quest_id='$get'");
$content=mysqli_fetch_array($result);
if (isset($content[Quest_id])) {
do {
if ($prov!=$content[Number_id]) {
echo "<form action='prov.php'>
<input type='hidden' name='quest' value='$content[Quest_id]'>
$content[Question]</br>
<input type='text' name='otvet'>  
<button name='question' value='$content[Number_id]' type='submit'> Ответить</button> </form></br>";}
$prov=$content[Number_id];
	}
while ($content=mysqli_fetch_array($result)); }
?>