# 섹션8: 선택사항 정교화하기

## DISTINCT 키워드

```sql
SELECT DISTINCT author_fname FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;
```

- 중복되는 데이터들을 제외시켜서 하나만 표시해준다.
- 칼럼이 여러개면 and 처럼 동시에 중복이여야 제외시켜준다.
- SELECT 키워드와 칼럼명 앞에 작성하는 것에 유의한다.

## ORDER BY 키워드

```sql
-- 오름차순 (ascend)
SELECT title FROM books ORDER BY title;
SELECT released_year FROM books ORDER BY released_year ASC;
-- 내림차순 (descend)
SELECT author_lname FROM books ORDER BY author_lname DESC;

SELECT title, released_year, pages FROM books ORDER BY pages;
SELECT title FROM books ORDER BY released_year;
-- author_lname의 idx가 2이다.
SELECT title, author_fname, author_lname
FROM books ORDER BY 2;
-- author_lname을 우선 정렬후에 author_fname을 정렬한다.
SELECT author_fname, author_lname FROM books
ORDER BY author_lname, author_fname;
```

- 기본적으로 오름차순으로 정렬돼서 ASC는 생략이 가능하다. (숫자, 문자 순)
- 오름차순: ASC, 내림차순: DESC
- 조회대상이 아니어도 ORDER BY 를 통해 기준을 정할수 있다.
- ORDER BY 2; 에서 2는 idx를 의미한다.
  - title: 1, author_fname: 2, author_lname: 3
- ORDER BY 기준을 추가로 작성해줄수 있는데, 왼쪽부터 차례대로 우선 정렬한다.
- 정렬을 할때 매우 유용한 키워드이다. - 비싼순으로 정렬한다든지 추천수대로 정렬한다든지

## LIMIT 키워드

```sql
SELECT title FROM books LIMIT 3;
SELECT * FROM books LIMIT 1;
-- LIMIT len
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 5;
-- LIMIT idx, len
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 0, 5;

SELECT * FROM tbl LIMIT 95, 18446744073709551615;
```

- LIMIT idx, len
- idx가 0 부터 시작한다. (idx까지 쓰이는 경우는 잘 없다)
- 게시판에 게시글수를 제한한다든지에 쓰인다.
- 특정 행에서 행끝까지 조회하려면 두번째 인자에 큰 숫자를 사용한다.

## LIKE 키워드

```sql
-- ~da~
SELECT title FROM books
WHERE author_fname LIKE '%da%';
-- da~
SELECT title, author_fname FROM books
WHERE author_fname LIKE 'da%';
-- 책이름이 정확히 'the'만 찾는다.
SELECT title, author_fname FROM books
WHERE title LIKE 'the';
-- _가 3개이므로 길이가 3인 데이터가 모두 표시된다
SELECT title, stock_quantity FROM books
WHERE stock_quantity LIKE '___';
-- 모든데이터출력
SELECT title, stock_quantity FROM books
WHERE stock_quantity LIKE '%';

SELECT phone_number FROM numbers
WHERE phone_number LIKE '___-____-____'
-- 데이터에 %나_가 있는 경우 조회하기
SELECT title FROM books
WHERE title LIKE '%\%%';
SELECT title FROM books
WHERE title LIKE '%\_%';
```

- '%da%' 에서 %는 ~를 의미한다.
  - da앞뒤로 무언가가 있어야 한다는 의미는 아니다.
- ''로 감싸줘야 하는것을 주의해야한다.
- WHERE과 같이 써야하는것에 주의한다. (ORDER BY x)
- \_는 길이를 의미한다. len만큼 \_추가
- %나 \_를 조회하려면 이스케이프문자를 활용한다.
