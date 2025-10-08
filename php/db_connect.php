<?php
/*
 * Archivo de conexión a la base de datos.
 * Rellena los datos con tus credenciales de MySQL.
 */

$servername = "127.0.0.1"; // o "localhost"
$username = "root"; // tu usuario de MySQL (por defecto en XAMPP es 'root')
$password = ""; // tu contraseña de MySQL (por defecto en XAMPP está vacía)
$dbname = "mt6_world_cup";

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
  // Detiene la ejecución y muestra el error si la conexión falla.
  // En un entorno de producción, deberías manejar este error de forma más elegante.
  die("Conexión fallida: " . $conn->connect_error);
}
?>