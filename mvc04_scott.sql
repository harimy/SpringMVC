SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 실습 테이블 생성(지역 : REGION)
CREATE TABLE REGION
( REGIONID      NUMBER          -- 지역 아이디   -- PK
, REGIONNAME    VARCHAR2(30)    -- 지역 명 
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION이(가) 생성되었습니다.

--○ 시퀀스 생성(지역 : REGIONSEQ)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ이(가) 생성되었습니다.

--○ 데이터 입력(지역 데이터 입력)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '서울');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '경기');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '인천');
--==>> 1 행 이(가) 삽입되었습니다.

--○ 데이터 입력(지역 데이터 추가 입력)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '제주');
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT REGIONID, REGIONNAME
FROM REGION;
--==>>
/*
1	서울
2	경기
3	인천
4	제주
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

DROP TABLE POSITION;
--○ 실습 테이블 생성(직위 : POSITION)
CREATE TABLE POSITION
( POSITIONID      NUMBER        -- 직위 아이디   -- PK
, POSITIONNAME  VARCHAR2(30)    -- 직위 명
, MINBASICPAY   NUMBER          -- 최소 기본급
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION이(가) 생성되었습니다.

DROP SEQUENCE POSITIONSEQ;
--○ 시퀀스 생성(직위 : POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQL이(가) 생성되었습니다.

--○ 데이터 입력(직위 데이터 입력)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '사원', 1000000); -- 백만
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '대리', 2000000); -- 이백만 
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '부장', 3000000); -- 삼백만
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '상무', 4000000); -- 사백만
--==>> 1 행 이(가) 삽입되었습니다. * 4


--○ 확인
SELECT POSITIONID, POSITIONNAME, MINBASICPAY
FROM POSITION;
--> 한 줄 구성
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
--==>> 
/*
1	사원	1000000
2	대리	2000000
3	부장	3000000
4	상무	4000000
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 실습 테이블 생성(부서 : DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER          -- 부서 아이디   -- PK
, DEPARTMENTNAME    VARCHAR2(30)    -- 부서 명 
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
); 
--==>> Table DEPARTMENT이(가) 생성되었습니다.

--○ 시퀀스 생성(부서 : DEPARTMENTSEQ)
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ이(가) 생성되었습니다.

--○ 데이터 입력(부서 데이터 입력)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '개발부');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '마케팅부');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '영업부');
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인 
SELECT DEPARTMENTID, DEPARTMENTNAME
FROM DEPARTMENT;
--> 한 줄 구성
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
--==>>
/*
1	개발부
2	마케팅부
3	영업부
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 실습 테이블 생성(직원 : EMPLOYEE)
-- 사원번호, 사원명, 주민번호, 생년월일, 양음력
-- , 전화번호, 부서, 직위, 지역, 기본급, 수당
CREATE TABLE EMPLOYEE
( EMPLOYEEID        NUMBER                  -- 사원번호     -- FK
, NAME              VARCHAR2(30)            -- 사원 명
, SSN               VARCHAR2(20)            -- 주민번호     -- 암호화 기능 적용(TYPE CHECK!)
, BIRTHDAY          DATE                    -- 생년월일
, LUNAR             NUMBER(1) DEFAULT 0     -- 양음력      -- 양력0, 음력1
, TELEPHONE         VARCHAR2(40)            -- 전화번호
, DEPARTMENTID      NUMBER                  -- 부서 아이디
, POSITIONID        NUMBER                  -- 직위 아이디
, REGIONID          NUMBER                  -- 
, BASICPAY          NUMBER
, EXTRAPAY          NUMBER
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEE이(가) 생성되었습니다.

--○ 시퀀스 생성
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ이(가) 생성되었습니다.

--○ 데이터 입력(직원 데이터 입력)
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY )
VALUES ( EMPLOYEESEQ.NEXTVAL, '한혜림', CRYPTPACK.ENCRYPT('9710062234567', '9710062234567')
       , TO_DATE('1997-10-06', 'YYYY-MM-DD'), 0, '010-8755-9495', 1, 1, 1
       , 1500000, 150000);  -- 백오십만, 십오만
--==>> 1 행 이(가) 삽입되었습니다.

--※ 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

--○ 확인
SELECT *
FROM EMPLOYEE;
--==>>
/*
1	한혜림	"��h����.�B"	97/10/06	0	010-8755-9495	1	1	1	1500000	150000
*/

