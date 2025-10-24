<?php
global $conn;

// 1. Proteger la página: si no hay sesión, redirigir al login.
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php?page=login");
    exit;
}

// 2. Obtener las publicaciones del usuario logueado
$user_id = $_SESSION['user_id'];
$username = $_SESSION['username'];
$posts = [];

$sql = "SELECT 
            p.ID_Post_PK, 
            p.Content_Title, 
            p.Content_Body, 
            p.Upload_Date,
            we.Name as WorldCup_Name,
            we.ID_WorldCup_Year_PK as WorldCup_ID
        FROM posts p
        JOIN worldcup_editions we ON p.ID_WorldCup_Year_FK = we.ID_WorldCup_Year_PK
        WHERE p.ID_User_FK = ? AND p.Visibility_State = 1
        ORDER BY p.Upload_Date DESC";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result) {
    while ($row = $result->fetch_assoc()) {
        $posts[] = $row;
    }
}
$stmt->close();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Publicaciones - Mundial Twenty Six</title>
    <link rel="icon" href="img/Logo.png">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/details.css"> <!-- Reutilizamos estilos de details -->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body class="custom-perfil-bg">
    <?php 
        $navbar_template = 'navbar-main';
        require __DIR__ . '/../html/templates/navbar.php'; 
    ?>

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="text-white bebas-neue-regular" style="font-size: 3rem;">Mis Publicaciones</h1>
            <a href="index.php?page=perfil" class="btn btn-outline-light">Volver a mi Perfil</a>
        </div>

        <div class="posts-feed">
            <?php if (count($posts) > 0): ?>
                <?php foreach ($posts as $post): ?>
                    <div class="post-card">
                        <div class="post-header">
                            <div class="post-author-info">
                                <span class="post-author-name"><?php echo htmlspecialchars($post['Content_Title']); ?></span>
                                <span class="post-date">Publicado el <?php echo date('d M, Y', strtotime($post['Upload_Date'])); ?> en <strong><?php echo htmlspecialchars($post['WorldCup_Name']); ?></strong></span>
                            </div>
                        </div>
                        <div class="post-body">
                            <div class="post-content">
                                <p><?php echo nl2br(htmlspecialchars($post['Content_Body'])); ?></p>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p class="text-white text-center p-5 fs-4">Aún no has creado ninguna publicación. ¡Anímate a compartir tus ideas!</p>
            <?php endif; ?>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
</body>
</html>