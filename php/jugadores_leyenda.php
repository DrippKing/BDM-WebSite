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
            
            <!-- ⚽ URUGUAY -->
<article class="legend-card" 
    data-player="Obdulio Varela" 
    data-img="img/players/varela.jpg" 
    data-era="Antes 1990" 
    data-position="Mediocampista"
    data-bio="'El Negro Jefe', fue un futbolista uruguayo, recordado por ser el capitán de la selección que ganó la Copa del Mundo de 1950 en el famoso 'Maracanazo' contra Brasil. Su liderazgo y carácter fueron fundamentales para esa hazaña histórica."
    data-stats-partidos="45" data-stats-goles="9" data-stats-copas="1">
    <div class="card-media">
        <img src="img/players/varela.jpg" alt="Obdulio Varela" class="card-img">
        <div class="card-badge">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Obdulio Varela</h3>
        <p class="player-meta">Uruguay • Capitán • Campeón 1950 (Maracanazo)</p>
        <div class="card-actions">
            <span class="stat">Copas <strong>1</strong></span>
        </div>
    </div>
</article>


<!-- 🇮🇹 ITALIA -->
<article class="legend-card" 
    data-player="Paolo Rossi" 
    data-img="img/players/paolo_rossi.jpg" 
    data-era="Antes 1990" 
    data-position="Delantero"
    data-bio="Delantero italiano, héroe de la Copa del Mundo de 1982, donde fue el máximo goleador y galardonado con el Balón de Oro del torneo. Su actuación, con un 'hat-trick' contra Brasil, es una de las más recordadas en la historia de los mundiales."
    data-stats-partidos="14 (Mundial)" data-stats-goles="9 (Mundial)" data-stats-copas="1">
    <div class="card-media">
        <img src="img/players/paolo_rossi.jpg" alt="Paolo Rossi" class="card-img">
        <div class="card-badge">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Paolo Rossi</h3>
        <p class="player-meta">Italia • Delantero • Campeón 1982</p>
        <div class="card-actions">
            <span class="stat">Goles Mundial '82 <strong>6</strong></span>
        </div>
    </div>
</article>


<!-- 🇫🇷 FRANCIA -->
<article class="legend-card" 
    data-player="Zinedine Zidane" 
    data-img="img/players/zidane.jpg" 
    data-era="1990-2010" 
    data-position="Mediocampista"
    data-bio="Considerado uno de los mejores mediocampistas de todos los tiempos. Lideró a Francia a su primera Copa del Mundo en 1998, anotando dos goles en la final. También llevó al equipo a la final de 2006, donde fue expulsado en uno de los momentos más icónicos del fútbol."
    data-stats-partidos="108" data-stats-goles="31" data-stats-copas="1">
    <div class="card-media">
        <img src="img/players/zidane.jpg" alt="Zinedine Zidane" class="card-img">
        <div class="card-badge">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Zinedine Zidane</h3>
        <p class="player-meta">Francia • Mediocampista • Campeón 1998</p>
        <div class="card-actions">
            <span class="stat">Finales <strong>2</strong></span>
        </div>
    </div>
</article>


<!-- 🇧🇷 BRASIL -->
<article class="legend-card" 
    data-player="Pelé" 
    data-img="img/players/pele.jpg" 
    data-era="Antes 1990" 
    data-position="Delantero"
    data-bio="Para muchos, el mejor futbolista de la historia. 'O Rei' es el único jugador en ganar tres Copas del Mundo. Su impacto en el fútbol es incalculable, combinando una habilidad técnica sin igual, una capacidad goleadora asombrosa y una visión de juego única."
    data-stats-partidos="92" data-stats-goles="77" data-stats-copas="3">
    <div class="card-media">
        <img src="img/players/pele.jpg" alt="Pelé" class="card-img">
        <div class="card-badge gradient">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Pelé</h3>
        <p class="player-meta">Brasil • Delantero • 3x Campeón</p>
        <div class="card-actions">
            <span class="stat">Copas <strong>3</strong></span>
        </div>
    </div>
</article>


