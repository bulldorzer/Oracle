-- 루트 계정 설정 system계정

--데이터 삽입하기전에 테이블 스페이스(공간)부터 설정해야함

--테이블 스페이스 가용기간 얼마인지 확인
select tablespace_name, status, contents from dba_tablespaces;

--테이블 스페이스 가용 공간(전체합계, 최대값) 얼마인지 확인
select tablespace_name, sum(bytes), max(bytes) from dba_free_space GROUP by tablespace_name;

-- 내가 생성한 mushhave계정이 dba_user라는 테이블에서 얼마나 차지하고 있는지를 정보 조회
-- musthave 계정이 값을 가지고 있는 행중에서 어느 테이블스페이스에 속해있는지 정보를 조회
select username,default_tablespace from dba_users where username in upper('musthave');

-- musthave 계정에 users테이블 스페이스에 데이터를 입력할 수 있도록 5mb의 용량을 할당하겟다.
alter user musthave quota 5m on users;

commit;

