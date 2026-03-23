<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <title>Ajouter un groupe</title>
</head>
<body>
<main>
    <h1>Ajouter un groupe</h1>

    <?php if ($success): ?>
        <p class="ok">Groupe ajouté. <a href="index.php?action=liste">Retour à la liste</a></p>
    <?php endif; ?>

    <?php if (!empty($errors)): ?>
        <ul class="error">
            <?php foreach ($errors as $err): ?>
                <li><?= htmlspecialchars($err) ?></li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>

    <form method="post" action="index.php?action=ajout">
        <label>Nom: 
            <input type="text" name="nom" value="<?= htmlspecialchars($_POST['nom'] ?? '', ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?>">
        </label>
        
        <label>Adresse: 
            <input type="text" name="adresse" value="<?= htmlspecialchars($_POST['adresse'] ?? '', ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?>">
        </label>
        
        <label>Nombre de personnes: 
            <input type="number" name="nombrePersonnes" value="<?= htmlspecialchars($_POST['nombrePersonnes'] ?? '', ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?>" min="1">
        </label>
        
        <label>Pays: 
            <input type="text" name="nomPays" value="<?= htmlspecialchars($_POST['nomPays'] ?? '', ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?>">
        </label>
        
        <label>
            <input type="checkbox" name="hebergement" <?= isset($_POST['hebergement']) ? 'checked' : '' ?>> 
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