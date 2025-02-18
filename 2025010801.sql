2025-0108-01) 날짜데이터 타입
사용예)  키보드로 날짜를 입력 받아 요일을 출력하는 쿼리 작성

ACCEPT P_DATE PROMPT '날짜 입력(YYYYMMDD) : '
DECLARE
    L_DATE DATE:=TO_DATE('&P_DATE');
    L_REMAINDER NUMBER:=0;
    L_AMT_DAYS NUMBER:=0;
    L_RESULT VARCHAR2(200);
BEGIN
    L_AMT_DAYS:=L_DATE-TO_DATE('00010101');
    L_REMAINDER:=MOD(L_AMT_DAYS-1,7);
    CASE L_REMAINDER 
        WHEN 0 THEN L_RESULT:=L_DATE||'는 일요일입니다.';
        WHEN 1 THEN L_RESULT:=L_DATE||'는 월요일입니다.';
        WHEN 2 THEN L_RESULT:=L_DATE||'는 화요일입니다.';
        WHEN 3 THEN L_RESULT:=L_DATE||'는 수요일입니다.';
        WHEN 4 THEN L_RESULT:=L_DATE||'는 목요일입니다.';
        WHEN 5 THEN L_RESULT:=L_DATE||'는 금요일입니다.';
        ELSE L_RESULT:=L_DATE||'는 토요일입니다.';
    END CASE;
    DBMS_OUTPUT.PUT_LINE(L_RESULT);
    DBMS_OUTPUT.PUT_LINE(L_AMT_DAYS);
    DBMS_OUTPUT.PUT_LINE(L_REMAINDER);
END;    
        
    