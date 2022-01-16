<?php
//SET SQL_SAFE_UPDATES = 0;
require_once "../lib/dbconnect.php";
require_once "../lib/board.php";
require_once "../lib/game.php";
require_once "../lib/users.php";



$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));

print_r($request);
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

if(isset($_SERVER['HTTP_X_TOKEN'])){
    $token = $_SERVER['HTTP_X_TOKEN'];
    $player = getP($token);
}





// header("Content-Type: text/plain");
// print "method = $method";
// print "pathinfo =" . $_SERVER['PATH_INFO'];

switch ($r = array_shift($request)) {
    case 'board':
        switch ($b = array_shift($request)) {
            case '': handle_board($method);
                break;
            case null: handle_board($method);
                break;
            case 'idcard': handle_idcard($method,$request[0],$request[1],$input); //isws den xreiazetai $request[1]
            break;
            case 'move':  move($request,$player);
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



function handle_board($method){
    if($method == 'GET'){
        show_count_deck_board();
    }else if($method == 'POST'){
        reset_deck();
    }else{
        header("HTTP/1.1 405 Not Found");
    }

}

function move($request,$player){
    if($player != "P1" && $player != "P2"){
        echo "Please login first.";
    }else{
        find_dublicates($player);
        //h find oponent epistrefei P2
        find_dublicates(findOponent($player));
        if($player == getTurn()){
            if(check_ifEnded() == false){
                $card = $request[0]-1;
                beginMove($card,$player);
                changeTurn(findOponent($player));
            }else{
                echo "game ended";
            }
        }else{
            echo "not your turn, mate";
        }
        find_dublicates($player);
        //h find oponent epistrefei P2
        find_dublicates(findOponent($player));
        show_deck_board($player);
        show_count_deck_board();
        if(check_ifEnded()){
            echo "Game ended, winner is : ".getWinner();
        }
    }
    
}

function handle_idcard(){
    
    }

function handle_player($method,$p,$input){
    switch($b = array_shift($p)){
        // case '':
        // case null:
        //     break;
        case 'P1': handle_user($method,$b,$input); 
            break;
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