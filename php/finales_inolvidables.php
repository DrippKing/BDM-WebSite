<?php
require_once __DIR__ . '/db_connect.php';

$titulo_formateado = 'Finales Inolvidables';

// Consultamos la tabla `unforgettable_finals` en lugar de `posts`.
$momentos_a_mostrar = [];
$sql = "SELECT 
            `title` AS titulo,
            `description` AS descripcion,
            `image` AS imagen,
            `world_cup` AS mundial
        FROM `unforgettable_finals` ORDER BY `id` ASC";

$result = $conn->query($sql);
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $momentos_a_mostrar[] = $row;
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($titulo_formateado); ?> - Momentos Históricos</title>
    <link rel="icon" href="img/Logo.png">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/maximosgoleadores.css">
    <link rel="stylesheet" href="css/jugadores_leyenda_theme.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">
</head>
<body class="theme-selecciones">
    <?php 
        $navbar_template = 'navbar-main';
        require __DIR__ . '/../html/templates/navbar.php'; 
    ?>
    <main class="MainContainer">
        <div id="vertical-title">
            <span class="vertical-text bebas-neue-regular">MOMENTOS HISTORICOS</span>
        </div>
        <div class="content-area">
            <section class="grid-header">
                <h2 class="section-title"><?php echo htmlspecialchars($titulo_formateado); ?></h2>
            </section>
            <section class="grid-container" id="legendsGrid">
                <?php if (count($momentos_a_mostrar) > 0): ?>
                    <?php foreach ($momentos_a_mostrar as $momento): ?>
                        <article class="legend-card" 
                            data-team="<?php echo htmlspecialchars($momento['titulo']); ?>" 
                            data-img="<?php echo htmlspecialchars($momento['imagen']); ?>" 
                            data-era="<?php echo htmlspecialchars($momento['mundial']); ?>"
                            data-bio="<?php echo htmlspecialchars($momento['descripcion']); ?>">
                            <div class="card-media">
                                <img src="<?php echo htmlspecialchars($momento['imagen']); ?>" alt="<?php echo htmlspecialchars($momento['titulo']); ?>" class="card-img">
                                <div class="card-badge gradient">Momento</div>
                            </div>
                            <div class="card-body">
                                <h3 class="player-name"><?php echo htmlspecialchars($momento['titulo']); ?></h3>
                                <p class="player-meta"><?php echo htmlspecialchars($momento['mundial']); ?></p>
                                <p class="short-desc"><?php echo substr(htmlspecialchars($momento['descripcion']), 0, 80) . '...'; ?></p>
                            </div>
                        </article>
                    <?php endforeach; ?>
                <?php else: ?>
                    <div class="alert alert-info w-100 text-center">
                        <h4 class="alert-heading">No hay momentos para mostrar</h4>
                        <p>No se encontraron publicaciones para la categoría "<?php echo htmlspecialchars($titulo_formateado); ?>".</p>
                    </div>
                <?php endif; ?>
            </section>
        </div>
    </main>
    <div class="modal fade" id="momentModal" tabindex="-1" aria-labelledby="momentModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-0">
                <div class="modal-header border-0">
                    <h5 class="modal-title" id="momentModalLabel">Momento Histórico</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-5 text-center"><img id="momentModalImg" src="" alt="Imagen del momento" class="img-fluid rounded mb-3"></div>
                        <div class="col-md-7">
                            <h4 id="momentModalName" class="bebas-neue-regular" style="font-size: 2rem;"></h4>
                            <p id="momentModalMeta" class="text-muted mb-3"></p>
                            <h5>Descripción</h5>
                            <p id="momentModalBio"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.legend-card');
            const modal = new bootstrap.Modal(document.getElementById('momentModal'));
            cards.forEach(card => {
                card.addEventListener('click', () => {
                    document.getElementById('momentModalImg').src = card.dataset.img || '';
                    document.getElementById('momentModalName').textContent = card.dataset.team || 'Sin título';
                    document.getElementById('momentModalMeta').textContent = card.dataset.era || 'Sin mundial';
                    document.getElementById('momentModalBio').textContent = card.dataset.bio || 'Sin descripción.';
                    modal.show();
                });
            });
        });
    </script>
</body>
</html>