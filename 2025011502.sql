��뿹) HR������ ��� ������� �Ի����� 5�� �ڷ� �����Ͻÿ�

CREATE OR REPLACE VIEW V_EMP AS
    SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE
      FROM HR.EMPLOYEES
      WITH READ ONLY;
      
UPDATE EMPLOYEES
   SET HIRE_DATE = ADD_MONTHS(HIRE_DATE, 24);

COMMIT;

SELECT A.EMPLOYEE_ID, A.EMP_NAME, A.HIRE_DATE, B.HIRE_DATE
  FROM EMPLOYEES A, V_EMP B
 WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID;
 
 SELECT * FROM EMPLOYEES
 AS OF TIMESTAMP TO_TIMESTAMP('2025/01/15 15:30:00 ', 'YYYY/MM/DD HH24:MI:SS');
 
 SELECT NEXT_DAY(SYSDATE, '�����') FROM DUAL;
 
 ��뿹) ��ٱ������̺��� 2020�� 2�� ��ǰ�� ���������� ��ȸ�Ͻÿ�
        Alias�� ��ǰ��ȣ, ��ǰ��, ���Լ���, ���Դܰ�, ���Աݾ�
        
SELECT A.PROD_ID AS ��ǰ��ȣ, 
       B.PROD_NAME AS ��ǰ��, 
       SUM(A.BUY_QTY) AS ���Լ���, 
       SUM(B.PROD_COST * A.BUY_QTY) AS ���Աݾ�
  FROM LYS00.BUYPROD A, LYS00.PROD B
 WHERE A.PROD_ID = B.PROD_ID
   AND A.BUY_DATE BETWEEN TO_DATE('20200201') AND LAST_DAY(TO_DATE('20200201'))
 GROUP BY A.PROD_ID, B.PROD_NAME;
 
 ��뿹) ��ٱ��� ���̺��� 2020�� 5���� 7���� �Ǹŵ� ������ ����Ͻÿ�
    (����, ��ǰ��ȣ, �����̸� ��¥������ ����� ��)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 