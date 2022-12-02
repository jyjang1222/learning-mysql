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
SELECT SUBSTR('hello world', 7, 3);
