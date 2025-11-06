<?php
// Hacemos la variable $conn global para poder usarla dentro de este archivo.
global $conn;
$error_message = '';

// Verificar si el formulario ha sido enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Prevenir inyección SQL usando sentencias preparadas
    $stmt = $conn->prepare("SELECT ID_User_PK, Password, Profile_Picture, ID_Role_FK FROM users WHERE Nametag = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        // TODO: Cambiar esto por password_verify() para mayor seguridad.
        if ($password === $user['Password']) {
            // CORRECCIÓN: Usar 'user_id' para que sea consistente con las otras páginas.
            $_SESSION['user_id'] = $user['ID_User_PK'];
            $_SESSION['username'] = $username;
            // Nota: ya no almacenamos rol en la sesión (se retiró lógica de administrador)
            $_SESSION['profile_picture'] = $user['Profile_Picture']; // Guardamos la foto de perfil

            // CORRECCIÓN: Redirigir a la página anterior si existe, si no, a home.
            if (isset($_GET['redirect_url'])) {
                // Decodificamos la URL y redirigimos al usuario a donde quería ir.
                $redirect_url = urldecode($_GET['redirect_url']);
                header("Location: " . $redirect_url);
            } else {
                // Si no hay URL de redirección, lo mandamos a home.
                header("Location: index.php?page=home");
            }
            exit();
        } else {
            $error_message = "Contraseña incorrecta.";
        }
    } else {
        $error_message = "El usuario no existe.";
    }
    $stmt->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - Mundial Twenty Six</title>
    <link rel="icon" href="img/Logo.png">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/login.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body class="custom-login-bg">
    <?php 
        // Incluimos la barra de navegación simple.
        $navbar_template = 'navbar-simple';
        require 'html/templates/navbar.php'; 
    ?>

    <div class="d-flex justify-content-center align-items-center" style="min-height: 80vh;">
        <div class="card p-4 custom-login-card">
            <h2 class="text-center mb-4 custom-login-title">Iniciar Sesión</h2>
            <?php if (!empty($error_message)): ?>
                <div class="alert alert-danger" role="alert"><?php echo $error_message; ?></div>
            <?php endif; ?>
            <form method="POST" action="index.php?page=login">
                <div class="mb-3 text-center">
                    <label for="username" class="form-label custom-label">Usuario</label>
                    <input type="text" class="form-control SearchTopic mx-auto" id="username" name="username" placeholder="Ingresa tu usuario" required>
                </div>
                <div class="mb-3 text-center">
                    <label for="password" class="form-label custom-label">Contraseña</label>
                    <input type="password" class="form-control SearchTopic mx-auto" id="password" name="password" placeholder="Ingresa tu contraseña" required>
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-success custom-login-btn mt6">Iniciar sesión</button>
                    <a href="index.php?page=register" class="btn btn-outline-primary mt-2 custom-register-btn">¿No tienes cuenta? Regístrate</a>
                </div>
            </form>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script> </body>
</html>