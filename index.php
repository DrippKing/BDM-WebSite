<?php
session_start();
require_once 'php/db_connect.php';

$page = $_GET['page'] ?? 'home';
$page_path = "php/{$page}.php";

if (file_exists($page_path)) {
    include $page_path;

} elseif ($page === 'balon_de_oro' && file_exists('php/balon_de_oro.php')) {
    include 'php/balon_de_oro.php';

} elseif ($page === 'maximos_goleadores' && file_exists('php/maximos_goleadores.php')) {
    include 'php/maximos_goleadores.php';

} elseif ($page === 'jugadores_leyenda' && file_exists('php/jugadores_leyenda.php')) {
    include 'php/jugadores_leyenda.php';

} elseif ($page === 'selecciones_historicas' && file_exists('php/selecciones_historicas.php')) {
    include 'php/selecciones_historicas.php';

} elseif ($page === 'perfil' && file_exists('php/perfil.php')) {
    include 'php/perfil.php';

} elseif ($page === 'mis_publicaciones' && file_exists('php/mis_publicaciones.php')) {
    include 'php/mis_publicaciones.php';

} elseif ($page === 'approve_posts' && file_exists('php/admin_approvals.php')) {
    include 'php/admin_approvals.php';

} else {
    http_response_code(404);
    echo "<h1>Error 404: Página no encontrada</h1>";
}
