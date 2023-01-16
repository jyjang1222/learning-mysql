/*
    # 그룹 함수(= 복수행 함수, 다중행 함수)
    (1) 정의 : 여러 행을 바탕으로 하나의 결과 값을 도출해내기 위해 사용하는 함수
    (2) 자주 사용하는 그룹 함수
        1) SUM      : 합
        2) COUNT    : 개수
        3) MAX      : 최대값
        4) MIN      : 최소값
        5) AVG      : 평균값 
*/

-- [개념 1-1] SUM 함수 사용하기
-- [실습 1-1] 모든 사원들의 급여 합계 출력하기

SELECT SUM(SAL)
    FROM EMP;
    
-- [개념 1-2] SUM함수는 NULL 데이터를 제외하고 합계를 구한다.
-- 때문에 추가 수당 열은 NULL이 존재하는 열이나 별다른 문제가 없었던 것이다.
-- [실습 1-2] 모든 사원들의 추가 수당 합계 구하기

SELECT SUM(COMM)
    FROM EMP;

-- [개념 1-3] 그룹 함수를 사용한 SELECT절에는 기본적으로
-- 여러 행이 결과로 나올 수 있는 열을 함께 사용할 수 없다.
-- 즉 다음과 같은 SELECT문은 실행되지 못하고 오류가 발생한다. 
-- [실습 1-3] 모든 사원들의 이름과 급여 합계 출력하기(오류발생 : ORA-00937)

SELECT ENAME, SUM(SAL)
    FROM EMP;
    
-- [개념 2-1] COUNT 함수에 *을 사용하면 SELECT문의 결과 값으로 나온 행의 개수를 반환해 준다.
-- [실습 2-1] EMP 테이블의 개수 출력하기

SELECT COUNT(*)
    FROM EMP;
   
-- [개념 2-2] COUNT 함수와 생략 가능 옵션 DISTINCT 사용하기
-- [실습 2-2] 전체 부서번호의 개수 출력하기(단, 중복 제거)

SELECT COUNT(DISTINCT DEPTNO)
    FROM EMP;

-- [개념 2-3] COUNT함수는 NULL 데이터를 제외하고 개수를 구한다.
-- [실습 2-3] 추가 수당을 받는 사원의 수 출력하기

SELECT COUNT(COMM)
    FROM EMP;

-- [개념 3-1] MAX 함수 사용하기
-- [실습 3-1] 부서 번호가 10번이 사원들 중 최대 급여 출력하기

SELECT MAX(SAL)
    FROM EMP
WHERE DEPTNO = 10;

-- [개념 3-2] MIN 함수 사용하기
-- [실습 3-2] 부서 번호가 10번인 사원들 중 최소 급여 출력하기

SELECT MIN(SAL)
    FROM EMP
WHERE DEPTNO = 10;

-- [개념 3-3] 오라클 데이터베이스에서는 날짜 및 문자 데이터 역시 크기 비교가 가능하다.
-- [실습 3-3-1] 부서 번호가 20번인 사원들 중 제일 최근 입사일 출력하기

SELECT MAX(HIREDATE)
    FROM EMP
WHERE DEPTNO = 20;

-- [실습 3-3-2] 부서 번호가 20번인 사원들 중 입사일이 제일 오래된 입사일 출력하기

SELECT MIN(HIREDATE)
    FROM EMP
WHERE DEPTNO = 20;

-- [실습 3-3-3] 사원 이름이 알파벳 순으로 가장 앞글자와 뒷글자 이름 출력하기 

SELECT MIN(ENAME), MAX(ENAME)
    FROM EMP;

-- [개념 4-1] AVG 함수 사용하기
-- [실습 4-1] 부서 번호가 30번인 사원들의 평균 급여 출력하기

SELECT AVG(SAL)
    FROM EMP
WHERE DEPTNO = 30;

/*
    [개념 1] GROUP BY 절
    (1) 정의
        여러 데이터에서 의미 있는 하나의 결과를
        특정 열 값별로 묶어서 출력할 때 데이터를 '그룹화'한다고 표현한다.
        예) 각 부서별 평균 급여 출력하기
    (2) 기본 형식
        SELECT   [조회할 열1 이름], [조회할 열2 이름], ..., [열N 이름]
        FROM     [조회할 테이블 이름]
        WHERE    [조회할 행을 선별하는 조건식]
        GROUP BY [그룹화할 열을 지정(여러개 지정 가능)]
        ORDER BY [정렬하려는 열 지정]       
    (3) 주의
        GROUP BY 절에는 별칭이 인식되지 않는다.
*/

