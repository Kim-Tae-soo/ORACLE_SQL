2025-0114-01

SELECT MEM_ID AS ȸ����ȣ,
       MEM_NAME AS ȸ����,
       MEM_JOB AS ����,
       MEM_MILEAGE AS ���ϸ���
  FROM LYS00.MEMBER
 WHERE MEM_MILEAGE > ANY(SELECT MEM_MILEAGE 
                           FROM LYS00.MEMBER
                          WHERE MEM_JOB = '�ֺ�')
   AND MEM_JOB != '�ֺ�'
 ORDER BY 4;

(2020�� 5�� 30�� ȸ������ ���űݾ�)
  SELECT A.MEM_ID,
         SUM(A.CART_QTY*B.PROD_PRICE)
    FROM SEM.CART A, SEM.PROD B, SEM.MEMBER C
   WHERE A.PROD_ID=B.PROD_ID
     AND A.MEM_ID=C.MEM_ID
     AND A.CART_NO LIKE '202005%'
     AND EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM MEM_BIR) BETWEEN 30 AND 39
   GROUP BY  A.MEM_ID; 
  
(2020�� 5�� 20�� ȸ������ ���űݾ�)   
  SELECT A.MEM_ID,
         SUM(A.CART_QTY*B.PROD_PRICE)
    FROM SEM.CART A, SEM.PROD B, SEM.MEMBER C
   WHERE A.PROD_ID=B.PROD_ID
     AND A.MEM_ID=C.MEM_ID
     AND A.CART_NO LIKE '202005%'
     AND EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM MEM_BIR) BETWEEN 20 AND 29
   GROUP BY  A.MEM_ID; 
   
(����)
  SELECT TBLB.BMID AS ȸ����ȣ,
         TBLB.BNAME AS ȸ����,
         TBLB.BSUM AS ���űݾ�
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
                                 
                                 
                                 
(60���μ��� ������� �޿�)
SELECT SALARY
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID=60;
 
SELECT EMPLOYEE_ID AS �����ȣ,
       EMP_NAME AS �����, 
       JOB_ID AS ��å�ڵ�, 
       SALARY AS �޿�
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID = 80
   AND SALARY > ANY(SELECT SALARY
                      FROM HR.EMPLOYEES
                     WHERE DEPARTMENT_ID=60);
  
  
  
  SELECT EMPLOYEE_ID AS �����ȣ,
       EMP_NAME AS �����, 
       JOB_ID AS ��å�ڵ�, 
       SALARY AS �޿�
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID = 80
   AND SALARY < ALL(SELECT SALARY
                      FROM HR.EMPLOYEES
                     WHERE DEPARTMENT_ID=100);                  
  
  
  
  
  
  
  
  
  
  
  
  