<?php
$tema = $_GET['tema'] ?? 'Momentos Históricos';
$titulo_formateado = str_replace('_', ' ', $tema);

// --- Base de datos de Momentos Históricos ---
$momentos_historicos = [
    'Finales_Inolvidables' => [
        [
            'titulo' => 'Uruguay Campeón en el Centenario',
            'mundial' => 'Uruguay 1930',
            'descripcion' => 'En la primera edición de la Copa del Mundo, Uruguay venció 4-2 a Argentina en el Estadio Centenario, consolidando su lugar en la historia y dando inicio a la leyenda del torneo.',
            'imagen' => 'img/moments/uruguay_1930.jpg'
        ],
        [
            'titulo' => 'Italia gana en casa',
            'mundial' => 'Italia 1934',
            'descripcion' => 'Italia se proclamó campeón tras derrotar 2-1 a Checoslovaquia en la final, en un torneo marcado por la intensidad y el contexto político de la época.',
            'imagen' => 'img/moments/italia_1934.jpg'
        ],
        [
            'titulo' => 'La doble corona de Italia',
            'mundial' => 'Francia 1938',
            'descripcion' => 'Italia revalidó su título mundial con una final memorable, consolidando una era de dominio en el fútbol europeo.',
            'imagen' => 'img/moments/italia_1938.jpg'
        ],
        [
            'titulo' => 'El Maracanazo',
            'mundial' => 'Brasil 1950',
            'descripcion' => 'Uruguay sorprende al mundo al derrotar a Brasil 2-1 en el Estadio Maracaná, un resultado que aún hoy se recuerda como una de las mayores sorpresas del torneo.',
            'imagen' => 'img/moments/maracanazo.jpg'
        ],
        [
            'titulo' => 'El Milagro de Berna',
            'mundial' => 'Suiza 1954',
            'descripcion' => 'Alemania Federal remonta un 0-2 para vencer 3-2 a Hungría en una final que pasó a la historia por su dramatismo y el final inesperado.',
            'imagen' => 'img/moments/milagro_berna.jpg'
        ],
        [
            'titulo' => 'Pelé y la coronación',
            'mundial' => 'Suecia 1958',
            'descripcion' => 'En 1958 el mundo descubrió a Pelé: Brasil se consagró campeón con una actuación brillantes del joven astro, que sería leyenda.',
            'imagen' => 'img/moments/pel%C3%A9_1958.jpg'
        ],
        [
            'titulo' => 'Brasil tricampeón',
            'mundial' => 'Chile 1962',
            'descripcion' => 'Brasil retuvo el título tras imponerse en un torneo marcado por la intensidad y la calidad de sus figuras, logrando su segundo campeonato consecutivo.',
            'imagen' => 'img/moments/brasil_1962.jpg'
        ],
        [
            'titulo' => 'Inglaterra en Wembley',
            'mundial' => 'Inglaterra 1966',
            'descripcion' => 'En el estadio de Wembley, Inglaterra se proclamó campeona con una victoria 4-2 ante Alemania Federal; la final es recordada por el controvertido gol de Geoff Hurst.',
            'imagen' => 'img/moments/inglaterra_1966.jpg'
        ],
        [
            'titulo' => 'La era de Brasil',
            'mundial' => 'México 1970',
            'descripcion' => 'Brasil ofreció una exhibición colectiva y se coronó campeón 4-1 ante Italia; el torneo es frecuentemente recordado como la cúspide del juego ofensivo brasileño.',
            'imagen' => 'img/moments/pele_1970.jpg'
        ],
        [
            'titulo' => 'La revancha de Alemania',
            'mundial' => 'Alemania 1974',
            'descripcion' => 'Alemania Federal venció 2-1 a la revolucionaria selección de Holanda en una final que simbolizó el triunfo de la organización táctica sobre el estilo.',
            'imagen' => 'img/moments/alemania_1974.jpg'
        ],
        [
            'titulo' => 'Argentina campeón en casa',
            'mundial' => 'Argentina 1978',
            'descripcion' => 'Argentina se consagró en Buenos Aires tras vencer a Países Bajos 3-1 en la final tras prórroga, un torneo que además estuvo rodeado de intensa pasión nacional.',
            'imagen' => 'img/moments/argentina_1978.jpg'
        ],
        [
            'titulo' => 'La magia de Italia',
            'mundial' => 'España 1982',
            'descripcion' => 'Italia se alzó con el título impulsada por Paolo Rossi, en una final histórica frente a Alemania Federal que terminó 3-1.',
            'imagen' => 'img/moments/italia_1982.jpg'
        ],
        [
            'titulo' => 'La mano y el triunfo argentino',
            'mundial' => 'México 1986',
            'descripcion' => 'Argentina, liderada por Diego Maradona, ganó su segunda Copa del Mundo en una actuación memorable que incluyó la polémica "Mano de Dios" y el "Gol del Siglo".',
            'imagen' => 'img/moments/maradona_1986.jpg'
        ],
        [
            'titulo' => 'El controvertido Mundial de Italia',
            'mundial' => 'Italia 1990',
            'descripcion' => 'Un torneo marcado por la táctica y la polémica, en el que Alemania Federal venció 1-0 a Argentina en la final con un penal en los minutos finales.',
            'imagen' => 'img/moments/italia_1990.jpg'
        ],
        [
            'titulo' => 'Sueño americano',
            'mundial' => 'EE. UU. 1994',
            'descripcion' => 'Un torneo que consolidó la globalización del fútbol; la final terminó 0-0 entre Brasil e Italia y se decidió por penales a favor de Brasil.',
            'imagen' => 'img/moments/usa_1994.jpg'
        ],
        [
            'titulo' => 'Francia en casa',
            'mundial' => 'Francia 1998',
            'descripcion' => 'Francia ganó su primer Mundial con una actuación contundente en la final ante Brasil (3-0), en un torneo que celebró la diversidad del fútbol francés.',
            'imagen' => 'img/moments/francia_1998.jpg'
        ],
        [
            'titulo' => 'La sorpresa de Ronaldo',
            'mundial' => 'Corea/Japón 2002',
            'descripcion' => 'Brasil se coronó campeón y Ronaldo Nazário firmó una de las historias más emotivas del fútbol al resurgir y marcar dos goles en la final ante Alemania.',
            'imagen' => 'img/moments/brasil_2002.jpg'
        ],
        [
            'titulo' => 'Italia vuelve a la cima',
            'mundial' => 'Alemania 2006',
            'descripcion' => 'Italia ganó su cuarto título tras una final dramática frente a Francia que se definió por penales, recordada por el episodio del cabezazo de Zidane.',
            'imagen' => 'img/moments/italia_2006.jpg'
        ],
        [
            'titulo' => 'La goleada y la final agónica',
            'mundial' => 'Brasil 2014',
            'descripcion' => 'Un Mundial inolvidable por la histórica semifinal 7-1 de Alemania sobre Brasil; la final terminó 1-0 a favor de Alemania ante Argentina en la prórroga.',
            'imagen' => 'img/moments/brasil_2014.jpg'
        ],
        [
            'titulo' => 'Francia escribe historia',
            'mundial' => 'Rusia 2018',
            'descripcion' => 'Francia conquistó su segundo título mundial tras vencer 4-2 a Croacia en una final de alta intensidad y talento.',
            'imagen' => 'img/moments/francia_2018.jpg'
        ],
        [
            'titulo' => 'Messi y la épica final',
            'mundial' => 'Qatar 2022',
            'descripcion' => 'Argentina se coronó campeona en una final para el recuerdo ante Francia, en una definición que se fue a penales tras un 3-3 vibrante.',
            'imagen' => 'img/moments/messi_qatar.jpg'
        ]
    ],
    'Goles_Legendarios' => [
        [
            'titulo' => 'El Gol del Siglo - Maradona',
            'mundial' => 'México 1986',
            'descripcion' => 'Diego Maradona recorre desde la mitad de la cancha eludien
a a media selección inglesa para anotar un gol que pasaría a la historia como el "Gol del Siglo".',
            'imagen' => 'img/moments/gol_siglo.jpg'
        ],
        [
            'titulo' => 'El gol de Carlos Alberto',
            'mundial' => 'México 1970',
            'descripcion' => 'La culminación de una jugada colectiva extraordinaria de Brasil terminó con un remate imponente de Carlos Alberto en la final, uno de los goles de equipo más celebrados.',
            'imagen' => 'img/moments/carlos_alberto_1970.jpg'
        ],
        [
            'titulo' => 'La remontada de Paolo Rossi',
            'mundial' => 'España 1982',
            'descripcion' => 'Paolo Rossi vivió un torneo espectacular, incluidas actuaciones decisivas contra Brasil que le valieron el Balón de Oro y el título de máximo goleador.',
            'imagen' => 'img/moments/paolo_rossi_1982.jpg'
        ],
        [
            'titulo' => 'El regreso de Ronaldo',
            'mundial' => 'Corea/Japón 2002',
            'descripcion' => 'Ronaldo Nazário protagonizó un regreso memorable al anotar dos goles en la final y convertirse en héroe nacional tras superar problemas físicos en temporadas previas.',
            'imagen' => 'img/moments/ronaldo_2002.jpg'
        ],
        [
            'titulo' => 'Los cabezazos de Zidane',
            'mundial' => 'Francia 1998',
            'descripcion' => 'Zinedine Zidane marcó dos cabezazos en la final contra Brasil, goles que ayudaron a llevar a Francia a su primer título mundial.',
            'imagen' => 'img/moments/zidane_1998.jpg'
        ],
        [
            'titulo' => 'El gol de James Rodríguez',
            'mundial' => 'Brasil 2014',
            'descripcion' => 'Un control perfecto y una volea desde fuera del área que le valió a James Rodríguez el Premio Puskás y un lugar en la galería de grandes goles mundiales.',
            'imagen' => 'img/moments/james_2014.jpg'
        ]
    ],
    'Grandes_Controversias' => [
        [
            'titulo' => 'La Mano de Dios',
            'mundial' => 'México 1986',
            'descripcion' => 'Diego Maradona anotó un gol con la mano ante Inglaterra que el árbitro validó; el suceso provocó debate y sigue siendo uno de los momentos más polémicos.',
            'imagen' => 'img/moments/mano_dios.jpg'
        ],
        [
            'titulo' => 'Arbitraje y decisiones polémicas',
            'mundial' => 'Corea/Japón 2002',
            'descripcion' => 'Varios partidos del torneo estuvieron rodeados de controversia por decisiones arbitrales, en especial los choques de Corea del Sur contra Italia y España.',
            'imagen' => 'img/moments/corea_2002.jpg'
        ],
        [
            'titulo' => 'La Batalla de Santiago',
            'mundial' => 'Chile 1962',
            'descripcion' => 'Un encuentro violento entre Chile e Italia que incluyó expulsiones y enfrentamientos; uno de los partidos más ásperos en la historia de los mundiales.',
            'imagen' => 'img/moments/batalla_santiago.jpg'
        ],
        [
            'titulo' => 'Sospechas en Argentina - Perú (1978)',
            'mundial' => 'Argentina 1978',
            'descripcion' => 'El resultado abultado entre Argentina y Perú (6-0) levantó dudas y conspiraciones que aún generan debate sobre la integridad de algunos encuentros en ese torneo.',
            'imagen' => 'img/moments/argentina_peru_1978.jpg'
        ],
        [
            'titulo' => 'Doping y expulsiones',
            'mundial' => 'EE. UU. 1994',
            'descripcion' => 'El torneo tuvo su cuota de polémicas, incluida la expulsión de Diego Maradona por un control de dopaje que marcó el final de su carrera mundialista.',
            'imagen' => 'img/moments/maradona_1994.jpg'
        ],
        [
            'titulo' => 'El gol no concedido de Lampard',
            'mundial' => 'Sudáfrica 2010',
            'descripcion' => 'El disparo de Frank Lampard que claramente cruzó la línea de gol contra Alemania no fue concedido; el error impulsó la adopción de tecnologías de detección de gol.',
            'imagen' => 'img/moments/lampard_2010.jpg'
        ]
    ],
    'Mascotas_y_Canciones' => [
        [
            'titulo' => 'World Cup Willie',
            'mundial' => 'Inglaterra 1966',
            'descripcion' => 'Willie, el león, fue la primera mascota oficial de un Mundial y marcó el inicio de una tradición que sigue hasta hoy.',
            'imagen' => 'img/moments/willie_1966.jpg'
        ],
        [
            'titulo' => 'Naranjito',
            'mundial' => 'España 1982',
            'descripcion' => 'La simpática naranja fue la mascota que simpatizó con los aficionados y se convirtió en un símbolo popular del Mundial de 1982.',
            'imagen' => 'img/moments/naranjito_1982.jpg'
        ],
        [
            'titulo' => 'Ciao',
            'mundial' => 'Italia 1990',
            'descripcion' => 'La figura estilizada "Ciao" representó al Mundial de Italia 90; su diseño minimalista fue característico de la época.',
            'imagen' => 'img/moments/ciao_1990.jpg'
        ],
        [
            'titulo' => 'Striker',
            'mundial' => 'EE. UU. 1994',
            'descripcion' => 'El perro "Striker" fue la mascota del Mundial de 1994 y acompañó una edición que buscaba consolidar el torneo en Norteamérica.',
            'imagen' => 'img/moments/striker_1994.jpg'
        ],
        [
            'titulo' => 'La Copa de la Vida',
            'mundial' => 'Francia 1998',
            'descripcion' => 'Interpretada por Ricky Martin, la canción se convirtió en un himno global y acompañó la euforia del Mundial de 1998.',
            'imagen' => 'img/moments/copa_vida.jpg'
        ],
        [
            'titulo' => 'Waka Waka',
            'mundial' => 'Sudáfrica 2010',
            'descripcion' => 'Shakira interpretó "Waka Waka", canción que se volvió identitaria del torneo y una de las más recordadas en la historia de los mundiales.',
            'imagen' => 'img/moments/waka_waka.jpg'
        ],
        [
            'titulo' => 'Fuleco',
            'mundial' => 'Brasil 2014',
            'descripcion' => 'El armadillo "Fuleco" fue la mascota del Mundial de 2014; su imagen y la canción oficial ayudaron a dar color y mensaje ambiental al torneo.',
            'imagen' => 'img/moments/fuleco_2014.jpg'
        ],
        [
            'titulo' => 'Zabivaka',
            'mundial' => 'Rusia 2018',
            'descripcion' => 'Zabivaka, el lobo, fue la mascota que acompañó el Mundial de Rusia y ganó popularidad por su diseño simpático y desenfadado.',
            'imagen' => 'img/moments/zabivaka_2018.jpg'
        ],
        [
            'titulo' => 'La\'eeb',
            'mundial' => 'Qatar 2022',
            'descripcion' => 'La mascota La\'eeb simboliza el héroe jugador árabe y fue parte de la identidad visual del primer Mundial celebrado en Oriente Medio.',
            'imagen' => 'img/moments/laeeb_2022.jpg'
        ]
    ]
];

