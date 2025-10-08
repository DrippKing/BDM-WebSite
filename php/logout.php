<?php
// Iniciamos la sesión para poder acceder a ella.
session_start();

// Destruimos todas las variables de sesión.
$_SESSION = array();

// Finalmente, destruimos la sesión.
session_destroy();

// Redirigimos al usuario a la página de inicio.
header("Location: index.php?page=home");
exit;