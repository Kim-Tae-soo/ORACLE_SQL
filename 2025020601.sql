2025-0206-01) 

CREATE OR REPLACE PROCEDURE proc_update_emp01(
    P_EMP_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE,
    P_EMP_NAME OUT VARCHAR2,
    P_BSAL OUT NUMBER,
    P_ASAL OUT NUMBER)
IS
    L_ASAL NUMBER := 0;
BEGIN
    SELECT EMP_NAME, SALARY, SALARY + ROUND(SALARY * 0.15) 
      INTO P_EMP_NAME, P_BSAL , L_ASAL
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = P_EMP_ID; 
     
    P_ASAL:=L_ASAL;
    
    UPDATE EMPLOYEES
       SET SALARY = L_ASAL
     WHERE EMPLOYEE_ID = P_EMP_ID;  
    COMMIT; 
END;


DECLARE
    L_CNT NUMBER:=0;
    L_ENAME VARCHAR2(100);
    L_BSAL NUMBER:=0;
    L_ASAL NUMBER:=0;
    
    CURSOR CUR_EMP_ID IS
        SELECT EMPLOYEE_ID
          FROM EMPLOYEES
         WHERE COMMISSION_PCT IS NOT NULL; 
BEGIN
    FOR REC IN CUR_EMP_ID LOOP
        L_CNT := L_CNT+ + 1;
        proc_update_emp01(REC.EMPLOYEE_ID, L_ENAME, L_BSAL, L_ASAL);
        DBMS_OUTPUT.PUT_LINE(RPAD(L_ENAME, 30)||' '||TO_CHAR(L_BSAL,'99,999')||
                                            ' '||TO_CHAR(L_ASAL, '99,999'));
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------');                                    
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('전체 처리 건수 : '||L_CNT||'명');
END;






