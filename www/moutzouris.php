<?php
//SET SQL_SAFE_UPDATES = 0;
require_once "../lib/dbconnect.php";
require_once "../lib/board.php";
require_once "../lib/game.php";
require_once "../lib/users.php";



$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));


if($method == "POST"){
 
    if(count($_POST)>0){
        $post_keys = array_keys($_POST);
    }else{
        $post_keys = array();
    }
    $input = array();
    for ($i=0;$i<count($_POST);$i++){
        $tmp = array_shift($post_keys);
        $input[$tmp] = $_POST[$tmp]; 
    }   
}else{
    $input = json_decode(file_get_contents('php://input'), true);
}




// header("Content-Type: text/plain");
// print "method = $method";
// print "pathinfo =" . $_SERVER['PATH_INFO'];

switch ($r = array_shift($request)) {
    case 'board':
        switch ($b = array_shift($request)) {
            case '':
            case null: handle_board($method,/*$input*/);
            //case 'idcard': handle_idcard();
            break;
        break; // i exit
        }
    case 'status':
        if(sizeof($request) == 0){
            handle_status($method);
        }else{
            header("HTTP/1.1 404 Not Found");
        }
        break;
    
    case 'players': handle_player($method,$request,$input);
     //-> methodos PUT , poion paikti dialekse P1 h P2, apo input pairnoume ta dedomena pou edwse
        break;

    default:
        header("HTTP/1.1 404 Not Found");
        exit;
    }

function handle_board($method,$input){
    if($method == 'GET'){
        show_deck_board();
    }else if($method == 'POST'){
        reset_deck();
    }else{
        header("HTTP/1.1 405 Not Found");
    }

}

function handle_idcard(){

    }

function handle_player($method,$p,$input){
    switch($b = array_shift($p)){
        // case '':
        // case null:
        //     break;
        case 'P1': 
        case 'P2': handle_user($method,$b,$input);
            break;
        default: header("HTTP/1.1 404 Not Found");
                print json_encode(['errormesg'=>"Player $b not found."]);
            break;
   }

    }


function handle_status($method){
    if($method == 'GET'){
        show_status();
    }else{
        header("HTTP/1.1 405 Not Found");
    }
}


?>