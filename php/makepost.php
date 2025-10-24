<?php
global $conn;

// 1. Proteger la página: si no hay sesión, redirigir al login.
if (!isset($_SESSION['user_id'])) {
    // Guardamos la URL actual para redirigir al usuario de vuelta después del login.
    $redirect_url = urlencode($_SERVER['REQUEST_URI']);
    header("Location: index.php?page=login&redirect_url=$redirect_url");
    exit;
}

// 2. Obtener categorías para el dropdown
$categories = [];
$sql_categories = "SELECT ID_Category_PK, Name FROM categories WHERE Is_Visible = 1 ORDER BY Name ASC";
$result_categories = $conn->query($sql_categories);
if ($result_categories) {
    while ($row = $result_categories->fetch_assoc()) {
        $categories[] = $row;
    }
}

// 2. Procesar el formulario cuando se envía
$error_message = '';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $post_title = trim($_POST['post_title']);
    $post_content = trim($_POST['post_content']);
    $category_id = $_POST['post_category'] ?? null;
    $user_id = $_SESSION['user_id'];
    $worldcup_id = $_GET['worldcup_id'] ?? null; // Obtenemos el ID del mundial de la URL

    if (empty($post_title) || empty($post_content) || empty($worldcup_id) || empty($category_id)) {
        $error_message = "Todos los campos (título, contenido y categoría) son obligatorios.";
    } else {
        $upload_date = date('Y-m-d H:i:s');
        $visibility = 1; // 1 = visible

        $sql = "INSERT INTO posts (Content_Title, Content_Body, Upload_Date, ID_WorldCup_Year_FK, ID_User_FK, Visibility_State) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssiii", $post_title, $post_content, $upload_date, $worldcup_id, $user_id, $visibility);

        if ($stmt->execute()) {
            $new_post_id = $stmt->insert_id;

            // Asociar la categoría con el post en la tabla `categories-posts`
            $sql_cat_post = "INSERT INTO `categories-posts` (ID_Category_FK, ID_Post_FK) VALUES (?, ?)";
            $stmt_cat_post = $conn->prepare($sql_cat_post);
            $stmt_cat_post->bind_param("ii", $category_id, $new_post_id);
            
            if ($stmt_cat_post->execute()) {
                // Redirigir a la página de detalles del mundial para ver la publicación.
                header("Location: index.php?page=details&edicion=" . $_GET['edicion_name']);
                exit;
            } else {
                $error_message = "Publicación creada, pero hubo un error al asignar la categoría: " . $stmt_cat_post->error;
            }
        } else {
            $error_message = "Error al guardar la publicación: " . $stmt->error;
        }
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
  <link rel="stylesheet" href="css/makepost.css"> <!-- Asumo que el archivo se llama o debería llamarse así -->
    
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
    <!-- Usamos un formulario que envía los datos a la misma página -->
    <form class="publicacion" method="POST" action="index.php?page=makepost&worldcup_id=<?php echo htmlspecialchars($_GET['worldcup_id'] ?? ''); ?>&edicion_name=<?php echo htmlspecialchars($_GET['edicion_name'] ?? ''); ?>">
        <div class="encabezado">
            Crear publicación
            <a href="javascript:history.back()" class="close-button" title="Cancelar">✖</a>
        </div>

        <?php if (!empty($error_message)): ?>
            <div class="alert alert-danger mx-3" role="alert"><?php echo $error_message; ?></div>
        <?php endif; ?>

        <div class="perfil">
            <?php
                // Lógica para mostrar la imagen de perfil del usuario logueado
                $profile_pic_file = $_SESSION['profile_picture'] ?? 'default.jpg';
                $profile_pic_path = ($profile_pic_file === 'default.jpg')
                    ? 'img/profile-icon-default.jpg'
                    : 'assets/users/profile_pictures/' . $profile_pic_file;
            ?>
            <img src="<?php echo htmlspecialchars($profile_pic_path); ?>" alt="Foto de perfil">
            <div>
                <div class="nombre"><?php echo htmlspecialchars($_SESSION['username']); ?></div>
            </div>
        </div>

        <!-- Campo para el título -->
        <input type="text" name="post_title" class="form-control post-title" placeholder="Dale un título a tu publicación" required>

        <!-- Campo para el contenido -->
        <textarea name="post_content" placeholder="¿Qué estás pensando, <?php echo htmlspecialchars($_SESSION['username']); ?>?" required></textarea>

        <!-- Selector de Categoría -->
        <div class="category-selector">
            <select name="post_category" id="post_category" class="form-select" required>
                <option value="" disabled selected>Selecciona una categoría...</option>
                <?php if (count($categories) > 0): ?>
                    <?php foreach ($categories as $category): ?>
                        <option value="<?php echo $category['ID_Category_PK']; ?>"><?php echo htmlspecialchars($category['Name']); ?></option>
                    <?php endforeach; ?>
                <?php endif; ?>
            </select>
        </div>

        <div class="acciones">
            <button type="button" class="btn-accion">📷 Foto/video</button>
            <button type="button" class="btn-accion">😊 Emoción</button>
            <button type="button" class="btn-accion"># Hashtag</button>
        </div>

        <!-- El botón de publicar ahora es de tipo submit -->
        <button type="submit" class="publicar">Publicar</button>
    </form>
</div>

  <script src="js/bootstrap/bootstrap.bundle.js"></script>
  <script src="js/main.js"></script>
</body>
</html>
