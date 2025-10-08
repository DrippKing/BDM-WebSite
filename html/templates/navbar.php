<?php if (isset($navbar_template) && $navbar_template === 'navbar-main'): ?>
<nav id="navbar-main" class="Topbar navbar navbar-expand-lg">
    <div class="container-fluid">
        <div id="logobg" onclick="window.location.href='index.php?page=home'">
            <img src="img/Logo.png" width="80" class="d-inline-block align-text-top">
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link mt6 dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Momentos Históricos</a>
                    <ul class="dropdown-menu mt6"> <!-- Los enlaces de JS en main.js se encargarán de esto -->
                        <li><a class="dropdown-item mt6" href="index.php?page=historicMoments&tema=Finales_Inolvidables">Finales Inolvidables</a></li>
                        <li><a class="dropdown-item mt6" href="index.php?page=historicMoments&tema=Goles_Legendarios">Goles Legendarios</a></li>
                        <li><a class="dropdown-item mt6" href="index.php?page=historicMoments&tema=Grandes_Controversias">Grandes Controversias</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item mt6" href="index.php?page=historicMoments&tema=Mascotas_y_Canciones">Mascotas y Canciones</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link mt6 dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Estadísticas</a>
                    <ul class="dropdown-menu mt6">
                        <li><a class="dropdown-item mt6" href="#">Tabla Histórica de Campeones</a></li>
                        <li><a class="dropdown-item mt6" href="#">Máximos Goleadores</a></li>
                        <li><a class="dropdown-item mt6" href="#">Ganadores del Balón de Oro</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item mt6" href="#">Récords y Curiosidades</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link mt6 dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Jugadores y Equipos</a>
                    <ul class="dropdown-menu mt6">
                        <li><a class="dropdown-item mt6" href="#">Jugadores de Leyenda</a></li>
                        <li><a class="dropdown-item mt6" href="#">Selecciones Históricas</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item mt6" href="#">Buscar Jugador...</a></li>
                        <li><a class="dropdown-item mt6" href="#">Buscar Equipo...</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link mt6 dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Mis Aportes</a>
                    <ul class="dropdown-menu mt6">
                        <li><a class="dropdown-item mt6" href="#">Crear Nueva Publicacion</a></li>
                        <li><a class="dropdown-item mt6" href="#">Mis Publicaciones</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item mt6" href="#">Donar al Sitio Web</a></li>
                        <li><a class="dropdown-item mt6" href="#">Reportar Publicacion</a></li>
                    </ul>
                </li>
            </ul>
            <form style="width: 100%;" class="d-flex" role="search">
                <input class="SearchTopic form-control" type="search" placeholder="Buscar" aria-label="Buscar">
            </form>
            <div class="profile-container">
                <?php if (isset($_SESSION['username'])): ?>
                    <div class="profile-picture">
                        <img src="img/profile-icon-default.jpg" alt="Foto de perfil"> <!-- Podríamos hacer esto dinámico también -->
                    </div>
                    <div class="d-flex align-items-center ms-2">
                        <span class="text-white me-3"><?php echo htmlspecialchars($_SESSION['username']); ?></span>
                        <a href="index.php?page=logout" class="btn-login">Cerrar Sesión</a>
                    </div>
                <?php else: ?>
                    <button class="btn-login" onclick="window.location.href='index.php?page=login'">Iniciar Sesión</button>
                <?php endif; ?>
            </div>
        </div>
    </div>
</nav>
<?php endif; ?>

<?php if (isset($navbar_template) && $navbar_template === 'navbar-simple'): ?>
<nav id="navbar-simple" class="Topbar navbar navbar-expand-lg">
    <div class="container-fluid">
        <div id="logobg" onclick="window.location.href='index.php?page=home'">
            <img src="img/Logo.png" width="80" class="d-inline-block align-text-top">
        </div>
    </div>
</nav>
<?php endif; ?>