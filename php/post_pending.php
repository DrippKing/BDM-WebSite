<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publicación Enviada - Mundial Twenty Six</title>
    <link rel="icon" href="img/Logo.png">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body class="custom-perfil-bg">
    <?php 
        $navbar_template = 'navbar-main';
        require __DIR__ . '/../html/templates/navbar.php'; 
    ?>

    <div class="container text-center text-white" style="padding-top: 15vh;">
        <div class="p-5 rounded-3" style="background-color: rgba(0, 20, 51, 0.8);">
            <h1 class="bebas-neue-regular" style="font-size: 3.5rem;">¡Gracias por tu contribución!</h1>
            <p class="lead fs-4">Tu publicación ha sido enviada y está pendiente de revisión por un administrador.</p>
            <hr class="my-4 border-light">
            <p>Una vez aprobada, será visible para toda la comunidad.</p>
            <a class="btn btn-primary btn-lg" href="index.php?page=home" role="button">Volver al inicio</a>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
</body>
</html>
