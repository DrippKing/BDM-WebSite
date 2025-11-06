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
                <h2 class="section-title"> Selecciones Historicas</h2>
            </section>

            <section class="grid-container" id="legendsGrid">
                <!-- Tarjeta de ejemplo: Brasil 1970 -->
<!-- ✅ BRASIL -->
<article class="legend-card" 
    data-team="Brasil" 
    data-img="img/teams/brasil.jpg" 
    data-era="1930-Actualidad"
    data-bio="La selección más laureada de la historia, con 5 Copas del Mundo. Brasil es sinónimo de 'Joga Bonito', un estilo de juego ofensivo, creativo y lleno de magia. Desde el equipo de Pelé en 1970, considerado por muchos el mejor de todos los tiempos, hasta las generaciones de Ronaldo, Rivaldo y Ronaldinho, Brasil ha definido épocas con su talento y alegría en el campo.">
    <div class="card-media">
        <img src="img/teams/brasil.jpg" alt="Brasil" class="card-img">
        <div class="card-badge gradient">Histórica</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Brasil</h3>
        <p class="player-meta">Campeón del Mundo • 5 Copas</p>
        <p class="short-desc">Selección con más títulos. Fútbol ofensivo, samba y magia.</p>
        <div class="card-actions">
            <span class="stat">Jugador Clave: <strong>Pelé</strong></span>
        </div>
    </div>
</article>

<!-- ✅ ALEMANIA -->
<article class="legend-card" 
    data-team="Alemania" 
    data-img="img/teams/alemania.jpg" 
    data-era="1954-Actualidad"
    data-bio="Con cuatro títulos mundiales, Alemania es un símbolo de disciplina, poderío físico y una mentalidad ganadora inquebrantable. Su estilo táctico ha evolucionado desde la fuerza y la eficiencia del 'Milagro de Berna' en 1954 hasta el juego de posesión y ataque dinámico que los coronó en 2014. Siempre competitivos, son una potencia que nunca puede ser subestimada.">
    <div class="card-media">
        <img src="img/teams/alemania.jpg" alt="Alemania" class="card-img">
        <div class="card-badge">Histórica</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Alemania</h3>
        <p class="player-meta">Potencia europea • 4 Copas</p>
        <p class="short-desc">Disciplina, fuerza física y mentalidad ganadora.</p>
        <div class="card-actions">
            <span class="stat">Jugador Clave: <strong>M. Klose</strong></span>
        </div>
    </div>
</article>

<!-- ✅ ARGENTINA -->
<article class="legend-card" 
    data-team="Argentina" 
    data-img="img/teams/argentina.jpg" 
    data-era="1978-2022"
    data-bio="Tres veces campeona del mundo, Argentina vive el fútbol con una pasión desbordante. Su historia está marcada por la genialidad de dos de los más grandes: Diego Maradona, que los llevó a la gloria en 1986 con actuaciones legendarias, y Lionel Messi, quien lideró a la 'Albiceleste' a su tercer título en 2022, consolidando su lugar en el olimpo del fútbol.">
    <div class="card-media">
        <img src="https://tse2.mm.bing.net/th/id/OIP.RBiNsXBVF103isdxHUI85wHaEK?rs=1&pid=ImgDetMain&o=7&rm=3" alt="Argentina" class="card-img">
        <div class="card-badge gradient">Histórica</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Argentina</h3>
        <p class="player-meta">Campeón del Mundo • 3 Copas</p>
        <p class="short-desc">Cuna de leyendas, pasión y fútbol ofensivo.</p>
        <div class="card-actions">
            <span class="stat">Jugador Clave: <strong>Messi</strong></span>
        </div>
    </div>
</article>

<!-- ✅ ITALIA -->
<article class="legend-card" 
    data-team="Italia" 
    data-img="img/teams/italia.jpg" 
    data-era="1934-2006"
    data-bio="Con cuatro estrellas en su escudo, Italia es la cuna del 'Catenaccio', un sistema defensivo que prioriza la solidez táctica y el contraataque. La 'Azzurra' ha demostrado ser una maestra en el arte de competir, combinando una defensa férrea con delanteros letales como Paolo Rossi en 1982 o la garra colectiva que los llevó al título en 2006.">
    <div class="card-media">
        <img src="img/teams/italia.jpg" alt="Italia" class="card-img">
        <div class="card-badge">Histórica</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Italia</h3>
        <p class="player-meta">Campeón del Mundo • 4 Copas</p>
        <p class="short-desc">Defensa legendaria. Creadores del Catenaccio.</p>
        <div class="card-actions">
            <span class="stat">Jugador Clave: <strong>Paolo Rossi</strong></span>
        </div>
    </div>
