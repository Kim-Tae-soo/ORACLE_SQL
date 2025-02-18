ACCEPT P_PERIOD PROMPT '기간입력(YYYYMM) : '
DECLARE
    SDATE DATE:=TO_DATE('&P_PERIOD'||'01');
    EDATE DATE:=LAST_DAY(SDATE);
    L_PNAME PROD.PROD_NAME%TYPE;
    L_SUM_QTY NUMBER:=0;
    L_SUM_AMT NUMBER:=0;
    
    CURSOR CUR_BUYPROD01 IS
        SELECT C.PNAME, C.SQTY, C.SAMT
          FROM (SELECT B.PROD_ID AS PID, A.PROD_NAME AS PNAME, 
                       SUM(B.BUY_QTY) AS SQTY, SUM(B.BUY_QTY*A.PROD_COST) AS SAMT
                  FROM PROD A, BUYPROD B
                 WHERE A.PROD_ID=B.PROD_ID
                   AND B.BUY_DATE BETWEEN SDATE AND EDATE
                 GROUP BY B.PROD_ID, A.PROD_NAME  
                 ORDER BY 4 DESC) C
         WHERE ROWNUM <= 5;        
BEGIN
    OPEN CUR_BUYPROD01;
    LOOP
        FETCH  CUR_BUYPROD01 INTO L_PNAME, L_SUM_QTY, L_SUM_AMT;
            EXIT WHEN CUR_BUYPROD01%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('상품명 : '||L_PNAME);
            DBMS_OUTPUT.PUT_LINE('매입수량 : '||L_SUM_QTY);
            DBMS_OUTPUT.PUT_LINE('매입금액 : '||L_SUM_AMT);
            DBMS_OUTPUT.PUT_LINE('------------------------------------');
        END LOOP;
        CLOSE CUR_BUYPROD01;
END;

