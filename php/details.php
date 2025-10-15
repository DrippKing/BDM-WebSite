<?php
// Hacemos la variable $conn global para poder usarla dentro de este archivo.
global $conn;

$edicion_nombre = 'Mundial no encontrado';
$world_cup_data = null;
$posts = [];
$categories = [];

// 1. Obtener la edición de la URL
if (isset($_GET['edicion'])) {
    $edicion_param = $_GET['edicion'];
    // Formateamos el nombre para buscar en la BD (ej. QATAR_2022 -> QATAR 2022, KOREA-JAPAN_2002 -> KOREA/JAPAN 2002)
    $edicion_busqueda = str_replace(['_', '-'], [' ', '/'], $edicion_param);

    // 2. Preparar y ejecutar la consulta para obtener los datos del mundial
    // Usaremos Name para buscar
    $stmt = $conn->prepare("SELECT * FROM worldcup_editions WHERE Name = ?");

    if ($stmt) {
        $stmt->bind_param("s", $edicion_busqueda);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $world_cup_data = $result->fetch_assoc();
            $edicion_nombre = $world_cup_data['Name'];

            // Una vez que tenemos los datos del mundial, buscamos sus posts.
            $worldcup_id = $world_cup_data['ID_WorldCup_Year_PK'];
            $stmt_posts = $conn->prepare(
                "SELECT p.Content_Title, p.Content_Body, p.Upload_Date, u.Nametag, u.Profile_Picture
                 FROM posts p
                 JOIN users u ON p.ID_User_FK = u.ID_User_PK
                 WHERE p.ID_WorldCup_Year_FK = ? AND p.Visibility_State = 1
                 ORDER BY p.Upload_Date DESC"
            );
            if ($stmt_posts) {
                $stmt_posts->bind_param("i", $worldcup_id);
                $stmt_posts->execute();
                $result_posts = $stmt_posts->get_result();
                while ($row = $result_posts->fetch_assoc()) {
                    $posts[] = $row;
                }
                $stmt_posts->close();
            }
        }
    }
    $stmt->close();
}

// 3. Obtener todas las categorías de la base de datos
$query_categories = "SELECT Name, Description FROM categories WHERE Is_Visible = 1"; // Esta es la consulta correcta
$result_categories = $conn->query($query_categories);
if ($result_categories && $result_categories->num_rows > 0) {
    while ($row = $result_categories->fetch_assoc()) {
        $categories[] = $row;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mundial Twenty Six - News</title>
    <link rel="icon" href="img/Logo.png">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/details.css"> <!-- ¡Esta es la línea que faltaba! -->
    
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
        <div id="BN-Container">
            <div class="SC1">
                <h1>Categorias</h1>
                
                <?php if (count($categories) > 0): ?>
                    <?php foreach ($categories as $category): ?>
                        <div class="SC2">
                            <div class="SC3">
                                <h2><?php echo htmlspecialchars($category['Name']); ?></h2>
                                <div class="SC4">
                                    <p><?php echo htmlspecialchars($category['Description']); ?></p>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <p class="text-white text-center">No hay categorías disponibles.</p>
                <?php endif; ?>
            </div>
        </div>
        <div id="Feed-Public">
            <div class="FP-MenuTitle with-button">
                <h1 id="T1">[MUNDIAL SELECCIONADO]</h1>
                <?php if (isset($_SESSION['username'])): ?>
                    <button class="btn-add-post" onclick="window.location.href='index.php?page=makepost&worldcup_id=<?php echo $world_cup_data['ID_WorldCup_Year_PK'] ?? ''; ?>&edicion_name=<?php echo urlencode($edicion_param); ?>'" title="Crear nueva publicación">+</button>
                <?php endif; ?>
            </div>
            <div class="details-container">
                <?php if ($world_cup_data): ?>
                    <div class="posts-feed">
                        <?php if (count($posts) > 0): ?>
                            <?php foreach ($posts as $post): ?>
                                <div class="post-card">
                                    <div class="post-header">
                                        <?php
                                            // Lógica para la foto de perfil del autor del post
                                            $post_author_pic_file = $post['Profile_Picture'] ?? 'default.jpg';
                                            $post_author_pic_path = ($post_author_pic_file === 'default.jpg')
                                                ? 'img/profile-icon-default.jpg'
                                                : 'assets/users/profile_pictures/' . $post_author_pic_file;
                                        ?>
                                        <img src="<?php echo htmlspecialchars($post_author_pic_path); ?>" alt="Foto de perfil de <?php echo htmlspecialchars($post['Nametag']); ?>" class="post-author-avatar">
                                        <div class="post-author-info">
                                            <span class="post-author-name"><?php echo htmlspecialchars($post['Nametag']); ?></span>
                                            <span class="post-date"><?php echo date('d M, Y \a \l\a\s H:i', strtotime($post['Upload_Date'])); ?></span>
                                        </div>
                                    </div>
                                    <div class="post-body">
                                        <!-- Unificamos título y cuerpo para un look más limpio -->
                                        <div class="post-content">
                                            <p class="post-title"><?php echo htmlspecialchars($post['Content_Title']); ?></p>
                                            <p><?php echo nl2br(htmlspecialchars($post['Content_Body'])); ?></p>
                                        </div>
                                    </div>
                                    <div class="post-footer">
                                        <button class="footer-btn">❤️ Me gusta</button>
                                        <button class="footer-btn">💬 Comentar</button>
                                        <button class="footer-btn">🔗 Compartir</button>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <p class="text-white text-center p-4 fs-4">Aún no hay publicaciones para este mundial. ¡Sé el primero en <a href="index.php?page=makepost&worldcup_id=<?php echo $world_cup_data['ID_WorldCup_Year_PK'] ?? ''; ?>&edicion_name=<?php echo urlencode($edicion_param); ?>">crear una</a>!</p>
                        <?php endif; ?>
                    </div>
                <?php else: ?>
                    <p class="text-white p-4 fs-4">No se encontró información para la edición solicitada. Por favor, selecciona un mundial de la página principal.</p>
                <?php endif; ?>
            </div>

            <h1 id="T2" class="FP-MenuTitle">¡Vive La Experiencia Como Si Estuvieras En El Campo!</h1>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
    <script>
        window.addEventListener('DOMContentLoaded', () => {
            // Script para la barra lateral (z-index)
            const cards = document.querySelectorAll('#BN-Container .SC1 .SC2');
            const totalCards = cards.length;
            cards.forEach((card, index) => {
                card.style.zIndex = totalCards - index;
            });

            // Script para leer el título de la URL
            const params = new URLSearchParams(window.location.search);
            const edicionDesdeUrl = params.get('edicion');
            if (edicionDesdeUrl) {
                const tituloFormateado = edicionDesdeUrl.replace(/_/g, ' ');
                const elementoTitulo = document.getElementById('T1');
                if (elementoTitulo) {
                    elementoTitulo.textContent = tituloFormateado;
                }
            }
        });
    </script>
</body>
</html>
