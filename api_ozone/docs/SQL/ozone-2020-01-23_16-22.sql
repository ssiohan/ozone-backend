-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 23 jan. 2020 à 16:22
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ozone`
--

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_event` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date_event` datetime NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `painfulness` smallint(6) NOT NULL,
  `duration` smallint(6) NOT NULL,
  `impact_societal` smallint(6) NOT NULL,
  `impact_environmental` smallint(6) NOT NULL,
  `user_min` smallint(6) NOT NULL,
  `user_max` smallint(6) NOT NULL,
  `bonus` smallint(6) DEFAULT NULL,
  `adress` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `author_id`, `title`, `type_event`, `description`, `created_at`, `updated_at`, `date_event`, `status`, `painfulness`, `duration`, `impact_societal`, `impact_environmental`, `user_min`, `user_max`, `bonus`, `adress`, `latitude`, `longitude`) VALUES
(2, 9, 'Event Test', 'Atelier', 'Un event de test', '2020-01-22 11:27:38', NULL, '2020-01-22 11:27:38', 'Planifié', 5, 4, 3, 2, 5, 20, NULL, NULL, '45.55875', '4.45654'),
(3, 14, 'Event Pool Party', 'Orgie avec plein de filles', 'Event Pool Party', '2020-01-22 17:33:26', '2020-01-22 17:36:20', '2020-01-25 17:00:00', 'Planifié', 2, 3, 1, 4, 50, 100, NULL, 'In the pool with naked girls !', '45.55447', '3.45412');

-- --------------------------------------------------------

--
-- Structure de la table `event_user`
--

CREATE TABLE `event_user` (
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `event_user`
--

INSERT INTO `event_user` (`event_id`, `user_id`, `attendance`) VALUES
(2, 9, 1);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200122100352', '2020-01-22 10:04:06'),
('20200123102329', '2020-01-23 10:23:37');

-- --------------------------------------------------------

--
-- Structure de la table `refresh_tokens`
--

CREATE TABLE `refresh_tokens` (
  `id` int(11) NOT NULL,
  `refresh_token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `refresh_token`, `username`, `valid`) VALUES
(12, '3f9a1762c513781b7e2347c42eb197c761b37b587734ad096482cba5fc0246b49d12388870e1b00e1bc0bf05e0ca7537c309eaebc7febb5b6352b2579bcc86b9', 'admin@ozone.io', '2020-01-23 14:28:11'),
(13, 'b3d0b7813da2db7d334f1e2d69ef6164fd7ea33c66d8445881c9882eaf1fefe5fc4d18f453ae0d0770a86475db26cfbda9cbfcd3959f5bbe16677e83c05bb95a', 'admin@ozone.io', '2020-01-23 14:29:35'),
(14, '14551256b01b0ba6e071c43894ae002e27f2f500da782cacfe4e666d400baf428d914b5e4b5f080e52f82b4b698fbf5ed250287d6aa85ef6986c383387309034', 'admin@ozone.io', '2020-01-23 15:18:35'),
(15, '3303cd5b93c283eced873f74ec7ccbe3c1c00cd7b813d94da39a259fa3a1b3cb4c39c4027e5632c5a7becdfbc6c416cf806af8f54c216c2b742087791c4e2427', 'jasonburne@machin.com', '2020-01-23 15:26:46');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(22, 'ROLE_USER'),
(23, 'ROLE_ADMIN'),
(24, 'ROLE_PARTNER');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `experience` int(11) NOT NULL,
  `credit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`, `firstname`, `lastname`, `description`, `birthdate`, `avatar`, `created_at`, `updated_at`, `status`, `experience`, `credit`) VALUES
(9, 'machin@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$bGdRRmZZcHpYVHlmYnI2UQ$fDalmM1eP49xY1jtx1PQfqbreT3/2L46K2pj9I4UK54', 'Machin', NULL, NULL, NULL, NULL, NULL, '2020-01-22 11:27:37', NULL, 1, 0, 0),
(10, 'truc@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$WGJyWDJveUEwdmZVNHJEOQ$opEqVzyIpaESr1FRrdmhdziTqpSisqHEI+c1492M9Zc', 'Truc', NULL, NULL, NULL, NULL, NULL, '2020-01-22 11:27:37', NULL, 1, 0, 0),
(11, 'alphonsebrown@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$UGhiUUlXNUVxdXdTaWxNMQ$Z8+fNcAc2Ve6LEJpfWb1mJ1/FP0boMLTvy5z//+pDVk', 'AlphonseBrown', 'Alphonse', 'Brown', 'My name is AlphonseBrown', '2000-01-20 00:00:00', 'alphonse.jpg', '2020-01-22 11:53:07', '2020-01-22 13:39:38', 1, 0, 0),
(12, 'jasonburne@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$RlFTaENJazFwdlBYYVlJNQ$jbm2St2ay9u3QyL1AkTEMdWlXpsmwtO17K9wzHLKh4c', 'JasonBurne', 'Jason', 'Burne', 'My name is Jason Burne', '1925-12-25 00:00:00', 'burne.jpg', '2020-01-22 13:16:09', '2020-01-22 17:37:38', 1, 0, 0),
(13, 'dbl.bzh@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$RjYxaDF0LkFmN3VKWlFVOQ$zwz4IhyqBsmXlNpgn2G1dWZCv5sszKJF54uR/bczBSE', 'dbL', NULL, NULL, NULL, NULL, NULL, '2020-01-22 15:02:15', NULL, 1, 0, 0),
(14, 'admin@ozone.io', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$dExWaVdGSVJSalRKdzRNYQ$rztAMw7XoHLYfWmSd2WPLnEtD+Vp2OYeuN67574S2Tk', 'admin', NULL, NULL, NULL, NULL, NULL, '2020-01-22 16:45:36', NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(9, 22),
(9, 23),
(10, 24),
(11, 22),
(12, 22);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3BAE0AA7F675F31B` (`author_id`);

--
-- Index pour la table `event_user`
--
ALTER TABLE `event_user`
  ADD PRIMARY KEY (`event_id`,`user_id`),
  ADD KEY `IDX_92589AE271F7E88B` (`event_id`),
  ADD KEY `IDX_92589AE2A76ED395` (`user_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9BACE7E1C74F2195` (`refresh_token`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_8D93D64986CC499D` (`pseudo`);

--
-- Index pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `IDX_2DE8C6A3A76ED395` (`user_id`),
  ADD KEY `IDX_2DE8C6A3D60322AC` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK_3BAE0AA7F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `event_user`
--
ALTER TABLE `event_user`
  ADD CONSTRAINT `FK_92589AE271F7E88B` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `FK_92589AE2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK_2DE8C6A3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_2DE8C6A3D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
