-- 超级会员管理项目 --

-- 会员表 -- //SID 自动生成

CREATE TABLE members
(
       userid        NUMBER(10) PRIMARY KEY,
       userName      VARCHAR2(10) NOT NULL UNIQUE,
       userpasswd  VARCHAR(20) NOT NULL
       
)

--生成序列

CREATE SEQUENCE members_seq
       START WITH     1
       INCREMENT BY   1
       MINVALUE       1
       MAXVALUE     100000
       NOCYCLE
       CACHE        10
       
--触发器

CREATE TRIGGER members_trigger
       BEFORE INSERT ON members
       FOR EACH ROW
       BEGIN
           SELECT members_seq.nextval INTO :new.userid FROM dual;
       END;
       
--用户违反唯一约束多次创建信息时，会占用自动生成的序列号（我觉得这个可能存在安全隐患）
