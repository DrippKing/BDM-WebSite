<?php
global $conn;

// 1. Obtener el tema de la URL, con un valor por defecto.
$tema_key = $_GET['tema'] ?? 'Jugadas'; // Usamos 'Jugadas' como tema por defecto si no se especifica.
$titulo_formateado = str_replace('_', ' ', $tema_key);

// 2. Preparar la consulta para obtener los posts de la categoría correspondiente.
$momentos_a_mostrar = [];
$sql = "SELECT 
            p.Content_Title AS titulo,
            p.Content_Body AS descripcion,
            p.Content_Multimedia AS imagen,
            we.Name AS mundial
        FROM post p
        JOIN `categories-posts` cp ON p.ID_Post_PK = cp.ID_Post_FK
        JOIN categories c ON cp.ID_Category_FK = c.ID_Category_PK
        JOIN worldcup_editions we ON p.ID_WorldCup_Year_FK = we.ID_WorldCup_Year_PK
        WHERE c.Name = ? AND p.Visibility_State = 1
        ORDER BY we.ID_WorldCup_Year_PK ASC, p.Upload_Date DESC";

$stmt = $conn->prepare($sql);
if ($stmt) {
    $stmt->bind_param("s", $tema_key);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $momentos_a_mostrar[] = $row;
        }
    }
    $stmt->close();
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
                            data-img="assets/posts_media/<?php echo htmlspecialchars($momento['imagen']); ?>" 
                            data-era="<?php echo htmlspecialchars($momento['mundial']); ?>"
                            data-bio="<?php echo htmlspecialchars($momento['descripcion']); ?>">
                            <div class="card-media">
                                <img src="assets/posts_media/<?php echo htmlspecialchars($momento['imagen']); ?>" alt="<?php echo htmlspecialchars($momento['titulo']); ?>" class="card-img">
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
                        <hr>
                        <p class="mb-0">Intenta seleccionar otra categoría o crea una nueva publicación.</p>
                    </div>
                <?php endif; ?>
            </section>
        </div>
    </main>

    <!-- Aquí podrías agregar un modal para ver los detalles, similar al de selecciones_historicas.php si lo deseas -->

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
    <script>
        // Si decides añadir un modal, puedes reutilizar el código JS de `selecciones_historicas.php`
        // para abrirlo y rellenarlo con los datos de los atributos `data-*` de cada tarjeta.
    </script>
</body>
</html>