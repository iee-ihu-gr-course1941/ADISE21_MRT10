<?php

require_once "../lib/board.php";
function handle_user($method,$b,$input){
    if($method == 'GET'){
        show_user($b);
    }else if($method == 'PUT'){
        set_user($b,$input);
    }else if($method == 'POST'){
        set_user($b,$input);
    }
}

// function show_users() {
// 	global $mysqli;
// 	$sql = 'select username,piece_color from players';
// 	$st = $mysqli->prepare($sql);
// 	$st->execute();
// 	$res = $st->get_result();
// 	header('Content-type: application/json');
// 	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);

function show_user($b){
    global $mysqli;
	
	$sql = 'select username,player from players where player = ? ' ;
	$st = $mysqli->prepare($sql);
    $st->bind_param('s',$b);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function set_user($b,$input){

    if(!isset($input['username']) || $input['username'] == '' ){
        header("HTTP/1,1 400 Bad Request");
        print json_encode(['errormesg'=>"No username given."]);
        exit;
    }

    $username=$input['username'];
    global $mysqli;
    $sql = 'select count(*) as c from players where player=? and username is not null';
    $st = $mysqli->prepare($sql);
    $st->bind_param('s',$b);
	$st->execute();
	$res = $st->get_result();
    $r = $res->fetch_all(MYSQLI_ASSOC);
    if($r[0]['c']>0){
        header("HTTP/1,1 400 Bad Request");
        print json_encode(['errormesg'=>"Player $b is already set.Select another player."]);
        exit;
    }

    $sql = 'update players set username=?, token=md5(CONCAT( ?,NOW())) where player=? '; 
    $st2 = $mysqli->prepare($sql);
    $st2->bind_param('sss',$username,$username,$b);
    $st2->execute();

    update_game_status();

    $sql = 'select count(*) as count from players where username not like "" and username is not null';
    $st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
    $r = $res->fetch_all(MYSQLI_ASSOC);
    if($r[0]['count']>1){
        reset_deck();
        find_dublicates($b);
        find_dublicates(findOponent($b));
    }

    $sql = 'select * from players where player=?';
    $st = $mysqli->prepare($sql);
    $st->bind_param('s',$b);
	$st->execute();
	$res = $st->get_result();
    header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);

}

function getP($token){
    
    global $mysqli;
    $sql = 'select player from players where token=?';
    $st = $mysqli->prepare($sql);
    $st->bind_param('s',$token);
	$st->execute();
	$res = $st->get_result();
    $r = $res->fetch_all(MYSQLI_ASSOC);
    if(count($r)==0){
        return null;
    }else{

        return $r[0]['player'];
    }
}

?>
