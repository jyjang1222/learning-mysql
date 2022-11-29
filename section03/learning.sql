CREATE DATABASE hello_world_db;

SHOW DATABASES;

DROP DATABASE hello_world_db;

CREATE DATABASE dog_walking_app;
USE dog_walking_app;
SELECT database();

DROP DATABASE dog_walking_app;

CREATE DATABASE cat_app;
USE cat_app;

CREATE TABLE cats (
	name VARCHAR(100),
    breed VARCHAR(150),
    age INT
);

SHOW TABLES;

SHOW COLUMNS FROM cats;

DESC cats;

DROP TABLE cats;