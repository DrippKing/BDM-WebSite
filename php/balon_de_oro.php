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
        // 1. Incluir la conexión a la base de datos
        require_once __DIR__ . '/db_connect.php';

        // 2. Obtener los ganadores del Balón de Oro de la base de datos
        $winners = [];
        $sql = "SELECT `world_cup`, `player`, `country`, `image` FROM `world_cup_golden_ball` ORDER BY `year` DESC";
        $result = $conn->query($sql);
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $winners[] = $row;
            }
        }

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
                <?php if (count($winners) > 0): ?>
                    <?php foreach ($winners as $winner): ?>
                        <div class="stat-card" data-player="<?php echo htmlspecialchars($winner['player']); ?>" data-img="<?php echo htmlspecialchars($winner['image']); ?>">
                            <div class="stat-icon">🏆</div>
                            <h3 class="stat-title bebas-neue-regular"><?php echo htmlspecialchars($winner['world_cup']); ?></h3>
                            <p class="stat-value"><?php echo htmlspecialchars($winner['player']); ?></p>
                            <p class="stat-detail"><?php echo htmlspecialchars($winner['country']); ?></p>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <p class="text-white text-center fs-4">No hay ganadores del Balón de Oro para mostrar.</p>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <!-- Modal para mostrar la imagen del jugador (reutilizado de maximos_goleadores) -->
    <div class="modal fade" id="playerImageModal" tabindex="-1" aria-labelledby="playerImageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="background: transparent; border: none; box-shadow: none;">
                <div class="modal-header" style="background: transparent; border-bottom: none;">
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center" style="background: transparent;">
                    <img id="player-image" src="" alt="Imagen del jugador" style="max-width:100%; height:auto; border-radius: 10px;" />
                    <h4 id="player-name" class="mt-3" style="color: #fff; text-shadow: 0 0 5px black;"></h4>
                </div>
            </div>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.stat-card');
            const modalEl = document.getElementById('playerImageModal');
            if (!modalEl) return;

            const playerImage = modalEl.querySelector('#player-image');
            const playerName = modalEl.querySelector('#player-name');
            const bsModal = new bootstrap.Modal(modalEl);

            cards.forEach(card => {
                card.addEventListener('click', () => {
                    const imgSrc = card.getAttribute('data-img');
                    const name = card.getAttribute('data-player');
                    
                    if (playerImage && playerName && imgSrc) {
                        playerImage.src = imgSrc;
                        playerName.textContent = name;
                        bsModal.show();
                    }
                });
            });
        });
    </script>
</body>
</html>