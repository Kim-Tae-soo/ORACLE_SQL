SELECT E.EMPLOYEE_ID AS �����ȣ,
       E.EMP_NAME AS �����,
       E.DEPARTMENT_ID AS �μ���ȣ,
       D.DEPARTMENT_NAME AS �μ���,
       L.STREET_ADDRESS||' '||L.CITY||' '||L.STATE_PROVINCE||' '||C.COUNTRY_NAME AS �ּ�
  FROM HR.EMPLOYEES E
  JOIN HR.DEPARTMENTS D ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
  JOIN HR.LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)
  JOIN HR.COUNTRIES C ON (L.COUNTRY_ID = C.COUNTRY_ID AND C.COUNTRY_ID != 'US')
 ORDER BY 3;
 
 2025-0121-01)      
 SELECT COUNT(*)
   FROM HR.DEPARTMENTS;
SELECT COUNT(*)
  FROM HR.EMPLOYEES;
  
��뿹) ��� �з��� ��ǰ�� ���� ��ȸ�Ͻÿ�
        �з��ڵ�, �з���, ��ǰ�� ��
        
SELECT B.LPROD_GU AS �з��ڵ�,
       B.LPROD_NAME AS �з���,
       COUNT(A.PROD_ID) AS "��ǰ�� ��"
  FROM LYS00.PROD A, LYS00.LPROD B
 WHERE A.LPROD_GU(+) = B.LPROD_GU
 GROUP BY B.LPROD_GU, B.LPROD_NAME
 ORDER BY 1;
 
 SELECT B.LPROD_GU AS �з��ڵ�,
       B.LPROD_NAME AS �з���,
       COUNT(A.PROD_ID) AS "��ǰ�� ��"
  FROM LYS00.PROD A 
 RIGHT JOIN LYS00.LPROD B ON A.LPROD_GU = B.LPROD_GU
 GROUP BY B.LPROD_GU, B.LPROD_NAME
 ORDER BY 1;
  
��뿹)
    2020�� ��� ȸ���� ���űݾ� �հ踦 ���Ͻÿ�
    Alias ȸ����ȣ, ȸ����, ���űݾ��հ�
    
SELECT A.MEM_ID AS ȸ����ȣ,
       A.MEM_NAME AS ȸ����, 
       SUM(C.PROD_PRICE * B.CART_QTY) AS ���űݾ��հ�
  FROM LYS00.MEMBER A
  LEFT JOIN LYS00.CART B ON (A.MEM_ID = B.MEM_ID)
  LEFT JOIN LYS00.PROD C ON (B.PROD_ID = C.PROD_ID AND SUBSTR(B.CART_NO,1, 4) = '2020')
 GROUP BY A.MEM_ID, A.MEM_NAME
 ORDER BY 1;
 
 
SELECT A.MEM_ID AS AMID,
       SUM(A.CART_QTY * PROD_PRICE) AS ���űݾ��հ�
  FROM LYS00.CART A, LYS00.PROD B
 WHERE A.CART_NO LIKE '2020%'
   AND A.PROD_ID = B.PROD_ID
 GROUP BY A.MEM_ID;
 
SELECT M.MEM_ID AS ȸ����ȣ,
       M.MEM_NAME AS ȸ����,
       NVL(C.ASUM, 0) AS ���űݾ��հ�
  FROM LYS00.MEMBER M, 
        (SELECT A.MEM_ID AS AMID,
                SUM(A.CART_QTY * PROD_PRICE) AS ASUM
                FROM LYS00.CART A, LYS00.PROD B
          WHERE A.CART_NO LIKE '2020%'
            AND A.PROD_ID=B.PROD_ID
          GROUP BY A.MEM_ID) C
 WHERE C.AMID(+) = M.MEM_ID;

[[���������̺�]]
���̺�� : REMAIN
-----------------------------------------------------------------------
�÷���         Ÿ��                N.N      DEFAULT             PK/FK
-----------------------------------------------------------------------
REMAIN_YEAR   CHAR(4)                                           PK
PROD_ID       VARCHAR2(10)                                     PK&FK
REMAIN_J_00   NUMBER(5)
REMAIN_I      NUMBER(5)                       0
REMAIN_O      NUMBER(5)                       0
REMAIN_J_99   NUMBER(5)                       0
REMAIN_DATE   DATE                         SYSDATE
-----------------------------------------------------------------------
** REMAIN���̺� �����ڷḦ �Է��Ͻÿ�
    �⵵ : 2020
 ��ǰ�ڵ� : PROD���̺��� ��ǰ�ڵ�
 ������� : PROD���̺��� PROD_PROOERSTOCK �÷���
 ����/���� ������ 0
 ����� : PROD���̺��� PROD_PROOERSTOCK �÷���
    ��¥ : 2020�� 1�� 1��

