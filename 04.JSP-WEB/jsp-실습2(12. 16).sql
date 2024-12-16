-- board 모든 데이터의 갯수 검색
select count(*) from board; 

-- rownum(내장 테이블) : 검색한 결과에 1부터 시작하는 순번 부여;
select id,pass, rownum from member; 

-- board테이블에서 num기준으로 내림차순으로 검색해라
select * from board ORDER by num desc; 

select b.*, rownum rNum From board b;

-- rownum은 결과물에 순번 부여하나 사용시에 rownum을 그대로 사용하는것이 아니라 별칭부여하여 사용
select * from
(SELECT tb.*, rownum rNum from -- 위의 검색된 내용을 rownum으로 번호 부여
    (select * from board ORDER by num desc) tb -- board 테이블에 num기준으로 내림차순
)where rNum BETWEEN 11 and 55;

/*
    한페이당 시작 게시물수 : 10
    시작 게시물 값 : (현재페이지-1)*한페이지당 게시물수 +1
    종료 게시물 값 : 현재페이지 * 한페이지 게시물수
    ex) 페이지당 (1페이지 10개 게시글) 
    1 page
    시작 게시물 값 : (1-1)*10+1 = 1
    종료 게시물값 : 1 * 10 = 10
    2 page
    시작 게시물 값 : (2-1)*10+1 = 11
    종료 게시물값 : 2 * 10 = 10
*/
-- 전체 페이지 계산 => 마지막 페이지 번호
/*
    전체 게시물 수 / 페이지당 게시물 수 
    단 무조건 올림처리 { MATH.CEIL() }
    ex) 104 -> 11 페이징처리해야함
    Math.ceil(105/10) = 11
    반올림,내림 처리하면 4개의 게시물을 볼수 없음
*/