--○ 커밋
COMMIT; 
--==>> 커밋 완료.


--○ 직원 정보 조회 쿼리문 구성
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '양력', 1, '음력') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID
     , (SELECT POSITIONNAME
       FROM POSITION
       WHERE POSITIONID = E.POSITIONID) AS POSITIONNAME
     , E.REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID = E.REGIONID) AS REGIONNAME
     , E.BASICPAY
     , E.EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;

--○ 뷰 생성(EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '양력', 1, '음력') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID
     , (SELECT POSITIONNAME
       FROM POSITION
       WHERE POSITIONID = E.POSITIONID) AS POSITIONNAME
     , E.REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID = E.REGIONID) AS REGIONNAME
     , E.BASICPAY
     , E.EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;
--==>> View EMPLOYEEVIEW이(가) 생성되었습니다.


--○ 지역 데이터 조회 쿼리문 구성(지역 데이터 삭제 가능여부 확인)
SELECT R.REGIONID, R.REGIONNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID = R.REGIONID) AS DELCHECK
FROM REGION R;
--> 한 줄 구성
SELECT R.REGIONID, R.REGIONNAME, (SELECT COUNT(*) FROM EMPLOYEE WHERE REGIONID = R.REGIONID) AS DELCHECK FROM REGION R
;
--==>> 
/*
REGIONID	REGIONNAME	DELCHECK
1	        서울	        1
2	        경기	        0
3	        인천	        0
4	        제주	        0
*/
--> 『서울』 의 지역 데이터는 삭제가 불가능한 상황이며,
--   『경기』, 『인천』 , 『제주』 의 지역 데이터는 삭제가 가능한 상황임을
--   판별할 수 있는 쿼리문

--○ 뷰 생성(REGIONVIEW)
CREATE OR REPLACE VIEW REGIONVIEW
AS
SELECT R.REGIONID, R.REGIONNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID = R.REGIONID) AS DELCHECK
FROM REGION R;
--==>> View REGIONVIEW이(가) 생성되었습니다.


--○ 직위 데이터 조회 쿼리문 구성(직위 데이터 삭제 가능 여부 확인)
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID =  P.POSITIONID) AS DELCHECK
FROM POSITION P;
--> 한 줄 구성
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY, (SELECT COUNT(*) FROM EMPLOYEE WHERE POSITIONID =  P.POSITIONID) AS DELCHECK FROM POSITION P
;
--==>> 
/*
POSITIONID	POSITIONNAME	MINBASICPAY	DELCHECK
1	        사원	            1000000	        1
2	        대리	            2000000	        0
3	        부장	            3000000	        0
4	        상무	            4000000	        0
*/

--○ 뷰 생성(POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID =  P.POSITIONID) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW이(가) 생성되었습니다.


