CREATE TABLE `hottubs` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `coords` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `rotation` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `stairs` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

ALTER TABLE `hottubs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`(191));

ALTER TABLE `hottubs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;	