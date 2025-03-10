<?php
    session_start(); // On démarre la session

    define('DB_HOST','localhost');
    define('DB_NAME','crud');
    define('DB_USER','root');
    define('DB_PASSWORD','');

    //$pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_USER, DB_PASSWORD);
    $pdo = new PDO('mysql:host=localhost;dbname=crud', 'root', '');
    
    
    if (isset($_POST['submit'])) { // Si le formulaire a été soumis
        
        //Récupère les données du formulaire
        $utilisateur = $_POST['utilisateur'];
        $mot_de_passe = $_POST['mot_de_passe'];

        // On retrouve (ou pas) l'enregistrement correspondant dans la base de données
        //$query = $pdo->query('SELECT * FROM utilisateurs WHERE email = ' . $utilisateur); // Excessivement dangereux
        $requete = $pdo->prepare('SELECT * FROM personnes WHERE email = :utilisateur');
        $requete->execute(array(':utilisateur' => $utilisateur));
        $data = $requete->fetch();
        
        // On affiche les données pour vérifier
        //var_dump($data);
        

        // On vérifie si la personne existe et si le mot de passe est correct
        if ($data) {    // La personne existe
            if ($mot_de_passe == $data['mot_de_passe']) {
                $_SESSION['utilisateur'] = $utilisateur; // On enregistre le nom d'utilisateur dans la session
                header('Location: index.php'); // Redirection vers la page index.php
                exit; // Optimisation : on arrête le script PHP
            }
            else {
                echo "Username ou password invalide";
            }
        }
        else {
            echo "Username ou password invalide";
        }

        
        /*if ($utilisateur == 'admin' && $mot_de_passe == 'admin') {
            
        } 
        else {
            echo "Mauvais nom d'utilisateur ou mot de passe !"; // On ne précise pas lequel des deux pour des raisons de sécurité
        }
        */

    }

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connectez-vous !</title>
</head>
<body>

    <h1>Connectez-vous !</h1>

    <form action="login.php" method="post">

        <label for="utilisateur">Nom d'utilisateur :</label>
        <input type="text" name="utilisateur" id="utilisateur" required>

        <label for="mot_de_passe">Mot de passe :</label>
        <input type="password" name="mot_de_passe" id="mot_de_passe" required>
        
        <button name="submit" type="submit">Se connecter</button>

    </form>

</body>
</html>