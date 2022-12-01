# 섹션5: CRUD 명령

## CRUD란

1. Create
2. Read
3. Update
4. Delete

## Create

- 기존에 배운 CREATE키워드를 통해서 테이블 생성이 가능하다.

## Read

### SELECT 키워드

- SELECT 키워드를 사용하여 특정열의 데이터 열람이 가능하다.

```sql
-- 예시
-- 모든열의 데이터를 가져오려면 * 를 입력하면 된다.
SELECT * FROM cats;
-- 특정 열의 데이터만을 얻고 싶은 경우
SELECT name FROM cats;
SELECT name, age, cat_id From cats;
```

### WHERE 키워드

- 구체적인 데이터를 얻고자 한다면 WHERE 키워드를 사용한다.
  - 업데이트는 특정 데이터를 지정하는 방식으로 주로 쓰여지기 때문에 SELECT 보다는 WHERE 이 주로 쓰인다.
- WHERE 키워드를 통해 조건식 작성이 가능하다.

```sql
SELECT * FROM cats WHERE age = 4;
-- 대소문자를 구분하지 않고 데이터를 가져온다.
SELECT * FROM cats WHERE name='Egg';
SELECT * FROM cats WHERE name='EGG';
```

### AS 키워드

- AS 키워드는 alias의 약어로 칼럼의 이름을 변경해서 표시하고자할때 쓰인다.
- 예) cats테이블의 name칼럼 dogs테이블의 name칼럼의 데이터를 가져왔는데 칼럼의 이름이 같아 혼동할 수 있기때문에 AS 키워드가 쓰인다.

```sql
-- AS 키워드 사용 예시
SELECT name AS cat_name FROM cats;
SELECT name AS dog_name FROM dogs;
```

## UPDATE

### UPDATE & SET 키워드

- UPDATE키워드로 업데이트할 테이블을 선택하고 수정사항은 SET키워드로 한다.

```sql
UPDATE cats SET breed = 'Shorthair'
WHERE breed = 'Tabby';
```

## DELETE

```sql
-- 특정 데이터 삭제
DELETE FROM cats WHERE name = 'Egg';
-- 테이블의 모든 데이터 삭제
DELETE FROM cats;
```

- 삭제를 해도 기본키는 바뀌지 않는다.
  - 예) 1234 중 3을 삭제하면 124가 남는다

## 기타

- 작성된 명령문은 쿼리(Query)라고 부른다.
- 쿼리는 데이터베이스 등에서 원하는 정보를 검색하기 위해 요청하는 것을 말한다
