-- [8] 서브 쿼리 
-- JONES 의 급여보다 높은 급여를 받는 사원 정보 출력하기

SELECT *
FROM EMP
WHERE SAL > (SELECT SAL 
            FROM EMP
            WHERE ENAME='JONES');

-- SCOTT 보다 빨리 입사한 사원목록 

SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE 
                FROM EMP
                WHERE ENAME='SCOTT');


-- 20번 부서에 속한 사원중 전체 사원의 평균급여보다 높은 급여를 받는 사원정보

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL , D.DEPTNO , D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 20
AND E.SAL > (SELECT AVG(SAL) FROM EMP);
                    

-- 부서 번호가 20 이거나 30인 사원의 정보
-- IN 사용법  ( 여러가지중 하나라도 포함되면 TRUE)  

SELECT * 
FROM EMP
WHERE DEPTNO IN (20, 30);

-- 각 부서별 최고급여와 동일한 급여를 받는 사원 정보 

SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
            FROM EMP
            GROUP BY DEPTNO);

-- 위예제에서 하위 SELECT 문만 참고하면 최고 급여는 3가지로 한개의값이 아니므로 IN 을써서 출력한다. 




