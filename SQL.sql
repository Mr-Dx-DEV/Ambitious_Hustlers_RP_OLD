-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               12.0.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ahrp
CREATE DATABASE IF NOT EXISTS `ahrp` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `ahrp`;

-- Dumping structure for table ahrp.bank_accounts_new
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT NULL,
  `auth` longtext DEFAULT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.bank_accounts_new: ~26 rows (approximately)
INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('ambulance', 0, '[]', '[]', 0, NULL),
	('ballas', 0, '[]', '[]', 0, NULL),
	('bcso', 0, '[]', '[]', 0, NULL),
	('bus', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('families', 0, '[]', '[]', 0, NULL),
	('garbage', 0, '[]', '[]', 0, NULL),
	('hotdog', 0, '[]', '[]', 0, NULL),
	('judge', 0, '[]', '[]', 0, NULL),
	('lawyer', 0, '[]', '[]', 0, NULL),
	('lostmc', 0, '[]', '[]', 0, NULL),
	('mechanic', 0, '[]', '[]', 0, NULL),
	('none', 0, '[]', '[]', 0, NULL),
	('police', 0, '[]', '[]', 0, NULL),
	('rangers', 0, '[]', '[]', 0, NULL),
	('realestate', 0, '[]', '[]', 0, NULL),
	('reporter', 0, '[]', '[]', 0, NULL),
	('sahp', 0, '[]', '[]', 0, NULL),
	('sasp', 0, '[]', '[]', 0, NULL),
	('taxi', 0, '[]', '[]', 0, NULL),
	('tow', 0, '[]', '[]', 0, NULL),
	('triads', 0, '[]', '[]', 0, NULL),
	('trucker', 0, '[]', '[]', 0, NULL),
	('unemployed', 0, '[]', '[]', 0, NULL),
	('vagos', 0, '[]', '[]', 0, NULL),
	('vineyard', 0, '[]', '[]', 0, NULL);

-- Dumping structure for table ahrp.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.bans: ~0 rows (approximately)

-- Dumping structure for table ahrp.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.dealers: ~0 rows (approximately)

-- Dumping structure for table ahrp.dealership_data
CREATE TABLE IF NOT EXISTS `dealership_data` (
  `name` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `balance` float NOT NULL DEFAULT 0,
  `owner_id` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `employee_commission` int(11) DEFAULT 10,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.dealership_data: ~2 rows (approximately)
INSERT INTO `dealership_data` (`name`, `label`, `balance`, `owner_id`, `owner_name`, `employee_commission`) VALUES
	('luxury', '', 0, NULL, NULL, 10),
	('pdm', '', 0, NULL, NULL, 10);

-- Dumping structure for table ahrp.dealership_dispveh
CREATE TABLE IF NOT EXISTS `dealership_dispveh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(100) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `coords` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dispveh_dealership` (`dealership`),
  KEY `fk_dispveh_vehicle` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.dealership_dispveh: ~0 rows (approximately)

-- Dumping structure for table ahrp.dealership_employees
CREATE TABLE IF NOT EXISTS `dealership_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `dealership` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `joined` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_employees_dealership` (`dealership`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.dealership_employees: ~0 rows (approximately)

-- Dumping structure for table ahrp.dealership_orders
CREATE TABLE IF NOT EXISTS `dealership_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(100) NOT NULL,
  `dealership` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `cost` float NOT NULL DEFAULT 0,
  `delivery_time` int(11) NOT NULL,
  `order_created` datetime NOT NULL DEFAULT current_timestamp(),
  `fulfilled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `orders_vehicle_fk` (`vehicle`),
  KEY `orders_dealership_fk` (`dealership`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.dealership_orders: ~0 rows (approximately)

-- Dumping structure for table ahrp.dealership_sales
CREATE TABLE IF NOT EXISTS `dealership_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(255) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `player` varchar(255) NOT NULL,
  `seller` varchar(255) DEFAULT NULL,
  `purchase_type` varchar(50) NOT NULL,
  `paid` float NOT NULL DEFAULT 0,
  `owed` float NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_sales_vehicle` (`vehicle`),
  KEY `fk_sales_dealership` (`dealership`),
  KEY `fk_sales_player` (`player`),
  KEY `fk_sales_plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.dealership_sales: ~0 rows (approximately)

-- Dumping structure for table ahrp.dealership_stock
CREATE TABLE IF NOT EXISTS `dealership_stock` (
  `dealership` varchar(100) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`dealership`,`vehicle`),
  KEY `vehicle_fk` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.dealership_stock: ~0 rows (approximately)

-- Dumping structure for table ahrp.dealership_vehicles
CREATE TABLE IF NOT EXISTS `dealership_vehicles` (
  `spawn_code` varchar(100) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `hashkey` varchar(100) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`spawn_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.dealership_vehicles: ~0 rows (approximately)

-- Dumping structure for table ahrp.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lapraces: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_accounts
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_accounts` (
  `id` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `callsign` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_accounts: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_bulletin
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_bulletin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `lbtablet_ambulance_bulletin_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_ambulance_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_bulletin: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_conditions
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` varchar(25) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `severity` (`severity`,`category_id`,`title`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `lbtablet_ambulance_conditions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `lbtablet_ambulance_conditions_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_conditions: ~81 rows (approximately)
INSERT INTO `lbtablet_ambulance_conditions` (`id`, `severity`, `category_id`, `title`) VALUES
	(91, 'critical', 24, 'Heart Attack'),
	(92, 'critical', 24, 'Heart Failure'),
	(93, 'moderate', 24, 'Coronary Artery Disease'),
	(94, 'critical', 24, 'Stroke'),
	(95, 'minor', 24, 'Arrhythmia'),
	(96, 'minor', 24, 'High Blood Pressure'),
	(97, 'minor', 24, 'Angina'),
	(98, 'critical', 24, 'Aortic Aneurysm'),
	(99, 'moderate', 24, 'Deep Vein Thrombosis (DVT)'),
	(100, 'minor', 24, 'Peripheral Artery Disease'),
	(101, 'minor', 25, 'Broken Arm'),
	(102, 'moderate', 25, 'Broken Leg'),
	(103, 'critical', 25, 'Fractured Hip'),
	(104, 'minor', 25, 'Torn ACL'),
	(105, 'moderate', 25, 'Dislocated Shoulder'),
	(106, 'minor', 25, 'Sprained Ankle'),
	(107, 'moderate', 25, 'Herniated Disc'),
	(108, 'critical', 25, 'Pelvic Fracture'),
	(109, 'minor', 25, 'Rotator Cuff Tear'),
	(110, 'minor', 25, 'Tennis Elbow'),
	(111, 'moderate', 26, 'Appendicitis'),
	(112, 'severe', 26, 'Crohn\'s Disease'),
	(113, 'severe', 26, 'Ulcerative Colitis'),
	(114, 'minor', 26, 'Gastroesophageal Reflux Disease (GERD)'),
	(115, 'severe', 26, 'Irritable Bowel Syndrome (IBS)'),
	(116, 'moderate', 26, 'Gallstones'),
	(117, 'moderate', 26, 'Pancreatitis'),
	(118, 'minor', 26, 'Peptic Ulcer'),
	(119, 'severe', 26, 'Hepatitis C'),
	(120, 'moderate', 27, 'COVID-19'),
	(121, 'severe', 27, 'Hepatitis'),
	(122, 'severe', 27, 'HIV/AIDS'),
	(123, 'critical', 27, 'Meningitis'),
	(124, 'minor', 27, 'Influenza (Flu)'),
	(125, 'moderate', 27, 'Malaria'),
	(126, 'critical', 27, 'Ebola Virus Disease'),
	(127, 'minor', 27, 'Zika Virus'),
	(128, 'severe', 27, 'Lyme Disease'),
	(129, 'moderate', 28, 'Depression'),
	(130, 'severe', 28, 'Bipolar Disorder'),
	(131, 'minor', 28, 'Anxiety Disorder'),
	(132, 'moderate', 28, 'Post-Traumatic Stress Disorder (PTSD)'),
	(133, 'minor', 28, 'Obsessive-Compulsive Disorder (OCD)'),
	(134, 'severe', 28, 'Schizophrenia'),
	(135, 'minor', 28, 'Phobias'),
	(136, 'severe', 28, 'Eating Disorders'),
	(137, 'moderate', 28, 'Dementia'),
	(138, 'critical', 29, 'Breast Cancer'),
	(139, 'critical', 29, 'Prostate Cancer'),
	(140, 'severe', 29, 'Skin Cancer'),
	(141, 'critical', 29, 'Leukemia'),
	(142, 'critical', 29, 'Colon Cancer'),
	(143, 'critical', 29, 'Lymphoma'),
	(144, 'critical', 29, 'Pancreatic Cancer'),
	(145, 'critical', 29, 'Brain Cancer'),
	(146, 'moderate', 30, 'Pneumonia'),
	(147, 'minor', 30, 'Asthma'),
	(148, 'severe', 30, 'Chronic Obstructive Pulmonary Disease (COPD)'),
	(149, 'critical', 30, 'Lung Cancer'),
	(150, 'severe', 30, 'Tuberculosis (TB)'),
	(151, 'minor', 30, 'Sleep Apnea'),
	(152, 'minor', 30, 'Bronchitis'),
	(153, 'critical', 30, 'Pulmonary Embolism'),
	(154, 'severe', 30, 'Cystic Fibrosis'),
	(155, 'severe', 31, 'Type 1 Diabetes'),
	(156, 'severe', 31, 'Type 2 Diabetes'),
	(157, 'minor', 31, 'Thyroid Disorders'),
	(158, 'moderate', 31, 'Cushing’s Syndrome'),
	(159, 'moderate', 31, 'Adrenal Insufficiency (Addison’s Disease)'),
	(160, 'minor', 31, 'Hyperthyroidism'),
	(161, 'severe', 31, 'Polycystic Ovary Syndrome (PCOS)'),
	(162, 'minor', 32, 'Concussion'),
	(163, 'critical', 32, 'Traumatic Brain Injury'),
	(164, 'moderate', 32, 'Epilepsy'),
	(165, 'severe', 32, 'Multiple Sclerosis'),
	(166, 'severe', 32, 'Parkinson\'s Disease'),
	(167, 'severe', 32, 'Alzheimer’s Disease'),
	(168, 'minor', 32, 'Migraine'),
	(169, 'minor', 32, 'Bell’s Palsy'),
	(170, 'critical', 32, 'Spinal Cord Injury'),
	(171, 'minor', 32, 'Cluster Headaches');

-- Dumping structure for table ahrp.lbtablet_ambulance_conditions_categories
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_conditions_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_conditions_categories: ~9 rows (approximately)
INSERT INTO `lbtablet_ambulance_conditions_categories` (`id`, `title`) VALUES
	(24, 'Cardiovascular Conditions'),
	(25, 'Orthopedic Injuries'),
	(26, 'Gastrointestinal Conditions'),
	(27, 'Infectious Diseases'),
	(28, 'Mental Health Conditions'),
	(29, 'Cancer Types'),
	(30, 'Respiratory Conditions'),
	(31, 'Endocrine Disorders'),
	(32, 'Neurological Conditions');

-- Dumping structure for table ahrp.lbtablet_ambulance_logs
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` varchar(100) DEFAULT NULL,
  `related_id` varchar(500) DEFAULT NULL,
  `log_action` varchar(25) NOT NULL,
  `log_type` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_logs: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_profiles
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_profiles` (
  `id` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `notes` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_profiles: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_profile_conditions
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_profile_conditions` (
  `profile_id` varchar(100) NOT NULL,
  `condition_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`profile_id`,`condition_id`),
  KEY `condition_id` (`condition_id`),
  CONSTRAINT `lbtablet_ambulance_profile_conditions_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `lbtablet_ambulance_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_ambulance_profile_conditions_ibfk_2` FOREIGN KEY (`condition_id`) REFERENCES `lbtablet_ambulance_conditions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_profile_conditions: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_profile_tags
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_profile_tags` (
  `id` varchar(100) NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `lbtablet_ambulance_profile_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_ambulance_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_profile_tags: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_reports
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` varchar(100) NOT NULL,
  `patient` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `report_type` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `lbtablet_ambulance_reports_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_ambulance_accounts` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_reports: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_reports_attachments
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_reports_attachments` (
  `report_id` int(10) unsigned NOT NULL,
  `attachment` varchar(500) NOT NULL,
  PRIMARY KEY (`report_id`,`attachment`),
  CONSTRAINT `lbtablet_ambulance_reports_attachments_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_reports_attachments: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_reports_conditions
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_reports_conditions` (
  `report_id` int(10) unsigned NOT NULL,
  `condition_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`report_id`,`condition_id`),
  KEY `condition_id` (`condition_id`),
  CONSTRAINT `lbtablet_ambulance_reports_conditions_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_ambulance_reports_conditions_ibfk_2` FOREIGN KEY (`condition_id`) REFERENCES `lbtablet_ambulance_conditions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_reports_conditions: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_reports_doctors
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_reports_doctors` (
  `report_id` int(10) unsigned NOT NULL,
  `doctor` varchar(100) NOT NULL,
  PRIMARY KEY (`report_id`,`doctor`),
  KEY `doctor` (`doctor`),
  CONSTRAINT `lbtablet_ambulance_reports_doctors_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_ambulance_reports_doctors_ibfk_2` FOREIGN KEY (`doctor`) REFERENCES `lbtablet_ambulance_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_reports_doctors: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_reports_tags
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_reports_tags` (
  `report_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`report_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `lbtablet_ambulance_reports_tags_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_ambulance_reports_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_ambulance_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_reports_tags: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_ambulance_tags
CREATE TABLE IF NOT EXISTS `lbtablet_ambulance_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL,
  `tag_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_ambulance_tags: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_apps_loggedin
CREATE TABLE IF NOT EXISTS `lbtablet_apps_loggedin` (
  `tablet_id` varchar(100) NOT NULL,
  `app` varchar(25) NOT NULL,
  `account` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tablet_id`,`app`,`account`),
  CONSTRAINT `lbtablet_apps_loggedin_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_apps_loggedin: ~0 rows (approximately)
INSERT INTO `lbtablet_apps_loggedin` (`tablet_id`, `app`, `account`, `active`) VALUES
	('KI73TL9E', 'mail', 'mr.dx@lbscripts.com', 1),
	('S1L5K3M9', 'mail', 'demon.test@lbscripts.com', 1);

-- Dumping structure for table ahrp.lbtablet_chat_rooms
CREATE TABLE IF NOT EXISTS `lbtablet_chat_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `terminal_type` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `creator` varchar(100) NOT NULL,
  `last_message` text DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_chat_rooms: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_chat_rooms_members
CREATE TABLE IF NOT EXISTS `lbtablet_chat_rooms_members` (
  `room_id` int(10) unsigned NOT NULL,
  `account` varchar(100) NOT NULL,
  `notifications` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`room_id`,`account`),
  CONSTRAINT `lbtablet_chat_rooms_members_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `lbtablet_chat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_chat_rooms_members: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_chat_rooms_messages
CREATE TABLE IF NOT EXISTS `lbtablet_chat_rooms_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL,
  `author` varchar(100) NOT NULL,
  `message` text DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `lbtablet_chat_rooms_messages_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `lbtablet_chat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_chat_rooms_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_clock_alarms
CREATE TABLE IF NOT EXISTS `lbtablet_clock_alarms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablet_id` varchar(100) NOT NULL,
  `hours` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `minutes` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `label` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `tablet_id` (`tablet_id`),
  CONSTRAINT `lbtablet_clock_alarms_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_clock_alarms: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_notes
CREATE TABLE IF NOT EXISTS `lbtablet_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablet_id` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` mediumtext NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tablet_id` (`tablet_id`),
  CONSTRAINT `lbtablet_notes_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_notes: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_notifications
CREATE TABLE IF NOT EXISTS `lbtablet_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablet_id` varchar(100) NOT NULL,
  `app` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `show_avatar` tinyint(1) NOT NULL DEFAULT 0,
  `custom_data` text DEFAULT NULL,
  `received_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tablet_id` (`tablet_id`),
  CONSTRAINT `lbtablet_notifications_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_notifications: ~0 rows (approximately)
INSERT INTO `lbtablet_notifications` (`id`, `tablet_id`, `app`, `title`, `content`, `thumbnail`, `avatar`, `show_avatar`, `custom_data`, `received_at`) VALUES
	(1, 'KI73TL9E', 'Mail', 'System', 'Your Password', NULL, NULL, 0, NULL, '2025-09-10 20:21:11'),
	(2, 'S1L5K3M9', 'Mail', 'System', 'Your Password', NULL, NULL, 0, NULL, '2025-09-11 16:00:22');

-- Dumping structure for table ahrp.lbtablet_photos
CREATE TABLE IF NOT EXISTS `lbtablet_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablet_id` varchar(100) NOT NULL,
  `link` varchar(500) DEFAULT NULL,
  `is_video` tinyint(1) DEFAULT 0,
  `size` float NOT NULL DEFAULT 0,
  `metadata` varchar(20) DEFAULT NULL,
  `is_favourite` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tablet_id` (`tablet_id`),
  CONSTRAINT `lbtablet_photos_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_photos: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_photo_albums
CREATE TABLE IF NOT EXISTS `lbtablet_photo_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablet_id` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tablet_id` (`tablet_id`),
  CONSTRAINT `lbtablet_photo_albums_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_photo_albums: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_photo_album_photos
CREATE TABLE IF NOT EXISTS `lbtablet_photo_album_photos` (
  `album_id` int(10) unsigned NOT NULL,
  `photo_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`album_id`,`photo_id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `lbtablet_photo_album_photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `lbtablet_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_photo_album_photos_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `lbtablet_photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_photo_album_photos: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_accounts
CREATE TABLE IF NOT EXISTS `lbtablet_police_accounts` (
  `id` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `callsign` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_accounts: ~2 rows (approximately)
INSERT INTO `lbtablet_police_accounts` (`id`, `display_name`, `avatar`, `callsign`) VALUES
	('KI73TL9E', 'Mr Dx', NULL, NULL),
	('S1L5K3M9', 'Demon Test', NULL, NULL);

-- Dumping structure for table ahrp.lbtablet_police_bulletin
CREATE TABLE IF NOT EXISTS `lbtablet_police_bulletin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `lbtablet_police_bulletin_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_bulletin: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_cases
CREATE TABLE IF NOT EXISTS `lbtablet_police_cases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `lbtablet_police_cases_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_cases: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_cases_charges
CREATE TABLE IF NOT EXISTS `lbtablet_police_cases_charges` (
  `case_id` int(10) unsigned NOT NULL,
  `criminal` varchar(100) NOT NULL,
  `offence_id` int(10) unsigned NOT NULL,
  `charges` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`case_id`,`criminal`,`offence_id`),
  KEY `offence_id` (`offence_id`),
  CONSTRAINT `lbtablet_police_cases_charges_ibfk_1` FOREIGN KEY (`case_id`, `criminal`) REFERENCES `lbtablet_police_cases_criminals` (`case_id`, `id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_police_cases_charges_ibfk_2` FOREIGN KEY (`offence_id`) REFERENCES `lbtablet_police_offences` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_cases_charges: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_cases_criminals
CREATE TABLE IF NOT EXISTS `lbtablet_police_cases_criminals` (
  `case_id` int(10) unsigned NOT NULL,
  `id` varchar(100) NOT NULL,
  `fine` int(10) unsigned NOT NULL DEFAULT 0,
  `jail_time` int(10) unsigned NOT NULL DEFAULT 0,
  `fined` tinyint(1) NOT NULL DEFAULT 0,
  `jailed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`case_id`,`id`),
  CONSTRAINT `lbtablet_police_cases_criminals_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_cases_criminals: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_cases_evidence
CREATE TABLE IF NOT EXISTS `lbtablet_police_cases_evidence` (
  `case_id` int(10) unsigned NOT NULL,
  `attachment` varchar(500) NOT NULL,
  PRIMARY KEY (`case_id`,`attachment`),
  CONSTRAINT `lbtablet_police_cases_evidence_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_cases_evidence: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_cases_involved
CREATE TABLE IF NOT EXISTS `lbtablet_police_cases_involved` (
  `case_id` int(10) unsigned NOT NULL,
  `involved` varchar(100) NOT NULL,
  `involvement` varchar(50) NOT NULL,
  PRIMARY KEY (`case_id`,`involved`),
  CONSTRAINT `lbtablet_police_cases_involved_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_cases_involved: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_cases_linked_reports
CREATE TABLE IF NOT EXISTS `lbtablet_police_cases_linked_reports` (
  `case_id` int(10) unsigned NOT NULL,
  `report_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`case_id`,`report_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `lbtablet_police_cases_linked_reports_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_police_cases_linked_reports_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_cases_linked_reports: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_cases_tags
CREATE TABLE IF NOT EXISTS `lbtablet_police_cases_tags` (
  `case_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`case_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `lbtablet_police_cases_tags_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_police_cases_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_cases_tags: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_jail
CREATE TABLE IF NOT EXISTS `lbtablet_police_jail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prisoner` varchar(100) NOT NULL,
  `jailed_by` varchar(100) DEFAULT NULL,
  `reason` varchar(100) NOT NULL,
  `original_time` int(10) unsigned NOT NULL,
  `jail_time` int(10) unsigned NOT NULL,
  `jailed_at` datetime NOT NULL DEFAULT current_timestamp(),
  `related_case` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `related_case` (`related_case`),
  CONSTRAINT `lbtablet_police_jail_ibfk_1` FOREIGN KEY (`related_case`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_jail: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_logs
CREATE TABLE IF NOT EXISTS `lbtablet_police_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` varchar(100) DEFAULT NULL,
  `related_id` varchar(500) DEFAULT NULL,
  `log_action` varchar(50) NOT NULL,
  `log_type` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_logs: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_offences
CREATE TABLE IF NOT EXISTS `lbtablet_police_offences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `class` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `fine` int(10) unsigned NOT NULL DEFAULT 0,
  `jail_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`class`,`title`),
  CONSTRAINT `lbtablet_police_offences_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `lbtablet_police_offences_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_offences: ~114 rows (approximately)
INSERT INTO `lbtablet_police_offences` (`id`, `category_id`, `class`, `title`, `description`, `fine`, `jail_time`) VALUES
	(1, 1, 'misdemeanor', 'Possession of Controlled Substances', 'Having illegal drugs for personal use.', 500, 0),
	(2, 1, 'infraction', 'Possession of Drug Paraphernalia', 'Having items associated with drug use or preparation.', 200, 0),
	(3, 1, 'felony', 'Drug Trafficking', 'The distribution or sale of illegal drugs.', 0, 60),
	(4, 1, 'felony', 'Driving Under Drug Influence', 'Operating a vehicle while under the influence of drugs.', 1000, 12),
	(5, 1, 'felony', 'Cultivation of Illegal Drugs', 'Growing plants used to produce controlled substances.', 0, 48),
	(6, 1, 'misdemeanor', 'Public Drug Use', 'Consuming illegal drugs in public spaces.', 300, 0),
	(7, 1, 'felony', 'Drug Manufacturing', 'Producing illegal drugs for sale or distribution.', 0, 72),
	(8, 1, 'felony', 'Prescription Fraud', 'Falsifying prescriptions to obtain controlled substances.', 1000, 24),
	(9, 1, 'felony', 'Possession with Intent to Distribute', 'Possessing drugs in quantities that suggest intent to sell.', 0, 48),
	(10, 1, 'felony', 'Operating a Drug House', 'Maintaining a property for drug manufacturing or distribution.', 0, 72),
	(11, 1, 'felony', 'Public Sale of Drugs', 'Selling illegal drugs in a public area.', 2000, 36),
	(12, 2, 'felony', 'Carrying a Concealed Weapon Without Permit', 'Possessing a hidden weapon without the required authorization.', 0, 36),
	(13, 2, 'felony', 'Illegal Sale of Firearms', 'Selling guns without the necessary licenses or background checks.', 5000, 60),
	(14, 2, 'felony', 'Unlawful Discharge of a Firearm', 'Firing a weapon in prohibited areas or in a manner that endangers others.', 4000, 36),
	(15, 2, 'felony', 'Possession of a Prohibited Weapon', 'Owning or carrying weapons banned by law, such as sawed-off shotguns or explosives.', 5000, 48),
	(16, 2, 'misdemeanor', 'Brandishing a Weapon', 'Displaying a weapon in a threatening manner without just cause.', 750, 12),
	(17, 2, 'misdemeanor', 'Using a Weapon While Intoxicated', 'Operating or handling a weapon while under the influence of drugs or alcohol.', 1000, 12),
	(18, 2, 'felony', 'Possession of a Weapon in a Restricted Area', 'Bringing firearms or other weapons into places where they are strictly prohibited, such as airports or schools.', 3000, 24),
	(19, 2, 'felony', 'Trafficking Illegal Firearms', 'Transporting or selling firearms unlawfully across jurisdictions.', 7000, 72),
	(20, 2, 'misdemeanor', 'Failure to Secure a Firearm', 'Neglecting to safely store a firearm, leading to potential unauthorized access.', 500, 0),
	(21, 2, 'felony', 'Modifying a Firearm Illegally', 'Altering a weapon to make it more lethal, such as converting it to fully automatic.', 6000, 48),
	(22, 2, 'felony', 'Possession of a Firearm Without a Serial Number', 'Owning or using a weapon with the serial number removed or obscured.', 4000, 36),
	(23, 2, 'misdemeanor', 'Carrying a Loaded Firearm in Public', 'Possessing a firearm with live ammunition in a public space without legal authorization.', 2000, 24),
	(24, 2, 'misdemeanor', 'Negligent Use of a Weapon', 'Handling or operating a firearm carelessly, causing risk to others.', 1500, 12),
	(25, 2, 'felony', 'Possession of a Stolen Firearm', 'Being in possession of a weapon known to be stolen.', 5000, 36),
	(26, 3, 'misdemeanor', 'Vandalism', 'Deliberate destruction or defacement of property.', 1000, 0),
	(27, 3, 'felony', 'Burglary', 'Unlawful entry into a building with the intent to commit a crime.', 0, 24),
	(28, 3, 'felony', 'Arson', 'The willful and malicious burning of property.', 2000, 48),
	(29, 3, 'misdemeanor', 'Shoplifting', 'Stealing merchandise from a retail establishment.', 300, 0),
	(30, 3, 'infraction', 'Trespassing', 'Entering or remaining on someone else\'s property without permission.', 200, 0),
	(31, 3, 'felony', 'Grand Theft', 'Stealing property of significant value.', 0, 36),
	(32, 3, 'misdemeanor', 'Petty Theft', 'Stealing property of low value.', 500, 0),
	(33, 3, 'misdemeanor', 'Possession of Stolen Property', 'Having goods that were unlawfully taken from someone else.', 700, 0),
	(34, 3, 'misdemeanor', 'Graffiti', 'Illegally painting or defacing public or private property.', 500, 0),
	(35, 3, 'felony', 'Credit Card Fraud', 'Using stolen or fake credit card information to make purchases.', 2000, 24),
	(36, 3, 'felony', 'Breaking and Entering', 'Forcing entry into a property without permission.', 0, 36),
	(37, 3, 'misdemeanor', 'Piracy', 'Illegally copying or distributing copyrighted material.', 1000, 0),
	(38, 3, 'felony', 'Identity Theft', 'Using someone else\'s personal information for fraudulent purposes.', 2000, 48),
	(39, 3, 'misdemeanor', 'Trespassing', 'Entering or remaining on property without permission.', 250, 0),
	(40, 3, 'felony', 'Theft of Public Property', 'Stealing items belonging to the government or public institutions.', 0, 36),
	(41, 3, 'misdemeanor', 'Unauthorized Use of a Vehicle', 'Using a vehicle without the owner’s permission but not intending to steal it.', 500, 0),
	(42, 3, 'misdemeanor', 'Illegal Squatting', 'Occupying an abandoned or unoccupied property without permission.', 300, 0),
	(43, 4, 'infraction', 'Speeding', 'Exceeding the posted speed limit.', 100, 0),
	(44, 4, 'infraction', 'Running a Red Light', 'Failing to stop at a red traffic light.', 200, 0),
	(45, 4, 'felony', 'Driving Under the Influence (DUI)', 'Operating a vehicle while under the influence of alcohol or drugs.', 1000, 12),
	(46, 4, 'misdemeanor', 'Reckless Driving', 'Operating a vehicle with willful or wanton disregard for safety.', 500, 6),
	(47, 4, 'misdemeanor', 'Driving Without a License', 'Operating a vehicle without a valid driver\'s license.', 250, 0),
	(48, 4, 'felony', 'Hit and Run', 'Leaving the scene of an accident without providing information or assistance.', 0, 24),
	(49, 4, 'infraction', 'Driving Without Insurance', 'Operating a vehicle without valid insurance coverage.', 500, 0),
	(50, 4, 'infraction', 'Failure to Yield', 'Not giving the right of way when required by traffic laws.', 150, 0),
	(51, 4, 'infraction', 'Illegal U-Turn', 'Making a U-turn where prohibited by traffic signs or laws.', 100, 0),
	(52, 4, 'infraction', 'Driving Without Headlights', 'Operating a vehicle at night or in poor visibility without lights on.', 50, 0),
	(53, 4, 'felony', 'Street Racing', 'Engaging in illegal speed contests on public roads.', 1500, 24),
	(54, 4, 'infraction', 'Driving in the Wrong Direction', 'Operating a vehicle against the flow of traffic.', 200, 0),
	(55, 4, 'infraction', 'Illegal Parking in Handicap Zones', 'Parking in a space designated for disabled individuals without proper permits.', 200, 0),
	(56, 4, 'misdemeanor', 'Road Rage Incident', 'Driving aggressively and endangering others during a dispute.', 750, 6),
	(57, 4, 'infraction', 'Unregistered Vehicle', 'Driving a vehicle without proper registration.', 150, 0),
	(58, 4, 'infraction', 'Excessive Window Tinting', 'Having window tint darker than allowed by law.', 100, 0),
	(59, 5, 'felony', 'Embezzlement', 'Fraudulently taking money or property from an employer.', 0, 36),
	(60, 5, 'felony', 'Fraud', 'Intentionally deceiving others for financial gain.', 0, 48),
	(61, 5, 'felony', 'Identity Theft', 'Using someone else\'s personal information for fraudulent purposes.', 1000, 36),
	(62, 5, 'felony', 'Tax Evasion', 'Deliberately avoiding paying required taxes.', 5000, 60),
	(63, 5, 'felony', 'Money Laundering', 'Processing illegal funds to make them appear legitimate.', 0, 48),
	(64, 5, 'felony', 'Insider Trading', 'Using non-public information to trade stocks for financial advantage.', 0, 36),
	(65, 5, 'felony', 'Forgery', 'Creating or altering documents with intent to defraud.', 0, 24),
	(66, 5, 'felony', 'Cybercrime', 'Using computers to commit fraud, identity theft, or unauthorized access.', 0, 60),
	(67, 5, 'felony', 'Healthcare Fraud', 'Filing false claims or manipulating healthcare billing for profit.', 0, 48),
	(68, 5, 'felony', 'Ponzi Scheme', 'Fraudulent investment scam promising high returns with minimal risk.', 0, 120),
	(69, 5, 'felony', 'Counterfeiting', 'Producing fake currency or documents.', 2000, 48),
	(70, 5, 'felony', 'Corporate Espionage', 'Stealing trade secrets or confidential business information.', 0, 72),
	(71, 6, 'felony', 'Bigamy', 'Entering into a marriage while already married to another person.', 0, 12),
	(72, 6, 'felony', 'Perjury', 'Lying under oath in a legal proceeding.', 0, 24),
	(73, 6, 'misdemeanor', 'Filing a False Police Report', 'Intentionally providing false information to law enforcement.', 500, 0),
	(74, 6, 'misdemeanor', 'Resisting Arrest', 'Physically or verbally opposing law enforcement during an arrest.', 0, 6),
	(75, 6, 'misdemeanor', 'Failure to Appear in Court', 'Not showing up for a scheduled court date without valid reason.', 500, 0),
	(76, 6, 'infraction', 'Unlawful Assembly', 'Gathering in a manner that poses a threat to public safety or order.', 200, 0),
	(77, 6, 'misdemeanor', 'Failure to Report a Crime', 'Not notifying authorities about a witnessed crime.', 250, 0),
	(78, 6, 'misdemeanor', 'Providing False Identification', 'Presenting fake or misleading identification to authorities.', 300, 12),
	(79, 7, 'misdemeanor', 'Assault', 'Intentionally causing physical harm to another person.', 0, 12),
	(80, 7, 'felony', 'Robbery', 'Taking property from a person through force or intimidation.', 0, 36),
	(81, 7, 'felony', 'Homicide', 'The unlawful killing of another person.', 0, 120),
	(82, 7, 'felony', 'Domestic Violence', 'Physical or emotional abuse within a household or intimate relationship.', 0, 36),
	(83, 7, 'felony', 'Kidnapping', 'Unlawfully seizing and detaining a person against their will.', 0, 120),
	(84, 7, 'felony', 'Aggravated Assault', 'An attack causing serious bodily harm or involving a weapon.', 0, 60),
	(85, 7, 'misdemeanor', 'Battery', 'Intentional physical contact or harm to another person without consent.', 0, 12),
	(86, 7, 'felony', 'Terroristic Threats', 'Threatening violence to cause fear or disruption.', 0, 48),
	(87, 7, 'felony', 'Vehicular Manslaughter', 'Causing a death through negligent or reckless driving.', 0, 60),
	(88, 7, 'felony', 'Hate Crime', 'A crime motivated by prejudice against a person’s race, religion, or other characteristics.', 0, 48),
	(89, 7, 'felony', 'Child Abuse', 'Physical, emotional, or sexual abuse of a minor.', 0, 72),
	(90, 7, 'misdemeanor', 'Reckless Endangerment', 'Engaging in actions that could cause serious harm to others.', 0, 12),
	(93, 7, 'misdemeanor', 'Stalking', 'Repeatedly following or harassing someone, causing fear.', 0, 12),
	(94, 8, 'felony', 'Hacking', 'Gaining unauthorized access to computer systems.', 0, 36),
	(95, 8, 'felony', 'Phishing', 'Using fake communication to obtain sensitive information.', 1500, 24),
	(96, 8, 'misdemeanor', 'Online Harassment', 'Bullying or threatening someone via the internet.', 500, 0),
	(97, 8, 'felony', 'Unauthorized Access to Computer Systems', 'Hacking into computer systems without permission.', 3000, 48),
	(98, 9, 'infraction', 'Overfishing', 'Exceeding legal limits on fish catches.', 500, 0),
	(99, 9, 'felony', 'Illegal Logging', 'Harvesting timber without permits.', 3000, 36),
	(100, 9, 'felony', 'Endangered Species Trafficking', 'Trading animals or plants protected by conservation laws.', 0, 48),
	(101, 9, 'felony', 'Illegal Mining', 'Extracting minerals or resources without proper permits.', 4000, 60),
	(102, 9, 'misdemeanor', 'Illegal Dumping', 'Disposing of waste in unauthorized areas.', 750, 0),
	(103, 9, 'felony', 'Poaching', 'Illegally hunting or capturing wildlife.', 4000, 36),
	(104, 10, 'misdemeanor', 'Disorderly Conduct', 'Behaving in a disruptive or unruly manner in public.', 300, 0),
	(105, 10, 'infraction', 'Public Intoxication', 'Being visibly drunk or impaired in public.', 150, 0),
	(106, 10, 'infraction', 'Loitering', 'Remaining in an area without a legitimate purpose.', 50, 0),
	(107, 10, 'infraction', 'Disturbing the Peace', 'Engaging in loud or disruptive behavior in public.', 100, 0),
	(108, 10, 'felony', 'Rioting', 'Participating in a violent public disturbance.', 0, 36),
	(109, 10, 'misdemeanor', 'Prostitution', 'Engaging in or soliciting sexual services for money.', 500, 0),
	(110, 10, 'misdemeanor', 'Hate Speech', 'Making statements intended to incite violence or hatred against a group.', 1000, 0),
	(111, 10, 'infraction', 'Unlawful Assembly', 'Gathering with others in a way that disturbs public peace.', 100, 0),
	(112, 10, 'infraction', 'Illegal Protests', 'Organizing or participating in a protest without proper permits.', 100, 0),
	(113, 10, 'misdemeanor', 'Indecent Exposure', 'Deliberately exposing private parts in public.', 500, 0),
	(114, 10, 'felony', 'Obstructing Justice', 'Interfering with law enforcement or court proceedings.', 0, 24),
	(115, 10, 'felony', 'Bribery', 'Offering or accepting something of value to influence decisions.', 5000, 36),
	(117, 10, 'felony', 'Inciting a Riot', 'Encouraging or instigating a group to engage in violent behavior.', 0, 48);

-- Dumping structure for table ahrp.lbtablet_police_offences_categories
CREATE TABLE IF NOT EXISTS `lbtablet_police_offences_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_offences_categories: ~10 rows (approximately)
INSERT INTO `lbtablet_police_offences_categories` (`id`, `title`) VALUES
	(1, 'Drug-Related Offences'),
	(2, 'Weapon-Related Offences'),
	(3, 'Property Crimes'),
	(4, 'Traffic Violations'),
	(5, 'White-Collar Crimes'),
	(6, 'Miscellaneous Crimes'),
	(7, 'Violent Crimes'),
	(8, 'Cybercrimes'),
	(9, 'Environmental Offences'),
	(10, 'Public Order Offences');

-- Dumping structure for table ahrp.lbtablet_police_phone_unlocks
CREATE TABLE IF NOT EXISTS `lbtablet_police_phone_unlocks` (
  `phone_number` varchar(15) NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `unlocked` tinyint(1) NOT NULL DEFAULT 0,
  `finished_at` datetime NOT NULL,
  PRIMARY KEY (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_phone_unlocks: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_profiles
CREATE TABLE IF NOT EXISTS `lbtablet_police_profiles` (
  `id` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `notes` text NOT NULL DEFAULT '',
  `profile_type` varchar(50) NOT NULL DEFAULT 'player',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_profiles: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_profile_tags
CREATE TABLE IF NOT EXISTS `lbtablet_police_profile_tags` (
  `id` varchar(100) NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `lbtablet_police_profile_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_profile_tags: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_reports
CREATE TABLE IF NOT EXISTS `lbtablet_police_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_type` varchar(100) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `lbtablet_police_reports_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_reports: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_reports_attachments
CREATE TABLE IF NOT EXISTS `lbtablet_police_reports_attachments` (
  `report_id` int(10) unsigned NOT NULL,
  `attachment` varchar(500) NOT NULL,
  PRIMARY KEY (`report_id`,`attachment`),
  CONSTRAINT `lbtablet_police_reports_attachments_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_reports_attachments: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_reports_involved
CREATE TABLE IF NOT EXISTS `lbtablet_police_reports_involved` (
  `report_id` int(10) unsigned NOT NULL,
  `involved` varchar(100) NOT NULL,
  `involvement` varchar(50) NOT NULL,
  PRIMARY KEY (`report_id`,`involved`),
  CONSTRAINT `lbtablet_police_reports_involved_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_reports_involved: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_reports_tags
CREATE TABLE IF NOT EXISTS `lbtablet_police_reports_tags` (
  `report_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`report_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `lbtablet_police_reports_tags_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_police_reports_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_reports_tags: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_tags
CREATE TABLE IF NOT EXISTS `lbtablet_police_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_tags: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_warrants
CREATE TABLE IF NOT EXISTS `lbtablet_police_warrants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` varchar(100) NOT NULL,
  `warrant_type` varchar(100) NOT NULL,
  `warrant_status` varchar(50) NOT NULL DEFAULT 'active',
  `priority` varchar(50) NOT NULL DEFAULT 'low',
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `linked_profile_id` varchar(100) DEFAULT NULL,
  `linked_profile_type` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `lbtablet_police_warrants_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_warrants: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_warrants_attachments
CREATE TABLE IF NOT EXISTS `lbtablet_police_warrants_attachments` (
  `warrant_id` int(10) unsigned NOT NULL,
  `attachment` varchar(500) NOT NULL,
  PRIMARY KEY (`warrant_id`,`attachment`),
  CONSTRAINT `lbtablet_police_warrants_attachments_ibfk_1` FOREIGN KEY (`warrant_id`) REFERENCES `lbtablet_police_warrants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_warrants_attachments: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_warrants_linked_reports
CREATE TABLE IF NOT EXISTS `lbtablet_police_warrants_linked_reports` (
  `warrant_id` int(10) unsigned NOT NULL,
  `report_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`warrant_id`,`report_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `lbtablet_police_warrants_linked_reports_ibfk_1` FOREIGN KEY (`warrant_id`) REFERENCES `lbtablet_police_warrants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_police_warrants_linked_reports_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_warrants_linked_reports: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_warrants_tags
CREATE TABLE IF NOT EXISTS `lbtablet_police_warrants_tags` (
  `warrant_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`warrant_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `lbtablet_police_warrants_tags_ibfk_1` FOREIGN KEY (`warrant_id`) REFERENCES `lbtablet_police_warrants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_police_warrants_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_warrants_tags: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_weapons
CREATE TABLE IF NOT EXISTS `lbtablet_police_weapons` (
  `serial_number` varchar(100) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `weapon_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_weapons: ~2 rows (approximately)
INSERT INTO `lbtablet_police_weapons` (`serial_number`, `owner`, `weapon_name`) VALUES
	('270398POL979423', 'S1L5K3M9', 'WEAPON_PDMK33'),
	('824737POL646731', 'S1L5K3M9', 'WEAPON_PISTOL');

-- Dumping structure for table ahrp.lbtablet_police_wiretaps
CREATE TABLE IF NOT EXISTS `lbtablet_police_wiretaps` (
  `phone_number` varchar(15) NOT NULL,
  `creator_tablet_id` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`phone_number`),
  KEY `creator_tablet_id` (`creator_tablet_id`),
  CONSTRAINT `lbtablet_police_wiretaps_ibfk_1` FOREIGN KEY (`creator_tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_wiretaps: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_police_wiretaps_subscribers
CREATE TABLE IF NOT EXISTS `lbtablet_police_wiretaps_subscribers` (
  `tablet_id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`tablet_id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `lbtablet_police_wiretaps_subscribers_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lbtablet_police_wiretaps_subscribers_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `lbtablet_police_wiretaps` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_police_wiretaps_subscribers: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_registration_characters
CREATE TABLE IF NOT EXISTS `lbtablet_registration_characters` (
  `identifier` varchar(100) NOT NULL,
  `character_id` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `dateofbirth` varchar(20) NOT NULL,
  `is_male` tinyint(1) NOT NULL,
  `job` varchar(100) NOT NULL DEFAULT 'unemployed',
  `height` smallint(5) unsigned NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `description` text NOT NULL DEFAULT '',
  `phone_number` varchar(20) NOT NULL DEFAULT '',
  `jail` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_registration_characters: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_registration_licenses
CREATE TABLE IF NOT EXISTS `lbtablet_registration_licenses` (
  `character_id` varchar(100) NOT NULL,
  `license` varchar(100) NOT NULL,
  PRIMARY KEY (`character_id`,`license`),
  CONSTRAINT `lbtablet_registration_licenses_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `lbtablet_registration_characters` (`character_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_registration_licenses: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_registration_properties
CREATE TABLE IF NOT EXISTS `lbtablet_registration_properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `character_id` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  CONSTRAINT `lbtablet_registration_properties_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `lbtablet_registration_characters` (`character_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_registration_properties: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_registration_vehicles
CREATE TABLE IF NOT EXISTS `lbtablet_registration_vehicles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `character_id` varchar(100) NOT NULL,
  `plate` varchar(20) NOT NULL,
  `model` varchar(100) NOT NULL,
  `color` varchar(20) NOT NULL,
  `picture` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`),
  KEY `character_id` (`character_id`),
  CONSTRAINT `lbtablet_registration_vehicles_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `lbtablet_registration_characters` (`character_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_registration_vehicles: ~0 rows (approximately)

-- Dumping structure for table ahrp.lbtablet_tablets
CREATE TABLE IF NOT EXISTS `lbtablet_tablets` (
  `id` varchar(100) NOT NULL,
  `tablet_name` varchar(50) NOT NULL,
  `settings` longtext DEFAULT NULL,
  `battery` tinyint(3) unsigned NOT NULL DEFAULT 100,
  `is_setup` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_tablets: ~0 rows (approximately)
INSERT INTO `lbtablet_tablets` (`id`, `tablet_name`, `settings`, `battery`, `is_setup`) VALUES
	('KI73TL9E', 'Mr\'s Tablet', NULL, 100, 0),
	('S1L5K3M9', 'Demon\'s Tablet', '{"wallpaper":{"blur":false,"background":"gradient"},"display":{"brightness":1,"theme":"dark"},"doNotDisturb":false,"lockscreen":{"fontStyle":1,"color":"gradient"},"apps":[["Notes","Mail","Camera","Photos"],["Settings","Browser","Maps","Ambulance","Police","Calculator","Apps","VoiceMemo","Services","Clock","Registration"]],"airplaneMode":false,"streamerMode":false,"sound":{"volume":0.5,"silent":false},"time":{"twelveHourClock":false},"name":"??","locale":"en"}', 100, 1);

-- Dumping structure for table ahrp.lbtablet_voice_memo_recordings
CREATE TABLE IF NOT EXISTS `lbtablet_voice_memo_recordings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablet_id` varchar(100) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_length` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tablet_id` (`tablet_id`),
  CONSTRAINT `lbtablet_voice_memo_recordings_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.lbtablet_voice_memo_recordings: ~0 rows (approximately)

-- Dumping structure for table ahrp.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` text DEFAULT NULL,
  `components` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.management_outfits: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_calls
CREATE TABLE IF NOT EXISTS `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `isAnonymous` tinyint(4) NOT NULL DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_calls: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_darkchat_channels
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(191) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ahrp.npwd_darkchat_channels: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_darkchat_channel_members
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ahrp.npwd_darkchat_channel_members: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_darkchat_messages
CREATE TABLE IF NOT EXISTS `npwd_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_image` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ahrp.npwd_darkchat_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_marketplace_listings
CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_marketplace_listings: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_match_profiles
CREATE TABLE IF NOT EXISTS `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_match_profiles: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_match_views
CREATE TABLE IF NOT EXISTS `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_match_views: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_messages
CREATE TABLE IF NOT EXISTS `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_messages_conversations
CREATE TABLE IF NOT EXISTS `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_messages_conversations: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_messages_participants
CREATE TABLE IF NOT EXISTS `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_messages_participants: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_notes
CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_notes: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_phone_contacts
CREATE TABLE IF NOT EXISTS `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_phone_contacts: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_phone_gallery
CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_phone_gallery: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_twitter_likes
CREATE TABLE IF NOT EXISTS `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_twitter_likes: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_twitter_profiles
CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_twitter_profiles: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_twitter_reports
CREATE TABLE IF NOT EXISTS `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_twitter_reports: ~0 rows (approximately)

-- Dumping structure for table ahrp.npwd_twitter_tweets
CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.npwd_twitter_tweets: ~0 rows (approximately)

-- Dumping structure for table ahrp.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.occasion_vehicles: ~0 rows (approximately)

-- Dumping structure for table ahrp.ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.ox_doorlock: ~6 rows (approximately)
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'vangelico_jewellery', '{"maxDistance":2,"groups":{"police":0},"doors":[{"model":1425919976,"coords":{"x":-631.9553833007813,"y":-236.33326721191407,"z":38.2065315246582},"heading":306},{"model":9467943,"coords":{"x":-630.426513671875,"y":-238.4375457763672,"z":38.2065315246582},"heading":306}],"state":1,"coords":{"x":-631.19091796875,"y":-237.38540649414063,"z":38.2065315246582},"hideUi":true}'),
	(2, 'BigBankThermite1', '{"heading":160,"doors":false,"maxDistance":2,"hideUi":true,"groups":{"police":0},"coords":{"x":251.85757446289063,"y":221.0654754638672,"z":101.83240509033203},"model":-1508355822,"state":1,"autolock":1800}'),
	(3, 'BigBankThermite2', '{"coords":{"x":261.3004150390625,"y":214.50514221191407,"z":101.83240509033203},"autolock":1800,"maxDistance":2,"groups":{"police":0},"model":-1508355822,"doors":false,"hideUi":true,"heading":250,"state":1}'),
	(4, 'BigBankLPDoor', '{"coords":{"x":256.3115539550781,"y":220.65785217285157,"z":106.42955780029297},"autolock":1800,"maxDistance":2,"model":-222270721,"doors":false,"lockpick":true,"hideUi":true,"heading":340,"state":1,"lockpickDifficulty":["hard"]}'),
	(5, 'PaletoThermiteDoor', '{"coords":{"x":-106.47130584716797,"y":6476.15771484375,"z":31.95479965209961},"autolock":1800,"maxDistance":2,"groups":{"police":0},"model":1309269072,"doors":false,"hideUi":true,"heading":315,"state":1}'),
	(6, 'BigBankRedCardDoor', '{"coords":{"x":262.1980895996094,"y":222.518798828125,"z":106.42955780029297},"autolock":1800,"maxDistance":2,"groups":{"police":0},"model":746855201,"doors":false,"hideUi":true,"heading":250,"state":1}');

-- Dumping structure for table ahrp.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.ox_inventory: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_backups
CREATE TABLE IF NOT EXISTS `phone_backups` (
  `id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_backups_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_backups: ~0 rows (approximately)
INSERT INTO `phone_backups` (`id`, `phone_number`) VALUES
	('KI73TL9E', '5205195437');

-- Dumping structure for table ahrp.phone_clock_alarms
CREATE TABLE IF NOT EXISTS `phone_clock_alarms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `hours` int(2) NOT NULL DEFAULT 0,
  `minutes` int(2) NOT NULL DEFAULT 0,
  `label` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_clock_alarms_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_clock_alarms: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_crypto
CREATE TABLE IF NOT EXISTS `phone_crypto` (
  `id` varchar(100) NOT NULL,
  `coin` varchar(15) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `invested` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`coin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_crypto: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_darkchat_accounts
CREATE TABLE IF NOT EXISTS `phone_darkchat_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_darkchat_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_darkchat_accounts: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_darkchat_channels
CREATE TABLE IF NOT EXISTS `phone_darkchat_channels` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_darkchat_channels: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_darkchat_members
CREATE TABLE IF NOT EXISTS `phone_darkchat_members` (
  `channel_name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`channel_name`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `phone_darkchat_members_ibfk_1` FOREIGN KEY (`channel_name`) REFERENCES `phone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_darkchat_members_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_darkchat_members: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_darkchat_messages
CREATE TABLE IF NOT EXISTS `phone_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(50) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `sender` (`sender`),
  CONSTRAINT `phone_darkchat_messages_ibfk_1` FOREIGN KEY (`channel`) REFERENCES `phone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_darkchat_messages_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `phone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_darkchat_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_instagram_accounts
CREATE TABLE IF NOT EXISTS `phone_instagram_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `post_count` int(11) NOT NULL DEFAULT 0,
  `story_count` int(11) NOT NULL DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(15) NOT NULL,
  `private` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_instagram_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_instagram_accounts: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_instagram_comments
CREATE TABLE IF NOT EXISTS `phone_instagram_comments` (
  `id` varchar(10) NOT NULL,
  `post_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(500) NOT NULL DEFAULT '',
  `like_count` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_instagram_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `phone_instagram_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `phone_instagram_comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_instagram_comments: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_instagram_follows
CREATE TABLE IF NOT EXISTS `phone_instagram_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `phone_instagram_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_instagram_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_instagram_follows: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_instagram_follow_requests
CREATE TABLE IF NOT EXISTS `phone_instagram_follow_requests` (
  `requester` varchar(20) NOT NULL,
  `requestee` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`requester`,`requestee`),
  KEY `requestee` (`requestee`),
  CONSTRAINT `phone_instagram_follow_requests_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_instagram_follow_requests_ibfk_2` FOREIGN KEY (`requestee`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_instagram_follow_requests: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_instagram_likes
CREATE TABLE IF NOT EXISTS `phone_instagram_likes` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `phone_instagram_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_instagram_likes: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_instagram_messages
CREATE TABLE IF NOT EXISTS `phone_instagram_messages` (
  `id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `phone_instagram_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_instagram_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_instagram_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_instagram_notifications
CREATE TABLE IF NOT EXISTS `phone_instagram_notifications` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `post_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  CONSTRAINT `phone_instagram_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_instagram_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_instagram_notifications: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_instagram_posts
CREATE TABLE IF NOT EXISTS `phone_instagram_posts` (
  `id` varchar(10) NOT NULL,
  `media` text DEFAULT NULL,
  `caption` varchar(500) NOT NULL DEFAULT '',
  `location` varchar(50) DEFAULT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_instagram_posts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_instagram_posts: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_instagram_stories
CREATE TABLE IF NOT EXISTS `phone_instagram_stories` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `image` varchar(500) NOT NULL,
  `metadata` longtext DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_instagram_stories_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_instagram_stories: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_instagram_stories_views
CREATE TABLE IF NOT EXISTS `phone_instagram_stories_views` (
  `story_id` varchar(50) NOT NULL,
  `viewer` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`story_id`,`viewer`),
  KEY `viewer` (`viewer`),
  CONSTRAINT `phone_instagram_stories_views_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `phone_instagram_stories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `phone_instagram_stories_views_ibfk_2` FOREIGN KEY (`viewer`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_instagram_stories_views: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_last_phone
CREATE TABLE IF NOT EXISTS `phone_last_phone` (
  `id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_last_phone_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_last_phone: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_logged_in_accounts
CREATE TABLE IF NOT EXISTS `phone_logged_in_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`phone_number`,`app`,`username`),
  CONSTRAINT `phone_logged_in_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_logged_in_accounts: ~0 rows (approximately)
INSERT INTO `phone_logged_in_accounts` (`phone_number`, `app`, `username`, `active`) VALUES
	('5205195437', 'Mail', 'mr.dx2@ambitious.hustlers', 1);

-- Dumping structure for table ahrp.phone_mail_accounts
CREATE TABLE IF NOT EXISTS `phone_mail_accounts` (
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_mail_accounts: ~2 rows (approximately)
INSERT INTO `phone_mail_accounts` (`address`, `password`) VALUES
	('demon.test@lbscripts.com', '$2a$11$eufJY0N.eaDVDOejvF.SlOxQ6YZB7SNJPbKOVC/.0h2jjGA8q9Kgu'),
	('mr.dx@lbscripts.com', '$2a$11$vXazLhl7r3uqreK6sdJrPOsz9q0wx4tQCs86lx2J4PYYWS4Eh/iFK'),
	('mr.dx2@ambitious.hustlers', '$2a$11$kllc2b0Db27WGfI3yuN/X.7m/Wke600wi9CeXjtePvtcFj9rbKo/C');

-- Dumping structure for table ahrp.phone_mail_deleted
CREATE TABLE IF NOT EXISTS `phone_mail_deleted` (
  `message_id` int(10) unsigned NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`message_id`,`address`),
  KEY `address` (`address`),
  CONSTRAINT `phone_mail_deleted_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `phone_mail_messages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `phone_mail_deleted_ibfk_2` FOREIGN KEY (`address`) REFERENCES `phone_mail_accounts` (`address`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_mail_deleted: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_mail_messages
CREATE TABLE IF NOT EXISTS `phone_mail_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipient` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `attachments` longtext DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_recipient` (`recipient`),
  KEY `idx_sender` (`sender`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_mail_messages: ~2 rows (approximately)
INSERT INTO `phone_mail_messages` (`id`, `recipient`, `sender`, `subject`, `content`, `attachments`, `actions`, `read`, `timestamp`) VALUES
	(1, 'mr.dx@lbscripts.com', 'System', 'Your Password', 'Hey,\n\nYour automatic email address is mr.dx@lbscripts.com and your password is fwohu', NULL, NULL, 0, '2025-09-10 20:21:11'),
	(2, 'mr.dx2@ambitious.hustlers', 'System', 'Your Email Address', 'Hey,\n\nYour automatically generated email address is mr.dx2@ambitious.hustlers and your password is 2FiAj', NULL, NULL, 0, '2025-09-11 00:29:06'),
	(3, 'demon.test@lbscripts.com', 'System', 'Your Password', 'Hey,\n\nYour automatic email address is demon.test@lbscripts.com and your password is dwrzv', NULL, NULL, 0, '2025-09-11 16:00:22');

-- Dumping structure for table ahrp.phone_maps_locations
CREATE TABLE IF NOT EXISTS `phone_maps_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `x_pos` float NOT NULL,
  `y_pos` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_maps_locations_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_maps_locations: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_marketplace_posts
CREATE TABLE IF NOT EXISTS `phone_marketplace_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachments` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_marketplace_posts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_marketplace_posts: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_message_channels
CREATE TABLE IF NOT EXISTS `phone_message_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_group` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `last_message` varchar(50) NOT NULL DEFAULT '',
  `last_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_message_channels: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_message_members
CREATE TABLE IF NOT EXISTS `phone_message_members` (
  `channel_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `unread` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`channel_id`,`phone_number`),
  KEY `idx_members_phone_number` (`phone_number`),
  CONSTRAINT `phone_message_members_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_message_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_message_members: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_message_messages
CREATE TABLE IF NOT EXISTS `phone_message_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `phone_message_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_message_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_message_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_music_playlists
CREATE TABLE IF NOT EXISTS `phone_music_playlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cover` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_music_playlists_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_music_playlists: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_music_saved_playlists
CREATE TABLE IF NOT EXISTS `phone_music_saved_playlists` (
  `playlist_id` int(10) unsigned NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`playlist_id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_music_saved_playlists_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `phone_music_saved_playlists_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_music_saved_playlists: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_music_songs
CREATE TABLE IF NOT EXISTS `phone_music_songs` (
  `song_id` varchar(100) NOT NULL,
  `playlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`song_id`,`playlist_id`),
  KEY `playlist_id` (`playlist_id`),
  CONSTRAINT `phone_music_songs_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_music_songs: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_notes
CREATE TABLE IF NOT EXISTS `phone_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` longtext DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_notes_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_notes: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_notifications
CREATE TABLE IF NOT EXISTS `phone_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `show_avatar` tinyint(1) DEFAULT 0,
  `custom_data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_notifications_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_notifications: ~0 rows (approximately)
INSERT INTO `phone_notifications` (`id`, `phone_number`, `app`, `title`, `content`, `thumbnail`, `avatar`, `show_avatar`, `custom_data`, `timestamp`) VALUES
	(1, '5205195437', 'Mail', 'System', 'Your Email Address', NULL, NULL, NULL, NULL, '2025-09-11 00:29:06');

-- Dumping structure for table ahrp.phone_phones
CREATE TABLE IF NOT EXISTS `phone_phones` (
  `id` varchar(100) NOT NULL,
  `owner_id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `face_id` varchar(100) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `is_setup` tinyint(1) DEFAULT 0,
  `assigned` tinyint(1) DEFAULT 0,
  `battery` int(11) NOT NULL DEFAULT 100,
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_phones: ~0 rows (approximately)
INSERT INTO `phone_phones` (`id`, `owner_id`, `phone_number`, `name`, `pin`, `face_id`, `settings`, `is_setup`, `assigned`, `battery`, `last_seen`) VALUES
	('KI73TL9E', 'KI73TL9E', '5205195437', 'Mr\'s Phone', NULL, NULL, '{"latestVersion":"2.3.7","version":"2.3.7","sound":{"ringtone":"default","callVolume":0.5,"silent":false,"texttone":"default","volume":0.5},"phone":{"showCallerId":true},"wallpaper":{"background":"cloud8","blur":false},"streamerMode":false,"airplaneMode":false,"weather":{"celcius":false},"locale":"en","lockscreen":{"layout":1,"color":"gradient","fontStyle":1},"time":{"twelveHourClock":false},"security":{"pinCode":false,"faceId":false},"display":{"size":0.7,"theme":"dark","brightness":1,"automatic":false},"notifications":[],"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services"]],"storage":{"used":8576331,"total":128000000},"doNotDisturb":false,"name":"Mr\'s Phone"}', 1, 0, 100, '2025-09-14 13:02:14'),
	('S1L5K3M9', 'S1L5K3M9', '2055077856', NULL, NULL, NULL, NULL, 0, 0, 100, '2025-09-11 16:00:24');

-- Dumping structure for table ahrp.phone_phone_blocked_numbers
CREATE TABLE IF NOT EXISTS `phone_phone_blocked_numbers` (
  `phone_number` varchar(15) NOT NULL,
  `blocked_number` varchar(15) NOT NULL,
  PRIMARY KEY (`phone_number`,`blocked_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_phone_blocked_numbers: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_phone_calls
CREATE TABLE IF NOT EXISTS `phone_phone_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `answered` tinyint(1) DEFAULT 0,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_calls_missed` (`callee`,`answered`),
  KEY `idx_calls_callee_id` (`callee`),
  KEY `idx_calls_caller_id` (`caller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_phone_calls: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_phone_contacts
CREATE TABLE IF NOT EXISTS `phone_phone_contacts` (
  `contact_phone_number` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `profile_image` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `favourite` tinyint(1) DEFAULT 0,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`contact_phone_number`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_phone_contacts: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_phone_voicemail
CREATE TABLE IF NOT EXISTS `phone_phone_voicemail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `url` varchar(500) NOT NULL,
  `duration` int(11) NOT NULL,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_phone_voicemail: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_photos
CREATE TABLE IF NOT EXISTS `phone_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `link` varchar(500) NOT NULL,
  `is_video` tinyint(1) DEFAULT 0,
  `size` float NOT NULL DEFAULT 0,
  `metadata` varchar(20) DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_photos_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_photos: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_photo_albums
CREATE TABLE IF NOT EXISTS `phone_photo_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(100) NOT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_photo_albums_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_photo_albums: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_photo_album_members
CREATE TABLE IF NOT EXISTS `phone_photo_album_members` (
  `album_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`album_id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_photo_album_members_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `phone_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_photo_album_members_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_photo_album_members: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_photo_album_photos
CREATE TABLE IF NOT EXISTS `phone_photo_album_photos` (
  `album_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`album_id`,`photo_id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `phone_photo_album_photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `phone_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_photo_album_photos_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `phone_photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_photo_album_photos: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_services_channels
CREATE TABLE IF NOT EXISTS `phone_services_channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `company` varchar(50) NOT NULL,
  `last_message` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_services_channels: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_services_messages
CREATE TABLE IF NOT EXISTS `phone_services_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `sender` varchar(15) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `x_pos` int(11) DEFAULT NULL,
  `y_pos` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `phone_services_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_services_channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_services_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_accounts
CREATE TABLE IF NOT EXISTS `phone_tiktok_accounts` (
  `name` varchar(30) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `video_count` int(11) NOT NULL DEFAULT 0,
  `twitter` varchar(20) DEFAULT NULL,
  `instagram` varchar(20) DEFAULT NULL,
  `show_likes` tinyint(1) DEFAULT 1,
  `phone_number` varchar(15) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_tiktok_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_accounts: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_channels
CREATE TABLE IF NOT EXISTS `phone_tiktok_channels` (
  `id` varchar(10) NOT NULL,
  `last_message` varchar(50) NOT NULL,
  `member_1` varchar(20) NOT NULL,
  `member_2` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_1` (`member_1`,`member_2`),
  KEY `member_2` (`member_2`),
  CONSTRAINT `phone_tiktok_channels_ibfk_1` FOREIGN KEY (`member_1`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_channels_ibfk_2` FOREIGN KEY (`member_2`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_channels: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_comments
CREATE TABLE IF NOT EXISTS `phone_tiktok_comments` (
  `id` varchar(10) NOT NULL,
  `reply_to` varchar(10) DEFAULT NULL,
  `video_id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(550) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `replies` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  KEY `username` (`username`),
  KEY `reply_to` (`reply_to`),
  CONSTRAINT `phone_tiktok_comments_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_comments_ibfk_3` FOREIGN KEY (`reply_to`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_comments: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_comments_likes
CREATE TABLE IF NOT EXISTS `phone_tiktok_comments_likes` (
  `username` varchar(20) NOT NULL,
  `comment_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `phone_tiktok_comments_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_comments_likes_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_comments_likes: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_follows
CREATE TABLE IF NOT EXISTS `phone_tiktok_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `phone_tiktok_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_follows: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_likes
CREATE TABLE IF NOT EXISTS `phone_tiktok_likes` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `phone_tiktok_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_likes_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_likes: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_messages
CREATE TABLE IF NOT EXISTS `phone_tiktok_messages` (
  `id` varchar(10) NOT NULL,
  `channel_id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  KEY `sender` (`sender`),
  CONSTRAINT `phone_tiktok_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_tiktok_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_messages_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_notifications
CREATE TABLE IF NOT EXISTS `phone_tiktok_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `video_id` varchar(10) DEFAULT NULL,
  `comment_id` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  KEY `video_id` (`video_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `phone_tiktok_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_notifications_ibfk_3` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_notifications_ibfk_4` FOREIGN KEY (`comment_id`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_notifications: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_pinned_videos
CREATE TABLE IF NOT EXISTS `phone_tiktok_pinned_videos` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `phone_tiktok_pinned_videos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_pinned_videos_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_pinned_videos: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_saves
CREATE TABLE IF NOT EXISTS `phone_tiktok_saves` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `phone_tiktok_saves_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_saves_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_saves: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_unread_messages
CREATE TABLE IF NOT EXISTS `phone_tiktok_unread_messages` (
  `username` varchar(20) NOT NULL,
  `channel_id` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`,`channel_id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `phone_tiktok_unread_messages_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_unread_messages_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `phone_tiktok_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_unread_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_videos
CREATE TABLE IF NOT EXISTS `phone_tiktok_videos` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `src` varchar(500) NOT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `music` text DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `comments` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `saves` int(11) NOT NULL DEFAULT 0,
  `pinned_comment` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_tiktok_videos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_videos: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tiktok_views
CREATE TABLE IF NOT EXISTS `phone_tiktok_views` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `phone_tiktok_views_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_views_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tiktok_views: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tinder_accounts
CREATE TABLE IF NOT EXISTS `phone_tinder_accounts` (
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `photos` text DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `dob` date NOT NULL,
  `is_male` tinyint(1) NOT NULL,
  `interested_men` tinyint(1) NOT NULL,
  `interested_women` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `last_seen` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`phone_number`),
  CONSTRAINT `phone_tinder_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tinder_accounts: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tinder_matches
CREATE TABLE IF NOT EXISTS `phone_tinder_matches` (
  `phone_number_1` varchar(15) NOT NULL,
  `phone_number_2` varchar(15) NOT NULL,
  `latest_message` varchar(1000) DEFAULT NULL,
  `latest_message_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`phone_number_1`,`phone_number_2`),
  KEY `phone_number_2` (`phone_number_2`),
  CONSTRAINT `phone_tinder_matches_ibfk_1` FOREIGN KEY (`phone_number_1`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tinder_matches_ibfk_2` FOREIGN KEY (`phone_number_2`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tinder_matches: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tinder_messages
CREATE TABLE IF NOT EXISTS `phone_tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(15) NOT NULL,
  `recipient` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `phone_tinder_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tinder_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tinder_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_tinder_swipes
CREATE TABLE IF NOT EXISTS `phone_tinder_swipes` (
  `swiper` varchar(15) NOT NULL,
  `swipee` varchar(15) NOT NULL,
  `liked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`swiper`,`swipee`),
  KEY `swipee` (`swipee`),
  CONSTRAINT `phone_tinder_swipes_ibfk_1` FOREIGN KEY (`swiper`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tinder_swipes_ibfk_2` FOREIGN KEY (`swipee`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_tinder_swipes: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_twitter_accounts
CREATE TABLE IF NOT EXISTS `phone_twitter_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `profile_header` varchar(500) DEFAULT NULL,
  `pinned_tweet` varchar(50) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `private` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_twitter_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_twitter_accounts: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_twitter_follows
CREATE TABLE IF NOT EXISTS `phone_twitter_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  `notifications` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `phone_twitter_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_twitter_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_twitter_follows: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_twitter_follow_requests
CREATE TABLE IF NOT EXISTS `phone_twitter_follow_requests` (
  `requester` varchar(20) NOT NULL,
  `requestee` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`requester`,`requestee`),
  KEY `requestee` (`requestee`),
  CONSTRAINT `phone_twitter_follow_requests_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_twitter_follow_requests_ibfk_2` FOREIGN KEY (`requestee`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_twitter_follow_requests: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_twitter_hashtags
CREATE TABLE IF NOT EXISTS `phone_twitter_hashtags` (
  `hashtag` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `last_used` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hashtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_twitter_hashtags: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_twitter_likes
CREATE TABLE IF NOT EXISTS `phone_twitter_likes` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tweet_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `phone_twitter_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_twitter_likes: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_twitter_messages
CREATE TABLE IF NOT EXISTS `phone_twitter_messages` (
  `id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `phone_twitter_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_twitter_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_twitter_messages: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_twitter_notifications
CREATE TABLE IF NOT EXISTS `phone_twitter_notifications` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `tweet_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  CONSTRAINT `phone_twitter_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_twitter_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_twitter_notifications: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_twitter_promoted
CREATE TABLE IF NOT EXISTS `phone_twitter_promoted` (
  `tweet_id` varchar(50) NOT NULL,
  `promotions` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tweet_id`),
  CONSTRAINT `phone_twitter_promoted_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `phone_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_twitter_promoted: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_twitter_retweets
CREATE TABLE IF NOT EXISTS `phone_twitter_retweets` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tweet_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `phone_twitter_retweets_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_twitter_retweets: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_twitter_tweets
CREATE TABLE IF NOT EXISTS `phone_twitter_tweets` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `content` varchar(280) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `reply_to` varchar(50) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `reply_count` int(11) DEFAULT 0,
  `retweet_count` int(11) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_twitter_tweets_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_twitter_tweets: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_voice_memos_recordings
CREATE TABLE IF NOT EXISTS `phone_voice_memos_recordings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_length` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_voice_memos_recordings_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_voice_memos_recordings: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_wallet_transactions
CREATE TABLE IF NOT EXISTS `phone_wallet_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_wallet_transactions_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_wallet_transactions: ~0 rows (approximately)

-- Dumping structure for table ahrp.phone_yellow_pages_posts
CREATE TABLE IF NOT EXISTS `phone_yellow_pages_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.phone_yellow_pages_posts: ~0 rows (approximately)

-- Dumping structure for table ahrp.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned DEFAULT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_logged_out` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.players: ~2 rows (approximately)
INSERT INTO `players` (`id`, `userId`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `phone_number`, `last_updated`, `last_logged_out`) VALUES
	(1, 1, 'KI73TL9E', 1, 'license2:a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5', 'DEV Dx', '{"bank":6250,"cash":500,"crypto":0}', '{"lastname":"Dx","nationality":"Bangladesh","phone":"2714895596","backstory":"placeholder backstory","cid":1,"gender":0,"firstname":"Mr","account":"US01QBX8934590033","birthdate":"11.09.1995"}', '{"isboss":false,"label":"LSPD","grade":{"level":3,"name":"Lieutenant"},"bankAuth":false,"onduty":true,"type":"leo","payment":125,"name":"police"}', '{"isboss":false,"label":"No Gang","grade":{"level":0,"name":"Unaffiliated"},"bankAuth":false,"name":"none"}', '{"x":-211.22637939453126,"y":-1167.5076904296876,"z":23.028564453125,"w":218.26771545410157}', '{"dealerrep":0,"bloodtype":"AB+","callsign":"NO CALLSIGN","walletid":"QB-51780742","fingerprint":"U6Z32W6XIP90KW5","health":200,"stress":0,"optin":false,"inlaststand":false,"inside":{"apartment":[]},"status":[],"jailitems":[],"craftingrep":0,"criminalrecord":{"hasRecord":false},"phonedata":{"InstalledApps":[],"SerialNumber":65283639},"ishandcuffed":false,"thirst":16.40000000000003,"hunger":7.59999999999995,"attachmentcraftingrep":0,"armor":0,"tracker":false,"injail":0,"phone":[],"jobrep":{"taxi":0,"hotdog":0,"tow":0,"trucker":0},"licences":{"driver":true,"id":true,"weapon":false},"isdead":false}', '[{"slot":3,"name":"phone","count":1},{"slot":13,"name":"money","count":500}]', NULL, '2025-09-14 13:30:30', '2025-09-14 13:30:29'),
	(11, 2, 'S1L5K3M9', 5, 'license2:3588634a5bf8693cc225a6515fbd20936019a06e', 'ItzDemonSlayer', '{"crypto":0,"cash":44,"bank":5460}', '{"firstname":"Demon","backstory":"placeholder backstory","birthdate":"01.09.1958","account":"US05QBX7638937983","phone":"2191700815","cid":5,"gender":0,"nationality":"Afghanistan","lastname":"Test"}', '{"isboss":true,"grade":{"name":"Chief","level":4},"onduty":true,"type":"leo","label":"LSPD","name":"police","payment":150}', '{"isboss":false,"bankAuth":false,"label":"No Gang","name":"none","grade":{"name":"Unaffiliated","level":0}}', '{"x":410.3208923339844,"y":-984.2109985351563,"z":29.2630615234375,"w":104.88188934326172}', '{"callsign":"NO CALLSIGN","walletid":"QB-98317931","hunger":70.59999999999998,"bloodtype":"AB+","craftingrep":0,"phone":[],"dealerrep":0,"armor":0,"injail":0,"isdead":false,"stress":14,"status":[],"phonedata":{"InstalledApps":[],"SerialNumber":60117234},"fingerprint":"5Y272F9CCQT3D5K","inside":{"apartment":[]},"attachmentcraftingrep":0,"ishandcuffed":false,"inlaststand":false,"criminalrecord":{"hasRecord":false},"jobrep":{"taxi":0,"trucker":0,"hotdog":0,"tow":0},"tracker":false,"licences":{"id":true,"weapon":true,"driver":true},"jailitems":[],"optin":false,"health":200,"thirst":73.40000000000002}', '[{"metadata":{"serial":"270398POL979423","components":[],"durability":97.9,"ammo":30,"registered":"Demon Test"},"count":1,"name":"WEAPON_PDMK33","slot":1},{"count":44,"name":"money","slot":21},{"count":1,"name":"phone","slot":22},{"count":39,"name":"ammo-rifle","slot":16},{"metadata":{"birthdate":"01.09.1958","firstname":"Demon","lastname":"Test","type":"Class C Driver License"},"count":1,"name":"driver_license","slot":11},{"count":1,"name":"tablet","slot":6}]', NULL, '2025-09-11 16:33:17', '2025-09-11 16:33:17');

-- Dumping structure for table ahrp.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.playerskins: ~0 rows (approximately)
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(1, 'KI73TL9E', 'mp_m_freemode_01', '{"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-1.3},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":-0.2},"decals":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":0},"sun_damage":{"opacity":0.72,"texture":0,"defaultItem":0,"item":6,"defaultTexture":0,"highlight":0},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":-1.1},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":-4.6},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":-1.5},"bag":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":0},"face":{"defaultItem":0,"defaultTexture":0,"texture":2,"item":2},"facemix":{"shapeMix":0.77932724804629,"skinMix":0.57881157007501},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":1.1},"skinMom":44,"eyebrows":{"opacity":0.2,"texture":0,"defaultItem":-1,"item":15,"defaultTexture":1,"highlight":0},"accessory":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":0},"tattoos":[],"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":3.2},"hair":{"style":0,"texture":1,"defaultItem":0,"item":39,"defaultTexture":0,"highlight":1},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":-4.1},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-0.6},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":-0.1},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":1.1},"skinDad":37,"pants":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":6},"arms":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":1},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":1.6},"face2":{"defaultItem":0,"defaultTexture":0,"texture":21,"item":21},"shoes":{"defaultItem":1,"defaultTexture":0,"texture":0,"item":61},"torso2":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":14},"complexion":{"opacity":0.58,"texture":0,"defaultItem":0,"item":9,"defaultTexture":0,"highlight":0},"moles":{"opacity":0.43,"texture":0,"defaultItem":-1,"item":1,"defaultTexture":0,"highlight":0},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":-3.8},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":-4.69999999999999},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":-5.0},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":1.7},"ageing":{"opacity":0.29,"texture":0,"defaultItem":-1,"item":4,"defaultTexture":0,"highlight":0},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":-0.4},"vest":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":0},"t-shirt":{"defaultItem":1,"defaultTexture":0,"texture":0,"item":15},"eye_color":{"defaultItem":-1,"defaultTexture":0,"texture":0,"item":1},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.1},"mask":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":0},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":-0.1}}', 1),
	(2, 'S1L5K3M9', 'mp_m_freemode_01', '{"nose_1":{"defaultItem":0,"item":0.89999999999999,"defaultTexture":0},"skinMom":29,"skinDad":41,"eyebrows":{"opacity":0.68,"item":27,"highlight":0,"defaultTexture":1,"defaultItem":-1,"texture":0},"chimp_bone_lenght":{"defaultItem":0,"item":-2.0,"defaultTexture":0},"cheek_1":{"defaultItem":0,"item":-2.1,"defaultTexture":0},"nose_3":{"defaultItem":0,"item":0.4,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":-0.8,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"item":-4.8,"defaultTexture":0},"tattoos":[],"pants":{"defaultItem":0,"item":105,"defaultTexture":0,"texture":0},"moles":{"opacity":0.19,"item":6,"highlight":0,"defaultTexture":0,"defaultItem":-1,"texture":0},"nose_5":{"defaultItem":0,"item":2.4,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"item":3.7,"defaultTexture":0},"ageing":{"opacity":0.63,"item":4,"highlight":0,"defaultTexture":0,"defaultItem":-1,"texture":0},"eye_opening":{"defaultItem":0,"item":-1.3,"defaultTexture":0},"nose_2":{"defaultItem":0,"item":-0.5,"defaultTexture":0},"arms":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"jaw_bone_width":{"defaultItem":0,"item":-2.6,"defaultTexture":0},"decals":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"face":{"defaultItem":0,"item":12,"defaultTexture":0,"texture":12},"hair":{"defaultItem":0,"item":28,"highlight":1,"style":0,"defaultTexture":0,"texture":1},"facemix":{"skinMix":0.35554423068235,"shapeMix":0.49749189822978},"t-shirt":{"defaultItem":1,"item":15,"defaultTexture":0,"texture":0},"shoes":{"defaultItem":1,"item":42,"defaultTexture":0,"texture":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":1.9,"defaultTexture":0},"complexion":{"opacity":0.06,"item":7,"highlight":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"defaultItem":0,"item":-0.3,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":-2.0,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"item":0.2,"defaultTexture":0},"torso2":{"defaultItem":0,"item":50,"defaultTexture":0,"texture":0},"face2":{"defaultItem":0,"item":23,"defaultTexture":0,"texture":23},"chimp_hole":{"defaultItem":0,"item":-4.3,"defaultTexture":0},"vest":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"mask":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"lips_thickness":{"defaultItem":0,"item":-0.8,"defaultTexture":0},"bag":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"nose_4":{"defaultItem":0,"item":0.89999999999999,"defaultTexture":0},"sun_damage":{"opacity":0.75,"item":8,"highlight":0,"defaultTexture":0,"defaultItem":0,"texture":0},"accessory":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"cheek_2":{"defaultItem":0,"item":-4.8,"defaultTexture":0},"eye_color":{"defaultItem":-1,"item":1,"defaultTexture":0,"texture":0}}', 1);

-- Dumping structure for table ahrp.player_groups
CREATE TABLE IF NOT EXISTS `player_groups` (
  `citizenid` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `grade` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`citizenid`,`type`,`group`),
  CONSTRAINT `fk_citizenid` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.player_groups: ~2 rows (approximately)
INSERT INTO `player_groups` (`citizenid`, `group`, `type`, `grade`) VALUES
	('KI73TL9E', 'police', 'job', 3),
	('S1L5K3M9', 'police', 'job', 4);

-- Dumping structure for table ahrp.player_jobs_activity
CREATE TABLE IF NOT EXISTS `player_jobs_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) NOT NULL,
  `last_checkin` int(11) NOT NULL,
  `last_checkout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id` DESC) USING BTREE,
  KEY `last_checkout` (`last_checkout`) USING BTREE,
  KEY `citizenid_job` (`citizenid`,`job`) USING BTREE,
  CONSTRAINT `player_jobs_activity_ibfk_1` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ahrp.player_jobs_activity: ~0 rows (approximately)
INSERT INTO `player_jobs_activity` (`id`, `citizenid`, `job`, `last_checkin`, `last_checkout`) VALUES
	(1, 'KI73TL9E', 'police', 1757617279, 1757620464);

-- Dumping structure for table ahrp.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.player_mails: ~0 rows (approximately)

-- Dumping structure for table ahrp.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` text DEFAULT NULL,
  `components` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.player_outfits: ~0 rows (approximately)
INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `props`, `components`) VALUES
	(26, 'KI73TL9E', 'Starting Outfit', 'mp_m_freemode_01', '[]', '[{"drawable":14,"variation":0,"component":11},{"drawable":0,"variation":0,"component":1},{"drawable":1,"variation":0,"component":3},{"drawable":39,"variation":0,"component":2},{"drawable":0,"variation":0,"component":5},{"drawable":0,"variation":0,"component":9},{"drawable":0,"variation":0,"component":7},{"drawable":0,"variation":0,"component":10},{"drawable":61,"variation":0,"component":6},{"drawable":6,"variation":0,"component":4},{"drawable":15,"variation":0,"component":8}]'),
	(27, 'S1L5K3M9', 'Starting Outfit', 'mp_m_freemode_01', '[]', '[{"variation":0,"component":3,"drawable":0},{"variation":0,"component":7,"drawable":0},{"variation":0,"component":2,"drawable":28},{"variation":0,"component":11,"drawable":50},{"variation":0,"component":6,"drawable":42},{"variation":0,"component":1,"drawable":0},{"variation":0,"component":8,"drawable":15},{"variation":0,"component":4,"drawable":105},{"variation":0,"component":10,"drawable":0},{"variation":0,"component":9,"drawable":0},{"variation":0,"component":5,"drawable":0}]');

-- Dumping structure for table ahrp.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.player_outfit_codes: ~0 rows (approximately)

-- Dumping structure for table ahrp.player_priv_garages
CREATE TABLE IF NOT EXISTS `player_priv_garages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owners` longtext DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `z` float DEFAULT NULL,
  `h` float DEFAULT NULL,
  `distance` int(11) DEFAULT 10,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.player_priv_garages: ~0 rows (approximately)

-- Dumping structure for table ahrp.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.player_transactions: ~0 rows (approximately)

-- Dumping structure for table ahrp.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(15) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `damage` longtext DEFAULT '',
  `in_garage` tinyint(1) DEFAULT 1,
  `garage_id` varchar(255) DEFAULT 'Legion Square',
  `job_vehicle` tinyint(1) DEFAULT 0,
  `job_vehicle_rank` int(10) DEFAULT 0,
  `gang_vehicle` tinyint(1) DEFAULT 0,
  `gang_vehicle_rank` int(10) DEFAULT 0,
  `impound` int(10) DEFAULT 0,
  `impound_retrievable` int(10) DEFAULT 0,
  `impound_data` longtext DEFAULT '',
  `nickname` varchar(255) DEFAULT '',
  `financed` tinyint(1) NOT NULL DEFAULT 0,
  `finance_data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  CONSTRAINT `player_vehicles_ibfk_1` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.player_vehicles: ~0 rows (approximately)

-- Dumping structure for table ahrp.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_name` varchar(255) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `price` int(11) NOT NULL DEFAULT 0,
  `owner` varchar(50) DEFAULT NULL,
  `interior` varchar(255) NOT NULL,
  `keyholders` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`keyholders`)),
  `rent_interval` int(11) DEFAULT NULL,
  `interact_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`interact_options`)),
  `stash_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`stash_options`)),
  `garage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage`)),
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `players` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.properties: ~0 rows (approximately)

-- Dumping structure for table ahrp.properties_decorations
CREATE TABLE IF NOT EXISTS `properties_decorations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `rotation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`rotation`)),
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `properties_decorations_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.properties_decorations: ~0 rows (approximately)

-- Dumping structure for table ahrp.snipe_menu_modsettings
CREATE TABLE IF NOT EXISTS `snipe_menu_modsettings` (
  `role` varchar(100) NOT NULL,
  `settings` longtext DEFAULT NULL,
  PRIMARY KEY (`role`),
  KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Dumping data for table ahrp.snipe_menu_modsettings: ~0 rows (approximately)

-- Dumping structure for table ahrp.snipe_menu_perms
CREATE TABLE IF NOT EXISTS `snipe_menu_perms` (
  `identifier` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `perms` longtext DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Dumping data for table ahrp.snipe_menu_perms: ~0 rows (approximately)

-- Dumping structure for table ahrp.snipe_menu_stashesprop
CREATE TABLE IF NOT EXISTS `snipe_menu_stashesprop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(100) DEFAULT NULL,
  `heading` float DEFAULT NULL,
  `stashName` varchar(50) DEFAULT '0',
  `job` varchar(100) DEFAULT '0',
  `size` bigint(20) DEFAULT 0,
  `slots` bigint(20) DEFAULT 0,
  `coords` longtext DEFAULT NULL,
  `isJob` tinyint(4) DEFAULT 0,
  `isGang` tinyint(4) DEFAULT 0,
  `rotation` longtext DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Dumping data for table ahrp.snipe_menu_stashesprop: ~0 rows (approximately)

-- Dumping structure for table ahrp.users
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `license2` varchar(50) DEFAULT NULL,
  `fivem` varchar(20) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.users: ~0 rows (approximately)
INSERT INTO `users` (`userId`, `username`, `license`, `license2`, `fivem`, `discord`) VALUES
	(1, 'DEV Dx', 'license:dd7efc1d5db42797e8b4c351e1b536aee84c43e7', 'license2:a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5', NULL, 'discord:811436286006657025'),
	(2, 'ItzDemonSlayer', 'license:3588634a5bf8693cc225a6515fbd20936019a06e', 'license2:3588634a5bf8693cc225a6515fbd20936019a06e', 'fivem:5751927', 'discord:677439579585773589');

-- Dumping structure for table ahrp.vehicle_financing
CREATE TABLE IF NOT EXISTS `vehicle_financing` (
  `vehicleId` int(11) NOT NULL,
  `balance` int(11) DEFAULT NULL,
  `paymentamount` int(11) DEFAULT NULL,
  `paymentsleft` int(11) DEFAULT NULL,
  `financetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`vehicleId`),
  CONSTRAINT `vehicleId` FOREIGN KEY (`vehicleId`) REFERENCES `player_vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ahrp.vehicle_financing: ~0 rows (approximately)

-- Dumping structure for table ahrp.weed_plants
CREATE TABLE IF NOT EXISTS `weed_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(30) DEFAULT NULL,
  `stage` tinyint(4) NOT NULL DEFAULT 1,
  `sort` varchar(30) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `food` tinyint(4) NOT NULL DEFAULT 100,
  `health` tinyint(4) NOT NULL DEFAULT 100,
  `stageProgress` tinyint(4) NOT NULL DEFAULT 0,
  `coords` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table ahrp.weed_plants: ~0 rows (approximately)

-- Dumping structure for table ahrp.wsb_cctvcameras
CREATE TABLE IF NOT EXISTS `wsb_cctvcameras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table ahrp.wsb_cctvcameras: ~0 rows (approximately)

-- Dumping structure for table ahrp.wsb_speedtraps
CREATE TABLE IF NOT EXISTS `wsb_speedtraps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table ahrp.wsb_speedtraps: ~0 rows (approximately)

-- Dumping structure for table ahrp.xt_prison
CREATE TABLE IF NOT EXISTS `xt_prison` (
  `identifier` varchar(100) NOT NULL,
  `jailtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.xt_prison: ~0 rows (approximately)
INSERT INTO `xt_prison` (`identifier`, `jailtime`) VALUES
	('KI73TL9E', 0),
	('S1L5K3M9', 0);

-- Dumping structure for table ahrp.xt_prison_items
CREATE TABLE IF NOT EXISTS `xt_prison_items` (
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  UNIQUE KEY `owner` (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table ahrp.xt_prison_items: ~0 rows (approximately)

-- Dumping structure for trigger ahrp.phone_instagram_decrement_comment_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_comment_count
AFTER DELETE ON phone_instagram_comments
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_posts
    SET comment_count = comment_count - 1
    WHERE id = OLD.post_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_instagram_decrement_like_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_like_count
AFTER DELETE ON phone_instagram_likes
FOR EACH ROW
BEGIN
    IF OLD.is_comment = 0 THEN
        UPDATE phone_instagram_posts
        SET like_count = like_count - 1
        WHERE id = OLD.id;
    ELSE
        UPDATE phone_instagram_comments
        SET like_count = like_count - 1
        WHERE id = OLD.id;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_instagram_decrement_post_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_post_count
AFTER DELETE ON phone_instagram_posts
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET post_count = post_count - 1
    WHERE username = OLD.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_instagram_decrement_story_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_story_count
AFTER DELETE ON phone_instagram_stories
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET story_count = story_count - 1
    WHERE username = OLD.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_instagram_increment_comment_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_comment_count
AFTER INSERT ON phone_instagram_comments
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_posts
    SET comment_count = comment_count + 1
    WHERE id = NEW.post_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_instagram_increment_like_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_like_count
AFTER INSERT ON phone_instagram_likes
FOR EACH ROW
BEGIN
    IF NEW.is_comment = 0 THEN
        UPDATE phone_instagram_posts
        SET like_count = like_count + 1
        WHERE id = NEW.id;
    ELSE
        UPDATE phone_instagram_comments
        SET like_count = like_count + 1
        WHERE id = NEW.id;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_instagram_increment_post_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_post_count
AFTER INSERT ON phone_instagram_posts
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET post_count = post_count + 1
    WHERE username = NEW.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_instagram_increment_story_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_story_count
AFTER INSERT ON phone_instagram_stories
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET story_count = story_count + 1
    WHERE username = NEW.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_instagram_update_counts_after_follow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_update_counts_after_follow
AFTER INSERT ON phone_instagram_follows
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    UPDATE phone_instagram_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_instagram_update_counts_after_unfollow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_update_counts_after_unfollow
AFTER DELETE ON phone_instagram_follows
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    UPDATE phone_instagram_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_decrement_account_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_account_likes
AFTER DELETE ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_accounts
    JOIN phone_tiktok_videos ON phone_tiktok_videos.username = phone_tiktok_accounts.username
    SET phone_tiktok_accounts.like_count = phone_tiktok_accounts.like_count - 1
    WHERE phone_tiktok_videos.id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_decrement_comment_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_comment_likes
AFTER DELETE ON phone_tiktok_comments_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_comments
    SET likes = likes - 1
    WHERE id = OLD.comment_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_decrement_video_comments
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_video_comments
BEFORE DELETE ON phone_tiktok_comments
FOR EACH ROW
BEGIN
    DECLARE v_replies_count INT;

    -- Count the replies for the comment
    SELECT COUNT(*) INTO v_replies_count
    FROM phone_tiktok_comments
    WHERE reply_to = OLD.id;

    -- Update the video's comments count
    UPDATE phone_tiktok_videos
    SET comments = comments - (1 + v_replies_count)
    WHERE id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_decrement_video_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_video_likes
AFTER DELETE ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET likes = likes - 1
    WHERE id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_decrement_video_saves
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_video_saves
AFTER DELETE ON phone_tiktok_saves
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET saves = saves - 1
    WHERE id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_increment_account_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_account_likes
AFTER INSERT ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_accounts
    JOIN phone_tiktok_videos ON phone_tiktok_videos.username = phone_tiktok_accounts.username
    SET phone_tiktok_accounts.like_count = phone_tiktok_accounts.like_count + 1
    WHERE phone_tiktok_videos.id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_increment_comment_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_comment_likes
AFTER INSERT ON phone_tiktok_comments_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_comments
    SET likes = likes + 1
    WHERE id = NEW.comment_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_increment_video_comments
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_comments
AFTER INSERT ON phone_tiktok_comments
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET comments = comments + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_increment_video_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_count
AFTER INSERT ON phone_tiktok_videos
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_accounts
    SET video_count = video_count + 1
    WHERE username = NEW.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_increment_video_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_likes
AFTER INSERT ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET likes = likes + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_increment_video_saves
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_saves
AFTER INSERT ON phone_tiktok_saves
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET saves = saves + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_increment_video_views
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_views
AFTER INSERT ON phone_tiktok_views
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET views = views + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_update_counts_after_follow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_update_counts_after_follow
AFTER INSERT ON phone_tiktok_follows
FOR EACH ROW
BEGIN
    -- Increment the follower_count for the followed user
    UPDATE phone_tiktok_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    -- Increment the following_count for the follower user
    UPDATE phone_tiktok_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_update_counts_after_unfollow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_update_counts_after_unfollow
AFTER DELETE ON phone_tiktok_follows
FOR EACH ROW
BEGIN
    -- Decrement the follower_count for the followed user
    UPDATE phone_tiktok_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    -- Decrement the following_count for the follower user
    UPDATE phone_tiktok_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_tiktok_update_last_message
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_update_last_message
AFTER INSERT ON phone_tiktok_messages
FOR EACH ROW
BEGIN
    DECLARE modified_content TEXT CHARACTER SET utf8mb4;

    IF NEW.content LIKE '<!SHARED-VIDEO-URL%' THEN
        SET modified_content = 'Shared a video';
    ELSEIF LENGTH(NEW.content) > 50 THEN
        SET modified_content = CONCAT(SUBSTR(NEW.content, 1, 17), '...');
    ELSE
        SET modified_content = NEW.content;
    END IF;

    UPDATE phone_tiktok_channels
    SET last_message = modified_content
    WHERE id = NEW.channel_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_twitter_update_counts_after_follow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_counts_after_follow
AFTER INSERT ON phone_twitter_follows
FOR EACH ROW
BEGIN
    -- Increment the follower_count for the followed user
    UPDATE phone_twitter_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    -- Increment the following_count for the follower user
    UPDATE phone_twitter_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_twitter_update_counts_after_unfollow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_counts_after_unfollow
AFTER DELETE ON phone_twitter_follows
FOR EACH ROW
BEGIN
    -- Decrement the follower_count for the followed user
    UPDATE phone_twitter_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    -- Decrement the following_count for the follower user
    UPDATE phone_twitter_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_twitter_update_like_count_after_like
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_like_count_after_like
AFTER INSERT ON phone_twitter_likes
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET like_count = like_count + 1
    WHERE id = NEW.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_twitter_update_like_count_after_unlike
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_like_count_after_unlike
AFTER DELETE ON phone_twitter_likes
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET like_count = like_count - 1
    WHERE id = OLD.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_twitter_update_retweet_count_after_retweet
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_retweet_count_after_retweet
AFTER INSERT ON phone_twitter_retweets
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET retweet_count = retweet_count + 1
    WHERE id = NEW.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ahrp.phone_twitter_update_retweet_count_after_unretweet
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_retweet_count_after_unretweet
AFTER DELETE ON phone_twitter_retweets
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET retweet_count = retweet_count - 1
    WHERE id = OLD.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
