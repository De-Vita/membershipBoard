### mysql 계정
```mysql
create database db_springframework;
create user user_springframework@localhost identified by '1234';
grant all privileges on db_springframework.* to user_springframework@localhost;
```
### tables
```mysql
-- member_table
DROP TABLE IF EXISTS member_table;
CREATE TABLE member_table (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    memberEmail varchar(50) UNIQUE,
    memberPassword varchar(50) NOT NULL,
    memberName varchar(50) NOT NULL,
    memberMobile varchar(50) NOT NULL,
    memberProfileAttached int DEFAULT 0
);

-- member_profile_table
DROP TABLE IF EXISTS member_profile_table;
CREATE TABLE member_profile_table (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    originalFileName varchar(100),
    storedFileName varchar(100),
    memberId bigint,
    CONSTRAINT fk_member_file FOREIGN KEY(memberId) REFERENCES member_table(id) ON DELETE CASCADE
);

-- board_table
DROP TABLE IF EXISTS board_table;
CREATE TABLE board_table(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    boardTitle varchar(100),
    boardWriter varchar(100),
    boardContents varchar(500),
    boardHits int DEFAULT 0,
    boardCreatedDate datetime DEFAULT now(),
    fileAttached int DEFAULT 0,
    memberId bigint,
    CONSTRAINT fk_board_table FOREIGN KEY(memberId) REFERENCES member_table(id) ON DELETE CASCADE
);

-- board_file_table
DROP TABLE IF EXISTS board_file_table;
CREATE TABLE board_file_table(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    originalFileName varchar(200),
    storedFileName varchar(200),
    boardId bigint,
    CONSTRAINT fk_board_file FOREIGN KEY(boardId) REFERENCES board_table(id) ON DELETE CASCADE
);

-- comment_table
DROP TABLE IF EXISTS comment_table;
CREATE TABLE comment_table(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    commentWriter varchar(200),
    commentContents varchar(200),
    commentCreatedDate datetime DEFAULT now(),
    boardId bigint,
    memberId bigint,
    CONSTRAINT fk_comment FOREIGN KEY(boardId) REFERENCES board_table(id) ON DELETE CASCADE,
    CONSTRAINT fk_comment_2 FOREIGN KEY(memberId) REFERENCES member_table(id) ON DELETE CASCADE
);

-- 관리자 계정
INSERT INTO member_table(memberEmail, memberPassword, memberName, memberMobile, memberProfileAttached)
VALUES ('admin', '1234', 'admin', '1234', 0);

