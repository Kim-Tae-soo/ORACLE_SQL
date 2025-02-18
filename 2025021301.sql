CREATE OR REPLACE FUNCTION fn_create_cart_no(
    P_DATE IN DATE,
    P_MID IN MEMBER.MEM_ID%TYPE)
    RETURN CHAR
IS
    L_CART_NO CART.CART_NO%TYPE;
    L_CNT NUMBER:= 0; -- 해당일에 CART에 존재하는 레코드 수
    L_DATE CHAR(8):=TO_CHAR(P_DATE, 'YYYYMMDD');
    L_MID MEMBER.MEM_ID%TYPE;
BEGIN
    SELECT COUNT(*) INTO L_CNT
      FROM CART
     WHERE CART_NO LIKE L_DATE||'%';

    IF L_CNT=0 THEN
       L_CART_NO:=L_DATE||TRIM('00001');
    ELSE
        SELECT DISTINCT MAX(CART_NO) INTO L_CART_NO
          FROM CART
         WHERE CART_NO LIKE L_DATE||'%';
         
         SELECT DISTINCT MEM_ID INTO L_MID
           FROM CART
          WHERE CART_NO = L_CART_NO;
        
        IF L_MID != P_MID THEN
            L_CART_NO := L_CART_NO + 1;   
        END IF;    
    END IF;
    RETURN L_CART_NO;
END;


(실행)
SELECT fn_create_cart_no('2020/07/08','c001') FROM DUAL;

INSERT INTO CART VALUES('c001', fn_create_cart_no('2020/07/08', 'c001'),
                    'P302000003', 5);
INSERT INTO CART VALUES('b001', fn_create_cart_no('2020/07/08', 'b001'),
                    'P101000003', 1);
INSERT INTO CART VALUES('c001', fn_create_cart_no('2020/07/08', 'c001'),
                    'P201000009', 2);
COMMIT;
ROLLBACK;
SELECT * FROM CART
WHERE CART_NO LIKE '20200708%';

DELETE FROM CART WHERE CART_NO='2020070800003';

