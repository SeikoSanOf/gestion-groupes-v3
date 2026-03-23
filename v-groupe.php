<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"><link rel="stylesheet" href="style.css"><title>Groupes</title>
</head>
<body>
<main>
    <header class="toprow">
      <h1>Groupes folkloriques</h1>
      <a href="index.php?action=deconnexion" class="btn logout">Déconnexion</a>
    </header>

    <nav><a class="btn" href="index.php?action=ajout">➕ Ajouter un groupe</a></nav>

    <table>
        <thead><tr><th>Nom</th><th>Pays</th><th>Actions</th></tr></thead>
        <tbody>
        <?php foreach($groupes as $g): ?>
          <tr>
            <td><?= htmlspecialchars($g['nom']) ?></td>
            <td><?= htmlspecialchars($g['nomPays']) ?></td>
            <td><a href="index.php?action=modification&id=<?= $g['id'] ?>">Modifier</a></td>
          </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</main>
</body>
</html>