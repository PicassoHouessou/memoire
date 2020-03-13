SET AUTOCOMMIT = 0;
START TRANSACTION;
DROP DATABASE IF EXISTS `messagerie` ;
CREATE DATABASE messagerie CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
use messagerie ;
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailUnique` (`email`)
) ENGINE=InnoDB ;

DROP TABLE IF EXISTS `virtual_domains`;
CREATE TABLE IF NOT EXISTS `virtual_domains` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;

INSERT INTO `virtual_domains` (`id`, `name`) VALUES
(1, 'eneam.da');

DROP TABLE IF EXISTS `virtual_users`;
CREATE TABLE IF NOT EXISTS `virtual_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain_id` int NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `maildir` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB ;

DROP TABLE IF EXISTS `virtual_users_infos`;
CREATE TABLE IF NOT EXISTS `virtual_users_infos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `virtual_users_id` int NOT NULL,
  `nom` varchar(200) DEFAULT NULL,
  `prenom` varchar(200) DEFAULT NULL,
  `matricule` int DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `pays` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cle_etrangere` (`virtual_users_id`)
) ENGINE=InnoDB ;

ALTER TABLE `virtual_users`

  ADD CONSTRAINT `virtual_users_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE;

INSERT INTO `messagerie`.`virtual_users`
(`id`, `domain_id`, `password` , `email`, `maildir`)
VALUES
('1', '1', 'argon2i$v=19$m=32768,t=4,p=1$y+x4w7s4WFGD5/L8jd8sKg$Hp2CJvPE8jmpQcPOxuBNt8lKr7vY2pYHccD6dqCKrMY', 'houessoupicasso@eneam.da', 'eneam.da/houessoupicasso/');

COMMIT;

