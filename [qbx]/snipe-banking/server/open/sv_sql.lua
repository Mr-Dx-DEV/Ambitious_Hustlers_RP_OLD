dbLoaded = false
MySQL.ready(function()

    -- this will cleanup the banking_management table if the player has deleted their character
    -- the reason being you cannot search the history of these players if their character is deleted!

    if Config.Framework == "qb" then
        MySQL.Async.execute("DELETE FROM banking_management WHERE identifier NOT IN (SELECT citizenid FROM players)", {}, function() end)
    elseif Config.Framework == "esx" then
        MySQL.Async.execute("DELETE FROM banking_management WHERE identifier NOT IN (SELECT identifier FROM users)", {}, function() end)
    end
    local collation = nil
    local characterSet = nil

    if Config.Framework == "qb" then
        local dbName = MySQL.Sync.fetchScalar("SELECT DATABASE()")
        
        collation = MySQL.Sync.fetchScalar("SELECT COLLATION_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'players' AND COLUMN_NAME = 'citizenid'", {
            ['@db'] = dbName
        })
        
        characterSet = MySQL.Sync.fetchScalar("SELECT CHARACTER_SET_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'players' AND COLUMN_NAME = 'citizenid'", {
            ['@db'] = dbName
        })
        
    elseif Config.Framework == "esx" then
        local dbName = MySQL.Sync.fetchScalar("SELECT DATABASE()")
        
        collation = MySQL.Sync.fetchScalar("SELECT COLLATION_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'users' AND COLUMN_NAME = 'identifier'", {
            ['@db'] = dbName
        })
        
        characterSet = MySQL.Sync.fetchScalar("SELECT CHARACTER_SET_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'users' AND COLUMN_NAME = 'identifier'", {
            ['@db'] = dbName
        })
    end
    
    MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `banking_accounts` (`account` varchar(50) NOT NULL, `amount` int(11) NOT NULL DEFAULT 0, `label` varchar(100) NOT NULL DEFAULT '', PRIMARY KEY (`account`) USING BTREE) ENGINE=InnoDB DEFAULT CHARSET=" .. characterSet .. " COLLATE " .. collation .. " COMMENT='Stores account data for jobs and gangs';", {})
    MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `banking_loans` (`id` varchar(50) NOT NULL, `player_id` varchar(100) NOT NULL COMMENT 'Loan created by', `amount` int(11) NOT NULL DEFAULT 0, `interest` int(11) NOT NULL DEFAULT 0, `start_date` datetime NOT NULL DEFAULT current_timestamp(), `end_date` datetime NOT NULL, `other_player_id` varchar(100) NOT NULL COMMENT 'Loan borrowed by', `is_accepted` tinyint(4) NOT NULL DEFAULT 0, `created_at` datetime NOT NULL DEFAULT current_timestamp(), `deleted_at` datetime DEFAULT NULL, `loan_closed` int(11) DEFAULT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=" .. characterSet .. " COLLATE " .. collation .. " COMMENT='Contains all the information of all the loans';", {})
    MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `banking_loan_transactions` (`id` int(11) NOT NULL AUTO_INCREMENT, `loan_id` varchar(50) DEFAULT NULL, `amount_paid` int(11) NOT NULL, `created_at` datetime NOT NULL DEFAULT current_timestamp(), PRIMARY KEY (`id`), KEY `FK_banking_loan_transactions_banking_loans` (`loan_id`), CONSTRAINT `FK_banking_loan_transactions_banking_loans` FOREIGN KEY (`loan_id`) REFERENCES `banking_loans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=" .. characterSet .. " COLLATE " .. collation .. " COMMENT='Holds the transactions for all the loans';", {})
    MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `banking_management` (`id` int(10) unsigned NOT NULL AUTO_INCREMENT, `identifier` varchar(100) NOT NULL, `status` enum('flagged','frozen','unflagged','unfrozen') NOT NULL, `reason` longtext NOT NULL, `managed_by` varchar(100) NOT NULL, `created_at` datetime NOT NULL DEFAULT current_timestamp(), `deleted_at` datetime DEFAULT NULL ON UPDATE current_timestamp(), PRIMARY KEY (`id`)) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=" .. characterSet .. " COLLATE " .. collation .. ";", {})
    MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `banking_users` (`identifier` varchar(100) NOT NULL, `unique_id` varchar(100) NOT NULL, `deleted_at` datetime DEFAULT NULL ON UPDATE current_timestamp(), `type` enum('jobgang','personal') NOT NULL, PRIMARY KEY (`unique_id`), UNIQUE KEY `identifier` (`identifier`)) ENGINE=InnoDB DEFAULT CHARSET=" .. characterSet .. " COLLATE " .. collation .. ";", {})
    MySQL.Sync.execute("CREATE TABLE IF NOT EXISTS `banking_transactions` (`id` int(11) NOT NULL AUTO_INCREMENT, `unique_id` varchar(100) NOT NULL, `job_player_id` varchar(100) DEFAULT NULL, `transaction_type` enum('withdraw','deposit','transfer') NOT NULL, `transferred_to` varchar(100) DEFAULT NULL, `amount` int(11) NOT NULL, `memo` varchar(255) NOT NULL, `created_at` datetime NOT NULL DEFAULT current_timestamp(), PRIMARY KEY (`id`), KEY `FK__players` (`unique_id`) USING BTREE, CONSTRAINT `FK_banking_transactions_banking_users` FOREIGN KEY (`unique_id`) REFERENCES `banking_users` (`unique_id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=" .. characterSet .. " COLLATE " .. collation .. " COMMENT='Holds all the transactions';", {})
    dbLoaded = true
end)