$momentos_a_mostrar = $momentos_historicos[$tema] ?? [];

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($titulo_formateado); ?> - Mundial Twenty Six</title>
    <link rel="icon" href="img/Logo.png">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/maximosgoleadores.css">
    <link rel="stylesheet" href="css/jugadores_leyenda_theme.css">

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
            <span class="vertical-text bebas-neue-regular"><?php echo htmlspecialchars(strtoupper($titulo_formateado)); ?></span>
        </div>
        <div style="width:100%">
            <div class="grid-container" id="legendsGrid">
                <?php if (count($momentos_a_mostrar) > 0): ?>
                    <?php foreach ($momentos_a_mostrar as $momento): ?>
                        <article class="legend-card">
                            <div class="card-media">
                                <img src="<?php echo htmlspecialchars($momento['imagen']); ?>" alt="<?php echo htmlspecialchars($momento['titulo']); ?>" class="card-img">
                                <div class="card-badge">Momento</div>
                            </div>
                            <div class="card-body">
                                <h3 class="player-name"><?php echo htmlspecialchars($momento['titulo']); ?></h3>
                                <p class="player-meta"><?php echo htmlspecialchars($momento['mundial']); ?></p>
                                <p class="short-desc"><?php echo htmlspecialchars($momento['descripcion']); ?></p>
                            </div>
                        </article>
                    <?php endforeach; ?>
                <?php else: ?>
                    <h1 class="text-white text-center p-5">No hay momentos destacados para '<?php echo htmlspecialchars($titulo_formateado); ?>'.</h1>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
</body>
</html>