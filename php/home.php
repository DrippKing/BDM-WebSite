<?php
global $conn;
$query = "SELECT Name, Final_Winner, Official_Artwork_Multimedia, ID_WorldCup_Year_PK FROM worldcup_editions ORDER BY ID_WorldCup_Year_PK ASC";
$result = $conn->query($query);
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
                            $edition_name = htmlspecialchars($edition['Name']);
                            $winner = htmlspecialchars($edition['Final_Winner']);
                            $poster_image = htmlspecialchars($edition['Official_Artwork_Multimedia']);
                            
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
