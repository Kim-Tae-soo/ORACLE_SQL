20205-0212-01) 함수
 - 반환 값이 있는 모듈
 - SELECT절이나 조건절에 사용할 수 있다
 
CREATE [ OR REPLACE ] FUNCTION 함수명[(
    매개변수명 [ IN | OUT | INOUT ] 타입명,[...])
RETURN 타입명
AS|IS
    선언영역 -- 변수, 상수, 커서
BEGIN
    실행영역 -- 비지니스 로직처리
    RETURN 값|변수;
END;

사용예)
    상품코드를 입력 받아 2020년 5월 매입수량을 반호나하는 함수를 작성
    
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
(실행)
SELECT PROD_ID AS 상품코드,
       PROD_NAME AS 상품명, 
       NVL(fn_amy_buy(PROD_ID), 0)AS "5월 매입수량"
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

(실행)
SELECT MEM_ID AS 회원번호,
       MEM_NAME AS 회원명,
       NVL(fn_sum_cart(MEM_ID,4),0) AS "4월 구매액",
       NVL(fn_sum_cart(MEM_ID,5),0) AS "5월 구매액",
       NVL(fn_sum_cart(MEM_ID,6),0) AS "6월 구매액",
       NVL(fn_sum_cart(MEM_ID,7),0) AS "7월 구매액"
  FROM MEMBER
 WHERE SUBSTR(MEM_REGNO2, 1, 1) IN ('2', '4');

(실행)
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
