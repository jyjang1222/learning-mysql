# 섹션4: 데이터 삽입하기

## 데이터 명령문

- INSERT INTO table_name(column_name) VALUES (data);
  - 데이터 삽입

```sql
-- 데이터 삽입
INSERT INTO table_name(column_name)
VALUES (data);

-- 삽입 예시
INSERT INTO cats(name, age)
VALUES ('Jetson', 7);

-- 여러개 삽입
INSERT INTO table_name
        (column_name, column_name)
VALUES  (value, value),
        (value, value),
        (value, value);

-- 여러개 삽입 예시
INSERT INTO cats
        (name, age)
VALUES  ('Charlie', 10),
        ('Sadie', 3),
        ('Lazy Bear', 1);
```

- SELECT \* FROM table_name;
  - 데이터 확인

## 테이블 Null열의 의미

| Field | Type        | Null | Key | Default |
| ----- | ----------- | ---- | --- | ------- |
| name  | varchar(50) | YES  |     | Null    |
| age   | int         | YES  |     | Null    |

- Null이 YES이면 빈값의 데이터를 넣는 것을 허용한다는 의미이다.
- 빈값의 데이터 넣기를 허용하지 않으려면 테이블을 정의할때 할수있다.

## NOT NULL & DEFAULT

- NOT NULL
  - NULL을 허용하고 싶지 않을때 사용

```sql
CREATE TABLE table_name (
        column_name data_type NOT NULL,
        column_name data_type NOT NULL,
    )

-- 예시
CREATE TABLE cats (
        name VARCHAR(100) NOT NULL,
        age INT NOT NULL,
    )
```

- DEFAULT
  - 빈값의 데이터가 들어왔을때 지정할 기본값

```sql
CREATE TABLE table_name (
        column_name data_type DEFAULT default_value,
        column_name data_type DEFAULT default_value,
    )

-- 예시
CREATE TABLE cats (
        name VARCHAR(100) DEFAULT 'unnamed',
        age INT DEFAULT 99,
    )
```

- NOT NULL 과 DEFAULT 키워드 둘다 사용하는 경우

```sql
-- DEFAULT를 지정했는데 왜 NOT NULL을 같이 사용하는지에 대한 예시
CREATE TABLE cats3(
	name VARCHAR(100) DEFAULT 'unnamed',
    age INT DEFAULT 99
);

-- age를 입력하지 않아서 기본값인 99가 지정됨
INSERT INTO cats3(name) VALUES('Montana');
-- NULL값을 수동으로 넣으면 기본값이 지정되는 것이 아닌 NULL값이 들어간다
INSERT INTO cats3(name, age) VALUES('Montana', NULL);

-- NOT NULL DEFAULT 둘다 사용 예시
CREATE TABLE cats4(
	name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);
-- NOT NULL 키워드를 사용해서 NULL값을 수동으로 넣어도 들어가지 않는다
INSERT INTO cats4(name, age) VALUES(NULL, NULL);
```

## 테이블 기본키 지정하기

- 기본키의 이름을 지정한 뒤에 **PRIMARY KEY (id_column_name)** 키워드를 사용

```sql
-- 방법1
CREATE TABLE unique_cats (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);
-- 방법2
CREATE TABLE unique_cats (
    cat_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
);
/*
| Field | Type        | Null | Key | Default | Extra |
| ----- | ----------- | ---- | --- | ------- | ----- |
| cat_id| int         | NO   | PRI | Null    |       |
| name  | varchar(50) | YES  |     | Null    |       |
| age   | int         | YES  |     | Null    |       |
*/
INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Fred', 23);
INSERT INTO unique_cats(cat_id, name, age) VALUES(2, 'Louise', 3);

CREATE TABLE unique_cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);
/*
| Field  | Type        | Null | Key | Default | Extra          |
| ------ | ----------- | ---- | --- | ------- | -------------- |
| cat_id | int         | NO   | PRI | Null    | auto_increment |
| name   | varchar(50) | YES  |     | Null    |                |
| age    | int         | YES  |     | Null    |                |
*/
INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);
```

- 데이터가 같을 때 기본키를 지정해주면 고유한 데이터를 만들 수 있다.
- **AUTO_INCREMENT** 키워드를 사용하면 키값이 1부터시작하고 값을 삽입하면 자동으로 1을 증가시켜주어 키값을 입력하는 수고를 덜수있다.
