<?php
// --- SCRIPT PARA SEMBRAR LA BASE DE DATOS CON DATOS DE PRUEBA ---

// Aumentamos el tiempo de ejecución para evitar que el script se corte.
set_time_limit(300); // 5 minutos

echo "<!DOCTYPE html><html lang='es'><head><meta charset='UTF-8'><title>Sembrando Base de Datos</title>";
echo "<style>body { font-family: sans-serif; background-color: #121212; color: #e0e0e0; line-height: 1.6; padding: 20px; } .success { color: #4CAF50; } .error { color: #F44336; } .info { color: #2196F3; } h1 { color: #fff; }</style>";
echo "</head><body>";
echo "<h1>Iniciando siembra de datos...</h1>";

// 1. Incluir la conexión a la BD y el autoloader de Composer
require_once __DIR__ . '/db_connect.php';
require_once __DIR__ . '/../vendor/autoload.php';

// 2. Inicializar Faker para generar datos en español
$faker = Faker\Factory::create('es_ES');

try {
    // --- PREPARACIÓN ---
    echo "<p class='info'>Obteniendo datos necesarios (Mundiales, Países, Categorías)...</p>";

    // Obtenemos todos los IDs de los mundiales
    $result_worldcups = $conn->query("SELECT ID_WorldCup_Year_PK FROM worldcup_editions");
    $worldcup_ids = $result_worldcups->fetch_all(MYSQLI_ASSOC);
    if (empty($worldcup_ids)) {
        throw new Exception("No se encontraron ediciones de mundiales en la base de datos.");
    }
    $worldcup_ids = array_column($worldcup_ids, 'ID_WorldCup_Year_PK');

    // Obtenemos todos los IDs de los países
    $result_countries = $conn->query("SELECT ID_Country_PK FROM countries");
    $country_ids = $result_countries->fetch_all(MYSQLI_ASSOC);
    if (empty($country_ids)) {
        throw new Exception("No se encontraron países en la base de datos.");
    }
    $country_ids = array_column($country_ids, 'ID_Country_PK');

    // Obtenemos todos los IDs de las categorías visibles
    $result_categories = $conn->query("SELECT ID_Category_PK FROM categories WHERE Is_Visible = 1");
    $category_ids = $result_categories->fetch_all(MYSQLI_ASSOC);
    if (empty($category_ids)) {
        throw new Exception("No se encontraron categorías visibles en la base de datos.");
    }
    $category_ids = array_column($category_ids, 'ID_Category_PK');

    // --- CREACIÓN DE USUARIOS Y PUBLICACIONES ---
    $total_users = 20;
    $posts_per_user = 5; // 5 posts por usuario, en mundiales aleatorios

    echo "<p class='info'>Iniciando creación de $total_users usuarios y $posts_per_user publicaciones para cada uno...</p>";

    for ($i = 1; $i <= $total_users; $i++) {
        // 3. Generar datos para un nuevo usuario
        $firstName = $faker->firstName;
        $lastName = $faker->lastName;
        $nametag = $faker->unique()->userName;
        $email = $faker->unique()->safeEmail;
        $password_plain = '1234'; // Contraseña simple para pruebas
        $birthdate = $faker->date('Y-m-d', '2004-01-01');
        $random_country_id = $country_ids[array_rand($country_ids)];

        // 4. Insertar el usuario en la base de datos
        $stmt_user = $conn->prepare(
            "INSERT INTO users (ID_Role_FK, Profile_Picture, First_Name, Last_Name, Birthdate, Gender, ID_Country_FK, Phone_Number, Nametag, Email, Password)
             VALUES (2, 'default.jpg', ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        );
        $gender = $faker->numberBetween(0, 2);
        $phone = $faker->numerify('##########');
        $stmt_user->bind_param("ssssiisss", $firstName, $lastName, $birthdate, $gender, $random_country_id, $phone, $nametag, $email, $password_plain);
        $stmt_user->execute();
        $new_user_id = $stmt_user->insert_id;
        $stmt_user->close();

        echo "<p><span class='success'>✓ Usuario creado:</span> " . htmlspecialchars($nametag) . " (ID: $new_user_id)</p>";

        // 5. Crear publicaciones para este nuevo usuario
        for ($j = 1; $j <= $posts_per_user; $j++) {
            $post_title = rtrim($faker->sentence(5), '.');
            $post_content = $faker->paragraph(3);
            $upload_date = $faker->dateTimeThisDecade()->format('Y-m-d H:i:s');
            $random_worldcup_id = $worldcup_ids[array_rand($worldcup_ids)];
            $random_category_id = $category_ids[array_rand($category_ids)];

            $stmt_post = $conn->prepare(
                "INSERT INTO posts (Content_Title, Content_Body, Upload_Date, ID_WorldCup_Year_FK, ID_User_FK, Visibility_State)
                 VALUES (?, ?, ?, ?, ?, 1)"
            );
            $stmt_post->bind_param("sssii", $post_title, $post_content, $upload_date, $random_worldcup_id, $new_user_id);
            $stmt_post->execute();
            $new_post_id = $stmt_post->insert_id;
            $stmt_post->close();

            $stmt_cat_post = $conn->prepare("INSERT INTO `categories-posts` (ID_Category_FK, ID_Post_FK) VALUES (?, ?)");
            $stmt_cat_post->bind_param("ii", $random_category_id, $new_post_id);
            $stmt_cat_post->execute();
            $stmt_cat_post->close();
        }
        echo "<p style='padding-left: 20px;'>↳ Creadas $posts_per_user publicaciones para este usuario.</p>";
    }

    echo "<h1><span class='success'>¡Proceso completado!</span></h1>";

} catch (Exception $e) {
    echo "<h1><span class='error'>ERROR:</span></h1>";
    echo "<p class='error'>" . htmlspecialchars($e->getMessage()) . "</p>";
}

echo "</body></html>";
?>