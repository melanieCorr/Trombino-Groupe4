-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 07 nov. 2020 à 20:40
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
-- Base de données : `omeka`
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
(1, 'items', 1, 1, 'Lucas', 'Lucas\nHauchard\n24\nDoublage, chanson\n2011'),
(2, 'items', 1, 1, 'SQUEEZIE', 'gaming\n2014\nSQUEEZIE\n15 200 000\n1 374\n7 504 792 671\nLucas'),
(3, 'items', 1, 1, 'Cyprien', 'Cyprien \nIov\n31\nBlogueur, acteur, scénariste de films et de bande dessinée\n2013 '),
(4, 'items', 1, 1, 'Norman', 'Norman \nThavaud\n33\nActeur, doubleur, humoriste\n2010'),
(5, 'items', 1, 1, 'Gandhi', 'Gandhi \nDjuna\n34\n2002'),
(6, 'items', 1, 1, 'Rémi', 'Rémi \nGAILLARD\n45\n1998'),
(7, 'items', 1, 1, 'Johan', 'Johan \nLelièvre\n28\n2010'),
(8, 'items', 1, 1, 'Cyprien', 'Comédie\n2007\nCyprien\n13 600 000\n171\n2 511 769 594\nCyprien'),
(9, 'items', 1, 1, 'NORMAN FAIT DES VIDÉOS', 'Court-métrages, Musique, Défis, Sketches\n2010\nNORMAN FAIT DES VIDÉOS\n12 200 000\n181\n\n2 426 070 743\nNorman'),
(10, 'items', 1, 1, 'GIMS', 'Music\n2017\nGIMS\n9 200 000\n79\n1 378 390 896\nGandhi'),
(11, 'items', 1, 1, 'Rémi GAILLARD', 'Comédie\n2007\nRémi GAILLARD\n7 007 000\n143\n1 808 129 299\nRémi'),
(12, 'items', 1, 1, 'Jojol', 'Technologie\n2009\nJojol\n2 800 000\n1 415\n380 419 221\nJohan'),
(13, 'items', 1, 1, 'Kamal', 'elkadikama2@gmail.com\nEL KADI\nKamal\nelkadi96'),
(14, 'items', 1, 1, 'Mélanie', 'mel.correia.92@gmail.com\n\nDe jesus correia\nMélanie\nmelanie92'),
(15, 'items', 1, 1, 'Halim', 'brinis.halim@outlook.fr\nBrinis\nHalim\nXT19'),
(16, 'items', 1, 1, 'Ibrahim', 'ibrahim.merizak@yahoo.com\nMerizak\nIbrahim\nMerizIbra');

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
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16);

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
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(185, 1, 5, 'allowTo', 'allowTo', NULL),
(186, 1, 5, 'canControl', 'canControl', NULL),
(187, 1, 5, 'channelOffer', 'channelOffer', NULL),
(188, 1, 5, 'commandAllowTo', 'commandAllowTo', NULL),
(189, 1, 5, 'hasAction', 'hasAction', NULL),
(190, 1, 5, 'hasCategory', 'hasCategory', NULL),
(191, 1, 5, 'hasCommand', 'hasCommand', NULL),
(192, 1, 5, 'hasDetail', 'hasDetail', NULL),
(193, 1, 5, 'hasNotification', 'hasNotification', NULL),
(194, 1, 5, 'hasRegisteredEntity', 'hasRegisteredEntity', NULL),
(195, 1, 5, 'hasService', 'hasService', NULL),
(196, 1, 5, 'hasTechnology', 'hasTechnology', NULL),
(197, 1, 5, 'hasTrigger', 'hasTrigger', NULL),
(198, 1, 5, 'isOfChannel', 'isOfChannel', NULL),
(199, 1, 5, 'location', 'location', NULL),
(200, 1, 5, 'nominal', 'nominal', NULL),
(201, 1, 5, 'nominalAction', 'nominalAction', NULL),
(202, 1, 5, 'nominalDetail', 'nominalDetail', NULL),
(203, 1, 5, 'nominalTrigger', 'nominalTrigger', NULL),
(204, 1, 5, 'notificationAllowTo', 'notificationAllowTo', NULL),
(205, 1, 5, 'offerAction', 'offerAction', NULL),
(206, 1, 5, 'offerDetail', 'offerDetail', NULL),
(207, 1, 5, 'offerTrigger', 'offerTrigger', NULL),
(208, 1, 5, 'triggers', 'triggers', NULL),
(209, 1, 5, 'where', 'where', NULL),
(210, 1, 5, 'which', 'which', NULL),
(211, 1, 5, 'who', 'who', NULL),
(212, 1, 5, 'description', 'description', 'description'),
(213, 1, 5, 'detail', 'detail', 'detail'),
(214, 1, 5, 'type', 'type', 'type'),
(215, 1, 5, 'value', 'value', 'value'),
(236, 1, 7, 'accrualPolicy', 'accrualPolicy', 'The policy governing the addition of items to a collection.'),
(237, 1, 7, 'answerMethod', 'answerMethod', 'The method used to answer a question'),
(238, 1, 7, 'answers', 'answers', 'answer a question'),
(239, 1, 7, 'asserts', 'asserts', 'a reasoning that mus eval to true.'),
(240, 1, 7, 'builds', 'builds', 'Relates to the target graph name. That contains metadata and data derived from a KEES agent activities.'),
(241, 1, 7, 'changes', 'changes', 'Specifies that the referenced URI is changed by the KEES Plan execution. \nURI MUST be a graph name. The resource referenced by keees:builds property must always referenced also by this property.'),
(242, 1, 7, 'destructor', 'destructor', 'Specifies a resource (normally a SPIN Update resource) that destroies all resouces created by constructor. If not specified by default, to destroy all resources  generated by constructod just drop all changed named graph referred from kees:changes property.'),
(243, 1, 7, 'from', 'from', 'Specify the constructor of a plan. A constructor can be a  data source or any resource that a KEES agent can understand (.e.g. a SPIN Construct ou Insert resource)'),
(244, 1, 7, 'planSequence', 'workflow', 'It is a shortcut to specify plan dependencies. \nFor example:\n\nex:kb kees:workflow ( ex:plan1 ex:plan2)`\nmeans that \nex:plan2 kees:requires ex:plan1'),
(245, 1, 7, 'requires', 'requires', 'The referenced object must be interpreted as the :name of a named graph (  to be created or to be update). At least one kees:required named graph imust be  newer tha the target graph.'),
(246, 1, 7, 'workflow', 'workflow', 'relates to a RDF list of kees:Plan.  The list order determine the\nplan execution.'),
(247, 1, 7, 'accrualPeriodicity', 'accrualPeriodicity', 'The frequency with which data are added to a knowledge base.'),
(248, 1, 8, 'account', 'account', NULL),
(249, 1, 8, 'connectsTo', 'connects to', NULL),
(250, 1, 8, 'delegationRecordPage', 'delegation record page', NULL),
(251, 1, 8, 'filename', 'filename', NULL),
(252, 1, 8, 'fragmentOf', 'fragment of', NULL),
(253, 1, 8, 'fragment', 'fragment', NULL),
(254, 1, 8, 'host', 'host', NULL),
(255, 1, 8, 'IANAPage', 'IANA page', NULL),
(256, 1, 8, 'IANARef', 'IANA reference', NULL),
(257, 1, 8, 'identifiedBy', 'identified by URI', NULL),
(258, 1, 8, 'key', 'key', NULL),
(259, 1, 8, 'length', 'length', NULL),
(260, 1, 8, 'md5', 'md5 hash', NULL),
(261, 1, 8, 'pass', 'password', NULL),
(262, 1, 8, 'path', 'path', NULL),
(263, 1, 8, 'port', 'port', NULL),
(264, 1, 8, 'query', 'query', NULL),
(265, 1, 8, 'queryString', 'query string', NULL),
(266, 1, 8, 'scheme', 'URI scheme', NULL),
(267, 1, 8, 'sponsor', 'sponsor', NULL),
(268, 1, 8, 'subDom', 'subdomain', NULL),
(269, 1, 8, 'suffix', 'suffix', NULL),
(270, 1, 8, 'object', 'object', NULL),
(271, 1, 8, 'predicate', 'predicate', NULL),
(272, 1, 8, 'subject', 'subject', NULL),
(273, 1, 8, 'trueAt', 'trueAt', NULL),
(274, 1, 8, 'usedForFormat', 'used for format', NULL),
(275, 1, 8, 'usedForSuffix', 'used for suffix', NULL),
(276, 1, 8, 'user', 'user', NULL),
(277, 1, 8, 'value', 'value', NULL),
(278, 1, 8, 'whoIsRecord', 'whois record', NULL),
(279, 1, 8, 'hasWhoIsServer', 'whois server', NULL),
(280, 1, 9, 'ChannelnbAbonnes', 'Nombre d\'abonnés', NULL),
(281, 1, 9, 'ChannelnomChaine', 'Nom de la chaine', NULL),
(282, 1, 9, 'ChannelnbVideos', 'Nombre de vidéos', NULL),
(283, 1, 9, 'ChannelnbVues', 'Nombre de vue', NULL),
(284, 1, 9, 'ChannelhasYoutubeur', 'hasYoutubeur', 'La propriétaire de cette chaine'),
(285, NULL, 9, 'ChannelhasChannel', 'hasChannel', 'La vidéo appartien à cette personne');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(1, 1, 94, 2, NULL, 'Lucas', 1, '2020-11-05 08:47:00', '2020-11-07 19:05:03', 'Omeka\\Entity\\Item'),
(2, 1, 154, 3, NULL, 'SQUEEZIE', 1, '2020-11-07 18:42:15', '2020-11-07 19:34:58', 'Omeka\\Entity\\Item'),
(3, 1, 94, 2, NULL, 'Cyprien', 1, '2020-11-07 19:04:11', '2020-11-07 19:04:11', 'Omeka\\Entity\\Item'),
(4, 1, 94, 2, NULL, 'Norman', 1, '2020-11-07 19:12:05', '2020-11-07 19:12:05', 'Omeka\\Entity\\Item'),
(5, 1, 94, 2, NULL, 'Gandhi', 1, '2020-11-07 19:20:15', '2020-11-07 19:20:15', 'Omeka\\Entity\\Item'),
(6, 1, 94, 2, NULL, 'Rémi', 1, '2020-11-07 19:24:54', '2020-11-07 19:24:54', 'Omeka\\Entity\\Item'),
(7, 1, 94, 2, NULL, 'Johan', 1, '2020-11-07 19:28:47', '2020-11-07 19:28:47', 'Omeka\\Entity\\Item'),
(8, 1, 154, 3, NULL, 'Cyprien', 1, '2020-11-07 19:33:46', '2020-11-07 19:36:47', 'Omeka\\Entity\\Item'),
(9, 1, 154, 3, NULL, 'NORMAN FAIT DES VIDÉOS', 1, '2020-11-07 19:42:58', '2020-11-07 19:42:58', 'Omeka\\Entity\\Item'),
(10, 1, 154, 3, NULL, 'GIMS', 1, '2020-11-07 19:46:26', '2020-11-07 19:46:26', 'Omeka\\Entity\\Item'),
(11, 1, 154, 3, NULL, 'Rémi GAILLARD', 1, '2020-11-07 19:48:57', '2020-11-07 19:48:57', 'Omeka\\Entity\\Item'),
(12, 1, 154, 3, NULL, 'Jojol', 1, '2020-11-07 19:51:30', '2020-11-07 19:51:30', 'Omeka\\Entity\\Item'),
(13, 1, 94, 4, NULL, 'Kamal', 1, '2020-11-07 20:32:08', '2020-11-07 20:32:08', 'Omeka\\Entity\\Item'),
(14, 1, 94, 4, NULL, 'Mélanie', 1, '2020-11-07 20:34:43', '2020-11-07 20:34:43', 'Omeka\\Entity\\Item'),
(15, 1, 94, 4, NULL, 'Halim', 1, '2020-11-07 20:36:10', '2020-11-07 20:36:10', 'Omeka\\Entity\\Item'),
(16, 1, 94, 4, NULL, 'Ibrahim', 1, '2020-11-07 20:37:53', '2020-11-07 20:37:53', 'Omeka\\Entity\\Item');

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
) ENGINE=InnoDB AUTO_INCREMENT=836 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(106, 1, 5, 'AcceptCommunicationAction', 'AcceptCommunicationAction', NULL),
(107, 1, 5, 'Action', 'Action', NULL),
(108, 1, 5, 'ActivateEnvironmentSceneAction', 'ActivateEnvironmentSceneAction', NULL),
(109, 1, 5, 'ActivityAction', 'ActivityAction', NULL),
(110, 1, 5, 'ActivityTrigger', 'ActivityTrigger', NULL),
(111, 1, 5, 'AddAlarmAction', 'AddAlarmAction', NULL),
(112, 1, 5, 'AddCalendarItemAction', 'AddCalendarItemAction', NULL),
(113, 1, 5, 'AddRemindAction', 'AddRemindAction', NULL),
(114, 1, 5, 'AddReminderAction', 'AddReminderAction', NULL),
(115, 1, 5, 'AddTimerAction', 'AddTimerAction', NULL),
(116, 1, 5, 'AddedAlarmTrigger', 'AddedAlarmTrigger', NULL),
(117, 1, 5, 'AddedCalendarItemTrigger', 'AddedCalendarItemTrigger', NULL),
(118, 1, 5, 'AddedRemindTrigger', 'AddedRemindTrigger', NULL),
(119, 1, 5, 'AddedReminderTrigger', 'AddedReminderTrigger', NULL),
(120, 1, 5, 'AddedTimerTrigger', 'AddedTimerTrigger', NULL),
(121, 1, 5, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(122, 1, 5, 'AirConditioner', 'AirConditioner', NULL),
(123, 1, 5, 'AirMonitor', 'AirMonitor', NULL),
(124, 1, 5, 'AirPressureService', 'AirPressureService', NULL),
(125, 1, 5, 'AirPurifier', 'AirPurifier', NULL),
(126, 1, 5, 'AirPurifierDisabledTrigger', 'AirPurifierDisabledTrigger', NULL),
(127, 1, 5, 'AirPurifierEnabledTrigger', 'AirPurifierEnabledTrigger', NULL),
(128, 1, 5, 'AirPurifierService', 'AirPurifierService', NULL),
(129, 1, 5, 'AlarmClockService', 'AlarmClockService', NULL),
(130, 1, 5, 'AnswerCallAction', 'AnswerCallAction', NULL),
(131, 1, 5, 'AntiIntrusionSystem', 'AntiIntrusionSystem', NULL),
(132, 1, 5, 'Appliance', 'Appliance', NULL),
(133, 1, 5, 'ApplianceService', 'ApplianceService', NULL),
(134, 1, 5, 'ArriveOnVehicleTrigger', 'ArriveOnVehicleTrigger', NULL),
(135, 1, 5, 'AttachementService', 'AttachementService', NULL),
(136, 1, 5, 'AudioRecordingService', 'AudioRecordingService', NULL),
(137, 1, 5, 'AudioService', 'AudioService', NULL),
(138, 1, 5, 'BatteryService', 'BatteryService', NULL),
(139, 1, 5, 'Beacon', 'Beacon', NULL),
(140, 1, 5, 'BikeTrackingService', 'BikeTrackingService', NULL),
(141, 1, 5, 'BlockCallAction', 'BlockCallAction', NULL),
(142, 1, 5, 'Blog', 'Blog', NULL),
(143, 1, 5, 'BluetoothService', 'BluetoothService', NULL),
(144, 1, 5, 'BrightnessDecreasedTrigger', 'BrightnessDecreasedTrigger', NULL),
(145, 1, 5, 'BrightnessIncreasedTrigger', 'BrightnessIncreasedTrigger', NULL),
(146, 1, 5, 'Building', 'Building', NULL),
(147, 1, 5, 'BuyCommand', 'BuyCommand', NULL),
(148, 1, 5, 'CalendarService', 'CalendarService', NULL),
(149, 1, 5, 'CalendarTool', 'Calendar', NULL),
(150, 1, 5, 'CallService', 'CallService', NULL),
(151, 1, 5, 'CallTool', 'Call', NULL),
(152, 1, 5, 'Camera', 'Camera', NULL),
(153, 1, 5, 'Category', 'Category', NULL),
(154, 1, 5, 'Channel', 'Channel', NULL),
(155, 1, 5, 'ChatTool', 'Chat', NULL),
(156, 1, 5, 'CloseCommand', 'CloseCommand', NULL),
(157, 1, 5, 'CloseNotification', 'CloseNotification', NULL),
(158, 1, 5, 'CloseSafetyValveAction', 'CloseSafetyValveAction', NULL),
(159, 1, 5, 'CloseWindowFrameAction', 'CloseWindowFrameAction', NULL),
(160, 1, 5, 'CloudPlatform', 'CloudPlatform', NULL),
(161, 1, 5, 'CodeHostingPlatform', 'CodeHostingPlatform', NULL),
(162, 1, 5, 'CoffeeMaker', 'CoffeeMaker', NULL),
(163, 1, 5, 'CoffeeService', 'CoffeeService', NULL),
(164, 1, 5, 'Colleague', 'Colleague', NULL),
(165, 1, 5, 'Command', 'Command', NULL),
(166, 1, 5, 'CommentService', 'CommentService', NULL),
(167, 1, 5, 'CommunicationService', 'CommunicationService', NULL),
(168, 1, 5, 'CommunicationTool', 'CommunicationTool', NULL),
(169, 1, 5, 'ConnectCommand', 'ConnectCommand', NULL),
(170, 1, 5, 'ConnectDeviceAction', 'ConnectDeviceAction', NULL),
(171, 1, 5, 'ConnectNotification', 'ConnectNotification', NULL),
(172, 1, 5, 'ConnectToDeviceAction', 'ConnectToDeviceAction', NULL),
(173, 1, 5, 'ConnectToNetworkAction', 'ConnectToNetworkAction', NULL),
(174, 1, 5, 'ConnectToWebServiceAction', 'ConnectToWebServiceAction', NULL),
(175, 1, 5, 'ConnectedVehicle', 'ConnectedVehicle', NULL),
(176, 1, 5, 'ConnectionToDeviceTrigger', 'ConnectionToDeviceTrigger', NULL),
(177, 1, 5, 'ConnectionToNetworkTrigger', 'ConnectionToNetworkTrigger', NULL),
(178, 1, 5, 'ConnectivityAction', 'ConnectivityAction', NULL),
(179, 1, 5, 'ConnectivityTrigger', 'ConnectivityTrigger', NULL),
(180, 1, 5, 'Console', 'Console', NULL),
(181, 1, 5, 'ContactService', 'ContactService', NULL),
(182, 1, 5, 'Cooker', 'Cooker', NULL),
(183, 1, 5, 'CoolingService', 'CoolingService', NULL),
(184, 1, 5, 'CoolingSystemDisabledTrigger', 'CoolingSystemDisabledTrigger', NULL),
(185, 1, 5, 'CoolingSystemEnabledTrigger', 'CoolingSystemEnabledTrigger', NULL),
(186, 1, 5, 'DIYElectronic', 'DIYElectronic', NULL),
(187, 1, 5, 'DangerousActivityDetectedTrigger', 'DangerousActivityDetectedTrigger', NULL),
(188, 1, 5, 'DangerousActivityTrackingService', 'DangerousActivityTrackingService', NULL),
(189, 1, 5, 'DecreaseAirQualityAction', 'DecreaseAirQualityAction', NULL),
(190, 1, 5, 'DecreaseConnectivityAction', 'DecreaseConnectivityAction', NULL),
(191, 1, 5, 'DecreaseEnvironmentConditionAction', 'DecreaseEnvironmentConditionAction', NULL),
(192, 1, 5, 'DecreaseHumidityAction', 'DecreaseHumidityAction', NULL),
(193, 1, 5, 'DecreaseLightingAction', 'DecreaseLightingAction', NULL),
(194, 1, 5, 'DecreaseNoiseAction', 'DecreaseNoiseAction', NULL),
(195, 1, 5, 'DecreaseSecurityAction', 'DecreaseSecurityAction', NULL),
(196, 1, 5, 'DecreaseTemperatureAction', 'DecreaseTemperatureAction', NULL),
(197, 1, 5, 'DecreaseUserConnectivityAction', 'DecreaseUserConnectivityAction', NULL),
(198, 1, 5, 'DecreaseVolumeAction', 'DecreaseVolumeAction', NULL),
(199, 1, 5, 'DecreasedAirPressureTrigger', 'DecreasedAirPressureTrigger', NULL),
(200, 1, 5, 'DecreasedAirQualityTrigger', 'DecreasedAirQualityTrigger', NULL),
(201, 1, 5, 'DecreasedConnectivityTrigger', 'DecreasedConnectivityTrigger', NULL),
(202, 1, 5, 'DecreasedHealthConditionTrigger', 'DecreasedHealthConditionTrigger', NULL),
(203, 1, 5, 'DecreasedHumidityTrigger', 'DecreasedHumidityTrigger', NULL),
(204, 1, 5, 'DecreasedLightingTrigger', 'DecreasedLightingTrigger', NULL),
(205, 1, 5, 'DecreasedNoiseLevelTrigger', 'DecreasedNoiseLevelTrigger', NULL),
(206, 1, 5, 'DecreasedSecurityTrigger', 'DecreasedSecurityTrigger', NULL),
(207, 1, 5, 'DecreasedTemperatureTrigger', 'DecreasedTemperatureTrigger', NULL),
(208, 1, 5, 'DecreasedWeatherConditionsTrigger', 'DecreasedWeatherConditionsTrigger', NULL),
(209, 1, 5, 'Dehumidifier', 'Dehumidifier', NULL),
(210, 1, 5, 'DehumidifierService', 'DehumidifierService', NULL),
(211, 1, 5, 'DehumidifierSystemDisabledTrigger', 'DehumidifierSystemDisabledTrigger', NULL),
(212, 1, 5, 'DehumidifierSystemEnabledTrigger', 'DehumidifierSystemEnabledTrigger', NULL),
(213, 1, 5, 'DeleteAction', 'DeleteAction', NULL),
(214, 1, 5, 'DeleteAlarmAction', 'DeleteAlarmAction', NULL),
(215, 1, 5, 'DeleteCalendarItemAction', 'DeleteCalendarItemAction', NULL),
(216, 1, 5, 'DeleteCommand', 'DeleteCommand', NULL),
(217, 1, 5, 'DeleteContactAction', 'DeleteContactAction', NULL),
(218, 1, 5, 'DeleteFileAction', 'DeleteFileAction', NULL),
(219, 1, 5, 'DeleteFromStorageAction', 'DeleteFromStorageAction', NULL),
(220, 1, 5, 'DeleteHealthInformationAction', 'DeleteHealthInformationAction', NULL),
(221, 1, 5, 'DeleteMediaInformationAction', 'DeleteMediaInformationAction', NULL),
(222, 1, 5, 'DeleteNotification', 'DeleteNotification', NULL),
(223, 1, 5, 'DeleteRemindAction', 'DeleteRemindAction', NULL),
(224, 1, 5, 'DeleteReminderAction', 'DeleteReminderAction', NULL),
(225, 1, 5, 'DeleteTimerAction', 'DeleteTimerAction', NULL),
(226, 1, 5, 'DeleteWebBookmarkAction', 'DeleteWebBookmarkAction', NULL),
(227, 1, 5, 'DeletedAlarmTrigger', 'DeletedAlarmTrigger', NULL),
(228, 1, 5, 'DeletedAppTrigger', 'DeletedAppTrigger', NULL),
(229, 1, 5, 'DeletedCalendarItemTrigger', 'DeletedCalendarItemTrigger', NULL),
(230, 1, 5, 'DeletedContactTrigger', 'DeletedContactTrigger', NULL),
(231, 1, 5, 'DeletedFileTrigger', 'DeletedFileTrigger', NULL),
(232, 1, 5, 'DeletedFromStorageTrigger', 'DeletedFromStorageTrigger', NULL),
(233, 1, 5, 'DeletedHealthInformationTrigger', 'DeletedHealthInformationTrigger', NULL),
(234, 1, 5, 'DeletedMediaInformationTrigger', 'DeletedMediaInformationTrigger', NULL),
(235, 1, 5, 'DeletedRemindTrigger', 'DeletedRemindTrigger', NULL),
(236, 1, 5, 'DeletedReminderTrigger', 'DeletedReminderTrigger', NULL),
(237, 1, 5, 'DeletedTimerTrigger', 'DeletedTimerTrigger', NULL),
(238, 1, 5, 'DeletedTrigger', 'DeletedTrigger', NULL),
(239, 1, 5, 'DeletedWebBookmarkTrigger', 'DeletedWebBookmarkTrigger', NULL),
(240, 1, 5, 'Detail', 'Detail', NULL),
(241, 1, 5, 'DeveloperTool', 'DeveloperTool', NULL),
(242, 1, 5, 'DeviceAction', 'DeviceAction', NULL),
(243, 1, 5, 'DeviceConnectedTrigger', 'DeviceConnectedTrigger', NULL),
(244, 1, 5, 'DeviceConnectivityDisabledTrigger', 'DeviceConnectivityDisabledTrigger', NULL),
(245, 1, 5, 'DeviceConnectivityEnabledTrigger', 'DeviceConnectivityEnabledTrigger', NULL),
(246, 1, 5, 'DeviceDisconnectedTrigger', 'DeviceDisconnectedTrigger', NULL),
(247, 1, 5, 'DeviceFailureTrigger', 'DeviceFailureTrigger', NULL),
(248, 1, 5, 'DeviceLeakTrigger', 'DeviceLeakTrigger', NULL),
(249, 1, 5, 'DevicePluggedTrigger', 'DevicePluggedTrigger', NULL),
(250, 1, 5, 'DeviceSavingModeDisabledTrigger', 'DeviceSavingModeDisabledTrigger', NULL),
(251, 1, 5, 'DeviceSavingModeEnabledTrigger', 'DeviceSavingModeEnabledTrigger', NULL),
(252, 1, 5, 'DeviceService', 'DeviceService', NULL),
(253, 1, 5, 'DeviceTrigger', 'DeviceTrigger', NULL),
(254, 1, 5, 'DeviceTurnedOffTrigger', 'DeviceTurnedOffTrigger', NULL),
(255, 1, 5, 'DeviceTurnedOnTrigger', 'DeviceTurnedOnTrigger', NULL),
(256, 1, 5, 'DeviceUnpluggedTrigger', 'DeviceUnpluggedTrigger', NULL),
(257, 1, 5, 'DeviceUsageWarningTrigger', 'DeviceUsageWarningTrigger', NULL),
(258, 1, 5, 'DisableAirPurifierSystemAction', 'DisableAirPurifierSystemAction', NULL),
(259, 1, 5, 'DisableAirplaneModeAction', 'DisableAirplaneModeAction', NULL),
(260, 1, 5, 'DisableBluetoothConnectivityAction', 'DisableBluetoothConnectivityAction', NULL),
(261, 1, 5, 'DisableCommand', 'DisableCommand', NULL),
(262, 1, 5, 'DisableCoolingSystemAction', 'DisableCoolingSystemAction', NULL),
(263, 1, 5, 'DisableDehumidifierSystemAction', 'DisableDehumidifierSystemAction', NULL),
(264, 1, 5, 'DisableDeviceConnectivityAction', 'DisableDeviceConnectivityAction', NULL),
(265, 1, 5, 'DisableDeviceSavingModeAction', 'DisableDeviceSavingModeAction', NULL),
(266, 1, 5, 'DisableGPSAction', 'DisableGPSAction', NULL),
(267, 1, 5, 'DisableHeatingSystemAction', 'DisableHeatingSystemAction', NULL),
(268, 1, 5, 'DisableHumidifierSystemAction', 'DisableHumidifierSystemAction', NULL),
(269, 1, 5, 'DisableInternetConnectivityAction', 'DisableInternetConnectivityAction', NULL),
(270, 1, 5, 'DisableLightingSystemAction', 'DisableLightingSystemAction', NULL),
(271, 1, 5, 'DisableNFCConnectivityAction', 'DisableNFCConnectivityAction', NULL),
(272, 1, 5, 'DisableNightModeAction', 'DisableNightModeAction', NULL),
(273, 1, 5, 'DisableNotification', 'DisableNotification', NULL),
(274, 1, 5, 'DisableNotificationsAction', 'DisableNotificationsAction', NULL),
(275, 1, 5, 'DisableScreenRotationAction', 'DisableScreenRotationAction', NULL),
(276, 1, 5, 'DisableSecuritySystemAction', 'DisableSecuritySystemAction', NULL),
(277, 1, 5, 'DisableWateringSystemAction', 'DisableWateringSystemAction', NULL),
(278, 1, 5, 'DisabledAirplaneModeTrigger', 'DisabledAirplaneModeTrigger', NULL),
(279, 1, 5, 'DisabledBluetoothConnectivityTrigger', 'DisabledBluetoothConnectivityTrigger', NULL),
(280, 1, 5, 'DisabledGPSTrigger', 'DisabledGPSTrigger', NULL),
(281, 1, 5, 'DisabledInternetConnectivityTrigger', 'DisabledInternetConnectivityTrigger', NULL),
(282, 1, 5, 'DisabledNFCConnectivityTrigger', 'DisabledNFCConnectivityTrigger', NULL),
(283, 1, 5, 'DisconnectCommand', 'DisconnectCommand', NULL),
(284, 1, 5, 'DisconnectDeviceAction', 'DisconnectDeviceAction', NULL),
(285, 1, 5, 'DisconnectFromDeviceAction', 'DisconnectFromDeviceAction', NULL),
(286, 1, 5, 'DisconnectFromNetworkAction', 'DisconnectFromNetworkAction', NULL),
(287, 1, 5, 'DisconnectNotification', 'DisconnectNotification', NULL),
(288, 1, 5, 'DisconnectedFromDeviceTrigger', 'DisconnectedFromDeviceTrigger', NULL),
(289, 1, 5, 'DisconnectedFromNetworkTrigger', 'DisconnectedFromNetworkTrigger', NULL),
(290, 1, 5, 'Dishwasher', 'Dishwasher', NULL),
(291, 1, 5, 'DisplaySerivce', 'DisplayService', NULL),
(292, 1, 5, 'DisplyService', 'DisplayService', NULL),
(293, 1, 5, 'DiswashingService', 'DiswashingService', NULL),
(294, 1, 5, 'Dryer', 'Dryer', NULL),
(295, 1, 5, 'DryingService', 'DryingService', NULL),
(296, 1, 5, 'DvdPlayer', 'DVDPlayer', NULL),
(297, 1, 5, 'EUDPlatform', 'EUDPlatform', NULL),
(298, 1, 5, 'EcommerceService', 'EcommerceService', NULL),
(299, 1, 5, 'EcommerceWebSite', 'ECommerceWebsite', NULL),
(300, 1, 5, 'EmailTool', 'EMail', NULL),
(301, 1, 5, 'EnableAirPurifierSystemAction', 'EnableAirPurifierSystemAction', NULL),
(302, 1, 5, 'EnableAirplaneModeAction', 'EnableAirplaneModeAction', NULL),
(303, 1, 5, 'EnableBluetoothConnectivityAction', 'EnableBluetoothConnectivityAction', NULL),
(304, 1, 5, 'EnableCommand', 'EnableCommand', NULL),
(305, 1, 5, 'EnableCoolingSystemAction', 'EnableCoolingSystemAction', NULL),
(306, 1, 5, 'EnableDehumidifierSystemAction', 'EnableDehumidifierSystemAction', NULL),
(307, 1, 5, 'EnableDeviceConnectivityAction', 'EnableDeviceConnectivityAction', NULL),
(308, 1, 5, 'EnableDeviceSavingModeAction', 'EnableDeviceSavingModeAction', NULL),
(309, 1, 5, 'EnableGPSAction', 'EnableGPSAction', NULL),
(310, 1, 5, 'EnableHeatingSystemAction', 'EnableHeatingSystemAction', NULL),
(311, 1, 5, 'EnableHumidifierSystemAction', 'EnableHumidifierSystemAction', NULL),
(312, 1, 5, 'EnableInternetConnectivityAction', 'EnableInternetConnectivityAction', NULL),
(313, 1, 5, 'EnableLightingSystemAction', 'EnableLightingSystemAction', NULL),
(314, 1, 5, 'EnableNFCConnctivityAction', 'EnableNGFCConnectivityAction', NULL),
(315, 1, 5, 'EnableNightModeAction', 'EnableNightModeAction', NULL),
(316, 1, 5, 'EnableNotification', 'EnableNotification', NULL),
(317, 1, 5, 'EnableNotificationsAction', 'EnableNotificationsAction', NULL),
(318, 1, 5, 'EnableScreenRotationAction', 'EnableScreenRotationAction', NULL),
(319, 1, 5, 'EnableSecuritySystemAction', 'EnableSecuritySystemAction', NULL),
(320, 1, 5, 'EnableSpeakerphoneAction', 'EnableSpeakerphoneAction', NULL),
(321, 1, 5, 'EnableWateringSystemAction', 'EnableWateringSystemAction', NULL),
(322, 1, 5, 'EnabledAirplaneModeTrigger', 'EnabledAirplaneModeTrigger', NULL),
(323, 1, 5, 'EnabledBluetoothConnectivityTrigger', 'EnabledBluetoothConnectivityTrigger', NULL),
(324, 1, 5, 'EnabledGPSTrigger', 'EnabledGPSTrigger', NULL),
(325, 1, 5, 'EnabledInternetConnectivityTrigger', 'EnabledInternetConnectivityTrigger', NULL),
(326, 1, 5, 'EnabledNFCConnectivityTrigger', 'EnabledNFCConnectivityTrigger', NULL),
(327, 1, 5, 'EndCallAction', 'EndCallAction', NULL),
(328, 1, 5, 'EnhancedConnectivityTrigger', 'EnhancedConnectivityTrigger', NULL),
(329, 1, 5, 'EnterNotification', 'EnterNotification', NULL),
(330, 1, 5, 'EnterTrigger', 'EnterTrigger', NULL),
(331, 1, 5, 'EnvironmentAction', 'EnvironmentAction', NULL),
(332, 1, 5, 'EnvironmentConditionDecreasedTrigger', 'EnvironmentConditionDecreasedTrigger', NULL),
(333, 1, 5, 'EnvironmentConditionIncreasedTrigger', 'EnvironmentConditionIncreasedTrigger', NULL),
(334, 1, 5, 'EnvironmentTrigger', 'EnvironmentTrigger', NULL),
(335, 1, 5, 'EveryDayTrigger', 'EveryDayTrigger', NULL),
(336, 1, 5, 'EveryHourTrigger', 'EveryHourTrigger', NULL),
(337, 1, 5, 'EveryMonthTrigger', 'EveryMonthTrigger', NULL),
(338, 1, 5, 'EveryTimeTrigger', 'EveryTimeTrigger', NULL),
(339, 1, 5, 'EveryWeekTrigger', 'EveryWeekTrigger', NULL),
(340, 1, 5, 'EveryYearTrigger', 'EveryYearTrigger', NULL),
(341, 1, 5, 'ExitNotification', 'ExitNotification', NULL),
(342, 1, 5, 'ExitTrigger', 'ExitTrigger', NULL),
(343, 1, 5, 'FailureDetectionService', 'FailureDetectionService', NULL),
(344, 1, 5, 'Family', 'Family', NULL),
(345, 1, 5, 'Fax', 'Fax', NULL),
(346, 1, 5, 'FileService', 'FileService', NULL),
(347, 1, 5, 'FocusTrackingService', 'FocusTrackingService', NULL),
(348, 1, 5, 'FrameService', 'FrameService', NULL),
(349, 1, 5, 'Fridge', 'Fridge', NULL),
(350, 1, 5, 'Friend', 'Friend', NULL),
(351, 1, 5, 'GPSEnterAreaTrigger', 'GPSEnterAreaTrigger', NULL),
(352, 1, 5, 'GPSExitAreaTrigger', 'GPSExitAreaTrigger', NULL),
(353, 1, 5, 'GPSService', 'GPSService', NULL),
(354, 1, 5, 'GameService', 'GameService', NULL),
(355, 1, 5, 'GeographicalArea', 'GeographicalArea', NULL),
(356, 1, 5, 'GetAction', 'GetAction', NULL),
(357, 1, 5, 'GroceryShoppingService', 'GroceryShoppingService', NULL),
(358, 1, 5, 'HealthInformationService', 'HealthInformationService', NULL),
(359, 1, 5, 'HealthTrigger', 'HealthTrigger', NULL),
(360, 1, 5, 'HealthyActivityTrigger', 'HealthyActivityTrigger', NULL),
(361, 1, 5, 'HealthyGoalNotReachedTrigger', 'HealthyGoalNotReachedTrigger', NULL),
(362, 1, 5, 'HealthyGoalReachedTrigger', 'HealthyGoalReachedTrigger', NULL),
(363, 1, 5, 'Heater', 'Heater', NULL),
(364, 1, 5, 'HeatingService', 'HeatingService', NULL),
(365, 1, 5, 'HeatingSystemDisabledTrigger', 'HeatingSystemDisabledTrigger', NULL),
(366, 1, 5, 'HeatingSystemEnabledTrigger', 'HeatingSystemEnabledTrigger', NULL),
(367, 1, 5, 'HiFi', 'HiFi', NULL),
(368, 1, 5, 'HighSensedDeviceConsumptionTrigger', 'HighSensedDeviceConsumptionTrigger', NULL),
(369, 1, 5, 'Hub', 'Hub', NULL),
(370, 1, 5, 'Humidifier', 'Humidifier', NULL),
(371, 1, 5, 'HumidifierService', 'HumidifierService', NULL),
(372, 1, 5, 'HumiditySetToTrigger', 'HumiditySetToTrigger', NULL),
(373, 1, 5, 'ImproveConsumptionConditionAction', 'ImproveConsumptionConditionAction', NULL),
(374, 1, 5, 'ImproveDeviceConditionAction', 'ImproveDeviceConditionAction', NULL),
(375, 1, 5, 'ImproveLightingConditionAction', 'ImproveLightingConditionAction', NULL),
(376, 1, 5, 'ImproveUsabilityConditionAction', 'ImproveUsabilityConditionAction', NULL),
(377, 1, 5, 'ImprovedConsumptionConditionTrigger', 'ImprovedConsumptionConditionTrigger', NULL),
(378, 1, 5, 'ImprovedDeviceConditionTrigger', 'ImprovedDeviceConditionTrigger', NULL),
(379, 1, 5, 'ImprovedHealthyParameterTrigger', 'ImprovedHealthyParameterTrigger', NULL),
(380, 1, 5, 'ImprovedLightingConditionTrigger', 'ImprovedLightingConditionTrigger', NULL),
(381, 1, 5, 'ImprovedUsabilityConditionTrigger', 'ImprovedUsabilityConditionTrigger', NULL),
(382, 1, 5, 'IncreaseAirQualityAction', 'IncreaseAirQualityAction', NULL),
(383, 1, 5, 'IncreaseConnectivityAction', 'IncreaseConnectivityAction', NULL),
(384, 1, 5, 'IncreaseEnvironmentConditionAction', 'IncreaseEnvironmentConditionAction', NULL),
(385, 1, 5, 'IncreaseHumidityAction', 'IncreaseHumidityAction', NULL),
(386, 1, 5, 'IncreaseLightingAction', 'IncreaseLightingAction', NULL),
(387, 1, 5, 'IncreaseSecurityAction', 'IncreaseSecurityAction', NULL),
(388, 1, 5, 'IncreaseTemperatureAction', 'IncreaseTemperatureAction', NULL),
(389, 1, 5, 'IncreaseUserConnectivityAction', 'IncreaseUserConnectivityAction', NULL),
(390, 1, 5, 'IncreaseVolumeAction', 'IncreaseVolumeAction', NULL),
(391, 1, 5, 'IncreasedAirPressureTrigger', 'IncreasedAirPressureTrigger', NULL),
(392, 1, 5, 'IncreasedAirQualityTrigger', 'IncreasedAirQualityTrigger', NULL),
(393, 1, 5, 'IncreasedHealthConditionTrigger', 'IncreasedHealthConditionTrigger', NULL),
(394, 1, 5, 'IncreasedHumidityTrigger', 'IncreasedHumidityTrigger', NULL),
(395, 1, 5, 'IncreasedLightingTrigger', 'IncreasedLightingTrigger', NULL),
(396, 1, 5, 'IncreasedNoiseLevelTrigger', 'IncreasedNoiseLevelTrigger', NULL),
(397, 1, 5, 'IncreasedSecurityTrigger', 'IncreasedSecurityTrigger', NULL),
(398, 1, 5, 'IncreasedTemperatureTrigger', 'IncreasedTemperatureTrigger', NULL),
(399, 1, 5, 'IncreasedWeatherConditionTrigger', 'IncreasedWeatherConditionTrigger', NULL),
(400, 1, 5, 'InformationAction', 'InformationAction', NULL),
(401, 1, 5, 'InformationService', 'InformationService', NULL),
(402, 1, 5, 'InformationTrigger', 'InformationTrigger', NULL),
(403, 1, 5, 'InformationWebSite', 'InformationWebsite', NULL),
(404, 1, 5, 'InstantiatedAction', 'InstantiatedAction', NULL),
(405, 1, 5, 'InstantiatedDetail', 'InstantiatedDetail', NULL),
(406, 1, 5, 'InstantiatedTrigger', 'InstantiatedTrigger', NULL),
(407, 1, 5, 'InteractionService', 'InteractionService', NULL),
(408, 1, 5, 'IoTEntity', 'IoTEntity', NULL),
(409, 1, 5, 'Lamp', 'Lamp', NULL),
(410, 1, 5, 'Laptop', 'Laptop', NULL),
(411, 1, 5, 'LeakDetectionService', 'LeakDetectionService', NULL),
(412, 1, 5, 'LightingService', 'LightingService', NULL),
(413, 1, 5, 'LightingSystemDisabledTrigger', 'LightingSystemDisabledTrigger', NULL),
(414, 1, 5, 'LightingSystemEnabledTrigger', 'LightingSystemEnabledTrigger', NULL),
(415, 1, 5, 'LikeService', 'LikeService', NULL),
(416, 1, 5, 'Location', 'Location', NULL),
(417, 1, 5, 'LowPowerTrigger', 'LowPowerTrigger', NULL),
(418, 1, 5, 'MeasureAboveThresholdNotification', 'MeasureAboveThresholdNotification', NULL),
(419, 1, 5, 'MeasureAvailableNotification', 'MeasureAvailableNotification', NULL),
(420, 1, 5, 'MeasureBelowThresholdNotification', 'MeasureBelowThresholdNotification', NULL),
(421, 1, 5, 'MediaInformationService', 'MediaInformationService', NULL),
(422, 1, 5, 'MediaService', 'MediaService', NULL),
(423, 1, 5, 'MediaTool', 'MediaTool', NULL),
(424, 1, 5, 'MessageService', 'MessageService', NULL),
(425, 1, 5, 'MobileDevice', 'MobileDevice', NULL),
(426, 1, 5, 'MoveAppAction', 'MoveAppAction', NULL),
(427, 1, 5, 'MoveOnVehicleTrigger', 'MoveOnVehicleTrigger', NULL),
(428, 1, 5, 'MovingTrigger', 'MovingTrigger', NULL),
(429, 1, 5, 'MusicPlatform', 'MusicPlatform', NULL),
(430, 1, 5, 'MusicService', 'MusicService', NULL),
(431, 1, 5, 'MuteCallAction', 'MuteCallAction', NULL),
(432, 1, 5, 'NFCService', 'NFCService', NULL),
(433, 1, 5, 'NetworkService', 'NetworkService', NULL),
(434, 1, 5, 'NewCommand', 'NewCommand', NULL),
(435, 1, 5, 'NewNotification', 'NewNotification', NULL),
(436, 1, 5, 'NewsService', 'NewsService', NULL),
(437, 1, 5, 'NewsTool', 'NewsTool', NULL),
(438, 1, 5, 'NewsWebSite', 'NewsWebsite', NULL),
(439, 1, 5, 'NightModeDisabledTrigger', 'NightModeDisabledTrigger', NULL),
(440, 1, 5, 'NightModeEnabledTrigger', 'NightModeEnabledTrigger', NULL),
(441, 1, 5, 'NoiseService', 'NoiseService', NULL),
(442, 1, 5, 'NoteTool', 'Notes', NULL),
(443, 1, 5, 'Notification', 'Notification', NULL),
(444, 1, 5, 'NotificationProfileSetToTrigger', 'NotificationProfileSetToTrigger', NULL),
(445, 1, 5, 'NotificationService', 'NotificationService', NULL),
(446, 1, 5, 'NotificationTool', 'Notification', NULL),
(447, 1, 5, 'NotificationsDisabledTrigger', 'NotificationsDisabledTrigger', NULL),
(448, 1, 5, 'NotificationsEnabledTrigger', 'NotificationsEnabledTrigger', NULL),
(449, 1, 5, 'OpenCommand', 'OpenCommand', NULL),
(450, 1, 5, 'OpenNotification', 'OpenNotification', NULL),
(451, 1, 5, 'OpenWindowFrameAction', 'OpenWindowFrameAction', NULL),
(452, 1, 5, 'OrganizerTool', 'OrganizerTool', NULL),
(453, 1, 5, 'OutputService', 'OutputService', NULL),
(454, 1, 5, 'Oven', 'Oven', NULL),
(455, 1, 5, 'OvenService', 'OvenService', NULL),
(456, 1, 5, 'PC', 'PC', NULL),
(457, 1, 5, 'Phone', 'Phone', NULL),
(458, 1, 5, 'PhoneCallMutedTrigger', 'PhoneCallMutedTrigger', NULL),
(459, 1, 5, 'PhoneCallRejectedTrigger', 'PhoneCallRejectedTrigger', NULL),
(460, 1, 5, 'PhotoPlatform', 'PhotoPlatform', NULL),
(461, 1, 5, 'PhotoRecordingService', 'PhotoRecordingService', NULL),
(462, 1, 5, 'PhysicalObject', 'PhysicalObject', NULL),
(463, 1, 5, 'PlacesTrigger', 'PlacesTrigger', NULL),
(464, 1, 5, 'PositionRegistrationService', 'PositionRegistrationService', NULL),
(465, 1, 5, 'PositionRegistrationTrigger', 'PositionRegistrationTrigger', NULL),
(466, 1, 5, 'PostService', 'PostService', NULL),
(467, 1, 5, 'PostioningService', 'PositioningService', NULL),
(468, 1, 5, 'PowerService', 'PowerService', NULL),
(469, 1, 5, 'PresenceDetectedNotification', 'PresenceDetectedNotification', NULL),
(470, 1, 5, 'PresenceNoLongerDetectedNotification', 'PresenceNoLongerDetectedNotification', NULL),
(471, 1, 5, 'PrintService', 'PrintService', NULL),
(472, 1, 5, 'Printer', 'Printer', NULL),
(473, 1, 5, 'ProfileUpdateService', 'ProfileUpdateService', NULL),
(474, 1, 5, 'QuestionService', 'QuestionService', NULL),
(475, 1, 5, 'Radio', 'Radio', NULL),
(476, 1, 5, 'RainfallMeasurementAvailableTrigger', 'RainfallMeasurementAvailableTrigger', NULL),
(477, 1, 5, 'ReceiveNotification', 'ReceiveNotification', NULL),
(478, 1, 5, 'ReceivedAnswerTrigger', 'ReceivedAnswerTrigger', NULL),
(479, 1, 5, 'ReceivedAppNotificationTrigger', 'ReceivedAppNotificationTrigger', NULL),
(480, 1, 5, 'ReceivedAttachmentTrigger', 'ReceivedAttachmentTrigger', NULL),
(481, 1, 5, 'ReceivedBreakingNewsTrigger', 'ReceivedBreakingNewsTrigger', NULL),
(482, 1, 5, 'ReceivedCommentTrigger', 'ReceivedCommentTrigger', NULL),
(483, 1, 5, 'ReceivedContactNotificationTrigger', 'ReceivedContactNotificationTrigger', NULL),
(484, 1, 5, 'ReceivedDocumentInfoNotificationTrigger', 'ReceivedDocumentInfoNotificationTrigger', NULL),
(485, 1, 5, 'ReceivedFromDeviceTrigger', 'ReceivedFromDeviceTrigger', NULL),
(486, 1, 5, 'ReceivedFromDiyTrigger', 'ReceivedFromDiyTrigger', NULL),
(487, 1, 5, 'ReceivedIncomingCallTrigger', 'ReceivedIncomingCallTrigger', NULL),
(488, 1, 5, 'ReceivedLikeTrigger', 'ReceivedLikeTrigger', NULL),
(489, 1, 5, 'ReceivedMessageTrigger', 'ReceivedMessageTrigger', NULL),
(490, 1, 5, 'ReceivedMissedCallNotificationTrigger', 'ReceivedMissedCallNotificationTrigger', NULL),
(491, 1, 5, 'ReceivedNewsTrigger', 'ReceivedNewsTrigger', NULL),
(492, 1, 5, 'ReceivedNotificationTrigger', 'ReceivedNotificationTrigger', NULL),
(493, 1, 5, 'ReceivedPaymentNotificationTrigger', 'ReceivedPaymentNotificationTrigger', NULL),
(494, 1, 5, 'ReceivedPostTrigger', 'ReceivedPostTrigger', NULL),
(495, 1, 5, 'ReceivedPrivateInformationTrigger', 'ReceivedPrivateInformationTrigger', NULL),
(496, 1, 5, 'ReceivedRecommendationNotificationTrigger', 'ReceivedRecommendationNotificationTrigger', NULL),
(497, 1, 5, 'ReceivedRemindNotificationTrigger', 'ReceivedRemindNotificationTrigger', NULL),
(498, 1, 5, 'ReceivedShippingNotificationTrigger', 'ReceivedShippingNotificationTrigger', NULL),
(499, 1, 5, 'ReceivedTagTrigger', 'ReceivedTagTrigger', NULL),
(500, 1, 5, 'ReceivedTrigger', 'ReceivedTrigger', NULL),
(501, 1, 5, 'ReceivedUnlikeTrigger', 'ReceivedUnlikeTrigger', NULL),
(502, 1, 5, 'RecordCommand', 'RecordCommand', NULL),
(503, 1, 5, 'RecordNotification', 'RecordNotification', NULL),
(504, 1, 5, 'RecordingService', 'RecordingService', NULL),
(505, 1, 5, 'RejectCallAction', 'RejectCallAction', NULL),
(506, 1, 5, 'ReminderService', 'ReminderService', NULL),
(507, 1, 5, 'Room', 'Room', NULL),
(508, 1, 5, 'Rule', 'Rule', NULL),
(509, 1, 5, 'RuleAxiom', 'RuleAxiom', NULL),
(510, 1, 5, 'RuleInstantiatedAxiom', 'RuleInstantiatedAxiom', NULL),
(511, 1, 5, 'RuleNominalAxiom', 'RuleNominalAxiom', NULL),
(512, 1, 5, 'RunTrackingService', 'RunTrackingService', NULL),
(513, 1, 5, 'SMSTool', 'SMS', NULL),
(514, 1, 5, 'SaveAction', 'SaveAction', NULL),
(515, 1, 5, 'SaveCommand', 'SaveCommand', NULL),
(516, 1, 5, 'SaveContactAction', 'SaveContactAction', NULL),
(517, 1, 5, 'SaveFileAction', 'SaveFileAction', NULL),
(518, 1, 5, 'SaveHealthInformationAction', 'SaveHealthInformationAction', NULL),
(519, 1, 5, 'SaveMediaInformationAction', 'SaveMediaInformationAction', NULL),
(520, 1, 5, 'SaveNotification', 'SaveNotification', NULL),
(521, 1, 5, 'SaveWebBookmarkAction', 'SaveWebBookmarkAction', NULL),
(522, 1, 5, 'SavedTrigger', 'SavedTrigger', NULL),
(523, 1, 5, 'ScanBluetoothTrigger', 'ScanBluetoothTrigger', NULL),
(524, 1, 5, 'ScanWifiTrigger', 'ScanWifiTrigger', NULL),
(525, 1, 5, 'ScreenRotationDisabledTrigger', 'ScreenRotationDisabledTrigger', NULL),
(526, 1, 5, 'ScreenRotationEnabledTrigger', 'ScreenRotationEnabledTrigger', NULL),
(527, 1, 5, 'SecurityService', 'SecurityService', NULL),
(528, 1, 5, 'SecurityShutdownAction', 'SecurityShutdownAction', NULL),
(529, 1, 5, 'SecuritySystemDisabledTrigger', 'SecuritySystemDisabledTrigger', NULL),
(530, 1, 5, 'SecuritySystemEnabledTrigger', 'StartedListeningMusicTrigger', NULL),
(531, 1, 5, 'SendAction', 'SendAction', NULL),
(532, 1, 5, 'SendAttachmentAction', 'SendAttachmentAction', NULL),
(533, 1, 5, 'SendCallAction', 'SendCallAction', NULL),
(534, 1, 5, 'SendCommand', 'SendCommand', NULL),
(535, 1, 5, 'SendMessageAction', 'SendMessageAction', NULL),
(536, 1, 5, 'SendNotification', 'SendNotification', NULL),
(537, 1, 5, 'SendQuestionAction', 'SendQuestionAction', NULL),
(538, 1, 5, 'SendRequestAction', 'SendRequestAction', NULL),
(539, 1, 5, 'SendToDeviceAction', 'SendToDeviceAction', NULL),
(540, 1, 5, 'SendToDisplayAction', 'SendToDisplayAction', NULL),
(541, 1, 5, 'SendToDiyAction', 'SendToDiyAction', NULL),
(542, 1, 5, 'SendToPersonAction', 'SendToPersonAction', NULL),
(543, 1, 5, 'SendToPrintAction', 'SendToPrintAction', NULL),
(544, 1, 5, 'SendToSpeakerAction', 'SendToSpeakerAction', NULL),
(545, 1, 5, 'SendWebRequestAction', 'SendWebRequestAction', NULL),
(546, 1, 5, 'SensedAirPressureDecreasedTrigger', 'SensedAirPressureDecreasedTrigger', NULL),
(547, 1, 5, 'SensedAirPressureIncreasedTrigger', 'SensedAirPressureIncreasedTrigger', NULL),
(548, 1, 5, 'SensedAirQualityDecreasedTrigger', 'SensedAirQualityDecreasedTrigger', NULL),
(549, 1, 5, 'SensedAirQualityIncreasedTrigger', 'SensedAirQualityIncreasedTrigger', NULL),
(550, 1, 5, 'SensedHealthyParameterTrigger', 'SensedHealthyParameterTrigger', NULL),
(551, 1, 5, 'SensedHumididtyDecreasedTrigger', 'SensedHumididtyDecreasedTrigger', NULL),
(552, 1, 5, 'SensedHumidityIncreasedTrigger', 'SensedHumidityIncreasedTrigger', NULL),
(553, 1, 5, 'SensedLightingDecreasedTrigger', 'SensedLightingDecreasedTrigger', NULL),
(554, 1, 5, 'SensedLightingIncreasedTrigger', 'SensedLightingIncreasedTrigger', NULL),
(555, 1, 5, 'SensedNoiseLevelDecreasedTrigger', 'SensedNoiseLevelDecreasedTrigger', NULL),
(556, 1, 5, 'SensedNoiseLevelIncreasedTrigger', 'SensedNoiseLevelIncreasedTrigger', NULL),
(557, 1, 5, 'SensedRainDetectedTrigger', 'SensedRainDetectedTrigger', NULL),
(558, 1, 5, 'SensedRainNoLongerDetectedTrigger', 'SensedRainNoLongerDetectedTrigger', NULL),
(559, 1, 5, 'SensedTemperatureDecreasedTrigger', 'SensedTemperatureDecreasedTrigger', NULL),
(560, 1, 5, 'SensedTemperatureIncreasedTrigger', 'SensedTemperatureIncreasedTrigger', NULL),
(561, 1, 5, 'SensedWindDecreasedTrigger', 'SensedWindDecreasedTrigger', NULL),
(562, 1, 5, 'SensedWindIncreasedTrigger', 'SensedWindIncreasedTrigger', NULL),
(563, 1, 5, 'SensorPresenceDetectedTrigger', 'SensorPresenceDetectedTrigger', NULL),
(564, 1, 5, 'SensorPresenceNoLongerDetectedTrigger', 'SensorPresenceNoLongerDetectedTrigger', NULL),
(565, 1, 5, 'SentMessageTrigger', 'SentMessageTrigger', NULL),
(566, 1, 5, 'SentOutcomingCallTrigger', 'SentOutcomingCallTrigger', NULL),
(567, 1, 5, 'SentPrivateInformationTrigger', 'SentPrivateInformationTrigger', NULL),
(568, 1, 5, 'SentPullTrigger', 'SentPullTrigger', NULL),
(569, 1, 5, 'SentQuestionTrigger', 'SentQuestionTrigger', NULL),
(570, 1, 5, 'SentRequestTrigger', 'SentRequestTrigger', NULL),
(571, 1, 5, 'SentSharedInformationTrigger', 'SentSharedInformationTrigger', NULL),
(572, 1, 5, 'SentSubscriptionTrigger', 'SentSubscriptionTrigger', NULL),
(573, 1, 5, 'SentTrigger', 'SentTrigger', NULL),
(574, 1, 5, 'Service', 'Service', NULL),
(575, 1, 5, 'SetBrightnessAction', 'SetBrightnessAction', NULL),
(576, 1, 5, 'SetEnvironmentComfortAction', 'SetEnvironmentComfortAction', NULL),
(577, 1, 5, 'SetHumidityAction', 'SetHumidityAction', NULL),
(578, 1, 5, 'SetLightingAction', 'SetLightingAction', NULL),
(579, 1, 5, 'SetTemperatureAction', 'SetTemperatureAction', NULL),
(580, 1, 5, 'SetToCommand', 'SetToCommand', NULL),
(581, 1, 5, 'SetToNotification', 'SetToNotification', NULL),
(582, 1, 5, 'ShareAction', 'ShareAction', NULL),
(583, 1, 5, 'ShareCommand', 'ShareCommand', NULL),
(584, 1, 5, 'ShareCommentAction', 'ShareCommentAction', NULL),
(585, 1, 5, 'ShareFileAction', 'ShareFileAction', NULL),
(586, 1, 5, 'ShareLikeAction', 'ShareLikeAction', NULL),
(587, 1, 5, 'ShareNotification', 'ShareNotification', NULL),
(588, 1, 5, 'SharePostAction', 'SharePostAction', NULL),
(589, 1, 5, 'ShareProfileUpdateAction', 'ShareProfileUpdateAction', NULL),
(590, 1, 5, 'ShareTagAction', 'ShareTagAction', NULL),
(591, 1, 5, 'ShareUnlikeAction', 'ShareUnlikeAction', NULL),
(592, 1, 5, 'SharedCommentTrigger', 'SharedCommentTrigger', NULL),
(593, 1, 5, 'SharedLikeTrigger', 'SharedLikeTrigger', NULL),
(594, 1, 5, 'SharedPostTrigger', 'SharedPostTrigger', NULL),
(595, 1, 5, 'SharedProfileUpdateTrigger', 'SharedProfileUpdateTrigger', NULL),
(596, 1, 5, 'SharedTagTrigger', 'SharedTagTrigger', NULL),
(597, 1, 5, 'SharedUnlikeTrigger', 'SharedUnlikeTrigger', NULL),
(598, 1, 5, 'ShipmentTrackingTool', 'ShipmentTrackingTool', NULL),
(599, 1, 5, 'ShoppingTool', 'ShoppingTool', NULL),
(600, 1, 5, 'SleepTrackingService', 'SleepTrackingService', NULL),
(601, 1, 5, 'SmartBlind', 'Blind', NULL),
(602, 1, 5, 'SmartBracelet', 'SmartBracelet', NULL),
(603, 1, 5, 'SmartCitySystem', 'SmartCitySystem', NULL),
(604, 1, 5, 'SmartDoor', 'Door', NULL),
(605, 1, 5, 'SmartEnvironmentService', 'SmartEnvironmentService', NULL),
(606, 1, 5, 'SmartEnvironmentSystem', 'SmartEnvironmentSystem', NULL),
(607, 1, 5, 'SmartWatch', 'SmartWatch', NULL),
(608, 1, 5, 'SmartWindow', 'Window', NULL),
(609, 1, 5, 'Smartphone', 'Smartphone', NULL),
(610, 1, 5, 'SocialNetwork', 'SocialNetwork', NULL),
(611, 1, 5, 'SpeakerPhoneActivatedTrigger', 'SpeakerPhoneActivatedTrigger', NULL),
(612, 1, 5, 'Sprinkler', 'Sprinkler', NULL),
(613, 1, 5, 'StartActivityAction', 'StartActivityAction', NULL),
(614, 1, 5, 'StartAppAction', 'StartAppAction', NULL),
(615, 1, 5, 'StartBrewingCoffeeAction', 'StartBrewingCoffeeAction', NULL),
(616, 1, 5, 'StartBuyingAction', 'StartBuyingAction', NULL),
(617, 1, 5, 'StartCleaningAction', 'StartCleaningAction', NULL),
(618, 1, 5, 'StartCommand', 'StartCommand', NULL),
(619, 1, 5, 'StartCookingAction', 'StartCookingAction', NULL),
(620, 1, 5, 'StartDiswashingAction', 'StartDishwashingAction', NULL),
(621, 1, 5, 'StartDryingAction', 'StartDryingAction', NULL),
(622, 1, 5, 'StartEntertainementAction', 'StartEntertainmentAction', NULL),
(623, 1, 5, 'StartFocusingAction', 'StartFocusingAction', NULL),
(624, 1, 5, 'StartFocusingSessionAction', 'StartFocusingSessionAction', NULL),
(625, 1, 5, 'StartListeningMusicAction', 'StartListeningMusicAction', NULL),
(626, 1, 5, 'StartNotification', 'StartNotification', NULL),
(627, 1, 5, 'StartOvenCookingAction', 'StartOvenCookingAction', NULL),
(628, 1, 5, 'StartPlayingAction', 'StartPlayingAction', NULL),
(629, 1, 5, 'StartStudyingSessionAction', 'StartStudyingSessionAction', NULL),
(630, 1, 5, 'StartSuperMarketBuyingAction', 'StartSuperMarketBuyingAction', NULL),
(631, 1, 5, 'StartUsingSmartphoneAction', 'StartUsingSmartphoneAction', NULL),
(632, 1, 5, 'StartVacuumAction', 'StartVacuumAction', NULL),
(633, 1, 5, 'StartWashingAction', 'StartWashingAction', NULL),
(634, 1, 5, 'StartWashingClothesAction', 'StartWashingClothesAction', NULL),
(635, 1, 5, 'StartWatchingTvAction', 'StartWatchingTvAction', NULL),
(636, 1, 5, 'StartedActivityTrigger', 'StartedActivityTrigger', NULL),
(637, 1, 5, 'StartedAppTrigger', 'StartedAppTrigger', NULL),
(638, 1, 5, 'StartedBikeSessionTrigger', 'StartedBikeSessionTrigger', NULL),
(639, 1, 5, 'StartedBrewingCoffeeTrigger', 'StartedBrewingCoffeeTrigger', NULL),
(640, 1, 5, 'StartedCleaningTrigger', 'StartedCleaningTrigger', NULL),
(641, 1, 5, 'StartedCookingTrigger', 'StartedCookingTrigger', NULL),
(642, 1, 5, 'StartedDiswashingTrigger', 'StartedDiswashingTrigger', NULL),
(643, 1, 5, 'StartedDryingTrigger', 'StartedDryingTrigger', NULL),
(644, 1, 5, 'StartedEntertainementTrigger', 'StartedEntertainementTrigger', NULL),
(645, 1, 5, 'StartedFocusingSessionTrigger', 'StartedFocusingSessionTrigger', NULL),
(646, 1, 5, 'StartedFocusingTrigger', 'StartedFocusingTrigger', NULL),
(647, 1, 5, 'StartedInteractionTrigger', 'StartedInteractionTrigger', NULL),
(648, 1, 5, 'StartedListeningMusicTrigger', 'StartedListeningMusicTrigger', NULL),
(649, 1, 5, 'StartedOvenCookingTrigger', 'StartedOvenCookingTrigger', NULL),
(650, 1, 5, 'StartedPhysicalActivityTrigger', 'StartedPhysicalActivityTrigger', NULL),
(651, 1, 5, 'StartedPlayingTrigger', 'StartedPlayingTrigger', NULL),
(652, 1, 5, 'StartedRelaxingTrigger', 'StartedRelaxingTrigger', NULL),
(653, 1, 5, 'StartedRunSessionTrigger', 'StartedRunSessionTrigger', NULL),
(654, 1, 5, 'StartedSleepingTrigger', 'StartedSleepingTrigger', NULL),
(655, 1, 5, 'StartedStudyingSessionTrigger', 'StartedStudyingSessionTrigger', NULL),
(656, 1, 5, 'StartedUsingSmartphoneTrigger', 'StartedUsingSmartphoneTrigger', NULL),
(657, 1, 5, 'StartedVacuumTrigger', 'StartedVacuumTrigger', NULL),
(658, 1, 5, 'StartedWalkingSessionTrigger', 'StartedWalkingSessionTrigger', NULL),
(659, 1, 5, 'StartedWashingTrigger', 'StartedWashingTrigger', NULL),
(660, 1, 5, 'StartedWatchingTvTrigger', 'StartedWatchingTvTrigger', NULL),
(661, 1, 5, 'StartingWashingClothesTrigger', 'StartingWashingClothesTrigger', NULL),
(662, 1, 5, 'StopActivityAction', 'StopActivityAction', NULL),
(663, 1, 5, 'StopAppAction', 'StopAppAction', NULL),
(664, 1, 5, 'StopBrewingCoffeeAction', 'StopBrewingCoffeeAction', NULL),
(665, 1, 5, 'StopCleaningAction', 'StopCleaningAction', NULL),
(666, 1, 5, 'StopCommand', 'StopCommand', NULL),
(667, 1, 5, 'StopCookingAction', 'StopCookingAction', NULL),
(668, 1, 5, 'StopDiswashingAction', 'StopDishwashingAction', NULL),
(669, 1, 5, 'StopDryingAction', 'StopDryingAction', NULL),
(670, 1, 5, 'StopEntertainementAction', 'StopEntertainmentAction', NULL),
(671, 1, 5, 'StopFocusingAction', 'StopFocusingAction', NULL),
(672, 1, 5, 'StopFocusingSessionAction', 'StopFocusingSessionAction', NULL),
(673, 1, 5, 'StopListeningMusicAction', 'StopListeningMusicAction', NULL),
(674, 1, 5, 'StopNotification', 'StopNotification', NULL),
(675, 1, 5, 'StopOvenCookingAction', 'StopOvenCookingAction', NULL),
(676, 1, 5, 'StopPlayingAction', 'StopPlayingAction', NULL),
(677, 1, 5, 'StopStudyingSessionAction', 'StopStudyingSessionAction', NULL),
(678, 1, 5, 'StopUsingSmartphoneAction', 'StopUsingSmartphoneAction', NULL),
(679, 1, 5, 'StopVacuumAction', 'StopVacuumAction', NULL),
(680, 1, 5, 'StopWashingAction', 'StopWashingAction', NULL),
(681, 1, 5, 'StopWashingClothesAction', 'StopWashingClothesAction', NULL),
(682, 1, 5, 'StopWatchingTvAction', 'StopWatchingTvAction', NULL),
(683, 1, 5, 'StoppedActivityTrigger', 'StoppedActivityTrigger', NULL),
(684, 1, 5, 'StoppedAppTrigger', 'StoppedAppTrigger', NULL),
(685, 1, 5, 'StoppedBikeSessionTrigger', 'StoppedBikeSessionTrigger', NULL),
(686, 1, 5, 'StoppedBrewingCoffeeTrigger', 'StoppedBrewingCoffeeTrigger', NULL),
(687, 1, 5, 'StoppedCookingTrigger', 'StoppedCookingTrigger', NULL),
(688, 1, 5, 'StoppedDiswashingTrigger', 'StoppedDiswashingTrigger', NULL),
(689, 1, 5, 'StoppedDryingTrigger', 'StoppedDryingTrigger', NULL);
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(690, 1, 5, 'StoppedEntertainementTrigger', 'StoppedEntertainementTrigger', NULL),
(691, 1, 5, 'StoppedFocusingSessionTrigger', 'StoppedFocusingSessionTrigger', NULL),
(692, 1, 5, 'StoppedFocusingTrigger', 'StoppedFocusingTrigger', NULL),
(693, 1, 5, 'StoppedListeningMusicTrigger', 'StoppedListeningMusicTrigger', NULL),
(694, 1, 5, 'StoppedOvenCookingTrigger', 'StoppedOvenCookingTrigger', NULL),
(695, 1, 5, 'StoppedPhysicalActivityTrigger', 'StoppedPhysicalActivityTrigger', NULL),
(696, 1, 5, 'StoppedPlayingTrigger', 'StoppedPlayingTrigger', NULL),
(697, 1, 5, 'StoppedRelaxingTrigger', 'StoppedRelaxingTrigger', NULL),
(698, 1, 5, 'StoppedRunSessionTrigger', 'StoppedRunSessionTrigger', NULL),
(699, 1, 5, 'StoppedSleepingTrigger', 'StoppedSleepingTrigger', NULL),
(700, 1, 5, 'StoppedStudyingSessionTrigger', 'StoppedStudyingSessionTrigger', NULL),
(701, 1, 5, 'StoppedUsingSmartphoneTrigger', 'StoppedUsingSmartphoneTrigger', NULL),
(702, 1, 5, 'StoppedWalkingSessionTrigger', 'StoppedWalkingSessionTrigger', NULL),
(703, 1, 5, 'StoppedWashingClothesTrigger', 'StoppedWashingClothesTrigger', NULL),
(704, 1, 5, 'StoppedWashingTrigger', 'StoppedWashingTrigger', NULL),
(705, 1, 5, 'StoppedWatchingTvTrigger', 'StoppedWatchingTvTrigger', NULL),
(706, 1, 5, 'StoragePlatform', 'StoragePlatform', NULL),
(707, 1, 5, 'StoreAction', 'StoreAction', NULL),
(708, 1, 5, 'StoredAppTrigger', 'StoredAppTrigger', NULL),
(709, 1, 5, 'StoredBackupTrigger', 'StoredBackupTrigger', NULL),
(710, 1, 5, 'StoredContactTrigger', 'StoredContactTrigger', NULL),
(711, 1, 5, 'StoredFileTrigger', 'StoredFileTrigger', NULL),
(712, 1, 5, 'StoredHealthInformationTrigger', 'StoredHealthInformationTrigger', NULL),
(713, 1, 5, 'StoredMediaInformationTrigger', 'StoredMediaInformationTrigger', NULL),
(714, 1, 5, 'StoredTrigger', 'StoredTrigger', NULL),
(715, 1, 5, 'StoredWebBookmarkTrigger', 'StoredWebBookmarkTrigger', NULL),
(716, 1, 5, 'StudyingTrackingService', 'StudyingTrackingService', NULL),
(717, 1, 5, 'TVService', 'TVService', NULL),
(718, 1, 5, 'Tablet', 'Tablet', NULL),
(719, 1, 5, 'TagService', 'TagService', NULL),
(720, 1, 5, 'TakeAction', 'TakeAction', NULL),
(721, 1, 5, 'TakeAudioAction', 'TakeAudioAction', NULL),
(722, 1, 5, 'TakePhotoAction', 'TakePhotoAction', NULL),
(723, 1, 5, 'TakeVideoAction', 'TakeVideoAction', NULL),
(724, 1, 5, 'TakenAudioTrigger', 'TakenAudioTrigger', NULL),
(725, 1, 5, 'TakenImageTrigger', 'TakenImageTrigger', NULL),
(726, 1, 5, 'TakenTrigger', 'TakenTrigger', NULL),
(727, 1, 5, 'TakenVideoTrigger', 'TakenVideoTrigger', NULL),
(728, 1, 5, 'TapButtonActivityTrigger', 'TapButtonActivityTrigger', NULL),
(729, 1, 5, 'TemperatureSetToTrigger', 'TemperatureSetToTrigger', NULL),
(730, 1, 5, 'TemporalTrigger', 'TemporalTrigger', NULL),
(731, 1, 5, 'Thermostat', 'Thermostat', NULL),
(732, 1, 5, 'TimeManagementTool', 'TimeManagement', NULL),
(733, 1, 5, 'TimeService', 'TimeService', NULL),
(734, 1, 5, 'TimeTrigger', 'TimeTrigger', NULL),
(735, 1, 5, 'TimerService', 'TimerService', NULL),
(736, 1, 5, 'ToDoTool', 'ToDo', NULL),
(737, 1, 5, 'ToggleCommand', 'ToggleCommand', NULL),
(738, 1, 5, 'ToggleSwitchTrigger', 'ToggleSwitchTrigger', NULL),
(739, 1, 5, 'TrackingService', 'TrackingService', NULL),
(740, 1, 5, 'Trigger', 'Trigger', NULL),
(741, 1, 5, 'TurnAlarmOffAction', 'TurnAlarmOffAction', NULL),
(742, 1, 5, 'TurnDeviceOffAction', 'TurnDeviceOffAction', NULL),
(743, 1, 5, 'TurnDeviceOnAction', 'TurnDeviceOnAction', NULL),
(744, 1, 5, 'TurnOffCommand', 'TurnOffCommand', NULL),
(745, 1, 5, 'TurnOffNotification', 'TurnOffNotification', NULL),
(746, 1, 5, 'TurnOnCommand', 'TurnOnCommand', NULL),
(747, 1, 5, 'TurnOnNotification', 'TurnOnNotification', NULL),
(748, 1, 5, 'Tv', 'TV', NULL),
(749, 1, 5, 'UnhealthyActivityTrigger', 'UnhealthyActivityTrigger', NULL),
(750, 1, 5, 'UnlikeService', 'UnlikeService', NULL),
(751, 1, 5, 'UpdatedWallpaperTrigger', 'UpdatedWallpaperTrigger', NULL),
(752, 1, 5, 'UserConnectivityDecreasedTrigger', 'UserConnectivityDecreasedTrigger', NULL),
(753, 1, 5, 'UserConnectivityIncreasedTrigger', 'UserConnectivityIncreasedTrigger', NULL),
(754, 1, 5, 'UserDevice', 'UserDevice', NULL),
(755, 1, 5, 'VacuumService', 'VacuumService', NULL),
(756, 1, 5, 'VehicleTrackingService', 'VehicleTrackingService', NULL),
(757, 1, 5, 'Ventilator', 'Ventilator', NULL),
(758, 1, 5, 'VideoPlatform', 'VideoPlatform', NULL),
(759, 1, 5, 'VideoRecordingService', 'VideoRecordingService', NULL),
(760, 1, 5, 'VideoService', 'VideoService', NULL),
(761, 1, 5, 'VirtualObject', 'VirtualObject', NULL),
(762, 1, 5, 'VoiceAssistant', 'VoiceAssistant', NULL),
(763, 1, 5, 'VolumeDecreasedTrigger', 'VolumeDecreasedTrigger', NULL),
(764, 1, 5, 'VolumeIncreasedTrigger', 'VolumeIncreasedTrigger', NULL),
(765, 1, 5, 'VolumeService', 'VolumeService', NULL),
(766, 1, 5, 'WalkTrackingService', 'WalkTrackingService', NULL),
(767, 1, 5, 'WashingMachine', 'WashingMachine', NULL),
(768, 1, 5, 'WashingService', 'WashingService', NULL),
(769, 1, 5, 'WaterTemperatureSystemDisabledTrigger', 'WaterTemperatureSystemDisabledTrigger', NULL),
(770, 1, 5, 'WaterTemperatureSystemEnabledTrigger', 'WaterTemperatureSystemEnabledTrigger', NULL),
(771, 1, 5, 'WateringService', 'WateringService', NULL),
(772, 1, 5, 'WateringSystemDisabledTrigger', 'WateringSystemDisabledTrigger', NULL),
(773, 1, 5, 'WateringSystemEnabledTrigger', 'WateringSystemEnabledTrigger', NULL),
(774, 1, 5, 'WeatherService', 'WeatherService', NULL),
(775, 1, 5, 'WeatherStation', 'WeatherStation', NULL),
(776, 1, 5, 'WeatherWebSite', 'WeatherWebsite', NULL),
(777, 1, 5, 'WebBookmarkService', 'WebBookmarkService', NULL),
(778, 1, 5, 'WebBookmarkTool', 'WebBookmarkTool', NULL),
(779, 1, 5, 'WebRequestService', 'WebRequestService', NULL),
(780, 1, 5, 'WifiService', 'WifiService', NULL),
(781, 1, 5, 'WindowFrameClosedTrigger', 'WindowFrameClosedTrigger', NULL),
(782, 1, 5, 'WindowFrameOpenedTrigger', 'WindowFrameOpenedTrigger', NULL),
(783, 1, 5, 'WorseConsumptionConditionAction', 'WorseConsumptionConditionAction', NULL),
(784, 1, 5, 'WorseConsumptionConditionTrigger', 'WorseConsumptionConditionTrigger', NULL),
(785, 1, 5, 'WorseDeviceConditionAction', 'WorseDeviceConditionAction', NULL),
(786, 1, 5, 'WorseDeviceConditionTrigger', 'WorseDeviceConditionTrigger', NULL),
(787, 1, 5, 'WorseFunctionalityTrigger', 'WorseFunctionalityTrigger', NULL),
(788, 1, 5, 'WorseUsabilityConditionAction', 'WorseUsabilityConditionAction', NULL),
(789, 1, 5, 'WorseUsabilityConditionTrigger', 'WorseUsabilityConditionTrigger', NULL),
(790, 1, 5, 'WorsenedHealthyParameterTrigger', 'WorsenedHealthyParameterTrigger', NULL),
(807, 1, 7, 'AccrualPolicy', 'AccrualPolicy', 'A KEES agent MUST recognize kees:modify and kees:create individuals as valid object for dct:accrualPolicy property in a kees:Plan. In case of inconsistencies or if no dct:accrualPolicy property is specified, the agent MUST choose kees:create.\n\nIf the accrual policy is kees:create, the named graph and all related metadata MUST be deleted and recreated BEFORE to execute accrual policies.'),
(808, 1, 7, 'KnowledgeBase', 'KnowledgeBase', 'A container of linked data with a purpose, that is a related set information that can be composed to provide answer to some questions.'),
(809, 1, 7, 'KnowledgeBaseDescription', 'KnowledgeBaseDescription', 'A document describing a knowledge base configuration. A KEES Agent should be able to rebuild the whole knowlege graph just looking to the KEES configuration.'),
(810, 1, 7, 'Plan', 'Plan', 'A subclass of a prov:Plan. States a named graph accual activity plan'),
(811, 1, 7, 'Question', 'Question', 'The Question represents the reason for the the knowledge base existence. In other words, the knoledge base exists to answer to questions. Question are natural language expressions that can be expressed as parametric SPARQL queries on a populated knowledge graph. The answer to a question can be a table of data, a structured document, a boolean or a translation of these in a natural language sentences.'),
(812, 1, 8, 'Domain', 'Internet Domain', NULL),
(813, 1, 8, 'Domain-Invalid', 'Invalid Internet Domain', NULL),
(814, 1, 8, 'Domain-Valid', 'Valid Internet Domain', NULL),
(815, 1, 8, 'Format', 'File Format', NULL),
(816, 1, 8, 'FragmentURI', 'URI with Fragement Identifier', NULL),
(817, 1, 8, 'HostPort', 'Host and Port', NULL),
(818, 1, 8, 'Mimetype', 'Mimetype', NULL),
(819, 1, 8, 'Query', 'URI Query Part', NULL),
(820, 1, 8, 'QueryKey', 'URI Query Key', NULL),
(821, 1, 8, 'QueryKVP', 'URI Query Key-Value Pair', NULL),
(822, 1, 8, 'QueryValue', 'URI Query Value', NULL),
(823, 1, 8, 'Suffix', 'Filename Suffix', NULL),
(824, 1, 8, 'TopLevelDomain-CountryCode', 'Country Top-Level Domain', NULL),
(825, 1, 8, 'TopLevelDomain', 'Top-Level Domain', NULL),
(826, 1, 8, 'TopLevelDomain-Generic', 'Generic Top-Level Domain', NULL),
(827, 1, 8, 'TopLevelDomain-GenericRestricted', 'Restricted Generic Top-Level Domain', NULL),
(828, 1, 8, 'TopLevelDomain-Infrastructure', 'Infrastructure Top-Level Domain', NULL),
(829, 1, 8, 'TopLevelDomain-Sponsored', 'Sponsored Top-Level Domain', NULL),
(830, 1, 8, 'TopLevelDomain-Test', 'Test Top-Level Domain', NULL),
(831, 1, 8, 'URI', 'URI', NULL),
(832, 1, 8, 'URIScheme', 'URI Scheme', NULL),
(833, 1, 8, 'Statement', 'Statement (reified)', NULL),
(834, 1, 8, 'WhoisServer', 'Whois Server', NULL),
(835, 1, 9, 'ChannelYoutubeur', 'Youtubeur', NULL);

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
(2, 1, 835, NULL, NULL, 'Youtubeur'),
(3, 1, 154, NULL, NULL, 'Chaine'),
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(23, 2, 139, NULL, NULL, 1, NULL, 0, 0),
(24, 2, 145, NULL, NULL, 2, NULL, 0, 0),
(25, 2, 183, NULL, NULL, 3, NULL, 0, 0),
(26, 2, 163, NULL, NULL, 4, NULL, 0, 0),
(27, 2, 7, NULL, NULL, 5, NULL, 0, 0),
(28, 3, 214, NULL, NULL, 1, NULL, 0, 0),
(29, 3, 20, NULL, NULL, 2, NULL, 0, 0),
(30, 4, 123, NULL, NULL, 1, NULL, 0, 0),
(31, 4, 144, NULL, NULL, 2, NULL, 0, 0),
(32, 4, 139, NULL, NULL, 3, NULL, 0, 0),
(33, 4, 131, NULL, NULL, 4, NULL, 0, 0),
(34, 3, 281, NULL, NULL, 3, NULL, 0, 0),
(35, 3, 280, NULL, NULL, 4, NULL, 0, 0),
(36, 3, 282, NULL, NULL, 5, NULL, 0, 0),
(37, 3, 283, NULL, NULL, 6, NULL, 0, 0),
(38, 3, 284, NULL, NULL, 7, NULL, 0, 0);

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
('2ddu54m76u2kvtlveud5jeioo7', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630343735333637322e3334383937343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270673068673331766e6a633638683662666a6c333475646e736d223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343530303834393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630343536393735353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343735373237333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343735373237323b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343735363933373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223937313433343134653339316235303366316635316266653366396665383934223b733a33323a223837316136353830303363313063326139353065336235643234653733313437223b733a33323a226561303563353533373733353261646663353265393331656565333237343732223b733a33323a223862623137666138343132303235366263333536393131393466353638393439223b733a33323a223664343939643433333038316236323832616339303430313838386265323730223b733a33323a223731343163323339326533666665373539323939623237343664636662383237223b7d733a343a2268617368223b733a36353a2237313431633233393265336666653735393239396232373436646366623832372d3664343939643433333038316236323832616339303430313838386265323730223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226330656635646438313339613162666338626264383961376630666364323836223b733a33323a226136393830343931646261666134623439646132373230613264393266316332223b733a33323a223337663831343337376636656666363666306666313431343333636434666531223b733a33323a223265663462643362373363623736666163343431366666333664333363656631223b733a33323a223636636137373931663161653132636431373635613137346633633463306430223b733a33323a223164326166333361303962373838613936653861626466653831343066623863223b7d733a343a2268617368223b733a36353a2231643261663333613039623738386139366538616264666538313430666238632d3636636137373931663161653132636431373635613137346633633463306430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226233646531343239373665353330313633616238633739323364666635613131223b733a33323a226632623730323064636662303633323138306535313439353834386337653764223b733a33323a226530353133363266353737616163646234383766623136386361353637383733223b733a33323a226466356431623964343637656466613231353437653634343632633662646338223b733a33323a223338396466373130666536636434306566366164643739353362643230303938223b733a33323a223938336131643032626563356135343936326235393030373262303762633734223b733a33323a226130346630306166633638376634353030373532303931626161316334343939223b733a33323a223861353236643630623730643262653235643138356162663739366638313861223b733a33323a226331633734616361633034323431326364303566373964616265306331376130223b733a33323a223031663930313065396565363037343965616335373266313632383463636365223b733a33323a223930363361326139373333313338386138663965393266623662386665336364223b733a33323a223164656637613230393866656662313562633035363163343231636338646338223b7d733a343a2268617368223b733a36353a2231646566376132303938666566623135626330353631633432316363386463382d3930363361326139373333313338386138663965393266623662386665336364223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3731313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223736383038393935633739646162303436366261363939633839656261373739223b733a33323a223038333361623032613835633330373338633931636332666465616430343761223b733a33323a223431343864393861663533393062633163656234313739373934353763663637223b733a33323a223064346266336261323832333032613961343130653031383432303734636232223b733a33323a223633623834346366616262343532336632373162343735333835613831356639223b733a33323a223933636230343463653833373939656162663064323032643530373735333164223b733a33323a226338343239393062363763613630346162333938316664343866333238303561223b733a33323a223337306637633032303166346332383365653137653265353666636466643566223b733a33323a226637306538643334333962646332656430663936323735333835633264393330223b733a33323a223466356335393032356531633430653834656464396231666566396363343737223b7d733a343a2268617368223b733a36353a2234663563353930323565316334306538346564643962316665663963633437372d6637306538643334333962646332656430663936323735333835633264393330223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333931323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34353a7b733a33323a226535386334366334343566616435626438343139303132626263613238653132223b733a33323a223335303337383563366236323238363435353563353432356361333162323933223b733a33323a223061336439623366383366386563653033393965646565303066643733396165223b733a33323a223139343734323638306664393437613337356630366161636431663335313535223b733a33323a223363346635386133613964393036613163626261656362396662383432386661223b733a33323a226264303137383764663235653063363635653762393631666330376134633431223b733a33323a223932666233336362376536353531653635653533616164366666333861636134223b733a33323a226139326233613135666435646361343461333365343164623539613639306237223b733a33323a226637636163613964336637666535316534356262346236623064353034366330223b733a33323a223137663365373732633561343562356634373733646463326632313463396564223b733a33323a223031643565316432613331623266363638636262633937346165316238663137223b733a33323a223435326666653262316466396135323832383764393163303865333233326437223b733a33323a226635323434613931393632653233313538616463663733316363333336326538223b733a33323a223033633864646166346235653138396566336238323436333739393435643464223b733a33323a226635336330303837376630373837323364653161656566636631646363383562223b733a33323a223937383331653335393232666261383761343933356364313431393539613639223b733a33323a223464663035323065373365386338626534613761353139643935613334663937223b733a33323a226430633333386564623133373437633661316163323030623834646635313364223b733a33323a226338613665373136623637356536316638376231646461323066306266333237223b733a33323a223830356338316165663734373066346462383732313939336162613438613837223b733a33323a223031383933363230363137323730343932616431663833633962633238363033223b733a33323a223531383438356635343133393330646538373035636162353136303135623539223b733a33323a223262373334303065303031316331346561663532643637386461393536363764223b733a33323a223563396439656435323865623165303535636562663166383463613664653361223b733a33323a223463306234633537616562303837653031353938326631396365616438623236223b733a33323a226562366465616638643930656430623539303936646464613264396463643565223b733a33323a223665636361323662353735633062363533363634373161633564623830336333223b733a33323a223731653364396665343463373366656238626535643865343766623262353636223b733a33323a223532386438353939343630306236343533396665393638303563373639313831223b733a33323a223932623137613430633632316165666330656665336335386534353966393839223b733a33323a223936643765353939633032343832633037383163316439373833626333313361223b733a33323a223833626333623763323830396636333765633733653633396336633033656164223b733a33323a226665613334366330323865353239353932313664613637333463373362653839223b733a33323a223735306336623331323535336363326630386431353336376562616538663531223b733a33323a226365373866343134646465346434353965623463643365326333636634613333223b733a33323a223535663531373636326634386663343363626537646463656364633930333238223b733a33323a226164616631306564303766623265636631363531633466323339386537333335223b733a33323a223039363935366361306365376262653936663331613739636335303432373138223b733a33323a223831633031623138613137363561626636663364386635333831376131616565223b733a33323a223835653663343365333831623865663236663361636464326662396237626234223b733a33323a223263396239643262373138333634393136323162306363303433663538306662223b733a33323a223330313332396534323666373762663663636537386537636637373762346235223b733a33323a226661626333333561666566353535326238333831386261303832306237653837223b733a33323a223965376437616262303037326638613961396537333932646431653636323030223b733a33323a223331333532383533393666316361326330353437356536656165373164633134223b733a33323a223663636361613731663336623062306639366561353862366431666464623233223b733a33323a223330346339666332373530666466626536393533366263303166653133383036223b733a33323a223338653438346665653066616535616130663039663331663834336365336539223b733a33323a223364353233303630353030303835366661613334663736386239323663326565223b733a33323a223137633933646436326562333035356331383634356131393062613864366233223b733a33323a223339316233353833333335633734383161333464393837616365613566336662223b733a33323a223433326231303034623464333231343635353837353935383264343338306461223b733a33323a226463376335323138613539613830623864373033353039323362343961386139223b733a33323a223134336662306535303730323531613266633736346361343132326533663265223b733a33323a223632653337343361633038666330646564646637383439343931636561383937223b733a33323a223235376561653365393661363732343539613338633231613336393663386235223b733a33323a223761363733346439303833356436656361323462613963656239623633373736223b733a33323a223131393930633831373432373562613862633264343362323335353761303532223b733a33323a226139646636313833633366383130616132656439363330663261653835326466223b733a33323a223062613531623639663332343639626335313530616433316462616634386466223b733a33323a226134646264306632346364333830626562353935623732306463613836613936223b733a33323a226532386538376334656638353230383033393065666462613437326635333234223b733a33323a223835343931336336613638333732373537643139633564643763353963396632223b733a33323a226134393763396436616230343932313566383465306238633330626461623934223b733a33323a223530633631396133363638303863353238343636313739623730396261323931223b733a33323a226135303934343633353637306636353239643231333633626365313534343866223b733a33323a223130333138626335643162383264643234656666373532643639386461646433223b733a33323a223932353435336532653262643961386335623436386464363661363361313538223b733a33323a223765393531656365363261353437336333346335353938343130383062333633223b733a33323a223038643266383536346463393361303766646235316433633166356666343962223b733a33323a223636383361346162356630353831636265363838663264346662306239303566223b733a33323a223535393561643235353636356430643934303536623131663464323335306237223b733a33323a226434653963336637333930613866633039343139663761343261386232386633223b733a33323a226638656637313232633032346534643531363939336362383133643339333162223b733a33323a226631623962356362626435643766633930643762316165633438383031313261223b733a33323a223231363032356132343938313036343630306533326566336263353635353031223b733a33323a226461646634396531633663666331333331663930363135346361396561376631223b733a33323a223833386432633262343334303337373966303030383635383538623330626637223b733a33323a223533313438366663313463313362306137633039626438306238333030373635223b733a33323a226333643065373834366133363762396336643033306333643264393233646264223b733a33323a226266653633313735303634383663393831333136663662356136626264626263223b733a33323a226437353464333433323031666466313066663437666636656662393336633461223b733a33323a223663316538323236356665373732653134626531313735306232346563623765223b733a33323a226263333263303731386237633830666232376334373738623634646630333165223b733a33323a223764383563613434323638373232633662313537346633343531393465303933223b733a33323a226439353562316533623839316137613732653835623832633763333133353739223b733a33323a223134383236386539343432396161623134393634393763353030653732623438223b733a33323a223065643064393038653137373966646364356338643839316437313466633033223b733a33323a226537393066356663383539353239353432363231393335373336346135383833223b733a33323a223963316131343836366332643766356431386163323136333837353862323532223b7d733a343a2268617368223b733a36353a2239633161313438363663326437663564313861633231363338373538623235322d6537393066356663383539353239353432363231393335373336346135383833223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1604753673),
('8nd9vuqhjc33pj80itq0fe40k6', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630343439373036312e3239303635373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c756674336261397238746c36733467736763356d6a67683166223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343530303532313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343530303632353b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226565343966366364626437626666346431623231386566613063643966386162223b733a33323a223336383261386235636536326336653939343539663765636434323764343137223b7d733a343a2268617368223b733a36353a2233363832613862356365363263366539393435396637656364343237643431372d6565343966366364626437626666346431623231386566613063643966386162223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226538613066373238666432366461346339353133373336303932346639333938223b733a33323a223961623836646235393534376333653838373365666337646265633866313732223b7d733a343a2268617368223b733a36353a2239616238366462353935343763336538383733656663376462656338663137322d6538613066373238666432366461346339353133373336303932346639333938223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1604497061),
('99fuvddvrgm8b6c3nr3gvbr1n5', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630343331333537392e3031333233383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227275686c6266386572316f62643937706574326f373066696834223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343331363936303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226231613138386633623430363638636139316438616362333937613030323738223b733a33323a226565636638313861616263333063323164323239376437353066656562343738223b733a33323a223932653635343866373331326131643734663764396564306135623662623036223b733a33323a226636633631643837616362326130386333393161613036383532633131343337223b7d733a343a2268617368223b733a36353a2266366336316438376163623261303863333931616130363835326331313433372d3932653635343866373331326131643734663764396564306135623662623036223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b, 1604313579),
('if2qisami24fc3uujhs83ua74b', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630343331303135342e3237393231333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346e7172377176386f71646a32386b656f347136737062646836223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343331333731363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223832363961663835323736363163633936666135656264343535313533313630223b733a33323a226463313862333939666131363362656638313739303461613935663635353036223b733a33323a226338623465326133633334636165376464323564633263326135386238326231223b733a33323a226237643465663465633739623861643863616634646632326436323536626465223b7d733a343a2268617368223b733a36353a2262376434656634656337396238616438636166346466323264363235366264652d6338623465326133633334636165376464323564633263326135386238326231223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b, 1604310154);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('vh7ndq8msehcljlt7pnfma201a', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630343738313437372e3538313234353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22747469756d76687161753172336e7162306d696d6666766b6f39223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343737323838333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343738353037383b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343738333133353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343738343635353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630343738343937393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630343738333135353b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226235373863613464616234336337383635666134623765636365333733343637223b733a33323a226630623936393731323734313330323230643630373035616336393865353564223b7d733a343a2268617368223b733a36353a2266306239363937313237343133303232306436303730356163363938653535642d6235373863613464616234336337383635666134623765636365333733343637223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a393237333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3131323a7b733a33323a223261313337313833333437656235636361326361306465633663333463356561223b733a33323a223435386232613762633130323761616332393636643565386232303663323537223b733a33323a223032343961353563626234373533636638386137336561626265613534326433223b733a33323a223061383636393830366534323033396466333634666337303931636639323437223b733a33323a223531353865306666313434663162386266646438346664656663366233656532223b733a33323a226434363934373838333765333234666531653835346534633836396566356363223b733a33323a226461626462656365343864636261376262616462363331343237636364343930223b733a33323a223238666164653331336565636131323738373862643738613033343336383433223b733a33323a226239376137396531626436373537323030333966636164363163306335343965223b733a33323a226430613138616635613162613532393462643931623234646238626536393264223b733a33323a223831366461623362316666623431383232383430373261623933313237343365223b733a33323a226261363461333231303161653031626639373864396532313666303264303733223b733a33323a226261356263386537343361326432363461366263343730646435366264643039223b733a33323a223238313732316330663761333161376134323132303261666236313266623832223b733a33323a223962623637366164343662366431356266636238636537623462653961666232223b733a33323a223761333963376534396139643638383562663535373237346665313237623065223b733a33323a223464646462656337366634666536616165633031396338353236656132653763223b733a33323a223631636634323766363961623937643234613165613865643063306165306566223b733a33323a223435346636363434633066356637623236303431383964363764356333353061223b733a33323a226230376232633034336332613533313064663830633736313037333136623261223b733a33323a223066666535633332653665633530303930343936643735626239636537643132223b733a33323a223766316164386463333262383361396366663831353331373237366630363538223b733a33323a223638643035343961373837386132666530343462386166613130643437333730223b733a33323a223736623532303036643133313736383538623765656166343965653133613335223b733a33323a223666386562316561306531393163663532663537386233383663643737373835223b733a33323a223033366366633239373534643430386230386432396562383861666330636662223b733a33323a226136643264643265323634396130386363613964316337313863393034653766223b733a33323a223862303537613135373837363461646439383535666434623739393231653261223b733a33323a223437633232363064343061323165323266326564303638643838333662623435223b733a33323a223130313664396435396135663163326666383837353937353338336663303132223b733a33323a226364383066326433333236363661366435613164373561303266626135626162223b733a33323a226338626661653766383536316265376534633462623963313732613063343832223b733a33323a223362653862326561396563336263313330656262363130393866666331623537223b733a33323a223138646338306330383532646137353064656465303563386237306236666266223b733a33323a223962333563653066666334353863653432303237316237623361373935373237223b733a33323a223163373131366664316161376637353133313234623934343839313936306666223b733a33323a226362383963363239373566323036366564313232363334633832373163636461223b733a33323a223637346461643933613838366362366332653435386539333362396539616234223b733a33323a226563316662346438383366626233363839636461303239326464366530346534223b733a33323a223833653566346266353265366530653433396561613762363631653461653134223b733a33323a223463653163663934653664653633623938623561626361333530383263333731223b733a33323a223766326438326462643937396331316531373437653736326530356131303365223b733a33323a223430636433306233343361656232373030353465643033343035396238336439223b733a33323a226665343938356533663162316438643835303665353661316530383539313435223b733a33323a226537616438656139336663346637353033366333653465333632343963636433223b733a33323a226433383663653966353131643135623161356133393435653632613562353832223b733a33323a226339396430353261623561303739653731353534633361646239323962306363223b733a33323a223631326262326266326561363238633362623766656437616635373633396139223b733a33323a223264323837636363313766303430323638333238343939646533393630323332223b733a33323a226537396232343939303637663537346633383135626435303435653334653765223b733a33323a226631386666643831303234613931643939343662323532653636633361613732223b733a33323a223563643062363465646234353866653436623266383666333864353061326333223b733a33323a223465626663323735376337383165376331363031376336616463643061333465223b733a33323a223339373262373638396561653963323864623463333031323032366163623136223b733a33323a223834333234353631343035373863353762636666393236663763623636646530223b733a33323a226332383532643935356534373530346237376462323238373634626664663636223b733a33323a226565346337373139646364303037623064376131303163303961616563316666223b733a33323a226366653836396266343036636634336261643962613233326135313766623063223b733a33323a223965363632633332313961393637326564373363376338643137363132333036223b733a33323a223834353434373637363133303334366663336535653964646461373337353265223b733a33323a226135346539306333666539376136656261366365393565366130653433346332223b733a33323a223637363131376334343032646137643130373731363631636336346464663533223b733a33323a223337313437656166353164396236643930613361316534643930306632396431223b733a33323a226334613964303539633031616666333432613066646232616130353939643465223b733a33323a223433316232633165356433663661613833373333623138636162313832613664223b733a33323a226365643031303236306231366437643066316461393735623139626364393262223b733a33323a223639626261343036323562373235356366636438323764333036313439393763223b733a33323a226137393563373635363636376561353164323266626135666264343634383430223b733a33323a223831663933336433633931663338306665613839393439373432333232366165223b733a33323a223161313431656166303932626637356633323764666331366436643066313634223b733a33323a226561613662376334613761643366356664306234333633336535343132643835223b733a33323a223238316634626165333065306633313338626664346262666238393333393738223b733a33323a226361393930356439376232633563306563336535633038323532636166336230223b733a33323a223365623833333461363334633536363264613532653633333235656539666634223b733a33323a223664643664653332646430613665393139623338366664323833653030386139223b733a33323a223530343833343963633231656133306566336233663662353135353761303462223b733a33323a226665313430626164363030386534616538633337633130653564663531646563223b733a33323a223635373761363532613434306236366364613833303162616538396132396438223b733a33323a226639316134323538316539616336373062656535636533646565636332323730223b733a33323a226430323262373531383265393338386533306431353531326562383531343261223b733a33323a223265393030363633326630616635303639626334353238633364343761626433223b733a33323a223561313466666163326431626535383462346536306235323930656165613037223b733a33323a223564323961326465613261336334623765326163373733383530363065613938223b733a33323a223264373038653738616566653833333463303835326338663532346239623865223b733a33323a223366653761323037316331363965373036366332343832326666356539316130223b733a33323a226232353064376538323664396537663931373133346632643636343933393965223b733a33323a223836376133373430386133363464653339323431626162376438633138376330223b733a33323a223165323030313862643161373234663438373535353639626664666134376335223b733a33323a223837346466636661366538393938643339376335336661376534663438306566223b733a33323a226230373066353562323862393862373563323937373735643161383366346466223b733a33323a226639356164316338633461633835303031393732656138386533383932613966223b733a33323a226362613030326137626237373535626631646536633432333739383934346163223b733a33323a226434653231316431643132613832663830313461626261626432313432333530223b733a33323a226261633837306666366162623366316535633532653434653431656662386639223b733a33323a226366356164363361353466323638346465633837343435313934303961653761223b733a33323a223261316566313639306630333536626336343038383732316636323965626165223b733a33323a223864333732646535636465323439326230393933333130616233336136613132223b733a33323a226431383831386630363062363939306335373831623366656366323534663363223b733a33323a226232613332386136303636666663653566393731646261636635623133386232223b733a33323a223864323662356531373961376137356163623963363630373939613132613363223b733a33323a226463376638643733643663326264353365373135333634393563623966373131223b733a33323a223734656562326537386238666166343264333531303137656435376132323862223b733a33323a226535666330323436646363373935376437313937306166343366356463373963223b733a33323a223464356532336437633030633166303964343338306462333430636530626132223b733a33323a226361666436303430643764366263383266353534363136656234313933616235223b733a33323a223861343530313036646432373439366338386661313438353766336631616531223b733a33323a226564396364343763643434616465306161303336663766613037666461613437223b733a33323a223433306536653531636337303161633936393766633530653965616230653034223b733a33323a226335623362616134393035666266646439643137343231653836626666363661223b733a33323a223662316365373834346135666230646231663836386234363835613134636639223b733a33323a223433356631346561396661336634346431636637623561386335373436396266223b733a33323a226436653035343534613930303033396464613437633533323633306361623136223b733a33323a223234393966396264363235393230663531383234386235343963343462646665223b733a33323a223132386361343962343435653538326662313963366533663062353336303834223b733a33323a223964623462383732313764666462656130333464323165373064376137313532223b733a33323a226538613364613536336136326439383639616665346633613534323532306537223b733a33323a223632343937653530393365323331323863303263396439363065366135323831223b733a33323a223337613837306438663136363830323233656464643762653133636135653331223b733a33323a226265663164363338666532346266366363326265643866353762323631323263223b733a33323a226530643661313133663434623831663737373338313163613839376461336238223b733a33323a223334636565326434653238333735363036356662306633666233343433626233223b733a33323a226237343434663231333165633662646335306533383638636365643565383362223b733a33323a226331336133643562316539643262616163333030333430323063383664363435223b733a33323a226336316161336330636432626264356564303333356363666133303263353330223b733a33323a226433663361376664323930666337656263313634323961303636626630393333223b733a33323a223039336231396437626464643236663464336639303465613936616164363562223b733a33323a226238323439633537316239373963353365626531656336313132316330653966223b733a33323a223333393361373633363839383466646637656634356465343135643064363866223b733a33323a223531636437383363333032363534323139616237393232306461326164393462223b733a33323a223736356234663164313431323035326531316136383564356339303462356630223b733a33323a226435363636343839393036616239343864336262306564353135326339666439223b733a33323a223233396337323939306366316266396632643363336132366135306130336261223b733a33323a223834626337666464366638346266613965613262646663363165333838653164223b733a33323a223132613130386264343330343334663835643435363934316433373336663233223b733a33323a226639353938303764323161343136613430663231323638323631346233323536223b733a33323a226465616638393430393866363136333264316361363261643764363039396566223b733a33323a223765393635346561386562626634643939636534323731336232653466363339223b733a33323a223231343437376565336562323166393065366630646635633435626239633134223b733a33323a226662666532383961613030326233373135393334623666343139643130346233223b733a33323a226335333030326262643835386362623966393933353331383534373537373037223b733a33323a223465633830373166356466386133343462366531313835353464346232323235223b733a33323a223865393263303262353235396561393363333961326665646361316264643465223b733a33323a223735663335343766343730396230373231623430646436643762336365376163223b733a33323a226433333132643433393465326333316131653139656634653735363930646534223b733a33323a226239633937363738323137376264303666316338313933616164386666373137223b733a33323a226261313931376235363130396466623731323965666439353834656166666636223b733a33323a226132373630336366633134386264353538313133336236396138376361363466223b733a33323a226439636539613630656664303238386464326661373932663464363763643364223b733a33323a226138353630383935323636366662636137613562613339373331663738313161223b733a33323a223135626431353763656566633262313133623739346134376630363966663234223b733a33323a226135366432306664396238313230643666643833346536356238346437316666223b733a33323a226130323735626664326464633662616335626131653235323633613938323062223b733a33323a223631373761663732613933343231656234316138353338393434363430353261223b733a33323a226365363038393839336535376432376339316164376165303733643837363265223b733a33323a223033343963616337376535373162613437373963636234316463626531383132223b733a33323a226666336131386633356335326332613730613738326361626163393764326464223b733a33323a223864666266613865613165363463633864326137633036313636376238383465223b733a33323a226162353431326631636130306139613334356438653364616438386638663831223b733a33323a223563383938383463643862626666383230663363666336356162363166393734223b733a33323a223930363366376632646230313839656463346661636665383261316530623936223b733a33323a226630393862356361656636336432646234663565656235626637313533343237223b733a33323a223962356564613031353062663432383533636664623437396661363638363362223b733a33323a226265303231393734333461383930646463333530343636383939626266356265223b733a33323a226366646339346538633766666339636639326134653866646562646432333335223b733a33323a226261636531663139313635326261633065613364646162313563326638383037223b733a33323a223761396238646234643835393137383665393264353766623966363736336134223b733a33323a223866346464636233316133333337316235316235333665616332666433646330223b733a33323a223233626266373566353762663361396530643631373936383138376539383163223b733a33323a223933653737383336613137666438323733333232356363366234373237393835223b733a33323a226238313862363165623863633163303437363337663366353637653434363566223b733a33323a226566376666666561303865356238363066303038393532633531333166356233223b733a33323a226231643062613936306466636363343965396565363763366335343766663832223b733a33323a226339393737613765356638626566343738313066366532323034666330323838223b733a33323a223537643733316430346637643762363461393363373465303764666466313261223b733a33323a223065303866646533333465323038343035333536396334613839326634373361223b733a33323a223630616136373964313364303465396161653230316233383130623936643235223b733a33323a223530393038616338633639653263326232313961626333383837376665306466223b733a33323a223637376566393133633465363363663565303564616538356531326664323831223b733a33323a223363626338613531343530363535376630653662373063363361356636643631223b733a33323a223639313533313437666230356266396631323931313439633061396635663965223b733a33323a226166326337663937373432376136356564316537633362616432626539386661223b733a33323a223130363038353463623734623862383364643737356565373438333930376230223b733a33323a223331396539386162373566346435363133383233383266386266376634393265223b733a33323a223966643261643432346437633961316436343439326430333937616564646665223b733a33323a223235376537333266653133653730363038643966356366643034336437623465223b733a33323a223735323230653361383537323537366130386163623733343137323562383065223b733a33323a226461353632386239613730306336313838323733353639356462393332326266223b733a33323a223364363338346231353137353631643535666564373536373164333737633831223b733a33323a223066346234396537633034376263663663346330633064306563393035656433223b733a33323a226337343365626332363938666133633061643964623139333137386561393932223b733a33323a223433656238346536316161356566643330373638626133343562343562373562223b733a33323a223739383533383030393564316664366362343134326234386262343230336135223b733a33323a226231623439633335313833393138323734613131323633343939613932643535223b733a33323a226436613231343163353732323933343631366362633862383431313839343835223b733a33323a226535626131343561363262653533326536666235313966323833373362353732223b733a33323a223331393064353831353636303132626264323063303338363938393761633930223b733a33323a223664363637623266366664663937386235613035623264633261333330333965223b733a33323a223636633735303539306261613535343431663366326236313538306334623565223b733a33323a223464393537336430353964613861393732396366323531363634366464386332223b733a33323a223562633138643366393863663233316632346237613866353534336335613432223b733a33323a223635333266643463303239303466393463323834636662346437323532323266223b733a33323a226233316431376430316432643831356430383639663262346164366230383232223b733a33323a223665306163333038663535343164646439626263626363646565666332353637223b733a33323a223665656636353034323463306139376261303963666365666132326564623836223b733a33323a226235623262393635366262356233373837383732666635316430653938303866223b733a33323a223262343830636534643263336231346634623864666535396638303333303566223b733a33323a226565396166653936663066303731313331346666343861613433303434326433223b733a33323a226565353461643563653737646366363166613934323462356530326137663432223b733a33323a223762393037666361626463623033663137393862333033323437616433333561223b733a33323a223661363034663936323938353132333330663262306166333165303031313064223b733a33323a223961336235316262333565376332643061396630373430636639653535663439223b733a33323a226536333433663935653531346237633162323461653464643239346430373733223b733a33323a223962663861383936633436396238656263646332636566343334373763393039223b733a33323a223132646532393462313866613436613563323735623135353336393831343262223b733a33323a223635353935386539393535303766326230653162386238646334643661646534223b733a33323a226130326332373764626236306136373662303334383366316436636661376461223b733a33323a226530306630376132373939333238656235316565393964313932623861363261223b733a33323a223266363130333833383030656431656464326431353235346536353636636433223b733a33323a223166643533376364643538386363326435663033346265303834363230383462223b733a33323a223066623131613762343337386564383566363731636266626232346436306262223b733a33323a223162333664343137613136613438616461316230333565663466653263633563223b733a33323a223563333664366563396561376334333762353666613665336431363837616439223b733a33323a223236646639303633353633353362343332646431636466383733363061363639223b733a33323a226432626461303338396331366234333531643439636161623434663262333730223b7d733a343a2268617368223b733a36353a2264326264613033383963313662343335316434396361616234346632623337302d3236646639303633353633353362343332646431636466383733363061363639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223065303136363530303163366534613963393962306132333161393239633562223b733a33323a223139373235666135373465393239616166616366343633353438633461343864223b733a33323a226232633735666264356635333238323436303465383339616335633764346137223b733a33323a223738386264653435383534366139363237333430303338653735363166626563223b733a33323a226432386535616663356438343431666562323230346464316239613964363239223b733a33323a226166383830313437653536616664373331643961633764623635366166306361223b7d733a343a2268617368223b733a36353a2261663838303134376535366166643733316439616337646236353661663063612d6432386535616663356438343431666562323230346464316239613964363239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223331393936623534636162626239363435356238633137613134316561366438223b733a33323a226435373965353065626137396163343966363335636438373538353462343636223b733a33323a223139396237623035366462343863613563343062323564393332616664653861223b733a33323a223339396364333161613263316132306264363130666538363535633338396661223b7d733a343a2268617368223b733a36353a2233393963643331616132633161323062643631306665383635356333383966612d3139396237623035366462343863613563343062323564393332616664653861223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333237323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33373a7b733a33323a223665363665313962393766346436356661323432646331643765373633333064223b733a33323a226237653466646637376435356563633037343932396665646233636538303838223b733a33323a223736626564613034623232366437616330636239323733636462313333386233223b733a33323a226166623830613239346639363163346266353832643032336133633762326466223b733a33323a223266306333653832633164613862363135663532353732663564626335643064223b733a33323a223166323232363262626364623336346337333333386130313539343965393036223b733a33323a226234336139666630653466333235316230353131363333336636303434626136223b733a33323a223462653763646135633737366262623161383637313262383938323263356233223b733a33323a226538346437636166393863356539643737316531633633373264376630306133223b733a33323a223366636330396562346234613834646438303261663931656365323462316235223b733a33323a226432303639356439326633626466346239333362616435646562663734626537223b733a33323a226331623233356334343031393933623161636662653233303266323038623034223b733a33323a223933306531356162313035393737306132653962313232303934343433656165223b733a33323a223937393962666265303235666539306633633333626337643535626265663663223b733a33323a223666396266626633623665636165366434383839386431663462376333646439223b733a33323a223336396566366239393366653962346438303538613333303763333835323531223b733a33323a223339336639303164653762666665636631656336633365346133663638346132223b733a33323a223438306564383639656464303534303762386162376636376366326631353133223b733a33323a223835653939316234376230343366626165393632626436646333656635663865223b733a33323a223330333266663232636433653266343533363037666663653766396366346465223b733a33323a223966636662623735343632663237323836316666303835363837366631316362223b733a33323a223061383336323064336538383565336235653930353265623834313532356662223b733a33323a226562323032313739303635643164313436393335356235386565363232666236223b733a33323a223165336535303131653936663235363533643837366561643966636232656238223b733a33323a223331373961646565336231313933386462383532306564623966636336383266223b733a33323a223530626261393633326366346566353130313132346265653863646631353664223b733a33323a226463336164383838626366353137333165353666303330633931303731346239223b733a33323a223931643133343166613861656330326537656534666632396166356230363833223b733a33323a223838356639376437633564373234323663313462306338616561613331303031223b733a33323a223838636264633062633038373861666130666133663132653637366432623330223b733a33323a223765653831396332336633616366346539356236396332353362353134643634223b733a33323a223361663066366362626664346330316363613930356632386464383066646532223b733a33323a223666666334383331343163313630653238343663393635633331353863663138223b733a33323a223539383732643162623764303731376434633239336337623431343831383032223b733a33323a226134346239613933306364633630306261396162333738323532326266393235223b733a33323a223932616161366637383133356564356430626636366637663138333462656336223b733a33323a226363383036323661366665396533316363353934643031633831663835633634223b733a33323a226439626534373635636133646333623333656338633430356237626564363632223b733a33323a223062383035383432626234326639366262626532336237353862613536396561223b733a33323a223738386363346337306238633264353661653565373664363930636135356631223b733a33323a223535633034313431393464383732663038313166396634616336346561663166223b733a33323a223461396337343232663263643433623361366161346536323164373362616465223b733a33323a226335373537316461313136623730663966303230643739333666303235343736223b733a33323a226333393064623739663739643532393766626438373761663666323932633838223b733a33323a223164653834663636323737356537313035353066613064346462636132393931223b733a33323a226263613161656639366239306538633333646137613736383737313138653539223b733a33323a223336333166643562626335633936633336393336633762643162386165353862223b733a33323a223031366265343663386364363934366137383035656335393631323831386164223b733a33323a226130383234353438643532323933316537383961623133653062303366333337223b733a33323a223936323661346666643466663337323766633865636534363638383562613935223b733a33323a223662616536666461343130656665343563333163396135653536333131373165223b733a33323a223236616338396164373433333461613738623733343964643938356134386466223b733a33323a223766343263333935623834613564386362613736383639643330646433303136223b733a33323a223663666537376536393035643934366464386131353363366364303263363435223b733a33323a223136363366393863383032313431376463383566343964643131313165326361223b733a33323a223634623466383334306637653738653966346665376433383432616436303163223b733a33323a223034363266373235393933383162633831633961396531336437613261326631223b733a33323a223431383866366264313463386361666639626134376263643464396565373164223b733a33323a226262303435303262333237666265346138303137356630653835656364643836223b733a33323a226437306565363337323834376562383164636266346632326564333033323734223b733a33323a223934323035663366376261386238633261323732396236633738393638646163223b733a33323a226638663335616137306135383339646137336563303335333831396163376162223b733a33323a223532336531303437303064356539386230343038346265323061636665316535223b733a33323a223730656630646430373636343936376366643232616539326134306230643765223b733a33323a223338363762373932636263326666626430316230613561656465326539633464223b733a33323a223235386164343633626539366331366261653761383962343738346365353033223b733a33323a223163373765626437343237633838376461643935303034366262653034653836223b733a33323a223337356135366139633937383833613233666162363038626261386634376236223b733a33323a223136376632343565373130363363663934333039396130643861353331363462223b733a33323a223732306432653432346230343039333539373764323465343134363064353036223b733a33323a223937303230653463336433656665656133383762306330663463343737373330223b733a33323a226632313332316232323665376330333336396662393333633764623537626437223b733a33323a223730663336313233646362303262643062316465323036323238383666323164223b733a33323a226334643736376238383265323465373764346165653738373036336535626661223b7d733a343a2268617368223b733a36353a2263346437363762383832653234653737643461656537383730363365356266612d3730663336313233646362303262643062316465323036323238383666323164223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226635343666316461643439656465623661613930363135663666303062646536223b733a33323a223739383834383933663035663261306134366162323533396338623362646635223b733a33323a226435393864376537336536653935353336333761323366383233356165303132223b733a33323a226334346533306239363637346364633934316438653233303033666130623634223b733a33323a226361353463626332663932383762613461313033623561343961363835383639223b733a33323a223862366263626666343737613236643330613837303639366265646434653834223b7d733a343a2268617368223b733a36353a2238623662636266663437376132366433306138373036393662656464346538342d6361353463626332663932383762613461313033623561343961363835383639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1604781478);

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
('administrator_email', '\"elkadikamal2@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Omeka\"'),
('locale', '\"fr\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
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
(1, 'elkadikamal2@gmail.com', 'Kamal EL KADI', '2020-11-02 09:41:41', '2020-11-02 09:41:41', '$2y$10$89p3ZBezPGJucoAgtGSTDuho1K4Z8hzSuonFpWJJwy6/8.rfFnhza', 'global_admin', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(1, 1, 139, NULL, 'literal', '', 'Lucas', NULL, 1),
(2, 1, 145, NULL, 'literal', '', 'Hauchard', NULL, 1),
(3, 1, 183, NULL, 'literal', '', '24', NULL, 1),
(4, 1, 163, NULL, 'literal', '', 'Doublage, chanson', NULL, 1),
(5, 1, 7, NULL, 'literal', '', '2011', NULL, 1),
(6, 2, 214, NULL, 'literal', '', 'gaming', NULL, 1),
(7, 2, 20, NULL, 'literal', '', '2014', NULL, 1),
(8, 2, 281, NULL, 'literal', '', 'SQUEEZIE', NULL, 1),
(9, 2, 280, NULL, 'literal', '', '15 200 000', NULL, 1),
(10, 2, 282, NULL, 'literal', '', '1 374', NULL, 1),
(11, 2, 283, NULL, 'literal', '', '7 504 792 671', NULL, 1),
(12, 1, 1, NULL, 'literal', '', 'Lucas', NULL, 0),
(13, 2, 284, 1, 'resource', NULL, NULL, NULL, 1),
(14, 2, 1, NULL, 'literal', '', 'SQUEEZIE', NULL, 0),
(15, 3, 139, NULL, 'literal', '', 'Cyprien ', NULL, 1),
(16, 3, 145, NULL, 'literal', '', 'Iov', NULL, 1),
(17, 3, 183, NULL, 'literal', '', '31', NULL, 1),
(18, 3, 163, NULL, 'literal', '', 'Blogueur, acteur, scénariste de films et de bande dessinée', NULL, 1),
(19, 3, 7, NULL, 'literal', '', '2013 ', NULL, 1),
(20, 3, 1, NULL, 'literal', '', 'Cyprien ', NULL, 0),
(21, 4, 139, NULL, 'literal', '', 'Norman ', NULL, 1),
(22, 4, 145, NULL, 'literal', '', 'Thavaud', NULL, 1),
(23, 4, 183, NULL, 'literal', '', '33', NULL, 1),
(24, 4, 163, NULL, 'literal', '', 'Acteur, doubleur, humoriste', NULL, 1),
(25, 4, 7, NULL, 'literal', '', '2010', NULL, 1),
(26, 4, 1, NULL, 'literal', '', 'Norman', NULL, 0),
(27, 5, 139, NULL, 'literal', '', 'Gandhi ', NULL, 1),
(28, 5, 145, NULL, 'literal', '', 'Djuna', NULL, 1),
(29, 5, 183, NULL, 'literal', '', '34', NULL, 1),
(30, 5, 7, NULL, 'literal', '', '2002', NULL, 1),
(31, 5, 1, NULL, 'literal', '', 'Gandhi ', NULL, 0),
(32, 6, 139, NULL, 'literal', '', 'Rémi ', NULL, 1),
(33, 6, 145, NULL, 'literal', '', 'GAILLARD', NULL, 1),
(34, 6, 183, NULL, 'literal', '', '45', NULL, 1),
(35, 6, 7, NULL, 'literal', '', '1998', NULL, 1),
(36, 6, 1, NULL, 'literal', '', 'Rémi', NULL, 0),
(37, 7, 139, NULL, 'literal', '', 'Johan ', NULL, 1),
(38, 7, 145, NULL, 'literal', '', 'Lelièvre', NULL, 1),
(39, 7, 183, NULL, 'literal', '', '28', NULL, 1),
(40, 7, 7, NULL, 'literal', '', '2010', NULL, 1),
(41, 7, 1, NULL, 'literal', '', 'Johan ', NULL, 0),
(42, 8, 214, NULL, 'literal', '', 'Comédie', NULL, 1),
(43, 8, 20, NULL, 'literal', '', '2007', NULL, 1),
(44, 8, 281, NULL, 'literal', '', 'Cyprien', NULL, 1),
(45, 8, 280, NULL, 'literal', '', '13 600 000', NULL, 1),
(46, 8, 282, NULL, 'literal', '', '171', NULL, 1),
(47, 8, 283, NULL, 'literal', '', '2 511 769 594', NULL, 1),
(48, 8, 284, 3, 'resource', NULL, NULL, NULL, 1),
(49, 8, 1, NULL, 'literal', '', 'Cyprien', NULL, 0),
(50, 9, 214, NULL, 'literal', '', 'Court-métrages, Musique, Défis, Sketches', NULL, 1),
(51, 9, 20, NULL, 'literal', '', '2010', NULL, 1),
(52, 9, 281, NULL, 'literal', '', 'NORMAN FAIT DES VIDÉOS', NULL, 1),
(53, 9, 280, NULL, 'literal', '', '12 200 000', NULL, 1),
(54, 9, 282, NULL, 'literal', '', '181\n', NULL, 1),
(55, 9, 283, NULL, 'literal', '', '2 426 070 743', NULL, 1),
(56, 9, 284, 4, 'resource', NULL, NULL, NULL, 1),
(57, 9, 1, NULL, 'literal', '', 'NORMAN FAIT DES VIDÉOS', NULL, 0),
(58, 10, 214, NULL, 'literal', '', 'Music', NULL, 1),
(59, 10, 20, NULL, 'literal', '', '2017', NULL, 1),
(60, 10, 281, NULL, 'literal', '', 'GIMS', NULL, 1),
(61, 10, 280, NULL, 'literal', '', '9 200 000', NULL, 1),
(62, 10, 282, NULL, 'literal', '', '79', NULL, 1),
(63, 10, 283, NULL, 'literal', '', '1 378 390 896', NULL, 1),
(64, 10, 284, 5, 'resource', NULL, NULL, NULL, 1),
(65, 10, 1, NULL, 'literal', '', 'GIMS ', NULL, 0),
(66, 11, 214, NULL, 'literal', '', 'Comédie', NULL, 1),
(67, 11, 20, NULL, 'literal', '', '2007', NULL, 1),
(68, 11, 281, NULL, 'literal', '', 'Rémi GAILLARD', NULL, 1),
(69, 11, 280, NULL, 'literal', '', '7 007 000', NULL, 1),
(70, 11, 282, NULL, 'literal', '', '143', NULL, 1),
(71, 11, 283, NULL, 'literal', '', '1 808 129 299', NULL, 1),
(72, 11, 284, 6, 'resource', NULL, NULL, NULL, 1),
(73, 11, 1, NULL, 'literal', '', 'Rémi GAILLARD', NULL, 0),
(74, 12, 214, NULL, 'literal', '', 'Technologie', NULL, 1),
(75, 12, 20, NULL, 'literal', '', '2009', NULL, 1),
(76, 12, 281, NULL, 'literal', '', 'Jojol', NULL, 1),
(77, 12, 280, NULL, 'literal', '', '2 800 000', NULL, 1),
(78, 12, 282, NULL, 'literal', '', '1 415', NULL, 1),
(79, 12, 283, NULL, 'literal', '', '380 419 221', NULL, 1),
(80, 12, 284, 7, 'resource', NULL, NULL, NULL, 1),
(81, 12, 1, NULL, 'literal', '', 'Jojol', NULL, 0),
(82, 13, 123, NULL, 'literal', '', 'elkadikama2@gmail.com', NULL, 1),
(83, 13, 144, NULL, 'literal', '', 'EL KADI', NULL, 1),
(84, 13, 139, NULL, 'literal', '', 'Kamal', NULL, 1),
(85, 13, 131, NULL, 'literal', '', 'elkadi96', NULL, 1),
(86, 13, 1, NULL, 'literal', '', 'Kamal', NULL, 0),
(87, 14, 123, NULL, 'literal', '', 'mel.correia.92@gmail.com', NULL, 1),
(88, 14, 144, NULL, 'literal', '', '\nDe jesus correia', NULL, 1),
(89, 14, 139, NULL, 'literal', '', 'Mélanie', NULL, 1),
(90, 14, 131, NULL, 'literal', '', 'melanie92', NULL, 1),
(91, 14, 1, NULL, 'literal', '', 'Mélanie', NULL, 0),
(92, 15, 123, NULL, 'literal', '', 'brinis.halim@outlook.fr', NULL, 1),
(93, 15, 144, NULL, 'literal', '', 'Brinis', NULL, 1),
(94, 15, 139, NULL, 'literal', '', 'Halim', NULL, 1),
(95, 15, 131, NULL, 'literal', '', 'XT19', NULL, 1),
(96, 15, 1, NULL, 'literal', '', 'Halim', NULL, 0),
(97, 16, 123, NULL, 'literal', '', 'ibrahim.merizak@yahoo.com', NULL, 1),
(98, 16, 144, NULL, 'literal', '', 'Merizak', NULL, 1),
(99, 16, 139, NULL, 'literal', '', 'Ibrahim', NULL, 1),
(100, 16, 131, NULL, 'literal', '', 'MerizIbra', NULL, 1),
(101, 16, 1, NULL, 'literal', '', 'Ibrahim', NULL, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'http://elite.polito.it/ontologies', 'elite', 'e-Lite', ''),
(7, 1, 'http://linkeddata.center/kees/v1', 'kees', 'kees', ''),
(8, 1, 'http://uri4uri.net/vocab', 'uri4uri', 'uri4uri', ''),
(9, 1, 'http://elite.polito.it/ontologies/eupont.owl#Channel', 'you', 'Channel', '');

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