<!-- 🇨🇭 SUIZA -->
<article class="legend-card" 
    data-player="Xherdan Shaqiri" 
    data-img="img/players/shaqiri.jpg" 
    data-era="2010-2026" 
    data-position="Mediocampista"
    data-bio="Conocido por su potente disparo y habilidad para marcar goles espectaculares, Shaqiri ha sido la figura clave de la selección suiza en cuatro Copas del Mundo consecutivas, siendo el motor ofensivo y líder de su equipo en el escenario internacional."
    data-stats-partidos="125" data-stats-goles="32" data-stats-mundiales="4">
    <div class="card-media">
        <img src="img/players/shaqiri.jpg" alt="Xherdan Shaqiri" class="card-img">
        <div class="card-badge">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Xherdan Shaqiri</h3>
        <p class="player-meta">Suiza • Mediocampista • Figura mundialista</p>
        <div class="card-actions">
            <span class="stat">Mundiales <strong>4</strong></span>
        </div>
    </div>
</article>


<!-- 🇸🇪 SUECIA -->
<article class="legend-card" 
    data-player="Henrik Larsson" 
    data-img="img/players/larsson.jpg" 
    data-era="1990-2010" 
    data-position="Delantero"
    data-bio="Un delantero prolífico y elegante, Larsson fue una pieza fundamental de la selección sueca que alcanzó el tercer lugar en el Mundial de 1994. Su inteligencia en el campo y su capacidad para anotar goles lo convirtieron en un ícono del fútbol sueco."
    data-stats-partidos="106" data-stats-goles="37" data-stats-mundiales="3">
    <div class="card-media">
        <img src="img/players/larsson.jpg" alt="Henrik Larsson" class="card-img">
        <div class="card-badge">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Henrik Larsson</h3>
        <p class="player-meta">Suecia • Delantero • 3er lugar en 1994 </p>
        <div class="card-actions">
            <span class="stat">Goles <strong>37</strong></span>
        </div>
    </div>
</article>


<!-- 🇨🇱 CHILE -->
<article class="legend-card" 
    data-player="Elías Figueroa" 
    data-img="img/players/figueroa.jpg" 
    data-era="Antes 1990" 
    data-position="Defensa"
    data-bio="Considerado uno de los mejores defensas de la historia del fútbol. 'Don Elías' fue reconocido por su elegancia, técnica y liderazgo. Fue elegido el mejor futbolista de Sudamérica en tres ocasiones consecutivas y participó en tres Copas del Mundo."
    data-stats-partidos="47" data-stats-goles="2" data-stats-mundiales="3">
    <div class="card-media">
        <img src="img/players/figueroa.jpg" alt="Elías Figueroa" class="card-img">
        <div class="card-badge gradient">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Elías Figueroa</h3>
        <p class="player-meta">Chile • Defensa • Mejor defensa sudamericano</p>
        <div class="card-actions">
            <span class="stat">Mundiales <strong>3</strong></span>
        </div>
    </div>
</article>


<!-- 🏴 INGLATERRA -->
<article class="legend-card" 
    data-player="Bobby Charlton" 
    data-img="img/players/charlton.jpg" 
    data-era="Antes 1990" 
    data-position="Mediocampista"
    data-bio="Sobreviviente del desastre aéreo de Múnich, Sir Bobby Charlton se convirtió en el líder de la selección inglesa que ganó su única Copa del Mundo en 1966. Su potente disparo y su visión de juego lo establecieron como una leyenda del Manchester United y de Inglaterra."
    data-stats-partidos="106" data-stats-goles="49" data-stats-copas="1">
    <div class="card-media">
        <img src="img/players/charlton.jpg" alt="Bobby Charlton" class="card-img">
        <div class="card-badge">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Bobby Charlton</h3>
        <p class="player-meta">Inglaterra • Mediocampista • Campeón 1966</p>
        <div class="card-actions">
            <span class="stat">Copas <strong>1</strong></span>
        </div>
    </div>
</article>


<!-- 🇲🇽 MÉXICO -->
<article class="legend-card" 
    data-player="Hugo Sánchez" 
    data-img="img/players/hugo.jpg" 
    data-era="Antes 1990" 
    data-position="Delantero"
    data-bio="Conocido como 'Hugol', es uno de los mejores futbolistas mexicanos de la historia. Famoso por sus espectaculares goles de chilena, fue una estrella en el Real Madrid y lideró a México en el Mundial de 1986, donde el equipo alcanzó los cuartos de final."
    data-stats-partidos="58" data-stats-goles="29" data-stats-mundiales="3">
    <div class="card-media">
        <img src="img/players/hugo.jpg" alt="Hugo Sánchez" class="card-img">
        <div class="card-badge gradient">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Hugo Sánchez</h3>
        <p class="player-meta">México • Delantero • Figura en 1986</p>
        <div class="card-actions">
            <span class="stat">Pichichis <strong>5</strong></span>
        </div>
    </div>
