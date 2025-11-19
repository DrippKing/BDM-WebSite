<?php
global $conn;
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// 1. Proteger la página
if (!isset($_SESSION['user_id'])) {
    $redirect_url = urlencode($_SERVER['REQUEST_URI']);
    header("Location: index.php?page=login&redirect_url=$redirect_url");
    exit;
}

// 2. Obtener categorías
$categories = [];
$sql_categories = "SELECT ID_Category_PK, Name FROM categories WHERE Is_Visible = 1 ORDER BY Name ASC";
$result_categories = $conn->query($sql_categories);
if ($result_categories) {
    while ($row = $result_categories->fetch_assoc()) {
        $categories[] = $row;
    }
}

$error_message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Detección temprana de subida de archivo demasiado grande para el servidor
    if (empty($_POST) && empty($_FILES) && $_SERVER['CONTENT_LENGTH'] > 0) {
        $error_message = 'El archivo que intentas subir es demasiado grande para el servidor. Por favor, elige un archivo más pequeño.';
    } else {

    $post_title   = trim($_POST['post_title']);
    $post_content = trim($_POST['post_content']);
    $category_id  = $_POST['post_category'] ?? null;
    $user_id      = $_SESSION['user_id'];
    $worldcup_id  = $_GET['worldcup_id'] ?? null;
    $media_file   = $_FILES['post_media'] ?? null;

    // VALIDACIÓN
    if (empty($post_title) || empty($post_content) || empty($worldcup_id) || empty($category_id)) {
        $error_message = "Todos los campos (título, contenido y categoría) son obligatorios.";
    } else {
        // Guardar la hora de publicación en la hora local del servidor.
        $upload_date = date('Y-m-d H:i:s');
        $media_filename = null;

        // Procesar subida de archivo si existe
        if ($media_file && $media_file['error'] === UPLOAD_ERR_OK) {
            $upload_dir = __DIR__ . '/../assets/users/posts_media/';
            if (!is_dir($upload_dir)) {
                mkdir($upload_dir, 0777, true);
            }
            
            $file_extension = strtolower(pathinfo($media_file['name'], PATHINFO_EXTENSION));
            $allowed_extensions = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'mp4', 'mov', 'avi'];

            if (in_array($file_extension, $allowed_extensions) && $media_file['size'] <= 10000000) { // Límite de 10MB
                $media_filename = uniqid('post_', true) . '.' . $file_extension;
                $upload_path = $upload_dir . $media_filename;

                if (!move_uploaded_file($media_file['tmp_name'], $upload_path)) {
                    $error_message = "Error al mover el archivo subido.";
                    $media_filename = null; // Anular si falla la subida
                }
            } else {
                $error_message = "Archivo no válido o demasiado grande (máx 10MB). Formatos permitidos: JPG, PNG, GIF, WEBP, MP4, MOV, AVI.";
            }
        }

        // Si el usuario es Administrador (role_id = 1), la publicación es visible de inmediato.
        // Si es un usuario normal, la publicación queda pendiente (Visibility_State = 0).
        $is_admin = (isset($_SESSION['role_id']) && $_SESSION['role_id'] == 1);
        $visibility = $is_admin ? 1 : 0; // 1 = visible, 0 = pendiente

        // Si hubo un error con el archivo, no continuamos con la inserción.
        if (!empty($error_message)) {
            // El mensaje de error ya está seteado, el script terminará y lo mostrará.
        } else {
            $sql = "INSERT INTO posts (Content_Title, Content_Body, Content_Multimedia, Upload_Date, ID_WorldCup_Year_FK, ID_User_FK, Visibility_State) VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssssiii", $post_title, $post_content, $media_filename, $upload_date, $worldcup_id, $user_id, $visibility);

        if ($stmt->execute()) {
            $new_post_id = $stmt->insert_id;

            // Asociar la categoría con el post en la tabla `categories-posts`
            $sql_cat_post = "INSERT INTO `categories-posts` (ID_Category_FK, ID_Post_FK) VALUES (?, ?)";
            $stmt_cat_post = $conn->prepare($sql_cat_post);
            $stmt_cat_post->bind_param("ii", $category_id, $new_post_id);
            
            if ($stmt_cat_post->execute()) {
                // Intentar obtener el nombre de la categoría para redirigir al apartado correspondiente
                $category_name = '';
                $stmt_cat_name = $conn->prepare("SELECT Name FROM categories WHERE ID_Category_PK = ? LIMIT 1");
                if ($stmt_cat_name) {
                    $stmt_cat_name->bind_param('i', $category_id);
                    if ($stmt_cat_name->execute()) {
                        $res_cat = $stmt_cat_name->get_result();
                        if ($res_cat && $res_cat->num_rows > 0) {
                            $category_name = $res_cat->fetch_assoc()['Name'];
                        }
                    }
                    $stmt_cat_name->close();
                }

                // Redirigir según el estado de visibilidad
                if ($visibility === 1) { // Si es admin o la política cambia, va a la página de detalles
                    $redirect = "index.php?page=details&edicion=" . urlencode($_GET['edicion_name']);
                    if (!empty($category_name)) {
                        $redirect .= "&category=" . urlencode($category_name);
                    }
                } else { // Si es un usuario normal, va a la página de "publicación pendiente"
                    $redirect = "index.php?page=post_pending";
                }
                header("Location: " . $redirect);
                exit;
            } else {
                $error_message = "Publicación creada, pero hubo un error al asignar la categoría: " . $stmt_cat_post->error;
            }
        } else { // Este else corresponde al if ($stmt->execute())
            $error_message = "Error al guardar la publicación: " . $stmt->error;
        }
    }
    } // Cierre del 'else' para la detección temprana
}
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Crear Publicación - Mundial Twenty Six</title>
<link rel="icon" href="img/Logo.png">

