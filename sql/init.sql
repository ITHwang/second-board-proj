CREATE TABLE member (
  ID VARCHAR2(10) NOT NULL,
  pwd VARCHAR2(10) NOT NULL,
  name VARCHAR2(50) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  joinDate DATE DEFAULT sysdate NOT NULL
);
CREATE UNIQUE INDEX PK_member ON member (ID ASC);
ALTER TABLE
  member
ADD
  CONSTRAINT PK_member PRIMARY KEY (ID);
CREATE TABLE board (
    articleNO NUMBER NOT NULL,
    title VARCHAR(500) NOT NULL,
    content VARCHAR(4000) NOT NULL,
    imageFileName VARCHAR(100),
    writeDate DATE DEFAULT sysdate NOT NULL,
    ID VARCHAR2(10)
  );
CREATE UNIQUE INDEX PK_board ON board (articleNO ASC);
ALTER TABLE
  board
ADD
  CONSTRAINT PK_board PRIMARY KEY (articleNO);
CREATE TABLE comments (
    commentNO NUMBER(10) NOT NULL,
    content VARCHAR(4000),
    writeDate DATE DEFAULT sysdate,
    articleNO NUMBER,
    ID VARCHAR2(10)
  );
CREATE UNIQUE INDEX PK_comments ON comments (commentNO ASC);
ALTER TABLE
  comments
ADD
  CONSTRAINT PK_comments PRIMARY KEY (commentNO);
CREATE TABLE imageFile (
    imageFileNO NUMBER(10) NOT NULL,
    imageFileName VARCHAR2(50) NOT NULL,
    regDate DATE DEFAULT sysdate,
    articleNO NUMBER
  );
CREATE UNIQUE INDEX PK_imageFile ON imageFile (imageFileNO ASC);
ALTER TABLE
  imageFile
ADD
  CONSTRAINT PK_imageFile PRIMARY KEY (imageFileNO);
ALTER TABLE
  board
ADD
  CONSTRAINT FK_member_TO_board FOREIGN KEY (ID) REFERENCES member (ID) ON DELETE CASCADE;
ALTER TABLE
  comments
ADD
  CONSTRAINT FK_board_TO_comments FOREIGN KEY (articleNO) REFERENCES board (articleNO) ON DELETE CASCADE;
ALTER TABLE
  comments
ADD
  CONSTRAINT FK_member_TO_comments FOREIGN KEY (ID) REFERENCES member (ID) ON DELETE CASCADE;
ALTER TABLE
  imageFile
ADD
  CONSTRAINT FK_board_TO_imageFile FOREIGN KEY (articleNO) REFERENCES board (articleNO) ON DELETE CASCADE;
commit;