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
                    <ul class="dropdown-menu mt6">
                        <li><a class="dropdown-item mt6" href="index.php?page=finales_inolvidables">Finales Inolvidables</a></li>
                        <li><a class="dropdown-item mt6" href="index.php?page=goles_legendarios">Goles Legendarios</a></li>
                        <li><a class="dropdown-item mt6" href="index.php?page=grandes_controversias">Grandes Controversias</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item mt6" href="index.php?page=mascotas_y_canciones">Mascotas y Canciones</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link mt6 dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Estadísticas</a>
                    <ul class="dropdown-menu mt6">
                        <li><a class="dropdown-item mt6" href="index.php?page=maximos_goleadores">Máximos Goleadores</a></li>
                        <li><a class="dropdown-item mt6" href="index.php?page=balon_de_oro">Ganadores del Balón de Oro</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link mt6 dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Jugadores y Equipos</a>
                    <ul class="dropdown-menu mt6">
                        <li><a class="dropdown-item mt6" href="index.php?page=jugadores_leyenda">Jugadores de Leyenda</a></li>
                        <li><a class="dropdown-item mt6" href="index.php?page=selecciones_historicas">Selecciones Históricas</a></li>
                    </ul>
                </li>
                <?php if (isset($_SESSION['username'])): ?>
                    <li class="nav-item">
                        <a class="nav-link mt6" href="index.php?page=mis_publicaciones">Mis Publicaciones</a>
                    </li>
                <?php endif; ?>
                
                <?php // AÑADIR ESTE BLOQUE: Enlace al panel de administración ?>
                <?php $currentPage = $_GET['page'] ?? 'home'; ?>
                <?php if (isset($_SESSION['role_id']) && $_SESSION['role_id'] == 1 && $currentPage !== 'admin_approvals'): ?>
                    <li class="nav-item">
                       <a class="nav-link mt6" href="index.php?page=admin_approvals">Panel de Admin</a>
                    </li>
                <?php endif; ?>
            </ul>
            
            <!-- Barra de Búsqueda -->
<!--             <form class="d-flex mx-auto" role="search" action="index.php" method="GET">
                <input type="hidden" name="page" value="search_results">
                <input class="form-control me-2" type="search" name="query" placeholder="Buscar..." aria-label="Buscar">
            </form>
 -->
            <div class="profile-container">
                <?php if (isset($_SESSION['username'])): ?>
                    <?php
                        $profile_pic_file = $_SESSION['profile_picture'] ?? 'default.jpg';
                        $profile_pic_path = ($profile_pic_file === 'default.jpg')
                            ? 'img/profile-icon-default.jpg'
                            : 'assets/users/profile_pictures/' . $profile_pic_file;
                    ?>
                    <a href="index.php?page=perfil" class="d-flex align-items-center text-decoration-none">
                        <div class="profile-picture">
                            <img src="<?php echo htmlspecialchars($profile_pic_path); ?>" alt="Foto de perfil de <?php echo htmlspecialchars($_SESSION['username']); ?>">
                        </div>
                        <div class="d-flex align-items-center ms-2">
                            <span class="text-white me-3"><?php echo htmlspecialchars($_SESSION['username']); ?></span>
                        </div>
                    </a>
                    <a href="index.php?page=logout" class="btn-login ms-3">Cerrar Sesión</a>
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