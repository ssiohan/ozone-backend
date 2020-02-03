-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 03 fév. 2020 à 21:51
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
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `author_id`, `title`, `type_event`, `description`, `created_at`, `updated_at`, `date_event`, `status`, `painfulness`, `duration`, `impact_societal`, `impact_environmental`, `user_min`, `user_max`, `bonus`, `adress`, `latitude`, `longitude`, `city`, `image`) VALUES
(2, 11, 'Recyclez vos vieux objets', 'Atelier', 'Venez participer à cet atelier créatif qui vous apprendra comment recycler vos vieux objets et leur redonner vie plutôt que de les envoyer au cimetière.\r\nDécoration intérieure/extérieure', '2020-01-22 11:27:00', '2020-02-03 11:28:46', '2020-02-07 10:00:00', 'Planifié', 2, 3, 2, 3, 1, 15, NULL, 'Centre Administratif - Place Charles Ginésy 06470 Péone-Valberg', '45.09', '6.93', 'Charles Ginésy', 'recyclage-9791029500596-0-5e37f5de29cf2736395598.jpg'),
(4, 13, 'Initiation à la permaculture', 'Atelier', 'Venez découvrir comment cultiver en permaculture et produire plus avec moins d\'efforts, sur des plus petites parcelles de terrain et surtout sans produits chimiques de traitement !', '2020-01-29 10:11:00', '2020-02-03 11:25:42', '2020-02-15 14:00:00', 'Planifié', 3, 3, 2, 2, 5, 15, NULL, 'Eco-lieu des stages: 1, place Saint Luc Martin, 89450 Asquins', '47.48', '3.75', 'Saint Luc Martin', 'butte-permacole-5e37f526ec305794104531.jpg'),
(5, 17, 'Ramassage de déchets sur \"La plage du Touquet\"', 'Acte Citoyen', 'Session de ramassage des déchets sur \"La plage du Touquet\", suite à une arrivée massive de divers matériaux plastiques, poussés par vents et marées, jusque sur le littoral.', '2020-01-29 10:23:00', '2020-02-03 11:24:13', '2020-03-08 10:00:00', 'Planifié', 5, 4, 4, 5, 10, 100, NULL, 'Plage du Touquet-Paris-Plage', '50.52', '1.57', 'Le Touquet', 'waste-dump-beach-2-5e37f4cdafadf598221715.jpg'),
(6, 14, 'Campagne de sensibilisation au \"Zéro déchet\"', 'Acte Citoyen', 'Venez avec nous participer à la campagne de sensibilisation au zéro déchet, afin d\'informer la population des conséquences de leur mode de consommation sur notre environnement.', '2020-01-29 10:30:00', '2020-02-03 11:23:53', '2020-02-22 10:00:00', 'Planifié', 3, 3, 4, 3, 10, 25, NULL, 'Centre commercial Beaugrenelle à Paris', '48.84', '2.28', 'Paris', 'objzerodech-5e37f4b9ef3ed121055384.jpg'),
(7, 12, 'Campagne de promotion \"oZone\"', 'Acte Citoyen', 'Venez nous aider à faire connaitre \"oZone\" à la population, présentation du concept et explications sur le fonctionnement du site via un stand au salon de l\'écologie de Montpellier.', '2020-01-29 10:37:00', '2020-02-03 11:22:43', '2020-03-14 09:00:00', 'Planifié', 2, 4, 4, 2, 5, 15, NULL, 'Faculté des Sciences de Montpellier, Place E. Bataillon 30, 34095 Montpellier', '43.63', '3.86', 'Montpellier', 'logo-sans-fond-5e37f473bad01395020053.png'),
(8, 12, 'Information sur la pollution des cours d\'eau', 'Réunion d\'information', 'Venez rencontrer des scientifiques spécialisés dans l\'analyse de la pollution de l\'eau, ses risques pour votre santé et ses conséquences sur l\'environnement.\r\nVous serez également informé de votre responsabilité dans cette pollution des cours d\'eau qui ne cesse d\'augmenter, mais aussi des moyens à votre disposition pour limiter...', '2020-01-29 10:43:00', '2020-02-03 11:21:58', '2020-06-10 16:00:00', 'Planifié', 1, 2, 3, 2, 10, 50, NULL, 'Mairie, 1, Grande rue Charles-de-Gaulle 94360 Bry-sur-Marne', '48.83', '2.51', 'Bry-sur-Marne', '065-lg-copie-5e37f446eb6b1557023802.jpg'),
(9, 10, 'Les dangers des pesticides', 'Réunion d\'information', 'Venez vous informer sur les réels dangers des pesticides sur votre santé et notre environnement auprès de chercheurs qualifiés dans le domaine.\r\nIls seront présents pour répondre à vos interrogations et vous aiguiller sur les démarches à effectuer, afin de limiter votre exposition et luter contre l\'usage de plus en plus massif de ces produits chimiques à proximité des habitations...', '2020-01-29 11:07:00', '2020-02-03 11:18:08', '2020-08-08 15:00:00', 'Planifié', 1, 2, 2, 1, 10, 100, NULL, 'Ferme Fons des Ores Rue de la Gazelle, 63340 Antoingt', '45.50', '3.17', 'Antoingt', 'pesticides-risques-5e37f360ba501591832707.jpg'),
(12, 22, 'Points de vente produits alimentaires (en vrac)', 'Réunion d\'information', 'Découvrez les solutions alternatives, pour consommer des produits locaux et sans emballage et ainsi faites vivre les producteurs à proximité de chez vous tout en limitant vos déplacements et la quantité de déchets que vous générez.', '2020-01-30 22:36:57', '2020-02-03 11:16:52', '2020-06-14 14:00:00', 'Planifié', 1, 1, 2, 2, 5, 25, NULL, 'Ferme de la Chaux  21360', '47.22', '4.66', 'La Bussière-sur-Ouche', 'rsz-saxe-breteuil-620x413-5e37f314ec2d0825052897.jpg'),
(13, 12, 'Fabrication de produit ménagers', 'Atelier', 'Venez avec nous apprendre à fabriquer vos propres produits ménagers afin de respecter l\'environnement, mais aussi l\'air que vous respirez dans votre foyer !', '2020-01-30 22:58:13', '2020-02-03 11:15:19', '2020-03-30 15:00:00', 'Planifié', 2, 2, 2, 2, 5, 20, NULL, '1, Rue Jean Jaurès 29390', '48.02', '-3.69', 'Scaër', 'produits-menagers-5e37f2b72dfff241672393.jpeg'),
(43, 17, 'Event de test', 'Acte Citoyen', 'Test description', '2020-02-03 17:15:31', NULL, '2020-02-28 10:00:00', 'Planifié', 2, 2, 2, 2, 5, 5, NULL, NULL, '48.02', '3.52', 'Scaër', NULL),
(44, 17, 'avec la maps', 'Atelier', 'test lat lng', '2020-02-03 20:14:46', NULL, '2020-02-14 10:10:00', 'Planifié', 3, 1, 2, 1, 5, 5, NULL, NULL, '44.83844', '-0.5765688', 'bordeaux', NULL);

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
(93, 'f80fae0f5da1754e5beef6fe0a40b694a3ca42d149ce592e524e1793f40a13c9059902e658262826db2f1b0db463970caf911bb44f4d50a13d154bd5bb308d44', 'admin@ozone.io', '2020-01-30 12:41:02'),
(94, 'd8a4ff42912786a84e4ad223a638920483fa1282a6d29e6f6b0afc8844cbab15865f4fa423fb0b28cff37ce756fd3c96a8465e258a46ea19cf88956c4b6f4633', 'dbl.bzh@gmail.com', '2020-01-31 05:02:08'),
(96, 'b1c05efd701c82e51de92828cb7afc5a692c0b75c0ffa23b9d9ffa63856add3ac0055d6ead157d8f69ce451af288f9862da7595f11d00abf1464aee14435a1a6', 'jasonburne@machin.com', '2020-01-31 13:13:35'),
(97, '6c8b3251bcb4c4c899b4c6b3e5c2b3ac6c8fdfd33af03ac8b5f4e2dac632d99c84cc99987003afaac5397c2b6ce0f0baecc65133a2b8763cffd3c8839eeb5a37', 'dbl.bzh@gmail.com', '2020-01-31 13:24:32'),
(98, '91ac535d775a308b5464f7338c0ed396db857ecdcab8520f868823ed2a55c0fa40f69bc698f04a7d033c2e1a63d72d9b4189367b208b6b33acec90861b6e5d32', 'bertrand@machin.com', '2020-01-31 13:43:46'),
(99, 'cca517ac0405a681ec3a65dbb5d384254e7ad05223594ed86d5624163cde267056ef7774b202a3d673a89002d077c5b3c0ad7b1c650ab3b9b524026daa5bc82e', 'dbl.bzh@gmail.com', '2020-01-31 18:30:42'),
(100, '21e1eb20bf85ad4a5ed531637375b25fbd27f1f2cb751d0900b1e46af264e20c9b168beff1c089282c3cef773b53c0d44380f98c899358685eae489c8c37ac20', 'grace@machin.com', '2020-01-31 21:27:24'),
(101, 'ef09a14e57cbb182a1fed16900a3583744eb82ffa8df5661cf17e0d2a9ae06d9b924c762d9fd3658667ea6a49087b66b0f4b0aba71f1349ad33ad0003d3c8e20', 'grace@machin.com', '2020-02-01 16:33:32'),
(102, '91ff07068cf677261a001db0d323844d6d329846b100cb09aa1a9da05499df2b963c1d62497a02d63880abb9be8094a252d472fc98e47b3dbc3d9b29dc882c3e', 'grace@machin.com', '2020-02-01 16:34:02'),
(103, '3d8d769f6bbfcf7039aa555997e87cb28ef2034b935a2df770b99c670b9d23cc1bf31f79284e64112d95e08d4e6477bb86999d2de7f58332e1748fc9ab3bd233', 'grace@machin.com', '2020-02-01 16:58:08'),
(104, '208b5522457460fcb8ab5ba7a5011f7c9664df12260f476f23dfea54b854d10e58eb429998fc135fe86b112319151aa179f385be37633d52b5589e1821f8a604', 'grace@machin.com', '2020-02-01 17:17:24'),
(105, 'fa0cf1c5575c2e15408774588e45effa92d2150faa9dabc6d434a3824e1379c59dbd4ae67a96747ed766d02a4eca8d8c5acf04eaffd264801b5bde3936dee19a', 'grace@machin.com', '2020-02-01 17:29:20'),
(106, '0b9b0516bf1708b15aa3b886684f44ef200727e642c0acf036e11494ee8c31c0b2f2d4860808057d65661b15cb6f1deca1c9e625b87fa3c2b3329e42f6a25cc7', 'grace@machin.com', '2020-02-01 17:31:07'),
(107, 'da7e18fdffe648bfb9654b93f7f4e9aa89426ad8454856cebb89d53360103e6d0ae4b47504e137c155505c0acca46e7046f38940a9a595767e5d9ddcc284b7be', 'grace@machin.com', '2020-02-01 17:51:03'),
(108, 'c682e596095839993fc4b77f8711db316b0e6194c219ba6814a7582b3c430c237c2175d45dd271f3a146ab34c4551d1232367ca7eb14dc8410da9c506537fba0', 'dbl.bzh@gmail.com', '2020-02-01 18:34:24'),
(109, '6118f6937a15899da44fccd545c9a7bc03e514c5c07bbafcdb70715a82b8872f20fa4638e207fd8eaa335f16777c4a110e2c9120da44c90faab1b28d17745973', 'dbl.bzh@gmail.com', '2020-02-01 18:35:34'),
(110, 'd41deafa86938bace8fe7815a0be2873bf2afbb9b3a05b257aa76f97d9eee0207b6c29308511bbafbd0b53a248fc2c8c68b4aa704e30d3d2ac5a4497e1683925', 'dbl.bzh@gmail.com', '2020-02-01 18:44:16'),
(111, 'e2a6ba394534159c6eea6b6a6924f43aad08527f77225d9fbb19cd09adcfb454282cf031dad47cb3ad447facf725cf06e97a6f68c201a95703b5369852bf32a3', 'grace@machin.com', '2020-02-01 20:58:51'),
(112, '6632632444dfc260d022cf8fc9066e72b994d24096691feb1baf11e4ee49d7be72b89cce0e5e232f86d414ab9cc4fcf936aad4e37079fa1fb0244a5a2123e888', 'dbl.bzh@gmail.com', '2020-02-02 01:57:01'),
(113, '5d6b6cebd9b52716f5557bb0a334da98d44d65cc75d2358d0cdd476ef11bb499d7ce4cda8fa13ac9e7c73f92f91b2231b5ce013b3faad9af5ba80b575c64d4bc', 'dbl.bzh@gmail.com', '2020-02-02 01:57:07'),
(114, '215007e3d4782f7e5d7a0258790a44de4497181829bb464cd93171bae530f7aedd29ef411f5b9257801c10245eb6f2a4151a53911cb6fb08b531776543f31a5d', 'grace@machin.com', '2020-02-02 01:57:38'),
(115, 'a952f040760fd95c8e10ab22af12fcc169cdded9df8a733b0720d4b74b48a1578a303a32159fac24d170d0243ac05745ae6ff068d6d6a36edc2e1a98fe5dfa0d', 'grace@machin.com', '2020-02-02 01:59:24'),
(116, '944a805bbef180bac9a4973a526bb07a986b0fa53ee7b2f86034a18d3db122e7d6a400ce80dbf9b0be4203c8cc4017965c0fcd88ff53692e69f40f7bd2fe3e31', 'dbl.bzh@gmail.com', '2020-02-02 02:44:46'),
(117, '01ac7d85b2d6474e6edd66ca670fb9e18dd32aef084d778d398b6b145e0238cff66a28fca403d96f39bc77c0310e78ccaa78dde476b15c275381768e4f1707b7', 'dbl.bzh@gmail.com', '2020-02-02 15:37:45'),
(118, '335ee9125998c64650819585f580ed63d8140692c30cfdad79d05f8dd07e966ababfac6d04fc0d54303563c2ef7ad56adc174a06750238f3cddb289745473070', 'dbl.bzh@gmail.com', '2020-02-02 17:46:40'),
(119, '457f0047ef03a78b9f2e0542647b80e513f138b131fd9f463a6776c26487eacb69683440560add2f6cbe597b218f965d142c4b73c052ed873b6a953f3898bb62', 'dbl.bzh@gmail.com', '2020-02-02 17:54:35'),
(120, 'e87049aabb8f4018fc9eaa640a67f661fbda09f390f15420ef150886d621e48af64efb78f87f9976f0e349da8d0630423eb9513cd5af76aeb472fd96a99ab28e', 'dbl.bzh@gmail.com', '2020-02-02 18:02:45'),
(121, '99fe9dc3319bf537f539a8b8ec4b96df4904eb7db6a93adf1d01134b54a68153a09c2d6ee3b27218a23e6d4570d30ad3f7eb5cda3bd200a77b70ecba4764af08', 'dbl.bzh@gmail.com', '2020-02-02 18:05:48'),
(122, 'dbd31844ab5e408938ada6204112a3f50195ffb6933e5df11e95a1f25a71f7c6849cba84a5aec7d37d37c5c9e97c954174d0eed0938fdfd8243952c2b26eabaf', 'dbl.bzh@gmail.com', '2020-02-02 18:14:20'),
(123, '5b5606d73ab74320273680711ef5c558d78b40cf4c4616bd131844d8569911fd531e6bf56d3e526fb2c41d90fd13935f7341143f66b1ba6d38a1be3a5f3fabc8', 'dbl.bzh@gmail.com', '2020-02-02 18:16:14'),
(124, '0f9b3d9b1433d419681c1ce033b469b36e55a51b730f9c4609ed39b20344bb2c33039f11bd45f277a447d6bcf2732fe2752eb338e90f6474dce1be8f2cfde4da', 'dbl.bzh@gmail.com', '2020-02-02 18:17:07'),
(125, '8858cf7e4a1c9e2c9f5de26ecf408987bb765546718c5870e58e22ffe6f33e397dd1a090b566138716da10f7870e283ac04df7bc45738f3b1e4bd198d1c34301', 'dbl.bzh@gmail.com', '2020-02-02 18:17:44'),
(126, 'a946e334e423d18b68914426d955fe76182f49156bb1bcba0b2fdc5199e9ec01f8b2030826e81d317da555fef14a4141b3468c615c86e7a7ef5e69ce3ff5ee04', 'dbl.bzh@gmail.com', '2020-02-02 18:21:02'),
(127, '2561c6993b4f59fd87a04901db0df75200b758ea4b3c313be8814d9943e00e0cedc9550ddef45c36820cb5b42a759839c59f62e129e558d3a7515523cd95d4cc', 'grace@machin.com', '2020-02-02 20:04:24'),
(128, 'eacb9d54ff896fb9042ceeda8d2656ba9461ba5431a13dd72200cb6a69e1d7175a78ea63222b1756fb45c8041c8fba2d1ec9eee57de4102d1bd7b40aabd4cf10', 'grace@machin.com', '2020-02-02 20:05:53'),
(129, 'bf55d394529fe8e8b621c07d984ebfae4f672604153fc3dc59f8c19fd440ebdff028078f4bb264dd42a6d95e8552814555f3c8a9764be65098c4972594426ddd', 'grace@machin.com', '2020-02-02 20:08:59'),
(130, '6abdf270db2595f573635012567d064c5cc676f1070a21779a7e4565a2a5840823b2e8212990d41c0faa6432713bc1c859afa7e97dff9db224602d9447a6d6c5', 'grace@machin.com', '2020-02-02 20:12:09'),
(131, 'efd9f461fe57b308dbe9637bacc97b5686e9e401f5373ad28fbe1b579fe54f8077e2045994b651c4eb6293ad64e71149de22bdbb28fcdf5d3cd206bf6e3f40ea', 'grace@machin.com', '2020-02-02 20:13:36'),
(132, 'a7a84f0cf89149dcc2c78a10143034a5858db0764266db66cc5bc3d42e429b92b6f53129ee827aa20191db1c8e87725251da5605c7b1168b8361a1613e3d10e8', 'grace@machin.com', '2020-02-02 20:14:24'),
(133, '5e62f5d1d89018608d1c623aeeeb9bfb9eaef1edf04a201060631fba76bf6340d531849739bd25827aa86551c416d2fbc53ad5ddca0910eecb8d4468e7afa6d3', 'grace@machin.com', '2020-02-02 20:15:26'),
(134, 'd2e71efedb6ff63fa5f13b3890140149ea3c250abf680380473ba87d025ed7ef832806d0df7c870875c93d73cb7dee16362a04041d29d6c1495c6090b5ce74fe', 'grace@machin.com', '2020-02-02 20:17:50'),
(135, '075ac75318eba0fadbd718d561b6855328adbf34c9286b5af9276ca44d59882ab44f2b2b06c5f5e2fb8ce797ba4f488badf01c1e3e635f5950d7245bb85d9ad8', 'grace@machin.com', '2020-02-02 20:21:04'),
(136, '7fcdedc8e9bbf22c68abdfa3ea156728f448a611d29665da028c3fa645fdc2b18e3fd8df566d3ab01b80e9bd2f581741d9d051157f647c3a365ed963eb6d4171', 'grace@machin.com', '2020-02-02 20:31:12'),
(137, '2c23da8009b2e5e53c386d8ad1d722fb49245b54ee665a674727ced22cf366e30e0b5fc1cf76f943b368c34746c023078de2d1fce7e016d04d8d129bb9b831fc', 'grace@machin.com', '2020-02-02 22:03:35'),
(138, 'dc9a9295ddbc0e9ed25bd6678bd1cfbf67ddfca99aa6afa79b6cc99fa09f99c4aadd20e600851be41656eac0d8a4b6efd3076fcf498e1f27c65c98130b5f2928', 'grace@machin.com', '2020-02-03 01:39:30'),
(139, '1eb9b300b3a4a2c2ce64f6884a09085445fe209cb8be8c7ed96ad6a057f965a6528580802de35d5e46e30250ac7ff567da3cf0bc0f17f10cc8cd0c137049fbf1', 'grace@machin.com', '2020-02-03 01:57:26'),
(140, '3227f4d08c3e4315bb12378891aca3cc855cd86cf1c4e45cded44621c8e30aaa3a9ce1e94a96f2f6b6f143974a606be4f36b6137c6e9b32db8f0d325c8405b10', 'grace@machin.com', '2020-02-03 10:13:49'),
(141, 'd2588a9b6e21994309989a2ba76b28b00660a45e9b0f4b25fb4621f95ed6592046d57554ac6f67f6e289f0b027e74b7873b961a121d4009425dfb6a19704afae', 'grace@machin.com', '2020-02-03 10:30:48'),
(142, 'a8718188c319061b0e169c344838605366b65bfb0a15eec1f075e35ccf150dd4dd26e29faed20401375eee658b8a0dc8fbb660f741e9a9d9e42ab1bbdcc74461', 'grace@machin.com', '2020-02-03 12:04:58'),
(143, 'ad8c3e04d95b2e80514d6ec7542e603fb0e35329c98e72caf59ae30c9bf6104a99006c37344e6c12acd3f3491dfa230b51a334cebb7ea0cc00a41b1481f5c5c3', 'dbl.bzh@gmail.com', '2020-02-03 14:50:17'),
(144, 'd2fa023f5b844e322d705c556717de75b9bc580d9d61deb335d7238da7a27c1a1910dc1725f7762b0fd9699a9bcfa08f2350841dd82959f79f64824948f93cc3', 'dbl.bzh@gmail.com', '2020-02-03 14:57:38'),
(145, 'b2d605c23526c2b7c803b605e72bf7ebb006727c7175371c15fc1cc4636d8d4112c4dcaca98db1cae4edf7c28f1b8b13b064150e14473d5f1523e1d3c32f5803', 'grace@machin.com', '2020-02-03 15:01:06'),
(146, '0d3d7907286af4c08ba0c502edcc0c26dedcae9ad3069f6f8e1d383cce4f333b9c9d8921af907b795ffd6106b7c5a73e4fa380dea54f8ea9d723539fe55d202a', 'grace@machin.com', '2020-02-03 15:09:15'),
(147, '6b0ad7b5034ab00cfe9c506fef62934432f59bd5d8196ec4a779562cb41c19f06f1e644da7a9d33d69fea13a3563993b067d72bd753888214ffabce375ca4137', 'grace@machin.com', '2020-02-03 15:35:25'),
(148, '6ee0f4ac81396712b9436c0e7344d0230fd461f917ead258ceeefce8e81bba56a25a00602636998170b77ff29b18f084ba0a580d161d61af088edfa9d7c04636', 'grace@machin.com', '2020-02-03 15:38:49'),
(149, '737c2056376baf9b272f85e4e4b5f4046a9bd306110c04f7092334effdb4b6f1cd20f5701ec90deb0f6982fe640d64f6912da5af8c9a2f878272f62fd3f5c187', 'grace@machin.com', '2020-02-03 16:29:40'),
(150, 'd03cbfe8ab30e8a0fb6496bf8ae700fe21b3ca9934f925ccefa1e3e3c792172f532790ee8e408d163ef7b3945ac98ab5dcd62456d6ccc1148a9d74d0f72be1b4', 'dbl.bzh@gmail.com', '2020-02-03 20:32:20'),
(151, '64057a7ddad4c60bd9bb4f2d0a5058621a964f8742e51518caa9a045368a8975ea1fe4c0fdd3af3b7ad27bb510718932e6326ab6a1cd5ebfc6b270bddd0c7a96', 'grace@machin.com', '2020-02-03 19:48:18'),
(152, '3029c80cae1832eb4d79c4f1e441cc905ed74b5b77791f35cc30724b7e6ee9ba1bd849f88b40ce6a4c59f2d2e594f15dc61b0e91597cf2831659d857d0a030dd', 'dbl.bzh@gmail.com', '2020-02-03 20:12:23'),
(153, '3415f9c6ea57f3d50a0a3f26a689c84dd6aee547e5f1901884ecead761c885d8ea4c99687fc26c0dbf955f741efde1bfac2eb8c0586416752154c15c0d1e0029', 'dbl.bzh@gmail.com', '2020-02-03 23:10:52'),
(154, '22281f0e2a1a7dce59a458bf2da752760ac5e8e88e98fc020413dd93d30014f2a2cabdf6baaa3cbf0da705549e200dbebe3f085b57eadfe2e4c2485826c6783f', 'grace@machin.com', '2020-02-03 23:13:45'),
(155, 'ca96cf3ba5fc058c8d2fc1e92166cce981d257d74979dd38779492e4afc186ffd90ce99336526fb31f3c52262fc19dc3de1341ff4a85a5fc1eb48c35c0157113', 'dbl.bzh@gmail.com', '2020-02-03 23:37:56'),
(156, '9f6533bedfc9f5c13bbee35c483c8eec48c1a0a360404b6d715d79302ede302bf129c25f1c6b46ebaefee88bbc623aea9df5e1e5d62442596fbe6c91df9c0f5a', 'dbl.bzh@gmail.com', '2020-02-04 00:34:17'),
(157, '66a481494e01fcb2746d92aafc474c099577056670443e1eca2e657d1ad47d663e3333268e07c05e92ca3ed056f677d2de400900d7335d6c499fe37d728630a0', 'dbl.bzh@gmail.com', '2020-02-04 00:34:42');

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
(9, 'machin@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$JcR9ZYK9oIoxpNX3yHo5Cg$IjfrcCcGCdhsSbY6/LLsPQAo4OwEOFVLDWDt35WaqUI', 'Machin', NULL, NULL, NULL, NULL, 'machin-5e3887560a838636462783.png', '2020-01-22 11:27:37', '2020-02-03 21:49:26', 1, 0, 0),
(10, 'truc@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$WGJyWDJveUEwdmZVNHJEOQ$opEqVzyIpaESr1FRrdmhdziTqpSisqHEI+c1492M9Zc', 'Truc', NULL, NULL, NULL, NULL, 'truc-5e38874bb55ec188525709.png', '2020-01-22 11:27:37', '2020-02-03 21:49:15', 1, 0, 0),
(11, 'alphonsebrown@machin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$UGhiUUlXNUVxdXdTaWxNMQ$Z8+fNcAc2Ve6LEJpfWb1mJ1/FP0boMLTvy5z//+pDVk', 'AlphonseBrown', 'Alphonse', 'Brown', 'My name is AlphonseBrown', NULL, 'alphonsebrown-5e3884af32bf6671245224.jpeg', '2020-01-22 11:53:07', '2020-02-03 21:38:07', 1, 0, 0),
(12, 'jasonburne@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$EK0gEpGuosEwSorP18M6lA$6q/kf6i1Wn8o/5RgAQfIIiORuhkdGmkpjgeNQrw+yDo', 'JasonBurne', 'Jason', 'Burne', 'My name is Jason Burne', NULL, 'cavs-parade-without-sunscreen-5e3886b35dbb8476288948.jpg', '2020-01-22 13:16:09', '2020-02-03 21:46:43', 1, 0, 0),
(13, 'dbl.bzh@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$883O9tSqpWj7UtUv6fM4dA$6ER6ziaMlr0OxmX6REKOrexbgsvqpzloZHfXkEt8LKI', 'dbL-BzH', 'Da Bep', 'Lec\'h', 'Breizh Atao !', NULL, 'dbl-5e383a04b7638582650743.jpg', '2020-01-22 15:02:15', '2020-02-03 16:19:32', 1, 0, 0),
(14, 'admin@ozone.io', '[\"ROLE_ADMIN\", \"ROLE_USER\", \"ROLE_ORGANIZER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dExWaVdGSVJSalRKdzRNYQ$rztAMw7XoHLYfWmSd2WPLnEtD+Vp2OYeuN67574S2Tk', 'BigBoss', NULL, NULL, NULL, NULL, 'businessman-004-256-5e3885c916914878241328.png', '2020-01-22 16:45:36', '2020-02-03 21:42:49', 1, 0, 0),
(17, 'grace@machin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$KGqicd2RhNqC4yHNhAntUg$2t1xlh+258Y7IDvTCEffXSw0UY7m3ch5Jk+n/PmV/KE', 'Grace', NULL, NULL, NULL, NULL, NULL, '2020-01-27 09:29:04', NULL, 1, 0, 0),
(21, 'tartanfion@biloute.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$hN9uN07ENFzFWHVhIqcwPA$1rwDyi76CkSlXtupCv0UtbsRS6QSCpjnXhlkGRIWxUA', 'Tartanfion', 'Tarte', 'Enfion', 'Hello les guys !', NULL, 'tartempion-5e383a4cf3891792423562.jpg', '2020-01-28 13:57:23', '2020-02-03 16:20:45', 1, 0, 0),
(22, 'bertrand@machin.com', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ERgCEiJ3c9y1SlarWhfjtg$BOsG/mCMY+296bDzHBibGOuzdSeKipDqoXgvxwWhLlM', 'Bebert', 'bertrand', 'g', NULL, '2015-12-25 00:00:00', 'baracktocat-5e3839cb8db4c577155595.jpg', '2020-01-29 11:06:00', '2020-02-03 16:18:35', 1, 9999, 9999),
(24, 'testderedirection2@truc.fr', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$qkMs0FrxSTckNJ2r41FA+A$vPPUi6WE7mS962NIIxp4rASF1JJYh+UaMh5kdZExzH4', 'testderedirectionSignup', NULL, NULL, NULL, NULL, NULL, '2020-01-29 12:31:18', '2020-02-03 09:50:39', 1, 0, 0),
(25, 'baptiste.caral@gmail.com', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$8qKov58ZA7mhSoVwuftgBA$OfazLIFrjrn1F0f9NHRm3mz15dKco3ezGlsF59U9bTo', 'Road-N-Kite', NULL, NULL, NULL, NULL, NULL, '2020-01-31 10:05:39', '2020-02-03 15:41:03', 1, 10, 10);

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
(14, 22),
(14, 23),
(14, 25),
(17, 22),
(17, 23),
(21, 22),
(24, 22),
(25, 22),
(25, 23);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

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
