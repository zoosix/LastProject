CREATE TABLE reply(
    no NUMBER,
    bno NUMBER,
    id VARCHAR2(20) CONSTRAINT reply_nn_id NOT NULL,
    name VARCHAR2(20) CONSTRAINT reply_nn_name NOT NULL,
    msg VARCHAR2(4000) CONSTRAINT reply_nn_msg NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    group_id NUMBER,
    group_step NUMBER,
    group_tab NUMBER,
    root NUMBER,
    depth NUMBER,
    CONSTRAINT reply_pk_no PRIMARY KEY(no)
);