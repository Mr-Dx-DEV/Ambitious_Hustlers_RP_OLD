CREATE TABLE IF NOT EXISTS `lation_diving` (
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `exp` int(11) NOT NULL DEFAULT 0,
  `crates` int(11) NOT NULL DEFAULT 0,
  `depth` int(11) NOT NULL DEFAULT 0,
  `swam` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
);