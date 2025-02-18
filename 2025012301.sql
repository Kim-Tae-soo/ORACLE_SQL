(조인)
SELECT A.MEM_ID AS 회원번호,
       A.MEM_NAME AS 회원명,
       SUBSTR(A.MEM_ADD1, 1, 2) AS 주소,
       TO_DATE(SUBSTR(B.CART_NO, 1, 8)) AS 주문일자,
       C.PROD_NAME AS 상품명,
       B.CART_QTY AS 주문수량
  FROM LYS00.MEMBER A
 INNER JOIN LYS00.CART B ON (A.MEM_ID = B.MEM_ID)
 INNER JOIN LYS00.PROD C ON (B.PROD_ID = C.PROD_ID)
 WHERE A.MEM_ADD1 LIKE '충남%'
 ORDER BY 1, 4;
(조인 + 서브쿼리)
SELECT A.MEM_ID AS 회원번호,
       A.MEM_NAME AS 회원명,
       SUBSTR(A.MEM_ADD1, 1, 2) AS 주소,
       TO_DATE(SUBSTR(B.CART_NO, 1, 8)) AS 주문일자,
       C.PROD_NAME AS 상품명,
       B.CART_QTY AS 주문수량
  FROM LYS00.MEMBER A
 INNER JOIN LYS00.CART B ON (A.MEM_ID = B.MEM_ID)
 INNER JOIN LYS00.PROD C ON (B.PROD_ID = C.PROD_ID)
 WHERE A.MEM_ID IN (SELECT MEM_ID
                      FROM LYS00.MEMBER
                     WHERE SUBSTR(A.MEM_ADD1, 1, 2) LIKE '충남%') 
 ORDER BY 1, 4;

SELECT A.MEM_ID AS 회원번호,
       A.MEM_NAME AS 회원명,
       SUBSTR(A.MEM_ADD1, 1, 2) AS 주소,
       TO_DATE(SUBSTR(B.CART_NO, 1, 8)) AS 주문일자,
       C.PROD_NAME AS 상품명,
       B.CART_QTY AS 주문수량
  FROM LYS00.MEMBER A
 INNER JOIN LYS00.CART B ON (A.MEM_ID = B.MEM_ID)
 INNER JOIN LYS00.PROD C ON (B.PROD_ID = C.PROD_ID)
 WHERE EXISTS (SELECT 1
                 FROM LYS00.MEMBER B
                WHERE B.MEM_ADD1 LIKE '충남%'
                  AND A.MEM_ID=B.MEM_ID) 
 ORDER BY 1, 4;

SELECT B.MEM_ID AS 회원번호,
       B.MEM_NAME AS 회원명,
       SUM(A.CART_QTY * C.PROD_PRICE) AS 구매액
  FROM LYS00.CART A
 INNER JOIN LYS00.MEMBER B ON(A.MEM_ID = B.MEM_ID)
 INNER JOIN LYS00.PROD C ON(A.PROD_ID = C.PROD_ID AND A.CART_NO LIKE '202007%')
 WHERE A.MEM_ID IN (SELECT MEM_ID
                      FROM LYS00.MEMBER
                     WHERE MEM_MILEAGE > (SELECT AVG(MEM_MILEAGE)
                                            FROM LYS00.MEMBER))
 GROUP BY B.MEM_ID, B.MEM_NAME
 ORDER BY 1;
                      
                      

SELECT *
FROM (SELECT EMP_NAME, SALARY, HIRE_DATE
        FROM HR.EMPLOYEES
       WHERE HIRE_DATE < TO_DATE('2020', 'YYYY')
       ORDER BY SALARY DESC)
WHERE ROWNUM < 11;
 
UPDATE HR.EMPLOYEES SET HIRE_DATE = add_months(HIRE_DATE,-12);
FROM HR.EMPLOYEES;
 
SELECT HIRE_DATE
FROM HR.EMPLOYEES;

CREATE TABLE RETIRE FROM
    SELECT EMPLOYEE_ID, EMP_NAME, DEPARTMENT_ID,HIRE_DATE
      FROM HR.EMPLOYEES
     WHERE HIRE_DATE <TO_DATE('20200101');
COMMIT;

DELETE 
FROM EMP
WHERE EMPLOYEE_ID IN(
















