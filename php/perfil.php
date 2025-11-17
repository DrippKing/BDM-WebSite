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

// Mensajes para el usuario
$success_message = '';
$error_message = '';

// Manejo del formulario de modificación de perfil (más robusto)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['profile_action']) && $_POST['profile_action'] === 'update') {
  $new_username = trim($_POST['new_username'] ?? '');
  $new_password = $_POST['new_password'] ?? '';
  $confirm_password = $_POST['confirm_password'] ?? '';

  if ($new_password !== '' && $new_password !== $confirm_password) {
    $error_message = 'Las contraseñas no coinciden.';
  } elseif ($new_username === '' && $new_password === '' && (!isset($_FILES['profile_image']) || $_FILES['profile_image']['error'] === UPLOAD_ERR_NO_FILE)) {
    // No se proporcionó ningún cambio (ni nombre, ni contraseña, ni imagen): no mostrar error, no hacer nada.
    $success_message = 'No se realizaron cambios.';
  } else {
    // Si se proporciona nuevo nombre, verificar que no esté en uso por otro usuario
    if ($new_username !== '') {
      $stmt_check = $conn->prepare('SELECT ID_User_PK FROM users WHERE Nametag = ? AND ID_User_PK != ?');
      $stmt_check->bind_param('si', $new_username, $user_id);
      $stmt_check->execute();
      $res_check = $stmt_check->get_result();
      if ($res_check && $res_check->num_rows > 0) {
        $error_message = 'El nombre de usuario ya está en uso.';
        $stmt_check->close();
      } else {
        $stmt_check->close();
      }
    }

    if ($error_message === '') {
      // Ejecutar actualización según los campos provistos
      if ($new_username !== '' && $new_password !== '') {
        $stmt_upd = $conn->prepare('UPDATE users SET Nametag = ?, Password = ? WHERE ID_User_PK = ?');
        $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);
        if ($stmt_upd) {
          $stmt_upd->bind_param('ssi', $new_username, $hashed_password, $user_id);
        }
      } elseif ($new_username !== '') {
        $stmt_upd = $conn->prepare('UPDATE users SET Nametag = ? WHERE ID_User_PK = ?');
        if ($stmt_upd) {
          $stmt_upd->bind_param('si', $new_username, $user_id);
        }
      } elseif ($new_password !== '') {
        $stmt_upd = $conn->prepare('UPDATE users SET Password = ? WHERE ID_User_PK = ?');
        $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);
        if ($stmt_upd) {
          $stmt_upd->bind_param('si', $hashed_password, $user_id);
        }
      } else {
        $stmt_upd = null;
      }

        if ($stmt_upd) {
          if ($stmt_upd->execute()) {
            $success_message = 'Perfil actualizado con éxito.';
            if ($new_username !== '') {
              $_SESSION['username'] = $new_username;
              $username = $new_username;
            }
          } else {
            $error_message = 'Error al actualizar: ' . $stmt_upd->error;
          }
          $stmt_upd->close();
        }
            
      // Procesar subida de imagen de perfil si se ha enviado
      if (isset($_FILES['profile_image']) && $_FILES['profile_image']['error'] !== UPLOAD_ERR_NO_FILE) {
        $file = $_FILES['profile_image'];
        if ($file['error'] === UPLOAD_ERR_OK) {
          // Validaciones básicas
          $maxSize = 2 * 1024 * 1024; // 2MB
          $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
          $allowed = ['jpg','jpeg','png','webp'];
          $finfo = finfo_open(FILEINFO_MIME_TYPE);
          $mime = finfo_file($finfo, $file['tmp_name']);
          finfo_close($finfo);
          if (!in_array($ext, $allowed) || strpos($mime, 'image/') !== 0) {
            $error_message = 'Formato de imagen no permitido. Usa JPG, PNG o WEBP.';
          } elseif ($file['size'] > $maxSize) {
            $error_message = 'Imagen demasiado grande (max 2MB).';
          } else {
            $newName = $user_id . '_' . time() . '_' . bin2hex(random_bytes(4)) . '.' . $ext;
            $destDir = __DIR__ . '/../assets/users/profile_pictures/';
            if (!is_dir($destDir)) mkdir($destDir, 0755, true);
            $destPath = $destDir . $newName;
            if (move_uploaded_file($file['tmp_name'], $destPath)) {
              // Actualizar campo en BD
              $stmt_pic = $conn->prepare('UPDATE users SET Profile_Picture = ? WHERE ID_User_PK = ?');
              if ($stmt_pic) {
                $stmt_pic->bind_param('si', $newName, $user_id);
                if ($stmt_pic->execute()) {
                  // Borrar foto antigua si no es la por defecto
                  if ($profile_pic_file !== 'default.jpg') {
                    $oldPath = __DIR__ . '/../assets/users/profile_pictures/' . $profile_pic_file;
                    if (is_file($oldPath)) @unlink($oldPath);
                  }
                  $_SESSION['profile_picture'] = $newName;
                  $profile_pic_file = $newName;
                  $profile_pic_path = 'assets/users/profile_pictures/' . $profile_pic_file;
                  $success_message = 'Imagen de perfil actualizada.';
                } else {
                  $error_message = 'No se pudo actualizar la imagen en la base de datos.';
                }
                $stmt_pic->close();
              } else {
                $error_message = 'Error al preparar la consulta de imagen: ' . $conn->error;
              }
            } else {
              $error_message = 'No se pudo mover la imagen subida.';
            }
          }
        } else {
          $error_message = 'Error al subir la imagen.';
        }
      }
    }
  }
}
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

          <button class="btn btn-outline-light mt-2 custom-perfil-btn" data-bs-toggle="modal" data-bs-target="#editProfileModal">Modificar Perfil</button>
        </div>
        <div class="col-md-4 col-12 d-flex justify-content-center">
          <img src="<?php echo htmlspecialchars($profile_pic_path); ?>" alt="Avatar de <?php echo htmlspecialchars($username); ?>" class="custom-perfil-avatar" data-bs-toggle="modal" data-bs-target="#editProfileModal" style="cursor:pointer;">
        </div>
      </div>
      <hr class="custom-perfil-hr">
      <?php if (!empty($error_message)): ?>
        <div class="alert alert-danger mx-3" role="alert"><?php echo $error_message; ?></div>
      <?php endif; ?>
      <?php if (!empty($success_message)): ?>
        <div class="alert alert-success mx-3" role="alert"><?php echo $success_message; ?></div>
      <?php endif; ?>
      <a href="index.php?page=mis_publicaciones" class="btn btn-primary custom-perfil-btn-ver">Ver mis publicaciones</a>
    </div>
  </div>

  <!-- Modal: Edit Profile -->
  <div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <form method="POST" action="index.php?page=perfil" enctype="multipart/form-data">
          <input type="hidden" name="profile_action" value="update">
          <div class="modal-header">
            <h5 class="modal-title" id="editProfileLabel">Modificar Perfil</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label for="profile_image" class="form-label">Cambiar foto de perfil</label>
              <input class="form-control" type="file" id="profile_image" name="profile_image" accept="image/*">
            </div>
            <div class="mb-3">
              <label for="new_username" class="form-label">Nuevo nombre de usuario</label>
              <input type="text" id="new_username" name="new_username" class="form-control" placeholder="<?php echo htmlspecialchars($username); ?>">
            </div>
            <div class="mb-3">
              <label for="new_password" class="form-label">Nueva contraseña</label>
              <input type="password" id="new_password" name="new_password" class="form-control" placeholder="Dejar vacío para no cambiar">
            </div>
            <div class="mb-3">
              <label for="confirm_password" class="form-label">Confirmar contraseña</label>
              <input type="password" id="confirm_password" name="confirm_password" class="form-control" placeholder="Repite la contraseña">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
            <button type="submit" class="btn btn-primary">Guardar cambios</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script src="js/bootstrap/bootstrap.bundle.js"></script>
  <script src="js/main.js"></script>
</body>

</html>