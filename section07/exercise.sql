-- 예제 풀이
-- 1
SELECT UPPER(REVERSE('Why does my cat look at me with such hatred?'));

-- 2
/*
-- What Does This Print Out?
SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );
-- I-like-cats
*/

-- 3
SELECT REPLACE(title, ' ', '->') FROM books;

-- 4
SELECT 
	author_lname AS forwards,
    REVERSE(author_lname) AS backwards
FROM books;

-- 5
SELECT
	CONCAT(
		UPPER(author_fname),
        ' ',
        UPPER(author_lname)
    ) AS 'full name in caps'
FROM books;

-- 6
SELECT CONCAT(title, ' was released in ', released_year) AS blurb
FROM books;

-- 7
SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;

-- 8
SELECT 
	CONCAT(SUBSTR(title, 1, 10), '...') AS 'short_title',
    CONCAT(author_lname, ', ',author_fname) AS 'author',
    CONCAT(stock_quantity, ' in stock') AS 'quantity'
FROM books;

