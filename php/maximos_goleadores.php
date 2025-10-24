<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estadísticas - Máximos Goleadores</title>
    <link rel="icon" href="img/Logo.png">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/maximosgoleadores.css"> 
    
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
            <span class="vertical-text bebas-neue-regular">ESTADISTICAS</span>
        </div>
        <div class="stats-content">
            <h2 class="section-title bebas-neue-regular">MAXIMOS GOLEADORES</h2>


        <div class="stats-content">
            <!-- Mantener solo el Resumen y la palabra ESTADISTICAS (título vertical ya presente) -->
            <div class="stats-grid-container">
                <div class="stat-card">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Máximo Goleador</h3>
                    <p class="stat-value">Name</p>
                    <p class="stat-detail">8 Goles</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Máximo Goleador</h3>
                    <p class="stat-value">Name</p>
                    <p class="stat-detail">8 Goles</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Máximo Goleador</h3>
                    <p class="stat-value">Name</p>
                    <p class="stat-detail">8 Goles</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Máximo Goleador</h3>
                    <p class="stat-value">Name</p>
                    <p class="stat-detail">8 Goles</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Máximo Goleador</h3>
                    <p class="stat-value">Name</p>
                    <p class="stat-detail">8 Goles</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Máximo Goleador</h3>
                    <p class="stat-value">Name</p>
                    <p class="stat-detail">8 Goles</p>
                </div>
            </div>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
</body>
</html>