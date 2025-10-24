<?php
// Lógica para obtener el tema de la URL.
$tema = $_GET['tema'] ?? 'Momentos Históricos';
$titulo_formateado = str_replace('_', ' ', $tema);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($titulo_formateado); ?> - Mundial Twenty Six</title>
    <link rel="icon" href="img/Logo.png">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/historic-moments.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body>
    <?php 
        // Incluimos la barra de navegación principal.
        $navbar_template = 'navbar-main';
        require __DIR__ . '/../html/templates/navbar.php'; 
    ?>

    <div class="MainContainer">
        <div id="vertical-title">
            <span class="vertical-text bebas-neue-regular"><?php echo htmlspecialchars(strtoupper($titulo_formateado)); ?></span>
        </div>
        <div style="width:100%">
            <!-- Aquí irá el contenido dinámico de los momentos históricos -->
            <h1 class="text-white text-center p-5">Contenido para '<?php echo htmlspecialchars($titulo_formateado); ?>' en construcción...</h1>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
</body>
</html>