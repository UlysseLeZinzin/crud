<?php
    include 'composants/start.php';
    if (isset($_GET['id'])) {
        require_once 'config.php';
        $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_USER, DB_PASSWORD);

        $requete = $pdo->prepare('SELECT * FROM personnes WHERE id = :id');
        $requete->execute(array(
            ':id' => $_GET['id']
        ));
        $data = $requete->fetch();
        var_dump($data);
        exit; 
    }

    if (isset($_POST['submit'])) {
        require_once 'config.php';
        $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_USER, DB_PASSWORD);

        $nom = $_POST['nom'];
        $prenom = $_POST['prenom'];
        $email = $_POST['email'];
        $telephone = $_POST['telephone'];
        $admin = isset($_POST['admin']) ? 1 : 0;
        $etudiant = isset($_POST['etudiant']) ? 1 : 0;
        $professeur = isset($_POST['professeur']) ? 1 : 0;
    }

        if (isset($data)){

        }
        else
        {

        
        $requete = $pdo->prepare('INSERT INTO personnes (nom, prenom, email, telephone, admin, etudiant, professeur) VALUES (:nom, :prenom, :email, :telephone, :admin, :etudiant, :professeur)');
        $requete->execute(array(
            ':nom' => $nom,
            ':prenom' => $prenom,
            ':email' => $email,
            ':telephone' => $telephone,
            ':admin' => $admin,
            ':etudiant' => $etudiant,
            ':professeur' => $professeur
        ));
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Etudiant</title>
</head>
<body>

    <?php
        require_once 'composants/menu.php';
    ?>
        <h1>Etudiant</h1>

    <form class="etudiant" action="etudiant.php
    <?php if(isset($data)) echo '?id=' .$data['id']?>" method="post">

        <div>
            <label for="nom">Nom :</label>
            <input type="text" name="nom" id="nom" required
            value="<?php if (isset($data)) echo $data['nom']; ?>">
        </div>

        <div>
            <label for="prenom">Prénom :</label>
            <input type="text" name="prenom" id="prenom" required>
            value="<?php if (isset($data)) echo $data['prenom']; ?>">
        </div>

        <div>
            <label for="email">Email :</label>
            <input type="email" name="email" id="email" required>
            value="<?php if (isset($data)) echo $data['email']; ?>">
        </div>

        <div>
            <label for="telephone">Téléphone :</label>
            <input type="tel" name="telephone" id="telephone" required>
            value="<?php if (isset($data)) echo $data['telephone']; ?>">
        </div>

        <div class="admin">
            <label for="admin">Admin :</label>
            <input type="checkbox" name="admin" id="admin"
            <?php if (isset($data)) if ($data['admin'] == 1) echo ' checked'; ?>>
        </div>

        <div class="etudiant">
            <label for="etudiant">Etudiant :</label>
            <input type="checkbox" name="etudiant" id="etudiant"
            <?php if (isset($data)) if ($data['admin'] == 1) echo ' checked'; ?>>>
        </div>

        <div class="professeur">
            <label for="professeur">Professeur :</label>
            <input type="checkbox" name="professeur" id="professeur"
            <?php if (isset($data)) if ($data['admin'] == 1) echo ' checked'; ?>>>
        </div>

        <div>
        <input name="submit" type="submit" value="<?php if (isset($data)) echo 'Modifier'; else echo 'Mettre à jour'; ?>">
        </div>
    </form>

</body>
</html>