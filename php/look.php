<?php
require ("bd.php");
$result=mysqli_query ($db,"SELECT * FROM quest");
$content=mysqli_fetch_array ($result);
if (isset($content[Name])) {
do {
echo " 
<form type='GET' action='quest.php'>
<button type='submit' name='quest' value='$content[Id]'>$content[Name]</button></br></form>
";
	
}
while($content=mysqli_fetch_array($result)); }
?>