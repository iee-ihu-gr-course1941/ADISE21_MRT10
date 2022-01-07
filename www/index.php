lala


<?php
	
	require_once "../lib/dbconnect.php";

	
	
	$sql = "select * from player";
	
	$st = $mysqli->prepare($sql);
	
	$st->execute();
	$res = $st->get_result();
	
	$r = $res->fetch_assoc();
	
	print "playerid : $r[PlayerID], lastname: $r[LastName] ";
	
?>