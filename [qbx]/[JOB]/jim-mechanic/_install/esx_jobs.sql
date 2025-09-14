INSERT INTO `jobs` (name, label) VALUES
	('mechanic', 'Mechanic')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mechanic',0,'recruit','Recruit',12,'{}','{}'),
	('mechanic',1,'novice','Novice',24,'{}','{}'),
	('mechanic',2,'experienced','Experienced',36,'{}','{}'),
	('mechanic',3,'advanced',"Advanced",48,'{}','{}'),
	('mechanic',4,'boss','Manager',0,'{}','{}')
;