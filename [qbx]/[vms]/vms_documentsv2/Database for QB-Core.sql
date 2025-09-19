CREATE TABLE IF NOT EXISTS `player_documents` (
  `serial_number` varchar(50) NOT NULL DEFAULT '',
  `owner` varchar(80) DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `photo` longtext DEFAULT NULL,
  `valid` tinyint(4) DEFAULT 1,
  `for_pickup` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;