SHOW DATABASES;
USE book_shop;
SELECT database();
SHOW TABLES;
DESC books;
-- CONCAT & CONCAT_WS, REPLACE, CHAR_LENGTH, UPPER & LOWER, SUBSTR, REVERSE

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
	   ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
	   ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- DISTINCT
SELECT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;

-- ORDER BY
SELECT title FROM books ORDER BY title;
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT released_year FROM books ORDER BY released_year ASC;
SELECT title, released_year, pages FROM books ORDER BY pages;
SELECT title FROM books ORDER BY released_year;
SELECT title, author_fname, author_lname
FROM books ORDER BY 1;
SELECT author_fname, author_lname
FROM books ORDER BY author_lname, author_fname;

-- LIMIT
SELECT title FROM books LIMIT 3;
SELECT * FROM books LIMIT 1;
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 5;
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 0, 5;
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 10, 1;
