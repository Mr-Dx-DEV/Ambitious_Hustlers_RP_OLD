CREATE TABLE IF NOT EXISTS `rentvehs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `vehicle` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `time` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;