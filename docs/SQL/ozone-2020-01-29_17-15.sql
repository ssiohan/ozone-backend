-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 29 jan. 2020 à 17:18
-- Version du serveur :  8.0.19
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
  `id` int NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_event` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date_event` datetime NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `painfulness` smallint NOT NULL,
  `duration` smallint NOT NULL,
  `impact_societal` smallint NOT NULL,
  `impact_environmental` smallint NOT NULL,
  `user_min` smallint NOT NULL,
  `user_max` smallint NOT NULL,
  `bonus` smallint DEFAULT NULL,
  `adress` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `author_id`, `title`, `type_event`, `description`, `created_at`, `updated_at`, `date_event`, `status`, `painfulness`, `duration`, `impact_societal`, `impact_environmental`, `user_min`, `user_max`, `bonus`, `adress`, `latitude`, `longitude`) VALUES
(2, 11, 'Recyclez vos vieux objets', 'Atelier', 'Venez participer à cet atelier créatif qui vous apprendra comment recycler vos vieux objets et leur redonner vie plutôt que de les envoyer au cimetière.\r\nDécoration intérieure/extérieure', '2020-01-22 11:27:00', NULL, '2020-02-07 10:00:00', 'Planifié', 2, 3, 2, 3, 1, 15, NULL, 'Centre Administratif - Place Charles Ginésy 06470 Péone-Valberg', '45.09', '6.93'),
(3, 14, 'Event Pool Party', 'Orgie avec plein de filles', 'Event Pool Party', '2020-01-22 17:33:00', '2020-01-29 15:20:33', '2020-01-31 17:00:00', 'Planifié', 2, 3, 1, 4, 50, 100, NULL, 'In the pool with naked girls !', '45.55447', '3.45412'),
(4, 13, 'Initiation à la permaculture', 'Atelier', 'Venez découvrir comment cultiver en permaculture et produire plus avec moins d\'efforts, sur des plus petites parcelles de terrain et surtout sans produits chimiques de traitement !', '2020-01-29 10:11:00', NULL, '2020-02-15 14:00:00', 'Planifié', 3, 3, 2, 2, 5, 15, NULL, 'Eco-lieu des stages: 1, place Saint Luc Martin, 89450 Asquins', '47.48', '3.75'),
(5, 17, 'Ramassage de déchets sur \"La plage du Touquet\"', 'Acte Citoyen', 'Session de ramassage des déchets sur \"La plage du Touquet\", suite à une arrivée massive de divers matériaux plastiques, poussés par vents et marées, jusque sur le littoral.', '2020-01-29 10:23:00', NULL, '2020-03-08 10:00:00', 'Planifié', 5, 4, 4, 5, 10, 100, NULL, 'Plage du Touquet-Paris-Plage', '50.52', '1.57'),
(6, 14, 'Campagne de sensibilisation au \"Zéro déchet\"', 'Acte Citoyen', 'Venez avec nous participer à la campagne de sensibilisation au zéro déchet, afin d\'informer la population des conséquences de leur mode de consommation sur notre environnement.', '2020-01-29 10:30:00', NULL, '2020-02-22 10:00:00', 'Planifié', 3, 3, 4, 3, 10, 25, NULL, 'Centre commercial Beaugrenelle à Paris', '48.84', '2.28'),
(7, 12, 'Campagne de promotion \"oZone\"', 'Acte Citoyen', 'Venez nous aider à faire connaitre \"oZone\" à la population, présentation du concept et explications sur le fonctionnement du site via un stand au salon de l\'écologie de Montpellier.', '2020-01-29 10:37:00', NULL, '2020-03-14 09:00:00', 'Planifié', 2, 4, 4, 2, 5, 15, NULL, 'Faculté des Sciences de Montpellier, Place E. Bataillon 30, 34095 Montpellier', '43.63', '3.86'),
(8, 12, 'Information sur la pollution des cours d\'eau', 'Réunion d\'information', 'Venez rencontrer des scientifiques spécialisés dans l\'analyse de la pollution de l\'eau, ses risques pour votre santé et ses conséquences sur l\'environnement.\r\nVous serez également informé de votre responsabilité dans cette pollution des cours d\'eau qui ne cesse d\'augmenter, mais aussi des moyens à votre disposition pour limiter...', '2020-01-29 10:43:00', NULL, '2020-06-10 16:00:00', 'Planifié', 1, 2, 3, 2, 10, 50, NULL, 'Mairie, 1, Grande rue Charles-de-Gaulle 94360 Bry-sur-Marne', '48.83', '2.51'),
(9, 10, 'Les dangers des pesticides', 'Réunion d\'information', 'Venez vous informer sur les réels dangers des pesticides sur votre santé et notre environnement auprès de chercheurs qualifiés dans le domaine.\r\nIls seront présents pour répondre à vos interrogations et vous aiguiller sur les démarches à effectuer, afin de limiter votre exposition et luter contre l\'usage de plus en plus massif de ces produits chimiques à proximité des habitations...', '2020-01-29 11:07:00', NULL, '2020-08-08 15:00:00', 'Planifié', 1, 2, 2, 1, 10, 100, NULL, 'Ferme Fons des Ores Rue de la Gazelle, 63340 Antoingt', '45.50', '3.17'),
(10, 22, 'Points de vente produits alimentaires (en vrac)', 'Réunion d\'information', 'Découvrez les solutions alternatives, pour consommer des produits locaux et sans emballage et ainsi faites vivre les producteurs à proximité de chez vous tout en limitant vos déplacements et la quantité de déchets que vous générez.', '2020-01-29 11:17:00', NULL, '2020-08-21 10:30:00', 'Planifié', 1, 1, 2, 2, 5, 25, NULL, 'Ferme de la Chaux  21360 La Bussière-sur-Ouche', '47.22', '4.66');

