INSERT IGNORE INTO `account_roles` (`name`) VALUES
('novice'),
('experienced'),
('advanced'),
('manager'),
('owner');

INSERT IGNORE INTO `ox_groups` ( `name`, `label`, `colour`, `hasAccount`) VALUES
( 'catcafe', 'Cat Cafe', NULL, 1 );

INSERT IGNORE INTO `ox_group_grades` (`group`, `grade`, `label`, `accountRole`) VALUES
('catcafe', 0, 'Recruit', NULL),
('catcafe', 1, 'Novice', 'novice'),
('catcafe', 2, 'Experienced', 'experienced'),
('catcafe', 3, 'Advanced', 'advanced'),
('catcafe', 4, 'Manager', 'manager'),
('catcafe', 5, 'Owner', 'owner');