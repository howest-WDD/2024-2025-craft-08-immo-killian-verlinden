-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ujkorffjdfwlftlsdeykbrdljpkjadecxqic` (`primaryOwnerId`),
  CONSTRAINT `fk_ujkorffjdfwlftlsdeykbrdljpkjadecxqic` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yfyfxygtcujlfawvxsodzwdtnmebhfglnzrs` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sfwowpkhupgrklfkbvlrjkicciwhqekqeuiv` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_thpcxhvsqfpaopjrzaadjxkbbsyikuxervoo` (`dateRead`),
  KEY `fk_zkcnbzgljdttaufcfwmfyxwyrzkfctmyarve` (`pluginId`),
  CONSTRAINT `fk_xcncvzsxdmkctfsmbdtdvpjkrwovbqkkawqv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zkcnbzgljdttaufcfwmfyxwyrzkfctmyarve` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vginhvyzhgzjjyutrtlqbwqtfajihnfatbzk` (`sessionId`,`volumeId`),
  KEY `idx_aswncoyuquhncohrbcjcqgipcfpuaavkvcsq` (`volumeId`),
  CONSTRAINT `fk_qtnhutdwstrjxtkqwfmrvwrkoylxpakufkoe` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydevgeskhwavgnmhclogsurmmjkgbalkvfed` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eoqwhibpbvviimyngivcfobocwlesfxpjjwy` (`filename`,`folderId`),
  KEY `idx_qdiyxudnrdsdyawcapfeskcktuaupslsgbqw` (`folderId`),
  KEY `idx_psxbmltunfezhttsekchuqzcfydkjukveidi` (`volumeId`),
  KEY `fk_xbwejafvpwocybsmtoscouzbsazshzrdjyhq` (`uploaderId`),
  CONSTRAINT `fk_cyoufvalmjnglffpihtxhtbekviloxxejcxy` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kfqmwefcdtcrpyeriegyhfxbuzblgcvsgkoq` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tesfrwjrvisbcuypdfcbkwlrghnblnnyyqle` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xbwejafvpwocybsmtoscouzbsazshzrdjyhq` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_ypkoidygxrycdydmnnerudvvbhxvmddzyibr` (`siteId`),
  CONSTRAINT `fk_mfqdghthnhzxhodguriyinxelfinyvmfpbso` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ypkoidygxrycdydmnnerudvvbhxvmddzyibr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qevsvsudnlmrisviwnebamivsrnbbgqkgfaw` (`userId`),
  CONSTRAINT `fk_qevsvsudnlmrisviwnebamivsrnbbgqkgfaw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wiygdebtzafogmkwmqlhkyqsnajmpuawlejr` (`groupId`),
  KEY `fk_rrgrfmmlsvwkhjhqimnjoqnziaijeeerzeak` (`parentId`),
  CONSTRAINT `fk_pdmxaxuyqjxuojsfoidiorceckwhjttfgtrf` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rrgrfmmlsvwkhjhqimnjoqnziaijeeerzeak` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yvrnxdmccllettamygqwiohvwedztovufbdg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xdssjqmprzafurosmsohilbdryszakafabfa` (`name`),
  KEY `idx_eloewzcfbpcfwkfpkwzomgnxnjihwpokipbc` (`handle`),
  KEY `idx_ugmnwacemmlgoroeftywbebagivywyhtkfbf` (`structureId`),
  KEY `idx_ojzwcpdacnnnrwjwthzonhdesdjdqpsmsqgg` (`fieldLayoutId`),
  KEY `idx_zqgfqkasosipelokgqzlyrvlpdctjtfnorje` (`dateDeleted`),
  CONSTRAINT `fk_oiltmllksxtxunaonisbiexsmzqitxnzerhs` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_txumefzyyonatxxrzafmdgwsgayilgljlgay` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xxikrxfojbisofnamohiujmxhixhojuatbll` (`groupId`,`siteId`),
  KEY `idx_mwlqywmbaumdaenasrywozcknjcpgblzivtb` (`siteId`),
  CONSTRAINT `fk_jvqarheaxaakdofyxnawgniehqwaxsumusvs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mlojibawfzjvbbcnjlbiyizroryvhcaecgyc` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_rfpsprokjznqotnbmsgkpqkxbfqgerphvapg` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_meskwfnjbroziglxurvbczrdwjcgvemqbvrl` (`siteId`),
  KEY `fk_qieyfsxsrutbnjxzeppthxiuyyqsmcxgqlsx` (`userId`),
  CONSTRAINT `fk_bdlvxgqemdxtcltzygcpreudbmnnhftqsjrx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_meskwfnjbroziglxurvbczrdwjcgvemqbvrl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qieyfsxsrutbnjxzeppthxiuyyqsmcxgqlsx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_xqrsxxumqnhqmxqgoxuivlqtgitdskylvjkj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_hfxyvodusxzasdfmdizhngorhklxzpyrszrk` (`siteId`),
  KEY `fk_cpxstrggossvcgpgykjltuzibnovlpuilfyl` (`fieldId`),
  KEY `fk_hgshjtgeifurdbvulqlkjazlrfydgxmxjski` (`userId`),
  CONSTRAINT `fk_cpxstrggossvcgpgykjltuzibnovlpuilfyl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hfxyvodusxzasdfmdizhngorhklxzpyrszrk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hgshjtgeifurdbvulqlkjazlrfydgxmxjski` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_khmgsyysamkbaaibvqfwxyejdjrxzhqwdrnh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_fihzauqgtqzvbdehpfscuddmjhgiatiwbkbo` (`userId`),
  CONSTRAINT `fk_fihzauqgtqzvbdehpfscuddmjhgiatiwbkbo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yomvbltioltctmypsqdaadilqodtmqxxpsld` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_ipblzfuayaszzhgrfxueezqtvtzryberxvxk` (`creatorId`,`provisional`),
  KEY `idx_ejtlpewnmrluwhauasjxqimltnbdeusycrqa` (`saved`),
  KEY `fk_gyyypjqcunayskakizftwetgjxjyfxzammop` (`canonicalId`),
  CONSTRAINT `fk_anaupiickoezbudsocckctojfnatylxtdncb` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gyyypjqcunayskakizftwetgjxjyfxzammop` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_sdihtiyuboakcvmgbwcfciftkqimicrysgtu` (`elementId`,`timestamp`,`userId`),
  KEY `fk_snizijkmiqsjihvwhqhewfkxbcfeirhhrwif` (`userId`),
  KEY `fk_hflfnomirvsrtoppkvhqicjfootkolzcdwrg` (`siteId`),
  KEY `fk_vkinsqngdviiuhsczyduhfbppfqpzewtbgqq` (`draftId`),
  CONSTRAINT `fk_afzuefkqhajhqnwrzzpgzzdwclcnlojeheaz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hflfnomirvsrtoppkvhqicjfootkolzcdwrg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_snizijkmiqsjihvwhqhewfkxbcfeirhhrwif` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vkinsqngdviiuhsczyduhfbppfqpzewtbgqq` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iecsirgkvpozwuaysrokahhlosceimxzvvrm` (`dateDeleted`),
  KEY `idx_frpamrwymojrhdqeqsxqfpznmmyrwsbemliw` (`fieldLayoutId`),
  KEY `idx_gtrnwjmjhxapcpiravcikmtatqqwdxlzaljf` (`type`),
  KEY `idx_konerbdzktenpyjgrcozewautarrweyyjkjp` (`enabled`),
  KEY `idx_joplyqsgdyasbcvuvryruxjjocplqwtjfggb` (`canonicalId`),
  KEY `idx_uiiredfrezsdozajkypeaorskrityynhcomt` (`archived`,`dateCreated`),
  KEY `idx_aqanqrlfzkelgmbxijpwppoawlwevbtxddrs` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_ymxzkcczcvvcrtkgqrfcxovqjqynqeoqztoz` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_lryagzdtnuyskbxhlpqonmjrtraqiijidqjz` (`draftId`),
  KEY `fk_wehqlsknkpppbfkczoxhpzhyjwvjyzbbjfcz` (`revisionId`),
  CONSTRAINT `fk_dguqwivsgprxpfuwtnkeuexbbnrtwcepevnu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lryagzdtnuyskbxhlpqonmjrtraqiijidqjz` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sqzmacjxnzqqdcipnxiyceeaekbjdkafoerb` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wehqlsknkpppbfkczoxhpzhyjwvjyzbbjfcz` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_olimruyitgrwukpaiohlrxujnixvddtzpqpo` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_pdbbpalpvspgqhdqzdxidhbhawouunzztrpb` (`ownerId`),
  CONSTRAINT `fk_aifzvbhevjgvmqhlximpkajvlkavainfcnxs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pdbbpalpvspgqhdqzdxidhbhawouunzztrpb` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hfgqocegrofavaswnxorhalnxpewlgptgyty` (`elementId`,`siteId`),
  KEY `idx_jngvshzaqikxszyzyuxjcumvgpxkidbhgudx` (`siteId`),
  KEY `idx_yzlxfntexcczkeoudubxrytddwlhmjyhtpbe` (`title`,`siteId`),
  KEY `idx_mwtijkmdeulmdqfhttvzbomhgmysgufixzcu` (`slug`,`siteId`),
  KEY `idx_ijcgvswqywoummmsbvbqdbqqnjeoyjmznsac` (`enabled`),
  KEY `idx_qztzpjagofliymcuamqpkfvskppexqsvjnlz` (`uri`,`siteId`),
  CONSTRAINT `fk_eoimqubimixxzrhcrraaguaiionvcbivlsuu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fywmudtlgqntipveuztjfhgndbcdenunofqw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_khprzulyljgbgririhkfsqkceuaicscbrpoh` (`postDate`),
  KEY `idx_wxwkfywxvkwzidawlkypumilzmaqvqngzmqh` (`expiryDate`),
  KEY `idx_wfgsjwtadpfiwxtnwzygfekuywaebyzqkyfq` (`sectionId`),
  KEY `idx_dzfoatsyvnoqdanxgzjnxbbltgnehzmtivxl` (`typeId`),
  KEY `idx_qlmbiacptxeyckcmbutgwastsjgjiishoouw` (`primaryOwnerId`),
  KEY `idx_ppdexqitpkmcwhbnhkkvvqwnbiopnhkovdle` (`fieldId`),
  KEY `fk_jdhfoibmcjvhfovtrxctquzlybgbokouxxul` (`parentId`),
  CONSTRAINT `fk_dvuvvcqejnuzexmlarzbtyjxwowafykiydkk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ffsytfsjupsbcjpgajuzazncxpbvqzqfhgqx` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jdhfoibmcjvhfovtrxctquzlybgbokouxxul` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rupzlixugljudugsrkwxtdukfqzvsvfuuwji` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tyovlbksqzjnmbderfxscqjtqdyfpksamdxy` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yqzicwcnltwhtgfjrbwvnputqehpjtgvabbq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_oefxzydqutfbvedqqbqnemaevgmggkgxppmd` (`authorId`),
  KEY `idx_qelesdroqxnxolopizpbjwtxrhjxheaoivxc` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_bxklmrtvekhmzwpxzdpjycuaxzygqousiiqz` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qnrxhrxarqdkidziramlktboecigpbjszzaj` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_luhhydviasiqsznnzvmlhzhmhsfxaxlcuvmk` (`fieldLayoutId`),
  KEY `idx_ngqyvmngyxawztddrwiqxyvdcmprvrggxwxj` (`dateDeleted`),
  CONSTRAINT `fk_czzjdvalodyyhvswzcphxreimpqjvmrcdibh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_axxyprbponxptenmufvkeutswkludqajpfux` (`dateDeleted`),
  KEY `idx_qqmmwilrkbrrsoqlsmedxcyccdspiyridxnx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vfyaaincexroashobrveorwmbepuxrooeynr` (`handle`,`context`),
  KEY `idx_khebzreukvykptvtihmtreyjrvarhyptmqxn` (`context`),
  KEY `idx_kopejzdiyaevwdbmbydxerpqvyhkrvblmhya` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tszmhcxxczhinndippfoulqqtztrzagauonf` (`name`),
  KEY `idx_wrsyryfipnjeqgapbzyqvnchlfbqvrebelcs` (`handle`),
  KEY `idx_dkffcrflmhximqsqunstpdsgyzmuxjqrkgci` (`fieldLayoutId`),
  KEY `idx_tgohktyvitcldsazecvbnoaiwyisrrusbdpw` (`sortOrder`),
  CONSTRAINT `fk_kyxqvkayhuchffqyakdoricdhuyeiufasrzn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tzutvtlpxvprbirtbxtngivansvuclsmeryc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xdsinbznulxvdsccnohvfjyovjrulivftadp` (`accessToken`),
  UNIQUE KEY `idx_yzbkmlvgnphlceflhwzqogwehiimwnmzwubh` (`name`),
  KEY `fk_iknyywqyzkuivqdnbssixnibrfhelkncoqsa` (`schemaId`),
  CONSTRAINT `fk_iknyywqyzkuivqdnbssixnibrfhelkncoqsa` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmlkntcuithqhpuptfraknrmaljgebqyoji` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wvbnigwiygdmgglgrhfhlpyuojwmblkltenq` (`name`),
  KEY `idx_bxdfplktuiemmtmelhxyydzdvbmfdbbgrxlm` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mapbox_addresses`
--

