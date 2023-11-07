
-- ToyProject > dml.sql

-- ?šŒ?›
insert into tblUser (id, pw, name, email, lv, pic, intro, ing)
    values ('hong', '1111', '?™ê¸¸ë™', 'hong@gmail.com'
        , '1', default,  '?ë°”ë?? ê³µë??•˜?Š” ?•™?ƒ?…?‹ˆ?‹¤.', default);
        
select * from tblUser;

update tblUser set ing = 'y';

commit;



insert into tblBoard (seq, subject, content, regdate, readcount, id)
    values (seqBoard.nextVal, 'ê²Œì‹œ?Œ?…?‹ˆ?‹¤.', '?‚´?š©?…?‹ˆ?‹¤.', default, default, 'hong');

select * from tblBoard;

delete from tblBoard where seq in (2, 3);

commit;


select * from vwBoard;

update tblBoard set regdate = regdate - 1 where seq <= 6;

commit;


select * from tblUser;

select * from tblMarker;

select * from tblPlace;