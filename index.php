<?php

require_once 'gestionBd.php';

// Détermination de l'action (par défaut 'liste' si connecté, sinon 'connexion')
$action = $_REQUEST['action'] ?? 'liste';

// Sécurité : redirection vers connexion si non connecté (sauf si on tente de se connecter)
if (!isset($_SESSION['user_id']) && 'connexion' !== $action) {
    $action = 'connexion';
}

// Variables d'affichage communes
$errors = [];
$success = false;
$message = '';

/* ------------------------------
   FONCTIONS DE TRAITEMENT
--------------------------------*/

function traiterConnexion(): array
{
    $message = '';

    if ('POST' === $_SERVER['REQUEST_METHOD']) {
        $login = $_POST['login'] ?? '';
        $mdp = $_POST['motdepasse'] ?? '';

        if (verifierUtilisateur($login, $mdp)) {
            header('Location: index.php?action=liste');

            exit;
        }

        $message = 'Identifiants incorrects.';
    }

    return ['message' => $message];
}

function traiterAjout(): array
{
    $errors = [];
    $success = false;

    if ('POST' === $_SERVER['REQUEST_METHOD']) {
        $nom = $_POST['nom'] ?? '';
        $pays = $_POST['nomPays'] ?? '';
        $nb = intval($_POST['nombrePersonnes'] ?? 0);

        if ('' === $nom) {
            $errors[] = 'Nom requis.';
        }
        if ($nb <= 0) {
            $errors[] = 'Nombre invalide.';
        }

        if (empty($errors)) {
            ajouterGroupe(
                $nom,
                $_POST['adresse'] ?? '',
                $nb,
                $pays,
                isset($_POST['hebergement']) ? 1 : 0
            );
            $success = true;
        }
    }

    return [
        'errors' => $errors,
        'success' => $success,
    ];
}

function traiterModification(): array
{
    $errors = [];
    $success = false;

    $id = intval($_GET['id'] ?? 0);

    if ('POST' === $_SERVER['REQUEST_METHOD']) {
        modifierGroupe(
            $id,
            $_POST['nom'],
            $_POST['adresse'],
            (int) $_POST['nombrePersonnes'],
            $_POST['nomPays'],
            isset($_POST['hebergement']) ? 1 : 0
        );
        $success = true;
    }

    $groupe = getGroupeById($id);

    if (!$groupe) {
        header('Location: index.php?action=liste');

        exit;
    }

    return [
        'groupe' => $groupe,
        'success' => $success,
    ];
}

/* ------------------------------
   ROUTEUR (SWITCH)
--------------------------------*/

switch ($action) {
    case 'connexion':
        $result = traiterConnexion();
        $message = $result['message'];

        include 'v-connexion.php';

        break;

    case 'deconnexion':
        $_SESSION = [];
        session_destroy();
        header('Location: index.php?action=connexion');

        exit;

    case 'liste':
        $groupes = getGroupes();

        include 'v-groupe.php';

        break;

    case 'ajout':
        $result = traiterAjout();
        $errors = $result['errors'];
        $success = $result['success'];

        include 'v-ajouter.php';

        break;

    case 'modification':
        $result = traiterModification();
        $groupe = $result['groupe'];
        $success = $result['success'];

        include 'v-modifier.php';

        break;

    default:
        header('Location: index.php?action=liste');

        break;
}
