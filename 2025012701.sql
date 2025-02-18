2025-0127-01)

SELECT * FROM LYS00.REMAIN;

사용예) 회원테이블에서 마일리지가 4000이상인 회원들의 회원번호, 회원명, 마일리지로 뷰를 생성하시오
CREATE OR REPLACE VIEW VIEW_VIP AS
    SELECT MEM_ID AS 회원번호, 
           MEM_NAME AS 회원명,
           MEM_MILEAGE AS 마일리지
      FROM LYS00.MEMBER
     WHERE MEM_MILEAGE >= 4000; 
     
SELECT * FROM VIEW_VIP;

UPDATE VIEW_VIP 
   SET MILEAGE = 3000
 WHERE MID = 'v001';
 
사용예) MEMBER테이블에서 'v001'회원의 마일리지를 6300으로 변경하시오
UPDATE LYS00.MEMBER 
   SET MEM_MILEAGE = 6300
 WHERE MEM_ID = 'v001';
 
 사용예) MEMBER테이블에서 'a002'회원으로 '홍길동'회원을 입력하시오
        회원번호 : 'a002'
        회원명 : '홍길동'
        비밀번호 : '12345'
        마일리지 : 9500
        
INSERT INTO LYS00.MEMBER (MEM_ID, MEM_NAME, MEM_PASSWORD, MEM_MILEAGE)
VALUES ('a002', '홍길동', '12345', 9500);
 
 사용예) MEMBER테이블에서 'n001'회원을 삭제하시오
 DELETE FROM MEMBER
  WHERE MEM_ID = 'n001';
 
 ROLLBACK;
 
CREATE OR REPLACE VIEW VIEW_VIP AS
   SELECT MEM_ID, MEM_NAME, MEM_MILEAGE, MEM_PASSWORD
     FROM LYS00.MEMBER
    WHERE MEM_MILEAGE >= 4000
    WITH CHECK OPTION
    WITH READ ONLY;
     -- 읽기 전용으로 DML명령어를 사용할 수 없다
      
SELECT * FROM VIEW_VIP; 

INSERT INTO VIEW_VIP VALUES ('a004', '이순신', 4000, '8888');

DELETE FROM MEMBER
 WHERE MEM_ID = 'a003';
 
 
CREATE OR REPLACE VIEW VIEW_VIP AS
   SELECT MEM_ID, MEM_NAME, MEM_MILEAGE, MEM_PASSWORD
     FROM LYS00.MEMBER
    WHERE MEM_MILEAGE >= 4000
    WITH CHECK OPTION;
    
사용예)뷰(VIEW_VIP)에서 홍길동회원(a002)의 마일리지를 1500으로 변경하시오

UPDATE VIEW_VIP SET MEM_MILEAGE = 1500
 WHERE MEM_ID = 'a002';
 
사용예)뷰(VIEW_VIP)에서 탁원재회원(n001)의 마일리지를 5700에서 6000으로으로 변경하시오
UPDATE VIEW_VIP SET MEM_MILEAGE = 6000
 WHERE MEM_ID = 'n001';



DROP VIEW VIEW_VIP;







