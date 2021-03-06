-- 超级会员管理项目 --

-- 会员表信息表 --

CREATE TABLE memberInfo
(
     userId   Number(11)      primary key,
     nickName varchar2(10)    default null,
     trueName varchar2(10)   default null,
     gender   varchar2(4)     default null,
     major    varchar2(10)    default null,
     course   varchar2(100)   default null,
     hobby    varchar2(20)    default null,
     remarks  varchar(500)    default null
)

--为 memberInfo表 生成唯一序列--

CREATE SEQUENCE memberInfo_seq
       START WITH   1
       INCREMENT BY 1
       MINVALUE     1
       MAXVALUE   100000
       NOCYCLE   
       CACHE 10
       
-- 为memberInfo表 生成触发器

CREATE TRIGGER memberInfo_triger
       before insert on memberInfo
       for each row
         begin
           select memberInfo_seq.nextval into :new.userId from dual;
         end;
       
       
       
