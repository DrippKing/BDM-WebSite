<?php
/*
 * Archivo de conexión a la base de datos.
 * Rellena los datos con tus credenciales de MySQL.
 */

$servername = "162.241.62.63"; // ¡IMPORTANTE! Usa tu dominio o la IP del servidor de HostGator.
$username = "drippkin_Host"; // El usuario de la BD de HostGator (ej: drippkin_user).
$password = "DrippKing5545"; // La contraseña para ese usuario.
$dbname = "drippkin_mt6_world_cup"; // El nombre completo de la BD en HostGator.
$port = 3306; // El puerto estándar de MySQL.

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Verificar la conexión
if ($conn->connect_error) {
  // Detiene la ejecución y muestra el error si la conexión falla.
  // En un entorno de producción, deberías manejar este error de forma más elegante.
  die("Conexión fallida: " . $conn->connect_error);
}
?>