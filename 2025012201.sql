SELECT MEM_ID AS 회원번호,
       MEM_NAME AS 회원명,
       MEM_MILEAGE AS 마일리지
  FROM LYS00.MEMBER
 WHERE MEM_MILEAGE > 
       (SELECT MEM_MILEAGE
          FROM LYS00.MEMBER
         WHERE MEM_ID = 'd001');
         
SELECT B.MEM_ID AS 회원번호,
       B.MEM_NAME AS 회원명,
       B.MEM_MILEAGE AS 마일리지,
       A.MEM_MILEAGE AS "d001회원마일리지"
  FROM LYS00.MEMBER A, LYS00.MEMBER B
 WHERE A.MEM_ID='d001'
   AND A.MEM_MILEAGE < B.MEM_MILEAGE;
   
   SELECT MEM_ID AS 회원번호,
       MEM_NAME AS 회원명,
       MEM_MILEAGE AS 마일리지
  FROM LYS00.MEMBER
 WHERE MEM_MILEAGE > 
       (SELECT MEM_MILEAGE
          FROM LYS00.MEMBER
         WHERE MEM_ID = 'd001');
         
SELECT A.EMPLOYEE_ID AS 사원번호,
       A.EMP_NAME AS 사원명,
       B.DEPARTMENT_NAME AS 부서명,
       A.HIRE_DATE AS 입사일
  FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
 WHERE A.HIRE_DATE <
       (SELECT MIN(HIRE_DATE)
          FROM HR.EMPLOYEES
         WHERE DEPARTMENT_ID = '50')
   AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
 ORDER BY A.HIRE_DATE;


SELECT MIN(HIRE_DATE)
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID = '50';
         
         
SELECT BUYER_ID AS 거래처코드,
       BUYER_NAME AS 거래처명,
       BUYER_ADD1 || ' ' || BUYER_ADD2 AS 주소
  FROM LYS00.BUYER
 WHERE SUBSTR(BUYER_ADD1, 1, 2) =
       (SELECT SUBSTR(BUYER_ADD1, 1, 2)
          FROM LYS00.BUYER
         WHERE BUYER_NAME = '마르죠');
         

SELECT B.BUYER_ID AS 거래처코드,
       B.BUYER_NAME AS 거래처명,
       B.BUYER_ADD1 || ' ' || B.BUYER_ADD2 AS 주소
  FROM LYS00.BUYER A, LYS00.BUYER B
 WHERE SUBSTR(A.BUYER_ADD1, 1, 2) = SUBSTR(B.BUYER_ADD1, 1, 2)
   AND A.BUYER_NAME = '마르죠'
   AND B.BUYER_NAME != '마르죠';


SELECT SUBSTR(BUYER_ADD1, 1, 2)
  FROM LYS00.BUYER
 WHERE BUYER_NAME = '마르죠';
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         