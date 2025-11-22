<?php
global $conn;
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// 1. Proteger la página: solo para administradores (role_id = 1)
if (!isset($_SESSION['role_id']) || $_SESSION['role_id'] != 1) {
    header("Location: index.php?page=home");
    exit;
}

$message = '';

// 2. Procesar acciones de aprobación o rechazo
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $post_id = $_POST['post_id'] ?? null; // Para aprobar/rechazar
    if ($post_id) {
        if (isset($_POST['approve'])) {
            // Aprobar: cambiar Visibility_State a 1
            $stmt = $conn->prepare("UPDATE posts SET Visibility_State = 1 WHERE ID_Post_PK = ?");
            $stmt->bind_param("i", $post_id);
            if ($stmt->execute()) {
                $message = '<div class="alert alert-success">Publicación aprobada con éxito.</div>';
            } else {
                $message = '<div class="alert alert-danger">Error al aprobar la publicación.</div>';
            }
            $stmt->close();
        } elseif (isset($_POST['reject'])) {
            // Rechazar: eliminar la publicación y todas sus dependencias
            // 1. Eliminar de la tabla de unión categories-posts
            $stmt_cat = $conn->prepare("DELETE FROM `categories-posts` WHERE ID_Post_FK = ?");
            $stmt_cat->bind_param("i", $post_id);
            $stmt_cat->execute();
            $stmt_cat->close();

            // 2. Eliminar comentarios asociados al post
            $stmt_com = $conn->prepare("DELETE FROM comments WHERE ID_Post_FK = ?");
            $stmt_com->bind_param("i", $post_id);
            $stmt_com->execute();
            $stmt_com->close();

            // 3. Eliminar likes asociados al post
            $stmt_like = $conn->prepare("DELETE FROM likes WHERE ID_Post_FK = ?");
            $stmt_like->bind_param("i", $post_id);
            $stmt_like->execute();
            $stmt_like->close();

            // 4. Finalmente, eliminar de la tabla posts
            $stmt = $conn->prepare("DELETE FROM posts WHERE ID_Post_PK = ?");
            $stmt->bind_param("i", $post_id);
            if ($stmt->execute()) {
                $message = '<div class="alert alert-warning">Publicación rechazada y eliminada.</div>';
            } else {
                $message = '<div class="alert alert-danger">Error al rechazar la publicación.</div>';
            }
            $stmt->close();
        }
    } elseif (isset($_POST['create_mundial'])) { // ACCIÓN: Crear Mundial
        $mundial_year = $_POST['mundial_year'] ?? null;
        $mundial_name = $_POST['mundial_name'] ?? null;
        $mundial_winner = $_POST['mundial_winner'] ?? null;
        $image = $_FILES['mundial_image'] ?? null;

        // Validación de campos
        if (empty($mundial_year) || empty($mundial_name) || empty($mundial_winner) || !isset($image) || $image['error'] !== UPLOAD_ERR_OK) {
            $message = '<div class="alert alert-danger">Error: Todos los campos son obligatorios y la imagen debe subirse correctamente.</div>';
        } elseif ($mundial_year < 2026 || $mundial_year > 2066 || ($mundial_year - 2026) % 4 !== 0) {
            // Validación específica para el año del mundial
            $message = '<div class="alert alert-danger">Error: El año del mundial no es válido. Debe ser entre 2026 y 2066, en intervalos de 4 años.</div>';
        } else {
            // 1. Lógica para el Hashtag
            $hashtag_name = strtolower(str_replace(' ', '', trim($mundial_name)));
            $hashtag_id = null;

            $stmt_check = $conn->prepare("SELECT ID_Hashtag_PK FROM hashtags WHERE Name = ?");
            $stmt_check->bind_param("s", $hashtag_name);
            $stmt_check->execute();
            $result = $stmt_check->get_result();
            if ($row = $result->fetch_assoc()) {
                $hashtag_id = $row['ID_Hashtag_PK'];
            }
            $stmt_check->close();

            if ($hashtag_id === null) {
                $stmt_create_hashtag = $conn->prepare("INSERT INTO hashtags (Name) VALUES (?)");
                $stmt_create_hashtag->bind_param("s", $hashtag_name);
                if ($stmt_create_hashtag->execute()) {
                    $hashtag_id = $stmt_create_hashtag->insert_id;
                } else {
                    $message = '<div class="alert alert-danger">Error al crear el hashtag asociado.</div>';
                }
                $stmt_create_hashtag->close();
            }

            // 2. Si tenemos un hashtag, procedemos con la subida de imagen y la inserción
            if ($hashtag_id !== null) {
                $upload_dir = __DIR__ . '/../assets/fifa world cup posters/';
                if (!is_dir($upload_dir)) {
                    mkdir($upload_dir, 0777, true);
                }
                
                $image_extension = pathinfo($image['name'], PATHINFO_EXTENSION);
                $image_filename = uniqid('mundial_', true) . '.' . $image_extension;
                $image_path = $upload_dir . $image_filename;
                $db_image_path = '' . $image_filename; // Ruta relativa para la BD

                if (move_uploaded_file($image['tmp_name'], $image_path)) {
                    // 3. Insertar en la tabla worldcup_editions
                    $stmt = $conn->prepare("INSERT INTO worldcup_editions (ID_WorldCup_Year_PK, Name, ID_Hashtag_FK, Official_Artwork_Multimedia, Final_Winner) VALUES (?, ?, ?, ?, ?)");
                    $stmt->bind_param("isiss", $mundial_year, $mundial_name, $hashtag_id, $db_image_path, $mundial_winner);
                    
                    if ($stmt->execute()) {
                        $message = '<div class="alert alert-success">Mundial creado con éxito.</div>';
                    } else {
                        $message = '<div class="alert alert-danger">Error al guardar el mundial en la base de datos. Es posible que el año ya exista.</div>';
                    }
                    $stmt->close();
                } else {
                    $message = '<div class="alert alert-danger">Error al subir la imagen del mundial.</div>';
                }
            }
        }
    } elseif (isset($_POST['create_category'])) { // ACCIÓN: Crear Categoría
        $category_name = $_POST['category_name'] ?? null;

        if (empty($category_name)) {
            $message = '<div class="alert alert-danger">Error: El nombre de la categoría no puede estar vacío.</div>';
        } else {
            // 1. Lógica para el Hashtag (reutilizando el patrón de mundiales)
            $hashtag_name = strtolower(str_replace(' ', '', trim($category_name)));
            $hashtag_id = null;

            $stmt_check = $conn->prepare("SELECT ID_Hashtag_PK FROM hashtags WHERE Name = ?");
            $stmt_check->bind_param("s", $hashtag_name);
            $stmt_check->execute();
            $result = $stmt_check->get_result();
            if ($row = $result->fetch_assoc()) {
                $hashtag_id = $row['ID_Hashtag_PK'];
            }
            $stmt_check->close();

            if ($hashtag_id === null) {
                $stmt_create_hashtag = $conn->prepare("INSERT INTO hashtags (Name) VALUES (?)");
                $stmt_create_hashtag->bind_param("s", $hashtag_name);
                if ($stmt_create_hashtag->execute()) {
                    $hashtag_id = $stmt_create_hashtag->insert_id;
                } else {
                    $message = '<div class="alert alert-danger">Error al crear el hashtag asociado.</div>';
                }
                $stmt_create_hashtag->close();
            }

            // 2. Si tenemos un hashtag, creamos la categoría
            if ($hashtag_id !== null) {
                $description = ''; // Valor por defecto para la descripción
                $is_visible = 1;   // Valor por defecto, la categoría será visible
                
                $stmt = $conn->prepare("INSERT INTO categories (Name, ID_Hashtag_FK, Description, Is_Visible) VALUES (?, ?, ?, ?)");
                $stmt->bind_param("sisi", $category_name, $hashtag_id, $description, $is_visible);

                if ($stmt->execute()) {
                    $message = '<div class="alert alert-success">Categoría creada con éxito.</div>';
                } else {
                    $message = '<div class="alert alert-danger">Error al crear la categoría. Es posible que ya exista.</div>';
                }
                $stmt->close();
            }
        }
    }
}

