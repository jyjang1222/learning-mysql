SHOW DATABASES;
CREATE DATABASE person_db;
USE person_db;
SELECT database();

CREATE TABLE persons(
	first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
);
SHOW TABLES;

INSERT INTO persons (first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);
INSERT INTO persons (last_name, age, first_name)
VALUES ('Belcher', 42, 'Bob');
INSERT INTO persons 
		(first_name, last_name, age)
VALUES  ('Linda', 'Belcher', 45),
		('Phillip', 'Frond', 38),
        ('Calvin', 'Fischoeder', 70);

SELECT * FROM persons;
