<?php
require_once 'gestionBd.php';

// Détermination de l'action (par défaut 'liste' si connecté, sinon 'connexion')
$action = $_REQUEST['action'] ?? 'liste';

// Sécurité : redirection vers connexion si non connecté (sauf si on tente de se connecter)
if (!isset($_SESSION['user_id']) && $action !== 'connexion') {
    $action = 'connexion';
}

// Variables d'affichage communes
$errors = [];
$success = false;
$message = "";

switch ($action) {
    case 'connexion':
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $login = $_POST['login'] ?? '';
            $mdp = $_POST['motdepasse'] ?? '';
            if (verifierUtilisateur($login, $mdp)) {
                header("Location: index.php?action=liste");
                exit;
            } else {
                $message = "Identifiants incorrects.";
            }
        }
        include 'v-connexion.php';
        break;

    case 'deconnexion':
        $_SESSION = [];
        session_destroy();
        header("Location: index.php?action=connexion");
        exit;

    case 'liste':
        $groupes = getGroupes();
        include 'v-groupe.php';
        break;

    case 'ajout':
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $nom = $_POST['nom'] ?? '';
            $pays = $_POST['nomPays'] ?? '';
            $nb = intval($_POST['nombrePersonnes'] ?? 0);
            
            if ($nom == '') $errors[] = "Nom requis.";
            if ($nb <= 0) $errors[] = "Nombre invalide.";
            
            if (empty($errors)) {
                ajouterGroupe($nom, $_POST['adresse'] ?? '', $nb, $pays, isset($_POST['hebergement']) ? 1 : 0);
                $success = true;
            }
        }
        include 'v-ajouter.php';
        break;

    case 'modification':
        $id = intval($_GET['id'] ?? 0);
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            modifierGroupe($id, $_POST['nom'], $_POST['adresse'], (int)$_POST['nombrePersonnes'], $_POST['nomPays'], isset($_POST['hebergement']) ? 1 : 0);
            $success = true;
        }
        $groupe = getGroupeById($id);
        if (!$groupe) header("Location: index.php?action=liste");
        include 'v-modifier.php';
        break;

    default:
        header("Location: index.php?action=liste");
        break;
}