<?php
require_once "../lib/dbconnect.php";
require_once "../lib/board.php";
require_once "../lib/game.php";
require_once "../lib/users.php";



$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
if(count($request)>0){
$_SESSION['test'] = $request[0];
}
echo $_SESSION['test'];

?>