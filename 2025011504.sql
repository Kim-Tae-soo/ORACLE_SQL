SELECT SUM(MEM_MILEAGE) AS "마일리지 합계",
       ROUND(AVG(MEM_MILEAGE), 2) AS "평균 마일리지",
       COUNT(MEM_ID) AS 인원수,
       MAX(MEM_MILEAGE) AS 최대마일리지,
       MIN(MEM_MILEAGE) AS 최소마일리지
  FROM LYS00.MEMBER;

SELECT GREATEST(201, '67', '4'),
       GREATEST('홍길동', '홍길순', '홍길남')
  FROM DUAL;
  
SELECT LEAST(201, '67', '4'),
       LEAST('홍길동', '홍길순', '홍길남')
  FROM DUAL;
  COMMIT;
문제)
회원테이블에서 마일리지가 1000미만인 회원들의 마일리지를 1000으로 부여하시오
Alias 회원번호, 회원명, 원마일리지, 변경마일리지

SELECT MEM_ID AS 회원번호,
       MEM_NAME AS 회원명,
       MEM_MILEAGE AS 원마일리지,
       GREATEST(MEM_MILEAGE , 1000) AS 변경마일리지
  FROM LYS00.MEMBER;
  
사용예) 회원테이블에서 마일리지를 기준으로 등급을 부여하시오
       구간 하한은 1000이고 상한은 8000이며 구간의 갯수는 8개이다.
       Alias 회원번호, 회원명, 마일리지, 등급
       
   SELECT MEM_ID AS 회원번호,
          MEM_NAME AS 회원명, 
          MEM_MILEAGE AS 마일리지, 
          10 - WIDTH_BUCKET(MEM_MILEAGE, 1000, 8000, 8) AS 등급
     FROM LYS00.MEMBER;
     
사용예) 회원테이블에서 마일리지를 기준으로 등급을 부여하시오 등급은 마일리지가 가장 많은
       회원이 1등급에서 차례대로 부여하시오
       구간 하한은 1000이고 상한은 8000이며 구간의 갯수는 8개이다.
       Alias 회원번호, 회원명, 마일리지, 등급
       
   SELECT MEM_ID AS 회원번호,
          MEM_NAME AS 회원명, 
          MEM_MILEAGE AS 마일리지, 
          10 - WIDTH_BUCKET(MEM_MILEAGE, 1000, 8000, 8) AS 등급
     FROM LYS00.MEMBER;
       
사용예) 회원테이블에서 마일리지를 기준으로 등급을 부여하시오
       구간 하한은 1000이고 상한은 8000이며 구간의 갯수는 8개이다.
       등급이 0-3등급 : 시작회원, 4-7 : 평회원, 8등급 이상 : VIP회원
       Alias 회원번호, 회원명, 마일리지, 등급
       
       
   SELECT MEM_ID AS 회원번호,
          MEM_NAME AS 회원명, 
          MEM_MILEAGE AS 마일리지, 
          WIDTH_BUCKET(MEM_MILEAGE, 1000, 8000, 8) AS 등급,
          CASE WHEN WIDTH_BUCKET(MEM_MILEAGE, 1000, 8000, 8) IN (0, 1, 2, 3) THEN '시작회원'
               WHEN WIDTH_BUCKET(MEM_MILEAGE, 1000, 8000, 8) IN (4, 5, 6, 7) THEN '평회원'
               ELSE 'VIP회원'
          END AS 구분
     FROM LYS00.MEMBER;
     
     
     
     
     
     
     
     
     