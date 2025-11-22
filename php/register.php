<?php
global $conn; // Hacemos la variable $conn global para poder usarla.

// Obtenemos la lista de países para el dropdown
$countries_list = [];
$query_countries = "SELECT ID_Country_PK, Name FROM countries ORDER BY Name ASC";
$result_countries = $conn->query($query_countries);
if ($result_countries && $result_countries->num_rows > 0) {
    while ($row = $result_countries->fetch_assoc()) {
        $countries_list[] = $row;
    }
}

// Inicializamos las variables para mantener los datos del formulario en caso de error.
$firstname = '';
$lastname = '';
$birthdate = '';
$gender = '';
$country = '';
$phone = '';
$nametag = '';
$email = '';

$error_message = '';
$success_message = '';

// Verificar si el formulario ha sido enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // 1. Recoger y limpiar los datos del formulario
    $firstname = trim($_POST['firstname']);
    $lastname = trim($_POST['lastname']);
    $birthdate = $_POST['birthdate'];
    // Usamos isset() porque empty('0') devuelve true en PHP y '0' es un valor válido para masculino
    $gender = isset($_POST['gender']) ? $_POST['gender'] : null;
    $country = trim($_POST['birthcountry']);
    $phone = trim($_POST['phonenumber']);
    $nametag = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    // 2. Validaciones del lado del servidor
    $errors = [];
    if (empty($firstname) || strlen($firstname) > 30) $errors[] = "El nombre debe tener entre 1 y 30 caracteres.";
    if (empty($lastname) || strlen($lastname) > 30) $errors[] = "El apellido debe tener entre 1 y 30 caracteres.";
    if (empty($nametag) || strlen($nametag) > 20) $errors[] = "El nombre de usuario debe tener entre 1 y 20 caracteres.";
    if (empty($email) || strlen($email) > 30) $errors[] = "El correo debe tener entre 1 y 30 caracteres.";
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) $errors[] = "El formato del correo electrónico no es válido.";
    if (empty($password)) $errors[] = "La contraseña es obligatoria.";
    if ($gender === null) $errors[] = "Debes seleccionar un género.";
    if (empty($country)) $errors[] = "Debes seleccionar un país.";
    if (!preg_match('/^[0-9]{10}$/', $phone)) $errors[] = "El número de teléfono debe contener exactamente 10 dígitos numéricos.";
    
    if (!empty($birthdate)) {
        $birth_year = (int)date('Y', strtotime($birthdate));
        if ($birth_year < 1950 || $birth_year > 2015) {
            $errors[] = "El año de nacimiento debe estar entre 1950 y 2015.";
        }
    } else {
        $errors[] = "La fecha de nacimiento es obligatoria.";
    }

    if (empty($errors)) {
        $profile_picture = 'default.jpg';
        if (isset($_FILES['profile_image']) && $_FILES['profile_image']['error'] !== UPLOAD_ERR_NO_FILE) {
            $file = $_FILES['profile_image'];
            if ($file['error'] === UPLOAD_ERR_OK) {
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
                    $newName = time() . '_' . bin2hex(random_bytes(4)) . '.' . $ext;
                    $destDir = __DIR__ . '/../assets/users/profile_pictures/';
                    if (!is_dir($destDir)) mkdir($destDir, 0755, true);
                    $destPath = $destDir . $newName;
                    if (move_uploaded_file($file['tmp_name'], $destPath)) {
                        $profile_picture = $newName;
                    } else {
                        $error_message = 'No se pudo mover la imagen subida.';
                    }
                }
            } else {
                $error_message = 'Error al subir la imagen.';
            }
        }

        // 4. Preparar la consulta SQL para insertar el usuario (incluyendo la foto)
        if ($error_message === '') {
            $sql = "INSERT INTO users (Nametag, Password, First_Name, Last_Name, Birthdate, Gender, ID_Country_FK, Phone_Number, Email, ID_Role_FK, Profile_Picture) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 2, ?)";
            $stmt = $conn->prepare($sql);
            if ($stmt) {
                // 5. Vincular los parámetros y ejecutar la consulta
                $stmt->bind_param("sssssiisss", $nametag, $password, $firstname, $lastname, $birthdate, $gender, $country, $phone, $email, $profile_picture);
                if ($stmt->execute()) {
                    $success_message = "¡Registro exitoso! Ahora puedes iniciar sesión.";
                    // Vaciamos las variables para limpiar el formulario solo en caso de éxito.
                    $firstname = '';
                    $lastname = '';
                    $birthdate = '';
                    $gender = '';
                    $country = '';
                    $phone = '';
                    $nametag = '';
                    $email = '';
                } else {
                    // Manejar errores, como un usuario o email duplicado
                    $error_message = "Error al registrar: " . $stmt->error;
                    // Si se subió una imagen y falla el registro, eliminarla para no dejar archivos huérfanos
                    if ($profile_picture !== 'default.jpg') {
                        $maybe = __DIR__ . '/../assets/users/profile_pictures/' . $profile_picture;
                        if (is_file($maybe)) @unlink($maybe);
                    }
                }
                $stmt->close();
            } else {
                $error_message = "Error al preparar la consulta: " . $conn->error;
            }
        }
    } else {
        $error_message = implode("<br>", $errors);
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../img/Logo.png">
    <title>Registrarse - Mundial Twenty Six</title>
    
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/register.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body class="custom-register-bg">
    <?php 
        // Incluimos la barra de navegación simple.
        $navbar_template = 'navbar-simple';
        require 'html/templates/navbar.php'; 
    ?>

    <div class="d-flex justify-content-center align-items-center" style="min-height: 80vh; padding: 20px 0;">
        <div class="card p-4 custom-register-card">
            <h2 class="text-center mb-4 custom-register-title">Registrarse</h2>
            <?php if (!empty($success_message)): ?>
                <div class="alert alert-success" role="alert"><?php echo $success_message; ?></div>
            <?php endif; ?>
            <?php if (!empty($error_message)): ?>
                <div class="alert alert-danger" role="alert"><?php echo $error_message; ?></div>
            <?php endif; ?>
            <form method="POST" action="index.php?page=register" enctype="multipart/form-data">
                    <div class="mb-3 text-center">
                        <div id="avatarPreview">
                            <img src="img/profile-icon-default.jpg" alt="Avatar" id="registerAvatar" style="cursor:pointer; width:120px; height:120px; object-fit:cover; border-radius:50%;">
                        </div>
                        <label for="photo" class="form-label custom-label">Foto (opcional)</label>
                        <input type="file" id="profile_image" name="profile_image" accept="image/*" style="display:none;">
                    </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="firstname" class="form-label w-100 text-center custom-label">Nombre/s</label>
                    <input type="text" class="form-control SearchTopic" id="firstname" name="firstname" placeholder="Nombre" value="<?php echo htmlspecialchars($firstname); ?>" required maxlength="30">
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="lastname" class="form-label w-100 text-center custom-label">Apellido/s</label>
                    <input type="text" class="form-control SearchTopic" id="lastname" name="lastname" placeholder="Apellido" value="<?php echo htmlspecialchars($lastname); ?>" required maxlength="30">
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="birthdate" class="form-label w-100 text-center custom-label">Fecha de nacimiento</label>
                    <input type="date" class="form-control SearchTopic" id="birthdate" name="birthdate" value="<?php echo htmlspecialchars($birthdate); ?>" required min="1950-01-01" max="2015-12-31">
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label class="form-label w-100 text-center custom-label">Sexo</label>
                    <div class="custom-radio-group">
                        <label class="custom-radio">
                            <input type="radio" name="gender" value="0" <?php if ($gender === '0') echo 'checked'; ?> required>
                            <span class="custom-radio-circle"></span>
                            Masculino
                        </label>
                        <label class="custom-radio">
                            <input type="radio" name="gender" value="1" <?php if ($gender === '1') echo 'checked'; ?> required>
                            <span class="custom-radio-circle"></span>
                            Femenino
                        </label>
                        <label class="custom-radio">
                            <input type="radio" name="gender" value="2" <?php if ($gender === '2') echo 'checked'; ?> required>
                            <span class="custom-radio-circle"></span>
                            Otro
                        </label>
                    </div>
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="birthcountry" class="form-label w-100 text-center custom-label">País</label>
                    <select class="form-select SearchTopic dropdown" id="birthcountry" name="birthcountry" required>
                        <option value="" disabled <?php if (empty($country)) echo 'selected'; ?>>Selecciona tu país</option>
                        <?php foreach ($countries_list as $country_item): ?>
                            <option value="<?php echo $country_item['ID_Country_PK']; ?>" <?php if ($country == $country_item['ID_Country_PK']) echo 'selected'; ?>>
                                <?php echo htmlspecialchars($country_item['Name']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="phonenumber" class="form-label w-100 text-center custom-label">Numero de teléfono</label>
                    <input type="tel" class="form-control SearchTopic" id="phonenumber" name="phonenumber" placeholder="10 dígitos numéricos" value="<?php echo htmlspecialchars($phone); ?>" required pattern="[0-9]{10}" maxlength="10" title="El teléfono debe contener 10 dígitos numéricos.">
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="username" class="form-label w-100 text-center custom-label">Nombre de usuario</label>
                    <input type="text" class="form-control SearchTopic" id="username" name="username" placeholder="Sobrenombre" value="<?php echo htmlspecialchars($nametag); ?>" required maxlength="20">
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="email" class="form-label w-100 text-center custom-label">Correo electrónico</label>
                    <input type="email" class="form-control SearchTopic" id="email" name="email" placeholder="Correo electrónico" value="<?php echo htmlspecialchars($email); ?>" required maxlength="30">
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="password" class="form-label w-100 text-center custom-label">Contraseña</label>
                    <input type="password" class="form-control SearchTopic" id="password" name="password" placeholder="Contraseña" required>
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-success mt6" style="border-radius: 15px; font-size: 25px;">Registrarse</button>
                </div>
            </form>
        </div>
    </div>

        <script src="js/bootstrap/bootstrap.bundle.js"></script>
        <script src="js/main.js"></script>
        <script>
        // Hacer clickable el avatar y mostrar vista previa en el registro
        document.addEventListener('DOMContentLoaded', function() {
            const avatar = document.getElementById('registerAvatar');
            const fileInput = document.getElementById('profile_image');
            if (!avatar || !fileInput) return;

            avatar.addEventListener('click', function() {
                fileInput.click();
            });

            fileInput.addEventListener('change', function() {
                const file = this.files && this.files[0];
                if (!file) return;
                const allowed = ['image/jpeg','image/png','image/webp'];
                if (!allowed.includes(file.type)) {
                    alert('Formato no permitido. Usa JPG, PNG o WEBP.');
                    this.value = '';
                    return;
                }
                const reader = new FileReader();
                reader.onload = function(e) { avatar.src = e.target.result; };
                reader.readAsDataURL(file);
            });
        });
        </script>
    </body>
</html>