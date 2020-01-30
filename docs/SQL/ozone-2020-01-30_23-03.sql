-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 30 jan. 2020 à 23:02
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
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `author_id`, `title`, `type_event`, `description`, `created_at`, `updated_at`, `date_event`, `status`, `painfulness`, `duration`, `impact_societal`, `impact_environmental`, `user_min`, `user_max`, `bonus`, `adress`, `latitude`, `longitude`, `city`, `image`) VALUES
(2, 11, 'Recyclez vos vieux objets', 'Atelier', 'Venez participer à cet atelier créatif qui vous apprendra comment recycler vos vieux objets et leur redonner vie plutôt que de les envoyer au cimetière.\r\nDécoration intérieure/extérieure', '2020-01-22 11:27:00', NULL, '2020-02-07 10:00:00', 'Planifié', 2, 3, 2, 3, 1, 15, NULL, 'Centre Administratif - Place Charles Ginésy 06470 Péone-Valberg', '45.09', '6.93', 'Charles Ginésy', NULL),
(4, 13, 'Initiation à la permaculture', 'Atelier', 'Venez découvrir comment cultiver en permaculture et produire plus avec moins d\'efforts, sur des plus petites parcelles de terrain et surtout sans produits chimiques de traitement !', '2020-01-29 10:11:00', NULL, '2020-02-15 14:00:00', 'Planifié', 3, 3, 2, 2, 5, 15, NULL, 'Eco-lieu des stages: 1, place Saint Luc Martin, 89450 Asquins', '47.48', '3.75', 'Saint Luc Martin', NULL),
(5, 17, 'Ramassage de déchets sur \"La plage du Touquet\"', 'Acte Citoyen', 'Session de ramassage des déchets sur \"La plage du Touquet\", suite à une arrivée massive de divers matériaux plastiques, poussés par vents et marées, jusque sur le littoral.', '2020-01-29 10:23:00', NULL, '2020-03-08 10:00:00', 'Planifié', 5, 4, 4, 5, 10, 100, NULL, 'Plage du Touquet-Paris-Plage', '50.52', '1.57', 'Le Touquet', NULL),
(6, 14, 'Campagne de sensibilisation au \"Zéro déchet\"', 'Acte Citoyen', 'Venez avec nous participer à la campagne de sensibilisation au zéro déchet, afin d\'informer la population des conséquences de leur mode de consommation sur notre environnement.', '2020-01-29 10:30:00', NULL, '2020-02-22 10:00:00', 'Planifié', 3, 3, 4, 3, 10, 25, NULL, 'Centre commercial Beaugrenelle à Paris', '48.84', '2.28', 'Paris', NULL),
(7, 12, 'Campagne de promotion \"oZone\"', 'Acte Citoyen', 'Venez nous aider à faire connaitre \"oZone\" à la population, présentation du concept et explications sur le fonctionnement du site via un stand au salon de l\'écologie de Montpellier.', '2020-01-29 10:37:00', '2020-01-30 15:23:02', '2020-03-14 09:00:00', 'Planifié', 2, 4, 4, 2, 5, 15, NULL, 'Faculté des Sciences de Montpellier, Place E. Bataillon 30, 34095 Montpellier', '43.63', '3.86', 'Montpellier', 'trees.png'),
(8, 12, 'Information sur la pollution des cours d\'eau', 'Réunion d\'information', 'Venez rencontrer des scientifiques spécialisés dans l\'analyse de la pollution de l\'eau, ses risques pour votre santé et ses conséquences sur l\'environnement.\r\nVous serez également informé de votre responsabilité dans cette pollution des cours d\'eau qui ne cesse d\'augmenter, mais aussi des moyens à votre disposition pour limiter...', '2020-01-29 10:43:00', '2020-01-30 15:22:29', '2020-06-10 16:00:00', 'Planifié', 1, 2, 3, 2, 10, 50, NULL, 'Mairie, 1, Grande rue Charles-de-Gaulle 94360 Bry-sur-Marne', '48.83', '2.51', 'Bry-sur-Marne', 'fresh.png'),
(9, 10, 'Les dangers des pesticides', 'Réunion d\'information', 'Venez vous informer sur les réels dangers des pesticides sur votre santé et notre environnement auprès de chercheurs qualifiés dans le domaine.\r\nIls seront présents pour répondre à vos interrogations et vous aiguiller sur les démarches à effectuer, afin de limiter votre exposition et luter contre l\'usage de plus en plus massif de ces produits chimiques à proximité des habitations...', '2020-01-29 11:07:00', '2020-01-30 15:20:42', '2020-08-08 15:00:00', 'Planifié', 1, 2, 2, 1, 10, 100, NULL, 'Ferme Fons des Ores Rue de la Gazelle, 63340 Antoingt', '45.50', '3.17', 'Antoingt', 'breath.png'),
(12, 22, 'Points de vente produits alimentaires (en vrac)', 'Réunion d\'information', 'Découvrez les solutions alternatives, pour consommer des produits locaux et sans emballage et ainsi faites vivre les producteurs à proximité de chez vous tout en limitant vos déplacements et la quantité de déchets que vous générez.', '2020-01-30 22:36:57', '2020-01-30 22:36:57', '2020-06-14 14:00:00', 'Planifié', 1, 1, 2, 2, 5, 25, NULL, 'Ferme de la Chaux  21360', '47.22', '4.66', 'La Bussière-sur-Ouche', 'rsz-saxe-breteuil-620x413-5e334c79bf5bc601327360.jpg'),
(13, 12, 'Fabrication de produit ménagers', 'Atelier', 'Venez avec nous apprendre à fabriquer vos propres produits ménagers afin de respecter l\'environnement, mais aussi l\'air que vous respirez dans votre foyer !', '2020-01-30 22:58:13', '2020-01-30 22:58:13', '2020-03-30 15:00:00', 'Planifié', 2, 2, 2, 2, 5, 20, NULL, '1, Rue Jean Jaurès 29390', '48.02', '-3.69', 'Scaër', 'produits-menagers-5e3351759acb8918791441.jpeg');

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
('20200123102329', '2020-01-23 10:23:37'),
('20200129224855', '2020-01-29 22:49:11'),
('20200129225907', '2020-01-29 22:59:13'),
('20200129230012', '2020-01-29 23:00:16'),
('20200130090014', '2020-01-30 09:00:21'),
('20200130130755', '2020-01-30 13:08:02');

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
(93, 'f80fae0f5da1754e5beef6fe0a40b694a3ca42d149ce592e524e1793f40a13c9059902e658262826db2f1b0db463970caf911bb44f4d50a13d154bd5bb308d44', 'admin@ozone.io', '2020-01-30 12:41:02');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`, `label`) VALUES
(22, 'ROLE_USER', 'Utilisateur'),
(23, 'ROLE_ADMIN', 'Administrateur'),
(24, 'ROLE_PARTNER', 'Partenaire'),
(25, 'ROLE_ORGANIZER', 'Organisateur');

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
(9, 'machin@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$JcR9ZYK9oIoxpNX3yHo5Cg$IjfrcCcGCdhsSbY6/LLsPQAo4OwEOFVLDWDt35WaqUI', 'Machin', NULL, NULL, NULL, NULL, NULL, '2020-01-22 11:27:37', '2020-01-29 15:24:26', 1, 0, 0),
(10, 'truc@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$WGJyWDJveUEwdmZVNHJEOQ$opEqVzyIpaESr1FRrdmhdziTqpSisqHEI+c1492M9Zc', 'Truc', NULL, NULL, NULL, NULL, NULL, '2020-01-22 11:27:37', NULL, 1, 0, 0),
(11, 'alphonsebrown@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$UGhiUUlXNUVxdXdTaWxNMQ$Z8+fNcAc2Ve6LEJpfWb1mJ1/FP0boMLTvy5z//+pDVk', 'AlphonseBrown', 'Alphonse', 'Brown', 'My name is AlphonseBrown', NULL, 'alphonsebrown-5e331496280e8543832675.jpeg', '2020-01-22 11:53:07', '2020-01-30 18:38:30', 1, 0, 0),
(12, 'jasonburne@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$EK0gEpGuosEwSorP18M6lA$6q/kf6i1Wn8o/5RgAQfIIiORuhkdGmkpjgeNQrw+yDo', 'JasonBurne', 'Jason', 'Burne', 'My name is Jason Burne', NULL, 'baracktocat-5e331426c60bb069307093.jpg', '2020-01-22 13:16:09', '2020-01-30 18:36:38', 1, 0, 0),
(13, 'dbl.bzh@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$RjYxaDF0LkFmN3VKWlFVOQ$zwz4IhyqBsmXlNpgn2G1dWZCv5sszKJF54uR/bczBSE', 'dbL-BzH', 'Da Bep', 'Lec\'h', 'Breizh Atao !', NULL, 'stormtroopocat-5e3314dba60a6086968228.png', '2020-01-22 15:02:15', '2020-01-30 18:39:39', 1, 0, 0),
(14, 'admin@ozone.io', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$dExWaVdGSVJSalRKdzRNYQ$rztAMw7XoHLYfWmSd2WPLnEtD+Vp2OYeuN67574S2Tk', 'BigBoss', NULL, NULL, NULL, NULL, NULL, '2020-01-22 16:45:36', NULL, 1, 0, 0),
(17, 'grace@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$KGqicd2RhNqC4yHNhAntUg$2t1xlh+258Y7IDvTCEffXSw0UY7m3ch5Jk+n/PmV/KE', 'Grace', NULL, NULL, NULL, NULL, NULL, '2020-01-27 09:29:04', NULL, 1, 0, 0),
(18, 'front@front.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$oVzBvlzOI7bd8R0W1LB6aA$f9vjquer2jJObXR9SZor02V2L+hsTjYVdHrs/sMJyf4', 'front', NULL, NULL, NULL, NULL, NULL, '2020-01-28 13:08:32', NULL, 1, 0, 0),
(19, 'helloleback@coucou.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$y2d8VKH+3aggXHbCthyIzw$IKCz6tKuBFRKhD8FF27uIiffJLkIRASipMadUGOTW/M', 'helloleback', NULL, NULL, NULL, NULL, NULL, '2020-01-28 13:30:38', NULL, 1, 0, 0),
(20, 'test@redirect.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$6w6KdQN9anXmKECPlbCsLw$GETq2R9zGeGZ0uhRONDlDMTZVi0pT8zCGzVKNCo/ows', 'testRedirect', NULL, NULL, NULL, NULL, NULL, '2020-01-28 13:33:27', NULL, 1, 0, 0),
(21, 'steeve.siohan@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$hN9uN07ENFzFWHVhIqcwPA$1rwDyi76CkSlXtupCv0UtbsRS6QSCpjnXhlkGRIWxUA', 'ssiohan', NULL, NULL, NULL, NULL, NULL, '2020-01-28 13:57:23', NULL, 1, 0, 0),
(22, 'bertrand@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$ERgCEiJ3c9y1SlarWhfjtg$BOsG/mCMY+296bDzHBibGOuzdSeKipDqoXgvxwWhLlM', 'Bebert', 'bertrand', 'g', NULL, '2015-12-25 00:00:00', 'save-the-planet-5e33140319b7f679452510.jpg', '2020-01-29 11:06:00', '2020-01-30 18:36:03', 1, 9999, 9999),
(24, 'testderedirection2@truc.fr', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$qkMs0FrxSTckNJ2r41FA+A$vPPUi6WE7mS962NIIxp4rASF1JJYh+UaMh5kdZExzH4', 'testderedirectionSignup', NULL, NULL, NULL, NULL, NULL, '2020-01-29 12:31:18', NULL, 1, 0, 0);

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
(12, 22),
(17, 22),
(18, 22),
(19, 22),
(20, 22),
(21, 22),
(24, 22);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
