-- 데이터 베이스명앞에 _를 붙여야 맨위로 정렬된다. 
-- Ctrl + 휠 증가 감소로 글을 확대 감소 할수있다. 

-- 명령어 한 줄 실행하기 : Ctrl + Enter
CREATE DATABASE _sample; -- 생성후에는 반드시 reconnect를 해야한다(새로고침) 

USE _sample; -- 왼쪽 schemas 의 데이터베이스 명을 더블클릭해되된다. 

-- 데이터 베이스 삭제는 왼족 데이터버이스를 선택후 오른쪽버튼으로 Drop schemas 를선택한다.  

CREATE TABLE sample01(
	no INT(11),
    name VARCHAR(20),
    birthday DATE,
    address VARCHAR(40)
);

DESC member; -- 테이블이 잘생성된건지 확인할수있다. 

-- 생성후에는 반드시 reconnect를 해야한다(새로고침) 
DROP TABLE sample01;

-- 저장방식은 컬럼명(no, name, birthday, address)을 써도되고 안써도된다. (정확히 하기위해서는 쓰는것이 좋다)
-- 저장 문법
-- INSERT INTO 테이블명 (컬럼명) VALUES (저장값); 
INSERT INTO sample01 VALUES(1, '박준용', '1976-10-18', '대구광역시 수성구');
INSERT INTO sample01 (no, name, birthday, address) VALUES(2, '김재진', '1987-02-14', '대구광역시 동구');
INSERT INTO sample01 (no, name, birthday, address) VALUES(3, '홍길동', '1990-04-28', '서울시 송파구');

-- select 문으로 테이블 내용을 검색할수있다.
SELECT * FROM sample01;

-- where 절로 테이블 내용을 부분 검색할수있다. 
SELECT * FROM sample01 WHERE no=2;


-- update 문으로 내용을 변경할수있다. 
UPDATE sample01 SET name='이만수' WHERE no=2;

SELECT * FROM sample01;


-- delete 문으로 내용을 삭제할수있다. 
DELETE FROM sample01 where no=1;

SELECT * FROM sample01;



