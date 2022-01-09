<?php

require_once "../lib/dbconnect.php";
require_once "../lib/deck_field.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
$input = json_decode(file_get_contents('php://input'), true);

switch ($r = array_shift($request)) {
    case 'deck_field':
        switch ($b = array_shift($request)) {
            case '':
            case null: handle_deck($method);
                break;
        }
    case 'status':

        break;
    
    case 'players':

        break;

    default:
        header("HTTP/1.1 404 Not Found");
        break;


    }

function handle_deck($method){
    if($method == 'GET'){
        show_deck_field();
    }else if($method == 'POST'){
        //reset_deck();
    }

}


?>