<?php
// Si el usuario no ha iniciado sesión, lo redirigimos a la página de login.
if (!isset($_SESSION['user_id'])) {
    header('Location: index.php?page=login');
    exit;
}

// --- Lógica para obtener datos del usuario ---
global $conn;
$user_id = $_SESSION['user_id'];
$username = $_SESSION['username'] ?? 'Usuario';
$profile_pic_file = $_SESSION['profile_picture'] ?? 'default.jpg';

$profile_pic_path = ($profile_pic_file === 'default.jpg')
    ? 'img/profile-icon-default.jpg'
    : 'assets/users/profile_pictures/' . $profile_pic_file;

// Contar publicaciones del usuario desde la BD.
$stmt_posts = $conn->prepare("SELECT COUNT(ID_Post_PK) as post_count FROM posts WHERE ID_User_FK = ?");
$stmt_posts->bind_param("i", $user_id);
$stmt_posts->execute();
$post_count = $stmt_posts->get_result()->fetch_assoc()['post_count'] ?? 0;
$stmt_posts->close();

// TODO: Implementar lógica para seguidores y seguidos cuando las tablas existan.
$followers_count = 0;
$following_count = 0;
?>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Perfil de <?php echo htmlspecialchars($username); ?> - Mundial Twenty Six</title>
  <link rel="icon" href="img/Logo.png">

  <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
  <link rel="stylesheet" href="css/perfil.css">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="css/common.css">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>

<body class="custom-perfil-bg">
  <?php 
      // Incluimos la barra de navegación principal.
      $navbar_template = 'navbar-main';
      require __DIR__ . '/../html/templates/navbar.php'; 
  ?>
  <div class="container d-flex justify-content-center align-items-center" style="min-height: 90vh;">
    <div class="card p-4 custom-perfil-card">
      <div class="row align-items-center mb-4">
        <div class="col-md-8 col-12 mb-3 mb-md-0">
          <h2 class="bebas-neue-regular custom-perfil-username"><?php echo htmlspecialchars($username); ?></h2>
          <div class="perfil-stats d-flex gap-3 mb-2">
            <div><strong><?php echo $post_count; ?></strong> publicaciones</div>
            <div><strong><?php echo $followers_count; ?></strong> seguidores</div>
            <div><strong><?php echo $following_count; ?></strong> seguidos</div>
          </div>

          <button class="btn btn-outline-light mt-2 custom-perfil-btn">Modificar Perfil</button>
        </div>
        <div class="col-md-4 col-12 d-flex justify-content-center">
          <img src="<?php echo htmlspecialchars($profile_pic_path); ?>" alt="Avatar de <?php echo htmlspecialchars($username); ?>" class="custom-perfil-avatar">
        </div>
      </div>
      <hr class="custom-perfil-hr">
      <a href="index.php?page=mis_publicaciones" class="btn btn-primary custom-perfil-btn-ver">Ver mis publicaciones</a>
    </div>
  </div>

  <script src="js/bootstrap/bootstrap.bundle.js"></script>
  <script src="js/main.js"></script>
</body>

</html>