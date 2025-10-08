<?php
// Hacemos la variable $conn global para poder usarla dentro de este archivo.
global $conn;

// Consultar todos los mundiales de la base de datos, ordenados por año
$query = "SELECT Name, Final_Winner, Official_Artwork_Multimedia, ID_WorldCup_Year_PK FROM worldcup_editions ORDER BY ID_WorldCup_Year_PK ASC";
$result = $conn->query($query);

// --- Bloque de depuración ---
// Si la consulta falla, $result será `false`. Mostramos el error exacto.
if ($result === false) {
    die("Error en la consulta SQL: " . htmlspecialchars($conn->error));
}

$editions = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $editions[] = $row;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mundial Twenty Six - News</title>
    <link rel="icon" href="img/Logo.png">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body>
    <?php 
        // Incluimos la barra de navegación principal.
        // Usamos una variable para indicar qué plantilla cargar.
        $navbar_template = 'navbar-main';
        require 'html/templates/navbar.php'; 
    ?>

    <div class="MainContainer">
        <div id="Feed-Public">
            <h1 id="T1" class="FP-MenuTitle">Mundiales</h1>
            <div id="cards">
                <?php if (count($editions) > 0): ?>
                    <?php foreach ($editions as $edition): ?>
                        <?php
                            // Preparamos los datos para usarlos en el HTML
                            $edition_name = htmlspecialchars($edition['Name']);
                            $winner = htmlspecialchars($edition['Final_Winner']);
                            $poster_image = htmlspecialchars($edition['Official_Artwork_Multimedia']);
                            
                            // Creamos el identificador para la URL, ej: "QATAR 2022" -> "QATAR_2022"
                            $url_edicion = str_replace([' ', '/'], ['_', '-'], $edition['Name']);
                        ?>
                        <button class="card" data-edicion="<?php echo $url_edicion; ?>">
                            <img src="assets/fifa world cup posters/<?php echo $poster_image; ?>" alt="Póster oficial del Mundial <?php echo $edition_name; ?>">
                            <div class="card-content">
                                <h2><?php echo $edition_name; ?></h2>
                                <p>Campeón: <?php echo $winner; ?></p>
                            </div>
                        </button>
                    <?php endforeach; ?>
                <?php else: ?>
                    <p class="text-white text-center fs-4">No hay mundiales registrados en la base de datos todavía. ¡Añade algunos para empezar!</p>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <script src="js/bootstrap/bootstrap.bundle.js"></script>
    <script src="js/main.js"></script>
    <script>
        // Script específico del index (el que hace los botones clickables)
        window.addEventListener('DOMContentLoaded', () => {
            const allCards = document.querySelectorAll('#cards .card');
            allCards.forEach(card => {
                card.addEventListener('click', () => {
                    const urlTitle = card.dataset.edicion;
                    window.location.href = `index.php?page=details&edicion=${urlTitle}`;
                });
            });
        });
    </script>
</body>
</html>
