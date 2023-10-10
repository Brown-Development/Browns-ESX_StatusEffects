CREATE TABLE IF NOT EXISTS `browns_status_effects` (
  `identifier` varchar(46) DEFAULT NULL,
  `statuses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`statuses`)),
  `notify` tinytext DEFAULT 'false',
  `adjust` tinytext DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `users` ADD COLUMN
`browns_stockstatus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '[{"percent":0.0,"name":"drunk","val":0},{"percent":98.39,"name":"hunger","val":983900},{"percent":98.7925,"name":"thirst","val":987925}]' CHECK (json_valid(`browns_stockstatus`));

