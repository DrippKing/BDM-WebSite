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
            
            <article class="legend-card" data-player="Pelé" data-img="img/players/pele.jpg" data-era="Antes 1990" data-position="Delantero">
                <div class="card-media">
                    <img src="https://s1.1zoom.me/big0/335/Footbal_Men_Ball_Legs_493200.jpg" alt="Pelé" class="card-img">
                    <div class="card-badge">Leyenda</div>
                </div>
                <div class="card-body">
                    <h3 class="player-name">Pelé</h3>
                    <p class="player-meta">Brasil • Delantero • 3x Mundial</p>
                    <div class="card-actions">
                        <button class="btn btn-sm btn-outline-light open-player" data-bs-toggle="modal" data-bs-target="#playerModal">Ver</button>
                        <span class="stat">Goles <strong>77</strong></span>
                    </div>
                </div>
            </article>

            <article class="legend-card" data-player="Diego Maradona" data-img="img/players/maradona.jpg" data-era="Antes 1990" data-position="Delantero">
                <div class="card-media">
                    <img src="https://s1.1zoom.me/big0/335/Footbal_Men_Ball_Legs_493200.jpg" alt="Maradona" class="card-img">
                    <div class="card-badge gradient">Leyenda</div>
                </div>
                <div class="card-body">
                    <h3 class="player-name">Diego Maradona</h3>
                    <p class="player-meta">Argentina • Delantero • 1x Mundial</p>
                    <div class="card-actions">
                        <button class="btn btn-sm btn-outline-light open-player" data-bs-toggle="modal" data-bs-target="#playerModal">Ver</button>
                        <span class="stat">Goles <strong>34</strong></span>
                    </div>
                </div>
            </article>

            <article class="legend-card" data-player="Zinedine Zidane" data-img="img/players/zidane.jpg" data-era="1990-2010" data-position="Mediocampista">
                <div class="card-media">
                    <img src="https://s1.1zoom.me/big0/335/Footbal_Men_Ball_Legs_493200.jpg" alt="Zidane" class="card-img">
                    <div class="card-badge">Leyenda</div>
                </div>
                <div class="card-body">
                    <h3 class="player-name">Zinedine Zidane</h3>
                    <p class="player-meta">Francia • Mediocampista • 1x Mundial</p>
                    <div class="card-actions">
                        <button class="btn btn-sm btn-outline-light open-player" data-bs-toggle="modal" data-bs-target="#playerModal">Ver</button>
                        <span class="stat">Goles <strong>31</strong></span>
                    </div>
                </div>
            </article>

            
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
                  <li>Partidos: 123</li>
                  <li>Goles: 45</li>
                  <li>Asistencias: 27</li>
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

      var modal = document.getElementById('playerModal');
      modal.querySelector('#playerModalName').textContent = name;
      modal.querySelector('#playerModalImg').src = img || 'https://via.placeholder.com/400x400';
      modal.querySelector('#playerModalMeta').textContent = pos + ' • ' + era;
      modal.querySelector('#playerModalBio').textContent = 'Biografía breve de ' + name + '. Aquí puedes añadir logros, clubes y momentos icónicos.';
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