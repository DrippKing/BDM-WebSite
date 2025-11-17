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
    $post_id = $_POST['post_id'] ?? null;
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
            // Rechazar: eliminar la publicación
            // Primero, eliminar de la tabla de unión categories-posts
            $stmt_cat = $conn->prepare("DELETE FROM `categories-posts` WHERE ID_Post_FK = ?");
            $stmt_cat->bind_param("i", $post_id);
            $stmt_cat->execute();
            $stmt_cat->close();

            // Luego, eliminar de la tabla posts
            $stmt = $conn->prepare("DELETE FROM posts WHERE ID_Post_PK = ?");
            $stmt->bind_param("i", $post_id);
            if ($stmt->execute()) {
                $message = '<div class="alert alert-warning">Publicación rechazada y eliminada.</div>';
            } else {
                $message = '<div class="alert alert-danger">Error al rechazar la publicación.</div>';
            }
            $stmt->close();
        }
    }
}

// 3. Obtener todas las publicaciones pendientes (Visibility_State = 0)
$pending_posts = [];
$sql = "SELECT p.ID_Post_PK, p.Content_Title, p.Content_Body, p.Upload_Date, u.Nametag 
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

        <div class="posts-feed">
            <?php if (count($pending_posts) > 0): ?>
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
            <?php else: ?>
                <div class="alert alert-secondary text-center">No hay publicaciones pendientes de revisión.</div>
            <?php endif; ?>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
</body>
</html>