-- [개념 1-1] GROUP BY절 사용하기
-- [실습 1-1] 각 부서별 평균 급여 출력하기

SELECT DEPTNO, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO;

-- [개념 1-2] GROUP BY절에 여러개 열을 지정할 수 있다.
-- [실습 1-2] 부서 번호 및 직책별 평균 급여 출력하기

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- [개념 1-3] GROUP BY 절을 사용할 때 
-- 그룹 함수를 사용한 열 또는 GROUP BY 절에 명시한 열만 사용할 수 있다.
-- [실습 1-3] ENAME은 일반 열로 그룹화된 열의 데이터 수와 일치하지 않는다.(오류발생 : ORA-00937)

SELECT ENAME, DEPTNO, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO;

/*
    [개념 2] HAVING 절
    (1) 정의
        GROUP BY절을 통해 그룹화된 결과 값의 범위를 제한하는 데 사용한다.
    (2) 기본 형식
        SELECT   [조회할 열1 이름], [조회할 열2 이름], ..., [열N 이름]
        FROM     [조회할 테이블 이름]
        WHERE    [조회할 행을 선별하는 조건식]
        GROUP BY [그룹화할 열을 지정(여러개 지정 가능)]
        HAVING   [출력 그룹을 제한하는 조건식]
        ORDER BY [정렬하려는 열 지정]     
    (3) 주의
        WHERE절은 출력 대상 행을 제한하고,
        HAVING절은 그룹화된 대상을 출력에서 제한하기 위해 쓰인다.
*/

-- [개념 2-1] GROUP BY절과 HAVING절 사용하기
-- [실습 2-1] 평균 급여가 2000이 넘는 사원의 부서번호, 직책, 평균 급여 출력하기

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;
    
-- [개념 2-2] HAVING절 대신 WHERE절을 잘못 사용했을 경우
-- [실습 2-2] WHERE 절에서는 그룹함수를 통해 조건식을 지정할 수 없다.(오류발생)

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
WHERE AVG(SAL) >= 2000
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;

-- [개념 2-3] WHERE절과 HAVING절을 모두 사용한 경우
-- [실습 2-3] 급여가 3000 이하인 사원들 중에 평균 급여가 2000이상인 사원의
--           부서번호, 직책, 평균 급여 출력하기

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
WHERE SAL <= 3000
    GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
    ORDER BY DEPTNO, JOB;
    


/* [07 GROUPBY절] */                                                                 
-- [문제 07-1] 모든 사원들의 급여와 추가 수당의 합계 출력하기
-- [정답 07-1]

SELECT SUM(SAL), SUM(COMM)
    FROM EMP;
    
-- [문제 07-2] 부서 번호가 30번인 직원 수 구하기
-- [정답 07-2]

SELECT COUNT(*)
    FROM EMP
WHERE DEPTNO = 30;

-- [문제 07-3] 부서 번호가 30번인 사원들의 평균 추가 수당 출력하기
-- [정답 07-3]

SELECT AVG(COMM)
    FROM EMP
WHERE DEPTNO = 30;

-- [문제 07-4] 부서 번호별 평균 추가 수당 출력하기
-- [정답 07-4]

SELECT DEPTNO, AVG(COMM)
    FROM EMP
GROUP BY DEPTNO;

-- [문제 07-5] 부서별 직책의 평균 급여가 2000이상인 사원들의 부서 번호, 직책, 부서별 직책의 평균 급여 출력하기
-- [정답 07-5]

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

-- [문제 07-6] 
-- 부서번호(DEPTNO), 평균급여(AVG_SAL), 최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT)를 출력하시오.
-- 단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별로 출력하시오.
-- [정답 07-6]

SELECT DEPTNO,
       AVG(SAL) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
    FROM EMP
GROUP BY DEPTNO;

-- [문제 07-7] 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력하기
-- [정답 07-7]

SELECT JOB, COUNT(JOB)
    FROM EMP
GROUP BY JOB
    HAVING COUNT(JOB) >= 3;


    