</article>


<!-- 🇩🇪 ALEMANIA -->
<article class="legend-card" 
    data-player="Miroslav Klose" 
    data-img="img/players/klose.jpg" 
    data-era="2010-2026" 
    data-position="Delantero"
    data-bio="El máximo goleador en la historia de la Copa Mundial de la FIFA. Klose fue un delantero letal, conocido por su increíble juego aéreo y su instinto depredador en el área. Fue campeón del mundo con Alemania en 2014."
    data-stats-partidos="137" data-stats-goles="71" data-stats-copas="1">
    <div class="card-media">
        <img src="https://tse2.mm.bing.net/th/id/OIP.RBiNsXBVF103isdxHUI85wHaEK?rs=1&pid=ImgDetMain&o=7&rm=3" alt="Klose" class="card-img">
        <div class="card-badge">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Miroslav Klose</h3>
        <p class="player-meta">Alemania • Máximo goleador mundialista</p>
        <div class="card-actions">
            <span class="stat">Goles <strong>16</strong></span>
        </div>
    </div>
</article>


<!-- 🇦🇷 ARGENTINA -->
<article class="legend-card" 
    data-player="Lionel Messi" 
    data-img="img/players/messi.jpg" 
    data-era="2010-2026" 
    data-position="Delantero"
    data-bio="Capitán de la selección argentina que se coronó campeona en Qatar 2022, cumpliendo el sueño de una nación. Considerado por muchos como el mejor de todos los tiempos, Messi ha ganado 8 Balones de Oro y ha roto innumerables récords a lo largo de su carrera."
    data-stats-partidos="182" data-stats-goles="108" data-stats-copas="1">
    <div class="card-media">
        <img src="img/players/messi.jpg" alt="Lionel Messi" class="card-img">
        <div class="card-badge gradient">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Lionel Messi</h3>
        <p class="player-meta">Argentina • Campeón 2022 • Balón de Oro Mundial</p>
        <div class="card-actions">
            <span class="stat">Mundiales <strong>5</strong></span>
        </div>
    </div>
</article>


<!-- 🇪🇸 ESPAÑA -->
<article class="legend-card" 
    data-player="Iker Casillas" 
    data-img="img/players/casillas.jpg" 
    data-era="2010-2026" 
    data-position="Portero"
    data-bio="'San Iker' fue el capitán y portero de la selección española que ganó la Copa del Mundo en 2010. Sus atajadas milagrosas, especialmente una a Arjen Robben en la final, fueron cruciales para el primer título mundial de España. Una leyenda del Real Madrid y del fútbol."
    data-stats-partidos="167" data-stats-porterias-cero="72" data-stats-copas="1">
    <div class="card-media">
        <img src="img/players/casillas.jpg" alt="Iker Casillas" class="card-img">
        <div class="card-badge">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Iker Casillas</h3>
        <p class="player-meta">España • Capitán • Campeón 2010</p>
        <div class="card-actions">
            <span class="stat">Copas <strong>1</strong></span>
        </div>
    </div>
</article>


<!-- 🇺🇸 USA -->
<article class="legend-card" 
    data-player="Landon Donovan" 
    data-img="img/players/donovan.jpg" 
    data-era="2010-2026" 
    data-position="Delantero"
    data-bio="Considerado el mejor futbolista estadounidense de todos los tiempos. 'Capitán América' lideró a su selección en tres Copas del Mundo, siendo su gol agónico contra Argelia en 2010 uno de los momentos más emocionantes en la historia del fútbol de EE. UU."
    data-stats-partidos="157" data-stats-goles="57" data-stats-mundiales="3">
    <div class="card-media">
        <img src="img/players/donovan.jpg" alt="Landon Donovan" class="card-img">
        <div class="card-badge">Leyenda</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Landon Donovan</h3>
        <p class="player-meta">USA • Delantero • Gol histórico 2010</p>
        <div class="card-actions">
            <span class="stat">Goles <strong>57</strong></span>
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