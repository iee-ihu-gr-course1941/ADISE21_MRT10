<?php

function show_deck_board($player){
    global $mysqli;
	
	$sql = 'select * from deck_board where player = ? ' ;
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$player);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function reset_deck(){
	global $mysqli;

	$sql = 'call assign_cards_toplayers()';
	$mysqli->query($sql);
	show_count_deck_board();

}


function show_gen_deck_board(){
    global $mysqli;
	
	$sql = 'select * from deck_board' ;
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function show_count_deck_board(){
    global $mysqli;
	
	$sql = 'select  (SELECT COUNT(*) FROM deck_board where player = "P1") as P1_cards, (SELECT COUNT(*) FROM deck_board where player = "P2") as P2_cards  from players limit 1 ' ;
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}


function find_dublicates($player){
	global $mysqli;
	
	$sql = 'select  * FROM deck_board where player = "'.$player.'" order by numcard asc ' ;
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
    $tmp=0;
    $tmp_id = 0;
    foreach($res as $result){
        if($tmp==0){
            $tmp = $result['numcard'];
            $tmp_id = $result['idcard'];
        }else{
            if($tmp == $result['numcard']){
				remove_dublicates($tmp_id,$result['idcard']);
				$tmp=0;
    			$tmp_id = 0;
            }else{
                $tmp = $result['numcard'];
                $tmp_id = $result['idcard'];
            }
        }

    }
}

function remove_dublicates($idcard1,$idcard2){
	global $mysqli;
	$sql = 'delete  FROM deck_board where idcard in (?,?) ' ;
	$st = $mysqli->prepare($sql);
	$st->bind_param('ss',$idcard1,$idcard2);
	$st->execute();
}

//Epistrefei to P1 h P2 analoga me to poios exei seira
function getTurn(){
	global $mysqli;
	$sql = 'select  p_turn FROM game_status' ;
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	return $r[0]['p_turn'];
	
}


//count ksexwrista ta 2 xeria kai epistrefei mia bool true an enas ap tous dio den exei fulla h false an exoun kai oi 2
function check_ifEnded(){
	global $mysqli;
	$sql = 'select  count(*) as count FROM deck_board where player = "P1" ' ;
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	$P1_count =  $r[0]['count'];
	

	global $mysqli;
	$sql = 'select  count(*) as count FROM deck_board where player = "P2" ' ;
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	$P2_count =  $r[0]['count'];

	if($P1_count == 0 || $P2_count == 0){
		return true;
	}else{
		return false;
	}
}

//kanei select me random seira tis kartes tou antipalou, looparei se autes kai molis to counter (c) einai iso me to orisma poy edwse o xrhsths, ginetai h allagh (moveCard)
function beginMove($card,$player){
    global $mysqli;
        $sql = 'select  * FROM deck_board where player <> "'.$player .'" order by RAND() ';
        $st = $mysqli->prepare($sql);
        $st->execute();
        $res = $st->get_result();
        $c = 0;
        foreach($res as $result){
            if($c == $card){
                moveCard($result['idcard'],$player);
				break;
            }else{
                $c++;
            }
        }
}



//8etei ton katoxo ths kartas na o $player (allazei to poy anhkei h karta)
function moveCard($idcard, $player){
    global $mysqli;
	$sql = 'UPDATE deck_board SET player = ? where idcard =? ' ;
	$st = $mysqli->prepare($sql);
	$st->bind_param('ss',$player,$idcard);
	$st->execute();
}

function changeTurn($player){
    global $mysqli;
	$sql = 'UPDATE game_status SET p_turn = ?  ' ;
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$player);
	$st->execute();
}

//epistrefei to anti8eto P apo to orisma (px an to orisma einai P1  8a epistrepsei P2)
function findOponent($player){
	global $mysqli;
	$sql = 'select  * FROM players where player <> ? ' ;
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$player);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	return  $r[0]['player'];
}

function getWinner(){
	global $mysqli;
	$sql = 'select  player FROM deck_board limit 1 ' ;
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	return  findOponent($r[0]['player']);
}

function game_ended($winner){
	global $mysqli;
	$sql = 'UPDATE game_status SET status = "ended" , result = ?  ' ;
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$winner);
	$st->execute();
}

?>