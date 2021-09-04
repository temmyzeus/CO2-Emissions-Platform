SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `carbon_emission`;
CREATE DATABASE `carbon_emission`;
USE `carbon_emission`;

/*DROP TABLE(S) IF TABLE NAME(S) EXISTS*/
DROP TABLE IF EXISTS `readings`, `sensors`, `location`;

CREATE TABLE `locations` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `latitude` DECIMAL(6, 2),
    `longitude` DECIMAL(7, 2),
    `altitude` DECIMAL(5, 2),
    PRIMARY KEY (`id`)
);

INSERT INTO `locations` (`latitude`,`longitude`,`altitude`) VALUES 
('14.00', '-32.00' , '19.00'),
('10.00', '10.00' , '39.00'),
('77.00', '-150.00' , '31.00'),
('-63.00', '-38.00' , '11.00'),
('-36.00', '141.00' , '35.00'),
('-10.00', '1.00' , '11.00'),
('40.00', '63.00' , '42.00'),
('-88.00', '67.00' , '32.00'),
('-87.00', '68.00' , '22.00'),
('87.00', '-76.00' , '36.00'),
('-56.00', '-20.00' , '26.00'),
('35.00', '-34.00' , '37.00'),
('22.00', '-148.00' , '25.00'),
('-63.00', '141.00' , '44.00'),
('-42.00', '62.00' , '11.00'),
('12.00', '91.00' , '9.00'),
('54.00', '-85.00' , '45.00'),
('42.00', '-2.00' , '23.00'),
('52.00', '-37.00' , '14.00'),
('-10.00', '98.00' , '8.00');


CREATE TABLE `readings` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `log_time` DATETIME,
    `location` INT NOT NULL,
    `tempreature` DECIMAL(4, 2),
    `pm_25` INT DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id`) REFERENCES `locations`(`id`)
);
-- start id for `reading` table at 100 instead of 1
ALTER TABLE `readings` AUTO_INCREMENT=100;

-- insert values into `readings` table
INSERT INTO `readings` (`log_time`, `location`, `tempreature`,`pm_25`) VALUES
('2021-09-04 09:40:56', 4,'31.00' , '60.00'),
('2021-08-19 08:50:21', 4,'48.00' , '40.00'),
('2021-02-22 13:30:11', 14,'40.00' , '69.00'),
('2021-04-03 04:25:20', 8,'34.00' , '53.00'),
('2021-08-02 22:48:08', 13,'34.00' , '51.00'),
('2021-05-09 03:07:29', 18,'45.00' , '50.00'),
('2021-09-09 11:49:58', 16,'41.00' , '69.00'),
('2021-12-21 17:09:45', 9,'48.00' , '32.00'),
('2021-09-29 19:39:19', 7,'40.00' , '44.00'),
('2021-02-10 09:00:49', 7,'42.00' , '31.00'),
('2021-03-15 06:57:57', 11,'44.00' , '48.00'),
('2021-01-23 23:07:32', 5,'47.00' , '49.00'),
('2021-08-04 00:46:28', 8,'44.00' , '63.00'),
('2021-03-12 18:42:39', 2,'38.00' , '49.00'),
('2021-04-25 18:19:13', 3,'46.00' , '63.00'),
('2021-03-12 04:52:31', 20,'31.00' , '53.00'),
('2021-08-28 14:05:59', 3,'44.00' , '41.00'),
('2021-01-18 01:40:05', 15,'49.00' , '57.00'),
('2021-07-20 12:56:11', 6,'44.00' , '34.00'),
('2021-11-03 12:57:20', 8,'47.00' , '30.00');

CREATE TABLE `sensors` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`location` VARCHAR(60),
    `product` VARCHAR(100) NOT NULL,
    `model` VARCHAR(30),
    `min_ppm` INT(3),
    `max_ppm`INT(5),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id`) REFERENCES locations(id)
);

INSERT INTO `sensors` (`product`, `model`) VALUES 
('In-line carbon dioxide sensorNDIR carbon dioxide sensor', 'InPro 5 series' ),
('Infrared CO2 sensor', 'CO2ST-S' ),
('In-line carbon dioxide sensorNDIR carbon dioxide sensor', 'InPro 5 series' ),
('Infrared CO2 sensor', 'CO 112' ),
('Infrared CO2 sensor', 'CO 112' ),
('Infrared CO2 sensor', 'CO 112' ),
('Infrared CO2 sensor', 'CO2ST-S' ),
('Digital Indoor/outdoor Pm2.5/hcho/tvoc Tester Co2 Meter', 'None' ),
('Infrared CO2 sensor', 'CO2ST-S' ),
('In-line CO2 sensor', 'Carbo 520 Optical' ),
('Infrared CO2 sensor', 'CO 112' ),
('Digital Indoor/outdoor Pm2.5/hcho/tvoc Tester Co2 Meter', 'None' ),
('In-line CO2 sensor', 'Carbo 520 Optical' ),
('Infrared CO2 sensor', 'CO2ST-S' ),
('Digital Indoor/outdoor Pm2.5/hcho/tvoc Tester Co2 Meter', 'None' ),
('In-line carbon dioxide sensorNDIR carbon dioxide sensor', 'InPro 5 series' ),
('Infrared CO2 sensor', 'CO2ST-S' ),
('In-line carbon dioxide sensorNDIR carbon dioxide sensor', 'InPro 5 series' ),
('Infrared CO2 sensor', 'CO 112' ),
('In-line carbon dioxide sensorNDIR carbon dioxide sensor', 'InPro 5 series' );