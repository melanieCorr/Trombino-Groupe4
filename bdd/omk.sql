-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 30 nov. 2020 à 08:18
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omekas_thyp_20_21`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
CREATE TABLE IF NOT EXISTS `api_key` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C912ED9D7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE IF NOT EXISTS `asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

DROP TABLE IF EXISTS `fulltext_search`;
CREATE TABLE IF NOT EXISTS `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`resource`),
  KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(2, 'items', 1, 1, 'Lucas Hauchard', 'Lucas\nHauchard\nDoublage, Chanson\n1997-01-27\nSqueezie\nhttps://www.youtube.com/user/aMOODIEsqueezie \nLucas Hauchard'),
(3, 'items', 1, 1, 'Cyprien Iov', 'Cyprien\nIov\nBlogueur, acteur, scénariste de films et de bande dessinée\n1989-05-12\nCyprien \nhttps://www.youtube.com/user/MonsieurDream \nCyprien Iov'),
(4, 'items', 1, 1, 'Norman Thavaud', 'Norman\nThavaud\nActeur, doubleur, humoriste\n1987-04-14\nNorman fait des vidéos\nhttps://www.youtube.com/user/NormanFaitDesVideos \nNorman Thavaud '),
(5, 'items', 1, 1, 'Squeezie', 'Jeu vidéo, vidéos réactions\n2011-01-09\nLucas Hauchard \nSqueezie\nSqueezie'),
(6, 'items', 1, 1, 'Cyprien', 'Stand-up, court métrage\n2007-02-25\nCyprien Iov\nCyprien \nCyprien '),
(7, 'items', 1, 1, 'Norman fait des vidéos', 'Podcast vidéo, film humoristique, parodie\n2011-01-04\nNorman Thavaud \nNorman fait des vidéos\nNorman fait des vidéos'),
(8, 'items', 1, 1, 'Mélanie', 'Mélanie\nCorreia\nmelanieCorr\nmel.correia.92@gmail.com\nMélanie'),
(9, 'items', 1, 1, 'Kamal', 'Kamal\nEL KADI\nnelkadi96\nelkadikama2@gmail.com\nKamal'),
(10, 'items', 1, 1, 'Halim', 'Halim\nBrinis\nXT19\nbrinis.halim@outlook.fr\nHalim'),
(11, 'items', 1, 1, 'Ibrahim', 'Ibrahim\nMerizak\nMerizIbra\nibrahim.merizak@yahoo.com\nIbrahim'),
(16, 'item_sets', 1, 1, 'Youtubeurs', 'Youtubeurs'),
(17, 'item_sets', 1, 1, 'Chaine', 'Chaine'),
(18, 'item_sets', 1, 1, 'Utilisateurs', 'Utilisateurs');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`) VALUES
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

DROP TABLE IF EXISTS `item_item_set`;
CREATE TABLE IF NOT EXISTS `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`item_set_id`),
  KEY `IDX_6D0C9625126F525E` (`item_id`),
  KEY `IDX_6D0C9625960278D7` (`item_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_item_set`
--

INSERT INTO `item_item_set` (`item_id`, `item_set_id`) VALUES
(2, 16),
(3, 16),
(4, 16),
(5, 17),
(6, 17),
(7, 17),
(8, 18),
(9, 18),
(10, 18),
(11, 18);

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

DROP TABLE IF EXISTS `item_set`;
CREATE TABLE IF NOT EXISTS `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_set`
--

INSERT INTO `item_set` (`id`, `is_open`) VALUES
(16, 0),
(17, 0),
(18, 0);

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

DROP TABLE IF EXISTS `item_site`;
CREATE TABLE IF NOT EXISTS `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`site_id`),
  KEY `IDX_A1734D1F126F525E` (`item_id`),
  KEY `IDX_A1734D1FF6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  KEY `IDX_6A2CA10C126F525E` (`item_id`),
  KEY `item_position` (`item_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `item_id`, `ingester`, `renderer`, `data`, `source`, `media_type`, `storage_id`, `extension`, `sha256`, `size`, `has_original`, `has_thumbnails`, `position`, `lang`) VALUES