DROP TABLE IF EXISTS `mapbox_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapbox_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `fieldId` int NOT NULL,
  `formatted` varchar(255) DEFAULT NULL,
  `raw` text,
  `name` varchar(255) DEFAULT NULL,
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `mapboxId` text,
  `lng` decimal(12,8) DEFAULT NULL,
  `lat` decimal(12,8) DEFAULT NULL,
  `zoom` decimal(4,2) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qlczjluqkrbraqmnuuzxcuwdqcuvbhvuueed` (`elementId`),
  KEY `idx_lfyciffarnjaerlswdlnzwnctltnujbwvebq` (`fieldId`),
  CONSTRAINT `fk_stfreofckgzxsyhdefboqvocnobqcskeiqfm` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xindvlmfzlrzqajdpncvrddglkbujalghudj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vpjncxjeidqrivqmhfhlfytksfrjamttdlpm` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ulmkxjndsiylffmqvrzsvfjdtrhgwhsntyjx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_nhcpeiljpbyqumjzvhesbmuzosvysnyujlqf` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_rhpcqpmylclzndrshlkddkvhsypdphgsroio` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pycpzhszwdljepvsciqtsqrjalktdvxssmel` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_xfuvttaloyeyggbsdtddkekfykawmhylhmqt` (`sourceId`),
  KEY `idx_zfvfzfqrkjistdjkqhbyiyhwkxwodksodhpj` (`targetId`),
  KEY `idx_fbjnkxyqjenflweemzxpsesedgglawbsgmig` (`sourceSiteId`),
  CONSTRAINT `fk_aqoobfpwthoyevlucbuntuyivzxideihyrzm` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hqeecsyjzszbhrwwcpbmplivrueytfhtedng` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mvdrmttuavzetowlqkhekdzltkozijhagbiw` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cjbprjpamxwgkysjublodvuxkuoytzafaiqe` (`canonicalId`,`num`),
  KEY `fk_tchuvfaetsognkojlokqkcglbnighgqlqkcd` (`creatorId`),
  CONSTRAINT `fk_rkaikebnzeroxlyrnmzhdxegihxllwkbsaeq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tchuvfaetsognkojlokqkcglbnighgqlqkcd` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_pprgqomfrdpxbnsejzgwzgostwbdbnvpbkqa` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lsrsfedqbxbkgvtjayedzlcxeehzckyaofxh` (`handle`),
  KEY `idx_vbsdnymuzakaatcqnydlhcvlcqjtgttpfpeb` (`name`),
  KEY `idx_svxwjsesmitwpfxkxsoawggitxytwbobcino` (`structureId`),
  KEY `idx_rjuotuxhhznrephisaytyepptjordpxneqhw` (`dateDeleted`),
  CONSTRAINT `fk_hvynfstpfyiegqfwfwwseieplfoisznmbweb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_rqcoziyqnqlliosmbafczcytllfgckrouczh` (`typeId`),
  CONSTRAINT `fk_quxifzxflnksmoqccvqkjeuechjwwlryirxz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rqcoziyqnqlliosmbafczcytllfgckrouczh` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jfvzbnndtmoiddzlzohypwfkevcojaydgexc` (`sectionId`,`siteId`),
  KEY `idx_odckrahkdlxcyljckozgyplmpathftxqvlyg` (`siteId`),
  CONSTRAINT `fk_owjqbbyumxznziuwusvzxlferuwbrquoiijk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_shkpdibqzbqlmeejbilwpgoossymilbsnunb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aefyrbqsyaruozaqshwszvegctyxsocogicp` (`uid`),
  KEY `idx_sovehjznoxojrudrukuqdlxawiytthrljuua` (`token`),
  KEY `idx_rsqeigcviwoukhvmspxahonenprdlqiqojuu` (`dateUpdated`),
  KEY `idx_jqmdyiigmsqpuvqkgwgrjmwgdgrwednyfbcd` (`userId`),
  CONSTRAINT `fk_kmfymedqasefjdaxunnwadvlklagvvbezlpb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xcezmecsewoqzqxdukhrtrkswoocrdtgzbxv` (`userId`,`message`),
  CONSTRAINT `fk_utoabgrsgveisguhbuhznzqflravbdzaexeo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lvdxphqeavkzlgxxadkokbpnuhsuavbsnqob` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xggzzxasychqswiwujoxzfeflysyfwdbjrlx` (`dateDeleted`),
  KEY `idx_btivabcqiufszavonmiazisveczemvhqiwjb` (`handle`),
  KEY `idx_ejgroqedtczeffckrqhhehffeudkikwtjzwn` (`sortOrder`),
  KEY `fk_gsjuerilkyqebfiysuvfdcmybmdsduokijkw` (`groupId`),
  CONSTRAINT `fk_gsjuerilkyqebfiysuvfdcmybmdsduokijkw` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_qfkuueukjytcflhdagglvqxevccxmwbtvbwb` (`userId`),
  CONSTRAINT `fk_qfkuueukjytcflhdagglvqxevccxmwbtvbwb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bvbrkhqgzmeyhzedlsnbiefarpjklnavklpz` (`structureId`,`elementId`),
  KEY `idx_oabfcnyylqekcsgnpaljbsoadcmmrmoyhkyl` (`root`),
  KEY `idx_yyinswxgqhscutpodainqpoootcaloskeyar` (`lft`),
  KEY `idx_mmjsfgvsxhnhufhtjvwgnptspxoxfnbycruu` (`rgt`),
  KEY `idx_ltmrbdtoeycfoqvjwdvcjoonsijoyacllkgt` (`level`),
  KEY `idx_xnmyzlxuyvnbevnqmlpblujxdbpiaoodcgjv` (`elementId`),
  CONSTRAINT `fk_vbijimwtjwmogmpafojomfxdtcxkuvdvmypr` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rhxjsojvzsufhexeoezvzpxfvyfrfytxaopq` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lvcmxgbxctlrxploxtnirghkxohznuydgtws` (`key`,`language`),
  KEY `idx_qdfxetrwzrgrrlnrwdbzmyepneabjwrkxhfy` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rcqrwruqtryncwxwjqjzkblhqqhcvycdxnma` (`name`),
  KEY `idx_fhtepyaubsktteuszmwyiqwxnbwigizmskzn` (`handle`),
  KEY `idx_ccspgpzvlmzhigdtqypllgsxkypodznnouwu` (`dateDeleted`),
  KEY `fk_ochevfwlrwfsyhfxymeyxzbtobizttoaekee` (`fieldLayoutId`),
  CONSTRAINT `fk_ochevfwlrwfsyhfxymeyxzbtobizttoaekee` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pdehfrhktxokpfvqlpxlqyxtbimxyjwdtenc` (`groupId`),
  CONSTRAINT `fk_hmipypkdfhbqyqavxscuzmdshtrgrookqkya` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xwqeexsbaswjrmavvzojfyzybywfiuckpaze` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_axhrzlnitvzpejdlqlczhchyxwcxwwkygjtl` (`token`),
  KEY `idx_qqlmvrprkwrodescmmraqbjeayptcutchbki` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gusukaaltyaaqmuuwatizwslxpobxbihqolb` (`handle`),
  KEY `idx_fahbpnobisakbfbnfmdzwemujvymbodrlxks` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rtjggdlrvfipijvkupobjmaeooqschsbzycb` (`groupId`,`userId`),
  KEY `idx_rqqmopjzqnxaugdhswhmxmvevczfrmkkvydh` (`userId`),
  CONSTRAINT `fk_flmudbruqmymgcfrdkdtfdsbfqryzzhggvup` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zqnfojbxoogngyyczauwguxkbatylmroqpct` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vmtznplwuddmyefhfqsiolujfblngelprqah` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xhbqwxjjwxuikxxwtdfcvodgstipkrxzsryg` (`permissionId`,`groupId`),
  KEY `idx_cexkwsqjikfnswsfqftmwlxfrcnlhbcqebwq` (`groupId`),
  CONSTRAINT `fk_rbqefezlrrxckxoomptvaytqxbbjfcmmbrhh` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rygfwdqqusuxvpcnmxspwxrtajckiqnaitul` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dzntnahkszbuppcgixqwkfhfzejlnaielykw` (`permissionId`,`userId`),
  KEY `idx_bshlocspcigboytryrzgaqapahaixwmjzght` (`userId`),
  CONSTRAINT `fk_rfcfptzjokwroimoinbxpgrttehxdbjupqha` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sqzpbvdgmkkpselzxtkkzrixvsaglypepxpv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_alytgsnvedepejfkyqtxdiabcydrperlrzsl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tajmfeaqfpinhvpsufybnyfbwdlytvwpoxah` (`active`),
  KEY `idx_tqwroxfqnngkwbexyrbiesptidbckboprprv` (`locked`),
  KEY `idx_kemaxbmmhwgqvehpzlevjvbwmgsnugzzfonk` (`pending`),
  KEY `idx_blalhdhqnbgeiohxfaoqichluxzabvqmxzwm` (`suspended`),
  KEY `idx_khfyywfyhtuagocdmvnqdrqkleoxiibcuxqn` (`verificationCode`),
  KEY `idx_fsklcnmbgdvxqksoqnwxtenqnsgfflkicywd` (`email`),
  KEY `idx_qsstzuhbjtjupoqeyhqalrjumhtvfssxbfaw` (`username`),
  KEY `fk_kqztyabsuhsyrngodzjopftilbgsgcerjdkk` (`photoId`),
  CONSTRAINT `fk_kqztyabsuhsyrngodzjopftilbgsgcerjdkk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rkkptyykbtdqjnlegvbilskvhcbgcbeapfez` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sfdmkylcqqcsqvcunpwlwfuocenypxrxpfof` (`name`,`parentId`,`volumeId`),
  KEY `idx_fxrrxghxijgvruyfowfbvsdyqarxmnzdvdgx` (`parentId`),
  KEY `idx_rwfihqyhzlhwooeqfdgxbvkkupyrdvpccbts` (`volumeId`),
  CONSTRAINT `fk_bhkxfyrksnggpuoecurborpjvcgfjafbrytm` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ouxttilwbyjldmirdzvzqbfbrurwgdoiopfg` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yebhisgnaaexlnwyhxoqcgtdbmjtuccnjqhb` (`name`),
  KEY `idx_wjrhyaqwipakjijzwpayfgcbgbbevetkpfhd` (`handle`),
  KEY `idx_cautssyiwrceyylwmgfuoquatplgdaxpkkof` (`fieldLayoutId`),
  KEY `idx_mduhdrfrrzfmrrwoxtrwuyqvuydhnpxthare` (`dateDeleted`),
  CONSTRAINT `fk_bdkecjpzpwputnwrugxkvyqbgyyijawxxwox` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_uvdacpmfbzjopulwtoxkqzwousyegsbskdxh` (`userId`),
  CONSTRAINT `fk_uvdacpmfbzjopulwtoxkqzwousyegsbskdxh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qxieftxdbnndqiqroeqfmeixoagitydsgscr` (`userId`),
  CONSTRAINT `fk_ufvnwubqkwzlpwcbnmxrrwpcgalptlqnvrpn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-21 15:29:07
