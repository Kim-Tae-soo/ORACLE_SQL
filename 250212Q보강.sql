CREATE OR REPLACE PROCEDURE proc_update_mileage(
    P_AMT IN NUMBER, P_MID IN MEMBER.MEM_ID%TYPE)
IS
    L_MILEAGE NUMBER:=0;
BEGIN
    IF(P_AMT>=10000000) THEN
        L_MILEAGE:=2000;
    ELSIF(P_AMT>=5000000) THEN
        L_MILEAGE:=1000;
    ELSIF(P_AMT>=1000000) THEN
        L_MILEAGE:=500;
    ELSE
        L_MILEAGE:=0;
    END IF;   
    
    UPDATE MEMBER
       SET MEM_MILEAGE = MEM_MILEAGE + L_MILEAGE
     WHERE MEM_ID=P_MID;
     COMMIT;
END;

���๮���� ������ �۾� : 2020�� ȸ���� ���űݾ��� ����Ͽ� ���ν��� ȣ��

DECLARE
    CURSOR CUR_AMT_2020 IS
        SELECT A.MEM_ID AS AMID, SUM(A.CART_QTY*B.PROD_PRICE) AS ASUM
          FROM LYS00.CART A, LYS00.PROD B
         WHERE A.PROD_ID=B.PROD_ID 
           AND A.CART_NO LIKE '2020%'
         GROUP BY A.MEM_ID;
BEGIN
    FOR REC IN CUR_AMT_2020 LOOP
        proc_update_mileage(REC.ASUM, REC.AMID);
    END LOOP;
END;