-- --------------------------------------------------------

--
-- Structure de la table `event_user`
--

CREATE TABLE `event_user` (
  `event_id` int NOT NULL,
  `user_id` int NOT NULL,
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
  `version` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` int NOT NULL,
  `refresh_token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `refresh_token`, `username`, `valid`) VALUES
(37, '906f0a4842e24e5c9aac1da83417fce8d700ce0a41ba4091cd04d0cb3b3168c67fa48211bc23af8e353a57d946f0a7dc5201aec938663e88f5d27e5d970a653d', 'grace@machin.com', '2020-01-27 17:20:56'),
(84, '6920371fdcb5fbfc5bb0112e70c82e8767452e77eb3c148ec01127789feb3d561ecee95571ab7d8bcc6c3d2358aca8384e29de0eeef1278af44e700664f13a7c', 'admin@ozone.io', '2020-01-29 17:35:36'),
(85, '5ca8375e090eb0e440401eef3ca235d962f82f1c11c107478618bef3bf9b9dd7c0d24501be300f3c01515ab1f22e681ff5705ac47496c1ec416f71a0b9b332f2', 'admin@ozone.io', '2020-01-29 17:42:34'),
(86, 'c4ebf906bf57dd139abf56fd8d2d293a4f4e7bd158c8dbc3d8b453da95198fb022e8ef9fc31527b519bda852ef82ed5bfea0d6bddffd1a661c5e3c18b521e77b', 'admin@ozone.io', '2020-01-29 15:46:32'),
(87, '9f091f37827d00cef50c2bec3cd40fbae6f191f8d9a0b967d104826131111edd34bd49e373a391913a5db8492b58fb55abe569beecc3df50e7caf717c3c9c20e', 'admin@ozone.io', '2020-01-29 15:46:59'),
(88, '621cdd95a61c79a1572470570aa41bb080d6fad6a562e9433c54e05fdcd4f4f3170ec55eef6e0402f93908b672c1a5d5109cbe303e37567358742836863d92c3', 'admin@ozone.io', '2020-01-29 18:02:15');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(22, 'ROLE_USER'),
(23, 'ROLE_ADMIN'),
(24, 'ROLE_PARTNER'),
(25, 'ROLE_ORGANIZER');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `birthdate` datetime DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `experience` int NOT NULL,
  `credit` int NOT NULL
) ;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`, `firstname`, `lastname`, `description`, `birthdate`, `avatar`, `created_at`, `updated_at`, `status`, `experience`, `credit`) VALUES
(9, 'machin@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$JcR9ZYK9oIoxpNX3yHo5Cg$IjfrcCcGCdhsSbY6/LLsPQAo4OwEOFVLDWDt35WaqUI', 'Machin', NULL, NULL, NULL, NULL, NULL, '2020-01-22 11:27:37', '2020-01-29 15:24:26', 1, 0, 0),
(10, 'truc@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$WGJyWDJveUEwdmZVNHJEOQ$opEqVzyIpaESr1FRrdmhdziTqpSisqHEI+c1492M9Zc', 'Truc', NULL, NULL, NULL, NULL, NULL, '2020-01-22 11:27:37', NULL, 1, 0, 0),
(11, 'alphonsebrown@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$UGhiUUlXNUVxdXdTaWxNMQ$Z8+fNcAc2Ve6LEJpfWb1mJ1/FP0boMLTvy5z//+pDVk', 'AlphonseBrown', 'Alphonse', 'Brown', 'My name is AlphonseBrown', '2000-01-20 00:00:00', 'alphonse.jpg', '2020-01-22 11:53:07', '2020-01-22 13:39:38', 1, 0, 0),
(12, 'jasonburne@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$EK0gEpGuosEwSorP18M6lA$6q/kf6i1Wn8o/5RgAQfIIiORuhkdGmkpjgeNQrw+yDo', 'JasonBurne', 'Jason', 'Burne', 'My name is Jason Burne', '1925-12-25 00:00:00', 'burne.jpg', '2020-01-22 13:16:09', '2020-01-27 09:28:57', 1, 0, 0),
(13, 'dbl.bzh@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$RjYxaDF0LkFmN3VKWlFVOQ$zwz4IhyqBsmXlNpgn2G1dWZCv5sszKJF54uR/bczBSE', 'dbL', NULL, NULL, NULL, NULL, NULL, '2020-01-22 15:02:15', NULL, 1, 0, 0),
(14, 'admin@ozone.io', '[\"ROLE_ADMIN\",\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dExWaVdGSVJSalRKdzRNYQ$rztAMw7XoHLYfWmSd2WPLnEtD+Vp2OYeuN67574S2Tk', 'admin', NULL, NULL, NULL, NULL, NULL, '2020-01-22 16:45:36', NULL, 1, 0, 0),
(17, 'grace@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$KGqicd2RhNqC4yHNhAntUg$2t1xlh+258Y7IDvTCEffXSw0UY7m3ch5Jk+n/PmV/KE', 'Grace', NULL, NULL, NULL, NULL, NULL, '2020-01-27 09:29:04', NULL, 1, 0, 0),
(18, 'front@front.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$oVzBvlzOI7bd8R0W1LB6aA$f9vjquer2jJObXR9SZor02V2L+hsTjYVdHrs/sMJyf4', 'front', NULL, NULL, NULL, NULL, NULL, '2020-01-28 13:08:32', NULL, 1, 0, 0),
(19, 'helloleback@coucou.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$y2d8VKH+3aggXHbCthyIzw$IKCz6tKuBFRKhD8FF27uIiffJLkIRASipMadUGOTW/M', 'helloleback', NULL, NULL, NULL, NULL, NULL, '2020-01-28 13:30:38', NULL, 1, 0, 0),
(20, 'test@redirect.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$6w6KdQN9anXmKECPlbCsLw$GETq2R9zGeGZ0uhRONDlDMTZVi0pT8zCGzVKNCo/ows', 'testRedirect', NULL, NULL, NULL, NULL, NULL, '2020-01-28 13:33:27', NULL, 1, 0, 0),
(21, 'steeve.siohan@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$hN9uN07ENFzFWHVhIqcwPA$1rwDyi76CkSlXtupCv0UtbsRS6QSCpjnXhlkGRIWxUA', 'ssiohan', NULL, NULL, NULL, NULL, NULL, '2020-01-28 13:57:23', NULL, 1, 0, 0),
(22, 'bertrand@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$ERgCEiJ3c9y1SlarWhfjtg$BOsG/mCMY+296bDzHBibGOuzdSeKipDqoXgvxwWhLlM', 'Bebert', 'bertrand', 'g', 'My name is', '1925-12-25 00:00:00', NULL, '2020-01-29 11:06:00', '2020-01-29 13:49:07', 1, 9999, 9999),
(24, 'testderedirection2@truc.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$qkMs0FrxSTckNJ2r41FA+A$vPPUi6WE7mS962NIIxp4rASF1JJYh+UaMh5kdZExzH4', 'testderedirectionSignup', NULL, NULL, NULL, NULL, NULL, '2020-01-29 12:31:18', NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
