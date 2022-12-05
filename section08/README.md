# 섹션8: 선택사항 정교화하기

## DISTINCT 키워드

```sql
SELECT DISTINCT author_fname FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;
```

- 중복되는 데이터들을 제외시켜서 하나만 표시해준다.
- 칼럼이 여러개면 and 처럼 동시에 중복이여야 제외시켜준다.

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
- 매우 유용한 키워드이다. - 비싼순으로 정렬한다든지 추천수대로 정렬한다든지

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

```