</article>

<!-- ✅ URUGUAY -->
<article class="legend-card" 
    data-team="Uruguay" 
    data-img="img/teams/uruguay.jpg" 
    data-era="1930-1950"
    data-bio="La primera campeona del mundo en 1930, Uruguay es la personificación de la 'garra charrúa'. Su mayor hazaña fue el 'Maracanazo' de 1950, cuando derrotaron a Brasil en su propia casa en una de las finales más impactantes de la historia. A pesar de ser un país pequeño, su espíritu combativo y su rica historia lo convierten en un gigante del fútbol.">
    <div class="card-media">
        <img src="img/teams/uruguay.jpg" alt="Uruguay" class="card-img">
        <div class="card-badge">Histórica</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Uruguay</h3>
        <p class="player-meta">Bicampeón del Mundo • 2 Copas</p>
        <p class="short-desc">Primer campeón mundial y protagonista del Maracanazo.</p>
        <div class="card-actions">
            <span class="stat">Jugador Clave: <strong>Obdulio Varela</strong></span>
        </div>
    </div>
</article>

<!-- ✅ FRANCIA -->
<article class="legend-card" 
    data-team="Francia" 
    data-img="img/teams/francia.jpg" 
    data-era="1998-2022"
    data-bio="Dos veces campeona del mundo, Francia ha sido una fuerza dominante en la era moderna. Liderada por la elegancia de Zidane en 1998 y la explosividad de Mbappé en 2018, 'Les Bleus' combinan un físico imponente con una técnica depurada y una velocidad letal en el ataque, convirtiéndolos en una de las selecciones más temidas del planeta.">
    <div class="card-media">
        <img src="img/teams/francia.jpg" alt="Francia" class="card-img">
        <div class="card-badge">Histórica</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Francia</h3>
        <p class="player-meta">Campeón del Mundo • 2 Copas</p>
        <p class="short-desc">Talento joven, rapidez y explosión ofensiva.</p>
        <div class="card-actions">
            <span class="stat">Jugador Clave: <strong>Zidane</strong></span>
        </div>
    </div>
</article>

<!-- ✅ INGLATERRA -->
<article class="legend-card" 
    data-team="Inglaterra" 
    data-img="img/teams/inglaterra.jpg" 
    data-era="1966-Actualidad"
    data-bio="Los inventores del fútbol moderno, Inglaterra alcanzó la gloria en su propia casa en 1966. Su estilo históricamente se ha basado en la fuerza, el juego aéreo y un espíritu de lucha incansable. Con una de las ligas más competitivas del mundo, siempre son candidatos, buscando revivir la hazaña de leyendas como Bobby Charlton.">
    <div class="card-media">
        <img src="img/teams/inglaterra.jpg" alt="Inglaterra" class="card-img">
        <div class="card-badge">Histórica</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">Inglaterra</h3>
        <p class="player-meta">Campeón del Mundo • 1 Copa</p>
        <p class="short-desc">Dueños del origen del fútbol moderno.</p>
        <div class="card-actions">
            <span class="stat">Jugador Clave: <strong>B. Charlton</strong></span>
        </div>
    </div>
</article>

<!-- ✅ ESPAÑA -->
<article class="legend-card" 
    data-team="España" 
    data-img="img/teams/espana.jpg" 
    data-era="2008-2012"
    data-bio="La España de 2010 revolucionó el fútbol con el 'Tiki-Taka', un estilo basado en la posesión, el pase corto y el movimiento constante. Liderados por una generación dorada de mediocampistas como Xavi e Iniesta, dominaron el mundo con un fútbol de control absoluto que los llevó a ganar su primera Copa del Mundo, dejando un legado táctico imborrable.">
    <div class="card-media">
        <img src="img/teams/espana.jpg" alt="España" class="card-img">
        <div class="card-badge gradient">Histórica</div>
    </div>
    <div class="card-body">
        <h3 class="player-name">España</h3>
        <p class="player-meta">Campeón del Mundo • 1 Copa</p>
        <p class="short-desc">Revolucionaron el fútbol con el Tiki-Taka.</p>
        <div class="card-actions">
            <span class="stat">Jugador Clave: <strong>Iniesta</strong></span>
        </div>
    </div>
</article>


                <!-- Añade más tarjetas de selecciones aquí -->
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
            const era = card.getAttribute('data-era');
            const achievement = card.querySelector('.player-meta').textContent.split('•')[0].trim();
            const keyPlayer = card.querySelector('.stat strong').textContent;
            const bio = card.getAttribute('data-bio'); // Obtener la biografía

            const modal = document.getElementById('teamModal');
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