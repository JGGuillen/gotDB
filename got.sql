/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS got;

CREATE DATABASE IF NOT EXISTS got;

USE got;

DROP TABLE IF EXISTS notes;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;

CREATE TABLE IF NOT EXISTS notes (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(50) NOT NULL,
creation_date DATETIME,
description TEXT NOT NULL,
removable INT not null,
users_id INT NOT NULL,
CONSTRAINT fk_users_id
FOREIGN KEY (users_id)
REFERENCES users(id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES notes WRITE;


insert
into
notes (title,
creation_date,
description,
removable,
users_id)
values ('Jons stuff',
'2022-03-03 09:22:13',
'Jon Snow is the bastard son of Eddard Stark. Feeling isolated from his family due to his bastard status, he leaves their home of Winterfell to join the Nights Watch at Castle Black.',
1,
1),
('Daenerys short story',
'2021-12-08 08:22:33',
'She is the exiled princess of the Targaryen dynasty. She and her brother Viserys were smuggled to Essos during the end of Roberts Rebellion. For seventeen years, she has been under her volatile brothers care. In exchange for an army, Viserys marries her to the powerful Dothraki warlord Khal Drogo.',
1,
2),
('the guard',
'2022-02-02 18:22:16',
'Ser Jaime of House Lannister is a member of the Kingsguard and an exceptionally skilled swordsman.',
1,
3),
('the lady',
'2022-03-22 22:22:58',
'this is a short short story',
1,
4),
('youngest sister',
'2021-12-29 10:22:35',
'Arya of House Stark is the younger daughter of Lord Eddard and Catelyn Stark of Winterfell. A tomboy at heart, Arya is active and brigh',
1,
5),
('Cersei',
'2021-10-22 15:22:43',
'Cersei Lannister of House Lannister and House Baratheon, Queen of the Seven Kingdoms of Westeros, is the wife of King Robert Baratheon',
0,
6),
('someone without last name',
'2022-04-03 20:22:23',
'Gendry is an apprentice blacksmith in Kings Landing and King Robert Baratheons bastard son.',
0,
7),
('the dwarf',
'1995-05-03 17:22:12',
' Nicknamed "the Imp" or "Halfman", Tyrion of House Lannister is the younger brother of Cersei and Jaime Lannister. He is a dwarf and his mother died during his birth, for which his father, Tywin Lannister, blames him.',
0,
8),
('She is red',
'2020-05-14 15:22:13',
' Also known as "the Red Woman", a priestess of the Lord of Light in service to Stannis Baratheon. Melisandre has prophetic powers that give her partial knowledge of future events.',
1,
9),
('Sandor',
'2020-12-05 08:22:13',
'nicknamed "the Hound", is the younger brother of Ser Gregor Clegane. He is also Joffrey Baratheons personal bodyguard.',
0,
10);

UNLOCK TABLES;

DROP TABLE IF EXISTS users;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;


CREATE TABLE IF NOT EXISTS users (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES users WRITE;

INSERT
INTO
users (first_name,
last_name,
email)
VALUES ('Jon','Snow','jon_north@gmail.com'),
('Daenerys','Targaryen','queendragon@gmail.com'),
('Jaime','Lannister','golden.hand@gmail.com'),
('Sansa','Stark','ladysansa@gmail.com'),
('Arya','Stark','fast_needle@gmail.com'),
('Cersei','Lannister','queen_of_the_7@gmail.com'),
('Gendry','','gendry.blacksmith@hotmail.com'),
('Tyrion','Lannister','tyrionloves.wine@hotmail.com'),
('Melissandre','','red_woman@gmail.com'),
('Sandor','Clegane','the.hound123321@gmail.com');

UNLOCK TABLES;


DROP TABLE IF EXISTS registros;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;

CREATE TABLE IF NOT EXISTS registros(
id INT AUTO_INCREMENT PRIMARY KEY,
notes_id INT,
accion VARCHAR(50),
fecha DATETIME,
CONSTRAINT fk_notes_id
FOREIGN KEY (notes_id)
REFERENCES notes(id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES registros WRITE;

INSERT
INTO
registros (notes_id,
accion,
fecha)
VALUES (1,'creacion',
'2022-03-03 09:22:13'),
(2,'creacion',
'2021-12-08 08:22:33'),
(3,'creacion',
'2022-02-02 18:22:16'),
(4,'modificacion',
'2022-03-22 22:22:58'),
(5,'creacion',
'2021-12-29 10:22:35'),
(6,'creacion',
'2021-10-22 15:22:43'),
(7,'modificacion',
'2022-04-03 20:22:23'),
(8, 'modificacion',
'1995-05-03 17:22:12'),
(9, 'creacion',
'2020-05-14 15:22:13'),
(10, 'creacion',
'2020-12-05 08:22:13');

UNLOCK TABLES;

DROP TABLE IF EXISTS category_x_notes;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;


CREATE TABLE category_x_notes(
id INT AUTO_INCREMENT PRIMARY KEY,
notes_id INT,
category_id INT,
CONSTRAINT fk_notesid
FOREIGN KEY (notes_id)
REFERENCES notes(id),
CONSTRAINT fk_categoryid
FOREIGN KEY (category_id)
REFERENCES category(id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES category_x_notes WRITE;

insert
into
category_x_notes (notes_id,
category_id
)
values (1,5),(8,1),(4,1),(5,1),(6,1);

UNLOCK TABLES;

DROP TABLE IF EXISTS category;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;


CREATE TABLE category(
id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(50)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES category WRITE;

insert
	into
	category (category_name)
values ('Biography'),
('Comedy'),
('Terror'),
('Short story'),
('People from westeros'),
('People from the east');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;