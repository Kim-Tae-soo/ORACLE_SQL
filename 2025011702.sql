2025-0117-02) 등위함수

사용예) 사원테이블에서 근속년수가 가장 많은 사원부터 등수를 부여하시오
       Alias는 사원번호, 사원명, 입사일, 근속년수, 등수

SELECT EMPLOYEE_ID AS 사원번호,
       EMP_NAME AS 사원명,
       HIRE_DATE AS 입사일,
       EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)||'년' AS 근속년수,
       RANK() OVER(ORDER BY HIRE_DATE) AS "등수(RANK)",
       DENSE_RANK() OVER(ORDER BY HIRE_DATE) AS"등수(DENSE_RANK)",
       ROW_NUMBER() OVER(ORDER BY HIRE_DATE) AS"등수(ROW_NUMBER)"
  FROM HR.EMPLOYEES
  
사용예) 상품테이블에서 분류별 판매가가 큰값 순으로 순위를 부여하시오
       Alias는 상품번호, 상품명, 분류코드, 판매가, 순위

SELECT PROD_ID AS 상품번호,
       PROD_NAME AS 상품명,
       LPROD_GU AS 분류코드,
       PROD_PRICE AS 판매가,
       RANK() OVER(PARTITION BY LPROD_GU ORDER BY PROD_PRICE DESC) AS 순위
  FROM LYS00.PROD;
  
사용예) 2020년 1-3월 상품별 매입수량합계를 기준으로 순위를 부여하시오
       Alias는 상품코드, 매입수량합계, 순위
       
       SELECT PROD_ID AS 상품코드,
              SUM(BUY_QTY) AS 매입수량합계, 
              RANK() OVER (ORDER BY SUM(BUY_QTY) DESC) AS 순위
         FROM LYS00.BUYPROD
         WHERE BUY_DATE BETWEEN '20200101' AND LAST_DAY('20200301')
        GROUP BY PROD_ID;
        