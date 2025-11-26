<?php
$servername = "localhost";
$username = "drippkin_Host";
$password = "DrippKing5545";
$dbname = "drippkin_mt6_world_cup";
$port = 3306;

/* $servername = "localhost";
$username = "root";
$password = "";
$dbname = "drippkin_mt6_world_cup";
$port = 3307; */

$conn = new mysqli($servername, $username, $password, $dbname, $port);
if ($conn->connect_error) {
  die("Conexión fallida: " . $conn->connect_error);
}
?>