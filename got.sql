CREATE DATABASE GOT;


CREATE table IF NOT EXISTS notes (
	id INT NOT NULL PRIMARY KEY,
	title CHAR(100),
	creation_date DATE,
	description TEXT,
	removable INT
);

CREATE TABLE IF NOT EXISTS users (
	id INT NOT NULL PRIMARY KEY,
	first_name CHAR(50) NOT NULL,
	last_name CHAR(50) DEFAULT NULL,
	email CHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS category (
	id INT not NULL PRIMARY KEY,
	category_name CHAR(50) NOT NULL

);

CREATE TABLE IF NOT EXISTS category_X_notes(
	notes_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY(notes_id) REFERENCES notes(id),
	FOREIGN KEY(category_id) REFERENCES category(id)
	
);

CREATE TABLE IF NOT EXISTS user_X_notes(
	id INT not NULL PRIMARY KEY,
	users_id INT NOT NULL,
	notes_id INT NOT NULL,
	modification_date DATE,
	event_type CHAR(50) NOT NULL,
	FOREIGN KEY(users_id) REFERENCES users(id),
	FOREIGN KEY(notes_id) REFERENCES notes(id)
);


INSERT INTO users VALUES (1,'Jon','Snow','jon_north@gmail.com'),(2,'Daenerys','Targaryen','queendragon@gmail.com'),(3,'Jaime','Lannister','golden.hand@gmail.com'),(4,'Sansa','Stark','ladysansa@gmail.com'),(5,'Arya','Stark','fast_needle@gmail.com'),(6,'Cersei','Lannister','queen_of_the_7@gmail.com'),(7,'Gendry','','gendry.blacksmith@hotmail.com'),(8,'Tyrion','Lannister','tyrionloves.wine@hotmail.com'),(9,'Melissandre','','red_woman@gmail.com'),(10,'Sandor','Clegane','the.hound123321@gmail.com');

INSERT INTO category values (1,'Biography'),(2,'Comedy'),(3,'Terror'),(4,'Short story'),(5,'People from westeros'),(6,'People from the east');

insert into notes values (1,
'Jons stuff',
2022-03-03,
'Jon Snow is the bastard son of Eddard Stark. Feeling isolated from his family due to his bastard status, he leaves their home of Winterfell to join the Nights Watch at Castle Black.',
1),
(2,
'Daenerys short story',
2022-15-01,
'She is the exiled princess of the Targaryen dynasty. She and her brother Viserys were smuggled to Essos during the end of Roberts Rebellion. For seventeen years, she has been under her volatile brothers care. In exchange for an army, Viserys marries her to the powerful Dothraki warlord Khal Drogo.',
1),
(3,
'the guard',
2022-02-02,
'Ser Jaime of House Lannister is a member of the Kingsguard and an exceptionally skilled swordsman.',
1),
(4,
'the lady',
2022-03-22,
'this is a short short story',
1),
(5,
'youngest sister',
2021-12-29,
'Arya of House Stark is the younger daughter of Lord Eddard and Catelyn Stark of Winterfell. A tomboy at heart, Arya is active and brigh',
1),
(6,
'Cersei',
2021-10-22,
'Cersei Lannister of House Lannister and House Baratheon, Queen of the Seven Kingdoms of Westeros, is the wife of King Robert Baratheon',
1),
(7,
'someone without last name',
2022-04-03,
'Gendry is an apprentice blacksmith in Kings Landing and King Robert Baratheons bastard son.',
0),
(8,
'the dwarf',
1995-05-03,
' Nicknamed "the Imp" or "Halfman", Tyrion of House Lannister is the younger brother of Cersei and Jaime Lannister. He is a dwarf and his mother died during his birth, for which his father, Tywin Lannister, blames him.',
0),
(9,
'She is red',
2020-05-14,
' Also known as "the Red Woman", a priestess of the Lord of Light in service to Stannis Baratheon. Melisandre has prophetic powers that give her partial knowledge of future events.',
1),
(10,
'Sandor',
2020-12-05,
'nicknamed "the Hound", is the younger brother of Ser Gregor Clegane. He is also Joffrey Baratheons personal bodyguard.',
0);

INSERT INTO category_x_notes values (1,5),(8,1),(4,1),(5,1),(6,1);


