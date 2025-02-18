SELECT SUM(MEM_MILEAGE) AS "마일리지 합계",
       ROUND(AVG(MEM_MILEAGE), 2) AS "평균 마일리지",
       COUNT(MEM_ID) AS 인원수,
       MAX(MEM_MILEAGE) AS 최대마일리지,
       MIN(MEM_MILEAGE) AS 최소마일리지
  FROM LYS00.MEMBER;
  
SELECT COUNT(PROD_ID) AS 상품의수,
       MAX(PROD_PRICE) AS 최대판매가,
       MIN(PROD_PRICE) AS 최소판매가
  FROM LYS00.PROD;
  
SELECT *
  FROM LYS00.LPROD
 WHERE ROWNUM <= 4; 
 
SELECT SUM(CART_QTY) AS 판매수량합계
  FROM LYS00.CART
 WHERE CART_NO LIKE '202004%';
 
 사원테이블에서 부서별 평균급여와 인원수를 조회하시오
 SELECT DEPARTMENT_ID AS 부서코드,
        ROUND(AVG(SALARY)) AS 평균급여,
        COUNT(EMPLOYEE_ID) AS 인원수
   FROM HR.EMPLOYEES
  GROUP BY DEPARTMENT_ID
  ORDER BY 1;
 
 상품테이블에서 분류별 상품의 수, 평균판매가를 조회하시오
 
 SELECT LPROD_GU AS 분류코드,
        COUNT(*) AS "상품의 수",
        ROUND(AVG(PROD_PRICE)) AS 평균판매가
   FROM LYS00.PROD
  GROUP BY LPROD_GU
 HAVING COUNT(*) >= 10;
 
 매입테이블에서 2020년 월별 매입 수량 합계를 조회하시오
 
SELECT EXTRACT(MONTH FROM BUY_DATE) AS 월,
       SUM(BUY_QTY) AS "매입 수량 합계"
  FROM LYS00.BUYPROD
 WHERE EXTRACT(YEAR FROM BUY_DATE) = 2020
 GROUP BY EXTRACT(MONTH FROM BUY_DATE)
 HAVING SUM(BUY_QTY) >= 1000
 ORDER BY 1;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 