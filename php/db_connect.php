<?php
$servername = "162.241.62.63";
$username = "drippkin_Host";
$password = "DrippKing5545";
$dbname = "drippkin_mt6_world_cup";
$port = 3306;
$conn = new mysqli($servername, $username, $password, $dbname, $port);
if ($conn->connect_error) {
  die("Conexión fallida: " . $conn->connect_error);
}
?>