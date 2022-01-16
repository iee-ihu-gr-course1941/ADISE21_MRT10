<?php
session_start();
require_once "../lib/dbconnect.php";
require_once "../lib/board.php";
require_once "../lib/game.php";
require_once "../lib/users.php";
if(isset($_SERVER['HTTP_X_TOKEN'])){
    $token = $_SERVER['HTTP_X_TOKEN'];
}
echo $token;


// function get_client_ip()  
// { 
//    $ipaddress = ''; 
//     if (getenv('HTTP_CLIENT_IP')) 
//         $ipaddress = getenv('HTTP_CLIENT_IP'); 
//     else if(getenv('HTTP_X_FORWARDED_FOR')) 
//         $ipaddress = getenv('HTTP_X_FORWARDED_FOR'); 
//     else if(getenv('HTTP_X_FORWARDED')) 
//         $ipaddress = getenv('HTTP_X_FORWARDED'); 
//     else if(getenv('HTTP_FORWARDED_FOR')) 
//         $ipaddress = getenv('HTTP_FORWARDED_FOR'); 
//     else if(getenv('HTTP_FORWARDED')) 
//        $ipaddress = getenv('HTTP_FORWARDED'); 
//     else if(getenv('REMOTE_ADDR')) 
//         $ipaddress = getenv('REMOTE_ADDR'); 
//     else 
//         $ipaddress = 'UNKNOWN'; 
 
//    return $ipaddress; 
// }

?>