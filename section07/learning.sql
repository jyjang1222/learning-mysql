SELECT database();
SHOW DATABASES;
USE cat_app;
SHOW TABLES;

DESC cats;
SELECT * FROM cats;
DROP TABLE cats;
CREATE TABLE cats (
	cat_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100),
    age INT
);
DELETE FROM cats;

CREATE DATABASE book_shop;
USE book_shop;
SHOW TABLES;
DESC books;

-- CONCAT 함수 사용해보기
SELECT author_fname, author_lname FROM books;
SELECT CONCAT('Hello', ' ', 'World');
SELECT
	CONCAT(author_fname, ' ', author_lname) AS full_name
FROM books;
SELECT author_fname,
	CONCAT(author_fname, ' ', author_lname) AS full_name
FROM books;
SELECT author_fname AS first, author_lname AS last,
CONCAT(author_fname, ' ', author_lname) AS full
FROM books;
SELECT author_fname AS first, author_lname AS last,
CONCAT(author_fname, ' ', author_lname) AS full,
CONCAT(author_lname, ' ', author_fname) AS reverse_full
FROM books;

SELECT
	CONCAT_WS('-', title, author_fname, author_lname)
FROM books;

-- SUBSTR 함수 사용해보기
SELECT SUBSTR('hello world', -3);
SELECT SUBSTR("Where I'm Calling From: Selected Stories", 1, 10);
SELECT SUBSTR(title, 1, 10) AS short_title FROM books;
SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS short_title
FROM books;

-- REPLACE 함수 사용해보기
SELECT REPLACE('hello world', 'hell', '@#$%');
SELECT REPLACE('cheese bread coffe milk', ' ', ' and ');
SELECT SUBSTR(REPLACE(title, 'e', '3'), 1, 10) FROM books;
SELECT 
	author_fname,
	REVERSE(author_fname) AS reverse_fname
FROM books;

-- CHAR_LENGTH 함수 사용해보기
SELECT CHAR_LENGTH('hello world');
SELECT 
	author_lname,
	CHAR_LENGTH(author_lname) AS 'length' 
FROM books;
SELECT 
	CONCAT(
		author_lname,
        ' is ',
        CHAR_LENGTH(author_lname),
        ' characters long') AS print_length
FROM books;

-- UPPER() LOWER()
SELECT UPPER('hello world');
SELECT LOWER('HELLO WORLD');
SELECT UPPER(title) AS big_title FROM books;
