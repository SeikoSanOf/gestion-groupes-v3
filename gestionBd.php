<?php

// gestion de la BdD - avec requêtes préparées
session_start();

// Configuration de la base de données
$host = "localhost"; 
$db = "festival";
$user = "root";
$pass ="";


try {
    $dsn = "mysql:host=$host;dbname=$db;charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    error_log($e->getMessage()); // Log l'erreur pour les administrateurs
    die("Erreur connexion : ");
}

// Vérifie utilisateurlogin et mdp utilisateur 
function verifierUtilisateur($login, $motdepasse)
{
    global $pdo;
    // Requête préparée pour éviter injection SQL
    $sql = "SELECT * FROM utilisateur WHERE  login = :login LIMIT 1";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':login', $login);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    // Vérifie mot de passe
    if ($user && password_verify($motdepasse, $user['mdp'])) 
        {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['login'] = $user['login'];
        session_regenerate_id(true);
        return true;
    }
    return false;
}



/**
 * Récupère tous les groupes triés par ordre alphabétique
 */
function getGroupes()
{
    global $pdo;
    return $pdo->query("SELECT * FROM groupe ORDER BY nom")->fetchAll(PDO::FETCH_ASSOC);
}

function getGroupeById($id) {
    global $pdo;
    $sql = "SELECT * FROM groupe WHERE id = :id LIMIT 1";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function ajouterGroupe( $nom,$adresse, $nb, $pays, $hebergement)
{
    global $pdo;
    $sql = "INSERT INTO groupe ( nom, adressePostale, nombrePersonnes, nomPays, hebergement)
            VALUES (:nom, :adresse, :nb, :pays, :hebergement)";
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nom', $nom);
        $stmt->bindParam(':adresse', $adresse);
        $stmt->bindParam(':nb', $nb);
        $stmt->bindParam(':pays', $pays);
        $stmt->bindParam(':hebergement', $hebergement);
        $stmt->execute();
    } catch (PDOException $e) {
        error_log("Erreur ajout groupe : " . $e->getMessage());
    }
   
}

function modifierGroupe( $id,$nom, $adresse, $nb, $pays, $hebergement) {
    global $pdo;
    $sql = "UPDATE groupe
            SET nom=:nom, adressePostale=:adresse, nombrePersonnes=:nb, nomPays=:pays, hebergement=:hebergement
            WHERE id=:id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->bindParam(':nom', $nom);
    $stmt->bindParam(':adresse', $adresse);
    $stmt->bindParam(':nb', $nb);
    $stmt->bindParam(':pays', $pays);
    $stmt->bindParam(':hebergement', $hebergement);
    $stmt->execute();
}
