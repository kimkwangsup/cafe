CREATE TABLE reboard(
    rebno NUMBER(6)
        CONSTRAINT REBRD_NO_PK PRIMARY KEY,
    writer VARCHAR2(10 CHAR)
        CONSTRAINT REBRD_ID_FK REFERENCES member(id)
        CONSTRAINT REBRD_ID_NN NOT NULL,
    body VARCHAR2(200 CHAR)
        CONSTRAINT BEBRD_BODY_NN NOT NULL,
    wdate DATE DEFAULT SYSDATE
        CONSTRAINT REBRD_DATE_NN NOT NULL,
    reisshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT REBRD_ISSHOW_NN NOT NULL 
        CONSTRAINT REBRD_ISSHOW_CK CHECK(REISSHOW IN ('Y','N')),
    goods NUMBER(6) DEFAULT 0
        CONSTRAINT REBRD_GOOD_NN NOT NULL,
    reupno VARCHAR2(21 CHAR)
        CONSTRAINT REBRD_UPNO_NN NOT NULL,
    regroup NUMBER(6)
        CONSTRAINT REBRD_GROUP_NN NOT NULL,
    relevel NUMBER(1) DEFAULT 1
        CONSTRAINT REBRD_LEVEL_NN NOT NULL
);

ALTER TABLE reboard
    MODIFY rebno NUMBER(6) DEFAULT REBRDSEQ.nextval
;


CREATE SEQUENCE rebrdSeq
    START WITH 1001
    MAXVALUE 999999
    NOCACHE
    NOCYCLE
;



select
    substr(data, instr(data,'#')+1, instr(data,'#',2,1)-2) regroup
from
(
select
    '#1001#1012' data
from
    dual
);

insert into
    reboard(rebno, writer, body, reupno, regroup, relevel
values(
    #{bno}, #{id}, #{body}, #{upno}||#{bno}, 
<if test="regroup eq 0">
    #{bno},
</if>
<if test="regroup neq 0">
    #{regroup},
</if>
    #{level + 1}
);