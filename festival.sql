-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 11 sep. 2025 à 11:26
-- Version du serveur : 8.0.39
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `festival`
--

-- --------------------------------------------------------

--
-- Structure de la table `attribution`
--

CREATE TABLE `attribution` (
  `idEtab` int NOT NULL,
  `idCategorie` int NOT NULL,
  `idGroupe` int NOT NULL,
  `nombreChambres` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `attribution`
--

INSERT INTO `attribution` (`idEtab`, `idCategorie`, `idGroupe`, `nombreChambres`) VALUES
(1, 2, 12, 4),
(1, 4, 12, 3),
(2, 2, 2, 2),
(2, 4, 2, 2),
(3, 2, 3, 3),
(3, 4, 3, 2),
(3, 2, 11, 3),
(3, 4, 11, 2),
(4, 2, 13, 3),
(4, 4, 13, 3);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int NOT NULL,
  `capacite` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `capacite`) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 6),
(5, 8),
(6, 12);

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `id` int NOT NULL,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresseRue` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codePostal` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresseElectronique` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idType` int NOT NULL,
  `idResponsable` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`id`, `nom`, `adresseRue`, `codePostal`, `ville`, `tel`, `adresseElectronique`, `idType`, `idResponsable`) VALUES
(1, 'Lycée Jacques Cartier', '31 rue de la Découverte', '35400', 'Saint-Malo', '02.99.82.15.20', 'proviseur@lycee-cartier.fr', 2, 1),
(2, 'Collège Surcouf', '12 avenue des Corsaires', '35400', 'Saint-Malo', '02.99.56.73.41', 'principal@college-surcouf.fr', 1, 2),
(3, 'Centre de Rencontres Internationales', '37 avenue du Révérend Père Umbricht', '35400', 'Saint-Malo', '02.99.40.29.80', 'direction@cri-saintmalo.com', 5, 3),
(4, 'Lycée Maupertuis', '3 rue de la Rabine', '35400', 'Saint-Malo', '02.99.82.78.18', 'contact@lycee-maupertuis.fr', 2, 4),
(5, 'Collège La Providence', '2 rue Lamennais', '35400', 'Saint-Malo', '02.99.46.01.24', 'secretariat@providence-saintmalo.fr', 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id` int NOT NULL,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adressePostale` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombrePersonnes` int NOT NULL,
  `nomPays` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hebergement` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nom`, `adressePostale`, `nombrePersonnes`, `nomPays`, `hebergement`) VALUES
(1, 'Bagad Kemper', '15 rue de la Mer, 29000 Quimper', 25, 'France - Bretagne', 0),
(2, 'Cercle Celtique Bro Ereg', '8 place du Marché, 35120 Dol-de-Bretagne', 18, 'France - Bretagne', 1),
(3, 'Bagad Sant-Brieg', '42 avenue de la Libération, 22000 Saint-Brieuc', 22, 'France - Bretagne', 1),
(4, 'Cercle An Oriant', '12 cours de Chazelles, 56100 Lorient', 16, 'France - Bretagne', 0),
(5, 'Bagad Roazhon', '5 rue Saint-Malo, 35000 Rennes', 28, 'France - Bretagne', 1),
(6, 'Les Farandoleurs de Provence', '23 cours Mirabeau, 13100 Aix-en-Provence', 20, 'France - PACA', 1),
(7, 'Ensemble Folklorique Alsacien', '14 rue des Vignerons, 68000 Colmar', 24, 'France - Alsace', 1),
(8, 'Les Bourrées du Berry', '7 place Jean Jaurès, 18000 Bourges', 15, 'France - Centre-Val de Loire', 1),
(9, 'Danseurs de Gascogne', '31 rue de la République, 32000 Auch', 19, 'France - Occitanie', 1),
(10, 'Groupe Savoyard Les Diablerets', '18 route des Alpes, 74000 Annecy', 17, 'France - Auvergne-Rhône-Alpes', 1),
(11, 'Celtic Spirit', 'Dublin Road 45, Dublin', 21, 'Irlande', 1),
(12, 'Atlas Mountains Folk', 'Avenue Mohammed V 67, Rabat', 20, 'Maroc', 1),
(13, 'Highland Dancers', '12 Royal Mile, Edinburgh EH1 2PB', 26, 'Écosse', 1),
(14, 'Ensemble Flamenca Sevilla', 'Calle de la Esperanza 8, 41004 Sevilla', 23, 'Espagne', 1),
(15, 'Grupo Folclórico do Minho', 'Rua da Liberdade 15, 4700-314 Braga', 20, 'Portugal', 1),
(16, 'Tarantella Napoletana', 'Via Chiaia 42, 80132 Napoli', 18, 'Italie', 1),
(17, 'Moravian Folk Ensemble', 'Masarykova 123, 602 00 Brno', 22, 'République Tchèque', 1),
(18, 'Mazowsze Dance Company', 'ul. Krakowskie Przedmieście 64, 00-322 Warszawa', 30, 'Pologne', 1),
(19, 'Bulgarian Rose Dancers', 'бул. Витоша 15, 1000 София', 25, 'Bulgarie', 1),
(20, 'Csárdás Budapest', 'Váci utca 45, 1056 Budapest', 19, 'Hongrie', 1),
(21, 'Folklore Românesc', 'Calea Victoriei 78, 010071 București', 27, 'Roumanie', 1),
(22, 'Balkan Harmony', 'Knez Mihailova 32, 11000 Beograd', 24, 'Serbie', 1),
(23, 'Ukrainian Hopak', 'вул. Хрещатик 22, 01001 Київ', 28, 'Ukraine', 1),
(24, 'Anatolian Dancers', 'İstiklal Caddesi 85, 34435 İstanbul', 26, 'Turquie', 1),
(25, 'Gnawa Spirit', '73 Rue Ibn Khaldoun , Essaouira', 11, 'Maroc', 1),
(26, 'Pharaohs Heritage', 'Tahrir Square 12, Cairo', 22, 'Égypte', 1),
(27, 'Sahara Nomads', 'Avenue de la Liberté 89, Bamako', 16, 'Mali', 1),
(28, 'Ethiopian Highlands', 'Bole Road 234, Addis Ababa', 21, 'Éthiopie', 1),
(29, 'Kilimanjaro Voices', 'Uhuru Highway 45, Nairobi', 18, 'Kenya', 1),
(30, 'Samba Rio Grande', 'Rua da Carioca 123, Rio de Janeiro RJ', 24, 'Brésil', 1),
(31, 'Tango Porteño', 'Av. Corrientes 1234, Buenos Aires', 15, 'Argentine', 1),
(32, 'Andean Winds', 'Plaza Murillo 67, La Paz', 19, 'Bolivie', 1);

-- --------------------------------------------------------

--
-- Structure de la table `propose`
--

CREATE TABLE `propose` (
  `idEtab` int NOT NULL,
  `idCategorie` int NOT NULL,
  `nombreChambres` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `propose`
--

INSERT INTO `propose` (`idEtab`, `idCategorie`, `nombreChambres`) VALUES
(1, 1, 10),
(1, 2, 15),
(1, 4, 8),
(2, 2, 12),
(2, 4, 6),
(2, 6, 4),
(3, 1, 5),
(3, 2, 20),
(3, 4, 12),
(3, 6, 8),
(4, 1, 8),
(4, 2, 18),
(4, 4, 10),
(5, 2, 10),
(5, 4, 5),
(5, 6, 3);

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

CREATE TABLE `responsable` (
  `idResponsable` int NOT NULL,
  `civiliteResponsable` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomResponsable` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenomResponsable` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `responsable`
--

INSERT INTO `responsable` (`idResponsable`, `civiliteResponsable`, `nomResponsable`, `prenomResponsable`) VALUES
(1, 'M.', 'LEROUX', 'Pierre'),
(2, 'Mme', 'MARTIN', 'Sophie'),
(3, 'M.', 'DUBOIS', 'Laurent'),
(4, 'Mme', 'BERNARD', 'Claire'),
(5, 'M.', 'MOREAU', 'Jean');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `idType` int NOT NULL,
  `libelle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`idType`, `libelle`) VALUES
