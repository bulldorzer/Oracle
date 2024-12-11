--user계정권한

-- member table 생성
CREATE TABLE member (
    id VARCHAR2(10) not null,
    pass varchar2(10) not null,
    name varchar(30) not null,
    regidate date DEFAULT sysdate not null -- 데이터 생성시 시스템 날짜로 등록
);

-- board table 생성
create table board (
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcount number(6)
);

-- 누락된 primary key 추가
alter table member add CONSTRAINT member_id_pk primary key (id);

--관계설정
--member 와 board 테이블에 연결하는 foreign key 이다
alter table board add constraint board_mem_fk foreign key (id) 
references member (id);

create SEQUENCE seq_board_num
    INCREMENT by 1
    start with 1
    minvalue 1
    nomaxvalue -- 최대값 무한대
    nocycle -- 순환하지않음
    nocache; -- 캐쉬 안함
    
    
-- 테이블 가짜 데이터 추가
insert into member (id, pass, name) values ('musthave', '1234', '머스트해브');


insert into board (num, title, content, id, postdate, visitcount)
values(seq_board_num.nextval,'제목','내용1','musthave',sysdate,0);    

commit;
-- 데이터를 추가하면 오라클은 임시테이블저장
-- 임시테이블에 있는 내용을 최종적으로 적용(apply)

select * from member;
select * from board;
select autocommit;
