# 섹션3: 데이터베이스와 테이블 만들기

## 이름 규칙

**1. 데이터베이스 이름**
  - MyApp 대문자를 이용하여 구분하는 방식
  - my_app 모두 소문자로 작성하고 \_로 구분하는 스네이크표기법
  - 둘중 아무것이나 사용해도 상관없으나 일관성이 있어야한다. - 강사는 스네이크표기법 추천

**2. 테이블 이름**
  - 테이블 이름에는 cats 같이 복수형을 사용하는 것이 좋다.

**3. SQL 명령문**
  - 소문자와 대문자 둘다 사용이 가능하지만 명령문과 데이터베이스 이름 또는 테이블 이름을 구분하기위해 대문자를 쓰는 방식이 좋다.

## 데이터베이스 명령문

### SHOW DATABASES;
- 사용 가능한 데이터베이스를 나열
### CREATE DATABASE database_name;
- 데이터베이스 생성을 위한 명령
### DROP DATABASE database_name;
- 데이터베이서 제거를 위한 명령
### USE database_name;
- 특정 데이터베이스 사용
### SELECT database();
- 현재 사용중인 데이터베이스 확인

## 관계형 데이터베이스

- 데이터베이스는 단지 수많은 테이블이며 그 곳에 데이터가 저장된다.
- 모든 데이터베이스가 테이블이 있는 것이 아니며 테이블은 관계형 데이터베이스에 존재한다.

## 데이터 테이블의 타입

- 테이블의 데이터 타입 종류는 매우 많지만 주로 쓰이는 타입은 정해져있다,
- 정수형에는 int
- 문자열에는 varchar(length)
  - char는 고정길이, varchar는 가변길이 이다.

## 테이블 명령문

### CREATE TABLE table_name (column_names)
- 테이블 생성

```sql
CREATE TABLE table_name (
        column_name data_type,
        column_name data_type,
    )

-- 예시
CREATE TABLE cats (
        name VARCHAR(100),
        age INT,
    )
```

### SHOW TABLES;
- 테이블들의 확인 (현재 사용중인 데이터베이스)
### SHOW COLUMNS FROM table_name;
- 테이블 내의 칼럼들 확인
### DESC table_name;
- 테이블 내의 칼럼들 확인 (바로위 명령문과 기능 동일)
### DROP TABLE table_name;
- 테이블 삭제
