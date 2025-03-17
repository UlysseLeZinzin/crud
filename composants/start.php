<?php
    session_start(); // On démarre la session
    if (!isset($_SESSION['utilisateur'])) { // Donc on est pas connecté
        header('Location: login.php'); // Redirection vers la page de login
        exit;
    }
?>