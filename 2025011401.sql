2025-0114-01

SELECT MEM_ID AS 회원번호,
       MEM_NAME AS 회원명,
       MEM_JOB AS 직업,
       MEM_MILEAGE AS 마일리지
  FROM LYS00.MEMBER
 WHERE MEM_MILEAGE > ANY(SELECT MEM_MILEAGE 
                           FROM LYS00.MEMBER
                          WHERE MEM_JOB = '주부')
   AND MEM_JOB != '주부'
 ORDER BY 4;

(2020년 5월 30대 회원들의 구매금액)
  SELECT A.MEM_ID,
         SUM(A.CART_QTY*B.PROD_PRICE)
    FROM SEM.CART A, SEM.PROD B, SEM.MEMBER C
   WHERE A.PROD_ID=B.PROD_ID
     AND A.MEM_ID=C.MEM_ID
     AND A.CART_NO LIKE '202005%'
     AND EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM MEM_BIR) BETWEEN 30 AND 39
   GROUP BY  A.MEM_ID; 
  
(2020년 5월 20대 회원들의 구매금액)   
  SELECT A.MEM_ID,
         SUM(A.CART_QTY*B.PROD_PRICE)
    FROM SEM.CART A, SEM.PROD B, SEM.MEMBER C
   WHERE A.PROD_ID=B.PROD_ID
     AND A.MEM_ID=C.MEM_ID
     AND A.CART_NO LIKE '202005%'
     AND EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM MEM_BIR) BETWEEN 20 AND 29
   GROUP BY  A.MEM_ID; 
   
(결합)
  SELECT TBLB.BMID AS 회원번호,
         TBLB.BNAME AS 회원명,
         TBLB.BSUM AS 구매금액
    FROM (SELECT A.MEM_ID AS BMID,
                 C.MEM_NAME AS BNAME,
                 SUM(A.CART_QTY*B.PROD_PRICE) AS BSUM
             FROM SEM.CART A, SEM.PROD B, SEM.MEMBER C
            WHERE A.PROD_ID=B.PROD_ID
              AND A.MEM_ID=C.MEM_ID
              AND A.CART_NO LIKE '202005%'
              AND EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM MEM_BIR) BETWEEN 20 AND 29
            GROUP BY  A.MEM_ID, C.MEM_NAME) TBLB 
   WHERE TBLB.BSUM>ANY(SELECT C.ASUM  
                         FROM (SELECT A.MEM_ID,
                                      SUM(A.CART_QTY*B.PROD_PRICE) AS ASUM
                                 FROM SEM.CART A, SEM.PROD B, SEM.MEMBER C
                                WHERE A.PROD_ID=B.PROD_ID
                                  AND A.MEM_ID=C.MEM_ID
                                  AND A.CART_NO LIKE '202005%'
                                  AND EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM MEM_BIR)
                                      BETWEEN 30 AND 39
                                GROUP BY  A.MEM_ID)C )     
                                 
                                 
                                 
(60번부서의 사원들의 급여)
SELECT SALARY
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID=60;
 
SELECT EMPLOYEE_ID AS 사원번호,
       EMP_NAME AS 사원명, 
       JOB_ID AS 직책코드, 
       SALARY AS 급여
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID = 80
   AND SALARY > ANY(SELECT SALARY
                      FROM HR.EMPLOYEES
                     WHERE DEPARTMENT_ID=60);
  
  
  
  SELECT EMPLOYEE_ID AS 사원번호,
       EMP_NAME AS 사원명, 
       JOB_ID AS 직책코드, 
       SALARY AS 급여
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID = 80
   AND SALARY < ALL(SELECT SALARY
                      FROM HR.EMPLOYEES
                     WHERE DEPARTMENT_ID=100);                  
  
  
  
  
  
  
  
  
  
  
  
  