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
        // 1. Incluir la conexión a la base de datos
        require_once __DIR__ . '/db_connect.php';

        // 2. Obtener los goleadores de la base de datos
        $scorers = [];
        $sql = "SELECT `name`, `country`, `goals`, `image` FROM `top_scorers` ORDER BY `goals` DESC, `name` ASC";
        $result = $conn->query($sql);
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $scorers[] = $row;
            }
        }

        // 3. Incluimos la barra de navegación principal.
        $navbar_template = 'navbar-main';
        require __DIR__ . '/../html/templates/navbar.php'; 
    ?>

    <div class="MainContainer">
        <div id="vertical-title">
            <span class="vertical-text bebas-neue-regular">ESTADISTICAS</span>
        </div>
        <div class="stats-content">
            <h2 class="section-title bebas-neue-regular">MAXIMOS GOLEADORES</h2>


            <!-- Mantener solo el Resumen y la palabra ESTADISTICAS (título vertical ya presente) -->
            <div class="stats-grid-container">
                <?php if (count($scorers) > 0): ?>
                    <?php foreach ($scorers as $scorer): ?>
                        <div class="stat-card" data-player="<?php echo htmlspecialchars($scorer['name']); ?>" data-img="<?php echo htmlspecialchars($scorer['image']); ?>">
                            <div class="stat-icon">⚽</div>
                            <h3 class="stat-title bebas-neue-regular"><?php echo htmlspecialchars($scorer['country']); ?></h3>
                            <p class="stat-value"><?php echo htmlspecialchars($scorer['name']); ?></p>
                            <p class="stat-detail"><?php echo htmlspecialchars($scorer['goals']); ?> Goles</p>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <p class="text-white text-center fs-4">No hay goleadores para mostrar.</p>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
        <!-- Modal para mostrar la imagen del jugador seleccionado -->
        <div class="modal fade" id="playerImageModal" tabindex="-1" aria-labelledby="playerImageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Hacemos transparente el cuadro del modal para que la imagen no tenga fondo blanco -->
                <div class="modal-content" style="background: transparent; border: none; box-shadow: none;">
                    <div class="modal-header" style="background: transparent; border-bottom: none;">
                       
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center" style="background: transparent;">
                        <a id="player-image-link" href="#" target="_blank" rel="noopener">
                            <img id="player-image" src="" alt="Imagen del jugador" style="max-width:100%; height:auto; background: transparent;" />
                        </a>
                        <p id="player-name" class="mt-2" style="color: #fff;"></p>
                    </div>
                </div>
            </div>
        </div>

        <script>
            (function(){
                const cards = document.querySelectorAll('.stat-card');
                const modalEl = document.getElementById('playerImageModal');
                const playerImage = document.getElementById('player-image');
                const playerLink = document.getElementById('player-image-link');
                const playerName = document.getElementById('player-name');
                const bsModal = new bootstrap.Modal(modalEl);

                cards.forEach(card => {
                    card.addEventListener('click', () => {
                        const img = card.getAttribute('data-img') || '';
                        const name = card.getAttribute('data-player') || '';
                        if(img){
                            playerImage.src = img;
                            playerLink.href = img;
                        } else {
                            playerImage.src = '';
                            playerLink.href = '#';
                        }
                        playerName.textContent = name;
                        bsModal.show();
                    });
                });
            })();
        </script>
</body>
</html>