-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES
(4,1,1,1,'aptOne-one.jpg','image',NULL,1000,667,99095,NULL,NULL,NULL,'2024-11-18 15:32:20','2024-11-18 15:32:20','2024-11-18 15:32:20'),
(8,1,1,1,'aptTwo-one.jpg','image',NULL,1000,750,121694,NULL,NULL,NULL,'2024-11-18 15:36:05','2024-11-18 15:36:05','2024-11-18 15:36:05'),
(11,1,1,1,'houseOne-one.png','image',NULL,1000,699,1177038,NULL,NULL,NULL,'2024-11-18 15:39:10','2024-11-18 15:39:10','2024-11-18 15:39:10'),
(14,1,1,1,'houweTwo-one.jpg','image',NULL,1000,655,65660,NULL,NULL,NULL,'2024-11-18 15:41:49','2024-11-18 15:41:49','2024-11-18 15:41:49'),
(23,1,1,1,'officeOne-one.jpeg','image',NULL,1000,666,83551,NULL,NULL,NULL,'2024-11-18 15:46:30','2024-11-18 15:46:30','2024-11-18 15:46:30'),
(26,1,1,1,'officeTwo-one.jpg','image',NULL,1000,750,97612,NULL,NULL,NULL,'2024-11-18 15:52:56','2024-11-18 15:52:56','2024-11-18 15:52:56'),
(29,1,1,1,'villaOne-one.jpg','image',NULL,1000,666,179865,NULL,NULL,NULL,'2024-11-18 15:58:06','2024-11-18 15:58:06','2024-11-18 15:58:06'),
(32,1,1,1,'villaTwo-one.jpg','image',NULL,1000,699,128960,NULL,NULL,NULL,'2024-11-18 16:03:25','2024-11-18 16:03:25','2024-11-18 16:03:25');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets_sites` VALUES
(4,1,NULL),
(8,1,NULL),
(11,1,NULL),
(14,1,NULL),
(23,1,NULL),
(26,1,NULL),
(29,1,NULL),
(32,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES
(1,1,'lastPasswordChangeDate','2024-11-19 16:52:40',0,NULL),
(1,1,'password','2024-11-19 16:52:40',0,NULL),
(2,1,'slug','2024-11-15 08:08:07',0,1),
(2,1,'title','2024-11-15 08:08:07',0,1),
(2,1,'uri','2024-11-15 08:08:07',0,1),
(3,1,'postDate','2024-11-18 15:32:47',0,1),
(3,1,'slug','2024-11-18 15:31:30',0,1),
(3,1,'title','2024-11-18 15:31:30',0,1),
(3,1,'uri','2024-11-18 15:31:30',0,1),
(7,1,'postDate','2024-11-18 15:36:39',0,1),
(7,1,'slug','2024-11-18 15:34:30',0,1),
(7,1,'title','2024-11-18 15:34:30',0,1),
(7,1,'uri','2024-11-18 15:34:30',0,1),
(10,1,'postDate','2024-11-18 15:39:57',0,1),
(10,1,'slug','2024-11-18 15:37:45',0,1),
(10,1,'title','2024-11-18 15:37:45',0,1),
(10,1,'uri','2024-11-18 15:37:45',0,1),
(13,1,'postDate','2024-11-18 15:42:21',0,1),
(13,1,'slug','2024-11-18 15:41:40',0,1),
(13,1,'title','2024-11-18 15:41:40',0,1),
(13,1,'uri','2024-11-18 15:41:40',0,1),
(22,1,'postDate','2024-11-18 15:47:45',0,1),
(22,1,'slug','2024-11-18 15:45:19',0,1),
(22,1,'title','2024-11-18 15:45:19',0,1),
(22,1,'uri','2024-11-18 15:45:19',0,1),
(25,1,'postDate','2024-11-18 15:53:29',0,1),
(25,1,'slug','2024-11-18 15:51:46',0,1),
(25,1,'title','2024-11-18 15:51:46',0,1),
(25,1,'uri','2024-11-18 15:51:46',0,1),
(28,1,'postDate','2024-11-18 15:59:07',0,1),
(28,1,'slug','2024-11-18 15:58:00',0,1),
(28,1,'title','2024-11-18 15:58:00',0,1),
(28,1,'uri','2024-11-18 15:58:00',0,1),
(31,1,'postDate','2024-11-18 16:04:05',0,1),
(31,1,'slug','2024-11-18 16:03:10',0,1),
(31,1,'title','2024-11-18 16:03:10',0,1),
(31,1,'uri','2024-11-18 16:03:10',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES
(3,1,1,'7ad139cc-5071-4e37-a169-4ccef84633ff','2024-11-18 15:32:47',0,1),
(3,1,2,'4da3e556-0448-4bc0-9b29-e3a5bd276fac','2024-11-18 15:32:47',0,1),
(3,1,3,'e4858492-34d1-44ad-9e07-976e2c8b9730','2024-11-18 15:32:47',0,1),
(3,1,4,'80477108-c856-4fd8-9d50-1d90c333614d','2024-11-18 15:42:38',0,1),
(3,1,6,'e093782e-2050-4f9e-b3bb-816b3b208823','2024-11-19 13:42:33',0,1),
(7,1,1,'7ad139cc-5071-4e37-a169-4ccef84633ff','2024-11-18 15:36:39',0,1),
(7,1,2,'4da3e556-0448-4bc0-9b29-e3a5bd276fac','2024-11-18 15:36:39',0,1),
(7,1,3,'e4858492-34d1-44ad-9e07-976e2c8b9730','2024-11-18 15:36:39',0,1),
(7,1,4,'80477108-c856-4fd8-9d50-1d90c333614d','2024-11-18 15:36:39',0,1),
(7,1,5,'502164f9-fb67-4bd6-aeb3-65b05b83b73e','2024-11-18 15:36:39',0,1),
(7,1,6,'e093782e-2050-4f9e-b3bb-816b3b208823','2024-11-19 13:42:22',0,1),
(10,1,1,'7ad139cc-5071-4e37-a169-4ccef84633ff','2024-11-18 15:39:57',0,1),
(10,1,2,'4da3e556-0448-4bc0-9b29-e3a5bd276fac','2024-11-18 15:39:57',0,1),
(10,1,3,'e4858492-34d1-44ad-9e07-976e2c8b9730','2024-11-18 15:39:57',0,1),
(10,1,4,'80477108-c856-4fd8-9d50-1d90c333614d','2024-11-18 15:39:57',0,1),
(10,1,5,'502164f9-fb67-4bd6-aeb3-65b05b83b73e','2024-11-18 15:42:29',0,1),
(10,1,6,'e093782e-2050-4f9e-b3bb-816b3b208823','2024-11-19 13:42:10',0,1),
(13,1,1,'7ad139cc-5071-4e37-a169-4ccef84633ff','2024-11-18 15:42:21',0,1),
(13,1,2,'4da3e556-0448-4bc0-9b29-e3a5bd276fac','2024-11-18 15:42:21',0,1),
(13,1,3,'e4858492-34d1-44ad-9e07-976e2c8b9730','2024-11-18 15:42:21',0,1),
(13,1,4,'80477108-c856-4fd8-9d50-1d90c333614d','2024-11-18 15:42:21',0,1),
(13,1,6,'e093782e-2050-4f9e-b3bb-816b3b208823','2024-11-19 13:41:59',0,1),
(22,1,1,'7ad139cc-5071-4e37-a169-4ccef84633ff','2024-11-18 15:47:45',0,1),
(22,1,2,'4da3e556-0448-4bc0-9b29-e3a5bd276fac','2024-11-18 15:47:45',0,1),
(22,1,3,'e4858492-34d1-44ad-9e07-976e2c8b9730','2024-11-18 15:47:45',0,1),
(22,1,4,'80477108-c856-4fd8-9d50-1d90c333614d','2024-11-18 15:47:45',0,1),
(22,1,6,'e093782e-2050-4f9e-b3bb-816b3b208823','2024-11-19 13:41:46',0,1),
(25,1,1,'7ad139cc-5071-4e37-a169-4ccef84633ff','2024-11-18 15:53:29',0,1),
(25,1,2,'4da3e556-0448-4bc0-9b29-e3a5bd276fac','2024-11-18 15:53:29',0,1),
(25,1,3,'e4858492-34d1-44ad-9e07-976e2c8b9730','2024-11-18 15:53:29',0,1),
(25,1,4,'80477108-c856-4fd8-9d50-1d90c333614d','2024-11-18 15:53:29',0,1),
(25,1,5,'502164f9-fb67-4bd6-aeb3-65b05b83b73e','2024-11-18 15:53:29',0,1),
(25,1,6,'e093782e-2050-4f9e-b3bb-816b3b208823','2024-11-19 13:41:34',0,1),
(28,1,1,'7ad139cc-5071-4e37-a169-4ccef84633ff','2024-11-18 15:59:07',0,1),
(28,1,2,'4da3e556-0448-4bc0-9b29-e3a5bd276fac','2024-11-18 15:59:07',0,1),
(28,1,3,'e4858492-34d1-44ad-9e07-976e2c8b9730','2024-11-18 15:59:07',0,1),
(28,1,4,'80477108-c856-4fd8-9d50-1d90c333614d','2024-11-18 15:59:07',0,1),
(28,1,6,'e093782e-2050-4f9e-b3bb-816b3b208823','2024-11-19 13:41:19',0,1),
(31,1,1,'7ad139cc-5071-4e37-a169-4ccef84633ff','2024-11-18 16:04:05',0,1),
(31,1,2,'4da3e556-0448-4bc0-9b29-e3a5bd276fac','2024-11-18 16:04:05',0,1),
(31,1,3,'e4858492-34d1-44ad-9e07-976e2c8b9730','2024-11-18 16:04:05',0,1),
(31,1,4,'80477108-c856-4fd8-9d50-1d90c333614d','2024-11-18 16:04:05',0,1),
(31,1,6,'e093782e-2050-4f9e-b3bb-816b3b208823','2024-11-18 17:48:40',0,1),
(35,1,2,'7c429094-b1dc-40e8-83f8-99e540aed730','2024-11-18 17:38:58',0,1),
(39,1,2,'7c429094-b1dc-40e8-83f8-99e540aed730','2024-11-18 17:42:32',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES
(1,NULL,1,0,'First draft','',0,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES
(2,1,1,NULL,'save','2024-11-15 08:08:07'),
(3,1,1,NULL,'edit','2024-11-19 13:42:33'),
(3,1,1,NULL,'save','2024-11-19 13:42:33'),
(7,1,1,NULL,'save','2024-11-19 13:42:22'),
(10,1,1,NULL,'edit','2024-11-19 13:42:10'),
(10,1,1,NULL,'save','2024-11-19 13:42:10'),
(13,1,1,NULL,'save','2024-11-19 13:41:59'),
(22,1,1,NULL,'save','2024-11-19 13:41:46'),
(25,1,1,NULL,'save','2024-11-21 15:28:14'),
(28,1,1,NULL,'edit','2024-11-19 13:41:18'),
(28,1,1,NULL,'save','2024-11-19 13:41:19'),
(31,1,1,NULL,'edit','2024-11-18 17:48:40'),
(31,1,1,NULL,'save','2024-11-21 15:28:10'),
(35,1,1,NULL,'edit','2024-11-18 17:38:57'),
(35,1,1,NULL,'save','2024-11-18 17:38:58'),
(39,1,1,NULL,'edit','2024-11-18 17:42:31'),
(39,1,1,NULL,'save','2024-11-18 17:42:32');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES
(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-11-04 16:26:23','2024-11-19 16:52:40',NULL,NULL,NULL,'f0fdc177-acec-42e4-b82f-af3f2202d5d0'),
(2,NULL,1,NULL,1,'craft\\elements\\Entry',1,0,'2024-11-15 08:07:59','2024-11-15 08:08:07',NULL,'2024-11-15 08:11:17',NULL,'da551422-9a3a-46d7-bc60-86272eb97d8e'),
(3,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:30:16','2024-11-19 13:42:33',NULL,NULL,NULL,'a9572334-1a86-4a47-b851-74a72776fbc3'),
(4,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-11-18 15:32:20','2024-11-18 15:32:20',NULL,NULL,NULL,'84fe0f75-4d28-4082-be0e-40f377ecd7a0'),
(5,3,NULL,1,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:32:47','2024-11-18 15:32:47',NULL,NULL,NULL,'01b90250-91cc-4ca1-af0a-bdec83af338d'),
(6,3,NULL,2,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:33:25','2024-11-18 15:33:25',NULL,NULL,NULL,'cf6a3bf9-237a-4030-ad8a-6a862135e625'),
(7,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:33:27','2024-11-19 13:42:22',NULL,NULL,NULL,'2c3335ac-19c9-43e4-b372-50c469d8cad4'),
(8,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-11-18 15:36:05','2024-11-18 15:36:05',NULL,NULL,NULL,'6a9daca6-4894-49f1-b829-fe5684d35a60'),
(9,7,NULL,3,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:36:39','2024-11-18 15:36:39',NULL,NULL,NULL,'ab088ed9-d16c-4936-b1c1-daccb1beaf76'),
(10,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:36:41','2024-11-19 13:42:10',NULL,NULL,NULL,'6b39d926-d944-4256-9564-f9d97b8452e9'),
(11,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-11-18 15:39:10','2024-11-18 15:39:10',NULL,NULL,NULL,'ca6ede47-502c-4759-9129-93efb2d07fef'),
(12,10,NULL,4,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:39:57','2024-11-18 15:39:57',NULL,NULL,NULL,'5220e7a6-a439-4a6b-bd14-885a6de6912f'),
(13,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:40:00','2024-11-19 13:41:59',NULL,NULL,NULL,'106dafbf-82e9-4fe8-ac8f-2729214e3444'),
(14,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-11-18 15:41:49','2024-11-18 15:41:49',NULL,NULL,NULL,'c7f72a3d-fe6e-4feb-b98a-36f582701933'),
(15,13,NULL,5,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:42:21','2024-11-18 15:42:21',NULL,NULL,NULL,'a602686f-f2b1-4ce7-9f89-b41b1ff64822'),
(17,10,NULL,6,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:42:29','2024-11-18 15:42:29',NULL,NULL,NULL,'ee03322a-26bc-4304-9b19-b14fe6828b86'),
(18,7,NULL,7,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:42:32','2024-11-18 15:42:32',NULL,NULL,NULL,'80c35d94-2fd2-4899-ac5a-7faa96c45087'),
(20,3,NULL,8,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:42:38','2024-11-18 15:42:38',NULL,NULL,NULL,'bc5e0752-e973-486d-857e-33a39dd5a223'),
(21,3,NULL,9,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:42:42','2024-11-18 15:42:42',NULL,NULL,NULL,'a0b6d580-0071-4fe3-a361-605594c8f616'),
(22,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:43:55','2024-11-19 13:41:46',NULL,NULL,NULL,'210d88c7-67da-4db6-809f-9959ee8d07a9'),
(23,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-11-18 15:46:30','2024-11-18 15:46:30',NULL,NULL,NULL,'07300894-43a1-4969-8067-91262cc96d38'),
(24,22,NULL,10,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:47:45','2024-11-18 15:47:45',NULL,NULL,NULL,'55407993-9d09-441d-8a66-6a0e553836e4'),
(25,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:47:47','2024-11-21 15:28:14',NULL,NULL,NULL,'e8511f7c-c5ea-40b9-a23b-3f5b23cb8d53'),
(26,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-11-18 15:52:56','2024-11-18 15:52:56',NULL,NULL,NULL,'1ec170c4-b807-4c71-b947-d4052d1aa63e'),
(27,25,NULL,11,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:53:29','2024-11-18 15:53:29',NULL,NULL,NULL,'2e109526-6940-401b-a61d-dba19bdfb231'),
(28,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:57:57','2024-11-19 13:41:19',NULL,NULL,NULL,'d9c2eb25-0205-49a9-a8aa-609dd13fa116'),
(29,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-11-18 15:58:06','2024-11-18 15:58:06',NULL,NULL,NULL,'9f61de5b-94d5-49a5-99d7-9a7261159a11'),
(30,28,NULL,12,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:59:07','2024-11-18 15:59:07',NULL,NULL,NULL,'51317a44-9a75-44e8-aeb2-1051d07a8e58'),
(31,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-18 15:59:08','2024-11-21 15:28:10',NULL,NULL,NULL,'9a01833c-797c-465f-8801-0cc2875d7925'),
(32,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-11-18 16:03:25','2024-11-18 16:03:25',NULL,NULL,NULL,'8b150422-d1af-4571-bef7-2ced52a27214'),
(33,31,NULL,13,2,'craft\\elements\\Entry',1,0,'2024-11-18 16:04:05','2024-11-18 16:04:05',NULL,NULL,NULL,'6b7d7d3b-aa4d-4cfe-98e9-c79d3dac4efa'),
(34,31,NULL,14,2,'craft\\elements\\Entry',1,0,'2024-11-18 17:19:37','2024-11-18 17:19:37',NULL,NULL,NULL,'ace8297d-195d-4fe2-aaf0-b81ef09e8b16'),
(35,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-18 17:37:44','2024-11-18 17:38:58',NULL,'2024-11-21 15:27:11',NULL,'a9b60454-7bb1-434e-a1de-8b2c6d7617f4'),
(36,35,NULL,15,4,'craft\\elements\\Entry',1,0,'2024-11-18 17:37:44','2024-11-18 17:37:44',NULL,NULL,NULL,'17528fa9-8b48-48b4-a28c-aae9581ca930'),
(38,35,NULL,16,4,'craft\\elements\\Entry',1,0,'2024-11-18 17:38:58','2024-11-18 17:38:58',NULL,NULL,NULL,'89bf6f56-676e-48cc-8f3b-d9e0bec7853b'),
(39,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-18 17:42:16','2024-11-18 17:42:32',NULL,'2024-11-21 15:27:08',NULL,'a345fb4e-6c3b-46e0-8c77-a7534fe11ca2'),
(40,39,NULL,17,4,'craft\\elements\\Entry',1,0,'2024-11-18 17:42:16','2024-11-18 17:42:16',NULL,NULL,NULL,'8d52fdfe-82bd-4086-8c27-730402f039a2'),
(42,39,NULL,18,4,'craft\\elements\\Entry',1,0,'2024-11-18 17:42:32','2024-11-18 17:42:32',NULL,NULL,NULL,'6b7ad2ab-5804-4f13-83d1-5a19e6955c26'),
(44,31,NULL,19,2,'craft\\elements\\Entry',1,0,'2024-11-18 17:48:40','2024-11-18 17:48:40',NULL,NULL,NULL,'0e03f2c7-3614-4de8-925c-9ba21c933d7a'),
(46,28,NULL,20,2,'craft\\elements\\Entry',1,0,'2024-11-19 13:41:19','2024-11-19 13:41:19',NULL,NULL,NULL,'4f4a0abd-193d-4380-830f-437abec81dd1'),
(47,25,NULL,21,2,'craft\\elements\\Entry',1,0,'2024-11-19 13:41:34','2024-11-19 13:41:34',NULL,NULL,NULL,'0b066908-b9ec-43b8-9384-ee6e329be8b2'),
(48,22,NULL,22,2,'craft\\elements\\Entry',1,0,'2024-11-19 13:41:46','2024-11-19 13:41:46',NULL,NULL,NULL,'94957405-63bc-4b31-a4c7-deee7e48b35d'),
(49,13,NULL,23,2,'craft\\elements\\Entry',1,0,'2024-11-19 13:41:59','2024-11-19 13:41:59',NULL,NULL,NULL,'5b311a27-49d8-454c-8856-5a5b6787237a'),
(51,10,NULL,24,2,'craft\\elements\\Entry',1,0,'2024-11-19 13:42:10','2024-11-19 13:42:10',NULL,NULL,NULL,'8ab293e4-8fce-4d63-a67e-bd9b54e16dc5'),
(52,7,NULL,25,2,'craft\\elements\\Entry',1,0,'2024-11-19 13:42:22','2024-11-19 13:42:22',NULL,NULL,NULL,'b9011ce5-3c18-4def-92a1-fedd33936972'),
(54,3,NULL,26,2,'craft\\elements\\Entry',1,0,'2024-11-19 13:42:33','2024-11-19 13:42:33',NULL,NULL,NULL,'5ef0f06f-b6a2-4ce6-b8ff-c18cf0660a80'),
(55,31,NULL,27,2,'craft\\elements\\Entry',1,0,'2024-11-21 15:28:10','2024-11-21 15:28:10',NULL,NULL,NULL,'c67cf36e-6c3f-4ade-a362-2f7aae428732'),
(56,25,NULL,28,2,'craft\\elements\\Entry',1,0,'2024-11-21 15:28:14','2024-11-21 15:28:14',NULL,NULL,NULL,'b5c0d51d-fcd6-4adc-87fe-5d8752fb3992');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES
(1,1,1,NULL,NULL,NULL,NULL,1,'2024-11-04 16:26:23','2024-11-04 16:26:23','f361699e-dc61-4fb1-82c4-b50e9326172c'),
(2,2,1,NULL,'__temp_aqsgyuyxzqqnvtjrqrepsluqdqacolplgovw','test/__temp_aqsgyuyxzqqnvtjrqrepsluqdqacolplgovw',NULL,1,'2024-11-15 08:07:59','2024-11-15 08:08:07','07fe43a9-9c31-4669-a230-2fc632a07351'),
(3,3,1,'Apartement in Gent with 2 terraces and water view','apartement-in-gent-with-2-terraces-and-water-view','house/apartement-in-gent-with-2-terraces-and-water-view','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Coupure Rechts 490, 9000 Gent\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [4], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"32000000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This stunning apartment located on Coupure Rechts offers the perfect blend of authentic character and modern comfort. Its proximity to daily necessities and public transport makes this vibrant location one of the most sought-after areas in Ghent. The city center, just a short bike ride away, will hold no secrets for you.</p><p>The spacious entrance hall with a separate cloakroom leads to the open living area, bedroom, and bathroom. The cozy living room connects seamlessly to the renovated, fully equipped kitchen, which also features a practical storage room with provisions for a washing machine. From the kitchen, you have direct access to the first terrace, offering a beautiful view of the water.</p><p>The bedroom, with ample storage options, provides access to the second terrace, perfect for enjoying the morning sun. The modern bathroom includes a walk-in shower and a single vanity unit.</p><p>With an impressive energy performance certificate (EPC label A), this apartment ensures lower-than-average energy costs. Additional benefits include a bike storage room, a private cellar, and a garage, which must be purchased for €30,000.</p><p>Don\'t miss this unique opportunity to own an energy-efficient apartment in such an attractive and desirable location. </p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"1\", \"col2\": \"1\", \"col3\": \"70\"}]}',1,'2024-11-18 15:30:16','2024-11-19 13:42:33','a8753aac-3336-4e91-acaa-69950fb40916'),
(4,4,1,'Apt One one',NULL,NULL,NULL,1,'2024-11-18 15:32:20','2024-11-18 15:32:20','7fa85b7c-0679-4069-8b94-0c5c23bbc1da'),
(5,5,1,'Apartement in Gent with 2 terraces and water view','apartement-in-gent-with-2-terraces-and-water-view','house/apartement-in-gent-with-2-terraces-and-water-view','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Coupure Rechts 490, 9000 Gent\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [4], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"32000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"1\", \"col2\": \"1\", \"col3\": \"70\"}]}',1,'2024-11-18 15:32:47','2024-11-18 15:32:47','971082ab-4389-43fe-94e8-3e7f0e62b795'),
(6,6,1,'Apartement in Gent with 2 terraces and water view','apartement-in-gent-with-2-terraces-and-water-view','house/apartement-in-gent-with-2-terraces-and-water-view','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Coupure Rechts 490, 9000 Gent\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [4], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"32000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"1\", \"col2\": \"1\", \"col3\": \"70\"}]}',1,'2024-11-18 15:33:25','2024-11-18 15:33:25','77bd0a3e-38e0-4fbc-9f54-71cf67ae21e9'),
(7,7,1,'1-bedroom apartment with garage for rent in Gent','1-bedroom-apartment-with-garage-for-rent-in-gent','house/1-bedroom-apartment-with-garage-for-rent-in-gent','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Oslostraat 3, 9000 Gent\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [8], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"87500\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This modern new-build apartment on the second floor, located on the quiet Oslostraat near the water, offers an ideal location with easy access to the city center. Shops, restaurants, and public transport are all within walking distance.</p><p>Upon entering the hallway, you are welcomed into a bright living room with an open kitchen, equipped with a refrigerator, combination oven, ceramic cooktop, dishwasher, extractor hood, and sink. Adjacent to the kitchen is a convenient storage room with connections for a washing machine and dryer. A large sliding door in the living room opens onto a spacious south-facing terrace. The apartment also features a comfortable bedroom, a separate toilet, and a modern bathroom with a walk-in shower and vanity unit.</p><p>This energy-efficient apartment includes central heating powered by natural gas and comes fully painted, with curtains already installed. Additionally, there is an underground parking space and a private storage unit.</p><p>The property will be available starting March 1, 2025, with a monthly rental price of €800 (apartment) + €75 (covered parking space) + €50 (common charges). Utilities (electricity, gas, and water) are the tenant\'s responsibility, and registration of residency is mandatory. The rental agreement requires a minimum term of three years, and students are not permitted.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"1\", \"col2\": \"1\", \"col3\": \"62\"}]}',1,'2024-11-18 15:33:27','2024-11-19 13:42:22','65b2ebba-08fd-4ac0-861a-f6dedaafb2f1'),
(8,8,1,'Apt Two one',NULL,NULL,NULL,1,'2024-11-18 15:36:05','2024-11-18 15:36:05','d09ce8d9-a7fc-4605-b8e3-dce949d06f90'),
(9,9,1,'1-bedroom apartment with garage for rent in Gent','1-bedroom-apartment-with-garage-for-rent-in-gent','house/1-bedroom-apartment-with-garage-for-rent-in-gent','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Oslostraat 3, 9000 Gent\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [8], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"87500\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"1\", \"col2\": \"1\", \"col3\": \"62\"}]}',1,'2024-11-18 15:36:39','2024-11-18 15:36:39','0fcc471e-2b22-4c44-8634-1a8eb21fb644'),
(10,10,1,'Charming town house with 3 bedrooms in the heart of Bruges','charming-town-house-with-3-bedrooms-in-the-heart-of-bruges','house/charming-town-house-with-3-bedrooms-in-the-heart-of-bruges','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Jeruzalemstraat 49, 8000 Brugge\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [11], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"129000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This charming home, located in the historic city center of Bruges, offers all modern conveniences. Situated on a very quiet street, the property is surrounded by ample parking options in the neighboring streets.</p><p>The ground floor features an entrance hall with a toilet, a spacious dining area, a renovated open kitchen, and a bright living room with large windows that create a seamless connection between indoors and outdoors. The first floor includes two spacious bedrooms and a bathroom. On the upper floor, there is a very large and light-filled attic room. This home is ideal for a family or couple.</p><p>The property boasts high-quality finishes with many authentic elements. The kitchen is equipped with modern appliances. Its prime location in the heart of Bruges ensures that restaurants, shops, public transport, and numerous attractions are all within walking distance.</p><p>Available: January 15, 2025</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"3\", \"col2\": \"1\", \"col3\": \"90\"}]}',1,'2024-11-18 15:36:41','2024-11-19 13:42:10','f8ea883f-f684-450c-9dbd-9544f1f36e18'),
(11,11,1,'House One one',NULL,NULL,NULL,1,'2024-11-18 15:39:10','2024-11-18 15:39:10','45e665f2-ab1b-4797-93f2-bdef610b3788'),
(12,12,1,'Charming town house with 3 bedrooms in the heart of Bruges','charming-town-house-with-3-bedrooms-in-the-heart-of-bruges','house/charming-town-house-with-3-bedrooms-in-the-heart-of-bruges','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Jeruzalemstraat 49, 8000 Brugge\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [11], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"129000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"3\", \"col2\": \"1\", \"col3\": \"90\"}]}',1,'2024-11-18 15:39:57','2024-11-18 15:39:57','252e2d30-bb33-46f2-b9af-8cb03655c96a'),
(13,13,1,'Renovated Town House in Sint-Andries','renovated-town-house-in-sint-andries','house/renovated-town-house-in-sint-andries','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Pastoriestraat 214, 8200 Brugge\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [14], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"41000000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This spacious, fully renovated family home on Pastoriestraat in Sint-Andries has everything you’re looking for: an ideal location with easy access to main roads, nearby schools, and shops. Featuring four bedrooms and two modern bathrooms, this property is perfect for a large family. The living area provides ample space, while the state-of-the-art kitchen is fully equipped with high-quality appliances. Additionally, the home boasts a large, sunny garden.</p><p>The property has been upgraded with insulated roofs, PVC windows with double glazing, and a complete electrical system update. It also includes central heating and underfloor heating powered by a new heat pump.</p><p>The sale is conducted via a specifications document, giving you full transparency about the completed works and what to expect. Please note that the included photos are for illustrative purposes only.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"4\", \"col2\": \"2\", \"col3\": \"314\"}]}',1,'2024-11-18 15:40:00','2024-11-19 13:41:59','ae05e4f2-0f28-4f63-a4d9-a7a9f44091bb'),
(14,14,1,'Houwe Two one',NULL,NULL,NULL,1,'2024-11-18 15:41:49','2024-11-18 15:41:49','50d25c37-cbb1-4215-a772-39c14a2e1aa5'),
(15,15,1,'Renovated Town House in Sint-Andries','renovated-town-house-in-sint-andries','house/renovated-town-house-in-sint-andries','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Pastoriestraat 214, 8200 Brugge\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [14], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"41000000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"4\", \"col2\": \"2\", \"col3\": \"314\"}]}',1,'2024-11-18 15:42:21','2024-11-18 15:42:21','651fd9da-c57c-45da-9d44-92f887bc93a7'),
(17,17,1,'Charming town house with 3 bedrooms in the heart of Bruges','charming-town-house-with-3-bedrooms-in-the-heart-of-bruges','house/charming-town-house-with-3-bedrooms-in-the-heart-of-bruges','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Jeruzalemstraat 49, 8000 Brugge\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [11], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"129000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"3\", \"col2\": \"1\", \"col3\": \"90\"}]}',1,'2024-11-18 15:42:29','2024-11-18 15:42:29','905270ac-cb3b-4767-a650-b3ebb6a49344'),
(18,18,1,'1-bedroom apartment with garage for rent in Gent','1-bedroom-apartment-with-garage-for-rent-in-gent','house/1-bedroom-apartment-with-garage-for-rent-in-gent','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Oslostraat 3, 9000 Gent\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [8], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"87500\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"1\", \"col2\": \"1\", \"col3\": \"62\"}]}',1,'2024-11-18 15:42:32','2024-11-18 15:42:32','0bb788fd-0cee-4549-bb8b-05603cfea135'),
(20,20,1,'Apartement in Gent with 2 terraces and water view','apartement-in-gent-with-2-terraces-and-water-view','house/apartement-in-gent-with-2-terraces-and-water-view','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Coupure Rechts 490, 9000 Gent\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [4], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"32000000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"1\", \"col2\": \"1\", \"col3\": \"70\"}]}',1,'2024-11-18 15:42:38','2024-11-18 15:42:38','d534566a-c3e3-4531-b0d0-c59fa939e364'),
(21,21,1,'Apartement in Gent with 2 terraces and water view','apartement-in-gent-with-2-terraces-and-water-view','house/apartement-in-gent-with-2-terraces-and-water-view','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Coupure Rechts 490, 9000 Gent\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [4], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"32000000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"1\", \"col2\": \"1\", \"col3\": \"70\"}]}',1,'2024-11-18 15:42:42','2024-11-18 15:42:42','2ad62030-3c02-40cd-9de4-d6c7b97eb2e3'),
(22,22,1,'Commercial property in the center of Vlamertinge!','commercial-property-in-the-center-of-vlamertinge','house/commercial-property-in-the-center-of-vlamertinge','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Poperingseweg 351, 8900 Ieper\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [23], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"14500000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>In Vlamertinge, this recently renovated commercial property is looking for a new owner. Thanks to its prime location, the property enjoys excellent visibility. Additionally, various local shops, public transport, and parking spaces are within easy reach.</p><p>The layout of the property is as follows: the entrance leads to a reception area, followed by a practice room. There is also a separate hallway with a guest toilet and technical room. An additional hallway provides access to a dry basement. Currently, the property operates as a beauty salon but is suitable for a variety of other professions.</p><p>Are you looking for a commercial property in a central, high-visibility location in Vlamertinge? This is your chance! Don’t hesitate—schedule your appointment and discover all the advantages on-site!</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"0\", \"col2\": \"1\", \"col3\": \"81\"}]}',1,'2024-11-18 15:43:55','2024-11-19 13:41:46','ce708c2a-de6e-4704-a8ee-3279cbc86bee'),
(23,23,1,'Office One one',NULL,NULL,NULL,1,'2024-11-18 15:46:30','2024-11-18 15:46:30','d950900b-472e-4739-aed9-2b48f9219c52'),
(24,24,1,'Commercial property in the center of Vlamertinge!','commercial-property-in-the-center-of-vlamertinge','house/commercial-property-in-the-center-of-vlamertinge','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Poperingseweg 351, 8900 Ieper\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [23], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"14500000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"0\", \"col2\": \"1\", \"col3\": \"81\"}]}',1,'2024-11-18 15:47:45','2024-11-18 15:47:45','5bd1aeab-7d06-4c06-94ea-e8e6b09b63d0'),
(25,25,1,'Commercial Building For Rent Centrum Waregem','commercial-building-for-rent-centrum-waregem','house/commercial-building-for-rent-centrum-waregem','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Stormestraat 78, 8790 Waregem\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [26], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"350000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This commercial space with a showcase window is located in a prime location in Waregem. The property spans 333 m² and is in excellent condition—ideal for entrepreneurs!</p><p>Waregem offers tremendous opportunities for new, enthusiastic business owners. Recognizing the vital role of businesses in the social and economic fabric of the city, Waregem provides optimal support and subsidies for new operators.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"0\", \"col2\": \"1\", \"col3\": \"333\"}]}',1,'2024-11-18 15:47:47','2024-11-19 13:41:34','4cced1ab-0056-4204-b367-a2937a29137a'),
(26,26,1,'Office Two one',NULL,NULL,NULL,1,'2024-11-18 15:52:56','2024-11-18 15:52:56','29f740eb-864f-431a-ba8f-92e6e3a67151'),
(27,27,1,'Commercial Building For Rent Centrum Waregem','commercial-building-for-rent-centrum-waregem','house/commercial-building-for-rent-centrum-waregem','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Stormestraat 78, 8790 Waregem\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [26], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"350000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"0\", \"col2\": \"1\", \"col3\": \"333\"}]}',1,'2024-11-18 15:53:29','2024-11-18 15:53:29','721aabc9-bdae-476a-8ae4-af908c708bbf'),
(28,28,1,'Modern farm on a spacious plot in a rural setting in Mannekensvere','modern-farm-on-a-spacious-plot-in-a-rural-setting-in-mannekensvere','house/modern-farm-on-a-spacious-plot-in-a-rural-setting-in-mannekensvere','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Rattevallestraat 21, 8433 Mannekensvere\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [29], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"179500000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>Modern Farmhouse on a Vast Plot in Rural Mannekensvere (Middelkerke)</p><p>This expansive farmhouse, situated on an equally impressive 2.2-hectare plot, is located in the peaceful village of Mannekensvere. As a picturesque district of Middelkerke, the area exudes tranquility, making it the ideal setting for a property like this.</p><p>The farmhouse features multiple sections and offers much more than just a living space.</p><p>Key Features:</p><p>Event Venue: The property boasts a spacious event hall with distinct areas, including a reception space, bar, and the main hall. A large, fully equipped kitchen is located at the back, perfect for catering to guests.<br /> <br />Glamping Area: The adjacent meadow is currently set up as a glamping zone, with private units offering a comfortable and secluded stay. The open space can be reimagined and customized to suit your vision.<br /> <br />Modern Horse Stables: The stylish and functional stables provide ample room for horses and all necessary equipment.<br /> <br />B&amp;B Potential: Necessary permits have already been secured to transform the old barns into a B&amp;B with the capacity for nine rooms, adding significant value and versatility to the property.<br /> <br />Residential Area: The living quarters include five bedrooms (four on the ground floor) and two bathrooms. The cozy living room, complete with a luxurious fireplace, is perfect for unwinding in comfort.<br /> <br />KMO Unit: A large storage facility with a high entrance gate serves as an ideal workspace or storage area for self-employed professionals or for use in activities on the estate.</p><p>This property presents a unique opportunity to combine rural living with commercial potential. Whether as a family residence, business venue, or combination of both, this modern farmhouse is truly exceptional.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"14\", \"col2\": \"5\", \"col3\": \"22864\"}]}',1,'2024-11-18 15:57:57','2024-11-19 13:41:19','4aeb8563-a695-49b9-bb47-11944b094416'),
(29,29,1,'Villa One one',NULL,NULL,NULL,1,'2024-11-18 15:58:06','2024-11-18 15:58:06','f7809dac-e7bf-4408-b832-e242568051eb'),
(30,30,1,'Modern farm on a spacious plot in a rural setting in Mannekensvere','modern-farm-on-a-spacious-plot-in-a-rural-setting-in-mannekensvere','house/modern-farm-on-a-spacious-plot-in-a-rural-setting-in-mannekensvere','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Rattevallestraat 21, 8433 Mannekensvere\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [29], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"179500000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"14\", \"col2\": \"5\", \"col3\": \"22864\"}]}',1,'2024-11-18 15:59:07','2024-11-18 15:59:07','cfafba07-387b-4c89-8c8a-68144e943cba'),
(31,31,1,'Beautiful beach house \'Ferlene\' for sale in picturesque De Haan','beautiful-beach-house-ferlene-for-sale-in-picturesque-de-haan','house/beautiful-beach-house-ferlene-for-sale-in-picturesque-de-haan','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Koninklijke Baan 76, 8420 De Haan\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [32], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"119500000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>De Haan, a picturesque seaside town on the Belgian coast, is renowned for its historic architecture and expansive sandy beaches. This charming destination exudes authenticity and boasts a rich history.</p><p>Just steps away from the beach lies this characterful villa, situated in the protected concession zone. Here, you can enjoy a unique blend of tranquility, comfort, and privacy.</p><p>The stunning beach house \\\"Ferlene\\\" underwent a complete transformation under the guidance of the renowned architectural firm Studio Pien. Original and characteristic elements were carefully preserved while the interior was entirely revamped using high-quality materials. The focus was on living comfort and refined finishes, giving the home a timeless and functional appeal, suitable for both holidays and permanent residence.</p><p>Upon entering, you’ll immediately feel at home. The spacious entrance hall, with a separate guest toilet, leads to a bright living room featuring large windows that overlook the south-facing garden with a terrace. A cozy fireplace makes the space perfect for atmospheric evenings with family and friends. The adjoining open kitchen is fully equipped, offering every convenience.</p><p>An elegant oak staircase takes you to the second floor, where you’ll find four bedrooms and two stylish bathrooms.</p><p>The ground floor provides additional functionality, including a utility room, a large laundry area with shower facilities, and a versatile space that can be used as a hobby room, TV lounge, or for other purposes.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"4\", \"col2\": \"2\", \"col3\": \"383\"}]}',1,'2024-11-18 15:59:08','2024-11-18 17:48:40','7ae9f779-8f2d-4c1e-980b-7f2b769447d5'),
(32,32,1,'Villa Two one',NULL,NULL,NULL,1,'2024-11-18 16:03:25','2024-11-18 16:03:25','3b10075e-c787-402b-94b8-3e56a5cff2e9'),
(33,33,1,'Beautiful beach house \'Ferlene\' for sale in picturesque De Haan','beautiful-beach-house-ferlene-for-sale-in-picturesque-de-haan','house/beautiful-beach-house-ferlene-for-sale-in-picturesque-de-haan','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Koninklijke Baan 76, 8420 De Haan\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [32], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"119500000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"4\", \"col2\": \"2\", \"col3\": \"383\"}]}',1,'2024-11-18 16:04:05','2024-11-18 16:04:05','81477879-79d8-41fb-84a9-3e54cc24361e'),
(34,34,1,'Beautiful beach house \'Ferlene\' for sale in picturesque De Haan','beautiful-beach-house-ferlene-for-sale-in-picturesque-de-haan','house/beautiful-beach-house-ferlene-for-sale-in-picturesque-de-haan','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Koninklijke Baan 76, 8420 De Haan\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [32], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"119500000\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"4\", \"col2\": \"2\", \"col3\": \"383\"}]}',1,'2024-11-18 17:19:37','2024-11-18 17:19:37','9ef9dbdd-536f-4f67-b5cf-121eb0a33460'),
(35,35,1,'Categories','categories','categories','{\"7c429094-b1dc-40e8-83f8-99e540aed730\": \"What type of house are your looking for?\"}',1,'2024-11-18 17:37:44','2024-11-18 17:38:58','bf0c396f-e029-4376-8839-9807b100e3c1'),
(36,36,1,'Categories','categories','categories',NULL,1,'2024-11-18 17:37:44','2024-11-18 17:37:44','3f3b656e-e956-42bb-b1e7-0202f5db493d'),
(38,38,1,'Categories','categories','categories','{\"7c429094-b1dc-40e8-83f8-99e540aed730\": \"What type of house are your looking for?\"}',1,'2024-11-18 17:38:58','2024-11-18 17:38:58','c2716054-ae87-4d36-b0d3-fd5e2bf93684'),
(39,39,1,'Locations','locations','locations','{\"7c429094-b1dc-40e8-83f8-99e540aed730\": \"A specific location in mind?\"}',1,'2024-11-18 17:42:16','2024-11-18 17:42:32','063fbdf8-ee27-474a-99e4-60c841d8ebf9'),
(40,40,1,'Locations','locations','locations',NULL,1,'2024-11-18 17:42:16','2024-11-18 17:42:16','a5ba355a-3b07-4bf9-aa40-b0fcfefb6721'),
(42,42,1,'Locations','locations','locations','{\"7c429094-b1dc-40e8-83f8-99e540aed730\": \"A specific location in mind?\"}',1,'2024-11-18 17:42:32','2024-11-18 17:42:32','dcb3f2b7-05fc-4eb1-b055-9a400803f38e'),
(44,44,1,'Beautiful beach house \'Ferlene\' for sale in picturesque De Haan','beautiful-beach-house-ferlene-for-sale-in-picturesque-de-haan','house/beautiful-beach-house-ferlene-for-sale-in-picturesque-de-haan','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Koninklijke Baan 76, 8420 De Haan\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [32], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"119500000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>De Haan, a picturesque seaside town on the Belgian coast, is renowned for its historic architecture and expansive sandy beaches. This charming destination exudes authenticity and boasts a rich history.</p><p>Just steps away from the beach lies this characterful villa, situated in the protected concession zone. Here, you can enjoy a unique blend of tranquility, comfort, and privacy.</p><p>The stunning beach house \\\"Ferlene\\\" underwent a complete transformation under the guidance of the renowned architectural firm Studio Pien. Original and characteristic elements were carefully preserved while the interior was entirely revamped using high-quality materials. The focus was on living comfort and refined finishes, giving the home a timeless and functional appeal, suitable for both holidays and permanent residence.</p><p>Upon entering, you’ll immediately feel at home. The spacious entrance hall, with a separate guest toilet, leads to a bright living room featuring large windows that overlook the south-facing garden with a terrace. A cozy fireplace makes the space perfect for atmospheric evenings with family and friends. The adjoining open kitchen is fully equipped, offering every convenience.</p><p>An elegant oak staircase takes you to the second floor, where you’ll find four bedrooms and two stylish bathrooms.</p><p>The ground floor provides additional functionality, including a utility room, a large laundry area with shower facilities, and a versatile space that can be used as a hobby room, TV lounge, or for other purposes.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"4\", \"col2\": \"2\", \"col3\": \"383\"}]}',1,'2024-11-18 17:48:40','2024-11-18 17:48:40','881facf5-4d5d-4f26-94b8-804bf064c3c4'),
(46,46,1,'Modern farm on a spacious plot in a rural setting in Mannekensvere','modern-farm-on-a-spacious-plot-in-a-rural-setting-in-mannekensvere','house/modern-farm-on-a-spacious-plot-in-a-rural-setting-in-mannekensvere','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Rattevallestraat 21, 8433 Mannekensvere\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [29], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"179500000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>Modern Farmhouse on a Vast Plot in Rural Mannekensvere (Middelkerke)</p><p>This expansive farmhouse, situated on an equally impressive 2.2-hectare plot, is located in the peaceful village of Mannekensvere. As a picturesque district of Middelkerke, the area exudes tranquility, making it the ideal setting for a property like this.</p><p>The farmhouse features multiple sections and offers much more than just a living space.</p><p>Key Features:</p><p>Event Venue: The property boasts a spacious event hall with distinct areas, including a reception space, bar, and the main hall. A large, fully equipped kitchen is located at the back, perfect for catering to guests.<br /> <br />Glamping Area: The adjacent meadow is currently set up as a glamping zone, with private units offering a comfortable and secluded stay. The open space can be reimagined and customized to suit your vision.<br /> <br />Modern Horse Stables: The stylish and functional stables provide ample room for horses and all necessary equipment.<br /> <br />B&amp;B Potential: Necessary permits have already been secured to transform the old barns into a B&amp;B with the capacity for nine rooms, adding significant value and versatility to the property.<br /> <br />Residential Area: The living quarters include five bedrooms (four on the ground floor) and two bathrooms. The cozy living room, complete with a luxurious fireplace, is perfect for unwinding in comfort.<br /> <br />KMO Unit: A large storage facility with a high entrance gate serves as an ideal workspace or storage area for self-employed professionals or for use in activities on the estate.</p><p>This property presents a unique opportunity to combine rural living with commercial potential. Whether as a family residence, business venue, or combination of both, this modern farmhouse is truly exceptional.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"14\", \"col2\": \"5\", \"col3\": \"22864\"}]}',1,'2024-11-19 13:41:19','2024-11-19 13:41:19','ec7358f2-597e-47ef-846f-e823118699da'),
(47,47,1,'Commercial Building For Rent Centrum Waregem','commercial-building-for-rent-centrum-waregem','house/commercial-building-for-rent-centrum-waregem','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Stormestraat 78, 8790 Waregem\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [26], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"350000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This commercial space with a showcase window is located in a prime location in Waregem. The property spans 333 m² and is in excellent condition—ideal for entrepreneurs!</p><p>Waregem offers tremendous opportunities for new, enthusiastic business owners. Recognizing the vital role of businesses in the social and economic fabric of the city, Waregem provides optimal support and subsidies for new operators.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"0\", \"col2\": \"1\", \"col3\": \"333\"}]}',1,'2024-11-19 13:41:34','2024-11-19 13:41:34','e0115b6a-1cf3-4ea1-bcaa-eec12a4cca2a'),
(48,48,1,'Commercial property in the center of Vlamertinge!','commercial-property-in-the-center-of-vlamertinge','house/commercial-property-in-the-center-of-vlamertinge','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Poperingseweg 351, 8900 Ieper\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [23], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"14500000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>In Vlamertinge, this recently renovated commercial property is looking for a new owner. Thanks to its prime location, the property enjoys excellent visibility. Additionally, various local shops, public transport, and parking spaces are within easy reach.</p><p>The layout of the property is as follows: the entrance leads to a reception area, followed by a practice room. There is also a separate hallway with a guest toilet and technical room. An additional hallway provides access to a dry basement. Currently, the property operates as a beauty salon but is suitable for a variety of other professions.</p><p>Are you looking for a commercial property in a central, high-visibility location in Vlamertinge? This is your chance! Don’t hesitate—schedule your appointment and discover all the advantages on-site!</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"0\", \"col2\": \"1\", \"col3\": \"81\"}]}',1,'2024-11-19 13:41:46','2024-11-19 13:41:46','f1bc1635-ed55-4c43-9c72-cf7c2f33b4cf'),
(49,49,1,'Renovated Town House in Sint-Andries','renovated-town-house-in-sint-andries','house/renovated-town-house-in-sint-andries','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Pastoriestraat 214, 8200 Brugge\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [14], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"41000000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This spacious, fully renovated family home on Pastoriestraat in Sint-Andries has everything you’re looking for: an ideal location with easy access to main roads, nearby schools, and shops. Featuring four bedrooms and two modern bathrooms, this property is perfect for a large family. The living area provides ample space, while the state-of-the-art kitchen is fully equipped with high-quality appliances. Additionally, the home boasts a large, sunny garden.</p><p>The property has been upgraded with insulated roofs, PVC windows with double glazing, and a complete electrical system update. It also includes central heating and underfloor heating powered by a new heat pump.</p><p>The sale is conducted via a specifications document, giving you full transparency about the completed works and what to expect. Please note that the included photos are for illustrative purposes only.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"4\", \"col2\": \"2\", \"col3\": \"314\"}]}',1,'2024-11-19 13:41:59','2024-11-19 13:41:59','f42e3c9a-8c82-483d-8720-540b82afb56b'),
(51,51,1,'Charming town house with 3 bedrooms in the heart of Bruges','charming-town-house-with-3-bedrooms-in-the-heart-of-bruges','house/charming-town-house-with-3-bedrooms-in-the-heart-of-bruges','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Jeruzalemstraat 49, 8000 Brugge\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [11], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"129000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This charming home, located in the historic city center of Bruges, offers all modern conveniences. Situated on a very quiet street, the property is surrounded by ample parking options in the neighboring streets.</p><p>The ground floor features an entrance hall with a toilet, a spacious dining area, a renovated open kitchen, and a bright living room with large windows that create a seamless connection between indoors and outdoors. The first floor includes two spacious bedrooms and a bathroom. On the upper floor, there is a very large and light-filled attic room. This home is ideal for a family or couple.</p><p>The property boasts high-quality finishes with many authentic elements. The kitchen is equipped with modern appliances. Its prime location in the heart of Bruges ensures that restaurants, shops, public transport, and numerous attractions are all within walking distance.</p><p>Available: January 15, 2025</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"3\", \"col2\": \"1\", \"col3\": \"90\"}]}',1,'2024-11-19 13:42:10','2024-11-19 13:42:10','a882cfb2-22ad-4ce3-94cf-f1bb943ae1da'),
(52,52,1,'1-bedroom apartment with garage for rent in Gent','1-bedroom-apartment-with-garage-for-rent-in-gent','house/1-bedroom-apartment-with-garage-for-rent-in-gent','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Oslostraat 3, 9000 Gent\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [8], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"87500\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This modern new-build apartment on the second floor, located on the quiet Oslostraat near the water, offers an ideal location with easy access to the city center. Shops, restaurants, and public transport are all within walking distance.</p><p>Upon entering the hallway, you are welcomed into a bright living room with an open kitchen, equipped with a refrigerator, combination oven, ceramic cooktop, dishwasher, extractor hood, and sink. Adjacent to the kitchen is a convenient storage room with connections for a washing machine and dryer. A large sliding door in the living room opens onto a spacious south-facing terrace. The apartment also features a comfortable bedroom, a separate toilet, and a modern bathroom with a walk-in shower and vanity unit.</p><p>This energy-efficient apartment includes central heating powered by natural gas and comes fully painted, with curtains already installed. Additionally, there is an underground parking space and a private storage unit.</p><p>The property will be available starting March 1, 2025, with a monthly rental price of €800 (apartment) + €75 (covered parking space) + €50 (common charges). Utilities (electricity, gas, and water) are the tenant\'s responsibility, and registration of residency is mandatory. The rental agreement requires a minimum term of three years, and students are not permitted.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"1\", \"col2\": \"1\", \"col3\": \"62\"}]}',1,'2024-11-19 13:42:22','2024-11-19 13:42:22','fdb457cd-9851-4009-80ff-7b1d18486ef2'),
(54,54,1,'Apartement in Gent with 2 terraces and water view','apartement-in-gent-with-2-terraces-and-water-view','house/apartement-in-gent-with-2-terraces-and-water-view','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Coupure Rechts 490, 9000 Gent\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [4], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"32000000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This stunning apartment located on Coupure Rechts offers the perfect blend of authentic character and modern comfort. Its proximity to daily necessities and public transport makes this vibrant location one of the most sought-after areas in Ghent. The city center, just a short bike ride away, will hold no secrets for you.</p><p>The spacious entrance hall with a separate cloakroom leads to the open living area, bedroom, and bathroom. The cozy living room connects seamlessly to the renovated, fully equipped kitchen, which also features a practical storage room with provisions for a washing machine. From the kitchen, you have direct access to the first terrace, offering a beautiful view of the water.</p><p>The bedroom, with ample storage options, provides access to the second terrace, perfect for enjoying the morning sun. The modern bathroom includes a walk-in shower and a single vanity unit.</p><p>With an impressive energy performance certificate (EPC label A), this apartment ensures lower-than-average energy costs. Additional benefits include a bike storage room, a private cellar, and a garage, which must be purchased for €30,000.</p><p>Don\'t miss this unique opportunity to own an energy-efficient apartment in such an attractive and desirable location. </p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"1\", \"col2\": \"1\", \"col3\": \"70\"}]}',1,'2024-11-19 13:42:33','2024-11-19 13:42:33','9a8bab68-059d-4351-a6a7-a0f7b6cda7f9'),
(55,55,1,'Beautiful beach house \'Ferlene\' for sale in picturesque De Haan','beautiful-beach-house-ferlene-for-sale-in-picturesque-de-haan','house/beautiful-beach-house-ferlene-for-sale-in-picturesque-de-haan','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Koninklijke Baan 76, 8420 De Haan\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"sale\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [32], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"119500000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>De Haan, a picturesque seaside town on the Belgian coast, is renowned for its historic architecture and expansive sandy beaches. This charming destination exudes authenticity and boasts a rich history.</p><p>Just steps away from the beach lies this characterful villa, situated in the protected concession zone. Here, you can enjoy a unique blend of tranquility, comfort, and privacy.</p><p>The stunning beach house \\\"Ferlene\\\" underwent a complete transformation under the guidance of the renowned architectural firm Studio Pien. Original and characteristic elements were carefully preserved while the interior was entirely revamped using high-quality materials. The focus was on living comfort and refined finishes, giving the home a timeless and functional appeal, suitable for both holidays and permanent residence.</p><p>Upon entering, you’ll immediately feel at home. The spacious entrance hall, with a separate guest toilet, leads to a bright living room featuring large windows that overlook the south-facing garden with a terrace. A cozy fireplace makes the space perfect for atmospheric evenings with family and friends. The adjoining open kitchen is fully equipped, offering every convenience.</p><p>An elegant oak staircase takes you to the second floor, where you’ll find four bedrooms and two stylish bathrooms.</p><p>The ground floor provides additional functionality, including a utility room, a large laundry area with shower facilities, and a versatile space that can be used as a hobby room, TV lounge, or for other purposes.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"4\", \"col2\": \"2\", \"col3\": \"383\"}]}',1,'2024-11-21 15:28:10','2024-11-21 15:28:10','38a0d983-bb1e-4ac4-b482-f55fe9f0d92e'),
(56,56,1,'Commercial Building For Rent Centrum Waregem','commercial-building-for-rent-centrum-waregem','house/commercial-building-for-rent-centrum-waregem','{\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\": \"Stormestraat 78, 8790 Waregem\", \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\": \"rent\", \"7ad139cc-5071-4e37-a169-4ccef84633ff\": [26], \"80477108-c856-4fd8-9d50-1d90c333614d\": \"350000\", \"e093782e-2050-4f9e-b3bb-816b3b208823\": \"<p>This commercial space with a showcase window is located in a prime location in Waregem. The property spans 333 m² and is in excellent condition—ideal for entrepreneurs!</p><p>Waregem offers tremendous opportunities for new, enthusiastic business owners. Recognizing the vital role of businesses in the social and economic fabric of the city, Waregem provides optimal support and subsidies for new operators.</p>\", \"e4858492-34d1-44ad-9e07-976e2c8b9730\": [{\"col1\": \"0\", \"col2\": \"1\", \"col3\": \"333\"}]}',1,'2024-11-21 15:28:14','2024-11-21 15:28:14','c2cdb858-446c-46d2-8d87-bd7a7d9f90f6');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES
(2,1,NULL,NULL,NULL,1,'2024-11-15 08:07:59',NULL,NULL,1,'2024-11-15 08:07:59','2024-11-15 08:07:59'),
(3,2,NULL,NULL,NULL,2,'2024-11-18 15:32:00',NULL,NULL,NULL,'2024-11-18 15:30:16','2024-11-18 15:32:47'),
(5,2,NULL,NULL,NULL,2,'2024-11-18 15:32:00',NULL,NULL,NULL,'2024-11-18 15:32:47','2024-11-18 15:32:47'),
(6,2,NULL,NULL,NULL,2,'2024-11-18 15:32:00',NULL,NULL,NULL,'2024-11-18 15:33:25','2024-11-18 15:33:25'),
(7,2,NULL,NULL,NULL,2,'2024-11-18 15:36:00',NULL,NULL,NULL,'2024-11-18 15:33:27','2024-11-18 15:36:39'),
(9,2,NULL,NULL,NULL,2,'2024-11-18 15:36:00',NULL,NULL,NULL,'2024-11-18 15:36:39','2024-11-18 15:36:39'),
(10,2,NULL,NULL,NULL,2,'2024-11-18 15:39:00',NULL,NULL,NULL,'2024-11-18 15:36:41','2024-11-18 15:39:57'),
(12,2,NULL,NULL,NULL,2,'2024-11-18 15:39:00',NULL,NULL,NULL,'2024-11-18 15:39:57','2024-11-18 15:39:57'),
(13,2,NULL,NULL,NULL,2,'2024-11-18 15:42:00',NULL,NULL,NULL,'2024-11-18 15:40:00','2024-11-18 15:42:21'),
(15,2,NULL,NULL,NULL,2,'2024-11-18 15:42:00',NULL,NULL,NULL,'2024-11-18 15:42:21','2024-11-18 15:42:21'),
(17,2,NULL,NULL,NULL,2,'2024-11-18 15:39:00',NULL,NULL,NULL,'2024-11-18 15:42:29','2024-11-18 15:42:29'),
(18,2,NULL,NULL,NULL,2,'2024-11-18 15:36:00',NULL,NULL,NULL,'2024-11-18 15:42:32','2024-11-18 15:42:32'),
(20,2,NULL,NULL,NULL,2,'2024-11-18 15:32:00',NULL,NULL,NULL,'2024-11-18 15:42:38','2024-11-18 15:42:38'),
(21,2,NULL,NULL,NULL,2,'2024-11-18 15:32:00',NULL,NULL,NULL,'2024-11-18 15:42:42','2024-11-18 15:42:42'),
(22,2,NULL,NULL,NULL,2,'2024-11-18 15:47:00',NULL,NULL,NULL,'2024-11-18 15:43:55','2024-11-18 15:47:45'),
(24,2,NULL,NULL,NULL,2,'2024-11-18 15:47:00',NULL,NULL,NULL,'2024-11-18 15:47:45','2024-11-18 15:47:45'),
(25,2,NULL,NULL,NULL,2,'2024-11-18 15:53:00',NULL,NULL,NULL,'2024-11-18 15:47:47','2024-11-18 15:53:29'),
(27,2,NULL,NULL,NULL,2,'2024-11-18 15:53:00',NULL,NULL,NULL,'2024-11-18 15:53:29','2024-11-18 15:53:29'),
(28,2,NULL,NULL,NULL,2,'2024-11-18 15:59:00',NULL,NULL,NULL,'2024-11-18 15:57:57','2024-11-18 15:59:07'),
(30,2,NULL,NULL,NULL,2,'2024-11-18 15:59:00',NULL,NULL,NULL,'2024-11-18 15:59:07','2024-11-18 15:59:07'),
(31,2,NULL,NULL,NULL,2,'2024-11-18 16:04:00',NULL,NULL,NULL,'2024-11-18 15:59:08','2024-11-18 16:04:05'),
(33,2,NULL,NULL,NULL,2,'2024-11-18 16:04:00',NULL,NULL,NULL,'2024-11-18 16:04:05','2024-11-18 16:04:05'),
(34,2,NULL,NULL,NULL,2,'2024-11-18 16:04:00',NULL,NULL,NULL,'2024-11-18 17:19:37','2024-11-18 17:19:37'),
(35,3,NULL,NULL,NULL,3,'2024-11-18 17:37:00',NULL,NULL,1,'2024-11-18 17:37:44','2024-11-18 17:37:44'),
(36,3,NULL,NULL,NULL,3,'2024-11-18 17:37:00',NULL,NULL,NULL,'2024-11-18 17:37:44','2024-11-18 17:37:44'),
(38,3,NULL,NULL,NULL,3,'2024-11-18 17:37:00',NULL,NULL,NULL,'2024-11-18 17:38:58','2024-11-18 17:38:58'),
(39,4,NULL,NULL,NULL,3,'2024-11-18 17:42:00',NULL,NULL,1,'2024-11-18 17:42:16','2024-11-18 17:42:16'),
(40,4,NULL,NULL,NULL,3,'2024-11-18 17:42:00',NULL,NULL,NULL,'2024-11-18 17:42:16','2024-11-18 17:42:16'),
(42,4,NULL,NULL,NULL,3,'2024-11-18 17:42:00',NULL,NULL,NULL,'2024-11-18 17:42:32','2024-11-18 17:42:32'),
(44,2,NULL,NULL,NULL,2,'2024-11-18 16:04:00',NULL,NULL,NULL,'2024-11-18 17:48:40','2024-11-18 17:48:40'),
(46,2,NULL,NULL,NULL,2,'2024-11-18 15:59:00',NULL,NULL,NULL,'2024-11-19 13:41:19','2024-11-19 13:41:19'),
(47,2,NULL,NULL,NULL,2,'2024-11-18 15:53:00',NULL,NULL,NULL,'2024-11-19 13:41:34','2024-11-19 13:41:34'),
(48,2,NULL,NULL,NULL,2,'2024-11-18 15:47:00',NULL,NULL,NULL,'2024-11-19 13:41:46','2024-11-19 13:41:46'),
(49,2,NULL,NULL,NULL,2,'2024-11-18 15:42:00',NULL,NULL,NULL,'2024-11-19 13:41:59','2024-11-19 13:41:59'),
(51,2,NULL,NULL,NULL,2,'2024-11-18 15:39:00',NULL,NULL,NULL,'2024-11-19 13:42:10','2024-11-19 13:42:10'),
(52,2,NULL,NULL,NULL,2,'2024-11-18 15:36:00',NULL,NULL,NULL,'2024-11-19 13:42:22','2024-11-19 13:42:22'),
(54,2,NULL,NULL,NULL,2,'2024-11-18 15:32:00',NULL,NULL,NULL,'2024-11-19 13:42:33','2024-11-19 13:42:33'),
(55,2,NULL,NULL,NULL,2,'2024-11-18 16:04:00',NULL,NULL,NULL,'2024-11-21 15:28:10','2024-11-21 15:28:10'),
(56,2,NULL,NULL,NULL,2,'2024-11-18 15:53:00',NULL,NULL,NULL,'2024-11-21 15:28:14','2024-11-21 15:28:14');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES
(2,1,1),
(3,1,1),
(5,1,1),
(6,1,1),
(7,1,1),
(9,1,1),
(10,1,1),
(12,1,1),
(13,1,1),
(15,1,1),
(17,1,1),
(18,1,1),
(20,1,1),
(21,1,1),
(22,1,1),
(24,1,1),
(25,1,1),
(27,1,1),
(28,1,1),
(30,1,1),
(31,1,1),
(33,1,1),
(34,1,1),
(44,1,1),
(46,1,1),
(47,1,1),
(48,1,1),
(49,1,1),
(51,1,1),
(52,1,1),
(54,1,1),
(55,1,1),
(56,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES
(1,1,'test','test','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-11-15 08:07:29','2024-11-15 08:07:29','2024-11-18 17:40:19','af810d12-eed2-4a84-80f5-1e324995b681'),
(2,2,'House','house','house','amber',1,'site',NULL,'',1,'site',NULL,1,'2024-11-18 15:22:27','2024-11-18 15:22:27',NULL,'19178fcc-602e-4e2e-a2a4-abf44f2ec6a3'),
(3,4,'Categories','categories','list','cyan',1,'site',NULL,'',1,'site',NULL,1,'2024-11-18 17:37:42','2024-11-18 17:40:14','2024-11-21 15:27:18','b949a759-e847-4c16-a602-6cd108290ff1');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES
(1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"20874150-0622-4653-b8cf-eca66f332279\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"fdef22f6-419b-4aa6-b654-d6dc9afecf89\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2024-11-15T08:06:08+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"uri\"]}','2024-11-15 08:07:29','2024-11-15 08:07:29','2024-11-18 17:40:19','3a84614b-b784-46a3-8817-30142687d13b'),
(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"13991d56-8061-47b9-91ea-b2e1816cb0dc\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"2d8e724e-88e0-4def-9fc9-22bab8f9e4d1\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2024-11-18T14:30:27+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"7ad139cc-5071-4e37-a169-4ccef84633ff\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"35c35080-108d-485f-925f-407a5ab65a22\", \"required\": false, \"dateAdded\": \"2024-11-18T15:29:45+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"4da3e556-0448-4bc0-9b29-e3a5bd276fac\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Location\", \"width\": 100, \"handle\": \"location\", \"warning\": null, \"fieldUid\": \"e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8\", \"required\": false, \"dateAdded\": \"2024-11-18T15:29:45+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"80477108-c856-4fd8-9d50-1d90c333614d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"d3b42bd7-e7fb-4536-8773-1f5957362b49\", \"required\": false, \"dateAdded\": \"2024-11-18T15:29:45+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e4858492-34d1-44ad-9e07-976e2c8b9730\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"955b3b78-0dbd-47ac-9db5-c15151bf0b94\", \"required\": false, \"dateAdded\": \"2024-11-18T15:29:45+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"502164f9-fb67-4bd6-aeb3-65b05b83b73e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"1765228e-0ad3-49c0-a7df-f552ada1e942\", \"required\": false, \"dateAdded\": \"2024-11-18T15:29:45+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e093782e-2050-4f9e-b3bb-816b3b208823\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a3917b41-5b9e-455d-82b1-9867d010e228\", \"required\": false, \"dateAdded\": \"2024-11-18T17:47:45+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2024-11-18 15:22:27','2024-11-18 17:47:45',NULL,'92ddec52-46e9-456a-8b1b-8aadff9647aa'),
(3,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"542b44e2-975d-4c45-be8d-0377f9cc5019\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"efad2db2-42a1-4e9d-8a0c-28746a546bd9\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-18T15:21:49+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2024-11-18 15:23:24','2024-11-18 15:23:24',NULL,'9d242fec-bb84-4fbd-af83-dc21b6ff6461'),
(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"cf075ac1-a5f4-4f5e-a526-73b97bded975\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"a9f0d1c0-9d9d-424d-aace-cabf008dd54f\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2024-11-18T17:36:12+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"7c429094-b1dc-40e8-83f8-99e540aed730\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Subtitle\", \"width\": 100, \"handle\": \"subtitle\", \"warning\": null, \"fieldUid\": \"e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8\", \"required\": false, \"dateAdded\": \"2024-11-18T17:37:42+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2024-11-18 17:37:42','2024-11-18 17:40:14','2024-11-21 15:27:18','7d7f8fb0-e9fe-4dd5-8f4e-a3e6d5d0e60b');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES
(1,'Cover','cover','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:5d45f9f4-7ab7-4459-926d-a8006cad4227\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:5d45f9f4-7ab7-4459-926d-a8006cad4227\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:5d45f9f4-7ab7-4459-926d-a8006cad4227\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2024-11-18 15:24:20','2024-11-18 15:33:19',NULL,'35c35080-108d-485f-925f-407a5ab65a22'),
(2,'Plain Text','plainText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-18 15:24:39','2024-11-18 15:24:39',NULL,'e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8'),
(3,'Details','details','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columns\":{\"col1\":{\"heading\":\"Bedrooms\",\"handle\":\"bedrooms\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Bathrooms\",\"handle\":\"bathrooms\",\"width\":\"\",\"type\":\"singleline\"},\"col3\":{\"heading\":\"size\",\"handle\":\"size\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\",\"col2\":\"\",\"col3\":\"\"}],\"maxRows\":1,\"minRows\":null,\"staticRows\":false}','2024-11-18 15:26:19','2024-11-18 15:33:15',NULL,'955b3b78-0dbd-47ac-9db5-c15151bf0b94'),
(4,'Price','price','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Money','{\"currency\":\"EUR\",\"defaultValue\":null,\"max\":null,\"min\":100,\"showCurrency\":true,\"size\":null}','2024-11-18 15:26:49','2024-11-18 16:18:59',NULL,'d3b42bd7-e7fb-4536-8773-1f5957362b49'),
(5,'State','state','global',NULL,NULL,0,'none',NULL,'craft\\fields\\RadioButtons','{\"options\":[{\"label\":\"Sale\",\"value\":\"sale\",\"default\":\"1\"},{\"label\":\"Rent\",\"value\":\"rent\",\"default\":\"\"}],\"customOptions\":false}','2024-11-18 15:29:39','2024-11-18 15:33:06',NULL,'1765228e-0ad3-49c0-a7df-f552ada1e942'),
(6,'Body Text','bodyText','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":\"21d6f9ae-1d22-490e-bd89-d6ded5d514ac\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-11-18 17:47:40','2024-11-18 17:47:40',NULL,'a3917b41-5b9e-455d-82b1-9867d010e228');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES
(1,'Public Schema','[]',1,'2024-11-13 16:31:55','2024-11-13 16:31:55','bfc5caff-33ac-495a-8336-7abe2887b021');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES
(1,'5.5.2','5.5.0.0',0,'dymbdknycabs','3@bucmjcjlpz','2024-11-04 16:26:23','2024-11-21 15:27:18','22986c9e-5dc2-4f9f-8235-7d7d5810a0e3');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `mapbox_addresses`
--

LOCK TABLES `mapbox_addresses` WRITE;
/*!40000 ALTER TABLE `mapbox_addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mapbox_addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'craft','Install','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','795b2386-50a8-482d-9d97-02a5094b3735'),
(2,'craft','m221101_115859_create_entries_authors_table','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','eba572bc-043c-40cc-9551-c0f4b909c737'),
(3,'craft','m221107_112121_add_max_authors_to_sections','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','b4ab9fc4-4242-499e-b751-c8a78762bbdd'),
(4,'craft','m221205_082005_translatable_asset_alt_text','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','14c76a49-4711-4447-b9cc-6030b0e20dff'),
(5,'craft','m230314_110309_add_authenticator_table','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','a990f455-868c-4739-890d-163e4b5d2b2c'),
(6,'craft','m230314_111234_add_webauthn_table','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','c71cd041-62cb-47f2-a6a5-63ec21911324'),
(7,'craft','m230503_120303_add_recoverycodes_table','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','16d1efe5-2817-46aa-9f8a-567a0b955c59'),
(8,'craft','m230511_000000_field_layout_configs','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','af84d98e-6a3b-405b-95cb-71967e5ffcb9'),
(9,'craft','m230511_215903_content_refactor','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','055cb0d7-f20f-4da8-80f7-401877108bbb'),
(10,'craft','m230524_000000_add_entry_type_show_slug_field','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','e3fb2d57-4bd5-4791-8824-4e5e366f899c'),
(11,'craft','m230524_000001_entry_type_icons','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','4b606ac1-cdb6-464b-a1ed-f52cdecaa036'),
(12,'craft','m230524_000002_entry_type_colors','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','b9233a46-9371-4180-873a-3d2e46cd609e'),
(13,'craft','m230524_220029_global_entry_types','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','cf79bfab-88c8-4b21-8bad-b2759f1f7ce6'),
(14,'craft','m230531_123004_add_entry_type_show_status_field','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','463e6e35-6bc7-4b81-a5b3-9c0236ac1d6c'),
(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','533eabf1-b9ed-4702-8e7f-1307e8c5ba6a'),
(16,'craft','m230616_173810_kill_field_groups','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','2db13a01-da8c-4059-8877-8b3fb620bdd7'),
(17,'craft','m230616_183820_remove_field_name_limit','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','8e911dff-e6c8-4793-b650-c3a94d771d24'),
(18,'craft','m230617_070415_entrify_matrix_blocks','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','fd37b094-bdd6-4ff7-8f73-086256e5b2bc'),
(19,'craft','m230710_162700_element_activity','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','6449054f-0615-4ba9-847f-53986078895e'),
(20,'craft','m230820_162023_fix_cache_id_type','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','f3756a2b-d256-45a4-be7e-08038fa7567c'),
(21,'craft','m230826_094050_fix_session_id_type','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','8915cac4-529c-4081-b500-695a7b6eec7e'),
(22,'craft','m230904_190356_address_fields','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','6b79e63e-f1cf-49de-9504-ec081ae158d3'),
(23,'craft','m230928_144045_add_subpath_to_volumes','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','77b4fc10-83c5-479b-8c38-6d58f06013e9'),
(24,'craft','m231013_185640_changedfields_amend_primary_key','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','131da159-538b-4c57-bd78-a7a49fd4e05e'),
(25,'craft','m231213_030600_element_bulk_ops','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','d90e036a-ad05-4603-9e08-8caed18027ee'),
(26,'craft','m240129_150719_sites_language_amend_length','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','e3c00d32-e217-4ce8-b283-29dcb629c7f4'),
(27,'craft','m240206_035135_convert_json_columns','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','50a3b3be-de0d-4d65-aba3-b01c427214c6'),
(28,'craft','m240207_182452_address_line_3','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','926cc285-06c2-4a9e-93e3-a62368361eb8'),
(29,'craft','m240302_212719_solo_preview_targets','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','8546834e-b87c-43e1-9ab8-085175ca9f0b'),
(30,'craft','m240619_091352_add_auth_2fa_timestamp','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','84e98d7b-060a-4fc2-984b-909f7156d4d4'),
(31,'craft','m240723_214330_drop_bulkop_fk','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','89b94887-a35e-4b17-ac25-e8afc50083b7'),
(32,'craft','m240731_053543_soft_delete_fields','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','d564679e-88fb-47f6-a368-97f2ab3774b1'),
(33,'craft','m240805_154041_sso_identities','2024-11-04 16:26:24','2024-11-04 16:26:24','2024-11-04 16:26:24','c399c86e-110a-4260-872a-e1c10f37862f'),
(34,'craft','m240926_202248_track_entries_deleted_with_section','2024-11-15 08:07:01','2024-11-15 08:07:01','2024-11-15 08:07:01','7f162d7f-ee58-46c0-abc1-00cb8caad649'),
(35,'plugin:ckeditor','Install','2024-11-15 08:12:41','2024-11-15 08:12:41','2024-11-15 08:12:41','6ac24155-5b10-4b17-bd54-0d6af1e27181'),
(36,'plugin:ckeditor','m230408_163704_v3_upgrade','2024-11-15 08:12:41','2024-11-15 08:12:41','2024-11-15 08:12:41','98378f82-d87a-4ed0-8ec4-0b4379ae38dc'),
(37,'plugin:mapbox','Install','2024-11-21 15:17:40','2024-11-21 15:17:40','2024-11-21 15:17:40','84e2a63e-ded5-4cdd-b321-a00352e3b350'),
(38,'plugin:mapbox','m230720_223501_add_subfields','2024-11-21 15:17:40','2024-11-21 15:17:40','2024-11-21 15:17:40','a91051ce-f637-4753-aba1-04a581955e2e'),
(39,'plugin:mapbox','m231009_212501_announcements_v1_1','2024-11-21 15:17:40','2024-11-21 15:17:40','2024-11-21 15:17:40','e95ff3f2-0dc4-4ad7-8521-e7404c46a656');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES
(1,'vite','5.0.1','1.0.0','2024-11-04 16:26:23','2024-11-04 16:26:23','2024-11-04 16:26:23','1b05da83-a882-4daf-8fa7-fd5ca44aa3c1'),
(2,'ckeditor','4.4.0','3.0.0.0','2024-11-15 08:12:41','2024-11-15 08:12:41','2024-11-15 08:12:41','7b4bf92d-558e-4b7b-8b04-9b333be077a1'),
(3,'mapbox','2.0.0','1.1.0','2024-11-21 15:17:40','2024-11-21 15:17:40','2024-11-21 15:17:40','e3f0b103-012c-4d09-ad2f-66ed34a84a81');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES
('ckeditor.configs.21d6f9ae-1d22-490e-bd89-d6ded5d514ac.headingLevels.0','3'),
('ckeditor.configs.21d6f9ae-1d22-490e-bd89-d6ded5d514ac.headingLevels.1','4'),
('ckeditor.configs.21d6f9ae-1d22-490e-bd89-d6ded5d514ac.name','\"body text\"'),
('ckeditor.configs.21d6f9ae-1d22-490e-bd89-d6ded5d514ac.toolbar.0','\"heading\"'),
('ckeditor.configs.21d6f9ae-1d22-490e-bd89-d6ded5d514ac.toolbar.1','\"|\"'),
('ckeditor.configs.21d6f9ae-1d22-490e-bd89-d6ded5d514ac.toolbar.2','\"bold\"'),
('ckeditor.configs.21d6f9ae-1d22-490e-bd89-d6ded5d514ac.toolbar.3','\"italic\"'),
('ckeditor.configs.21d6f9ae-1d22-490e-bd89-d6ded5d514ac.toolbar.4','\"link\"'),
('dateModified','1732202838'),
('email.fromEmail','\"voornaam.naam@howest.be\"'),
('email.fromName','\"Craft Template\"'),
('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.color','\"amber\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elementCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.autocomplete','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.autocorrect','true'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.class','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.dateAdded','\"2024-11-18T14:30:27+00:00\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.disabled','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.elementCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.id','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.includeInCards','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.inputType','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.instructions','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.label','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.max','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.min','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.name','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.orientation','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.placeholder','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.readonly','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.required','true'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.size','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.step','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.tip','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.title','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.uid','\"2d8e724e-88e0-4def-9fc9-22bab8f9e4d1\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.userCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.warning','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.0.width','100'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.dateAdded','\"2024-11-18T15:29:45+00:00\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.elementCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.fieldUid','\"35c35080-108d-485f-925f-407a5ab65a22\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.handle','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.includeInCards','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.instructions','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.label','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.required','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.tip','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.uid','\"7ad139cc-5071-4e37-a169-4ccef84633ff\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.userCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.warning','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.1.width','100'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.dateAdded','\"2024-11-18T15:29:45+00:00\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.elementCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.fieldUid','\"e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.handle','\"location\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.includeInCards','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.instructions','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.label','\"Location\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.required','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.tip','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.uid','\"4da3e556-0448-4bc0-9b29-e3a5bd276fac\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.userCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.warning','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.2.width','100'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.dateAdded','\"2024-11-18T15:29:45+00:00\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.elementCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.fieldUid','\"d3b42bd7-e7fb-4536-8773-1f5957362b49\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.handle','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.includeInCards','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.instructions','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.label','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.required','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.tip','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.uid','\"80477108-c856-4fd8-9d50-1d90c333614d\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.userCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.warning','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.3.width','100'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.dateAdded','\"2024-11-18T15:29:45+00:00\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.elementCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.fieldUid','\"955b3b78-0dbd-47ac-9db5-c15151bf0b94\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.handle','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.includeInCards','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.instructions','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.label','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.providesThumbs','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.required','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.tip','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.uid','\"e4858492-34d1-44ad-9e07-976e2c8b9730\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.userCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.warning','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.4.width','100'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.dateAdded','\"2024-11-18T15:29:45+00:00\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.elementCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.fieldUid','\"1765228e-0ad3-49c0-a7df-f552ada1e942\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.handle','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.includeInCards','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.instructions','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.label','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.providesThumbs','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.required','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.tip','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.uid','\"502164f9-fb67-4bd6-aeb3-65b05b83b73e\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.userCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.warning','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.5.width','100'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.dateAdded','\"2024-11-18T17:47:45+00:00\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.elementCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.fieldUid','\"a3917b41-5b9e-455d-82b1-9867d010e228\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.handle','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.includeInCards','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.instructions','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.label','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.providesThumbs','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.required','false'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.tip','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.uid','\"e093782e-2050-4f9e-b3bb-816b3b208823\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.userCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.warning','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.elements.6.width','100'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.name','\"Content\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.uid','\"13991d56-8061-47b9-91ea-b2e1816cb0dc\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.fieldLayouts.92ddec52-46e9-456a-8b1b-8aadff9647aa.tabs.0.userCondition','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.handle','\"house\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.hasTitleField','true'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.icon','\"house\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.name','\"House\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.showSlugField','true'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.showStatusField','true'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.slugTranslationKeyFormat','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.slugTranslationMethod','\"site\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.titleFormat','\"\"'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.titleTranslationKeyFormat','null'),
('entryTypes.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3.titleTranslationMethod','\"site\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.columnSuffix','null'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.handle','\"state\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.instructions','null'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.name','\"State\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.searchable','false'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.customOptions','false'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.0.__assoc__.0.0','\"label\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.0.__assoc__.0.1','\"Sale\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.0.__assoc__.1.0','\"value\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.0.__assoc__.1.1','\"sale\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.0.__assoc__.2.0','\"default\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.0.__assoc__.2.1','\"1\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.1.__assoc__.0.0','\"label\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.1.__assoc__.0.1','\"Rent\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.1.__assoc__.1.0','\"value\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.1.__assoc__.1.1','\"rent\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.1.__assoc__.2.0','\"default\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.settings.options.1.__assoc__.2.1','\"\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.translationKeyFormat','null'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.translationMethod','\"none\"'),
('fields.1765228e-0ad3-49c0-a7df-f552ada1e942.type','\"craft\\\\fields\\\\RadioButtons\"'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.columnSuffix','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.handle','\"cover\"'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.instructions','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.name','\"Cover\"'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.searchable','false'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.allowedKinds','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.allowSelfRelations','false'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.allowSubfolders','false'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.allowUploads','true'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.branchLimit','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.defaultUploadLocationSource','\"volume:5d45f9f4-7ab7-4459-926d-a8006cad4227\"'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.defaultUploadLocationSubpath','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.maintainHierarchy','false'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.maxRelations','1'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.minRelations','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.previewMode','\"full\"'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.restrictedDefaultUploadSubpath','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.restrictedLocationSource','\"volume:5d45f9f4-7ab7-4459-926d-a8006cad4227\"'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.restrictedLocationSubpath','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.restrictFiles','false'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.restrictLocation','false'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.selectionLabel','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.showCardsInGrid','false'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.showSiteMenu','true'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.showUnpermittedFiles','false'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.showUnpermittedVolumes','false'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.sources.0','\"volume:5d45f9f4-7ab7-4459-926d-a8006cad4227\"'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.targetSiteId','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.validateRelatedElements','false'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.settings.viewMode','\"large\"'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.translationKeyFormat','null'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.translationMethod','\"none\"'),
('fields.35c35080-108d-485f-925f-407a5ab65a22.type','\"craft\\\\fields\\\\Assets\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.columnSuffix','null'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.handle','\"details\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.instructions','null'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.name','\"Details\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.searchable','false'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.addRowLabel','\"Add a row\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.0.0','\"col1\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Bedrooms\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.0.1.__assoc__.1.1','\"bedrooms\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.1.0','\"col2\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Bathrooms\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.1.1.__assoc__.1.1','\"bathrooms\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.2.0','\"col3\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.2.1.__assoc__.0.0','\"heading\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.2.1.__assoc__.0.1','\"size\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.2.1.__assoc__.1.0','\"handle\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.2.1.__assoc__.1.1','\"size\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.2.1.__assoc__.2.0','\"width\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.2.1.__assoc__.2.1','\"\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.2.1.__assoc__.3.0','\"type\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.columns.__assoc__.2.1.__assoc__.3.1','\"singleline\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.defaults.0.__assoc__.0.0','\"col1\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.defaults.0.__assoc__.0.1','\"\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.defaults.0.__assoc__.1.0','\"col2\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.defaults.0.__assoc__.1.1','\"\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.defaults.0.__assoc__.2.0','\"col3\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.defaults.0.__assoc__.2.1','\"\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.maxRows','1'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.minRows','null'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.settings.staticRows','false'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.translationKeyFormat','null'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.translationMethod','\"none\"'),
('fields.955b3b78-0dbd-47ac-9db5-c15151bf0b94.type','\"craft\\\\fields\\\\Table\"'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.columnSuffix','null'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.handle','\"bodyText\"'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.instructions','null'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.name','\"Body Text\"'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.searchable','false'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.availableTransforms','\"\"'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.availableVolumes','\"*\"'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.ckeConfig','\"21d6f9ae-1d22-490e-bd89-d6ded5d514ac\"'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.createButtonLabel','null'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.defaultTransform','null'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.enableSourceEditingForNonAdmins','false'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.purifierConfig','null'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.purifyHtml','true'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.showUnpermittedFiles','false'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.showUnpermittedVolumes','false'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.showWordCount','false'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.settings.wordLimit','null'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.translationKeyFormat','null'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.translationMethod','\"none\"'),
('fields.a3917b41-5b9e-455d-82b1-9867d010e228.type','\"craft\\\\ckeditor\\\\Field\"'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.columnSuffix','null'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.handle','\"price\"'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.instructions','null'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.name','\"Price\"'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.searchable','false'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.settings.currency','\"EUR\"'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.settings.defaultValue','null'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.settings.max','null'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.settings.min','100'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.settings.showCurrency','true'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.settings.size','null'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.translationKeyFormat','null'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.translationMethod','\"none\"'),
('fields.d3b42bd7-e7fb-4536-8773-1f5957362b49.type','\"craft\\\\fields\\\\Money\"'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.columnSuffix','null'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.handle','\"plainText\"'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.instructions','null'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.name','\"Plain Text\"'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.searchable','false'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.settings.byteLimit','null'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.settings.charLimit','null'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.settings.code','false'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.settings.initialRows','4'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.settings.multiline','false'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.settings.placeholder','null'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.settings.uiMode','\"normal\"'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.translationKeyFormat','null'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.translationMethod','\"none\"'),
('fields.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8.type','\"craft\\\\fields\\\\PlainText\"'),
('fs.local.hasUrls','true'),
('fs.local.name','\"Local\"'),
('fs.local.settings.path','\"@webroot/local\"'),
('fs.local.type','\"craft\\\\fs\\\\Local\"'),
('fs.local.url','\"@web/local\"'),
('graphql.schemas.bfc5caff-33ac-495a-8336-7abe2887b021.isPublic','true'),
('graphql.schemas.bfc5caff-33ac-495a-8336-7abe2887b021.name','\"Public Schema\"'),
('meta.__names__.1094b8b3-5e0b-4264-b997-5e1e4110a127','\"House\"'),
('meta.__names__.10d2260b-dd05-4a49-abb3-800017e15928','\"Craft Template\"'),
('meta.__names__.1765228e-0ad3-49c0-a7df-f552ada1e942','\"State\"'),
('meta.__names__.19178fcc-602e-4e2e-a2a4-abf44f2ec6a3','\"House\"'),
('meta.__names__.21d6f9ae-1d22-490e-bd89-d6ded5d514ac','\"body text\"'),
('meta.__names__.35c35080-108d-485f-925f-407a5ab65a22','\"Cover\"'),
('meta.__names__.5d45f9f4-7ab7-4459-926d-a8006cad4227','\"Images\"'),
('meta.__names__.955b3b78-0dbd-47ac-9db5-c15151bf0b94','\"Details\"'),
('meta.__names__.a3917b41-5b9e-455d-82b1-9867d010e228','\"Body Text\"'),
('meta.__names__.bfc5caff-33ac-495a-8336-7abe2887b021','\"Public Schema\"'),
('meta.__names__.d3b42bd7-e7fb-4536-8773-1f5957362b49','\"Price\"'),
('meta.__names__.e2e222ba-6107-4ebe-ba6f-c26cc3a40dd8','\"Plain Text\"'),
('meta.__names__.f6eaef1f-2f88-4856-8eee-c5ae9620f572','\"Craft Template\"'),
('plugins.ckeditor.edition','\"standard\"'),
('plugins.ckeditor.enabled','true'),
('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),
('plugins.mapbox.edition','\"standard\"'),
('plugins.mapbox.enabled','true'),
('plugins.mapbox.schemaVersion','\"1.1.0\"'),
('plugins.mapbox.settings.accessToken','null'),
('plugins.mapbox.settings.enableJsLogging','true'),
('plugins.mapbox.settings.minifyJsFiles','false'),
('plugins.vite.edition','\"standard\"'),
('plugins.vite.enabled','true'),
('plugins.vite.schemaVersion','\"1.0.0\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.defaultPlacement','\"end\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.enableVersioning','true'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.entryTypes.0','\"19178fcc-602e-4e2e-a2a4-abf44f2ec6a3\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.handle','\"house\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.maxAuthors','1'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.name','\"House\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.propagationMethod','\"all\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.siteSettings.f6eaef1f-2f88-4856-8eee-c5ae9620f572.enabledByDefault','true'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.siteSettings.f6eaef1f-2f88-4856-8eee-c5ae9620f572.hasUrls','true'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.siteSettings.f6eaef1f-2f88-4856-8eee-c5ae9620f572.template','\"house/_entry.twig\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.siteSettings.f6eaef1f-2f88-4856-8eee-c5ae9620f572.uriFormat','\"house/{slug}\"'),
('sections.1094b8b3-5e0b-4264-b997-5e1e4110a127.type','\"channel\"'),
('siteGroups.10d2260b-dd05-4a49-abb3-800017e15928.name','\"Craft Template\"'),
('sites.f6eaef1f-2f88-4856-8eee-c5ae9620f572.baseUrl','\"$PRIMARY_SITE_URL\"'),
('sites.f6eaef1f-2f88-4856-8eee-c5ae9620f572.enabled','true'),
('sites.f6eaef1f-2f88-4856-8eee-c5ae9620f572.handle','\"default\"'),
('sites.f6eaef1f-2f88-4856-8eee-c5ae9620f572.hasUrls','true'),
('sites.f6eaef1f-2f88-4856-8eee-c5ae9620f572.language','\"en-US\"'),
('sites.f6eaef1f-2f88-4856-8eee-c5ae9620f572.name','\"Craft Template\"'),
('sites.f6eaef1f-2f88-4856-8eee-c5ae9620f572.primary','true'),
('sites.f6eaef1f-2f88-4856-8eee-c5ae9620f572.siteGroup','\"10d2260b-dd05-4a49-abb3-800017e15928\"'),
('sites.f6eaef1f-2f88-4856-8eee-c5ae9620f572.sortOrder','1'),
('system.edition','\"solo\"'),
('system.live','true'),
('system.name','\"Craft Template\"'),
('system.schemaVersion','\"5.5.0.0\"'),
('system.timeZone','\"America/Los_Angeles\"'),
('users.allowPublicRegistration','false'),
('users.defaultGroup','null'),
('users.photoSubpath','null'),
('users.photoVolumeUid','null'),
('users.require2fa','false'),
('users.requireEmailVerification','true'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.altTranslationKeyFormat','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.altTranslationMethod','\"none\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elementCondition','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.autocapitalize','true'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.autocomplete','false'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.autocorrect','true'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.class','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.dateAdded','\"2024-11-18T15:21:49+00:00\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.disabled','false'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.elementCondition','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.id','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.includeInCards','false'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.inputType','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.instructions','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.label','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.max','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.min','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.name','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.orientation','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.placeholder','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.providesThumbs','false'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.readonly','false'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.requirable','false'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.size','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.step','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.tip','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.title','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.uid','\"efad2db2-42a1-4e9d-8a0c-28746a546bd9\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.userCondition','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.warning','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.elements.0.width','100'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.name','\"Content\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.uid','\"542b44e2-975d-4c45-be8d-0377f9cc5019\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fieldLayouts.9d242fec-bb84-4fbd-af83-dc21b6ff6461.tabs.0.userCondition','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.fs','\"local\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.handle','\"images\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.name','\"Images\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.sortOrder','1'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.subpath','\"images\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.titleTranslationKeyFormat','null'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.titleTranslationMethod','\"site\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.transformFs','\"\"'),
('volumes.5d45f9f4-7ab7-4459-926d-a8006cad4227.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES
(1,1,3,NULL,4,1,'2024-11-18 15:32:20','2024-11-18 15:32:20','420c625b-f5fc-4ee2-923d-7f83bd865de2'),
(2,1,5,NULL,4,1,'2024-11-18 15:32:47','2024-11-18 15:32:47','7f9ab0ed-ba8c-42d6-98d9-7ab4c1c1818b'),
(3,1,6,NULL,4,1,'2024-11-18 15:33:25','2024-11-18 15:33:25','258fcf8f-ceb0-433a-a06b-c28aba2105d7'),
(4,1,7,NULL,8,1,'2024-11-18 15:36:05','2024-11-18 15:36:05','c1819739-c0b7-4de6-9cf0-e8836f71c8a8'),
(5,1,9,NULL,8,1,'2024-11-18 15:36:39','2024-11-18 15:36:39','43ea7a8e-dfd7-4e61-a255-b91242fd2386'),
(6,1,10,NULL,11,1,'2024-11-18 15:39:11','2024-11-18 15:39:11','544062c5-8e5b-4ede-a44d-8ca1b7d52a82'),
(7,1,12,NULL,11,1,'2024-11-18 15:39:57','2024-11-18 15:39:57','7dfde130-e651-41ad-abc0-f3a38c2cc900'),
(8,1,13,NULL,14,1,'2024-11-18 15:41:49','2024-11-18 15:41:49','b269b731-e45e-4aee-8721-618bfc197a61'),
(9,1,15,NULL,14,1,'2024-11-18 15:42:21','2024-11-18 15:42:21','2d4b700f-db76-46e1-b731-ef99ab86e637'),
(11,1,17,NULL,11,1,'2024-11-18 15:42:29','2024-11-18 15:42:29','590f5e5f-e0a3-42ae-a8af-e00dd4896301'),
(12,1,18,NULL,8,1,'2024-11-18 15:42:32','2024-11-18 15:42:32','485d29d7-0f74-441e-8b72-9efdf21e93c9'),
(14,1,20,NULL,4,1,'2024-11-18 15:42:38','2024-11-18 15:42:38','639d6738-9e7d-492f-a3bb-e23b187e36af'),
(15,1,21,NULL,4,1,'2024-11-18 15:42:42','2024-11-18 15:42:42','48a03fb9-700b-4d60-9c66-c8385c142ae2'),
(16,1,22,NULL,23,1,'2024-11-18 15:46:30','2024-11-18 15:46:30','a397090e-faa3-484b-b829-97dc55df1032'),
(17,1,24,NULL,23,1,'2024-11-18 15:47:45','2024-11-18 15:47:45','2e748488-5ab1-4501-89cf-162f01cdb6bf'),
(18,1,25,NULL,26,1,'2024-11-18 15:52:56','2024-11-18 15:52:56','3f9d1bf8-2b6c-461b-ada5-e0a130053a1a'),
(19,1,27,NULL,26,1,'2024-11-18 15:53:29','2024-11-18 15:53:29','e68d2580-0510-48c0-84f2-2e1bc1e294c2'),
(20,1,28,NULL,29,1,'2024-11-18 15:58:07','2024-11-18 15:58:07','eb2a23c3-83e2-46e1-957a-2ca76521430e'),
(21,1,30,NULL,29,1,'2024-11-18 15:59:07','2024-11-18 15:59:07','e12ec3d3-16ce-4541-a791-71e58c82ea99'),
(22,1,31,NULL,32,1,'2024-11-18 16:03:25','2024-11-18 16:03:25','447ac908-3d00-4e7a-b59a-79915bc16134'),
(23,1,33,NULL,32,1,'2024-11-18 16:04:05','2024-11-18 16:04:05','e540d96d-9927-4090-a889-e068ce32d219'),
(24,1,34,NULL,32,1,'2024-11-18 17:19:37','2024-11-18 17:19:37','a7ba6c5a-3808-43eb-94f6-3df40e9d5fbf'),
(26,1,44,NULL,32,1,'2024-11-18 17:48:40','2024-11-18 17:48:40','03c606ac-ca6f-4844-8177-692e77491a29'),
(28,1,46,NULL,29,1,'2024-11-19 13:41:19','2024-11-19 13:41:19','196c4968-e8b6-4bc8-acc1-23f806396fee'),
(29,1,47,NULL,26,1,'2024-11-19 13:41:34','2024-11-19 13:41:34','eafede7c-9489-4ef6-bfed-a1df0ce7f8a7'),
(30,1,48,NULL,23,1,'2024-11-19 13:41:46','2024-11-19 13:41:46','1fb86ed9-9ab0-477d-bcc2-8f334db830eb'),
(31,1,49,NULL,14,1,'2024-11-19 13:41:59','2024-11-19 13:41:59','65711acf-21d8-478b-ae8d-442d7a1baec8'),
(33,1,51,NULL,11,1,'2024-11-19 13:42:10','2024-11-19 13:42:10','e81b2084-030d-4f91-b3ef-0f871124e236'),
(34,1,52,NULL,8,1,'2024-11-19 13:42:22','2024-11-19 13:42:22','2f8565a0-6c37-42c4-a083-85fe3b090972'),
(36,1,54,NULL,4,1,'2024-11-19 13:42:33','2024-11-19 13:42:33','2c0c8101-878a-47cb-b88e-7d0ff8b17d1b'),
(37,1,55,NULL,32,1,'2024-11-21 15:28:10','2024-11-21 15:28:10','80df7612-683c-41eb-84a8-d9e67bb74036'),
(38,1,56,NULL,26,1,'2024-11-21 15:28:14','2024-11-21 15:28:14','8c70541c-d6ba-481c-bf80-1587c36f6a6f');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES
(1,3,1,1,''),
(2,3,1,2,''),
(3,7,1,1,''),
(4,10,1,1,''),
(5,13,1,1,''),
(6,10,1,2,'Applied “Draft 1”'),
(7,7,1,2,''),
(8,3,1,3,'Applied “Draft 1”'),
(9,3,1,4,''),
(10,22,1,1,''),
(11,25,1,1,''),
(12,28,1,1,''),
(13,31,1,1,''),
(14,31,1,2,''),
(15,35,1,1,NULL),
(16,35,1,2,'Applied “Draft 1”'),
(17,39,1,1,NULL),
(18,39,1,2,'Applied “Draft 1”'),
(19,31,1,3,'Applied “Draft 1”'),
(20,28,1,2,'Applied “Draft 1”'),
(21,25,1,2,''),
(22,22,1,2,''),
(23,13,1,2,''),
(24,10,1,3,'Applied “Draft 1”'),
(25,7,1,3,''),
(26,3,1,5,''),
(27,31,1,4,''),
(28,25,1,3,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES
(1,'email',0,1,' admin admin be '),
(1,'firstname',0,1,''),
(1,'fullname',0,1,''),
(1,'lastname',0,1,''),
(1,'slug',0,1,''),
(1,'username',0,1,' admin '),
(2,'slug',0,1,' temp aqsgyuyxzqqnvtjrqrepsluqdqacolplgovw '),
(2,'title',0,1,''),
(3,'slug',0,1,' apartement in gent with 2 terraces and water view '),
(3,'title',0,1,' apartement in gent with 2 terraces and water view '),
(4,'alt',0,1,''),
(4,'extension',0,1,' jpg '),
(4,'filename',0,1,' aptone one jpg '),
(4,'kind',0,1,' image '),
(4,'slug',0,1,''),
(4,'title',0,1,' apt one one '),
(7,'slug',0,1,' 1 bedroom apartment with garage for rent in gent '),
(7,'title',0,1,' 1 bedroom apartment with garage for rent in gent '),
(8,'alt',0,1,''),
(8,'extension',0,1,' jpg '),
(8,'filename',0,1,' apttwo one jpg '),
(8,'kind',0,1,' image '),
(8,'slug',0,1,''),
(8,'title',0,1,' apt two one '),
(10,'slug',0,1,' charming town house with 3 bedrooms in the heart of bruges '),
(10,'title',0,1,' charming town house with 3 bedrooms in the heart of bruges '),
(11,'alt',0,1,''),
(11,'extension',0,1,' png '),
(11,'filename',0,1,' houseone one png '),
(11,'kind',0,1,' image '),
(11,'slug',0,1,''),
(11,'title',0,1,' house one one '),
(13,'slug',0,1,' renovated town house in sint andries '),
(13,'title',0,1,' renovated town house in sint andries '),
(14,'alt',0,1,''),
(14,'extension',0,1,' jpg '),
(14,'filename',0,1,' houwetwo one jpg '),
(14,'kind',0,1,' image '),
(14,'slug',0,1,''),
(14,'title',0,1,' houwe two one '),
(22,'slug',0,1,' commercial property in the center of vlamertinge '),
(22,'title',0,1,' commercial property in the center of vlamertinge '),
(23,'alt',0,1,''),
(23,'extension',0,1,' jpeg '),
(23,'filename',0,1,' officeone one jpeg '),
(23,'kind',0,1,' image '),
(23,'slug',0,1,''),
(23,'title',0,1,' office one one '),
(25,'slug',0,1,' commercial building for rent centrum waregem '),
(25,'title',0,1,' commercial building for rent centrum waregem '),
(26,'alt',0,1,''),
(26,'extension',0,1,' jpg '),
(26,'filename',0,1,' officetwo one jpg '),
(26,'kind',0,1,' image '),
(26,'slug',0,1,''),
(26,'title',0,1,' office two one '),
(28,'slug',0,1,' modern farm on a spacious plot in a rural setting in mannekensvere '),
(28,'title',0,1,' modern farm on a spacious plot in a rural setting in mannekensvere '),
(29,'alt',0,1,''),
(29,'extension',0,1,' jpg '),
(29,'filename',0,1,' villaone one jpg '),
(29,'kind',0,1,' image '),
(29,'slug',0,1,''),
(29,'title',0,1,' villa one one '),
(31,'slug',0,1,' beautiful beach house ferlene for sale in picturesque de haan '),
(31,'title',0,1,' beautiful beach house ferlene for sale in picturesque de haan '),
(32,'alt',0,1,''),
(32,'extension',0,1,' jpg '),
(32,'filename',0,1,' villatwo one jpg '),
(32,'kind',0,1,' image '),
(32,'slug',0,1,''),
(32,'title',0,1,' villa two one '),
(35,'slug',0,1,' categories '),
(35,'title',0,1,' categories '),
(39,'slug',0,1,' locations '),
(39,'title',0,1,' locations ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES
(1,NULL,'test','test','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-15 08:07:55','2024-11-15 08:07:55','2024-11-15 08:11:17','a8d1afd2-5f1c-4b28-bfdd-a8d9dc71e90d'),
(2,NULL,'House','house','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-18 15:22:29','2024-11-18 15:22:29',NULL,'1094b8b3-5e0b-4264-b997-5e1e4110a127'),
(3,NULL,'Categories','categories','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-18 17:37:44','2024-11-18 17:37:44','2024-11-21 15:27:11','147509fa-bc87-4890-bde3-d9be05aa0773'),
(4,NULL,'Locations','locations','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-18 17:42:16','2024-11-18 17:42:16','2024-11-21 15:27:08','d5937fce-fbc7-4452-bbd2-0c44c53d0f08');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES
(1,1,1),
(2,2,1),
(3,3,1),
(4,3,1);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES
(1,1,1,1,'test/{slug}','test/_entry.twig',1,'2024-11-15 08:07:55','2024-11-15 08:07:55','d1150f3d-364a-40de-ad3c-98cffdf1478a'),
(2,2,1,1,'house/{slug}','house/_entry.twig',1,'2024-11-18 15:22:29','2024-11-18 15:22:29','7195f33a-a316-405a-81d6-eeaac1977cdc'),
(3,3,1,1,'categories','_single/categories.twig',1,'2024-11-18 17:37:44','2024-11-18 17:37:44','bad8aa98-24d7-48e7-bd94-7eb985dfaf49'),
(4,4,1,1,'locations','_single/locations.twig',1,'2024-11-18 17:42:16','2024-11-18 17:42:16','1f74d1f5-f75d-473f-9c6e-9d5601c612e1');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES
(1,'Craft Template','2024-11-04 16:26:23','2024-11-04 16:26:23',NULL,'10d2260b-dd05-4a49-abb3-800017e15928');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES
(1,1,1,'1','Craft Template','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-11-04 16:26:23','2024-11-04 16:26:23',NULL,'f6eaef1f-2f88-4856-8eee-c5ae9620f572');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES
(1,'{\"locale\": null, \"language\": \"en-US\", \"useShapes\": false, \"weekStartDay\": \"1\", \"underlineLinks\": false, \"disableAutofocus\": \"\", \"profileTemplates\": false, \"showFieldHandles\": true, \"showExceptionView\": false, \"alwaysShowFocusRings\": false, \"notificationDuration\": \"5000\", \"enableDebugToolbarForCp\": false, \"enableDebugToolbarForSite\": false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'admin@admin.be','$2y$13$AgldkKHXTDVYCyf9Iht8euIzasrFc.oLSxcpvnnm8UBkalNgnp146','2024-11-21 15:04:14',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2024-11-19 16:52:40','2024-11-04 16:26:24','2024-11-21 15:04:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES
(1,NULL,1,'Images','','2024-11-18 15:23:24','2024-11-18 15:23:24','4fca697f-8c10-4919-b263-14a4d7d498e4'),
(2,NULL,NULL,'Temporary Uploads',NULL,'2024-11-18 17:47:48','2024-11-18 17:47:48','f3d4f96e-fe6b-4263-acc1-a2b9f2aa9b92'),
(3,2,NULL,'user_1','user_1/','2024-11-18 17:47:48','2024-11-18 17:47:48','60943a1b-65f5-44d0-83e4-cac2b3c94e3f');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES
(1,3,'Images','images','local','images','','','site',NULL,'none',NULL,1,'2024-11-18 15:23:24','2024-11-18 15:23:24',NULL,'5d45f9f4-7ab7-4459-926d-a8006cad4227');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES
(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2024-11-13 10:18:19','2024-11-13 10:18:19','67980374-fc80-4e70-add8-1a717ca32c8e'),
(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-11-13 10:18:19','2024-11-13 10:18:19','8ad75c3d-2b8b-4cd4-900e-62d1fb0df891'),
(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-11-13 10:18:19','2024-11-13 10:18:19','a3ccc5c9-b7d8-42e8-a00d-ffaeb2d9ca66'),
(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2024-11-13 10:18:19','2024-11-13 10:18:19','9b1fd8ad-5fba-44af-8884-00b0e907db35');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-21 15:29:08
