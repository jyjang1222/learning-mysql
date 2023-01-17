CREATE DATABASE _UNIVERSITY;

USE _UNIVERSITY;
-- 학과
CREATE TABLE MAJOR ( 
    MAJOR_NO INT ,
    MAJOR_NAME VARCHAR(24) 
);

-- 교수
CREATE TABLE PROFESSOR (
    PROFESSOR_NO INT ,
    PROFESSOR_NAME VARCHAR(9) ,
    PROFESSOR_MAJOR_NO INT 
);

-- 학생
CREATE TABLE STUDENT(
    STUDENT_NO INT ,
    STUDENT_NAME VARCHAR(9) ,
    STUDENT_ADDR VARCHAR(15),
    STUDENT_GRADE INT,
    STUDENT_HEIGHT INT,
    STUDENT_WEIGHT INT,
    STUDENT_STATUS VARCHAR(6),
    STUDENT_INPUT_DATA DATE,
    STUDENT_MAJOR_NO INT 
);


-- 전공과목
CREATE TABLE MAJOR_SUBJECT (
    SUBJECT_NO INT ,
    SUBJECT_NAME VARCHAR(33),
    SUBJECT_SCORE INT,
    SUBJECT_PROFESSOR_NO INT
);

-- 수강내역 
CREATE TABLE COURSE_HISTORY(
    STUDENT_NO INT NOT NULL,
    SUBJECT_NO INT NOT NULL,
    SCORE INT,
    CREDITS VARCHAR(6)
);

INSERT INTO MAJOR VALUES(1, '소프트웨어공학과');
INSERT INTO MAJOR VALUES(2, '컴퓨터공학과');
INSERT INTO MAJOR VALUES(3, '경영정보학과');
INSERT INTO MAJOR VALUES(4, '경영학과');
INSERT INTO MAJOR VALUES(5, '연극영화학과');
INSERT INTO MAJOR VALUES(6, '철학과');
SELECT * FROM MAJOR;


INSERT INTO PROFESSOR VALUES(1, '이해진', 1);
INSERT INTO PROFESSOR VALUES(2, '김정주', 1);
INSERT INTO PROFESSOR VALUES(3, '김이숙', 1);
INSERT INTO PROFESSOR VALUES(4, '이석호', 2);
INSERT INTO PROFESSOR VALUES(5, '김사부', 3);
INSERT INTO PROFESSOR VALUES(6, '장미희', 5);
INSERT INTO PROFESSOR VALUES(7, '백남영', 5);
INSERT INTO PROFESSOR VALUES(8, '김현이', 5);
INSERT INTO PROFESSOR VALUES(9, '이사부', 5);

SELECT * FROM PROFESSOR;


INSERT INTO MAJOR_SUBJECT VALUES(1, '데이터베이스관리', 3, 3);
INSERT INTO MAJOR_SUBJECT VALUES(2, '데이터베이스프로그래밍', 3, 3);
INSERT INTO MAJOR_SUBJECT VALUES(3, 'SQL활용', 3, 4);
INSERT INTO MAJOR_SUBJECT VALUES(4, '데이터베이스', 4, 5);
INSERT INTO MAJOR_SUBJECT VALUES(5, '인터넷마케팅', 3, 5);
INSERT INTO MAJOR_SUBJECT VALUES(6, '연기실습', 2, 7);
INSERT INTO MAJOR_SUBJECT VALUES(7, '영화제작실습', 2, 8);
INSERT INTO MAJOR_SUBJECT VALUES(8, '영화마케팅', 1, 9);
SELECT * FROM MAJOR_SUBJECT;



INSERT INTO STUDENT VALUES(1, '김이향', '인천남동구', 4, 166, 56, '재학', '2005-03-01',5);

INSERT INTO STUDENT 
VALUES(6, '박지은', '서울양천구', 2, 183, 65, '재학', '2015-02-14',3);

INSERT INTO STUDENT 
VALUES(7, '안칠현', '서울금천구', 1, 178, 65, '재학', '2016-02-19',1);

INSERT INTO STUDENT 
VALUES(8, '김태희', '서울구로구', 1, 165, 45, '재학', '2016-02-19',3);

INSERT INTO STUDENT 
VALUES(9, '채영', '서울구로구', 1, 172, 47, '재학', '2016-02-19',2);

INSERT INTO STUDENT 
VALUES(11, '영란', '서울강남구', 1, 162, 43, '재학', '2016-02-19',5);

INSERT INTO STUDENT 
VALUES(12, '윤호', '서울강남구', 1, 184, 66, '휴학', '2016-08-10',1);

INSERT INTO STUDENT 
VALUES(13, '보아', '서울구로구', 1, 162, 45, '재학', '2016-02-19',1);

INSERT INTO STUDENT 
VALUES(14, '문근영', '서울강남구', 1, 165, 45, '재학', '2016-02-19',3);

