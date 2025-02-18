20205-0212-01) �Լ�
 - ��ȯ ���� �ִ� ���
 - SELECT���̳� �������� ����� �� �ִ�
 
CREATE [ OR REPLACE ] FUNCTION �Լ���[(
    �Ű������� [ IN | OUT | INOUT ] Ÿ�Ը�,[...])
RETURN Ÿ�Ը�
AS|IS
    ���𿵿� -- ����, ���, Ŀ��
BEGIN
    ���࿵�� -- �����Ͻ� ����ó��
    RETURN ��|����;
END;

��뿹)
    ��ǰ�ڵ带 �Է� �޾� 2020�� 5�� ���Լ����� ��ȣ���ϴ� �Լ��� �ۼ�
    
CREATE OR REPLACE FUNCTION fn_amy_buy(
    P_PROD_ID IN PROD.PROD_ID%TYPE)
    RETURN NUMBER
IS
    L_AMT NUMBER:=0;
BEGIN
    SELECT SUM(BUY_QTY) INTO L_AMT
      FROM BUYPROD
     WHERE BUY_DATE BETWEEN TO_DATE('20200501') AND TO_DATE('20200531')
       AND PROD_ID=P_PROD_ID; 
    RETURN L_AMT;   
END;
(����)
SELECT PROD_ID AS ��ǰ�ڵ�,
       PROD_NAME AS ��ǰ��, 
       NVL(fn_amy_buy(PROD_ID), 0)AS "5�� ���Լ���"
  FROM PROD;


CREATE OR REPLACE FUNCTION fn_sum_cart(
    P_MEM_ID IN MEMBER.MEM_ID%TYPE,
    P_MONTH IN NUMBER)
    RETURN NUMBER
IS
    L_AMT NUMBER:=0;
    L_MONTH CHAR(7):='2020'||TRIM(TO_CHAR(P_MONTH,'00'))||'%';
BEGIN
    SELECT SUM(CART_QTY*PROD_PRICE) INTO L_AMT
      FROM CART A, PROD B
     WHERE A.PROD_ID=B.PROD_ID
       AND A.MEM_ID=P_MEM_ID
       AND A.CART_NO LIKE L_MONTH;
    RETURN L_AMT;
END;

(����)
SELECT MEM_ID AS ȸ����ȣ,
       MEM_NAME AS ȸ����,
       NVL(fn_sum_cart(MEM_ID,4),0) AS "4�� ���ž�",
       NVL(fn_sum_cart(MEM_ID,5),0) AS "5�� ���ž�",
       NVL(fn_sum_cart(MEM_ID,6),0) AS "6�� ���ž�",
       NVL(fn_sum_cart(MEM_ID,7),0) AS "7�� ���ž�"
  FROM MEMBER
 WHERE SUBSTR(MEM_REGNO2, 1, 1) IN ('2', '4');

(����)
DECLARE
    CURSOR CUR_MEMBER_01 IS
        SELECT MEM_ID, MEM_NAME
          FROM MEMBER
         WHERE SUBSTR(MEM_REGNO2, 1, 1) IN ('2', '4');
BEGIN
    FOR REC IN CUR_MEMBER_01 LOOP
        DBMS_OUTPUT.PUT(REC.MEM_ID||' '||REC.MEM_NAME);
        FOR I IN 4..7 LOOP
            DBMS_OUTPUT.PUT(TO_CHAR(NVL(fn_sum_cart(REC.MEM_ID, I), 0),'999,999,999'));
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
END;
