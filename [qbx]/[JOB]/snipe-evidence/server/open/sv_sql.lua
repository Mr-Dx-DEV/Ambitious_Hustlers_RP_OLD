MySQL.ready(function()
    if Config.Framework == "qb" or Config.Framework == "qbx" then
        local dbName = MySQL.Sync.fetchScalar("SELECT DATABASE()")
        
        local collation = MySQL.Sync.fetchScalar("SELECT COLLATION_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'players' AND COLUMN_NAME = 'citizenid'", {
            ['@db'] = dbName
        })
        
        local characterSet = MySQL.Sync.fetchScalar("SELECT CHARACTER_SET_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'players' AND COLUMN_NAME = 'citizenid'", {
            ['@db'] = dbName
        })
        
        MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `snipe_evidence_identifiers` (`identifier` varchar(200) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `dna` varchar(200) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `fingerprint` varchar(200) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `is_taken` enum('1','0') DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;")
        MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `snipe_evidence_crimescenes` (`id` int(11) NOT NULL AUTO_INCREMENT, `cs_id` varchar(150) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " NOT NULL DEFAULT '0', `name` longtext CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " NOT NULL, `description` longtext CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " NOT NULL,PRIMARY KEY (`id`),KEY `cs_id` (`cs_id`)) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;")
        MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `snipe_evidence_evidences` (`id` varchar(150) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `evidence_id` varchar(50) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `type` varchar(150) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `data` longtext CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, KEY `FK__snipe_evidence_crimescenes` (`id`), KEY `evidence_id` (`evidence_id`), CONSTRAINT `FK__snipe_evidence_crimescenes` FOREIGN KEY (`id`) REFERENCES `snipe_evidence_crimescenes` (`cs_id`) ON DELETE CASCADE ON UPDATE NO ACTION) ENGINE=InnoDB DEFAULT CHARSET=utf8;")
    elseif Config.Framework == "esx" then
        local dbName = MySQL.Sync.fetchScalar("SELECT DATABASE()")
        
        local collation = MySQL.Sync.fetchScalar("SELECT COLLATION_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'users' AND COLUMN_NAME = 'identifier'", {
            ['@db'] = dbName
        })
        
        local characterSet = MySQL.Sync.fetchScalar("SELECT CHARACTER_SET_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'users' AND COLUMN_NAME = 'identifier'", {
            ['@db'] = dbName
        })

        MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `snipe_evidence_identifiers` (`identifier` varchar(200) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `dna` varchar(200) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `fingerprint` varchar(200) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `is_taken` enum('1','0') DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;")
        MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `snipe_evidence_crimescenes` (`id` int(11) NOT NULL AUTO_INCREMENT, `cs_id` varchar(150) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " NOT NULL DEFAULT '0', `name` longtext CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " NOT NULL, `description` longtext CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " NOT NULL,PRIMARY KEY (`id`),KEY `cs_id` (`cs_id`)) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;")
        MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `snipe_evidence_evidences` (`id` varchar(150) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `evidence_id` varchar(50) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `type` varchar(150) CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, `data` longtext CHARACTER SET " .. characterSet .. " COLLATE " .. collation .. " DEFAULT NULL, KEY `FK__snipe_evidence_crimescenes` (`id`), KEY `evidence_id` (`evidence_id`), CONSTRAINT `FK__snipe_evidence_crimescenes` FOREIGN KEY (`id`) REFERENCES `snipe_evidence_crimescenes` (`cs_id`) ON DELETE CASCADE ON UPDATE NO ACTION) ENGINE=InnoDB DEFAULT CHARSET=utf8;")
    end

    -- Alter table snipe_evidence_crimescenes add column is_deleted enum 0, 1
    MySQL.Sync.execute("ALTER TABLE snipe_evidence_crimescenes ADD COLUMN IF NOT EXISTS is_deleted ENUM('0', '1') DEFAULT '0'", {})
end)