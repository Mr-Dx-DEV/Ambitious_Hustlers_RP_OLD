INSERT IGNORE INTO `account_roles` (`name`) VALUES
('novice'),
('experienced'),
('advanced'),
('manager'),
('owner');

INSERT IGNORE INTO `ox_groups` ( `name`, `label`, `colour`, `hasAccount`) VALUES
( 'burgershot', 'Burgershot', NULL, 1 );

INSERT IGNORE INTO `ox_group_grades` (`group`, `grade`, `label`, `accountRole`) VALUES
('burgershot', 0, 'Recruit', NULL),
('burgershot', 1, 'Novice', 'novice'),
('burgershot', 2, 'Experienced', 'experienced'),
('burgershot', 3, 'Advanced', 'advanced'),
('burgershot', 4, 'Manager', 'manager'),
('burgershot', 5, 'Owner', 'owner');