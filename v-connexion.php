<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"><link rel="stylesheet" href="style.css"><title>Connexion</title>
</head>
<body>
<main>
    <h1>Connexion</h1>
    <form method="post" action="index.php?action=connexion">
        <label>Login : <input type="text" name="login" required></label>
        <label>Mot de passe : <input type="password" name="motdepasse" required></label>
        <button type="submit">Se connecter</button>
    </form>
    <?php if ($message) { ?><p class="error"><?php echo $message; ?></p><?php } ?>
</main>
</body>
</html>