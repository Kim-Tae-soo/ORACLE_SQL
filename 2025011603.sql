- 매입테이블에서 2020년 상품별 매입수량합계를 조회하시오

SELECT PROD_ID AS 상품코드,
       SUM(BUY_QTY) AS 매입수량합계
  FROM LYS00.BUYPROD
 WHERE BUY_DATE LIKE '2020%'
 GROUP BY PROD_ID;

- 매출테이블에서 월별, 상품별 판매수량합계를 조회하시오

SELECT EXTRACT(MONTH FROM TO_DATE(SUBSTR(CART_NO, 1, 6), 'YYYYMM')) AS 월,
       PROD_ID AS 상품코드,
       SUM(CART_QTY) AS 판매수량합계
  FROM LYS00.CART
 GROUP BY EXTRACT(MONTH FROM TO_DATE(SUBSTR(CART_NO, 1, 6), 'YYYYMM')), PROD_ID;

- 사원테이블에서 부서별, 년도별 입사한 사원수를 조회하시오

SELECT DEPARTMENT_ID AS 부서번호,
       EXTRACT(YEAR FROM HIRE_DATE) AS 년도,
       COUNT(EMPLOYEE_ID) AS 입사한사원수
  FROM HR.EMPLOYEES
 GROUP BY DEPARTMENT_ID, EXTRACT(YEAR FROM HIRE_DATE)
 ORDER BY 1;

- 회원테이블에서 성별 평균마일리지를 조회하시오.

SELECT DECODE(SUBSTR(MEM_REGNO2, 1, 1), '1', '남자', '3', '남자', '여자') AS 성별, 
       ROUND(AVG(MEM_MILEAGE)) AS 평균마일리지
  FROM LYS00.MEMBER
 GROUP BY DECODE(SUBSTR(MEM_REGNO2, 1, 1), '1', '남자', '3', '남자', '여자');
  
- 회원테이블에서 연령대별 회원수와 평균마일리지를 조회하시오

SELECT SUBSTR(EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM MEM_BIR), 1, 1)||'0대' AS 연령대,
       COUNT(*) AS 회원수,
       ROUND(AVG(MEM_MILEAGE))평균마일리지
  FROM LYS00.MEMBER
 GROUP BY SUBSTR(EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM MEM_BIR), 1, 1)
 ORDER BY 1; 

- 회원테이블에서 거주지별 평균 마일리지와 회원수를 조회하시오

SELECT SUBSTR(MEM_ADD1, 1, 2) AS 거주지, 
       ROUND(AVG(MEM_MILEAGE)) AS 평균마일리지,
       COUNT(MEM_ID) AS 회원수
  FROM LYS00.MEMBER
 GROUP BY SUBSTR(MEM_ADD1, 1, 2);












