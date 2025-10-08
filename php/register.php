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
    $gender = $_POST['gender'] ?? ''; // Usamos ?? '' para evitar errores si no se selecciona.
    $country = trim($_POST['birthcountry']);
    $phone = trim($_POST['phonenumber']);
    $nametag = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    // 2. Validar que los campos no estén vacíos (puedes añadir más validaciones)
    if (empty($nametag) || empty($email) || empty($password) || empty($firstname) || empty($gender)) {
        $error_message = "Por favor, completa todos los campos obligatorios.";
    } else {
        // 4. Preparar la consulta SQL para insertar el usuario
        $sql = "INSERT INTO users (Nametag, Password, First_Name, Last_Name, Birthdate, Gender, ID_Country_FK, Phone_Number, Email, ID_Role_FK, Profile_Picture) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 2, 'default.jpg')";
        
        $stmt = $conn->prepare($sql);

        if ($stmt) {
            // 5. Vincular los parámetros y ejecutar la consulta
            $stmt->bind_param("ssssssiss", $nametag, $password, $firstname, $lastname, $birthdate, $gender, $country, $phone, $email);
            
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
            }
            $stmt->close();
        } else {
            $error_message = "Error al preparar la consulta: " . $conn->error;
        }
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
    <div id="navbar-placeholder" data-template="navbar-simple"></div>

    <div class="d-flex justify-content-center align-items-center" style="min-height: 80vh; padding: 20px 0;">
        <div class="card p-4 custom-register-card">
            <h2 class="text-center mb-4 custom-register-title">Registrarse</h2>
            <?php if (!empty($success_message)): ?>
                <div class="alert alert-success" role="alert"><?php echo $success_message; ?></div>
            <?php endif; ?>
            <?php if (!empty($error_message)): ?>
                <div class="alert alert-danger" role="alert"><?php echo $error_message; ?></div>
            <?php endif; ?>
            <form method="POST" action="index.php?page=register">
                <div class="mb-3 text-center">
                    <div id="avatarPreview">
                        <img src="img/profile-icon-default.jpg" alt="Avatar">
                    </div>
                    <label for="photo" class="form-label custom-label">Foto</label>
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="firstname" class="form-label w-100 text-center custom-label">Nombre/s</label>
                    <input type="text" class="form-control SearchTopic" id="firstname" name="firstname" placeholder="Nombre" value="<?php echo htmlspecialchars($firstname); ?>" required>
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="lastname" class="form-label w-100 text-center custom-label">Apellido/s</label>
                    <input type="text" class="form-control SearchTopic" id="lastname" name="lastname" placeholder="Apellido" value="<?php echo htmlspecialchars($lastname); ?>" required>
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="birthdate" class="form-label w-100 text-center custom-label">Fecha de nacimiento</label>
                    <input type="date" class="form-control SearchTopic" id="birthdate" name="birthdate" value="<?php echo htmlspecialchars($birthdate); ?>" required>
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label class="form-label w-100 text-center custom-label">Sexo</label>
                    <div class="custom-radio-group">
                           <label class="custom-radio">
                               <input type="radio" name="gender" value="Masculino" <?php if ($gender === 'Masculino') echo 'checked'; ?> required>
                               <span class="custom-radio-circle"></span>
                               Masculino
                           </label>
                           <label class="custom-radio">
                               <input type="radio" name="gender" value="Femenino" <?php if ($gender === 'Femenino') echo 'checked'; ?> required>
                               <span class="custom-radio-circle"></span>
                               Femenino
                           </label>
                           <label class="custom-radio">
                               <input type="radio" name="gender" value="Otro" <?php if ($gender === 'Otro') echo 'checked'; ?> required>
                               <span class="custom-radio-circle"></span>
                               Otro
                           </label>
                       </div>
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="birthcountry" class="form-label w-100 text-center custom-label">País</label>
                    <select class="form-select SearchTopic" id="birthcountry" name="birthcountry" required>
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
                    <input type="tel" class="form-control SearchTopic" id="phonenumber" name="phonenumber" placeholder="00 0000 0000" value="<?php echo htmlspecialchars($phone); ?>" required>
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="username" class="form-label w-100 text-center custom-label">Nombre de usuario</label>
                    <input type="text" class="form-control SearchTopic" id="username" name="username" placeholder="Sobrenombre" value="<?php echo htmlspecialchars($nametag); ?>" required>
                </div>
                <div class="mb-3 d-flex flex-column align-items-center">
                    <label for="email" class="form-label w-100 text-center custom-label">Correo electrónico</label>
                    <input type="email" class="form-control SearchTopic" id="email" name="email" placeholder="Correo electrónico" value="<?php echo htmlspecialchars($email); ?>" required>
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
    <script src="js/main.js"></script> </body>
</html>