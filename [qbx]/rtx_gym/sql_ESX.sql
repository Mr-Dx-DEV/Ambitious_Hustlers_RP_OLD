INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('protein', 'Protein', 1, 0, 1),
	('creatine', 'Creatine', 1, 0, 1),
	('preworkout', 'Pre-Workout', 1, 0, 1),
	('testosterone', 'Testosterone', 1, 0, 1);
	
CREATE TABLE `gympass` (
  `id` int(11) NOT NULL,
  `identifier` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `gymid` int(11) NOT NULL,
  `gymtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `gymstats` (
  `id` int(11) NOT NULL,
  `identifier` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `stats` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

ALTER TABLE `gympass`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`(500));

ALTER TABLE `gymstats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`(500));

ALTER TABLE `gympass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `gymstats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

CREATE TABLE `owned_gyms` (
  `id` int(11) NOT NULL,
  `identifier` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `gymid` int(11) NOT NULL,
  `gymprice` int(11) NOT NULL,
  `gymbalance` int(11) NOT NULL,
  `gymvisitorsdata` longtext COLLATE utf8mb4_bin NOT NULL,
  `gymclosed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


ALTER TABLE `owned_gyms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`(500));

ALTER TABLE `owned_gyms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;