<?php
global $conn;
$edicion_nombre = 'Mundial no encontrado';
$world_cup_data = null;
$posts = [];
$categories = [];
$category_filter = isset($_GET['category']) ? trim($_GET['category']) : null;
$edicion_param = $_GET['edicion'] ?? '';
$query_categories = "SELECT Name, Description FROM categories WHERE Is_Visible = 1";
$result_categories = $conn->query($query_categories);
if ($result_categories && $result_categories->num_rows > 0) {
    while ($row = $result_categories->fetch_assoc()) {
        $categories[] = $row;
    }
}
if (!empty($edicion_param)) {
    $edicion_busqueda = str_replace(['_', '-'], [' ', '/'], $edicion_param);
    $stmt = $conn->prepare("SELECT * FROM worldcup_editions WHERE Name = ?");
    if ($stmt) {
        $stmt->bind_param("s", $edicion_busqueda);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $world_cup_data = $result->fetch_assoc();
            $edicion_nombre = $world_cup_data['Name'];
            $worldcup_id = $world_cup_data['ID_WorldCup_Year_PK'];
            $sql_posts = "SELECT p.ID_Post_PK, p.Content_Title, p.Content_Body, p.Upload_Date, u.Nametag, u.Profile_Picture
                 FROM posts p
                 JOIN users u ON p.ID_User_FK = u.ID_User_PK";
            
            $where_clauses = ["p.ID_WorldCup_Year_FK = ?", "p.Visibility_State = 1"];
            $params = [];
            $params[] = $worldcup_id;
            $types = "i";
            if ($category_filter) {
                $sql_posts .= " JOIN `categories-posts` cp ON p.ID_Post_PK = cp.ID_Post_FK
                                JOIN `categories` c ON cp.ID_Category_FK = c.ID_Category_PK";
                $where_clauses[] = "c.Name = ?";
                $params[] = $category_filter;
                $types .= "s";
            }
            $sql_posts .= " WHERE " . implode(" AND ", $where_clauses) . " ORDER BY p.Upload_Date DESC";
            $stmt_posts = $conn->prepare($sql_posts);
            if ($stmt_posts) {
                $stmt_posts->bind_param($types, ...$params);
                
                $stmt_posts->execute();
                $result_posts = $stmt_posts->get_result();
                while ($row = $result_posts->fetch_assoc()) {
                    $posts[] = $row;
                }
                $stmt_posts->close();
            }
        }
        $stmt->close();
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
    <link rel="stylesheet" href="css/details.css"> 
    
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body>
    <?php 
        $navbar_template = 'navbar-main';
        require __DIR__ . '/../html/templates/navbar.php'; 
    ?>

    <div class="MainContainer">
        <div id="BN-Container">
            <div class="SC1">
                <h1>Categorias</h1>
                
                <?php if (count($categories) > 0): ?>
                    <?php foreach ($categories as $category): ?>
                        <?php
                            $category_name = htmlspecialchars($category['Name']);
                            $is_active = ($category_filter === $category['Name']);
                            $filter_url = $is_active 
                                ? "index.php?page=details&edicion=" . urlencode($edicion_param)
                                : "index.php?page=details&edicion=" . urlencode($edicion_param) . "&category=" . urlencode($category['Name']);
                        ?>
                        <div class="SC2" data-url="<?php echo $filter_url; ?>" style="cursor: pointer;">
                                <div class="SC3">
                                    <h2><?php echo $category_name; ?></h2>
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
                                            $post_author_pic_file = $post['Profile_Picture'] ?? 'default.jpg';
                                            $post_author_pic_path = ($post_author_pic_file === 'default.jpg')
                                                ? 'img/profile-icon-default.jpg'
                                                : 'assets/users/profile_pictures/' . $post_author_pic_file;
                                        ?>
                                        <img src="<?php echo htmlspecialchars($post_author_pic_path); ?>" alt="Foto de perfil de <?php echo htmlspecialchars($post['Nametag']); ?>" class="post-author-avatar">
                                        <div class="post-author-info">
                                            <span class="post-author-name"><?php echo htmlspecialchars($post['Nametag']); ?></span>
                                            <?php
                                                // `Upload_Date` is stored in UTC (Y-m-d H:i:s). Export as ISO Z for client parsing.
                                                $utc_raw = $post['Upload_Date'];
                                                $utc_iso = htmlspecialchars(str_replace(' ', 'T', $utc_raw) . 'Z');
                                                // Fallback readable string (UTC) shown until JS converts to local time.
                                                $readable_utc = '';
                                                try {
                                                    $dt = new DateTime($utc_raw, new DateTimeZone('UTC'));
                                                    $readable_utc = $dt->format('d M, Y \a \l\a\s H:i');
                                                } catch (Exception $e) {
                                                    $readable_utc = htmlspecialchars($utc_raw);
                                                }
                                            ?>
                                            <span class="post-date" data-upload-utc="<?php echo $utc_iso; ?>"><?php echo $readable_utc; ?></span>
                                        </div>
                                    </div>
                                    <div class="post-body">
                                        
                                        <div class="post-content">
                                            <p class="post-title"><?php echo htmlspecialchars($post['Content_Title']); ?></p>
                                            <p><?php echo nl2br(htmlspecialchars($post['Content_Body'])); ?></p>
                                        </div>
                                    </div>
                                    <div class="post-footer">
                                        <button class="footer-btn like-btn" data-post-id="<?php echo $post['ID_Post_PK']; ?>">♡ Me gusta</button>
                                        <button class="footer-btn comment-btn" data-post-id="<?php echo $post['ID_Post_PK']; ?>">💬 Comentar</button>
                                    </div>
                                    <!-- Sección de comentarios (inicialmente oculta) -->
                                    <div class="comments-section" id="comments-<?php echo $post['ID_Post_PK']; ?>" style="display: none;">
                                        <hr>
                                        <div class="p-3 comment-area-container">
                                            <!-- Aquí se cargarán los comentarios existentes -->
                                            <div class="existing-comments mb-3">
                                                <!-- Los comentarios existentes se cargarán aquí dinámicamente -->
                                            </div>
                                            <textarea class="form-control comment-input" rows="2" placeholder="Escribe un comentario..."></textarea>
                                            <button class="btn btn-primary btn-sm mt-2 publish-comment-btn" data-post-id="<?php echo $post['ID_Post_PK']; ?>">Publicar</button>
                                        </div>
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
            
            const cards = document.querySelectorAll('#BN-Container .SC1 .SC2');
            const totalCards = cards.length;
            cards.forEach((card, index) => {
                card.style.zIndex = totalCards - index;
            });

            
            const params = new URLSearchParams(window.location.search);
            const edicionDesdeUrl = params.get('edicion');
            if (edicionDesdeUrl) {
                const tituloFormateado = edicionDesdeUrl.replace(/_/g, ' ');
                const elementoTitulo = document.getElementById('T1');
                if (elementoTitulo) {
                    elementoTitulo.textContent = tituloFormateado;
                }
            }

            
            const categoryCards = document.querySelectorAll('#BN-Container .SC2');
            categoryCards.forEach(card => {
                card.addEventListener('click', () => {
                    window.location.href = card.dataset.url;
                });
            });

            // Nota: el manejo del botón "Me gusta" se realiza desde `js/main.js` (manejo delegado)
        });
    </script>
</body>
</html>
