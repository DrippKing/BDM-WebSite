<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estadísticas — BALONES DE ORO</title>

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/maximosgoleadores.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body>
    <?php 
        $navbar_template = 'navbar-main';
        require __DIR__ . '/../html/templates/navbar.php'; 
    ?>

    <div class="MainContainer">
        <div id="vertical-title">
            <span class="vertical-text bebas-neue-regular">ESTADISTICAS</span>
        </div>

        <div class="stats-content">
            <h2 class="section-title bebas-neue-regular">BALONES DE ORO</h2>

            <div class="stats-grid-container">
                <div class="stat-card">
                    <div class="stat-icon">🏆</div>
                    <h3 class="stat-title bebas-neue-regular">Mundial 1986</h3>
                    <p class="stat-value">Diego Maradona</p>
                    <p class="stat-detail">Argentina</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">🏆</div>
                    <h3 class="stat-title bebas-neue-regular">Mundial 1994</h3>
                    <p class="stat-value">Romário</p>
                    <p class="stat-detail">Brasil</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">🏆</div>
                    <h3 class="stat-title bebas-neue-regular">Mundial 2006</h3>
                    <p class="stat-value">Zinedine Zidane</p>
                    <p class="stat-detail">Francia</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">🏆</div>
                    <h3 class="stat-title bebas-neue-regular">Mundial 1982</h3>
                    <p class="stat-value">Paolo Rossi</p>
                    <p class="stat-detail">Italia</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">🏆</div>
                    <h3 class="stat-title bebas-neue-regular">Mundial 1990</h3>
                    <p class="stat-value">Salvatore Schillaci</p>
                    <p class="stat-detail">Italia</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">🏆</div>
                    <h3 class="stat-title bebas-neue-regular">Mundial 1998</h3>
                    <p class="stat-value">Ronaldo Nazário</p>
                    <p class="stat-detail">Brasil</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">🏆</div>
                    <h3 class="stat-title bebas-neue-regular">Mundial 2010</h3>
                    <p class="stat-value">Diego Forlán</p>
                    <p class="stat-detail">Uruguay</p>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">🏆</div>
                    <h3 class="stat-title bebas-neue-regular">Mundial 2018</h3>
                    <p class="stat-value">Luka Modrić</p>
                    <p class="stat-detail">Croacia</p>
                </div>
            </div>

        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
</body>
</html>