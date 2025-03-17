<?php
    include 'composants/start.php'; // On démarre la session et on vérifie si on est connecté
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Etudiants</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <?php
        require_once 'composants/menu.php'; // On inclut le menu
    ?>
    <h1>Etudiants</h1>
    <a href="">Ajouter un étudiant</a>
    <br><br>
    
    <table>
        <tr>
            <th>Id</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Téléphone</th>
            <th>Admin</th>
            <th>Etudiant</th>
            <th>Professeur</th> 
            <th></th>   
        </tr>

        <?php
            require_once 'config.php'; // On inclut la connexion à la base de données
            $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_USER, DB_PASSWORD);

            $requete = $pdo->query('SELECT * FROM personnes ORDER BY nom, prenom;');
            while ($data = $requete->fetch()) {
                echo '<tr>';
                echo '<td>' . $data['id'] . '</td>';
                echo '<td>' . $data['nom'] . '</td>';
                echo '<td>' . $data['prenom'] . '</td>';
                echo '<td>' . $data['email'] . '</td>';
                echo '<td>' . $data['telephone'] . '</td>';
                echo '<td>' . $data['admin'] . '</td>';
                echo '<td>' . $data['etudiant'] . '</td>';
                echo '<td>' . $data['professeur'] . '</td>';
                echo '<td><a href="">Modifier</a>&nbsp;<a href="">Supprimer</a></td>';
                echo '</tr>';
            }
        ?>

    </table>

</body>
</html>