<link rel="stylesheet" href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/makepost.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">

</head>
<body class="custom-makepost-bg">

<?php 
$navbar_template = 'navbar-main';
require 'html/templates/navbar.php'; 
?>

<div class="makepost-container">

<form class="publicacion" method="POST" enctype="multipart/form-data"
      action="index.php?page=makepost&worldcup_id=<?php 
          echo htmlspecialchars($_GET['worldcup_id'] ?? ''); 
      ?>&edicion_name=<?php 
          echo htmlspecialchars($_GET['edicion_name'] ?? ''); 
      ?>">

    <div class="encabezado">
        Crear publicación
        <a href="javascript:history.back()" class="close-button">✖</a>
    </div>

    <?php if (!empty($error_message)): ?>
        <div class="alert alert-danger mx-3"><?php echo $error_message; ?></div>
    <?php endif; ?>

    <div class="perfil">
        <?php
        $profile_pic_file = $_SESSION['profile_picture'] ?? 'default.jpg';
        $profile_pic_path = ($profile_pic_file === 'default.jpg')
            ? 'img/profile-icon-default.jpg'
            : 'assets/users/profile_pictures/' . $profile_pic_file;
        ?>
        <img src="<?php echo htmlspecialchars($profile_pic_path); ?>">
        <div>
            <div class="nombre"><?php echo htmlspecialchars($_SESSION['username']); ?></div>
        </div>
    </div>

    <input type="text" name="post_title" class="form-control post-title" 
           placeholder="Dale un título a tu publicación" required>

    <textarea name="post_content" 
              placeholder="¿Qué estás pensando, <?php echo htmlspecialchars($_SESSION['username']); ?>?"
              required></textarea>

    <div class="category-selector">
        <select name="post_category" class="form-select" required>
            <option value="" disabled selected>Selecciona una categoría...</option>
            <?php foreach ($categories as $category): ?>
                <option value="<?php echo $category['ID_Category_PK']; ?>">
                    <?php echo htmlspecialchars($category['Name']); ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>

    <div class="acciones">
        <!-- Botón real que activa el input de archivo -->
        <button type="button" id="btn-add-media" class="btn-accion">Foto/video</button>
        <!-- Input de archivo oculto -->
        <input type="file" id="post_media" name="post_media" accept="image/*,video/*" style="display:none;">
        <!-- Contenedor para mostrar el nombre del archivo seleccionado -->
        <span id="file-name-display" class="ms-3 text-white-50"></span>
    </div>

    <button type="submit" class="publicar">Publicar</button>
</form>

</div>
<script src="js/bootstrap/bootstrap.bundle.js"></script>
<script src="js/main.js"></script>
<script>
    document.getElementById('btn-add-media').addEventListener('click', () => document.getElementById('post_media').click());
    document.getElementById('post_media').addEventListener('change', (event) => {
        document.getElementById('file-name-display').textContent = event.target.files[0] ? event.target.files[0].name : '';
    });
</script>
</body>
</html>
