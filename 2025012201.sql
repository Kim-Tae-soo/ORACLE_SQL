SELECT MEM_ID AS ȸ����ȣ,
       MEM_NAME AS ȸ����,
       MEM_MILEAGE AS ���ϸ���
  FROM LYS00.MEMBER
 WHERE MEM_MILEAGE > 
       (SELECT MEM_MILEAGE
          FROM LYS00.MEMBER
         WHERE MEM_ID = 'd001');
         
SELECT B.MEM_ID AS ȸ����ȣ,
       B.MEM_NAME AS ȸ����,
       B.MEM_MILEAGE AS ���ϸ���,
       A.MEM_MILEAGE AS "d001ȸ�����ϸ���"
  FROM LYS00.MEMBER A, LYS00.MEMBER B
 WHERE A.MEM_ID='d001'
   AND A.MEM_MILEAGE < B.MEM_MILEAGE;
   
   SELECT MEM_ID AS ȸ����ȣ,
       MEM_NAME AS ȸ����,
       MEM_MILEAGE AS ���ϸ���
  FROM LYS00.MEMBER
 WHERE MEM_MILEAGE > 
       (SELECT MEM_MILEAGE
          FROM LYS00.MEMBER
         WHERE MEM_ID = 'd001');
         
SELECT A.EMPLOYEE_ID AS �����ȣ,
       A.EMP_NAME AS �����,
       B.DEPARTMENT_NAME AS �μ���,
       A.HIRE_DATE AS �Ի���
  FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
 WHERE A.HIRE_DATE <
       (SELECT MIN(HIRE_DATE)
          FROM HR.EMPLOYEES
         WHERE DEPARTMENT_ID = '50')
   AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
 ORDER BY A.HIRE_DATE;


SELECT MIN(HIRE_DATE)
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID = '50';
         
         
SELECT BUYER_ID AS �ŷ�ó�ڵ�,
       BUYER_NAME AS �ŷ�ó��,
       BUYER_ADD1 || ' ' || BUYER_ADD2 AS �ּ�
  FROM LYS00.BUYER
 WHERE SUBSTR(BUYER_ADD1, 1, 2) =
       (SELECT SUBSTR(BUYER_ADD1, 1, 2)
          FROM LYS00.BUYER
         WHERE BUYER_NAME = '������');
         

SELECT B.BUYER_ID AS �ŷ�ó�ڵ�,
       B.BUYER_NAME AS �ŷ�ó��,
       B.BUYER_ADD1 || ' ' || B.BUYER_ADD2 AS �ּ�
  FROM LYS00.BUYER A, LYS00.BUYER B
 WHERE SUBSTR(A.BUYER_ADD1, 1, 2) = SUBSTR(B.BUYER_ADD1, 1, 2)
   AND A.BUYER_NAME = '������'
   AND B.BUYER_NAME != '������';


SELECT SUBSTR(BUYER_ADD1, 1, 2)
  FROM LYS00.BUYER
 WHERE BUYER_NAME = '������';
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         