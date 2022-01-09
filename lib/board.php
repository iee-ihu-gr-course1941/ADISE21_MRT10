<?php

function show_deck_board(){
    global $mysqli;
	
	$sql = 'select * from deck_board ' ;
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function reset_deck(){
	global $mysqli;

	$sql = 'call assign_cards_toplayers()';
	$mysqli->query($sql);
	show_deck_board();

}


?>