// 3. Obtener todas las publicaciones pendientes (Visibility_State = 0)
$pending_posts = [];
$sql = "SELECT p.ID_Post_PK, p.Content_Title, p.Content_Body, p.Content_Multimedia, p.Upload_Date, u.Nametag 
        FROM posts p 
        JOIN users u ON p.ID_User_FK = u.ID_User_PK 
        WHERE p.Visibility_State = 0 
        ORDER BY p.Upload_Date ASC";
$result = $conn->query($sql);
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $pending_posts[] = $row;
    }
}

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aprobar Publicaciones - Admin</title>
    <link rel="icon" href="img/Logo.png">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/details.css"> <!-- Reutilizamos estilos -->
</head>
<body class="custom-perfil-bg">
    <?php 
        $navbar_template = 'navbar-main';
        require __DIR__ . '/../html/templates/navbar.php'; 
    ?>

    <div class="container mt-4">
        <h1 class="text-white bebas-neue-regular mb-4" style="font-size: 3rem;">Publicaciones Pendientes</h1>
        <?php echo $message; ?>

        <!-- Formularios de Creación -->
        <div class="row mb-5">
            <!-- Crear Categoría -->
            <div class="col-md-6">
                <div class="card text-white bg-transparent-dark mb-3 mb-md-0">
                    <div class="card-body">
                        <h5 class="card-title bebas-neue-regular">Crear Nueva Categoría</h5>
                        <form method="POST" action="">
                            <div class="mb-3">
                                <label for="category_name" class="form-label">Nombre de la Categoría</label>
                                <input type="text" class="form-control" id="category_name" name="category_name" required>
                            </div>
                            <button type="submit" name="create_category" class="btn mt6 w-100">Crear Categoría</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Crear Mundial -->
            <div class="col-md-6">
                <div class="card text-white h-100 bg-transparent-dark">
                    <div class="card-body">
                        <h5 class="card-title bebas-neue-regular">Crear Nuevo Mundial</h5>
                        <form method="POST" action="" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-sm-8 mb-3"><label for="mundial_name" class="form-label">Nombre</label><input type="text" class="form-control" id="mundial_name" name="mundial_name" required></div>
                                <div class="col-sm-4 mb-3"><label for="mundial_year" class="form-label">Año</label><input type="number" class="form-control" id="mundial_year" name="mundial_year" min="2026" max="2066" step="4" required></div>
                            </div>
                            <div class="mb-3"><label for="mundial_winner" class="form-label">Ganador</label><input type="text" class="form-control" id="mundial_winner" name="mundial_winner" required></div>
                            <div class="mb-3"><label for="mundial_image" class="form-label">Arte Oficial</label><input class="form-control" type="file" id="mundial_image" name="mundial_image" accept="image/*" required></div>
                            <button type="submit" name="create_mundial" class="btn mt6 w-100">Crear Mundial</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <?php if (count($pending_posts) > 0): ?>
            <div class="posts-feed">
                <?php foreach ($pending_posts as $post): ?>
                    <div class="post-card">
                        <div class="post-header">
                            <div class="post-author-info">
                                <span class="post-author-name"><?php echo htmlspecialchars($post['Nametag']); ?></span>
                                <span class="post-date">Enviado el <?php echo date('d M, Y H:i', strtotime($post['Upload_Date'])); ?></span>
                            </div>
                        </div>
                        <div class="post-body">
                            <div class="post-content">
                                <p class="post-title"><?php echo htmlspecialchars($post['Content_Title']); ?></p>
                                <?php if (!empty($post['Content_Multimedia'])): ?>
                                    <?php
                                        $media_path = 'assets/users/posts_media/' . htmlspecialchars($post['Content_Multimedia']);
                                        $extension = strtolower(pathinfo($media_path, PATHINFO_EXTENSION));
                                        $image_ext = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
                                        $video_ext = ['mp4', 'mov', 'avi', 'webm'];
                                    ?>
                                    <div class="post-media-container mb-3">
                                        <?php if (in_array($extension, $image_ext)): ?>
                                            <img src="<?php echo $media_path; ?>" class="img-fluid rounded" alt="Contenido multimedia de la publicación">
                                        <?php elseif (in_array($extension, $video_ext)): ?>
                                            <video src="<?php echo $media_path; ?>" class="img-fluid rounded" controls></video>
                                        <?php endif; ?>
                                    </div>
                                <?php endif; ?>
                                <p><?php echo nl2br(htmlspecialchars($post['Content_Body'])); ?></p>
                            </div>
                        </div>
                        <div class="post-footer justify-content-end">
                            <form method="POST" action="" class="d-inline-flex gap-2">
                                <input type="hidden" name="post_id" value="<?php echo $post['ID_Post_PK']; ?>">
                                <button type="submit" name="approve" class="btn btn-success btn-sm">Aprobar</button>
                                <button type="submit" name="reject" class="btn btn-danger btn-sm">Rechazar</button>
                            </form>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <div class="alert alert-secondary text-center">No hay publicaciones pendientes de revisión.</div>
        <?php endif; ?>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
</body>
</html>