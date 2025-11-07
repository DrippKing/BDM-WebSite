<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selecciones Históricas — Mundial Twenty Six</title>
    <link rel="icon" href="img/Logo.png">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/maximosgoleadores.css">
    
    <!-- Reutilizamos el tema de jugadores leyenda para mantener la consistencia visual -->
    <link rel="stylesheet" href="css/jugadores_leyenda_theme.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">
</head>
<body class="theme-selecciones">
    <?php
        // 1. Incluir la conexión a la base de datos
        require_once __DIR__ . '/db_connect.php';

        // 2. Obtener las selecciones de la base de datos
        $teams = [];
        $sql = "SELECT `team_name`, `world_cups`, `era`, `bio`, `key_player`, `image` FROM `historic_teams` ORDER BY `team_name` ASC";
        $result = $conn->query($sql);
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $teams[] = $row;
            }
        }

        // Incluimos la barra de navegación principal.
        $navbar_template = 'navbar-main';
        require __DIR__ . '/../html/templates/navbar.php'; 
    ?>

    <main class="MainContainer">
        <div id="vertical-title">
            <span class="vertical-text bebas-neue-regular">JUGADORES Y EQUIPOS</span>
        </div>

        <div class="content-area">
            <!-- Header removed as requested (was: Selecciones Históricas box) -->

            <section class="grid-header">
                <h2 class="section-title">Selecciones Históricas</h2>
                
            </section>

            <section class="grid-container" id="legendsGrid">
                <?php if (count($teams) > 0): ?>
                    <?php foreach ($teams as $team): ?>
                        <article class="legend-card" 
                            data-team="<?php echo htmlspecialchars($team['team_name']); ?>" 
                            data-img="<?php echo htmlspecialchars($team['image']); ?>" 
                            data-era="<?php echo htmlspecialchars($team['era']); ?>"
                            data-bio="<?php echo htmlspecialchars($team['bio']); ?>"
                            data-achievement="Campeón del Mundo • <?php echo htmlspecialchars($team['world_cups']); ?> Copas"
                            data-key-player="<?php echo htmlspecialchars($team['key_player']); ?>">
                            <div class="card-media">
                                <img src="<?php echo htmlspecialchars($team['image']); ?>" alt="<?php echo htmlspecialchars($team['team_name']); ?>" class="card-img">
                                <div class="card-badge gradient">Histórica</div>
                            </div>
                            <div class="card-body">
                                <h3 class="player-name"><?php echo htmlspecialchars($team['team_name']); ?></h3>
                                <p class="player-meta">Campeón del Mundo • <?php echo htmlspecialchars($team['world_cups']); ?> Copas</p>
                                <p class="short-desc"><?php echo substr(htmlspecialchars($team['bio']), 0, 80) . '...'; ?></p>
                                <div class="card-actions">
                                    <span class="stat">Jugador Clave: <strong><?php echo htmlspecialchars($team['key_player']); ?></strong></span>
                                </div>
                            </div>
                        </article>
                    <?php endforeach; ?>
                <?php else: ?>
                    <p class="text-white text-center fs-4">No hay selecciones para mostrar.</p>
                <?php endif; ?>
            </section>
        </div>
    </main>

    <!-- Modal para Selecciones -->
    <div class="modal fade" id="teamModal" tabindex="-1" aria-labelledby="teamModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-0">
                <div class="modal-header border-0">
                    <h5 class="modal-title" id="teamModalLabel">Selección Histórica</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4 text-center">
                            <img id="teamModalImg" src="img/teams/placeholder.jpg" alt="Selección" class="img-fluid rounded mb-2">
                            <h4 id="teamModalName">Nombre de la Selección</h4>
                            <p id="teamModalMeta" class="text-muted">Era • Logro Principal</p>
                        </div>
                        <div class="col-md-8">
                            <h5>Historia y Tácticas</h5>
                            <p id="teamModalBio" class="mb-4">Breve historia de la selección, su estilo de juego, tácticas y el impacto que tuvo en el fútbol mundial.</p>
                            <div class="stats-container">
                                <div class="stat-item">
                                    <span class="stat-label">Logro Principal</span>
                                    <span class="stat-value" id="teamModalAchievement">Campeón del Mundo</span>
                                </div>
                                <div class="stat-item">
                                    <span class="stat-label">Jugador Clave</span>
                                    <span class="stat-value" id="teamModalKeyPlayer">Pelé</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
    <script>
        // Rellenar modal usando data-attributes de la carta
        function openTeamModalFromCard(card) {
            const name = card.getAttribute('data-team');
            const img = card.getAttribute('data-img');
            const era = card.getAttribute('data-era') || 'N/A';
            const achievement = card.getAttribute('data-achievement') || 'No disponible';
            const keyPlayer = card.getAttribute('data-key-player') || 'No disponible';
            const bio = card.getAttribute('data-bio'); // Obtener la biografía

            const modal = document.getElementById('teamModal');
            if (!modal) return;
            modal.querySelector('#teamModalName').textContent = name;
            modal.querySelector('#teamModalImg').src = img || 'https://via.placeholder.com/400x400';
            modal.querySelector('#teamModalMeta').textContent = 'Era: ' + era;
            
            // Rellenar nuevos campos del modal
            modal.querySelector('#teamModalAchievement').textContent = achievement;
            modal.querySelector('#teamModalKeyPlayer').textContent = keyPlayer;
            modal.querySelector('#teamModalBio').textContent = bio || 'Historia no disponible.'; // Usar la biografía o un texto por defecto
        }

        document.querySelectorAll('.legend-card').forEach(function(card) {
            card.addEventListener('click', function(e) {
                if (e.target.classList.contains('open-team')) return;
                
                openTeamModalFromCard(card);
                const modalEl = document.getElementById('teamModal');
                const modal = new bootstrap.Modal(modalEl);
                modal.show();
            });
        });

        // Filtrado por chips
        const chips = document.querySelectorAll('.filters .chip');
        const cards = document.querySelectorAll('.legend-card');

        function normalize(text) { return (text || '').trim().toLowerCase(); }

        function filterByChip(filterText) {
            const t = normalize(filterText);
            cards.forEach(card => {
                const era = normalize(card.getAttribute('data-era'));
                card.style.display = (t === 'todos' || t === '' || era === t) ? '' : 'none';
            });
        }

        chips.forEach(chip => {
            chip.addEventListener('click', function() {
                chips.forEach(c => c.classList.remove('active'));
                chip.classList.add('active');
                filterByChip(chip.textContent || chip.innerText);
            });
        });

        // Inicializar filtro
        (function() {
            const active = document.querySelector('.filters .chip.active');
            filterByChip(active ? (active.textContent || active.innerText) : 'todos');
        })();
    </script>
</body>
</html>