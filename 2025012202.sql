2025-0122-02) SUBQUERY
SELECT EMPLOYEE_ID AS 사원번호,
       EMP_NAME AS 사원명,
       SALARY AS 급여
  FROM HR.EMPLOYEES
 WHERE SALARY > (SELECT AVG(SALARY)
                   FROM HR.EMPLOYEES)
 ORDER BY 3;
 
SELECT A.EMPLOYEE_ID AS 사원번호,
       A.EMP_NAME AS 사원명,
       A.SALARY AS 급여
  FROM HR.EMPLOYEES A, (SELECT AVG(SALARY) AS BAVG
                          FROM HR.EMPLOYEES) B
 WHERE A.SALARY > B.BAVG
 ORDER BY 3;
 
 SELECT A.PROD_ID AS 상품번호, 
        B.PROD_NAME AS 상품명, 
        SUM(B.PROD_COST * A.BUY_QTY) AS 매입금액합계
   FROM LYS00.BUYPROD A, LYS00.PROD B
  WHERE A.PROD_ID = B.PROD_ID
    AND A.BUY_DATE BETWEEN TO_DATE('20200101') AND TO_DATE('20200131')
  GROUP BY A.PROD_ID, B.PROD_NAME
  ORDER BY 3 DESC; 
  
  
  SELECT * 
    FROM ( SELECT A.PROD_ID AS 상품번호, 
                  B.PROD_NAME AS 상품명, 
                  SUM(B.PROD_COST * A.BUY_QTY) AS 매입금액합계
             FROM LYS00.BUYPROD A, LYS00.PROD B
            WHERE A.PROD_ID = B.PROD_ID
              AND A.BUY_DATE BETWEEN TO_DATE('20200101') AND TO_DATE('20200131')
            GROUP BY A.PROD_ID, B.PROD_NAME
            ORDER BY 3 DESC)
  WHERE ROWNUM <= 5;
  
사원번호, 사원명, 직무명, 급여
SELECT A.EMPLOYEE_ID AS 사원번호,
       A.EMP_NAME AS 사원명,
       B.JOB_TITLE AS 직무명,
       A.SALARY AS 급여
  FROM HR.EMPLOYEES A, HR.JOBS B
 WHERE A.SALARY > ALL(SELECT SALARY
                        FROM HR.EMPLOYEES
                       WHERE JOB_ID = 'FI_ACCOUNT')
   AND A.JOB_ID = B.JOB_ID;


SELECT SALARY
  FROM HR.EMPLOYEES
 WHERE JOB_ID = 'FI_ACCOUNT';

SELECT A.EMPLOYEE_ID AS 사원번호,
       A.EMP_NAME AS 사원명,
       B.JOB_TITLE AS 직무명,
       A.SALARY AS 급여
  FROM HR.EMPLOYEES A, HR.JOBS B
 WHERE A.JOB_ID = B.JOB_ID 
   AND EXISTS (SELECT 1
                 FROM (SELECT MAX(SALARY) AS MSAL
                         FROM HR.EMPLOYEES
                        WHERE JOB_ID = 'FI_ACCOUNT') C
                WHERE A.SALARY > C.MSAL);












  
  
  
  
  
  
  
  
  
  
  
  
  
  