��뿹)
2020�� ��� ��ǰ�� ���Լ����հ�� ��������հ踦 ��ȸ�Ͻÿ�
INSERT INTO REMAIN (REMAIN_YEAR, PROD_ID, REMAIN_J_00, REMAIN_J_99,REMAIN_DATE)
SELECT '2020' , PROD_ID, PROD_PROPERSTOCK, PROD_PROPERSTOCK, TO_DATE('20200101')
FROM LYS00.PROD;

SELECT * FROM REMAIN;

COMMIT;
  
��뿹) 2020�� 1��-6������ ��� ��ǰ�� ���Լ����հ�� ������� �հ踦 ��ȸ�Ͻÿ�

INSERT INTO REMAIN(REMAIN_J_99, REMAIN_DATE)
SELECT PROD_PROPERSTOCK, TO_DATE('20200101')
FROM LYS00.PROD;

UPDATE REMAIN SET REMAIN_J_99 = SELECT REMAIN_J_00 FROM REMAIN;

DELETE FROM REMAIN;
  
2020�� 6�� - 7�� ����
SELECT A.PROD_ID AS ��ǰ��ȣ,
       SUM(C.CART_QTY) AS ��������հ�
  FROM LYS00.PROD A, LYS00.CART C
 WHERE A.PROD_ID = C.PROD_ID
   AND SUBSTR(C.CART_NO,1, 6) BETWEEN '202006' AND '202007'
 GROUP BY A.PROD_ID
 ORDER BY 1;
 
 ��뿹) 2020�� 6��-7������ ��� ��ǰ�� ���Լ����հ�� ������� �հ踦 ��ȸ�Ͻÿ�
 SELECT A.PROD_ID AS ��ǰ��ȣ,
        NVL(SUM(B.BUY_QTY), 0) AS ���Ը����հ�,
        NVL(SUM(C.CART_QTY), 0) AS ��������հ�
  FROM LYS00.PROD A
  LEFT JOIN LYS00.BUYPROD B ON (A.PROD_ID = B.PROD_ID AND
       B.BUY_DATE BETWEEN TO_DATE('20200601') AND TO_DATE('20200731'))
  LEFT JOIN LYS00.CART C ON (A.PROD_ID = C.PROD_ID AND
       SUBSTR(C.CART_NO,1, 6) BETWEEN '202006' AND '202007')
 GROUP BY A.PROD_ID
 ORDER BY 1;
  
(SUBQUERY)
SELECT ��ǰ��ȣ, ���Լ����հ�, ��������հ�
  FROM LYS00.PROD A,
       (2020�� 6��~7������ ��ǰ�� ���Լ��� �հ� : ��������) B
       (2020�� 6��~7������ ��ǰ�� ��������հ� : ��������) C
 WHERE A.PROD_ID = B.PROD_ID(+)
   AND A.PROD_ID = C.PROD_ID(+)
 ORDER BY 1;
 
2020�� 6��~7������ ��ǰ�� ���Լ��� �հ� : ��������
 SELECT PROD_ID, 
        SUM(BUY_QTY) AS BSUM
   FROM LYS00.BUYPROD
  WHERE BUY_DATE BETWEEN TO_DATE('20200601') AND TO_DATE('20200731')
  GROUP BY PROD_ID;
  
2020�� 6��~7������ ��ǰ�� ��������հ� : ��������
 SELECT PROD_ID, 
        SUM(CART_QTY) AS CSUM
   FROM LYS00.CART
  WHERE SUBSTR(CART_NO,1, 6) BETWEEN '202006' AND '202007'
  GROUP BY PROD_ID;
  
  
SELECT A.PROD_ID AS ��ǰ��ȣ,
       NVL(B.BSUM, 0) AS ���Լ����հ�,
       NVL(C.CSUM, 0) AS ��������հ�
  FROM LYS00.PROD A,
       (SELECT PROD_ID, 
               SUM(BUY_QTY) AS BSUM
          FROM LYS00.BUYPROD
         WHERE BUY_DATE BETWEEN TO_DATE('20200601') AND TO_DATE('20200731')
         GROUP BY PROD_ID) B,
       (SELECT PROD_ID, 
               SUM(CART_QTY) AS CSUM
          FROM LYS00.CART
         WHERE SUBSTR(CART_NO,1, 6) BETWEEN '202006' AND '202007'
         GROUP BY PROD_ID) C
 WHERE A.PROD_ID = B.PROD_ID(+)
   AND A.PROD_ID = C.PROD_ID(+)
 ORDER BY 1;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  