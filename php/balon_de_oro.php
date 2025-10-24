<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estadísticas — BALONES DE ORO</title>
    <link rel="icon" href="img/Logo.png">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/estadisticas.css">
    <link rel="stylesheet" href="css/balonesoro.css">

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
            <h2 class="section-title bebas-neue-regular">BALONES DE ORO</h2>

            <div class="stats-grid-container">
                <div class="team-card">
                    <img src="img/Argentina_1978_WC.jpg" alt="Argentina" class="team-flag">
                    <div class="card-content">
                        <h3>Argentina</h3>
                        <p>Goles: 12 • P: 5 • GJ: 3</p>
                    </div>
                </div>

                <div class="team-card">
                    <img src="img/Brazil_2014_WC.jpg" alt="Brasil" class="team-flag">
                    <div class="card-content">
                        <h3>Brasil</h3>
                        <p>Goles: 10 • P: 4 • GJ: 2</p>
                    </div>
                </div>

                <div class="team-card">
                    <img src="img/France_1998_WC.jpg" alt="Francia" class="team-flag">
                    <div class="card-content">
                        <h3>Francia</h3>
                        <p>Goles: 16 • P: 6 • GJ: 5</p>
                    </div>
                </div>

                <div class="team-card">
                    <img src="img/Spain_1982_WC.jpg" alt="España" class="team-flag">
                    <div class="card-content">
                        <h3>España</h3>
                        <p>Goles: 9 • P: 4 • GJ: 2</p>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
</body>
</html>