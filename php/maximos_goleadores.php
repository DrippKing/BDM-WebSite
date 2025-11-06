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


            <!-- Mantener solo el Resumen y la palabra ESTADISTICAS (título vertical ya presente) -->
            <div class="stats-grid-container">
                <div class="stat-card" data-player="Miroslav Klose" data-img="https://tse2.mm.bing.net/th/id/OIP.RBiNsXBVF103isdxHUI85wHaEK?rs=1&pid=ImgDetMain&o=7&rm=3">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Alemania</h3>
                    <p class="stat-value">Miroslav Klose</p>
                    <p class="stat-detail">16 Goles</p>
                </div>

                <div class="stat-card" data-player="Ronaldo Nazário" data-img="img/players/ronaldo_nazario.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Brasil</h3>
                    <p class="stat-value">Ronaldo Nazário</p>
                    <p class="stat-detail">15 Goles</p>
                </div>

                <div class="stat-card" data-player="Gerd Müller" data-img="img/players/gerd_mueller.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Alemania</h3>
                    <p class="stat-value">Gerd Müller</p>
                    <p class="stat-detail">14 Goles</p>
                </div>

                <div class="stat-card" data-player="Just Fontaine" data-img="img/players/just_fontaine.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Francia</h3>
                    <p class="stat-value">Just Fontaine</p>
                    <p class="stat-detail">13 Goles</p>
                </div>

                <div class="stat-card" data-player="Lionel Messi" data-img="img/players/lionel_messi.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Argentina</h3>
                    <p class="stat-value">Lionel Messi</p>
                    <p class="stat-detail">13 Goles</p>
                </div>

                <div class="stat-card" data-player="Pelé" data-img="img/players/pele.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Brasil</h3>
                    <p class="stat-value">Pelé</p>
                    <p class="stat-detail">12 Goles</p>
                </div>
                
                 <div class="stat-card" data-player="Kylian Mbappé" data-img="img/players/kylian_mbappe.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Francia</h3>
                    <p class="stat-value">Kylian Mbappé</p>
                    <p class="stat-detail">12 Goles</p>
                </div>

                 <div class="stat-card" data-player="Sándor Kocsis" data-img="img/players/sandor_kocsis.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Hungría</h3>
                    <p class="stat-value">Sándor Kocsis</p>
                    <p class="stat-detail">11 Goles</p>
                </div>

                <div class="stat-card" data-player="Jürgen Klinsmann" data-img="img/players/jurgen_klinsmann.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Alemania</h3>
                    <p class="stat-value">Jürgen Klinsmann</p>
                    <p class="stat-detail">11 Goles</p>
                </div>

                <div class="stat-card" data-player="Helmut Rahn" data-img="img/players/helmut_rahn.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Alemania</h3>
                    <p class="stat-value">Helmut Rahn</p>
                    <p class="stat-detail">10 Goles</p>
                </div>

                <div class="stat-card" data-player="Gary Lineker" data-img="img/players/gary_lineker.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Inglaterra</h3>
                    <p class="stat-value">Gary Lineker</p>
                    <p class="stat-detail">10 Goles</p>
                </div>

                <div class="stat-card" data-player="Gabriel Batistuta" data-img="img/players/gabriel_batistuta.jpg">
                    <div class="stat-icon">⚽</div>
                    <h3 class="stat-title bebas-neue-regular">Argentina</h3>
                    <p class="stat-value">Gabriel Batistuta</p>
                    <p class="stat-detail">10 Goles</p>
                </div>
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