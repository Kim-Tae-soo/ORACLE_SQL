DECLARE
    L_PI CONSTANT NUMBER:= 3.1415926;
    L_HIGHT NUMBER:= 10;
    L_WIDTH NUMBER:= 25.5;
    L_AREA NUMBER:= 0;
    L_RADIUS NUMBER:= 18.5;
BEGIN
    -- 원의 넓이
    L_AREA:=L_RADIUS*L_RADIUS*L_PI;
    DBMS_OUTPUT.PUT('원의 넓이 = '||L_AREA);
    DBMS_OUTPUT.PUT('사각형의 넓이 = '||L_HIGHT*L_WIDTH);
    DBMS_OUTPUT.PUT_LINE(' ');
END;

DECLARE
    v_num NUMBER := 37;
BEGIN
    DBMS_OUTPUT.ENABLE;

    IF MOD(v_num, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num || '는 짝수');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num || '는 홀수');
    END IF;
END;

ACCEPT W_AMT PROMPT '수도사용량(ton) : '
DECLARE
    L_WATER1 NUMBER:=0; --상수도요금
    L_WATER2 NUMBER:=0; --하수도요금
    L_WTOTAL NUMBER:=0; --납부액
BEGIN
    CASE WHEN (&W_AMT) <= 10 THEN
              L_WATER1:=350*(&W_AMT);
              L_WATER2:=500*(&W_AMT);
         WHEN (&W_AMT) <= 20 THEN
              L_WATER1:=(350*10)+(550*(&W_AMT-10));
              L_WATER2:=500*(&W_AMT);
         WHEN (&W_AMT) <= 30 THEN
              L_WATER1:=(350*10)+(550*10)+(850*(&W_AMT-20));
              L_WATER2:=500*(&W_AMT);
         WHEN (&W_AMT) <= 40 THEN
              L_WATER1:=(350*10)+(550*10)+(850*10)+(1400*(&W_AMT-30));
              L_WATER2:=500*(&W_AMT);
         ELSE 
              L_WATER1:=(350*10)+(550*10)+(850*10)+(1400*10)+(2300*(&W_AMT-40));
              L_WATER2:=500*(&W_AMT);
     END CASE;
     L_WTOTAL:=L_WATER1+L_WATER2;
     DBMS_OUTPUT.PUT_LINE('납부금액은 : '||L_WTOTAL);
END;

DECLARE
    L_CNT NUMBER:=1;
    L_EVEN NUMBER:=0;
    L_ODD NUMBER:=0;
BEGIN
    LOOP
        IF MOD(L_CNT, 2) = 0 THEN
            L_EVEN:=L_EVEN+L_CNT;
        ELSE
            L_ODD:=L_ODD+L_CNT;
        END IF;
        EXIT WHEN L_CNT >= 100;
        L_CNT:= L_CNT + 1;
     END LOOP;
     DBMS_OUTPUT.PUT_LINE('홀수의 합 : '||L_ODD);
     DBMS_OUTPUT.PUT_LINE('짝수의 합 : '||L_EVEN);
END;





