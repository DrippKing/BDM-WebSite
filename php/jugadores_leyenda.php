<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jugadores Leyenda — Mundial Twenty Six</title>
    <link rel="icon" href="img/Logo.png">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
 
    <link rel="stylesheet" href="css/maximosgoleadores.css">
  
    
    <link rel="stylesheet" href="css/jugadores_leyenda_theme.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">
</head>
<body>
    <?php 
        // 1. Incluir la conexión a la base de datos
        require_once __DIR__ . '/db_connect.php';

        // 2. Obtener los jugadores leyenda de la base de datos
        $players = [];
        $sql = "SELECT `name`, `image`, `date`, `game_position`, `description`, `world_cup`, `goals`, `matches` FROM `leyends_players` ORDER BY `name` ASC";
        $result = $conn->query($sql);
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $players[] = $row;
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
      

      <section class="grid-header">
        <h2 class="section-title">Jugadores Leyenda</h2>
      
      </section>

      <section class="grid-container" id="legendsGrid">
            <?php if (count($players) > 0): ?>
                <?php foreach ($players as $player): ?>
                    <article class="legend-card" 
                        data-player="<?php echo htmlspecialchars($player['name']); ?>" 
                        data-img="<?php echo htmlspecialchars($player['image']); ?>" 
                        data-position="<?php echo htmlspecialchars($player['game_position']); ?>"
                        data-bio="<?php echo htmlspecialchars($player['description']); ?>"
                        data-stats-partidos="<?php echo htmlspecialchars($player['matches'] ?? 'N/A'); ?>" 
                        data-stats-goles="<?php echo htmlspecialchars($player['goals'] ?? 'N/A'); ?>" 
                        data-stats-copas="<?php echo htmlspecialchars($player['world_cup'] ?? 'N/A'); ?>">
                        <div class="card-media">
                            <img src="<?php echo htmlspecialchars($player['image']); ?>" alt="<?php echo htmlspecialchars($player['name']); ?>" class="card-img">
                            <div class="card-badge">Leyenda</div>
                        </div>
                        <div class="card-body">
                            <h3 class="player-name"><?php echo htmlspecialchars($player['name']); ?></h3>
                            <p class="player-meta"><?php echo htmlspecialchars($player['game_position']); ?> • Campeón <?php echo htmlspecialchars($player['date']); ?></p>
                            <div class="card-actions">
                                <span class="stat">Copas <strong><?php echo htmlspecialchars($player['world_cup'] ?? 0); ?></strong></span>
                            </div>
                        </div>
                    </article>
                <?php endforeach; ?>
            <?php else: ?>
                <p class="text-white text-center fs-4">No hay jugadores leyenda para mostrar.</p>
            <?php endif; ?>
        </section>

    </main>

    
    <div class="modal fade" id="playerModal" tabindex="-1" aria-labelledby="playerModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content bg-dark text-white border-0">
          <div class="modal-header border-0">
            <h5 class="modal-title" id="playerModalLabel">Jugador</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-4 text-center">
                <img id="playerModalImg" src="img/players/placeholder.jpg" alt="Jugador" class="img-fluid rounded mb-2">
                <h4 id="playerModalName">Nombre</h4>
                <p id="playerModalMeta" class="text-muted">País • Posición • Era</p>
              </div>
              <div class="col-md-8">
                <h5>Biografía</h5>
                <p id="playerModalBio">Breve biografía del jugador, logros y momentos destacados.</p>
                <h5>Estadísticas</h5>
                <ul id="playerModalStats">
                  <!-- Las estadísticas se llenarán aquí dinámicamente -->
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
    <script>
    
    function openPlayerModalFromCard(card){
      var name = card.getAttribute('data-player');
      var img = card.getAttribute('data-img');
      var era = card.getAttribute('data-era');
      var pos = card.getAttribute('data-position');
      var bio = card.getAttribute('data-bio');

      // Obtener estadísticas
      var stats = {
          partidos: card.getAttribute('data-stats-partidos'),
          goles: card.getAttribute('data-stats-goles'),
          copas: card.getAttribute('data-stats-copas'),
          mundiales: card.getAttribute('data-stats-mundiales'),
          porterias_cero: card.getAttribute('data-stats-porterias-cero')
      };

      var modal = document.getElementById('playerModal');
      modal.querySelector('#playerModalName').textContent = name;
      modal.querySelector('#playerModalImg').src = img || 'https://via.placeholder.com/400x400';
      modal.querySelector('#playerModalMeta').textContent = pos + ' • ' + era;
      modal.querySelector('#playerModalBio').textContent = bio || 'Biografía no disponible.';

      // Llenar lista de estadísticas
      var statsList = modal.querySelector('#playerModalStats');
      statsList.innerHTML = ''; // Limpiar lista anterior
      if (stats.partidos) statsList.innerHTML += `<li>Partidos con selección: <strong>${stats.partidos}</strong></li>`;
      if (stats.goles) statsList.innerHTML += `<li>Goles con selección: <strong>${stats.goles}</strong></li>`;
      if (stats.copas) statsList.innerHTML += `<li>Copas del Mundo ganadas: <strong>${stats.copas}</strong></li>`;
      if (stats.mundiales) statsList.innerHTML += `<li>Participaciones en Mundiales: <strong>${stats.mundiales}</strong></li>`;
      if (stats.porterias_cero) statsList.innerHTML += `<li>Porterías a cero (selección): <strong>${stats.porterias_cero}</strong></li>`;
    }

    document.querySelectorAll('.legend-card').forEach(function(card){
      card.addEventListener('click', function(e){
        
        var target = e.target;
        if(target.classList.contains('open-player')) return;
        
        
        openPlayerModalFromCard(card);
        
        if(!target.classList.contains('open-player')){
          var modalEl = document.getElementById('playerModal');
          var modal = new bootstrap.Modal(modalEl);
          modal.show();
        }
      });
    });

    
    const chips = document.querySelectorAll('.filters .chip');
    const cards = document.querySelectorAll('.legend-card');

    function normalize(text){
      return (text||'').trim().toLowerCase();
    }

    function filterByChip(filterText){
      const t = normalize(filterText);
      cards.forEach(card => {
        const pos = normalize(card.getAttribute('data-position'));
        const era = normalize(card.getAttribute('data-era'));
        
        if(t === 'todos' || t === '' ){
          card.style.display = '';
          return;
        }
        if(pos === t || era === t){
          card.style.display = '';
        } else {
          card.style.display = 'none';
        }
      });
    }

    chips.forEach(function(chip){
      chip.addEventListener('click', function(){
        chips.forEach(c=>c.classList.remove('active'));
        chip.classList.add('active');
        const text = chip.textContent || chip.innerText;
        filterByChip(text);
      });
    });

    
    (function(){
      const active = document.querySelector('.filters .chip.active');
      if(active) filterByChip(active.textContent || active.innerText);
      else filterByChip('todos');
    })();
    </script>
</body>
</html>