(19, 2, 'upload', 'file', NULL, 'squeezie.jpg', 'image/jpeg', 'ab3162b6768aab38edddc57730feb305e8beee9a', 'jpg', '5c1a0558b0c6608591f8aeaded9b18822d513c7c8ce43dfd34a6a00d289c8708', 78923, 1, 1, 1, NULL),
(20, 3, 'upload', 'file', NULL, 'cyprien.jpg', 'image/jpeg', '27fcc9ef17af3de3fb13e8991addd378f4f4a0d7', 'jpg', 'f5080844c00c99873a56a223bcaf6ddf72cc2188c56654d9c214a5029e6502a1', 91151, 1, 1, 1, NULL),
(21, 4, 'upload', 'file', NULL, 'norman.jpeg', 'image/jpeg', '76df5f13be6d5efa7ce26915d28502ad024ae7b3', 'jpeg', '7ecf1f0c54717454639755227c4d75628b6680258eb9891de10501450ca8ba95', 473745, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

DROP TABLE IF EXISTS `password_creation`;
CREATE TABLE IF NOT EXISTS `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(191, 1, 6, 'account', 'account', NULL),
(192, 1, 6, 'connectsTo', 'connects to', NULL),
(193, 1, 6, 'delegationRecordPage', 'delegation record page', NULL),
(194, 1, 6, 'filename', 'filename', NULL),
(195, 1, 6, 'fragmentOf', 'fragment of', NULL),
(196, 1, 6, 'fragment', 'fragment', NULL),
(197, 1, 6, 'host', 'host', NULL),
(198, 1, 6, 'IANAPage', 'IANA page', NULL),
(199, 1, 6, 'IANARef', 'IANA reference', NULL),
(200, 1, 6, 'identifiedBy', 'identified by URI', NULL),
(201, 1, 6, 'key', 'key', NULL),
(202, 1, 6, 'length', 'length', NULL),
(203, 1, 6, 'md5', 'md5 hash', NULL),
(204, 1, 6, 'pass', 'password', NULL),
(205, 1, 6, 'path', 'path', NULL),
(206, 1, 6, 'port', 'port', NULL),
(207, 1, 6, 'query', 'query', NULL),
(208, 1, 6, 'queryString', 'query string', NULL),
(209, 1, 6, 'scheme', 'URI scheme', NULL),
(210, 1, 6, 'sponsor', 'sponsor', NULL),
(211, 1, 6, 'subDom', 'subdomain', NULL),
(212, 1, 6, 'suffix', 'suffix', NULL),
(213, 1, 6, 'object', 'object', NULL),
(214, 1, 6, 'predicate', 'predicate', NULL),
(215, 1, 6, 'subject', 'subject', NULL),
(216, 1, 6, 'trueAt', 'trueAt', NULL),
(217, 1, 6, 'usedForFormat', 'used for format', NULL),
(218, 1, 6, 'usedForSuffix', 'used for suffix', NULL),
(219, 1, 6, 'user', 'user', NULL),
(220, 1, 6, 'value', 'value', NULL),
(221, 1, 6, 'whoIsRecord', 'whois record', NULL),
(222, 1, 6, 'hasWhoIsServer', 'whois server', NULL),
(223, 1, 7, 'voc.ttlhasChannel', 'hasChannel', 'La vidéo appartient à cette personne'),
(224, 1, 7, 'voc.ttlnomChaine', 'Nom de la chaine', NULL),
(225, 1, 7, 'voc.ttlhasYoutubeur', 'hasYoutubeur', 'La propriétaire de cette chaine');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(2, 1, 130, 3, NULL, 'Lucas Hauchard', 1, '2020-11-15 13:12:28', '2020-11-29 11:34:44', 'Omeka\\Entity\\Item'),
(3, 1, 130, 3, NULL, 'Cyprien Iov', 1, '2020-11-15 13:14:40', '2020-11-29 11:35:12', 'Omeka\\Entity\\Item'),
(4, 1, 130, 3, NULL, 'Norman Thavaud', 1, '2020-11-15 13:15:51', '2020-11-29 11:35:29', 'Omeka\\Entity\\Item'),
(5, 1, 131, 2, NULL, 'Squeezie', 1, '2020-11-15 13:24:14', '2020-11-23 08:21:11', 'Omeka\\Entity\\Item'),
(6, 1, 131, 2, NULL, 'Cyprien', 1, '2020-11-15 13:25:17', '2020-11-23 08:20:57', 'Omeka\\Entity\\Item'),
(7, 1, 131, 2, NULL, 'Norman fait des vidéos', 1, '2020-11-15 13:26:27', '2020-11-23 08:20:39', 'Omeka\\Entity\\Item'),
(8, 1, 94, 4, NULL, 'Mélanie', 1, '2020-11-15 13:27:01', '2020-11-23 08:20:29', 'Omeka\\Entity\\Item'),
(9, 1, 94, 4, NULL, 'Kamal', 1, '2020-11-15 13:28:01', '2020-11-23 08:20:19', 'Omeka\\Entity\\Item'),
(10, 1, 94, 4, NULL, 'Halim', 1, '2020-11-15 13:29:00', '2020-11-23 08:20:09', 'Omeka\\Entity\\Item'),
(11, 1, 94, 4, NULL, 'Ibrahim', 1, '2020-11-15 13:29:57', '2020-11-23 08:19:56', 'Omeka\\Entity\\Item'),
(16, 1, 130, NULL, NULL, 'Youtubeurs', 1, '2020-11-16 11:32:43', '2020-11-23 08:19:24', 'Omeka\\Entity\\ItemSet'),
(17, 1, 131, NULL, NULL, 'Chaine', 1, '2020-11-23 08:19:09', '2020-11-23 08:19:09', 'Omeka\\Entity\\ItemSet'),
(18, 1, 94, NULL, NULL, 'Utilisateurs', 1, '2020-11-23 08:19:40', '2020-11-23 08:19:40', 'Omeka\\Entity\\ItemSet'),
(19, 1, NULL, NULL, NULL, NULL, 1, '2020-11-29 10:59:50', '2020-11-29 10:59:50', 'Omeka\\Entity\\Media'),
(20, 1, NULL, NULL, NULL, NULL, 1, '2020-11-29 11:00:12', '2020-11-29 11:00:12', 'Omeka\\Entity\\Media'),
(21, 1, NULL, NULL, NULL, NULL, 1, '2020-11-29 11:00:26', '2020-11-29 11:00:26', 'Omeka\\Entity\\Media');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

DROP TABLE IF EXISTS `resource_class`;
CREATE TABLE IF NOT EXISTS `resource_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(107, 1, 6, 'Domain', 'Internet Domain', NULL),
(108, 1, 6, 'Domain-Invalid', 'Invalid Internet Domain', NULL),
(109, 1, 6, 'Domain-Valid', 'Valid Internet Domain', NULL),
(110, 1, 6, 'Format', 'File Format', NULL),
(111, 1, 6, 'FragmentURI', 'URI with Fragement Identifier', NULL),
(112, 1, 6, 'HostPort', 'Host and Port', NULL),
(113, 1, 6, 'Mimetype', 'Mimetype', NULL),
(114, 1, 6, 'Query', 'URI Query Part', NULL),
(115, 1, 6, 'QueryKey', 'URI Query Key', NULL),
(116, 1, 6, 'QueryKVP', 'URI Query Key-Value Pair', NULL),
(117, 1, 6, 'QueryValue', 'URI Query Value', NULL),
(118, 1, 6, 'Suffix', 'Filename Suffix', NULL),
(119, 1, 6, 'TopLevelDomain-CountryCode', 'Country Top-Level Domain', NULL),
(120, 1, 6, 'TopLevelDomain', 'Top-Level Domain', NULL),
(121, 1, 6, 'TopLevelDomain-Generic', 'Generic Top-Level Domain', NULL),
(122, 1, 6, 'TopLevelDomain-GenericRestricted', 'Restricted Generic Top-Level Domain', NULL),
(123, 1, 6, 'TopLevelDomain-Infrastructure', 'Infrastructure Top-Level Domain', NULL),
(124, 1, 6, 'TopLevelDomain-Sponsored', 'Sponsored Top-Level Domain', NULL),
(125, 1, 6, 'TopLevelDomain-Test', 'Test Top-Level Domain', NULL),
(126, 1, 6, 'URI', 'URI', NULL),
(127, 1, 6, 'URIScheme', 'URI Scheme', NULL),
(128, 1, 6, 'Statement', 'Statement (reified)', NULL),
(129, 1, 6, 'WhoisServer', 'Whois Server', NULL),
(130, 1, 7, 'voc.ttlYoutubeur', 'Youtubeur', NULL),
(131, 1, 7, 'voc.ttlChaine', 'Chaine', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

DROP TABLE IF EXISTS `resource_template`;
CREATE TABLE IF NOT EXISTS `resource_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, NULL, NULL, NULL, 'Chaine'),
(3, 1, 94, NULL, NULL, 'Youtubeur'),
(4, 1, 94, NULL, NULL, 'Utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

DROP TABLE IF EXISTS `resource_template_property`;
CREATE TABLE IF NOT EXISTS `resource_template_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext COLLATE utf8mb4_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  KEY `IDX_4689E2F1549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0),
(24, 4, 139, NULL, NULL, 1, NULL, 0, 0),
(25, 4, 145, NULL, NULL, 2, NULL, 0, 0),
(26, 4, 131, NULL, NULL, 3, NULL, 0, 0),
(27, 4, 123, NULL, NULL, 4, NULL, 0, 0),
(28, 3, 139, NULL, NULL, 1, NULL, 0, 0),
(29, 3, 144, NULL, NULL, 2, NULL, 0, 0),
(30, 3, 163, NULL, NULL, 3, NULL, 0, 0),
(31, 2, 8, NULL, NULL, 1, NULL, 0, 0),
(32, 2, 20, NULL, NULL, 2, NULL, 0, 0),
(33, 4, 204, NULL, NULL, 5, NULL, 0, 0),
(34, 3, 182, NULL, NULL, 4, NULL, 0, 0),
(37, 3, 223, NULL, NULL, 5, NULL, 0, 0),
(38, 2, 225, NULL, NULL, 3, NULL, 0, 0),
(39, 2, 224, NULL, NULL, 4, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('0f9ebnmhsdile2ll5rqmbupo9b', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353630373734372e3432393738373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227364756e7539326939396e75376271716d6c6e6735726b34726b223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353631313134353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353631313234353b7d7d72656469726563745f75726c7c733a34343a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732d332e302e312f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223530366666323035313463396265386536316533356363356230313562656365223b733a33323a223062623664303833386132376334343866653339373831356266646138656230223b7d733a343a2268617368223b733a36353a2230626236643038333861323763343438666533393738313562666461386562302d3530366666323035313463396265386536316533356363356230313562656365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226264313538323237336664646164626431653832636433613733366262306636223b733a33323a226231333634376232333634663132313639343731646464333837616232656332223b733a33323a226262636261366133353039383637303933333263363132653862353034373133223b733a33323a226533386430313561636234366135343537656436653762303663613864313861223b733a33323a226335323135373537383863656665643232656239633565386234396437633765223b733a33323a223231613039633138653064393462636561366236613635646433663835643937223b733a33323a223933363239616263333532653265633161656334643239316463366239353238223b733a33323a226533323061313539393462346536346633343864613330376139353434373937223b7d733a343a2268617368223b733a36353a2265333230613135393934623465363466333438646133303761393534343739372d3933363239616263333532653265633161656334643239316463366239353238223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605607747),
('15us45eksntphj7t7guc3pnl7c', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630343834353739392e3236353736393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22313575733435656b736e7470686a37743767756333706e6c3763223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343834393339393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223931653331363261613565323361373938356363633263353837383637343333223b733a33323a223733356634336636313763653837396335353436343262336633653964653735223b7d733a343a2268617368223b733a36353a2237333566343366363137636538373963353534363432623366336539646537352d3931653331363261613565323361373938356363633263353837383637343333223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1604845799),
('25qmcnkqjph68bd25dlejpu8u9', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630343834353739392e3130343138383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706f3073686230363672693235326f6f35656a6a6537656f6435223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343834383935343b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343834393337353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343834393338383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630343834393339323b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223530383335313337646530613436383461613165346362636437646338313666223b733a33323a223335653038376333306166666133383936363431393836323739386661323062223b7d733a343a2268617368223b733a36353a2233356530383763333061666661333839363634313938363237393866613230622d3530383335313337646530613436383461613165346362636437646338313666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3837313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a226237343363656238353535656464356633393762633737313936663936663533223b733a33323a223436386539376237633632643731393861313862666662353334616436356434223b733a33323a223462396136623231383733646262333132366530393334396531393562616339223b733a33323a223537623863383238653638643337323035336635363966326532366331303465223b733a33323a223431653066626333613164313239626566663533393537643266646331383036223b733a33323a223630333930343235316332363938663066393736383764313961333163373831223b733a33323a223463383463363937323731393838623734356332616362643935323237373761223b733a33323a226336323461333435343535666231366637353966626464313435333334663666223b733a33323a223232623462316261353532653739333664666362386331363661376361376539223b733a33323a223863643234313265356130396537643761323134313565373664326561653232223b733a33323a223261633566346138653662633734666165643864613163386664353036643763223b733a33323a226666343639643465356538626630373830623464303037653333393962643434223b733a33323a223534376234386132336564303830353161376437343261626133383335373461223b733a33323a223366326530356261363931613731313963303366303835303132643464353237223b7d733a343a2268617368223b733a36353a2233663265303562613639316137313139633033663038353031326434643532372d3534376234386132336564303830353161376437343261626133383335373461223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226536366532396164313736373331303830656237656331343066363966376536223b733a33323a223964353763383332336262376433336662663663316134623661343830663538223b733a33323a223830333631663235323033356336623635613164663130333533366461353230223b733a33323a223966346663643836343936623730643964646537666537306164383435373663223b733a33323a223564393232313633313331643435633137333239333831313333616665633963223b733a33323a226562393834363564363961353433626136373466396135646666316539383639223b7d733a343a2268617368223b733a36353a2265623938343635643639613534336261363734663961356466663165393836392d3564393232313633313331643435633137333239333831313333616665633963223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226462333635326236646535333030663135386366396638396661623865613862223b733a33323a226538353530373530386234386636306230383938363864336338333436613733223b7d733a343a2268617368223b733a36353a2265383535303735303862343866363062303839383638643363383334366137332d6462333635326236646535333030663135386366396638396661623865613862223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1604845799),
('49j3j4eg51f4u0r8fgqf7o6svl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353434333037302e3337393637313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234396a336a346567353166347530723866677166376f3673766c223b7d7d, 1605443074),
('8906gnb8c4og1bm0hd1up5jvoe', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630363732343231302e3031313138323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226730313333336a616c397368333039616e656834353175687366223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630363732373830323b7d7d72656469726563745f75726c7c733a34343a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732d332e302e312f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223730326461643364613933363530313532323362666635383135613337363939223b733a33323a223763636664636665373230366361653431386632386535643037313431326135223b7d733a343a2268617368223b733a36353a2237636366646366653732303663616534313866323865356430373134313261352d3730326461643364613933363530313532323362666635383135613337363939223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1606724211),
('8mpfea4oq176drhso31lbfj3ib', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630363634393733332e3935343834333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223772687365316f67646b6571766175717538646c686472696d6f223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630363634363231373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630363635333333343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630363635333331373b7d7d72656469726563745f75726c7c733a34343a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732d332e302e312f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226439313830336665623830666366313866333230613434313835643238353732223b733a33323a223035613832653733323937356331323037336463363164313534303565313264223b733a33323a226139383637623532353231656537623764326131306334373266653761326538223b733a33323a223732306538343662363965353430303735333462663336323931386538626331223b7d733a343a2268617368223b733a36353a2237323065383436623639653534303037353334626633363239313865386263312d6139383637623532353231656537623764326131306334373266653761326538223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333335323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33383a7b733a33323a223634366431393839653035353737666662376662303665623933363761366134223b733a33323a223261663865653466363738633166663633626262613030343166396261396165223b733a33323a226333663439366639343932663433373462623961623932623036383966656130223b733a33323a223936356431616537656165346431393938613866366332333361383565346231223b733a33323a223234623066333337653834613339396431613737643139363335313466303266223b733a33323a226262373234656461646433333564653533666662623833346235653439646362223b733a33323a223631643162343533383433653166333561336663666330343730613839623939223b733a33323a223865626337316635656438386131623230373631323230323764383038316635223b733a33323a226164623232383132336136383564653332306665373938396333613132616633223b733a33323a226666646231666566663033393963323262626337653931346238303761623562223b733a33323a223238383635326363646432386464613034623337666166323164336333363139223b733a33323a226338656262353964663534336562643530313534386635643266383961386234223b733a33323a223061343465313365366366643765303235343335643930396332613232356635223b733a33323a223130623262616564373434663261313933643662376231626131633866373663223b733a33323a226266623233626162373066346239393331303764633939656132623232376239223b733a33323a223562303165376664623661643935396330633335376632343030613464633535223b733a33323a223430353133646164393462353135333930303532383935363134643931363161223b733a33323a223664613264383238613435303335333933333335373831336230373366616131223b733a33323a223234323465366666663661663132623163616131653864303731313135643538223b733a33323a226466303136363939613330323031383232366534356132333362663233356666223b733a33323a223831363037343336613066333831613736366165623338643836386538666236223b733a33323a226436306161303635383265373835326130326135386231313331656562343566223b733a33323a226138393934656363333065333138653638626334623037363837663365663562223b733a33323a223636663062336633326639343464623738303866386130633834323932336532223b733a33323a223364333939646464643934656232646566366661643534303938366237376136223b733a33323a223733346664313432396630323964326166393230316265356566326336653632223b733a33323a226539633536363833316331393261316161623963386265333835363864643566223b733a33323a226262616633626633616637386332386663623363343361626131346334303433223b733a33323a223039663262306561643466623930323430393261646430343831626562343436223b733a33323a223638333432663633623631306661326434313533376364663531663039336639223b733a33323a223034643032663333326532393631313233316436333038626138623439346239223b733a33323a226465353435633562636362393039646663643362643664363339643337663164223b733a33323a223864373032613130343865643365326330363333316537393132393330666437223b733a33323a223731626462643766383734303661623262313062343866366638636239303966223b733a33323a226639356239613264313436353437633636343532643539633033306638386532223b733a33323a226531316231393961643333313239623464623233366638633565393866663535223b733a33323a226130343462643134336665623566376632326335323064663435316634316166223b733a33323a223033393466653739663962353430363130383738666436336633643463633531223b733a33323a226234323361376133613530396238336331323134306432303433373232383863223b733a33323a223431613839326631353664363636326535653036663166343835366364666131223b733a33323a226162653139636430653166363837653730363039373265643734356662356431223b733a33323a223131343939336133373932343363313139353064653036396639386461333762223b733a33323a223333366631643233613166383763366531303833396239326138363236633661223b733a33323a226134316363376232356665343035316437396132613737343465653031646132223b733a33323a223531646133623135383335653966313931306165623938653966366465653630223b733a33323a223137646131653764663432623665346465363162663733313362393435313461223b733a33323a223231633232303130373137633366306130333039666233353563373862636335223b733a33323a223834316432626230323761623830626165633161313135366339363837613838223b733a33323a226362323065653265653366643530616562616363626466373963353061313464223b733a33323a223665663539313437366437666366306635643135393937336438666634303463223b733a33323a223434303037343438303537633366333435333430353966373564636637396361223b733a33323a223164386237356133383064656661326536333264613837326462666137633865223b733a33323a223937666331623762356562306463666564663166336164353365393931383033223b733a33323a226238666438643363353733623535323632623438363539373930346436346336223b733a33323a223064316639343235343666626563623138343735383763373139376239363566223b733a33323a223937386339643163303964393633393032313764343563363437666165313433223b733a33323a223733633632656533643037326234336438303436653731663961366663646438223b733a33323a223165386532316132323064393836313735313462333031393766626435306166223b733a33323a223762333437383232323731373238323730396630623365343130373561646161223b733a33323a223466623732323032623865343765623561333137366538613966333466343630223b733a33323a226535313837353431373762393332323861656139646165306261636561313933223b733a33323a223664663363653364343162373932356566643235663930643330656565393936223b733a33323a223664363636366535316662653133646430633064303066343265663032386163223b733a33323a223761346465313839333034383335366331346133333566663061396532656330223b733a33323a226132653235333234303465626365353265373938333165393033383635303030223b733a33323a223434383038386562323834346437393637343035653366366262323232626431223b733a33323a223061313464363434623466616634376230663733353133616161656230656665223b733a33323a223534643131663230366563336334353337663037613732663138613661656366223b733a33323a223438336534613365343231333235326163626333323331393932613638366165223b733a33323a223562653837323337383164666465626666393763303164663764373038366164223b733a33323a223265373838663339623336363236383136323962336530326232313437326163223b733a33323a223436656463616461373664663064376634316565303336383735663532356534223b733a33323a223232353831343066333339666663656635326261643965623062643163383030223b733a33323a223362383436336432626264623236393636366631396339663539313864663436223b733a33323a223539643332323739646333363239626332336436623232666631383438386636223b733a33323a223433386330383538363666346533386634633365613139336333306232363236223b7d733a343a2268617368223b733a36353a2234333863303835383636663465333866346333656131393363333062323632362d3539643332323739646333363239626332336436623232666631383438386636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313531323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223430626133363162323137643965323262656235623931343931386330323438223b733a33323a223365663161356637626537306563343065633732373437373364643663623738223b733a33323a223339383832396562386234616331623133646239396139663537373161383062223b733a33323a223462666236666535303830303566363662336665333736623038326562383732223b733a33323a223065393935373834373334653535346263626631383936663530633131313162223b733a33323a226162356662663131303830383735636231343761663030363834303932363432223b733a33323a223066383664653461613161643936356263363437393961656134333831383663223b733a33323a226233333330633434616161623537373461333631613435386363376230353362223b733a33323a223436343732376232663039313966613062353832396564353239376664356333223b733a33323a223339656361346139303361306633346462333837633733333634323135363461223b733a33323a223461666633303931323733636138343263353936646337346633336437313131223b733a33323a223834373239313436313934666363396333643937396664366635616230643963223b733a33323a223366633162363161643261316430306239613861366463613030633234353261223b733a33323a226261336435373738633163386632333233353062663062616461303037646166223b733a33323a223961326531376164613065383734666666323462636361663132366533393733223b733a33323a223065343934613135303731613234623135333332663133646264623633666238223b733a33323a223561623461613764363331656533643666373032333734643130353839353432223b733a33323a223937376531323138616238663266306463353334323738396638333337626165223b733a33323a223331343865656434396565616661646430336137653131656535646363613036223b733a33323a226363656562613536323762323731316261366662633061343130616265373265223b733a33323a223636643138623965626136316336356238616434333364393163663339336163223b733a33323a223837316361313835653836326231316130356530623966313039346266653562223b733a33323a223862346166626334633130303664653531636465633261323930306464663861223b733a33323a223963626234383663353164383033396565663964623838393036646266326137223b733a33323a223064623430393637316339643137353335623032343934643935656336633635223b733a33323a223638343033613634373237633832323563663532623361666537336431633463223b733a33323a223366323336643537353931373233356234366563303133653365326137306131223b733a33323a223163646133663533663766323962393930646634353238356639393363376335223b733a33323a223531656163616136363934643737313135386231616435666163653565333961223b733a33323a223861343530356431666538643465333734323563336562656333366336393733223b7d733a343a2268617368223b733a36353a2238613435303564316665386434653337343235633365626563333663363937332d3531656163616136363934643737313135386231616435666163653565333961223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1606649734);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('b5g3p7nmfgsg5suots3bfklsb0', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353435313534322e33303433333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239326b7437726d753869327574386d6f353035707070666c3934223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353434363637373b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353434393134333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353434393938343b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353434373437323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353435353134333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630353435353134323b7d7d72656469726563745f75726c7c733a34343a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732d332e302e312f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226163306265303635363932386433303232303835313362333464666136353839223b733a33323a223065353263663139376137613565623832633966646332623466623063376430223b7d733a343a2268617368223b733a36353a2230653532636631393761376135656238326339666463326234666230633764302d6163306265303635363932386433303232303835313362333464666136353839223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313433323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a226233626632316131633932363663643735346566356362363763626637353964223b733a33323a223963663462343230363961643937386638333031643437653732646662343231223b733a33323a226664343265386437613864336634333366666537626535386263636462313638223b733a33323a226137613835633730663931356165653638396431373433393238656537353365223b733a33323a223764663130313431646561373761313438356135383135393835343437633334223b733a33323a223839356165666363343066323465376239313336343861646437386165343032223b733a33323a223937613835353837346138393338336433626365616432636137373832613065223b733a33323a223731653337333037633462656637633630353362646536646435623133656161223b733a33323a223730663234663939613836303962346265313164326461306531393038336463223b733a33323a226161356231663534666161613839363638393335303461313363613665326130223b733a33323a223930373735393765383634636666616633326363393331353765343434303166223b733a33323a223737663530663638663537353136383235393463313766393235373431326261223b733a33323a226231636563376362393233383936653330306436663965373436663337303564223b733a33323a226438306635633439363865653161636163346366653337333935376263613866223b733a33323a226265636538353931356536333063663335333166333235356534383463636363223b733a33323a226238396235633537343663376562336333653939303036333438373839303163223b733a33323a223437373537656433626266326463383963623937383137313937373263333763223b733a33323a226237633661363135663562386238663336313731633136333236303166656365223b733a33323a223738333038643036303830373331346137333230356164633763613966386562223b733a33323a223566613330343865633435616662343466343134303238646536636462396663223b733a33323a226666343964303864366637313663363664393734663338613536656433656437223b733a33323a223661663961636461393130633338363432323266363433393831313534383063223b733a33323a223062303335343132353264616262343162633934366638306435343865643933223b733a33323a223334646531356633323863376661653438323064616236613335303131666232223b733a33323a223635633135366332613636373435646537663461393962636130396238383936223b733a33323a226163373238626165386134333239303238636464666465316630653962653964223b733a33323a226461316133663934346633613239373365393064323330653236633531393131223b733a33323a223862386438396166303965396331666264666332623130656333323330613862223b7d733a343a2268617368223b733a36353a2238623864383961663039653963316662646663326231306563333233306138622d6461316133663934346633613239373365393064323330653236633531393131223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323135323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32333a7b733a33323a226439343434353530303563623661656136393433393937336665633064663564223b733a33323a223231653336663833383665336537393565626637376365303464623834356639223b733a33323a223866363336376262323032346433356637303363303333303533393030363033223b733a33323a226531653062353537636134363332353461343731656531373534353035326634223b733a33323a226265383237376532383438363166393637333064346265623166643365336362223b733a33323a223162616535633665303935363131356531326361653135633930613237626430223b733a33323a223834363039656564333535333930653961616339373861373934323336363766223b733a33323a226465343034613735386362386530633632393731306362346439343936643563223b733a33323a223739386438313035613130623633623562366164356564386238336633313834223b733a33323a226566316363323738303835613439646366313339323762633630653237613039223b733a33323a226636393738386130633264633338333362373930623238663465663363306630223b733a33323a223631613863643062643163636130376531323762313863376430626161303332223b733a33323a226632333737643836303039633865663235306339396365666132353463313531223b733a33323a223139373735363032386539646232363666653565613335316332306164366262223b733a33323a226361333437386266366338656366633234633964336461646365343335396634223b733a33323a223232366437363532316465616464303862313964383737303862343837363038223b733a33323a223964386232613330383236623730373533333164636164633238643266616365223b733a33323a223931313633353135623036356665633164626238633131616465636164386266223b733a33323a223639613737316332616630326362356565666666626531633239373533373863223b733a33323a226561623537363535346430366563316434326662303236356239306337633163223b733a33323a223439376334346536363266326637613432643134646364646162346239333336223b733a33323a223334363661633161316563656537643230366464366539353963353636356530223b733a33323a223065323432323032613864636234336535353534613461313834363438623836223b733a33323a226462646561356265636437313563326630626163313265326437326166626430223b733a33323a223663333166646239616338363466363863306235333630303763306432653164223b733a33323a223063663061393161363166353131373730636336636439383536346464363164223b733a33323a226366623131336564333831376262633836316562373733316439383064313034223b733a33323a223765393461386136623138656561313639333731383335643466333262623434223b733a33323a223630313432663537336335323431613530303638393863386164326432643339223b733a33323a223132393131313132616163373066653637373232653131333835633732666132223b733a33323a223361366332343535376239636263636335653332386164366232313038306361223b733a33323a223666623164313565346332643462303563393566346136623666373639363539223b733a33323a223431373739383566373336653933346538613339643037656639303439333762223b733a33323a226531343539636532653031613765376538316339616232643366336639663534223b733a33323a226432643739356533643963396135623463653936396230626138356232386662223b733a33323a223231356163326165353765313433663832653065613632373636623130616561223b733a33323a226264663032346238366139396332313865386562333533373461326632613233223b733a33323a226564323463353961363635613233643230333665326531396262636564376164223b733a33323a223962396665663633636437663739653265353138313436323334346331666438223b733a33323a223165653438616230343939393564626230333631613764643665646336663634223b733a33323a226238633164393262636663656161646139643731376534646266303366303966223b733a33323a223432333162336161663066303863363333656166303832373233313036356562223b733a33323a223466383230306638623235343463396538323631396636613365643664396562223b733a33323a226132303836333338336539633638306163653962663930316331306230643661223b733a33323a226466353263653563363062636539376430646630326166383836353764633561223b733a33323a223963393739313664356463373265626364376633303035306361323930313738223b7d733a343a2268617368223b733a36353a2239633937393136643564633732656263643766333030353063613239303137382d6466353263653563363062636539376430646630326166383836353764633561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223131333935366130343532333661636538653234376231343466393534656436223b733a33323a226636303431633965373366363736366163633361343864366265343661313938223b7d733a343a2268617368223b733a36353a2266363034316339653733663637363661636333613438643662653436613139382d3131333935366130343532333661636538653234376231343466393534656436223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a31323135333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3134383a7b733a33323a226631373834616261663232393932346631616466396233376231313039646139223b733a33323a223761643966343362303137643033336135626536316333363264626434393765223b733a33323a223035353238636131373864306266336539336437323533333262303033366231223b733a33323a223733623463323235613963396666623465343934663161643337326238366430223b733a33323a223261376562316134323437323766613962326239656339393732326635663332223b733a33323a226636613334303237373662333434313736663166386238393038363437656337223b733a33323a223637386661393233373334376134376430383666636663623734643632346663223b733a33323a223039353334363466356130343538656336623938616237363038326232633939223b733a33323a226532663866326131336137373238316163386637336635336432373463636631223b733a33323a223362663635646162383531663437353039363964353236313265393436313566223b733a33323a223264386530613839623637623630623064373934653731353763346265303565223b733a33323a223430363866306438373061633730323436626639306530353864643436333539223b733a33323a226165333964316464333763396164373132656630303538393033326631346564223b733a33323a226237393965303961313337643034666232393264373664376636623938373831223b733a33323a223839386566633832373764626231303636643936363263373734653337633638223b733a33323a223532316339613661313030626535653865626561383562303963653630666133223b733a33323a226636623564373661366562653837343539366331326262643937613361373336223b733a33323a223635303237656564643630643336306534376665373662663934333539313061223b733a33323a223532336464656363623765623531376566666364383966663538343466353764223b733a33323a223362323065313836613562383662623236653262616238626566363862336634223b733a33323a226161363235643062373936326134323933353663623265663934383762623961223b733a33323a223735383533656666653062646436626361663136316135393362653462306335223b733a33323a223937343665373432353736623764336634343332363931383837343239333135223b733a33323a223637323565343037613964653339336563393363396664363633633532626538223b733a33323a226164316234633662313437393136303462353037323036326230353930613365223b733a33323a226430313332303533346635663132346137373131626362396664313764663931223b733a33323a223437383361346538613861646462656165323539323066623130333334346233223b733a33323a223061633339386535323131306138663432326333313531313535666438326262223b733a33323a223461333633373532623037666666663138383039333733616563623238386662223b733a33323a223166646337633733613830666562376236303162323664653536653136313265223b733a33323a226163626161626235366437316137656139616635303634323030383034303633223b733a33323a226266363665333232306165393039363031343930383961666332613639313035223b733a33323a223835653339366165316561333162313738333633623338393061323164346237223b733a33323a223034633730383662383239333164393163303936613665373065626136363163223b733a33323a223132626264306130396332366138343561356264393839393330363234326138223b733a33323a223038653537343632393461326565393631633135623164323864323736336533223b733a33323a223936626435363236646565333062643234643131383463306236376531623337223b733a33323a223938363162613137663037396133623061336363623939373664306339653762223b733a33323a223566313165303962303132643363306665383630623435363661343835306131223b733a33323a226437303131383238336537653932383438313732666238643136666266616362223b733a33323a223939353435643764393862666335643530336633303961303731613732336231223b733a33323a223738333532666136646562373431333433386232623261356438626537313033223b733a33323a223564663465643639616163656531613536313266663038633865323561373865223b733a33323a226264386238353038386162343831666436666230333737643036303739656164223b733a33323a223030633162633966353366653432333962373739663334336263666336653139223b733a33323a223532323633666536333331383934303336303431393339333863306332303835223b733a33323a223934383863373461616337353763626462386332336238343965303537663431223b733a33323a223630623764626439353166353464383634363631363131333465383166383731223b733a33323a223538306266383734613031313464646562646233343038623566626437343965223b733a33323a223331646132313262376237616431313461633734633736316136616534383265223b733a33323a226636306166663766656337386236313834646163333132353763633136633333223b733a33323a226134306330613431306534623331343331363266303065666535653736653366223b733a33323a226439333031666362666531646563616363323030343937613362383339373739223b733a33323a223361346137376664663137613734633566623836343764366437623664376636223b733a33323a226634353935373535356261633031383763653666663936303762613664346138223b733a33323a226435336239386532323437323831653665646337663138323330393563386666223b733a33323a226539623730383162313164636432396266616238633463333033626331313165223b733a33323a226165323338656464326334373264623134383064313363343638633836313961223b733a33323a223737653433333737333165376437656231386538646433643462343966646434223b733a33323a223862316334613836383631336332656430343730386439353338393666303731223b733a33323a226665383838316466383739613533663435633039363762363135353664363934223b733a33323a226662646134336339303365646239313132646637623665336437613061303131223b733a33323a226536613432393461313838303934386135383866383165623135636464623836223b733a33323a226631343465326136333031663761363266663430663638366365333062366337223b733a33323a223430633230613735653161613863303433643563663064323532636234313930223b733a33323a226333356366653163393566333564656566346631363766646437383035323263223b733a33323a223362343533323436373361383938646231323539386238623738316563623263223b733a33323a226530323362396336376262376439643939356539313637326638373661383236223b733a33323a223131633833383864323263653565643330666165336231313963303534313333223b733a33323a226139663635366332326564656331626162393336303365633439643939336566223b733a33323a223461396264353861626162653161326663386633313163643563363137623833223b733a33323a226136336162616232303666613966343131303263613135393736343466333632223b733a33323a223465303037306335333537303939393535326334336231363261613866376431223b733a33323a223065383838383030363831633537646436663834643461663732306339363638223b733a33323a226630656562383665633064333334643633353437343362316332643137303833223b733a33323a226236356566333431326336303637363566346432653164333161393062363466223b733a33323a223933323962376662356130613263333639353562323161636564333832306566223b733a33323a223962396435343863633964363834643563336164666534643632376662396430223b733a33323a223335663863643330636561653632623534393939393465303266636562353866223b733a33323a226332373732313763323634363136343635653239636266303438336537613038223b733a33323a223330663362383632373434373331396166643733653135363039393664663636223b733a33323a223864346635353566366264663738383538636232633636393561333262636134223b733a33323a223866343063333065323536643037613739316132396665373264333336613231223b733a33323a223866386164366139626262326131383735666434383530313334626139343934223b733a33323a226634316539643762656363313566326465386536323833313739356266653664223b733a33323a226234363733323031316535383231343934306265656364393630306362323031223b733a33323a223061653061656166616663646263393065316361346632643936633363326430223b733a33323a223031356639343664376163623630323439626463396362343065306430626266223b733a33323a226665633134343938376638616263363565346462323639616436313163396131223b733a33323a226332663564363362333163613738666439363330386561346462313430383461223b733a33323a223266383934356633663733376539383237386134626562653133353139323837223b733a33323a223630323039646236333665366530343930353031336666653465326133656231223b733a33323a223731386365623562326436623831643630616339386236313836336338336661223b733a33323a226361396532623733353664626439313063616662333264306164316133646136223b733a33323a223932643036633830653937353731303434663432373231613365656365363835223b733a33323a223763653162396364353164303437646533383233646138336436666438613233223b733a33323a226332313064363936656436306636303532383365343462613365366533643533223b733a33323a223431306533326336633965386362653132653135346532313634623731373633223b733a33323a223030616263373361393438306439323361383631616363653465663233353561223b733a33323a226638663533666364633734663235373335306163393433623930616262326639223b733a33323a223063393732313038313237333430333364346465353761313263626437383035223b733a33323a223031316635323837626363386139633462316564636438613961326132396639223b733a33323a223931616430666138343437366638316236336531326439316433383935323838223b733a33323a223666303636663561353338643939633030303637666261613939333265623636223b733a33323a223933623032643665383261326132303233376330396535333563643738333865223b733a33323a226432616332633130646436613534333831313833663736616135363234363637223b733a33323a226264643036353030396334306238636661613964623665353939366531333963223b733a33323a223536333764646239336361306239636132323237316233316630353561303735223b733a33323a226130313838383466393361393265316562393231356530303937383035373032223b733a33323a226331663864383831636638303133643730653664653365666262333862346561223b733a33323a223164363131323337333862393235633566343662643333316366653133346136223b733a33323a223038306263373665376261623131353230303639393137346232346431306536223b733a33323a223861626164376635626239636533653937303330626261303061306165363664223b733a33323a223831616539626330636436343330343631383339376365616632383737626533223b733a33323a223963313230343461663232663739623862386262313562346663383066363462223b733a33323a223361383662353238303465336631633132383835303463336137326333636430223b733a33323a226364303431333631356166333034326365363765616331393331366132366435223b733a33323a226233663264336431353032653666373064343662336532323466623031663033223b733a33323a226134386161643139313565333836373961323061656539386466636562323836223b733a33323a223231643965383036343261323233396632643033373232663631333235353465223b733a33323a223833623166643934393963323133303630363861373335646166303533643432223b733a33323a226662316162333133333238643563343163333465306231393662343836666634223b733a33323a223633313839623032653333393132376439663464343932633164616362633537223b733a33323a223234393232366361303635353534326266636561636561373066626137303466223b733a33323a223861373734653165323433643937323135303637333132373734643661666466223b733a33323a223030646539303361643161393465353063316434316337393863366238343362223b733a33323a223362383661663264333363306238313962363863663462663761663230656534223b733a33323a223235333537346362613338326338643762373464353736373334303533353166223b733a33323a226264383639366163303636323832666439663366663232313331353136373835223b733a33323a223461623435653532363839313666636537323535356262333838666438346363223b733a33323a223137323339643038613834356537636563383365626264613361316631383066223b733a33323a226466356230316461366539396465323230313132393536393033323034303539223b733a33323a226138373935306565326563616334353731336137316138656633376462633866223b733a33323a226630633535623264393136306238386235616564666432613435373136643166223b733a33323a226266653761663034653664323062343735656532306366326562396333346333223b733a33323a226437633738613838313337626233393636366566623435613636373232353635223b733a33323a223037386530363938356635653163626539323030666535663434366438313332223b733a33323a223337386530333934663466363239386639346539613461633037663833633365223b733a33323a226463643139633430383563313665653439313735343761363936613839613263223b733a33323a226262343438343364323032393531363664363232333933623833323530313463223b733a33323a223536346430653839303035376639326534613237653064613638386339373731223b733a33323a223538633735363737396463316636353564373233373034633135356331626433223b733a33323a226432323364653166623461363339613235663931393736663664636430326435223b733a33323a226663616532356638623037643232316565333132636230613437393334656339223b733a33323a223830323231373562373538663934396332303236643066373164353037646430223b733a33323a226130653665346539656366333030653461353133333137356336303338316165223b733a33323a223939353563623064633764623033373736653831356664393766616262313063223b733a33323a223637623665373966633731313337363230623734363337303637623831623264223b733a33323a226437633438373134633530366235613437633237666465386433373961633338223b733a33323a223832373431326439656237663764343531313465363533336463323536383234223b733a33323a223464376238343038346631643964363065396235656639316635343666623066223b733a33323a226261343438626238633864353865656337623135366336653661653664653435223b733a33323a223565613031333437656337646234303436613434656532323764343164623661223b733a33323a223831336232323531613362623362663137376636376664636338663036633735223b733a33323a223862323062386131323037326437393265656463363437323435656661666134223b733a33323a223131616231313233356338643038373638346432353934326232663363663139223b733a33323a226232396535666530396361326465656335623966326566626461626565386265223b733a33323a223063303134386137353862663533396431646137636139633431666338653339223b733a33323a226266626662633333626530393663313961313237346232333838383731376334223b733a33323a223764613332303234616230613335613336323733343233376161656135386363223b733a33323a223130393264393666656666353139323336613731666231626465313034396163223b733a33323a226430623338383432663861346633363537643537393635353666613438363831223b733a33323a223464616362386431623035316139333162346161383439616636353261623362223b733a33323a226134613364363331316336326365363364666532326531363531396566306238223b733a33323a223730373063353364316331346261396339313664623161656530373561396562223b733a33323a223066306232336232346236373831303133643239393430356664326135336266223b733a33323a223334343636666436633261623736653265656534383234356262343062626232223b733a33323a223233386434376434333130376163313964323962316630643232303065303033223b733a33323a226666633733656239636266336233663532343538386634663233333364616165223b733a33323a223036623236616464616166646335366438306539626163633337623737353636223b733a33323a226237396236343130346337636532316539366130393262393563653763613664223b733a33323a223030663030613966616236393864303465353631393066636433616664616437223b733a33323a226364616434646632656339643939376436613037316665383834343738353438223b733a33323a226164383837646533323965653061386265313433663035653062613066303936223b733a33323a223634633863653536323830383235333737656331396339326464356534333233223b733a33323a223162316165643764643964623934303161636234636431393364393733633362223b733a33323a226333316436386666636138656561326237373934313536613166333037313261223b733a33323a226137343537613465663363383663346130373033613564363335616561656332223b733a33323a223738666439653435313935303535663264353433376634656164393439336661223b733a33323a223466336539376261363237623435346236396134613635386433623739393865223b733a33323a223135613137336633393637366638653861356637326439303362316633613063223b733a33323a223737393366353163663862356336393836383339333336306262313165333135223b733a33323a226363346337356338326134333332383934303436356561316539363266663462223b733a33323a223334353239383230393034646161356333313437363637303666373930386432223b733a33323a223939343435666565653832323363363762386566373963386439353236306135223b733a33323a223839323938343736373461653733333036643630356466396230383965633164223b733a33323a223738343465393938323836343530653333313831623362303763366536353838223b733a33323a223562393166326434366462613530623230396233326161326630346237616261223b733a33323a226638326263643537323637646336633666366532363566336565633465316436223b733a33323a223030343964303332653538663232306136343439386433616333663436396639223b733a33323a223630653438313966386331623035336436356137616564343131343331663734223b733a33323a223563396661376463396638353266666638356430613431316633386538303733223b733a33323a226136393138613131613661356339626634333764326165333331336461643362223b733a33323a226462356234316661663936633263633435353865373832663363323261313565223b733a33323a226633323765616166343736313237333834333565343863396262633334373237223b733a33323a223135623339303933313535316334393638636463333239373234323639633635223b733a33323a223665666338633065636532653832666331373839626430313963623736343266223b733a33323a226661386237343266396637646238646534663938323130613562363461623739223b733a33323a226662656461363137396336336139626461313331393330306536326533356133223b733a33323a226663363463316139633737366439613364343066383334346131393236333133223b733a33323a223231323238373261326465393861366563633735396334313938663764313436223b733a33323a226235326138663464623366376235633035356131343235363337636639616561223b733a33323a223061663865376334396637306134653237643833626132303865366134356636223b733a33323a223031396463396338633838643465353032363234323462393864323931633436223b733a33323a223036353965336537653730626138656339323939323430613962333865653334223b733a33323a223862633431376566353466356638656561666330306162313363353837346266223b733a33323a223639663430303332636466656264633564373134336264323561313430306436223b733a33323a226631343266633930613666396561313338303333353139303433666566613332223b733a33323a223332616136333733356261626361363633396565346633376164346339306462223b733a33323a223337353637663139376130653235303631373866373533326535333634353338223b733a33323a223530333136303336316630366462376439646663636162313563303661643838223b733a33323a223866356364303935643436663263376139363739393932623638613362383765223b733a33323a226237376263313261313531663438383766396238613234663564373630653866223b733a33323a223134343330666132653264306465303064353038383133623531666439373032223b733a33323a226662353064303263373064333537383330613131333233306237613333633163223b733a33323a223565656237363438633933356433306131633337643832323466366635623233223b733a33323a223764626335616435313236643038346239326463363964393736323231373064223b733a33323a226134393938393931643563663361343138666131303439616337656361643832223b733a33323a226539396436663830353665333961376533356333633539353330336565643964223b733a33323a223730656538646466663931353138653133313130376332656335633763386635223b733a33323a226539656162323363313536363166313363663761653131653536613562613630223b733a33323a223066363639316231623535343266343033626239373935633339323839656464223b733a33323a226434633138373061626161613135306337306232666432396564363164643138223b733a33323a223066383561323563323361373966313831343962613361346432393965653539223b733a33323a226261346363326463663237633566306161323239326466623265666338303734223b733a33323a226335333335613862376434343831386563316163353339333434613763633864223b733a33323a223535663561656634626364663235363530396130363361363434343763646135223b733a33323a223037326264393539663337393961363037346434326334393532323038613666223b733a33323a226132346438643033383366623632313336653662353266306538663630333336223b733a33323a223635663663653466656631346637616139346361363036653839303239663033223b733a33323a223836303536363863663061353133376338396435396233373534643232663165223b733a33323a223463336436396663613563363638393631373963613064636434653638386331223b733a33323a223939623935366431333066626165633231343330336262616238613865313866223b733a33323a223731613862333964303561633539336339613136346363663661313039616662223b733a33323a226364366563396339326164363565636165623433336637373865386339323966223b733a33323a223137636663303436393037323862313036353862353031396363663835363734223b733a33323a223934656566643330326133656436376162636562666362363330373032333062223b733a33323a223136376435623032393733373363396563393463353061353963653435646332223b733a33323a226636356136373165626334323165323533616663643538373436363637366238223b733a33323a223536636237613330323030373234396462356562316562623235396464303063223b733a33323a223161336239636439393639313034343866323134306362303737376562353335223b733a33323a223566366465653962383830373138616466636663396136643835326436303132223b733a33323a226465623537643266643530323036663532646639623530626239656162646464223b733a33323a226265643061353639393530613735623566666366643636656237386264363836223b733a33323a226433396339313061363838333963363034326138356363633162363335333237223b733a33323a223563313261616238383561663363386564393633386637633438333734366232223b733a33323a226533616338663866366434343337643737396564633238643864383761303535223b733a33323a223163643532396438353731396234323039336531663239653732363639373161223b733a33323a226566663735346132313435616235636365653935646634366638653564346534223b733a33323a226532376236386532633330316630613239343263396163356335653131383266223b733a33323a226233643230396133623432363930346533306164626238633838353730343166223b733a33323a223361313236336139326435653032653030326139363866333034653231313764223b733a33323a223062363732633632356236333335636636353139633032323862353963323538223b733a33323a226465376630366364646334396135326333616635613535353238306238383931223b733a33323a223162613234366332666364316330386638663831626661343662303239313433223b733a33323a226534373235383639636334346264383334653431646566386164336632633061223b733a33323a226164366433623931393963666466313439646634383135303435323530346337223b733a33323a223231346362663664636638323163646439663263643933613831613664636432223b733a33323a226432666238333063613937356235613664646564623135666366623639623131223b733a33323a226239353961646164343332333864623939373136346163383239323665623065223b733a33323a223266336634373534636437373535646365653038633739373731383233373938223b733a33323a226365666235656463623465656137336239343266363064363964393765336138223b733a33323a223261376562396434626332616534306238363766653262373265646361336330223b733a33323a223535333236323037396165336465363932666666353636316166633332646435223b733a33323a226634353434306439373363383132643434306265613437316238626163353734223b733a33323a226436333133313264316439386664313863333033303064303435633131393330223b733a33323a226132326261393863356237646435393063623363373538326265353932613763223b733a33323a223632333837613865666532303238663532393030353964663231316633663165223b733a33323a226533663065363961666565626331366133613864393039366532643038613736223b733a33323a223031336239633834643066323736643738626632323166333066616264386331223b733a33323a223366623736326661323462343362383931666166303432366632336530373962223b733a33323a226134666134383034383664666335336465633139343639656162646235613439223b733a33323a223435616339613634646266303866336166326233376438323831613862653335223b733a33323a226262316531656461613035663362306362323564626462333130316539343466223b733a33323a226364343466666633316635353636383532373035383631313036656330653761223b733a33323a223363333439313930626438316662353332303236656664626137333036383963223b733a33323a223132376330383630366130303333393764643930313635363033613732656438223b733a33323a223239643432313265366566656264353263313432643538353735373737636161223b733a33323a223366396230643564326531386361333464373864666430333661373662373232223b733a33323a226631353566636336623466333930613130646431616232666630306637633536223b733a33323a223335623639393134353537323732623539333133356462646532626537663462223b733a33323a223963303861643165666635653036613130393338356534353561323863373964223b733a33323a223238313333343962653232336363653731323864373866663933666530336465223b733a33323a223133336461666165613638393261633439616533663865336331356636306564223b733a33323a223334396263373661346461616435663033333366383738626265373031626139223b733a33323a226463366663663936623535373036386661633936346134343135376131643537223b733a33323a226262613166623435323037363435663330383534376532396565353735373236223b733a33323a223663393062353133366537363834366136333466303066383337383934666365223b733a33323a223361383236613464316665323139376166663865653537323236636532393736223b733a33323a223437616663303563653761306161653036656665356261383935306266313864223b733a33323a223339373965613039616662353931633930313739326139333739323762343964223b733a33323a226462383132626661636331613132643763303366643539343630613738316134223b733a33323a223236373636343364373037653164333066373664363966613733373337633565223b733a33323a226131623139356534633338376636306565633139666635366666393761343365223b733a33323a226637666366353731373161383837373535656663303734376633323636626334223b733a33323a226633623965383366333062303830303133653766326166373232666638333633223b7d733a343a2268617368223b733a36353a2266336239653833663330623038303031336537663261663732326666383336332d6637666366353731373161383837373535656663303734376633323636626334223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333833323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34343a7b733a33323a223139353463326435663532633762343631633932343465613664626262333438223b733a33323a226462333965303635353063393835363561333033386564353934333539633031223b733a33323a226637303532353231326665643563666530636237363439393939646539323964223b733a33323a223162373134313662616361336434333661316231663533356265643361396434223b733a33323a223933303735313537643433613338333030623130363532303936623666656236223b733a33323a223432366431393365303635343365656363303639393561386566386464653935223b733a33323a223736303134393838663632366433346632333961653264383534633262383130223b733a33323a226632633838366239646366353731653731653663663161666666326263646538223b733a33323a223366653463396664393065643139353661626134306165623364396434343932223b733a33323a226239313862303335363561633230333535643834393866633639613533613463223b733a33323a223932333138356365656262623539353062643434333065653364653439646335223b733a33323a226338663530306335336431613930633030333034323762623432613566393233223b733a33323a226436323763343962373931383566333066616162663335653664623561386137223b733a33323a223437356561346164356330373664633363663030653037656263326338633930223b733a33323a223432343232376236663730626137613239346438393336616137663832643036223b733a33323a226537646463353831613935663731353434383764306461356132656636383262223b733a33323a223532386536323336313433373434623765316435316532373039633564666466223b733a33323a226264653362353933333839663936623261313933616365663833633531356139223b733a33323a226663323337373730666665323562336562323532333739366135396435366566223b733a33323a223539393664653738306434306633306234643134623363373461353233653135223b733a33323a223030633630363132613762633733623939306137346238326438313333646334223b733a33323a226530353132373163323563643032313536643662333266363165363162313363223b733a33323a223565613866353236613766373565666335656130613164326439313139643762223b733a33323a223761636261643739646632306336383739303433376638356462623661653534223b733a33323a223065393464626431346139646666623765316230633730626632326637643834223b733a33323a223230616434396537383139663638393565366365636537363661393433343465223b733a33323a226362663630623462633634636530313233663666663031353736373539636361223b733a33323a223333613030393033343464343939393537333562353736613931336131613066223b733a33323a223665366138366362346137623636613730643936613564653734656661626532223b733a33323a226332376366323666376635663061643939383366646338643162633335336239223b733a33323a223837386437376661333339623365393534383734613165353635386166313333223b733a33323a226435306366613865316364363338366364323230393462343230373438643735223b733a33323a223035613932303561333936346230356666656564313166633732313137303536223b733a33323a226132396430393165333865336138666138333563373164313134646130623134223b733a33323a223532356535396266303432393536616435386361656137663563323635376466223b733a33323a223631396563323631386438396531303834366435386136316362386163353865223b733a33323a223362353963313738393839383339623336303937363366656463333165386438223b733a33323a226264666534653061353564393131633535346265333132343435383139633936223b733a33323a223536306462616636346534383035326336386431623966663263626433393332223b733a33323a223939346233373764663263666666396464633866376231613037646361383161223b733a33323a223435653131613530356230303464376332376538356239323638303739343164223b733a33323a223036613234326633363366663536346532643266633465656137363663653932223b733a33323a226337393163653462626238663232343866376435616262613436313163313163223b733a33323a223337393162343638393362636536313261336366363231396166643630636631223b733a33323a226531626331396562346130663030376136346238346261653561646262613261223b733a33323a226532366464653930336633653535623632633833396337663831333134663961223b733a33323a223837313236656533613566396362363666396565336633386430386434663335223b733a33323a223761333661326432386235303937663865653837616462373738663533636438223b733a33323a223066346339393934626530386661303632336337646132333537383364626634223b733a33323a223233643534373463376463663064326535643161626338616331386337326162223b733a33323a226633633363393833623962633463353237623465313530623830346430373636223b733a33323a223737376639383633303938613630333964333263663566386431383730376234223b733a33323a223662646662643038363335313236613331393031656436363039626330646135223b733a33323a223530306637613833303739386166383430356335616538326561633265653933223b733a33323a226162656239656136633333666537633134376438303130306364343537303933223b733a33323a226461643063653364643137333163663336303762396630326466623533386365223b733a33323a223539363836346265316530663164333338323531333264396265376531306334223b733a33323a223839613134313938616237643639656134663964333836316234636635393166223b733a33323a223366333835356230373063336465613439323666303230313031366630313138223b733a33323a226164653338336464323063336661373863326134646330666435323733343035223b733a33323a223434643234323038306365323434616463316639333837663930383634366637223b733a33323a223364346163373334326537386661393130663132323336633363323533303238223b733a33323a226135313830666139316434386434383361633331633533383437383335333637223b733a33323a223632343065393834623234353934373763396437393065343630646464363238223b733a33323a223565323562353164616461666263653363653339363063383535313036383863223b733a33323a223732333935396136326365306239656435613332313336353361396163396566223b733a33323a223834313361636533396339356231666132383239363231346366343361343766223b733a33323a223663306464663561646463323963393232393337613733383463323961643039223b733a33323a226336313035336165383539666666616637343764373036303139636566363737223b733a33323a223564633463383339656132376563336461666633363338653737363438306430223b733a33323a226138363136336365373833613130666166373364393734636339343461386230223b733a33323a223532333630663539666337353632623135356639343930303536383232336164223b733a33323a223562636337396533366564643438343435313839626662666437383439666535223b733a33323a226330666235323562393166326139616666626136363362383437653262346338223b733a33323a223830636363653963306266653535366437653963333265306432626565323634223b733a33323a223763306133623465356263313636646334356535363034363732393634646661223b733a33323a226338643638343231383366356462353062313034383762663262616562366137223b733a33323a226164646336333063386334343338363037313238336436343466623039353333223b733a33323a223263353836643762333665366663376637623136386537633538653531373263223b733a33323a223662316363383136313431376566626465313430303831396264636334643830223b733a33323a223462366637383030313464393030373736666437653264343933363531313534223b733a33323a223636373138336638346465623333376238313831356537366565376631616635223b733a33323a223639326333393335323562306661343735343530646361613437316364643765223b733a33323a226162323938636430363437613136353061643539383238336564646563626135223b733a33323a223631303831613334613130363934323461643531343063313635326630396137223b733a33323a223164313431353333306230353935376439326535306565386337646235393762223b733a33323a223238306635616564643433633830396631653534626535656139356564323033223b733a33323a223665663266626534343662313130373665376138316430663033366230313832223b7d733a343a2268617368223b733a36353a2236656632666265343436623131303736653761383164306630333662303138322d3238306635616564643433633830396631653534626535656139356564323033223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605451543),
('bp2bos4d04cala5i708hk5eaik', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353532343135352e3834353436323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22627032626f733464303463616c613569373038686b356561696b223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353532373735353b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223237376435343361646532386336353536353432326565303863323864326634223b733a33323a226439643539313866333739623562363338396435613638313433613936613033223b7d733a343a2268617368223b733a36353a2264396435393138663337396235623633383964356136383134336139366130332d3237376435343361646532386336353536353432326565303863323864326634223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605524155);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('cvauaa29u7im3vsipsjetivd0p', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353532343135352e3733393136343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6c6c693765306c373335676f386e306268326b70346f6e646f223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353531373539373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353532373638373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630353532353930313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353532353338323b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353532353139393b7d7d72656469726563745f75726c7c733a34343a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732d332e302e312f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226565353931383637363261386637303631323766656535356637303231326439223b733a33323a223965663532326561333930623137636131316662663566623561376433336632223b733a33323a226439306561663532386535396363333730376230643033353533376164363434223b733a33323a226137346162626465316234353037613333313832353564653839366164376637223b7d733a343a2268617368223b733a36353a2261373461626264653162343530376133333138323535646538393661643766372d6439306561663532386535396363333730376230643033353533376164363434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a31393531333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3234303a7b733a33323a223764373565396332393433366366373766653964376530646531633436646632223b733a33323a223665383762623835313135653830323065393661346462316430346531336533223b733a33323a223336316465623261306137663134316131643536633230393632643332386232223b733a33323a223863373831646436313464363339343561336431653139633239323732653363223b733a33323a223130306337646338383338663762306234396262656430313530636338623935223b733a33323a223463313839363332313463313830393834386436373834333165303765663665223b733a33323a226136373335393933383234353665383632313530656466363962333435653734223b733a33323a223733346366303566643832643638646363616638333062626436653563633961223b733a33323a223061616163653930363061346164333735303031353435336466353939353632223b733a33323a223339623137633537373734623862373164363230653131666235383832663439223b733a33323a226338653031656161646662666632366433316137303634393732306165313839223b733a33323a226436303864393164363835336530383533353561633738616636363830363839223b733a33323a223463646131356164373435653733616263653838643936346135386165346664223b733a33323a223138643063373661303464653431343263646634396133333066313434343739223b733a33323a226438356162313430306435333134373233373439326635333239636132343461223b733a33323a223538613038386461363830393135383764363832396635316233643666363865223b733a33323a226262346430613332383233366263366432653533313966633231333031363731223b733a33323a226138313237636235636666316566356565343633306661663532323939636339223b733a33323a223964333531396165356230396330643235363738376530626561363231353430223b733a33323a223665366434303038313462623666656362393936306331666237356566616666223b733a33323a223835386236613564373939323836663034613339636234343262616537386433223b733a33323a223865353038646433363936633535326436383562363864646466336535663230223b733a33323a223463326535306336363966333362643264616364303866303134326564366663223b733a33323a226336643666656232386534653339653063373337333735306131393737363362223b733a33323a223934613338356237323465346331633266613861333635306330313963666137223b733a33323a223564333635366234346330323630626264343966643964613762636263656430223b733a33323a226133653262373834633532653130373734613038353665356632346563646538223b733a33323a223034393135666636373637383935393135386532373637643931363139653832223b733a33323a223163323830356136306136653136326164363233643430373130393261333031223b733a33323a223061393366396336616366636438336465383531616566346366336261623465223b733a33323a223736366131653361303663356439613563643232623135326661666331303236223b733a33323a226434323638653765656530396139373536316432623963616461313862636338223b733a33323a223132643965626563626232353935323134353530383034666162313430336262223b733a33323a223263336330633431393530343038313665396331373730666663323339333435223b733a33323a223863663139613137353436376130663032383266396136313133653331336664223b733a33323a223836333034343338303435633036653761373137323363336566323539353130223b733a33323a226263633139333364376638636337613435313162393562363266363733643839223b733a33323a223536393464633431313833623134316565353537323366333564656466346265223b733a33323a226237633033613734363763613031383939333566313330336365396331626265223b733a33323a223762306332383930653863646363613035623365396163613864633531326164223b733a33323a223361326464326137303039643763613764633161396430643138343162613265223b733a33323a223766303536363261666164616466346666313666653262643231396662623239223b733a33323a226535333066313938396164386330646539613439333065383936373134396633223b733a33323a223339346336306539626439613032353963386165653861306233393435623061223b733a33323a226336396338636238346563386137373031366366323533333136383030663963223b733a33323a223538376566623537346265346430386131613234613462373363313135396437223b733a33323a223935616165323637643336393230313636333835343431663933376262306134223b733a33323a226364613137383538636533366563366162323862383565626535363565613461223b733a33323a223038376361393434363037333737643066323339346435326265343066363037223b733a33323a226137343131643166393534376632623638643132643632633731653363656463223b733a33323a223464666264333865306338333438356138343130396163303966356436373337223b733a33323a223138653737316266376430626430393666313839346638626232323564343233223b733a33323a226130383962643638663138633362363039363932623664633161366236323438223b733a33323a223566353031646135386338363266336431376337323564346537626630386462223b733a33323a223363666237313661396366303364653037323330333866646161393334373432223b733a33323a223531303166386531663934646332393832336162326363666534356231623362223b733a33323a226366613933613839393265393531616265323061623739393137303966626161223b733a33323a223034386663363366616633623165353662303336336538613163366366326530223b733a33323a223934303536363832383938356166613262663266383363336666343930643737223b733a33323a226633336566613166353130613232613561353132356266336661303362336262223b733a33323a223363316635396234303863623832663038313436356536386137353261626362223b733a33323a223162656337346133666364366636363030383433616133386634663065313033223b733a33323a223663353962373038346235336434323033616139373261643561663734376664223b733a33323a223833343033656631613335373264636633303639383234333463353531663965223b733a33323a223538336236613366353830336632343233393330323333323631323639323639223b733a33323a226630343131623735326534663037306135336263316139316634343032643366223b733a33323a223334623334336432393563316535663436626563643963616662643864353238223b733a33323a223837343032363138373764383937626332626362323532396636613532623938223b733a33323a226234323864623734643139383531313961376562646264343465393766346237223b733a33323a226462613162623939306166303463343364316164313232663363343434376233223b733a33323a223438626465646535366131633433376331626437396334316333666463636266223b733a33323a226637396161313133356563373934313537373737396638633931363062653463223b733a33323a223563643862623265343039393364383831646335323332323831383236313561223b733a33323a223133613861326365666235666531666365333336353537373133613061343337223b733a33323a226432353830373138653431373034353963356634653035373933343363616432223b733a33323a223737663666626236353830626237306164353561613035643539613565383761223b733a33323a223461333339343966373164323362326562653965616532653432346136656633223b733a33323a223534656566306666343263343437306163336163316238346561353366616437223b733a33323a226362326438626163636630653139333461366266366465626161663065343134223b733a33323a226439623562646137333039393962366139393033306564666161663565613565223b733a33323a223230383533353630316339386266643131363065633436646230623834386261223b733a33323a223462373030396431393330613937653964663363613937396264316638373339223b733a33323a223963623261386564363730383032636332633032346531613066333232636534223b733a33323a223762363964636632626133336131386466666534613365663665363464386634223b733a33323a226434643264613638313966616333636162626236343161653231323238323761223b733a33323a223363663339623430656564313339663063383561613563643130343235633130223b733a33323a223139613464363539613933393936306237376635316339383435363638393362223b733a33323a223964613363323930356430623338316136323738616338343165353361393566223b733a33323a226264393264326530383538373563656535373865316336383665373961346162223b733a33323a226436303638643161613037363938346132323639313161653932666537333662223b733a33323a223837613731393931303131373061666261633862636632303966373839323537223b733a33323a226631646535656166363165653365316163313066626532653233643865323533223b733a33323a223432646338633732363333333935653139376164656233663736353964663736223b733a33323a223334323466333233313239623132303761363535363464316665663131303261223b733a33323a223337626162386232303361383631373464616233666130303561633932383562223b733a33323a223835343332363436376132633534376464393836663339623933353062373963223b733a33323a223764366430356562633931313163393734636439323335326334306162663864223b733a33323a223766623636633332393635663239363231386464616231656334646430636530223b733a33323a223835623261353536393161333332313634326438373431616634346461366164223b733a33323a223733326330613136353066386430353434343663346138623165363162656437223b733a33323a226533663931333831386162393965623733303632613362383033306236613963223b733a33323a223839636666353131666231616233323763363162646533623564373666656661223b733a33323a226633663665613034366232663634353864333663373762616336316532633761223b733a33323a226366363435393633663431643338646634336166613530383762323635626663223b733a33323a223039376130316432653065623134316138656465626231396132303936336636223b733a33323a226233346130343966333465323638353138303061343135393436366162633561223b733a33323a226562613834326633356237373563353038316364313738326534313636306137223b733a33323a223339623066336265646333303938306366333565636462336134653738383334223b733a33323a226137356234366265663233343032353733393736386465616638613439346238223b733a33323a223632633264623039396533343165623161616531303964393061373031313630223b733a33323a223435303938326231393066663162303564313536346431366463373739313862223b733a33323a226565656162613936373766306335386631646132613731396138663965356362223b733a33323a226139326161636463303536326234303135353866636562376631663264373130223b733a33323a223938333430386633613538663232383737656537386539366439353630386434223b733a33323a223735346634666466613265656438323030656432356536613038396335393631223b733a33323a226265623238346330383138336535363137333838393864623733653662323036223b733a33323a226136626364656461373439623965366162633666616566343562386232663632223b733a33323a226531326636646361643863396637393862326631353633376133373930656139223b733a33323a223065663039653133323932633464323832336238393931623832313038616338223b733a33323a223136366534363032396237396233356464373033623737663631656466326630223b733a33323a226236333062366230326263343731376636313064323064353562303161323935223b733a33323a226565306339326237356633303266333064363833333730303566336661306364223b733a33323a223037633264383835383036356666383035636562323138623161363239356535223b733a33323a223666633561346337343436373631353230383232313838356363356232623439223b733a33323a226132613635323466336464653537303366393137396434616166636339633037223b733a33323a226337643535393136356562616663656539616239366237333330343532626464223b733a33323a223632303133363230656438613164376534356233636533373765643035636363223b733a33323a223361656239373431373063666439393836643231656365313337643039316232223b733a33323a223033343661333431333266626566333233363164323361343662363634663038223b733a33323a223632633239633634643735633235373937363264323764376162383166663134223b733a33323a226166343933393336313064633765633733373636383531303632343866306134223b733a33323a223530343132396165613434333238383035343230373664643030366538666637223b733a33323a226133373332373438376231386138303061303338636265316266393061303939223b733a33323a226262363238653733616532623032383665366363316234346531633531613232223b733a33323a223839633762376436666238633138613636313264393533666438396565613631223b733a33323a223864383730383137373634353834353930636530666531323961613638303737223b733a33323a223339313639633636623637313833633635386161666235613337663164653637223b733a33323a223562333266653462613835373566306131333664656439613135653264643638223b733a33323a223061613730636464383035386365353132333635653462656236633136326265223b733a33323a223838663635643435613831626437376634306665346533333237326533633337223b733a33323a223831303936616364346534373735613965616635323463323232636533373061223b733a33323a223335333862663534663134363435316661306534393930326430313265323331223b733a33323a223833643135383161323035656164343831656466613533353862623636303530223b733a33323a223766616631376636363565383234373131366634633831663866653563303635223b733a33323a226564666461376632326535306437366630646264663366333166326162383938223b733a33323a223938343964366262656637376130643135343765663135393039346638356236223b733a33323a226530653766636130356663396436393564623562376336393565656239343035223b733a33323a223530343033636536636231613330336134623038373934656431353136373136223b733a33323a223932383538623730366436666433396361663430613234313830356636343936223b733a33323a226230393737613831336561633732636232376365363963393363643161633139223b733a33323a223632396630356534653263396661323937393762363066333962373231386535223b733a33323a223865386537356433613065323766633432653431383330303834646162653532223b733a33323a223338383830323431306663626230616263323764323339663561336232633435223b733a33323a226365343435373333666336323063613232303438393362656333316334343262223b733a33323a223135666533306330396161363538386538303332343265323663633665336431223b733a33323a226431336539626634663734643635323631376161346464383932633232653039223b733a33323a226135393437376433613365396630666438336363636466613964363865366361223b733a33323a226265616234306334316566663533653265323562626532333732373039633563223b733a33323a226637386632326132316135396330396365313261343537306233656430306639223b733a33323a223435633165616266323635663363386536663232313430373965306131643333223b733a33323a223861343538613730346261356537303164616535353330653561336231363233223b733a33323a223930396565393236386236623164643830313437316661306665326336353366223b733a33323a223633366261633133363231656533346234643136336338353439376637336561223b733a33323a223834326132646665646539316539343638303662306266333666306564336333223b733a33323a223766663937653361353465646137303061303862616666303932636534353064223b733a33323a223139623266396132393733313133613761326639306437343365353561626338223b733a33323a223036373935316666396435363966613265333632383066303130373237353862223b733a33323a223963633863306361333837316131313162356530306633616338646361646333223b733a33323a223436663932356165663235383764313330653833663964613334356332343361223b733a33323a223862323935303363353633306137386434646164363031353263656332623430223b733a33323a223734613531616232653663316634653232646531353662616562666232633639223b733a33323a223065353333393966383539613461383866393032333061306239346434633663223b733a33323a223238353464336438356537363161333432393033623132633064316464323638223b733a33323a226638333232666663613738643239313137623736613866363466306463656435223b733a33323a223065626161383131353462313362653633613038323363313435613766393230223b733a33323a223730623137336635663232633339323764366634306530636332353937623137223b733a33323a223866353336363561636231613638373136326639613066623762623565663537223b733a33323a226363343764336530633433353865366465396163303233343233326635353937223b733a33323a226233633563393036653738636639353462393765393731666139663566636136223b733a33323a223331643866626264326264313630313436633331303764616136383064303130223b733a33323a226461343564333136636333646665643861633938616132393632656138666632223b733a33323a226662636135633366336364396633386463393266363932636139336534363436223b733a33323a226133323930666632363130633963343964373063623036353532626162653432223b733a33323a226264393130613637343966666262336534613635643532323937626164663533223b733a33323a223565386538336136613066616438373864383938346163653432376335353938223b733a33323a226665363931613939316438623633383663633365376464643436363532356536223b733a33323a223962623434623464323964303161643266303432353662636536356138313465223b733a33323a223933366531623961353062303036393365666361386664353235333465636261223b733a33323a226562353962333632313234616233613439303566666333356133663935336232223b733a33323a226138646265653036663930393261653862316635303831386261366165653433223b733a33323a226233393436343736646135353330653161313935366663623039323166363664223b733a33323a226665333562623335623161333438323737613032613630303338653636373133223b733a33323a226433336137373438346561396636626531303931666331336632323564633731223b733a33323a226636646264623462313833306235643039316362636461326566313234373232223b733a33323a223935626536393739663737303161353961653832323732386132353561643435223b733a33323a223137626635396233336334383132643032643230343030333530303764386431223b733a33323a223738653438386434633632383636643237396665363764623562326537303537223b733a33323a223164633339353539626431653930323863303734653462383632646235613134223b733a33323a223938393661393935653465313033313266303733393434323164346135303437223b733a33323a223434316131643261346131353938386465366235623034636632336466303262223b733a33323a223635313135373764366561663531366538303562393936623462363866613734223b733a33323a226131373333666565623361396634373634343935623436623430373864313864223b733a33323a223539336366396336623537323331383338343363626239393664623065626630223b733a33323a223966333233323461306638356135326134646338623861646631353763653362223b733a33323a226239613034323961373233643662316335613430313332333164303132326439223b733a33323a223032666338326238376462633766643337643433306132386466383632666433223b733a33323a223636616364316237643539313231343036633232626266306539653066303561223b733a33323a223464356464383334613266353133326162636337336363353330303630623564223b733a33323a223733386465306562626533383665353430626665636130303035353161373764223b733a33323a223031636165623237313064343138323133356130633931643635333866393333223b733a33323a226631306465613832353431393234313463383330313864366434393130613362223b733a33323a223939383536663564383937313763633464666634376233646262656236333030223b733a33323a223066386465396331616633643835313934616335616165313334356430306533223b733a33323a223535333132353763363361373763646663663538646136353762646562346532223b733a33323a223062633363386431336162353165613166643462326332373566356235663062223b733a33323a223364393764636632663666646130666232313238333633303733633162313166223b733a33323a226232636133373135396432346136626664393733363962306535633766313536223b733a33323a226165313764633033663338333433643537323631333131313236373861656330223b733a33323a223361633138623839363035363330613539336434646130333865356633623238223b733a33323a223035306633653434376139666236643366623162646161376166663963363935223b733a33323a223964306266396633303366333935663266373235343563313431333537376232223b733a33323a226165633632396437386566333334306463366462336634303530663039393864223b733a33323a223762343435373938386161623939303132626631316433633066646634623832223b733a33323a223963633464396430663734356330626563623337306465373638323333656165223b733a33323a223966653131313731313237373239373366393264333031386234666166393439223b733a33323a223533303938366139306562383734353931323061306133306664396130383333223b733a33323a223864393030356466656537616331646638663431626361346339303162663932223b733a33323a223866646631353937313034376366303737616237393363343061343064326362223b733a33323a223265373036323535316662303364616436616630323763633831313732333939223b733a33323a223131643463343161366264663135353739656538633265323430663430336536223b733a33323a226564303837643331343362633734393636323436303534316266626130653937223b733a33323a223065303761666266643537393337373935646336663764323734343461326238223b733a33323a226234666232373766653363613235323533346232323666643364373132313162223b733a33323a226365643634313165373632366464303964623231623765653164393032383361223b733a33323a223336376134383061653131383431653230396139376666353137356231633039223b733a33323a226231346561376631306531343962363965646637386239653739333638656238223b733a33323a223361386236333039363265323763326535623432333065343037653938333532223b733a33323a223565346538333364333032373236363632666436666339613434333663323663223b733a33323a223134646261343463623264353330636166363539363432646630356433636438223b733a33323a223337326236646565396632306238623862303730616262623837623734393063223b733a33323a226439643736653461323163396464643634333431623464313263396665633264223b733a33323a226465326634396439383836373761346638323431336430373838333562383838223b733a33323a223537626237373261383332393135613730356463633830663362653866636432223b733a33323a226661386462373962653032396237616633376330653331633936633438633762223b733a33323a223339656337613436323864643137653537333438373035653763303734626338223b733a33323a223338396634383932626432633630656636643735326262653935353036663866223b733a33323a223265613762613333373032346133633933366338313130303830376163353938223b733a33323a223135663462623630363932366461313361303130303537373234303035323834223b733a33323a226437643062353439316164646233343333323062626239396537373163386139223b733a33323a223063383863656332316638346361333364376437316330646463383262336130223b733a33323a223464353138313766616136326135663766383964333535616563616232393036223b733a33323a223361393130363136653038336634656632353837366262613765616634653461223b733a33323a226361323539633435613137643332396463616662333831346135616534303636223b733a33323a223735373561323135653766323435316238353135643265646435653463613731223b733a33323a223033313464663737353734326562393635376663633232323431643836343365223b733a33323a226136373063373339656437383933643633343631306562333665363634373535223b733a33323a226634356339386266303966366335393861643162346434613238396161336231223b733a33323a223934623439346464643236336237363935343061303366643631393362646466223b733a33323a226333323932313631383430656331323333643636313137663738626535386438223b733a33323a226365303862363335303261346566373036356365326430663539333036643333223b733a33323a226338383864616433366562666464346130376237313739626432333433313361223b733a33323a226538656362666539346133316263363230303336656338616338346334303532223b733a33323a226664383262303563366561656166303232323665366534613261336563663439223b733a33323a226532653539653638363732303862353430636362656336363962376534356564223b733a33323a223639653366313935643865333639383564613534326537363038313237396238223b733a33323a223839383037373633383361383739376262666138383737663561376336303266223b733a33323a223038303134366534666461613366366535376138356533646532313839343036223b733a33323a223633623338656261373631323231303636653237313961633535316433343466223b733a33323a226365306132643135393565633735316663633738636331313563666330653663223b733a33323a223034613165346332333339633462356137376432393562346530643964333763223b733a33323a223161363937383837393336303637373034396331653765663436663936623361223b733a33323a226131326638623937623938653533396537383636333139303461326133363138223b733a33323a223361363464316461323462323266393062373338613262393436313139316132223b733a33323a226133383133626665363265303434383033663936636237666537373035623339223b733a33323a223432336566646637323761333435373761396633626161303264393933306336223b733a33323a223963313238626332653933643166343633613161373061383764353664383561223b733a33323a223563663163393361346136333032353536643763366165313639373037643535223b733a33323a226537373735623762613861613331626130346265646632646437376632663036223b733a33323a226264616363626561356337366638306235393536336232626330663362373836223b733a33323a226364306137373437353532323236386232376430346531333164316261653538223b733a33323a223235626431316635623532313138396330376262626134303164306364313936223b733a33323a223561363935383239313334373631366436333138343532346635373264653138223b733a33323a223330623630383439616163353934393538353239636337653237396330323564223b733a33323a223165333365373634633836663564646235343436653735303665393563656331223b733a33323a226636656335323165383231613064393032633333323536663238656134346361223b733a33323a223735386336353765336632333036363739663130383864653566303765316133223b733a33323a223461393961373939363736356339303030303666666330333465303066376237223b733a33323a223733313532613933363832363265626234366131393939353364333261356631223b733a33323a223131643566393338333637383035653336626562633962356562653836626138223b733a33323a226633623736633638393861363363653136363363383063363164336365633730223b733a33323a223132303534336530313738636534323338643565626436353936613437633134223b733a33323a223530383566396132326338646263313365343963303833343164383939666666223b733a33323a223831373462343531633936373164396130633734303431663464643539633332223b733a33323a223766386461316430353033633965616230383633376532666434376266633834223b733a33323a223263326631393532636530323532616132386261376636376535313366373038223b733a33323a226330373663396535643666383634346239353138646564363435346566613561223b733a33323a223464333836616462666330353565333065356132393665616464316461663865223b733a33323a226132383539333562376364613934313462666637663762383233616164643032223b733a33323a223564313364323665613138646136626134656530326261656666313766396238223b733a33323a226236343361373835333366393135643933396265363038346463663965626133223b733a33323a223834316561376130393965323334373061306266643763326636633430333536223b733a33323a223830376366613431663764323231313535313937653235316330383632336562223b733a33323a226537353838636666643265316638306462316266346133333738343435313231223b733a33323a223033646232373262613435306139633665636265646534643033363232393132223b733a33323a226537666165376438316130353464393861353866666339313133616335356561223b733a33323a223138343536303337656530396661633137613232343966363363336535306366223b733a33323a223233623162373430663163633937643739653761663962343265393630363263223b733a33323a226430306265313761396436633738303331626138626235396166386338353134223b733a33323a223730303134386139363138393537333664333832323762323562366639623930223b733a33323a223136363661633439353535353165346135633039366137626436366132663233223b733a33323a223433363262396536353965353032323635376363613966656435316333313164223b733a33323a223363653761393065613263353834626437613437663735643333343430656530223b733a33323a226361356564346462303261373361613838636565366334356564616565616531223b733a33323a223734356564636131663335313466326437633330656135366332623638326466223b733a33323a226433393262363364323965613737616466643033333632666632363962613431223b733a33323a223066643038303536633930616234316662393165383336303466646264623633223b733a33323a223231623336383763353531393930333063633830346331646332396137333237223b733a33323a223635656132333731623266303563356632386266643630303663653634663639223b733a33323a226264353535666433643061316233303337393166633238616533626539663766223b733a33323a223466396637303265613531343333666132346538393534326430653238646539223b733a33323a226338633530316566356135626338366162323637313934633837656262383533223b733a33323a226336373561643438636639306139626339383530613736376664376362363563223b733a33323a223866616461366465623336383664623066616261396166373465383731626431223b733a33323a223034376365313065393965633166316635356335616438626266363037383164223b733a33323a223737323362396538636562306663613031393265303934623336353936633364223b733a33323a223433656435663835366331303231633064653039326365346330656462643031223b733a33323a226531326161306564343033326233356263336663636330303138393963383932223b733a33323a226464383365636637396531323234613430363162373163663962376136323231223b733a33323a226637326436313537323264326438373739303831646433373830643938383437223b733a33323a223365316231386262343265636438373330396366303462633961303363633966223b733a33323a226632613165313263663036363632333932636538383137656561353065336531223b733a33323a223635653231303430623439373534383339366433653533613035303265383864223b733a33323a226630613166646637653836613739366231353835653765323232653330666631223b733a33323a226439663263653461633862653539356533666330386130636262326239313732223b733a33323a226536336663376462663230373239343930326537663964633437333530366130223b733a33323a223662333465326161636564626435623733393964626634346239373931643939223b733a33323a223639323036386463363237653639383635623761633361323537646564306530223b733a33323a226136393135353932643161383633623536326230313635626139366461316131223b733a33323a226330643933663635633764363030336637386432313335343632306461346661223b733a33323a223732633633663166303335333133323835306664643363303033393865613334223b733a33323a226262323938333763386238333436396331613462623162336633323764313834223b733a33323a226237336162353036653361643936366664636566316539646638323130663637223b733a33323a223232636530323333313830633361363035633532366437616231656532303437223b733a33323a226131393536663939663265343661383633313237626466353563656563393339223b733a33323a223566373337363939313835323734306235653663616564613434393164353037223b733a33323a223035323965623265663038386461393238393431613436653861353439356230223b733a33323a223433356238336665663361373232656461653062356165333431353732393164223b733a33323a223237306532313736623764343537653833313635353665653136613636663537223b733a33323a226261646666383862653035613138613261303065616431386232336162386439223b733a33323a223337653364386231323839393233626238343336386332383063356339303539223b733a33323a223762643432333664303139653864626664653638383638343063636230313533223b733a33323a223964366232376563306332656165333437306533323162663330623837393561223b733a33323a223834646232323137613433653137383464616339353262626162666432316438223b733a33323a223537353462616666396631646666363130636133303535326362636566626565223b733a33323a223264386339656534663238376132313037393363346463363338383762333133223b733a33323a223630653431383866633532373638393765323864393464616464363836363935223b733a33323a226361326433366632643264353864363031373836306134633431356534336435223b733a33323a223431616133623661303036383162643230623865663637643163383935616263223b733a33323a223737366336333862373038353465323738373561666162663639383831306237223b733a33323a223639363833653339303862633937613232326161376434386634373936666332223b733a33323a223866366436643263656462613233343539666663393736663366633663613036223b733a33323a223534313331363238396138313833333335373763346232333937363733616334223b733a33323a223761633439303662326563633363316130633031623033326234646234363963223b733a33323a223538363263303561643763653963623935383662646265633561363935383337223b733a33323a223964643038353937396235656339316337633735623665623931623764326139223b733a33323a226232353463616632363639366633316334353537313332653132353165316166223b733a33323a226565636635333765643130306335666235326530353533343061316138303532223b733a33323a226237646633303732323436393961376237356332623939353064653737346531223b733a33323a223134383765626138373332346565656333363230636238333661623037643163223b733a33323a226161373866373432393531646138396561626135633634383066346133633934223b733a33323a226237373535393437393839613830333565386530313034343638343532623836223b733a33323a226634313835383434653234383837313730323435656439363062353962653662223b733a33323a226165333533653034643163653164666630316666363833356262376237386362223b733a33323a223338333630613563323133646339343732393833626664626664326466363335223b733a33323a226666626635636164303433313430323466633532383031633931383135323836223b733a33323a223735653736663731383233623662313436303965623034313764363030653333223b733a33323a223934356364663162663931336163643636346666636239333064333835366139223b733a33323a223164363330643530306637643237626266336634643137393938613262663337223b733a33323a223365656539313437636364396135636234363261303138626563653263623261223b733a33323a223731343135663131386138646663653034613263326537643538666561313937223b733a33323a223232323832313262383861353334373738353437653663303038333361376563223b733a33323a223331306161633439363238353466313966393463393362383236393435633666223b733a33323a223035643736663632343038366239396362323535323363353463623335643635223b733a33323a223433626332393132646562343130323961343666386664313061316466323235223b733a33323a223765323430666334396130343566383436366630656465643335323539373431223b733a33323a226335353163346164633336353531633538623461376432646131356631663139223b733a33323a226330633563373437336564626336663030363235663238643764383464313634223b733a33323a226335336430636362653836386431636539386362366534303433313530643736223b733a33323a223439643032656266393134306635323139633833396165336130343062613931223b733a33323a226466613530306130663236623161336362633564336139636131653332656639223b733a33323a226463323437613838633439383264613535366533313466346465333330323963223b733a33323a223336316231623366343763303530333762326639303131353265386634396630223b733a33323a226132383137633563643964383265663566393738343433366635373533373635223b733a33323a223763346330653062616666633162383238613333316439363561363036303537223b733a33323a226638633761393538356165626436633435323765363837393237666364396234223b733a33323a223632663466666636643530623436316630333464346330646531353266326438223b733a33323a226366303764393961636231613061383332363966623261653837353035626663223b733a33323a226231333230353366623739643434353466343338383931653261653065353961223b733a33323a223839313037626462666162656134396264616630366562666565653364666432223b733a33323a226336653233393039363165353130323033306433343937656364653132363261223b733a33323a223064393665353365346337616137376363663166373964366365613536353565223b733a33323a223864666130366636373836336636623833623437333461393630353863646564223b733a33323a226535376234343231383862386163653938373039313331303834363933323539223b733a33323a226261656434616465636335376431333732653962313330623837393030623532223b733a33323a223932333061613665666363326366363032323865353861353061376539323033223b733a33323a223839363366333835643762363131366661616261663665636162373439376639223b733a33323a223938383132326632653036393332633633383839303433666236346462336639223b733a33323a223332323362373763656435396164383465393336393763626339623539633238223b733a33323a223766663830616139663338326530633136643866663232323361363566373535223b733a33323a226138333137626565326162353634333761653066626366346139393932386335223b733a33323a223964353536346237383561393233303934666536396534326237343338663732223b733a33323a223330323362356662663639383937656464616237633761633564313334306236223b733a33323a223638656536353461666332333435303334616465366338623233613965323265223b733a33323a226531363931653365633132393133396233663365336633623633366432303330223b733a33323a223436363465316434343339383038616363646336366635333336636131336263223b733a33323a223438663333623436663037616166643334393338626463373138613230616437223b733a33323a223266346133313631356566363031613764373861356135323462326165303634223b733a33323a226263663036386536336234376262656563396137626236646264353336646330223b733a33323a223564616162373338326239613233653935303762656130366261316466343636223b733a33323a223934323431323133313330376337363739323331386134303066373361353437223b733a33323a223564373863613330303663633763356134653536313666636265613830353430223b733a33323a226666383230653763623232396235393034363932333962333432636262353036223b733a33323a223234616335633161386332386430623766363634326663363639333066363430223b733a33323a223134633564613437636561313536386239323538626532366630363330323164223b733a33323a223961386237353461333933653935306237626662633065323562313339646535223b733a33323a226539643930393730303638353135356464336363316562636133393163346463223b733a33323a223566336539326435616338613338386361326338376466353335343939383566223b733a33323a226230666339346665383733643732633539633432353739633062326363653834223b733a33323a226433356136383264323138373264313535323538383032363837666366663439223b733a33323a223964383839346265616265623663393131626336376163343437336532626130223b733a33323a223036323933323634623932326665333630373437333434616331303838303032223b733a33323a226136613036313639333062653935303235386566613037336436636338306439223b733a33323a223937376337323437636533623837663239383830633033343363333038343934223b733a33323a226231323562626362653261623365613939313632366439366664396566636436223b733a33323a223330353838653335333965333230643833363062643033323465366233336165223b733a33323a223437343133646236666633353235333235323862306566306238366638376335223b733a33323a223235383762393837616566633361313063386230666138343937373966643232223b733a33323a223563323638326364633961363938666632353765303466353632303532326536223b733a33323a223034636330613163366162393333303830306239316265343464343364616262223b733a33323a223366383738323465306537663963613332363066373138343463356532396562223b733a33323a226361356234623034666664613036336431363735396165663837363032663735223b733a33323a223331313465383832643761313339666136653663623362633732666432366335223b733a33323a223964636266393434313633373234353837343139303738333933396638303531223b733a33323a226535343836623664613637383334656162306263333862376337316634666436223b733a33323a223131353834663035393962363337636361366533373663616533623036313233223b733a33323a223437383531376135663662396533356339346635373465373837626362333333223b733a33323a223761303035343439653064363839343334633339616266346234653036393038223b733a33323a223261616665393430646636653132633137613333383330663831656463376438223b733a33323a223339353362313136646234396434383937326566303234643965643035343633223b733a33323a223639353534633365636132356461353536346563396135303362303937646362223b733a33323a226439343239653936323630353265356639306163306635373961353735343330223b733a33323a223937643831313037336530383630373663363137356637383534363633653764223b733a33323a226664636662623231356331323933393562383730323062653435656666306434223b733a33323a226635303566386133636566303831613363323133613664636439383034363861223b733a33323a226363333536346236396161353130383263653564373166636631393161653636223b733a33323a226161383236376661623162303130643461343731653331656432363736653730223b733a33323a223034383531353961663161666638363936663532373662623337363737316366223b733a33323a223835363635396166303235353835643361613436353563393439626265653163223b733a33323a226532666237363338626631643833303964613864336331316430323163303262223b733a33323a223737633762353164346133616139393931626639646138333133373730643134223b733a33323a223030613630653634333530636533373461323635653938303534323431346339223b733a33323a223630626462373563313764303164353866353261363534376230393334376262223b733a33323a226232643463633663393234326332663439303332346461656532353730353535223b733a33323a223131346464643735346338323834653131376335353564643564346439353361223b733a33323a226236383062386431663932393331396438343663626664323834616232633964223b733a33323a226234633032333331636636376635353732613239303366353739626338323036223b733a33323a223264336431303537623335383138613162633034346239386266653835636439223b733a33323a223534633438323039396333643831363239303734326164666230646337653363223b733a33323a223634313738373032613361353164653632376636373831656536356137666334223b733a33323a223033356335626661386433626132356131313366666232326563616230613962223b733a33323a223032653634643539666139353632363937383765383436373538643039313263223b733a33323a223037396638646665316334383032373238396431636161636231343332353764223b733a33323a223339336466396463343837666165333630336532663662343264303638373863223b733a33323a226233393032633362303332646235343366666232663566363439663331653466223b733a33323a223630653136363732303038653564313330636361623837336236383538356130223b733a33323a223937626431386163313637623264313230356237363732386161666564623166223b733a33323a223836383266393830346530623631643433363630633463613038656130646431223b733a33323a223138313135623062313130383834633762363662376431373166393234323737223b733a33323a226237353661313938393531343635343639626633653231653532656331346538223b733a33323a226434383662356439363838376330666430333137386662323861343937323262223b7d733a343a2268617368223b733a36353a2264343836623564393638383763306664303331373866623238613439373232622d6237353661313938393531343635343639626633653231653532656331346538223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333735323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34333a7b733a33323a223461346663363764653465653136356161613438363136383639363663663837223b733a33323a223965306534333836353130623965663230333762346165343338633937303339223b733a33323a223663623162313730323137613432366532376631656165366532646265326266223b733a33323a223564396566353839333935303363363164633535623365626634636436316436223b733a33323a223230663237343831383130333937383965363437333931373966363066323532223b733a33323a223566623038316632303961303338386163633039353364333336346564353336223b733a33323a226530656263613638363732653162613762346638343536326233646333336331223b733a33323a223931366337336266653535653861336166303033623363353333653134303635223b733a33323a223635323932666532356266663133623531363839306632386561626461653634223b733a33323a226531386233613133383161376462373265343961623663356638303965386639223b733a33323a223239396231626563333363383164313066343936376262343034656638376466223b733a33323a223066626165303565353234396562633937313362363163613361623166303763223b733a33323a223836623635386131623739336661386232353637383161613763643462333765223b733a33323a223866396264636135626231643137313435323935363564666531323230626531223b733a33323a223530343461373361643037383563636266323962333637333361353935376630223b733a33323a226166643732326533663030373836306434373063366436656535383434336665223b733a33323a223131636233396166363935393966633563326333623530333738633833653931223b733a33323a226239356538626162313063303461396239363736313338336337373633666665223b733a33323a223633323732343736333061353839613064356464386164663463386662373733223b733a33323a226165633261303633376161363735643166356236626332643462653231393165223b733a33323a223662643932633134623336373663373535396134326366373932373631353231223b733a33323a223939383536333365613363323631306634633731653463663063343034393364223b733a33323a226461373238343530623761646562363132343139663030393261326231363565223b733a33323a223564373634366336633136646333393661363935623834633339663333346234223b733a33323a223539616465366133376430383836666632643237393066346566636531356632223b733a33323a223365353837373961376333666232656631336439393031333531356135376331223b733a33323a226330626661303866323763623735386462343530393833643330326638663864223b733a33323a226362663331336238316337623866303366373766303863373364326261323433223b733a33323a226463336337643833316431633639396232326632633364333663663732616564223b733a33323a226665313037653762336237333738313864313835633534623739636563363266223b733a33323a223864393138303530653766623336333263336337333233386132626139303964223b733a33323a226461303739346661613932303165666662303038623330643332656330626239223b733a33323a223035633736313162333932326333323937393036373630363539633035626334223b733a33323a223136373930376139616131653065363236336537396533323439356238643261223b733a33323a223865316432396264613938383035373665616135373836373235386264383335223b733a33323a223733616261336565393264333166383635333539386134623361626566373538223b733a33323a223461646434623135323161376633393837663434653832323239393439623730223b733a33323a226462666232303564383932656661643438393761353362353364356132316234223b733a33323a223666353037626162303432643766653661386366393232636263613734646239223b733a33323a226530363830626638613230313134666335376662333030613665323033336264223b733a33323a223432323134646162626231356337353037336561653232633130396638326664223b733a33323a226464633134663163383533353263393337353564616133373330343162636332223b733a33323a223936356266363437333430373363663035303338313838666237633535356366223b733a33323a223666313163363034326234643864646435393464656638376466303138356533223b733a33323a223639343534326431326661616362303966333939633236653635633364663232223b733a33323a223231646636633636396162386638356461646330656163363365613638653263223b733a33323a223934326434353830653531363365623036333339633463326263303361373539223b733a33323a223330326635353466333737343232666636663434353737623439663439643265223b733a33323a226364653132316261636632323233653637613634333866653435383036363535223b733a33323a226163376134306535366261353036363365623937356137343538303137306662223b733a33323a223332663830646365323865356635633130646565613961363163663438303339223b733a33323a223832636163323436386535356666306565613133633363653333373963383738223b733a33323a226433623230383364396534373831623731366638353637343266623035666637223b733a33323a226132396438376134366365383438386261616339313039653038633662623834223b733a33323a223036336363333265316238663138626262653733316234363762393630383034223b733a33323a223839306537633339633562303732343764313266653761303261656637343633223b733a33323a223037643461383563363061313834353437396537616130613066383533616636223b733a33323a226266366630393864336336383933623764383230336561626364366664356261223b733a33323a223061386466613939383935373564333032646466626135666666326633383164223b733a33323a223337363461333766643230623939613063333439666337336437663936323166223b733a33323a226431353233356138323062303636373761333139336563396461353066383130223b733a33323a223165313335346639313438313732353337356137383731306537303365386465223b733a33323a223038616136363032623632333931636633313834646134636561323532623732223b733a33323a226331353336346262643931663031333665653565343332316438336239333430223b733a33323a226164326262306332386363613933376635316565323131343166663633376335223b733a33323a226637386231643266356363643531373266336466666431656566303165656235223b733a33323a223539353363336232373831353134653230623831663335626534303736633832223b733a33323a223362343765396564313031366234356661336236653135343161393763373461223b733a33323a226265386333353263373430633832316539313136373536613134353937326566223b733a33323a223135363737356564323236666235343637343337393331646663336365333938223b733a33323a223166303463303536373965666332393638383831303665623863373134353433223b733a33323a223061643434623136306332343761396536626237626337393465633730336166223b733a33323a223364353232316134356232616536333063326665343563313032353637623533223b733a33323a226431303034343134663332626635336365393639316431643532313366613431223b733a33323a223664643761326135323534633737336465363837666631653632353231653639223b733a33323a226437376232333533373366613133333464623334643837313639636231396265223b733a33323a223434303837363563663661333862353861626265333731653235663262366133223b733a33323a226562326564613264613235313462643738333734393733666531663565393738223b733a33323a223339653366393632363735363932383630356461633839633437623663353335223b733a33323a226338666564363534313136613634653765653664623463373630643636386132223b733a33323a226263373534393262303361353137343838333330313164303438633930343164223b733a33323a223331313634383239653838333364386163306433353131623537613166383836223b733a33323a226138623935663230663563376638376466396236626366616138386332666261223b733a33323a223330656338656465393131646565623333393564653438313631666238653136223b733a33323a226435626334343864633662316237643030653739313538323533643337306539223b733a33323a223866303466383431306462386566316564303037383866346632646330663961223b7d733a343a2268617368223b733a36353a2238663034663834313064623865663165643030373838663466326463306639612d6435626334343864633662316237643030653739313538323533643337306539223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226264313834356533353133336165643933623833393039343538633634613865223b733a33323a226231336564623738666164333239306461616135666531653831643431316337223b733a33323a223431663339326330663730303233383830393764653337303165366638306165223b733a33323a223439336464343237646230343139623436313165323335633866623264663162223b733a33323a223762326465373234643131643730383931373362653236383164313935363438223b733a33323a223333373137316631393334383565303863643963336537393365363030653838223b7d733a343a2268617368223b733a36353a2233333731373166313933343835653038636439633365373933653630306538382d3762326465373234643131643730383931373362653236383164313935363438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313931323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a226633346365363964393364373032303664363135356430356236323030343266223b733a33323a226631373861366134306564333431386666626662303431316536363037343236223b733a33323a223232616339646230636263326362366564633963386266613332383331383764223b733a33323a223331333439396134323832333464663231656635383865333361653034346164223b733a33323a226130643763373562623431663138373363623066333361613130396536643062223b733a33323a223635666664653933643536383765643536393237623738633130626463396261223b733a33323a223438656136626536316566353863653035616335343134373932653834306466223b733a33323a223232653439393538623934623239643034653664613665343662666236373864223b733a33323a223065643362366239323266396538396130383966393331656231323630303962223b733a33323a223866306261333035636632313363336264376630326362363136636666646566223b733a33323a223736343338366339316665303661303931366332623530643464303066386431223b733a33323a223137303935613539656632326530323837323036363931396637383639646363223b733a33323a223635336361313766316530623434643431343664303533646334383031333162223b733a33323a226639646438363733343164323261313165353135353431366637363937366637223b733a33323a226366383730386366666430666636316563653061326163326533336431633633223b733a33323a223966343436656632643130383963346432616334363636646261353235343431223b733a33323a226163623365383435326639313438303461336262383561313563303533623232223b733a33323a223466333637383338386635663732383762383537386131633062303264336461223b733a33323a223135636463356265643461373763383564636565326236336634366163623665223b733a33323a226432613739396165373866626237633032363266616632333831316565313461223b733a33323a223034336535346532396635616466626561636366646432613831656336623730223b733a33323a223461643565383432663937313839366437656639353533663265636366306431223b733a33323a223366626262363838396236316165353664636531383139633261306532343333223b733a33323a223561376461316638393961663733356330316664363265366136343864376335223b733a33323a223130333434613239326163643966656337383330363566666132323365633032223b733a33323a226639663339663566353035323630356261386535306639373232643533613831223b733a33323a223833356364306537303838376665636466656435383461326666363662343762223b733a33323a223232343336643766313336663065366637373837653862613133663332373665223b733a33323a226264373937346437653466646463396437373566633435616236346132656138223b733a33323a223435393633623437323831666237316237343030393933383264663134616366223b733a33323a223032336639323231323463633762313133623531663362333634633562386135223b733a33323a223766653033373064353865626139326338306361623631323062356235363236223b733a33323a223939653034643833386663343566353939343262363533366566396238653464223b733a33323a223231336632363262643062656361363831366630386231633764386433666464223b733a33323a226163323166376263383562376137343839386632313766353965346430396139223b733a33323a226361626336393561373962663239393665653435646461353530643664626634223b733a33323a226637616265326563613735613464363832366165613331356466393338393961223b733a33323a223438333464663764336238306466386337613331393230613137326135616639223b733a33323a223634306331333666373538313035656232343637366539393965383536353730223b733a33323a223834353738386439373563633637366632323163316661613562313031643866223b7d733a343a2268617368223b733a36353a2238343537383864393735636336373666323231633166616135623130316438662d3634306331333666373538313035656232343637366539393965383536353730223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605524155);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('e6tokf3ecgjjai1lu61pm9jm4i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630363131393331372e3734303738323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226536746f6b66336563676a6a6169316c753631706d396a6d3469223b7d7d, 1606119323),
('jsvprkkuqte51m7pth9d6jgg4p', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630363132313833312e3038383334343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223732677038756e626f71766b3472337531646a6d3066626d6733223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630363132323933323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630363132353433313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630363132333239373b7d7d72656469726563745f75726c7c733a34343a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732d332e302e312f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223834343137396434346561613733383763623838626432386238303565623164223b733a33323a223037316633366432313635356536343463373730643738343337653966373061223b733a33323a223531306432366666303430393262613665613664643034373863393964373532223b733a33323a223530303233336135646266383735613566623238633866666465303463666331223b7d733a343a2268617368223b733a36353a2235303032333361356462663837356135666232386338666664653034636663312d3531306432366666303430393262613665613664643034373863393964373532223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a353139323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a36313a7b733a33323a226132333066666463333331376261363932613831383361393966326565306135223b733a33323a223234323934363230353036623630333831316138643730643538323065386337223b733a33323a223332356238333162313933393531316430626265363437653761666261353163223b733a33323a226637363933366636636237393265336662633530653462333164376639633332223b733a33323a226166306162653662346538336363656130373535313935363435313263373231223b733a33323a226131333732333336643230303861326235326430636263393666303333303732223b733a33323a226562376439646437343838376635336632326334306665373437353638373831223b733a33323a223435376531633033323033396433333835653665626636363733663833316632223b733a33323a223838623933633037393664313262616161666332336561346465393265633566223b733a33323a223763663563393136663130643961366339346239393566323161383531383733223b733a33323a223766643961633638373865643034386136616134373431636233653337663630223b733a33323a223261626232313939316530316133386462373336386231633139386335363561223b733a33323a223562356431343362643135396139363334393336303763383732363163663636223b733a33323a223833663138316438343233626335623036356566633763636437333936656136223b733a33323a226435313939663361366564663734393866316434656561353961353438626130223b733a33323a226532613033306638666464366165663830306537316630613633323762633535223b733a33323a223537303162376638333061643762613061613835353863326539356233306531223b733a33323a223438623433346366323664623730393162303634343961633063386336376632223b733a33323a226261653637336239313033393461396561666465303361303861666632306537223b733a33323a223434323430653836666234383931313438633831393762343037386435346263223b733a33323a223062376462343962306235633564363937613666613864343264353065636339223b733a33323a226234393931613834363765633932346366636331313037306632663763663734223b733a33323a223432356163346230383035623832343934336635666335646131393535343937223b733a33323a223331323033353731383563613535306262616433333763306638353661333435223b733a33323a226236386466366136656433353233393530333430366631613136623030356163223b733a33323a226337663931303366316634663735343534386164383636616462343134653864223b733a33323a223565396466303064656431393734636232393466396538326364313165313865223b733a33323a223661356562656434363736393864386138386137333438656261623433663363223b733a33323a226463353862656163346338306165346233356330316261626136653465306330223b733a33323a223930356361323830646662373239313639303462653034353863333862393562223b733a33323a223839376165643066613336333639373937383538373337336664373864313562223b733a33323a223032316332636161363135383833366635376565356661313863663165313731223b733a33323a226262353363623164616362643833386230343334363531343531323033383964223b733a33323a223239383263356165383061313430343239393166313566313130366362396133223b733a33323a223762333936323863663363656561313762303962346539333765363633643664223b733a33323a223833383431373765306331356238393662393966616164323461326533623332223b733a33323a223135323963346362323832346132653137323763396133346131313363326635223b733a33323a223536353435646663323162313064303839656636653534613335646464326264223b733a33323a226530373061366531623130383138353337326235366563383639336430323735223b733a33323a223465373266356166366333393631333935366538326139323262303333616665223b733a33323a223161646161633734356236303939613366373839353830313664633031633437223b733a33323a223339366266646133386339313830663366346362396432343064343962636631223b733a33323a226363646235306137333331643836363632313134653065653431343635393636223b733a33323a223339333663633366316463626633356534656231306161313166613365323035223b733a33323a223938323963666164633330626564386533653638653139343735363631363939223b733a33323a223239373334663533376665313731353364653564383733633365613330653239223b733a33323a226538346532373436613433363635376332613036646333653134356133303365223b733a33323a223037373164613739323837373831643933616533373235343935356237303464223b733a33323a223361393430353536616536346238633362326236373536393639313464373835223b733a33323a226462666265343738376661356162343730646164613931346133373430363738223b733a33323a226565386239346536343036636430656537386138656435623036663463353333223b733a33323a226162613565626335366164333235306333313930353135326138316533323635223b733a33323a223264303464316630623765656365363339366433333437383435396566626365223b733a33323a223339316537346432396635376138346566383962333836313539396631623535223b733a33323a223132616366653064303131316464666136653266626631353666656365393036223b733a33323a223334633137396361663937333932343931346634653535346331303666663664223b733a33323a223063346663653066643134633062636132346133636334396462383961383462223b733a33323a226162663332646530333830626139656534346466663635363839383264313038223b733a33323a226165636432613166376261313463653462633235643931303661396262303166223b733a33323a223463623665626335343836323038623765373930333236343734343765323333223b733a33323a226261313737386236653539396133396265656365386132623064613865376562223b733a33323a226563343936383563343365656135303461346235363765343266633130326434223b733a33323a223237346637613362333166393336613436336632333732363038303632653463223b733a33323a223563333863343339313731636666343436646564343965313935383766643538223b733a33323a223462663537666661633565303030373238353037373465383131616466313964223b733a33323a223563386237316138363565376463336232393830306436616665316132613236223b733a33323a223761323736316538396366313636653431303234373264336161626463616134223b733a33323a223838663134323564306533646434666138323864323735623463656461656531223b733a33323a223631633663373034373262386164616337396133343732353733313464643764223b733a33323a223434393965666131323231643163316535366231323732393963646565333130223b733a33323a226536343330663163363736376437386662326230346138616364303830623063223b733a33323a223531376333656630303166613362383733613364303334383562633632366561223b733a33323a226430613831353439316135336235353135393335636261336339633764613633223b733a33323a226133623465636233653030333239663063633737633761303263623236313335223b733a33323a223665656235616430336362636463383063303933623364376533346665656432223b733a33323a226163646135643735346165383237616338303965356534343232633064316432223b733a33323a223865353737383437656531396431356638663239316139323964303238303738223b733a33323a223231623338376339306632303234376265383763386239353632383464336131223b733a33323a223531366233326530626333633465306339326235613232376462333337626163223b733a33323a223534376463306330643165613536326163633236393939653332313663633166223b733a33323a223063626165653335636636653265663436363730336630646332313061323730223b733a33323a223134313964656539623436336534363565636634303331633262343062383539223b733a33323a226235313561346231393063303862643166636633323032373231653436383064223b733a33323a223535626463633364626563306630623263303935616362306532643934303439223b733a33323a223632336139356261613461303538313463353666376134346666323363313135223b733a33323a226165646538353365613137623865313265616537326338616463646230333762223b733a33323a223636376335316261343233396663643831633833363331613632353261323437223b733a33323a223062353637313833396639346237363732623538663035323334616639326434223b733a33323a223035653166653333343063373166623434386437613965366131626637633839223b733a33323a226632656530643064313338323965356661643030656336376566656663373939223b733a33323a223331313265346333346536663662636333396163636131663930613732343262223b733a33323a226131663632373066356630663435373263313366356662633032656664633435223b733a33323a226232356265396233633335396237653530653339353064386435363331353963223b733a33323a223164663863336566373537393932333061356464316336373035313637616334223b733a33323a223462386333383837363030346233303262366664313234653833343936363131223b733a33323a226539383664613337386133383936323165393234356436613434373436353561223b733a33323a223165616561303936323638656164376434333638333466666538613033636439223b733a33323a226132386335383636663738653962356133373162646436653462333838623765223b733a33323a223837643263653030336636653162613832626130313337626634363530653165223b733a33323a223233616166316339616238663062313864653934316636663530643664326365223b733a33323a223661613931636366616365333338333336633736363661623736383861663134223b733a33323a223934366230306661643931363331613361643563343135333266393336343962223b733a33323a223732306133396164343134653831616532626661666639623139636362323336223b733a33323a226635396461623861613830626131373136623233306536613438646435393430223b733a33323a226439393537356533393866663234373565636233303738316534633431353431223b733a33323a223035623065616461643364333238346461393731363664316635313364633130223b733a33323a223036336137626661636161613435326161383636623139333962643764623464223b733a33323a223035623135343036353632653566643663363966336562656464373334323232223b733a33323a223733306162303035613532316164303438346331656665666666353035656435223b733a33323a223134376330333338383539376663613931613934343264386564303139663532223b733a33323a226436346564306237633466383131626338643634356565613933393638396331223b733a33323a223766316334623165633530643962343163383937666337363865373436613539223b733a33323a226631396438386530366232656263313335363839376661333364663432326231223b733a33323a226264303030323936643666356132333630613139323639373434646362623833223b733a33323a223430356463363432333437633164393531626239393966346463313736333830223b733a33323a223666666238616132396365366537346336383931636362663130643337373034223b733a33323a223232636137623164323834323964636564343436336335373838643234313461223b733a33323a223064656163363132363336316465333138666533356231356537313863313935223b733a33323a223239323238366338343632616135383132303935623364396264386633323336223b733a33323a223430373539633036363761343065643531323232613261623231393931303961223b733a33323a226631313263393363623637353038383861373662303835396537393836316637223b733a33323a223537386261643938373065323665316365313834353730323432613532363039223b7d733a343a2268617368223b733a36353a2235373862616439383730653236653163653138343537303234326135323630392d6631313263393363623637353038383861373662303835396537393836316637223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313433323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a223930356634303434666464626364653336323265326134396364623538636231223b733a33323a223333343163636237623038343835666137363438363330373036646537653438223b733a33323a226133303961373563613161343432633330333264663463393738653331666362223b733a33323a226135633961313135303966666362636662343963636237623934363661393033223b733a33323a226364333462653962613463646532376234633037393565313036383466636266223b733a33323a226364666230363764616164343266666133656236313866373236656230396266223b733a33323a223464376331366337663139353231303865356232626631386231303535356561223b733a33323a223063666539366131613834393862623863346631653238663631373537343434223b733a33323a223733313662653033303966396135316630333131323430373466363433643837223b733a33323a223034623966613136373634396439393662376134613237653933336464356466223b733a33323a223839653566636131613933366235663638313866663364366234623863323131223b733a33323a226637346161376634306466356261383935303132653636386434666562613035223b733a33323a223032333765646238383534326562646165356536346339623161356633616163223b733a33323a223136373963663565346436316431633039386131323839353434333261633339223b733a33323a223862383063323535376562303435636635323439313038366564613765653663223b733a33323a226437666437383531396163363862303138303336366663313335343033323461223b733a33323a226636336162323131623334613938353235326165623361663965386337643238223b733a33323a226237626234653361383136363133366530306263663232353863396662346463223b733a33323a223131623066636530666662383238383265636663376363646630663238363566223b733a33323a223536396236356332336661373637393532376663323665626232666236323263223b733a33323a223466633063353364313039356462386337383266353262663631643831623262223b733a33323a226436656639356130386238323962363266316130353563633337363365373737223b733a33323a223864333332636133346635356631646135653461333462653534663164343865223b733a33323a223837393563646261636362646439333362346362376563653334306432323365223b733a33323a226335333966623561643664353734363931373338626238646233353366363931223b733a33323a223331666239366266323263663131323130613566346534663536643039323037223b733a33323a226638396134653464656430626437653736386661656230326630323362643032223b733a33323a226534663534353530383732643939363731323134663663636134303562653261223b7d733a343a2268617368223b733a36353a2265346635343535303837326439393637313231346636636361343035626532612d6638396134653464656430626437653736386661656230326630323362643032223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1606121831),
('nl8bjng5osvo8nm07n23m30ntt', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353532393138362e3131303439323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223368346536706264633462336b67617033756a6a39656c6b7471223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353532393432353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353533323738353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630353533303030313b7d7d72656469726563745f75726c7c733a34343a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732d332e302e312f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223237333739353039373764393163643930336334376466656561666436333336223b733a33323a223761343665646236643730346661316533663539626334653462336435393334223b733a33323a226564373865373431386137386534343464396164663061383735653937313534223b733a33323a223861623561383861303535663239353462343166333933316439333363656164223b7d733a343a2268617368223b733a36353a2238616235613838613035356632393534623431663339333164393333636561642d6564373865373431386137386534343464396164663061383735653937313534223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333531323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34303a7b733a33323a226466343930343636656632646165393066336535386264363637653766613139223b733a33323a223234643431383938623338643734313836636237366632343563623432633231223b733a33323a223761656564363931666335343061376130363030313563303130383332356361223b733a33323a223435633132636230333631396135393434326436353465326465323732356564223b733a33323a223866653033626535386539626539333334633464356462376564643636663366223b733a33323a223634613534376238653634386131393164363932623331616236356165393461223b733a33323a226237656566623163336537336433313939393862323665643333653337343438223b733a33323a226336613633663034316137346434633133313561356239323831336335303830223b733a33323a226663373963386136303763353938633736383936613830343237653036383736223b733a33323a226635653139303839633462616162396332353163323930356262653765363639223b733a33323a223966636136623830663365373462396265633838646534373338363930613532223b733a33323a223633626166306135326561316633303138363861633238646332343163343437223b733a33323a223861363433366538333731386233393262626661383535356464336438393634223b733a33323a226563636165386162343733386132613266353166616262343064363666383837223b733a33323a223930613633313261366130636164366366306435333831643536646135323637223b733a33323a226131653535643832613831653865393739646664636435626663666337643337223b733a33323a223866626236653237326139663335346130313131393137366661393962616236223b733a33323a226666336233653961363334346330336463346362346236646135343535373837223b733a33323a226461656463326466633933663937363065346132663730616136633361636661223b733a33323a226266613330396538653333656432323833626439616131383338393037623734223b733a33323a223737616566303137303964626561333064376133306633623764333964366538223b733a33323a223338303863376434303030383630343838643031366662373733336161393761223b733a33323a223339313062343634326464326231653839396663636134326439383264333664223b733a33323a226462646535376364306661626439363432316565316462616333656435633732223b733a33323a223933643136613334323037386666343435323439396464653566643761386533223b733a33323a223431343636663832353062316131303264633439333932353430303938643164223b733a33323a223865363463373033326438636138336437323533646239376162306137663665223b733a33323a223736633231633863616634306430333439636434303336373135303564623564223b733a33323a223931616661646662376332333830663361333164373735323062616530643039223b733a33323a223737343366303662383466383831393765653936653364353439343831303832223b733a33323a223137646536356463313932396438323363376466346665326131316635393961223b733a33323a223537363836643063353866363635663465343662633332303338653735663166223b733a33323a223663363363356261363837386663636531643538323137653732633933613564223b733a33323a223431633536663237353337363535383962626533383431343334386530303033223b733a33323a226136326134666231636530346238616263376332313466333963393061303733223b733a33323a226666343432663236363737366230373961626436373363653635343337306465223b733a33323a223737356634356236336231313435373633393036326436343138613435323863223b733a33323a226432396661323633643365613165376165386466306533393031373130666336223b733a33323a226565663935373263383638626231353939633962316364666634666261383634223b733a33323a223666346231393362306431666630616465396162336533663234656635386332223b733a33323a223830623732396430653236323161393361633231616337333136643635663237223b733a33323a223538343765343335646132353164633964346432386461633661323139393238223b733a33323a226362626363373864396463376237316330613864646364353861643665613030223b733a33323a226231393161353135623635353735353962623062343531616335663264346564223b733a33323a223864333737363138656663653736386339613930383530646339363830643036223b733a33323a226639646234613565336636613961656433623537353735323862666438383736223b733a33323a223738346465643933353036393532663331633865626664316539346161303766223b733a33323a223735663762613831633834383436323065353864313165333661323431336561223b733a33323a226633646164326634313665396166373039343663396136656661393039326336223b733a33323a223066616266326361336536643333346232653438646637383832653161343934223b733a33323a223762633932613533303531633439306335666561633339643530656565666131223b733a33323a226335656662393264323933313733653461323538653235633138333437653136223b733a33323a226535616331373835623530303662316362666563666332313735643864323066223b733a33323a226231336261666363366162386635633635333133373230333538336335383039223b733a33323a226233373161356562366136353936663839366261643834323861623461343435223b733a33323a226630656132353165636664356131353765356432333462363462623936656630223b733a33323a226335326334306334613766613734303131646430333630373431666231663932223b733a33323a223738343833646137663865643631643564346331363530643838613837343964223b733a33323a226238336138306130623135663639626163643036363435393634613530333836223b733a33323a223237663236623733346631393534613631373966313430323537303031363531223b733a33323a226232306366383039373535363632363939353233656235633233373532343663223b733a33323a226162383139396334313665353035316466353939356664623039373865633762223b733a33323a223666303066363336383133303362633336626431386133316334333163616662223b733a33323a226266313535356431306562306630303262346263306161386539383336353738223b733a33323a223235306432356530306264613132626366656636323662313039356538623035223b733a33323a223037626266633034613963326666376332643239613236363232383130653561223b733a33323a223636323832646233666639613930643039383061323932326539336165306166223b733a33323a226434333362643030636333653365653561643264346136646631373438343866223b733a33323a226165363339303830613361396565356135613130646133303035653432313463223b733a33323a223965363832373732383766343430663737363233396532393431326532313064223b733a33323a226436373061636566346431653265343033306337613539373361376334333639223b733a33323a223739623732313761393333623663656461363464626139326262386230303734223b733a33323a223162653836353263633563646134616164333133306532333866646334346334223b733a33323a223634333836396365656664363837353837636238633439643466353435333233223b733a33323a226233353962643430366636653265386138386339363462633566343031613938223b733a33323a226635333939376161636439633332313436366365313130383536333266303963223b733a33323a226533656233333638356261316136626338376161326532643031326533306434223b733a33323a223430376639633932323035613938613732353665653861346137343539643138223b733a33323a223362333639366235363265323564663165653834383762653164333535623165223b733a33323a226234366432616532363739666238656139313137623133333433623431323435223b7d733a343a2268617368223b733a36353a2262343664326165323637396662386561393131376231333334336234313234352d3362333639366235363265323564663165653834383762653164333535623165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226364636238326336633836643766333137386335623934346238653334653730223b733a33323a223762646536373137396131626364393363373536633230343662613330303563223b733a33323a223736613536393237613435313738316366633435636133316564346637366365223b733a33323a226237663833373033363165633537653164316464313664633661646639333338223b733a33323a223766346639343564623732653038353035396161326665323932366633396334223b733a33323a223736376661656531343162666431616631336235666435626238666466663537223b733a33323a223339373231383065303039323437666637643966666234373365623564623739223b733a33323a226331623834663132303538623534666236653638323536663133366438383666223b733a33323a226663633564373663366533623939306663316236626436336161633638363635223b733a33323a223735393466333838663836383066336437383136376335366634613133626363223b733a33323a223134363437393963393633386339386137616666376164663330353135623831223b733a33323a223838353535366131303531366332636638323561346163646634663836303065223b7d733a343a2268617368223b733a36353a2238383535353661313035313663326366383235613461636466346638363030652d3134363437393963393633386339386137616666376164663330353135623831223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605529186),
('oh6qkbagvgq13r00u9osdcb2mm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630363634323630372e3838343130333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6836716b626167766771313372303075396f73646362326d6d223b7d7d, 1606642610),
('s7o0ishbe8k5it6lbq88ejhcsg', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630343931343538382e3532323838363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376874326b68767571666e3775747064656a366f31306b716766223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343931363933383b7d7d72656469726563745f75726c7c733a34343a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732d332e302e312f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223935653163646165653032323738663535336265323031316566376531333662223b733a33323a226639656430613133613137363362343431666537643665633264666631653635223b733a33323a226330353337323065666336623838313762306361363136316135363832363438223b733a33323a226532636536663538646638353539623865656564343263613962636237613631223b7d733a343a2268617368223b733a36353a2265326365366635386466383535396238656565643432636139626362376136312d6330353337323065666336623838313762306361363136316135363832363438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1604914588),
('sk3js3v0biqleff87bd6nrl9l5', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630343931343538382e3732393136363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736b336a733376306269716c65666638376264366e726c396c35223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343931383138383b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226163396535376464653565613961613764363130376139346162333834323866223b733a33323a223133363331653565653364333365616461326136393162646539613638376334223b7d733a343a2268617368223b733a36353a2231333633316535656533643333656164613261363931626465396136383763342d6163396535376464653565613961613764363130376139346162333834323866223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1604914588);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"mel.correia.92@gmail.com\"'),
('default_site', '\"\"'),
('default_to_private', '\"0\"'),
('disable_file_validation', '\"0\"'),
('disable_jsonld_embed', '\"0\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"LDW_OmekaS\"'),
('locale', '\"fr\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '\"25\"'),
('property_label_information', '\"none\"'),
('recaptcha_secret_key', '\"\"'),
('recaptcha_site_key', '\"\"'),
('time_zone', '\"UTC\"'),
('use_htmlpurifier', '\"0\"'),
('value_languages', '[]'),
('version', '\"3.0.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci,
  `navigation` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  KEY `IDX_694309E47E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

DROP TABLE IF EXISTS `site_block_attachment`;
CREATE TABLE IF NOT EXISTS `site_block_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_236473FEE9ED820C` (`block_id`),
  KEY `IDX_236473FE126F525E` (`item_id`),
  KEY `IDX_236473FEEA9FDD75` (`media_id`),
  KEY `block_position` (`block_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

DROP TABLE IF EXISTS `site_item_set`;
CREATE TABLE IF NOT EXISTS `site_item_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  KEY `IDX_D4CE134F6BD1646` (`site_id`),
  KEY `IDX_D4CE134960278D7` (`item_set_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

DROP TABLE IF EXISTS `site_page`;
CREATE TABLE IF NOT EXISTS `site_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  KEY `IDX_2F900BD9F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

DROP TABLE IF EXISTS `site_page_block`;
CREATE TABLE IF NOT EXISTS `site_page_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C593E731C4663E4` (`page_id`),
  KEY `page_position` (`page_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

DROP TABLE IF EXISTS `site_permission`;
CREATE TABLE IF NOT EXISTS `site_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  KEY `IDX_C0401D6FA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE IF NOT EXISTS `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `IDX_64D05A53F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'mel.correia.92@gmail.com', 'Mélanie Correia', '2020-11-08 14:22:34', '2020-11-08 14:22:34', '$2y$10$IQHuujcGhE6hEZf61XciMO0BW72HNjEddmJaocSotAgxbykJhISg6', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`user_id`),
  KEY `IDX_C779A692A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

DROP TABLE IF EXISTS `value`;
CREATE TABLE IF NOT EXISTS `value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `uri` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D77583489329D25` (`resource_id`),
  KEY `IDX_1D775834549213EC` (`property_id`),
  KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  KEY `value` (`value`(190)),
  KEY `uri` (`uri`(190))
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(5, 2, 139, NULL, 'literal', '', 'Lucas', NULL, 1),
(6, 2, 144, NULL, 'literal', '', 'Hauchard', NULL, 1),
(7, 2, 163, NULL, 'literal', '', 'Doublage, Chanson', NULL, 1),
(8, 2, 182, NULL, 'literal', '', '1997-01-27', NULL, 1),
(9, 3, 139, NULL, 'literal', '', 'Cyprien', NULL, 1),
(10, 3, 144, NULL, 'literal', '', 'Iov', NULL, 1),
(11, 3, 163, NULL, 'literal', '', 'Blogueur, acteur, scénariste de films et de bande dessinée', NULL, 1),
(12, 3, 182, NULL, 'literal', '', '1989-05-12', NULL, 1),
(13, 4, 139, NULL, 'literal', '', 'Norman', NULL, 1),
(14, 4, 144, NULL, 'literal', '', 'Thavaud', NULL, 1),
(15, 4, 163, NULL, 'literal', '', 'Acteur, doubleur, humoriste', NULL, 1),
(16, 4, 182, NULL, 'literal', '', '1987-04-14', NULL, 1),
(21, 5, 8, NULL, 'literal', '', 'Jeu vidéo, vidéos réactions', NULL, 1),
(22, 5, 20, NULL, 'literal', '', '2011-01-09', NULL, 1),
(25, 6, 8, NULL, 'literal', '', 'Stand-up, court métrage', NULL, 1),
(26, 6, 20, NULL, 'literal', '', '2007-02-25', NULL, 1),
(29, 7, 8, NULL, 'literal', '', 'Podcast vidéo, film humoristique, parodie', NULL, 1),
(30, 7, 20, NULL, 'literal', '', '2011-01-04', NULL, 1),
(32, 8, 139, NULL, 'literal', '', 'Mélanie', NULL, 1),
(33, 8, 145, NULL, 'literal', '', 'Correia', NULL, 1),
(34, 8, 131, NULL, 'literal', '', 'melanieCorr', NULL, 1),
(35, 8, 123, NULL, 'literal', '', 'mel.correia.92@gmail.com', NULL, 1),
(36, 9, 139, NULL, 'literal', '', 'Kamal', NULL, 1),
(37, 9, 145, NULL, 'literal', '', 'EL KADI', NULL, 1),
(38, 9, 131, NULL, 'literal', '', 'nelkadi96', NULL, 1),
(39, 9, 123, NULL, 'literal', '', 'elkadikama2@gmail.com', NULL, 1),
(40, 9, 1, NULL, 'literal', '', 'Kamal', NULL, 1),
(41, 10, 139, NULL, 'literal', '', 'Halim', NULL, 1),
(42, 10, 145, NULL, 'literal', '', 'Brinis', NULL, 1),
(43, 10, 131, NULL, 'literal', '', 'XT19', NULL, 1),
(44, 10, 123, NULL, 'literal', '', 'brinis.halim@outlook.fr', NULL, 1),
(45, 10, 1, NULL, 'literal', '', 'Halim', NULL, 1),
(46, 11, 139, NULL, 'literal', '', 'Ibrahim', NULL, 1),
(47, 11, 145, NULL, 'literal', '', 'Merizak', NULL, 1),
(48, 11, 131, NULL, 'literal', '', 'MerizIbra', NULL, 1),
(49, 11, 123, NULL, 'literal', '', 'ibrahim.merizak@yahoo.com', NULL, 1),
(50, 11, 1, NULL, 'literal', '', 'Ibrahim', NULL, 1),
(51, 8, 1, NULL, 'literal', '', 'Mélanie', NULL, 1),
(52, 7, 225, NULL, 'literal', '', 'Norman Thavaud ', NULL, 1),
(53, 6, 225, NULL, 'literal', '', 'Cyprien Iov', NULL, 1),
(54, 5, 225, NULL, 'literal', '', 'Lucas Hauchard ', NULL, 1),
(55, 4, 223, NULL, 'literal', '', 'Norman fait des vidéos', NULL, 1),
(56, 3, 223, NULL, 'literal', '', 'Cyprien ', NULL, 1),
(57, 2, 223, NULL, 'literal', '', 'Squeezie', NULL, 1),
(61, 7, 224, NULL, 'literal', '', 'Norman fait des vidéos', NULL, 1),
(62, 7, 1, NULL, 'literal', '', 'Norman fait des vidéos', NULL, 1),
(63, 6, 224, NULL, 'literal', '', 'Cyprien ', NULL, 1),
(64, 6, 1, NULL, 'literal', '', 'Cyprien ', NULL, 1),
(65, 5, 224, NULL, 'literal', '', 'Squeezie', NULL, 1),
(66, 5, 1, NULL, 'literal', '', 'Squeezie', NULL, 1),
(67, 4, 223, NULL, 'uri', NULL, '', 'https://www.youtube.com/user/NormanFaitDesVideos', 1),
(68, 3, 223, NULL, 'uri', NULL, '', 'https://www.youtube.com/user/MonsieurDream', 1),
(69, 2, 223, NULL, 'uri', NULL, '', 'https://www.youtube.com/user/aMOODIEsqueezie', 1),
(70, 16, 1, NULL, 'literal', '', 'Youtubeurs', NULL, 1),
(71, 17, 1, NULL, 'literal', '', 'Chaine', NULL, 1),
(72, 18, 1, NULL, 'literal', '', 'Utilisateurs', NULL, 1),
(73, 2, 1, NULL, 'literal', '', 'Lucas Hauchard', NULL, 1),
(74, 3, 1, NULL, 'literal', '', 'Cyprien Iov', NULL, 1),
(75, 4, 1, NULL, 'literal', '', 'Norman Thavaud ', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE IF NOT EXISTS `vocabulary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  KEY `IDX_9099C97B7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(6, 1, 'http://uri4uri.net/', 'uri4uri', 'Uri4uri', ''),
(7, 1, 'https://github.com/melanieCorr/Trombino-Groupe4/edit/main/bdd/voc.ttl', 'chaine', 'Chaine', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`);

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
