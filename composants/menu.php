<ul class="menu">
    <li><a href="index.php">Accueil</a></li>
    <li><a href="etudiants.php">Etudiants</a></li>
    <li><a href="cours.php">Cours</a></li>
    <?php
        if (isset($_SESSION['utilisateur'])) {  // Si on est connecté
            echo '<li><a href="deconnexion.php">Déconnexion</a></li>';
        }
        else {  // Si on n'est pas connecté
            echo '<li><a href="login.php">Connexion</a></li>';
        }
    ?>
</ul>
