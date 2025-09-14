INSERT IGNORE INTO `account_roles` (`name`) VALUES
('novice'),
('experienced'),
('advanced'),
('manager'),
('owner');

INSERT IGNORE INTO `ox_groups` ( `name`, `label`, `colour`, `hasAccount`) VALUES
( 'mechanic', 'Mechanic', NULL, 1 );

INSERT IGNORE INTO `ox_group_grades` (`group`, `grade`, `label`, `accountRole`) VALUES
('mechanic', 0, 'Recruit', NULL),
('mechanic', 1, 'Novice', 'novice'),
('mechanic', 2, 'Experienced', 'experienced'),
('mechanic', 3, 'Advanced', 'advanced'),
('mechanic', 4, 'Manager', 'manager'),
('mechanic', 5, 'Owner', 'owner');