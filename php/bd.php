<?php
	$db=mysqli_connect ("127.0.0.1:3306","root","");
	$db->select_db("platform");
	$db->query("SET NAMES utf8");
?>