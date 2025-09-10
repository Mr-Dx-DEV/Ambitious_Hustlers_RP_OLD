DELETE FROM items WHERE name = 'bobby_pin';
DELETE FROM items WHERE name = 'handcuffs';

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('bobby_pin', 'Bobby Pin', 1),
	('tracking_bracelet', 'Tracking Bracelet', 1),
	('handcuffs', 'Hand Cuffs', 1);