--○ 부서 데이터 조회 쿼리문 구성(부서 데이터 삭제 가능 여부 확인)
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--> 한 줄 구성
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME, (SELECT COUNT(*) FROM EMPLOYEE WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK FROM DEPARTMENT D
;
--==>>
/*
DEPARTMENTID	DEPARTMENTNAME	DELCHECK
1	            개발부	            1
2	            마케팅부	            0
3	            영업부	            0
*/

--○ 뷰 생성(DEPARTMENTVIEW)
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW이(가) 생성되었습니다.


--○ 직위별 최소 기본급 검색 쿼리문 구성
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;     -- 사원
--> 한 줄 구성
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000


--------------------------------------------------------------------------------
--■■■ 로그인 / 로그아웃 과정 추가(변경) ■■■--

-- ID 와 PW 컬럼 데이터를 담고 있는 테이블이 별도로 존재하지 않는 상황이다.
-- 이와 관련하여 EMPLOYEEID(사원 아이디)와 SSN(주민번호) 뒷자리
-- 7자리 숫자를 이용할 수 있도록 구성한다.

--※ 기존 테이블 구조 변경
--①
-- EMPLOYEE(직원 테이블)의 SSN(주민번호) 컬럼을 분리한다.
-- SSN --------------> SSN1, SSN2
-- SSN1 → 주민번호 앞 6자리
-- SSN2 → 주민번호 뒷 7자리 → 암호화 적용

--②
-- EMPLOYEE(직원 테이블)에 GRADE(등급) 컬럼을 추가한다.
-- GRADE → 관리자0, 일반사원1

--○ 컬럼 분할 SSN → SSN1, SSN2
-- 컬럼 추가
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE이(가) 변경되었습니다.-- 컬럼 추가

SELECT *
FROM EMPLOYEE;

UPDATE EMPLOYEE
SET SSN1 = SUBSTR( CRYPTPACK.DECRYPT(SSN, '9710062234567'), 1, 6 )
  , SSN2 = CRYPTPACK.ENCRYPT( SUBSTR( CRYPTPACK.DECRYPT(SSN, '9710062234567'), 7, 7 )
                            , SUBSTR( CRYPTPACK.DECRYPT(SSN, '9710062234567'), 7, 7 ) );
--==>> 1 행 이(가) 업데이트되었습니다.

-- 기존 주민번호 컬럼 제거
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE이(가) 변경되었습니다.

--○ 확인
SELECT *
FROM EMPLOYEE;
--==>> 1	한혜림	1997-10-06	0	010-8755-9495	1	1	1	1500000	150000	971006	Y{��|e

-- 컬럼 추가 → GRADE - 기본값을 1(일반직원)로 구성
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE이(가) 변경되었습니다.

SELECT *
FROM EMPLOYEE;

-- 한혜림 사원을 관리자로 임명
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM EMPLOYEE;

-- 커밋
COMMIT;
--==>> 커밋 완료.

--※ 테이블의 구조를 변경했기 때문에
--  이와 관련한 뷰(VIEW의 내용을 새로 작성(수정)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN1 AS SSN
     , TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '양력', 1, '음력') AS LUNARNAME
     , E.TELEPHONE AS TELEPHONE
     , E.DEPARTMENTID AS DEPARTMENTID
     , (SELECT DEPARTMENTNAME 
        FROM DEPARTMENT
        WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID AS POSITIONID
     , (SELECT POSITIONNAME 
       FROM POSITION
       WHERE POSITIONID = E.POSITIONID) AS POSITIONNAME
     , E.REGIONID AS REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID = E.REGIONID) AS REGIONNAME
     , E.BASICPAY AS BASICPAY
     , E.EXTRAPAY AS EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
     , E.GRADE AS GRADE
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;
--==>> View EMPLOYEEVIEW이(가) 생성되었습니다.

DESC EMPLOYEEVIEW;
--==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEEID     NOT NULL NUMBER       
NAME                    VARCHAR2(30) 
SSN                     CHAR(6)      
BIRTHDAY                VARCHAR2(10) 
LUNAR                   NUMBER(1)    
LUNARNAME               VARCHAR2(6)  
TELEPHONE               VARCHAR2(40) 
DEPARTMENTID            NUMBER       
DEPARTMENTNAME          VARCHAR2(30) 
POSITIONID              NUMBER       
POSITIONNAME            VARCHAR2(30) 
REGIONID                NUMBER       
REGIONNAME              VARCHAR2(30) 
BASICPAY                NUMBER       
EXTRAPAY                NUMBER       
PAY                     NUMBER       
GRADE                   NUMBER(1)    
*/

--○ 직원 데이터 입력 쿼리문 구성(수정된 내용)
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY)
VALUES( EMPLOYEESEQ.NEXTVAL, '박정준', '961031', CRYPTPACK.ENCRYPT('1234567', '1234567')
      , TO_DATE('1996-10-31', 'YYYY-MM-DD'), 0, '010-4020-7429', 1, 1, 1
      , 1500000, 150000);   -- 백오십만, 십오만
--> 한 줄 구성
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY) VALUES( EMPLOYEESEQ.NEXTVAL, '박정준', '961031', CRYPTPACK.ENCRYPT('1234567', '1234567'), TO_DATE('1996-10-31', 'YYYY-MM-DD'), 0, '010-4020-7429', 1, 1, 1, 1500000, 150000)
;
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM EMPLOYEE;
--==>>
/*
1	한혜림	1997-10-06	0	010-8755-9495	1	1	1	1500000	150000	971006	Y{��|e	0
2	박정준	1996-10-31	0	010-4020-7429	1	1	1	1500000	150000	961031	=o��	1
*/