SELECT * FROM STUDENT;


INSERT INTO  COURSE_HISTORY VALUES(7, 1, 84.5, 'B');
INSERT INTO  COURSE_HISTORY VALUES(12, 1, 50, 'F');
INSERT INTO  COURSE_HISTORY VALUES(13, 1, 90, 'A');
INSERT INTO  COURSE_HISTORY VALUES(7, 2, 80, 'B');
INSERT INTO  COURSE_HISTORY VALUES(13, 2, 94.5, 'A');
INSERT INTO  COURSE_HISTORY VALUES(9, 3, 90, 'A');
INSERT INTO  COURSE_HISTORY VALUES(10, 3, 70, 'C');
INSERT INTO  COURSE_HISTORY VALUES(4, 4, 90, 'A');
INSERT INTO  COURSE_HISTORY VALUES(6, 4, 55, 'F');
INSERT INTO  COURSE_HISTORY VALUES(8, 4, 85, 'B');
INSERT INTO  COURSE_HISTORY VALUES(14, 4, 95, 'A');
INSERT INTO  COURSE_HISTORY VALUES(4, 5, 70, 'C');
INSERT INTO  COURSE_HISTORY VALUES(6, 5, 95, 'A');
INSERT INTO  COURSE_HISTORY VALUES(8, 5, 90, 'A');
INSERT INTO  COURSE_HISTORY VALUES(14, 5, 95, 'A');
INSERT INTO  COURSE_HISTORY VALUES(6, 8, 90, 'A');
INSERT INTO  COURSE_HISTORY VALUES(8, 8, 80, 'B');
INSERT INTO  COURSE_HISTORY VALUES(14, 8, 90, 'A');
INSERT INTO  COURSE_HISTORY VALUES(1, 6, 85, 'B');
INSERT INTO  COURSE_HISTORY VALUES(5, 6, 80, 'B');
INSERT INTO  COURSE_HISTORY VALUES(11, 6, 78.5, 'C');
INSERT INTO  COURSE_HISTORY VALUES(1, 7, 95, 'A');
INSERT INTO  COURSE_HISTORY VALUES(5, 7, 85, 'B');
INSERT INTO  COURSE_HISTORY VALUES(1, 8, 100, 'A');

SELECT * FROM  COURSE_HISTORY;

-- 1. 학생 테이블의 모든 열을 검색하라
SELECT * FROM student;

-- 2. 학생 테이블의 이름, 학년, 주소 열만 선택적으로 검색하라
SELECT STUDENT_NAME, STUDENT_GRADE, STUDENT_ADDR FROM student;

-- 3. 학생 테이블의 이름과 주소 열만 검색하라
SELECT STUDENT_NAME, STUDENT_ADDR FROM student;

-- 5. 학생 번호가 1인 학생을 검색하라
SELECT STUDENT_NO, STUDENT_NAME FROM student WHERE STUDENT_NO = 1;

-- 6. 키가 165 미만인 학생을 검색하라
SELECT STUDENT_NAME, STUDENT_HEIGHT FROM student WHERE STUDENT_HEIGHT < 165;

-- 7. 1학년이고 동시에 키가 170 이상인 학생의 이름, 학년, 키, 몸무게 을 검색하라
SELECT STUDENT_NAME, STUDENT_GRADE, STUDENT_HEIGHT, STUDENT_WEIGHT FROM student
WHERE STUDENT_GRADE = 1 AND STUDENT_HEIGHT >= 170;

-- 9. 몸무게 45보다 크거나 같고 50보다 작거나 같은 학생의 이름, 주소, 키, 몸무게을 검색 
SELECT STUDENT_NAME, STUDENT_ADDR, STUDENT_HEIGHT, STUDENT_WEIGHT FROM student
WHERE 45 <= STUDENT_WEIGHT AND STUDENT_WEIGHT <= 50;

-- 11. 학생의 번호, 이름, 학년을 검색하라
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_GRADE FROM student;

-- 13. 박씨 성을 가진 학생을 검색하라
SELECT STUDENT_NAME FROM student WHERE STUDENT_NAME LIKE '박%';

-- 14. 김씨, 이씨, 박씨 성을 가진 학생 모두를 검색하되 반드시 LIKE 연산자를 사용하라
SELECT
	STUDENT_NAME FROM student
WHERE 
	STUDENT_NAME LIKE '박%' OR
	STUDENT_NAME LIKE '김%' OR
	STUDENT_NAME LIKE '이%';

-- 18. 학생 테이블에서 모든 열에 저장된 데이터를 검색하되, 이름 가나다순으로 정렬하여 출력하라
SELECT * FROM student ORDER BY STUDENT_NAME ASC;

-- 19. 학생의 이름, 주소, 키 데이터를 검색하되 키가 큰 학생부터 출력하라
SELECT STUDENT_NAME, STUDENT_ADDR, STUDENT_HEIGHT FROM student
ORDER BY STUDENT_HEIGHT DESC;

