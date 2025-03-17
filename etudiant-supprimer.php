suppression
<?php
    include 'config.php';
    $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_USER, DB_PASSWORD);

    $id = $_GET['id'];
    $requete = $pdo->prepare('DELETE FROM personnes WHERE id = :id');
    $requete->execute(array(
        ':id' => $id
    ));
    header('Location: etudiants.php');
    exit;
?>