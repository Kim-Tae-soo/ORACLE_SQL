SELECT EMPLOYEE_ID AS �����ȣ,
       EMP_NAME AS �����,
       DEPARTMENT_ID AS �μ��ڵ�,
       SALARY AS �⺻��,
       NVL(ROUND(SALARY * COMMISSION_PCT), 0) AS ���ʽ�,
       SALARY + NVL(ROUND(SALARY * COMMISSION_PCT), 0) AS ���޾�
  FROM HR.EMPLOYEES
 ORDER BY 3;
 
 
 SELECT BUY_DATE AS ���Գ�¥,
       PROD_ID AS ��ǰ��ȣ,
       BUY_QTY AS ���Լ���
  FROM LYS00.BUYPROD
 WHERE BUY_DATE >= TO_DATE('20200601') AND BUY_DATE <= TO_DATE('20200630')
 ORDER BY 1;
 
 SELECT * FROM LYS00.MEMBER
  WHERE MEM_ID NOT IN 
    (SELECT DISTINCT MEM_ID
       FROM LYS00.CART);
       
SELECT DISTINCT (TRUNC((EXTRACT (YEAR FROM SYSDATE) - EXTRACT(YEAR FROM MEM_BIR))/10))
FROM LYS00.MEMBER;

SELECT MEM_ID AS ȸ����ȣ,
			 MEM_NAME AS ȸ����,
			 MEM_ADD1 || ' ' || MEM_ADD2 AS �ּ�
	FROM LYS00.MEMBER
 WHERE MEM_ADD1 LIKE '����%';

--SELECT PROD_ID AS ��ǰ��ȣ,
--       PROD_NAME AS ��ǰ��,
--       PROD_PRICE AS �ǸŰ���
--  FROM LYS00.PROD
-- WHERE PROD_PRICE >= 1000000
-- ORDER BY 3 DESC;
-- 
-- 
--SELECT MEM_ID AS ȸ����ȣ,
--       MEM_NAME AS ȸ����,
--       MEM_JOB AS ����,
--       MEM_MILEAGE AS ���ϸ���
--  FROM LYS00.MEMBER
-- WHERE MEM_MILEAGE < 2000
-- ORDER BY 4;
-- 
--SELECT MEM_ID AS �ּ�,
--       MEM_NAME AS ȸ����,
--       MEM_ADD1 || ' ' || MEM_ADD2 AS �ּ�
--  FROM LYS00.MEMBER
-- WHERE MEM_ADD1 LIKE '����%';

ACCEPT P_YEAR PROMPT '�⵵ �Է�(YYYY) : '
DECLARE
    L_YEAR NUMBER := &P_YEAR;
    L_RES VARCHAR2(100);
BEGIN
    IF(MOD(L_YEAR,4)=0 AND MOD(L_YEAR,100)!=0) OR (MOD(L_YEAR,400)=0) THEN
        L_RES:=L_YEAR||'���� �����Դϴ�.';
    ELSE
        L_RES:=L_YEAR||'���� ����Դϴ�.';
    END IF;
    DBMS_OUTPUT.PUT_LINE(L_RES);
END;


SELECT EMPLOYEE_ID AS �����ȣ,
       EMP_NAME AS �����, 
       DEPARTMENT_ID AS �μ���ȣ, 
       HIRE_DATE AS �Ի���
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID BETWEEN 10 AND 40
 ORDER BY 3, 4;

SELECT EMPLOYEE_ID, EMP_NAME
  FROM HR.EMPLOYEES
 WHERE EMP_NAME LIKE '_l%';

SELECT SUBSTR(CART_NO,1, 8) AS ��¥,
       PROD_ID AS ��ǰ�ڵ�,
       MEM_ID AS ����ȸ����ȣ, 
       CART_QTY AS ����
  FROM LYS00.CART
 WHERE CART_NO LIKE '202006%';
 
SELECT BUY_DATE AS ���Գ�¥,
       PROD_ID AS ��ǰ��ȣ,
       BUY_QTY AS ���Լ���
  FROM LYS00.BUYPROD
 WHERE BUY_DATE BETWEEN TO_DATE('2020/06/01') AND TO_DATE('2020/06/30');

SELECT EMPLOYEE_ID AS �����ȣ, 
       EMP_NAME AS �����, 
       JOB_ID AS �����ڵ�, 
       DEPARTMENT_ID AS �μ��ڵ�,
       SALARY AS �޿�
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID IN (20, 70, 90);
 
SELECT MEM_ID AS ȸ����ȣ,
       MEM_NAME AS ȸ����,
       MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ,
       CASE WHEN SUBSTR(MEM_REGNO2,1,1)='2' 
              OR SUBSTR(MEM_REGNO2,1,1)='4' THEN
	          '����'
       ELSE '����' END AS ����
  FROM LYS00.MEMBER
  
SELECT MEM_ID AS ȸ����ȣ,
   MEM_NAME AS ȸ����,
   MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ,
   CASE WHEN SUBSTR(MEM_REGNO2,1,1) IN (2,4) THEN
          '����'
   ELSE '����' END AS ����
FROM LYS00.MEMBER

SELECT MEM_ID AS ȸ����ȣ,
       MEM_NAME AS ȸ����,
       MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ,
       CASE SUBSTR(MEM_REGNO2,1,1)
           WHEN '2' THEN '����'
           WHEN '4' THEN '����'
       ELSE '����' END AS ����
  FROM LYS00.MEMBER
  
  SELECT MEM_ID AS ȸ����ȣ,
         MEM_NAME AS ȸ����,
         MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ,
         DECODE(SUBSTR(MEM_REGNO2,1, 1), '2', '����', '4', '����', '����') 
         AS ����
  FROM LYS00.MEMBER