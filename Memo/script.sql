-- Memo > script.sql

drop table tblMemo;
drop sequence seqMemo;


create table tblMemo(
    seq number primary key,                 --번호(PK)
    name varchar2(30) not null,             --이름
    pw varchar2(30) not null,               --암호(메모)
    memo varchar2(2000) not null,           --메모
    regdate date default sysdate not null   --날짜
);

create sequence seqMemo;

-- 메모 쓰기
insert into tblMemo(seq, name, pw, memo, regdate)
    values(seqMemo.nextVal, '홍길동', '1111', '메모입니다.', default);
    
-- 메모 목록
select * from tblMemo order by seq desc;

-- 메모 읽기
select * from tblMemo where seq = 1;

-- 메모 수정
update tblMemo set memo = '수정 내용' where seq = 1;

-- 메모 삭제
delete from tblMemo where seq =1;

commit;

select * from tblMemo;

select * from tblUser;


-- 고양이 좌표
create table tblCat(
    seq number primary key,         --pk
    catid varchar2(50) not null,    --<img id="cat1">
    x number not null,              --left
    y number not null               --top
);

insert into tblCat values(1, 'cat1', 0, 0);
insert into tblCat values(2, 'cat2', 0, 0);
insert into tblCat values(3, 'cat3', 0, 0);
insert into tblCat values(4, 'cat4', 0, 0);
insert into tblCat values(5, 'cat5', 0, 0);

commit;

select * from tblCat;