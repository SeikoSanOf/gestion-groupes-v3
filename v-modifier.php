<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <title>Modifier le groupe</title>
</head>
<body>
<main>
    <h1>Modifier le groupe</h1>

    <?php if ($success) { ?>
        <p class="ok">Modification enregistrée. <a href="index.php?action=liste">Retour à la liste</a></p>
    <?php } ?>

    <?php if (!empty($errors)) { ?>
        <ul class="error">
            <?php foreach ($errors as $err) { ?>
                <li><?php echo htmlspecialchars($err); ?></li>
            <?php } ?>
        </ul>
    <?php } ?>

    <form method="post" action="index.php?action=modification&id=<?php echo (int) $groupe['id']; ?>">
        <label>Nom:
            <input type="text" name="nom" value="<?php echo htmlspecialchars($_POST['nom'] ?? $groupe['nom']); ?>">
        </label>

        <label>Adresse:
            <input type="text" name="adresse" value="<?php echo htmlspecialchars($_POST['adresse'] ?? $groupe['adressePostale']); ?>">
        </label>

        <label>Nombre de personnes:
            <input type="number" name="nombrePersonnes" value="<?php echo htmlspecialchars($_POST['nombrePersonnes'] ?? $groupe['nombrePersonnes']); ?>" min="1">
        </label>

        <label>Pays:
            <input type="text" name="nomPays" value="<?php echo htmlspecialchars($_POST['nomPays'] ?? $groupe['nomPays']); ?>">
        </label>

        <label>
            <input type="checkbox" name="hebergement" <?php echo (isset($_POST['hebergement']) || (!isset($_POST['nom']) && $groupe['hebergement'])) ? 'checked' : ''; ?>>
            Hébergement
        </label>

        <div class="form-actions">
            <button type="submit">Enregistrer les modifications</button>
            <a class="btn" href="index.php?action=liste">Annuler</a>
        </div>
    </form>
</main>
</body>
</html>