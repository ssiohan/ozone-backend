-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 05 fév. 2020 à 01:06
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
  `longitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'event-default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `author_id`, `title`, `type_event`, `description`, `created_at`, `updated_at`, `date_event`, `status`, `painfulness`, `duration`, `impact_societal`, `impact_environmental`, `user_min`, `user_max`, `bonus`, `adress`, `latitude`, `longitude`, `city`, `image`) VALUES
(2, 11, 'Recyclez vos vieux objets', 'Atelier', 'Venez participer à cet atelier créatif qui vous apprendra comment recycler vos vieux objets et leur redonner vie plutôt que de les envoyer au cimetière.\r\nDécoration intérieure/extérieure', '2020-01-22 11:27:00', '2020-02-03 11:28:46', '2020-02-07 10:00:00', 'Planifié', 2, 3, 2, 3, 1, 15, NULL, 'Centre Administratif - Place Charles Ginésy 06470 Péone-Valberg', '45.09', '6.93', 'Charles Ginésy', 'recyclage-9791029500596-0-5e37f5de29cf2736395598.jpg'),
(4, 13, 'Initiation à la permaculture', 'Atelier', 'Venez découvrir comment cultiver en permaculture et produire plus avec moins d\'efforts, sur des plus petites parcelles de terrain et surtout sans produits chimiques de traitement !', '2020-01-29 10:11:00', '2020-02-03 11:25:42', '2020-02-15 14:00:00', 'Planifié', 3, 3, 2, 2, 5, 15, NULL, 'Eco-lieu des stages: 1, place Saint Luc Martin, 89450 Asquins', '47.48', '3.75', 'Saint Luc Martin', 'butte-permacole-5e37f526ec305794104531.jpg'),
(5, 17, 'Ramassage déchets \"La plage du Touquet\"', 'Acte Citoyen', 'Session de ramassage des déchets sur \"La plage du Touquet\", suite à une arrivée massive de divers matériaux plastiques, poussés par vents et marées, jusque sur le littoral.', '2020-01-29 10:23:00', '2020-02-03 11:24:13', '2020-03-08 10:00:00', 'Planifié', 5, 4, 4, 5, 10, 100, NULL, 'Plage du Touquet-Paris-Plage', '50.52', '1.57', 'Le Touquet', 'waste-dump-beach-2-5e37f4cdafadf598221715.jpg'),
(6, 14, 'Campagne de sensibilisation au \"Zéro déchet\"', 'Acte Citoyen', 'Venez avec nous participer à la campagne de sensibilisation au zéro déchet, afin d\'informer la population des conséquences de leur mode de consommation sur notre environnement.', '2020-01-29 10:30:00', '2020-02-03 11:23:53', '2020-02-22 10:00:00', 'Planifié', 3, 3, 4, 3, 10, 25, NULL, 'Centre commercial Beaugrenelle à Paris', '48.84', '2.28', 'Paris', 'objzerodech-5e37f4b9ef3ed121055384.jpg'),
(7, 12, 'Campagne de promotion \"oZone\"', 'Acte Citoyen', 'Venez nous aider à faire connaitre \"oZone\" à la population, présentation du concept et explications sur le fonctionnement du site via un stand au salon de l\'écologie de Montpellier.', '2020-01-29 10:37:00', '2020-02-03 11:22:43', '2020-03-14 09:00:00', 'Planifié', 2, 4, 4, 2, 5, 15, NULL, 'Faculté des Sciences de Montpellier, Place E. Bataillon 30, 34095 Montpellier', '43.63', '3.86', 'Montpellier', 'logo-sans-fond-5e37f473bad01395020053.png'),
(8, 12, 'Information sur la pollution des cours d\'eau', 'Réunion d\'information', 'Venez rencontrer des scientifiques spécialisés dans l\'analyse de la pollution de l\'eau, ses risques pour votre santé et ses conséquences sur l\'environnement.\r\nVous serez également informé de votre responsabilité dans cette pollution des cours d\'eau qui ne cesse d\'augmenter, mais aussi des moyens à votre disposition pour limiter...', '2020-01-29 10:43:00', '2020-02-03 11:21:58', '2020-06-10 16:00:00', 'Planifié', 1, 2, 3, 2, 10, 50, NULL, 'Mairie, 1, Grande rue Charles-de-Gaulle 94360 Bry-sur-Marne', '48.83', '2.51', 'Bry-sur-Marne', '065-lg-copie-5e37f446eb6b1557023802.jpg'),
(9, 10, 'Les dangers des pesticides', 'Réunion d\'information', 'Venez vous informer sur les réels dangers des pesticides sur votre santé et notre environnement auprès de chercheurs qualifiés dans le domaine.\r\nIls seront présents pour répondre à vos interrogations et vous aiguiller sur les démarches à effectuer, afin de limiter votre exposition et luter contre l\'usage de plus en plus massif de ces produits chimiques à proximité des habitations...', '2020-01-29 11:07:00', '2020-02-03 11:18:08', '2020-08-08 15:00:00', 'Planifié', 1, 2, 2, 1, 10, 100, NULL, 'Ferme Fons des Ores Rue de la Gazelle, 63340 Antoingt', '45.50', '3.17', 'Antoingt', 'pesticides-risques-5e37f360ba501591832707.jpg'),
(12, 22, 'Points de vente produits alimentaires (en vrac)', 'Réunion d\'information', 'Découvrez les solutions alternatives, pour consommer des produits locaux et sans emballage et ainsi faites vivre les producteurs à proximité de chez vous tout en limitant vos déplacements et la quantité de déchets que vous générez.', '2020-01-30 22:36:57', '2020-02-03 11:16:52', '2020-06-14 14:00:00', 'Planifié', 1, 1, 2, 2, 5, 25, NULL, 'Ferme de la Chaux  21360', '47.22', '4.66', 'La Bussière-sur-Ouche', 'rsz-saxe-breteuil-620x413-5e37f314ec2d0825052897.jpg'),
(13, 12, 'Fabrication de produit ménagers', 'Atelier', 'Venez avec nous apprendre à fabriquer vos propres produits ménagers afin de respecter l\'environnement, mais aussi l\'air que vous respirez dans votre foyer !', '2020-01-30 22:58:13', '2020-02-03 11:15:19', '2020-03-30 15:00:00', 'Planifié', 2, 2, 2, 2, 5, 20, NULL, '1, Rue Jean Jaurès 29390', '48.02', '-3.69', 'Scaër', 'produits-menagers-5e37f2b72dfff241672393.jpeg');

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
(2, 9, 1),
(2, 17, 1),
(4, 9, 1),
(4, 10, 1),
(5, 14, 1),
(6, 10, 1),
(6, 14, 1),
(6, 17, 1),
(7, 11, 1),
(7, 13, 1),
(7, 22, 1),
(8, 14, 1),
(9, 12, 1),
(9, 17, 1),
(12, 14, 1);

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
('20200123102329', '2020-01-23 10:23:37'),
('20200129224855', '2020-01-29 22:49:11'),
('20200129225907', '2020-01-29 22:59:13'),
('20200129230012', '2020-01-29 23:00:16'),
('20200130090014', '2020-01-30 09:00:21'),
('20200130130755', '2020-01-30 13:08:02'),
('20200201194547', '2020-02-01 19:48:01');

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
(166, '34ed6c7cfa67c6c3001521331477776d86836ed126f5e293515906deb53c897ba8680923e20f1cd0b6b6b1933c09787c02d819ef93f4321d8bf681493ce3917c', 'bertrand@machin.com', '2020-02-04 14:06:06'),
(167, '6a6022476acc4d1c00234d6d797323b0771963202a39b79f08dbe7bd48ecf49d991fbbc853a0856307874742222872be3186a75cf784e51c05c8d192083990c0', 'dbl.bzh@gmail.com', '2020-02-04 14:33:58'),
(168, '8d90c214052444df10023a3e3d5e266ca88149d51daf02c3561a8b84b9a3d10b4cb30fa90d589bd6f0f54bd2e57eee5fdb7c7eb281e3d464a7b642e252609774', 'grace@machin.com', '2020-02-04 14:35:12'),
(169, 'a4619940f9648d172408a8b80a8484710c784cd6f314c21d7bba17eaddce8f8920e2cc18a5401dd48a3e47d32df35730024f91229452adcfbb49c2085629c6d8', 'grace@machin.com', '2020-02-04 19:52:38'),
(170, '0f9143c41e295ab6de88728c5eea573674bd42468edf1925d5aecaa9c3ae5c7ce631be1d7031c8c557d6a6f68d9bce3368bbae79d8591930adb708db2623bc9a', 'grace@machin.com', '2020-02-04 20:47:17'),
(171, '956e96fe0495bf28f01ae1376836673971f1ae98cfddc32c38f4e2ffdc46b3cd72e42bde524326f8e07f336e1da8a8b9d445091568f68d109b99cded08869080', 'dbl.bzh@gmail.com', '2020-02-04 20:58:12'),
(172, '12288f632fd49a8cd1e9d014eb4f4a387247ff439d64731c973e1aed55d69d2396b9c55e332d47e4df549057c546ce793e994acd2c638071034d6694cee8c711', 'dbl.bzh@gmail.com', '2020-02-04 21:17:24'),
(173, 'd87551ce47c22c83957a0a844c6f7968de15a92b11472191ade352ad075a038d487159fa6e44bef75103f66fc81d8e33e0810cbf7ff99145e369b655769f49a7', 'dbl.bzh@gmail.com', '2020-02-04 21:21:39'),
(174, '56af4eed04796e18c5703014bb4b23f6a2bedad1a1a9b70d7bd512a946991a96c5a73b65260b36205e3d3a991af8c9393321d06b8a7f608fd0ddff38d7a766b6', 'grace@machin.com', '2020-02-04 21:36:56'),
(175, 'b93a966b73ec3f92af0523d6e08e24a064e75f078ae4897bb2a654060b21a54e06d141272157798b18580da557ba5047734fd87291dc6d27aa6c957013069791', 'dbl.bzh@gmail.com', '2020-02-04 23:20:05'),
(176, '5d03d3220c5df533ef54ab0811e7d608047f833e0784ff4687b106e6e6beff174a53a22ab87d7692362bc0971b7ceb0696b758f71d636a9fdb758421e5991816', 'grace@machin.com', '2020-02-04 23:21:26'),
(177, 'b0f624b4d6da94b71bf9c0ce3c23db845125f4010c50b75b02a475099ab49bb53c27225028e6ea82422e0a0e99e71b87bd4c53de3f639598b50aedd75b2a36a1', 'dbl.bzh@gmail.com', '2020-02-04 23:22:04'),
(178, '097e08431eb8468bdf54bec8421384f5a74707478be0138281b4485712527326e7589076aa4fb5bb4434bf4e7c951db72773f14a59cb45d166d11014fb08535b', 'bertrand@machin.com', '2020-02-05 00:13:10'),
(179, 'bf149d5eafa67c209707f5002711958ddad3cc2a9b5c2791cfe97ed2195110ea9e204f4a05b6e1c4dd303f428690613271407a795b271ef4dc81bf15a01eab99', 'dbl.bzh@gmail.com', '2020-02-05 00:16:16'),
(180, '306c082add6d73227b4d61ed0e0f087b2ca3c0ef36ea0205c9c94bfd87703a0b55d249a421b249dc296ba928bc1cd0b4edcd18e15afe77339b1766ce34291ffb', 'dbl.bzh@gmail.com', '2020-02-05 00:18:09'),
(181, '9044632580c187585be8853a306a9c813b67a1d06e11b901246417d3e3f17fce63ba311ac86bc1c2ddbb77632038e91499be9516de64adc476cbef8819ad0b45', 'dbl.bzh@gmail.com', '2020-02-05 00:34:27'),
(182, '6907c16990275a38ef10ccba1e357782b2374cf2726780bc58fd4aa710b2126c401f1696bfc238ad4543252df8438627fc36470418df87c173aa64c7330aab0f', 'bertrand@machin.com', '2020-02-05 03:23:52'),
(183, '63f0005181ba295a21d9350f6adb3c46e20c88abb165258cd00e7cb38927d85433f5a5dc8a2226b880ae336d38d575c03be2d0e444ad56cb40e095ba3522586f', 'dbl.bzh@gmail.com', '2020-02-05 03:32:15');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
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
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `birthdate` datetime DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'user-default.png',
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
(9, 'machin@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$JcR9ZYK9oIoxpNX3yHo5Cg$IjfrcCcGCdhsSbY6/LLsPQAo4OwEOFVLDWDt35WaqUI', 'Machin', NULL, NULL, NULL, NULL, 'machin-5e3887560a838636462783.png', '2020-01-22 11:27:37', '2020-02-03 21:49:26', 1, 0, 0),
(10, 'truc@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$WGJyWDJveUEwdmZVNHJEOQ$opEqVzyIpaESr1FRrdmhdziTqpSisqHEI+c1492M9Zc', 'Truc', NULL, NULL, NULL, NULL, 'truc-5e38874bb55ec188525709.png', '2020-01-22 11:27:37', '2020-02-03 21:49:15', 1, 0, 0),
(11, 'alphonsebrown@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$UGhiUUlXNUVxdXdTaWxNMQ$Z8+fNcAc2Ve6LEJpfWb1mJ1/FP0boMLTvy5z//+pDVk', 'AlphonseBrown', 'Alphonse', 'Brown', 'My name is AlphonseBrown', NULL, 'alphonsebrown-5e3884af32bf6671245224.jpeg', '2020-01-22 11:53:07', '2020-02-03 21:38:07', 1, 0, 0),
(12, 'jasonburne@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$EK0gEpGuosEwSorP18M6lA$6q/kf6i1Wn8o/5RgAQfIIiORuhkdGmkpjgeNQrw+yDo', 'JasonBurne', 'Jason', 'Burne', 'My name is Jason Burne', NULL, 'cavs-parade-without-sunscreen-5e3886b35dbb8476288948.jpg', '2020-01-22 13:16:09', '2020-02-03 21:46:43', 1, 0, 0),
(13, 'dbl.bzh@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$883O9tSqpWj7UtUv6fM4dA$6ER6ziaMlr0OxmX6REKOrexbgsvqpzloZHfXkEt8LKI', 'dbl-BzH', 'Da Bep', 'Lec\'h', 'Breizh Atao !', NULL, 'my-head-5e39caa2b2b1c350845990.png', '2020-01-22 15:02:15', '2020-02-04 20:48:50', 1, 9999, 9999),
(14, 'admin@ozone.io', '[\"ROLE_ADMIN\", \"ROLE_USER\", \"ROLE_ORGANIZER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dExWaVdGSVJSalRKdzRNYQ$rztAMw7XoHLYfWmSd2WPLnEtD+Vp2OYeuN67574S2Tk', 'BigBoss', NULL, NULL, NULL, NULL, 'businessman-004-256-5e3885c916914878241328.png', '2020-01-22 16:45:36', '2020-02-03 21:42:49', 1, 0, 0),
(17, 'grace@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$KGqicd2RhNqC4yHNhAntUg$2t1xlh+258Y7IDvTCEffXSw0UY7m3ch5Jk+n/PmV/KE', 'Grace', 'Grace', 'Bee', 'Je m\'présente, je m\'appelle Henri\r\nJ\'voudrais bien réussir ma vie, être aimé\r\nEtre beau gagner de l\'argent\r\nPuis surtout être intelligent\r\nMais pour tout ça il faudrait que j\'bosse à plein temps\r\n\r\nJ\'suis chanteur, je chante pour mes copains\r\nJ\'veux faire des tubes et que ça tourne bien, tourne bien\r\nJ\'veux écrire une chanson dans le vent\r\nUn air gai, chic et entraînant\r\nPour faire danser dans les soirées de Monsieur Durand\r\n\r\nEt partout dans la rue\r\n\r\nJ\'veux qu\'on parle de moi\r\nQue les filles soient nues\r\nQu\'elles se jettent sur moi\r\nQu\'elles m\'admirent, qu\'elles me tuent\r\nQu\'elles s\'arrachent ma vertu', '2020-02-04 00:00:00', 'grace-5e39cc019e2d1639628215.jpg', '2020-01-27 09:29:04', '2020-02-04 20:54:41', 1, 9999, 9999),
(21, 'tartanfion@biloute.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$hN9uN07ENFzFWHVhIqcwPA$1rwDyi76CkSlXtupCv0UtbsRS6QSCpjnXhlkGRIWxUA', 'Tartanfion', 'Tarte', 'Enfion', 'Hello les guys !', NULL, 'tartempion-5e383a4cf3891792423562.jpg', '2020-01-28 13:57:23', '2020-02-03 16:20:45', 1, 0, 0),
(22, 'bertrand@machin.com', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ERgCEiJ3c9y1SlarWhfjtg$BOsG/mCMY+296bDzHBibGOuzdSeKipDqoXgvxwWhLlM', 'Bebert', 'bertrand', 'g', NULL, '2015-12-25 00:00:00', 'bertrand-5e39cfb8bf06c738988058.jpg', '2020-01-29 11:06:00', '2020-02-04 21:10:32', 1, 9999, 9999),
(25, 'baptiste.caral@gmail.com', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$8qKov58ZA7mhSoVwuftgBA$OfazLIFrjrn1F0f9NHRm3mz15dKco3ezGlsF59U9bTo', 'Road-N-Kite', NULL, NULL, NULL, NULL, NULL, '2020-01-31 10:05:39', '2020-02-03 15:41:03', 1, 9999, 9999),
(42, 'tefeefsddd@machin.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$eENZSGlwZHE1cWNFOUV1cQ$n34i07wJhUkvkQkHrAEao05h9NH1Dl4LWg1bV7krPvA', 'Totzqefdd', NULL, NULL, NULL, NULL, 'user-default.png', '2020-02-04 21:26:21', NULL, 1, 0, 0);

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
(10, 24),
(11, 22),
(12, 22),
(13, 22),
(13, 23),
(14, 22),
(14, 23),
(14, 25),
(17, 22),
(17, 23),
(21, 22),
(25, 22),
(25, 23),
(42, 22);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

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
