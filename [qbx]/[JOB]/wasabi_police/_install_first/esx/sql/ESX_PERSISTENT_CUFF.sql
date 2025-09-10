-- This is for ESX ONLY
-- This is just for using persistentCuff

ALTER TABLE `users` DROP COLUMN IF EXISTS `ishandcuffed`;
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `ishandcuffed` BOOLEAN NOT NULL DEFAULT 0 AFTER `status`;