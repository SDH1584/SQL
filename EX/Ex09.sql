--webdb 계정에 book table 만들기
create table book (
    book_id  number,
    title    varchar2(50),
    author   varchar2(10),
    pub_date date
);
      
--      book table에 pubs 칼럼 추가하기
alter table book add (
    pubs varchar2(50)
); 

--book table에 컬럼속성변경하기

alter table book modify (
    title varchar2(100)
);

alter table book rename column title to subject;

--컬럼삭제
alter table book drop ( author );

--table 명 변경하기
rename book to article;


--테이블삭제
drop table article;


--author table 만들기
create table author(
                author_id  number ,
                    author_name varchar(100)  not null,
                    author_desc varchar2(500),
                    primary key ( author_id )
                    
                    );
                    
select * from author;      

select * from all_tables;

--book table .만들기
create table book(
                    book_id number(10),
                    title varchar2(100) not null,
                    pubs varchar2(100),
                    pub_date date,
                    author_id number(10),
                    primary key (book_id),
                    CONSTRAINT book_fk FOREIGN KEY (author_id)
                    REFERENCES author(author_id)
                    
                    );
                    
--작가 (author) 테이블에 데이터  추가 insert                    
insert into author
values (1,'박경리','토지 작가'
        );
        
insert into author(author_id, author_name, author_desc)
    values(2,'이문열','삼국지등등작가');
     
insert into author(author_id, author_name)
    values(3,'이문열');

DELETE  FROM AUTHOR
where author_id=3;
     
insert into author(author_id, author_name , author_desc)
    values(3,'기안84','웹툰작가');
                      
                      
                      
update author
set author_name='김경리',
    author_desc='토1지작가'
where author_id=1
;                      

update author
set author_name='김경리',
    author_desc='토1지작가';

delete from author;

--sequence 시퀀스 번호표
create sequence seq_author_id
increment by 1
START with 1
nocache;

insert into author
values(seq_author_id.nextval,'박경ㄹ','토지직가')
 ;

insert into author
values(seq_author_id.nextval,'이뮨욜','삼국직가')
;

SELECT *FROM USER_SEQUENCES ;

select seq_author_id.currval
from dual;

DROP SEQUENCE seq_author_id;

 select * from author;
                    select *from book; 
                    
                    
                    
--
SELECT *FROM USER_SEQUENCES ;
drop sequence seq_author_id;

drop table author;
drop table book;
delete from book;

selectr *from author;



