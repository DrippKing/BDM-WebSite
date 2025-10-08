<?php
// Este es nuestro nuevo punto de entrada.

// Iniciamos la sesión en el punto de entrada para que esté disponible en todas las páginas.
session_start();

// Incluimos la conexión a la base de datos.
// Esta ruta siempre será la misma para todas nuestras páginas.
require_once 'php/db_connect.php';

// Obtenemos la página que el usuario quiere ver desde la URL.
// Por ejemplo: index.php?page=home o index.php?page=details&edicion=QATAR_2022
$page = $_GET['page'] ?? 'home'; // Si no se especifica, cargamos 'home' por defecto.

// Construimos la ruta al archivo de la página solicitada.
$page_path = "php/{$page}.php";

// Verificamos si el archivo de la página existe.
if (file_exists($page_path)) {
    // Si existe, lo incluimos para que se muestre.
    include $page_path;
} else {
    // Si no existe, mostramos un error 404.
    http_response_code(404);
    echo "<h1>Error 404: Página no encontrada</h1>";
}