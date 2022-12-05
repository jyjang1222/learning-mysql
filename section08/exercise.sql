-- 섹션8 예제
-- 1 story 조회하기
SELECT title FROM books
WHERE title LIKE '%stories%' OR '%story%';

-- 2 페이지수가 가장 많은 책 찾기
SELECT title, pages FROM books
ORDER BY pages DESC LIMIT 1;

-- 3 summary 출력
SELECT CONCAT_WS(' - ', title, released_year) AS summary
FROM books ORDER BY released_year DESC LIMIT 3;

-- 4 저자의 성에 띄어쓰기가 들어간 책 출력
SELECT title, author_lname FROM books
WHERE author_lname LIKE '% %';

-- 5 재고가 가장 적은 책 3권 찾기
SELECT title, released_year, stock_quantity FROM books
ORDER BY 3 ASC LIMIT 3;

-- 6 저자 성 오름차순후에 제목 오름차순
SELECT title, author_lname FROM books
ORDER BY 2, 1;

-- 7
SELECT
	UPPER(CONCAT(
		'my favorite author is ',
        author_fname, ' ',
        author_lname, '!'
	)) AS yell
FROM books ORDER BY author_lname;