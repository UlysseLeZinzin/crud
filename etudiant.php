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

    <form class="etudiant" action="etudiant.php" method="post">

        <div>
            <label for="nom">Nom :</label>
            <input type="text" name="nom" id="nom" required>
        </div>

        <div>
            <label for="prenom">Prénom :</label>
            <input type="text" name="prenom" id="prenom" required>
        </div>

        <div>
            <label for="email">Email :</label>
            <input type="email" name="email" id="email" required>
        </div>

        <div>
            <label for="telephone">Téléphone :</label>
            <input type="tel" name="telephone" id="telephone" required>
        </div>

        <div class="admin">
            <label for="admin">Admin :</label>
            <input type="checkbox" name="admin" id="admin">
        </div>

        <div class="etudiant">
            <label for="etudiant">Etudiant :</label>
            <input type="checkbox" name="etudiant" id="etudiant">
        </div>

        <div class="professeur">
            <label for="professeur">Professeur :</label>
            <input type="checkbox" name="professeur" id="professeur">
        </div>

        <div>
        <input name="submit" type="submit"></input>
        </div>
    </form>

</body>
</html>