-- 20. 1학년 학생의 이름, 학년, 주소, 몸무게 데이터를 검색하라(단 ,반드시 체중이 적은 학생부터 출력하라)
SELECT STUDENT_NAME, STUDENT_GRADE, STUDENT_ADDR, STUDENT_HEIGHT FROM student
WHERE STUDENT_GRADE = 1 ORDER BY STUDENT_WEIGHT ASC;

-- 21. 1학년 학생의 이름, 학년, 키, 몸무게 데이터를 검색하라(단, 키 내림차순으로 정렬하고, 같은 키는 몸무게 오름차순으로 정렬)
SELECT STUDENT_NAME, STUDENT_GRADE, STUDENT_HEIGHT, STUDENT_WEIGHT FROM student
WHERE STUDENT_GRADE = 1 ORDER BY STUDENT_HEIGHT DESC, STUDENT_WEIGHT ASC;

-- 22. 학생의 번호, 이름, 주소를 검색하되 이름을 가나다 순으로 정렬해라
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDR FROM student
ORDER BY STUDENT_NAME ASC;

-- 23. 학생 테이블에서 '보아' 학생과 학년이 동일한 모든 학생의 이름과 키, 몸무게를 검색하라
SELECT * FROM student
WHERE STUDENT_GRADE = (SELECT STUDENT_GRADE FROM student WHERE STUDENT_NAME = '보아');

-- 24. 1번 학과 학생들의 평균 키보다 작은 학생의 이름, 학년, 키를 검색하라
SELECT STUDENT_NAME, STUDENT_GRADE, STUDENT_HEIGHT FROM student
WHERE STUDENT_HEIGHT < (SELECT AVG(STUDENT_HEIGHT) FROM student WHERE STUDENT_MAJOR_NO = 1);

-- 25. '김태희' 학생과 학년이 같고, '김태희' 학생보다 큰 학생의 이름, 학년, 키를 검색
SELECT STUDENT_NAME, STUDENT_GRADE, STUDENT_HEIGHT FROM student
WHERE 
	STUDENT_GRADE = (SELECT STUDENT_GRADE FROM student WHERE STUDENT_NAME = '김태희') AND
    STUDENT_HEIGHT > (SELECT STUDENT_HEIGHT FROM student WHERE STUDENT_NAME = '김태희');

-- 26. 키가 165인 학생의 번호, 이름, 키를 검색하라
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_HEIGHT FROM student
WHERE STUDENT_HEIGHT = 165;

-- 27. 학생의 수를 검색하라
SELECT COUNT(*) FROM student;

-- 29. 번호가 1인 과목의 평균 점수를 검색하라
SELECT AVG(SCORE) FROM course_history WHERE STUDENT_NO = 1;

-- 30. 과목별 평균 점수를 검색하라
SELECT SUBJECT_NO, TRUNCATE(AVG(SCORE), 0) AS AVG
FROM course_history GROUP BY SUBJECT_NO;

-- 32. 누적학생 수가 네 명 이상인 과목의 평균 점수를 검색하라
SELECT SUBJECT_NO, COUNT(*), AVG(SCORE)
FROM course_history GROUP BY SUBJECT_NO
HAVING COUNT(*) >= 4;

-- 34. 학생들의 학번, 이름, 소속학과 이름을 검색하라
SELECT student.STUDENT_NO, student.STUDENT_NAME, major.MAJOR_NAME
FROM student, major
WHERE student.STUDENT_MAJOR_NO = major.MAJOR_NO;

-- 35. 교수의 번호, 이름, 소속 학과 이름을 검색하라
SELECT p.PROFESSOR_NO, p.PROFESSOR_NAME, m.MAJOR_NAME AS PROFESSOR_MAJOR_NAME 
FROM professor p, major m
WHERE p.PROFESSOR_MAJOR_NO = m.MAJOR_NO;

-- 36. '채영' 학생의 번호, 이름, 소속 학과 이름을 검색하라
SELECT STUDENT_NO, STUDENT_NAME, MAJOR_NAME
FROM student s, major m
WHERE s.STUDENT_MAJOR_NO = m.MAJOR_NO;

-- 37. 키가 180 이상인 학생의 번호, 이름, 키, 소속 학과 이름을 검색하라
SELECT s.STUDENT_NO, s.STUDENT_NAME, s.STUDENT_HEIGHT, m.MAJOR_NAME
FROM student s, major m
WHERE s.STUDENT_MAJOR_NO = m.MAJOR_NO AND s.STUDENT_HEIGHT > 180;

-- 38. 학점에 A가 포함된 학생들의 이름 출력
SELECT s.STUDENT_NAME, c.CREDITS
FROM course_history c, student s
WHERE c.CREDITS = 'A' AND c.STUDENT_NO = s.STUDENT_NO GROUP BY s.STUDENT_NAME;