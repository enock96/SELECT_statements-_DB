-- world02.sql
-- This data set was taken from a publicly available AWS Skill Builder course. The data can be viewed here:
-- https://amazon.awsapps.com/workdocs/index.html#/document/c5768f3c2481df67dfdf2e1f0e05211f16105a5a32701882caddd7f6e6eded7d
-- v1.2 10JAN2022 mjoejoh removed the character set references at the table-level
-- v1.1 10JAN2022 mjoejoh modified the character set to support case sensitive WHERE clause examples
-- v1.0 06JAN2022 mjoejoh created this script for TCDs working on the re/Start databases course v3.4

-- create the database for the sample tables
DROP DATABASE IF EXISTS `world`;
create database world default character set utf8 default collate utf8_bin;
use world;

-- create the COUNTRY table
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `Code` CHAR(3) NOT NULL DEFAULT '',
  `Name` CHAR(52) NOT NULL DEFAULT '',
  `Continent` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  `Region` CHAR(26) NOT NULL DEFAULT '',
  `SurfaceArea` FLOAT(10,2) NOT NULL DEFAULT '0.00',
  `IndepYear` SMALLINT(6) DEFAULT NULL,
  `Population` INT(11) NOT NULL DEFAULT '0',
  `LifeExpectancy` FLOAT(3,1) DEFAULT NULL,
  `GNP` FLOAT(10,2) DEFAULT NULL,
  `GNPOld` FLOAT(10,2) DEFAULT NULL,
  `LocalName` CHAR(45) NOT NULL DEFAULT '',
  `GovernmentForm` CHAR(45) NOT NULL DEFAULT '',
  `HeadOfState` CHAR(60) DEFAULT NULL,
  `Capital` INT(11) DEFAULT NULL,
  `Code2` CHAR(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`Code`)
)
;

-- populate the COUNTRY table with data
INSERT INTO `country` VALUES ('ABW','Aruba','North America','Caribbean',193.00,NULL,103000,78.4,828.00,793.00,'Aruba','Nonmetropolitan Territory of The Netherlands','Beatrix',129,'AW');
INSERT INTO `country` VALUES ('AFG','Afghanistan','Asia','Southern and Central Asia',652090.00,1919,22720000,45.9,5976.00,NULL,'Afganistan/Afqanestan','Islamic Emirate','Mohammad Omar',1,'AF');
INSERT INTO `country` VALUES ('AGO','Angola','Africa','Central Africa',1246700.00,1975,12878000,38.3,6648.00,7984.00,'Angola','Republic','José Eduardo dos Santos',56,'AO');
INSERT INTO `country` VALUES ('AIA','Anguilla','North America','Caribbean',96.00,NULL,8000,76.1,63.20,NULL,'Anguilla','Dependent Territory of the UK','Elisabeth II',62,'AI');
INSERT INTO `country` VALUES ('ALB','Albania','Europe','Southern Europe',28748.00,1912,3401200,71.6,3205.00,2500.00,'Shqipëria','Republic','Rexhep Mejdani',34,'AL');
INSERT INTO `country` VALUES ('AND','Andorra','Europe','Southern Europe',468.00,1278,78000,83.5,1630.00,NULL,'Andorra','Parliamentary Coprincipality','',55,'AD');
INSERT INTO `country` VALUES ('ANT','Netherlands Antilles','North America','Caribbean',800.00,NULL,217000,74.7,1941.00,NULL,'Nederlandse Antillen','Nonmetropolitan Territory of The Netherlands','Beatrix',33, 'AR');

-- Queries
SHOW TABLES;
SHOW COLUMNS FROM country;
select * from country;
select Continent, Region, Code2, SurfaceArea as 'Surface Area' from country where Code2 IN ('AI', 'AL', 'AD');
select * from country where Region LIKE 'Southern%';
select Name, IndepYear, surfaceArea from country where Population BETWEEN 50000 AND 200000; 
select Name, Continent, Population, LifeExpectancy, IF(LifeExpectancy>70, "Aged", "Still Young") as AgeGroup from country;
select Name, Continent, Population, LifeExpectancy,
	case
		when LifeExpectancy>70 then "Aged"
        else "Still Young"
	end as AgeGroup
from country;
        