SELECT *
FROM EMPLOYEEVIEW;
--==>> 
/*
1	한혜림	971006	1997-10-06	0	양력	010-8755-9495	1	개발부	1	사원	1	서울	1500000	150000	1650000	0
2	박정준	961031	1996-10-31	0	양력	010-4020-7429	1	개발부	1	사원	1	서울	1500000	150000	1650000	1
*/

-- 커밋
COMMIT;
--==>> 커밋 완료.

--○ 로그인 쿼리문 구성
-- ① 일반 사원 로그인(ID → EMPLOYEEID, PW → SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID='ID문자열'
  AND SSN2=(SELECT SSN2
            FROM EMPLOYEE
            WHERE EMPLOYEEID='ID문자열');
            
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2=(SELECT SSN2
            FROM EMPLOYEE
            WHERE EMPLOYEEID=2);
--==>> 박정준

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234568', '1234568');
--==>> 조회 결과 없음 → 로그인 실패

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234567', '1234567');
--==>> 박정준 → 로그인 성공

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567');
--> 일반 사원 로그인 쿼리문 한 줄 구성 
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=2 AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567')
;

-- ② 관리자 로그인(ID → EMPLOYEEID, PW → SSN2, GRADE=0)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567', '2234567')
  AND GRADE = 0;
--==>> 조회 결과 없음 → 로그인 실패

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567', '2234567')
  AND GRADE = 0;
--> 한 줄 구성
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=1 AND SSN2 = CRYPTPACK.ENCRYPT('2234567', '2234567') AND GRADE = 0
;
--==>> 한혜림 → 로그인 성공

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567', '2234567');
--> 한 줄 구성
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=1 AND SSN2 = CRYPTPACK.ENCRYPT('2234567', '2234567')
;
--==>> 한혜림 → 일반 사원 로그인 성공

--○ 직원 데이터 삭제 쿼리문 구성
DELETE
FROM EMPLOYEE
WHERE EMPLOYEEID=2;
--> 한 줄 구성
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;

--○ 직원 데이터 수정 쿼리문 구성
UPDATE EMPLOYEE
SET NAME='두혜림'
  , BIRTHDAY=TO_DATE('2001-01-01', 'YYYY-MM-DD')
  , LUNAR=1
  , TELEPHONE='010-1111-1111'
  , DEPARTMENTID=2
  , POSITIONID=2
  , REGIONID=2
  , BASICPAY=2200000        -- 이백이십만
  , EXTRAPAY=220000         -- 이십이만
  , SSN1='010101'
  , SSN2=CRYPTPACK.ENCRYPT('4234567', '4234567')
  , GRADE=1
WHERE EMPLOYEEID=1;
--> 한 줄 구성
UPDATE EMPLOYEE SET NAME='두혜림', BIRTHDAY=TO_DATE('2001-01-01', 'YYYY-MM-DD'), LUNAR=1, TELEPHONE='010-1111-1111', DEPARTMENTID=2, POSITIONID=2, REGIONID=2, BASICPAY=2200000, EXTRAPAY=220000, SSN1='010101', SSN2=CRYPTPACK.ENCRYPT('4234567', '4234567'), GRADE=1 WHERE EMPLOYEEID=1
;
--==>> 1 행 이(가) 업데이트되었습니다.

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 뷰(EMPLOYEEVIEW) 조회를 통한 리스트 출력 쿼리문 구성 
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY
     , LUNAR, LUNARNAME, TELEPHONE
     , DEPARTMENTID, DEPARTMENTNAME
     , POSITIONID, POSITIONNAME
     , REGIONID, REGIONNAME
     , BASICPAY, EXTRAPAY, PAY, GRADE
FROM EMPLOYEEVIEW
ORDER BY EMPLOYEEID;
--> 한 줄 구성
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME, TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME, REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY, GRADE FROM EMPLOYEEVIEW ORDER BY EMPLOYEEID
;

--○ 뷰(REGIONVIEW) 조회를 통한 지역 리스트 출력 쿼리문 구성
SELECT REGIONID, REGIONNAME, DELCHECK
FROM REGIONVIEW
ORDER BY REGIONID;
--> 한 줄 구성
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW ORDER BY REGIONID
;

--○ 뷰(DEPARTMENTVIEW) 조회를 통한 부서 리스트 출력 쿼리문 구성
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK
FROM DEPARTMENTVIEW
ORDER BY DEPARTMENTID;
--> 한 줄
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID
;

--○ 뷰(POSITIONVIEW) 조회를 통한 직위 리스트 출력 쿼리문 구성
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK
FROM POSITIONVIEW
ORDER BY POSITIONID;
--> 한 줄 구성 
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;

--○ 직원 아이디를 활용한 직원 검색 쿼리문 구성
SELECT EMPLOYEEID, NAME, SSN1
     , TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY
FROM EMPLOYEE
WHERE EMPLOYEEID = 1;
--> 
SELECT EMPLOYEEID, NAME, SSN1, TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE WHERE EMPLOYEEID = 1
;

--○ 부서 데이터 삭제 쿼리문 구성
DELETE
FROM DEPARTMENT
WHERE DEPARTMENTID=1;
--> 
DELETE FROM DEPARTMENT WHERE DEPARTMENTID=1
;

--○ 부서 데이터 수정 쿼리문 구성
UPDATE DEPARTMENT
SET DEPARTMENTNAME='총무부'
WHERE DEPARTMENTID=1;
--> 
UPDATE DEPARTMENT SET DEPARTMENTNAME='총무부' WHERE DEPARTMENTID=1
;

--○ 롤백
ROLLBACK;

--○ 지역 데이터 삭제 쿼리문 구성
DELETE
FROM REGION
WHERE REGIONID=1;
--> 
DELETE FROM REGION WHERE REGIONID=1
;

--○ 지역 데이터 수정 쿼리문 구성
UPDATE REGION
SET REGIONNAME='부산'
WHERE REGIONID=1;
--> 
UPDATE REGION SET REGIONNAME='부산' WHERE REGIONID=1
;

--○ 직위 데이터 삭제 쿼리문 구성
DELETE
FROM POSITION
WHERE POSITIONID=1;
--> 
DELETE FROM POSITION WHERE POSITIONID=1
;

--○ 직위 데이터 수정 쿼리문 구성
UPDATE POSITION
SET POSITIONNAME='부장'
WHERE POSITIONID=1;

SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 김가영 사원의 양/음력을 음력으로 변경
UPDATE EMPLOYEE
SET LUNAR=1
WHERE EMPLOYEEID=3;
1 행 이(가) 업데이트되었습니다.

COMMIT;
--==>> 커밋 완료.
