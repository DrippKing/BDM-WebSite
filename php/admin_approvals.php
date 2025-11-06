<?php
// Hacemos la funcionalidad de administración no disponible por petición del usuario.
// Redirigimos a home para mantener compatibilidad con enlaces antiguos.
header('Location: index.php?page=home');
exit;
?>
