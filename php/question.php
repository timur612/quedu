<?php
$prov=100;
require ("bd.php");
$number=$_GET[question_id];
$result=mysqli_query ($db,"SELECT * FROM question where Number_id='$number'");
$content=mysqli_fetch_array($result);
if (isset($content[Quest_id])) {
do {
if ($prov!=$content[Number_id]) {
echo "<form action='prov.php'>
$content[Question]
<input type='text' name='otvet'> </button> </form></br>";}
$prov=$content[Number_id];
	}
while ($content=mysqli_fetch_array($result)); }
?>