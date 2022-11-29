CREATE DATABASE pastry_shop;
SHOW DATABASES;
USE pastry_shop;
SELECT database();

CREATE TABLE pastries (
	name VARCHAR(100),
    quantity INT
);
SHOW TABLES;
SHOW COLUMNS FROM pastries;
DESC pastries;

DROP TABLE pastries;