(1, 'Collège'),
(2, 'Lycée'),
(3, 'Foyer JT'),
(4, 'Auberge de jeunesses'),
(5, 'Centre de formation');

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `mdp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `mdp`) VALUES
(1, 'admin', '$2y$10$n/PUZAWTPlZVzP9Nsz0NDOVubXOeeiDV8hWgVxcBaJwDrgWgWzOT.'),
(2, 'béatrice', '$2y$10$vXelW.RW9Bzx6JrgzycHxuUtfIDseV2hZ64KVX/gkTZhPOOS8N7Ce'),
(3, 'claude', '$2y$10$eiVafvbTrQpQmrDQNi/7fOJTMmo1CQUaqTU/mE00XQ5d6MgUiG.Y.');


--
-- Index pour les tables déchargées
--

--
-- Index pour la table `attribution`
--
ALTER TABLE `attribution`
  ADD PRIMARY KEY (`idEtab`,`idGroupe`,`idCategorie`),
  ADD KEY `idEtab` (`idEtab`),
  ADD KEY `idTypeChambre` (`idCategorie`),
  ADD KEY `idGroupe` (`idGroupe`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idResponsable` (`idResponsable`),
  ADD KEY `idResponsable_2` (`idResponsable`),
  ADD KEY `idCategorie` (`idType`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `propose`
--
ALTER TABLE `propose`
  ADD PRIMARY KEY (`idEtab`,`idCategorie`),
  ADD KEY `idEtab` (`idEtab`),
  ADD KEY `idTypeChambre` (`idCategorie`);

--
-- Index pour la table `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`idResponsable`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`idType`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);


--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `responsable`
--
ALTER TABLE `responsable`
  MODIFY `idResponsable` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `idType` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `attribution`
--
ALTER TABLE `attribution`
  ADD CONSTRAINT `attribution_ibfk_1` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`id`),
  ADD CONSTRAINT `attribution_ibfk_3` FOREIGN KEY (`idGroupe`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `attribution_ibfk_4` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `etablissement_ibfk_1` FOREIGN KEY (`idResponsable`) REFERENCES `responsable` (`idResponsable`),
  ADD CONSTRAINT `etablissement_ibfk_2` FOREIGN KEY (`idType`) REFERENCES `type` (`idType`);

--
-- Contraintes pour la table `propose`
--
ALTER TABLE `propose`
  ADD CONSTRAINT `propose_ibfk_1` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`id`),
  ADD CONSTRAINT `propose_ibfk_2` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`id`);
-- --------------------------------------------------------


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
