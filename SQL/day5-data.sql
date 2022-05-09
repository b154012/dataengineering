SELECT * FROM BOOK;
SELECT * FROM READER;
SELECT * FROM BORROW;

CREATE TABLE BOOK (
	BOOK_ID int(10) PRIMARY KEY,
	SORT VARCHAR(10),
	BOOK_NAME VARCHAR(50),
	WRITER VARCHAR(10),
	OUTPUT VARCHAR(50),
	PRICE DECIMAL(4,2)
);
ALTER TABLE BOOK
MODIFY OUTPUT VARCHAR(100);

ALTER TABLE BOOK
MODIFY WRITER VARCHAR(50);

DROP TABLE BOOK;

CREATE TABLE READER (
	READER_ID int(3) PRIMARY KEY,
	COMPANY VARCHAR(10),
	NAME VARCHAR(10),
	SEX VARCHAR(2),
	GRADE VARCHAR(10),
	ADDR VARCHAR(50)
);

ALTER TABLE READER
MODIFY COMPANY VARCHAR(50);

ALTER TABLE READER
MODIFY SEX VARCHAR(6);

ALTER TABLE READER
MODIFY GRADE VARCHAR(50);

ALTER TABLE READER
MODIFY NAME VARCHAR(50);

CREATE TABLE BORROW (
	READER_ID int(3),
	BOOK_ID int(10),
	BORROW_DATE DATE,
	CONSTRAINT PK_BORROW PRIMARY KEY(READER_ID, BOOK_ID)
);

DROP TABLE BORROW;

SELECT * FROM BOOK;
SELECT * FROM READER;
SELECT * FROM BORROW;

INSERT INTO BOOK VALUES (445501, 'TP3 / 12', 'Introduction to Database' , 'Wang Qiang', 'Science Press', 17.90);
INSERT INTO BOOK VALUES (445502, 'TP3 / 12', 'Introduction to Database' , 'Wang Qiang', 'Science Press', 17.90);
INSERT INTO BOOK VALUES (445503, 'TP3 / 12', 'Introduction to Database' , 'Wang Qiang', 'Science Press', 17.90);
INSERT INTO BOOK VALUES (332211, 'TP5 / 10', 'Computer Foundation', 'Li Wei', 'Higher Education Press', 18.00);
INSERT INTO BOOK VALUES (112266, 'TP3 / 12', 'FOXBASE', 'Zhang San', 'Electronic Industry Press', 23.60);
INSERT INTO BOOK VALUES (665544, 'TS7 / 21', 'Advanced Mathematics', 'Liu Ming', 'Higher Education Press', 20.00);
INSERT INTO BOOK VALUES (114455, 'Tr9 / 12', 'Linear Algebra', 'Sun Ye', 'Peking University Press', 20.80);
INSERT INTO BOOK VALUES (113388, 'TR7 / 90', 'College English', 'Hu Ling', 'Tsinghua University Press', 12.50);
INSERT INTO BOOK VALUES (446601, 'TP4 / 13', 'Database Foundation', 'Ma Lingyun', 'Peoples Posts and Telecommunications Publishing House', 22.50);
INSERT INTO BOOK VALUES (446602, 'TP4 / 13', 'Database Foundation', 'Ma Lingyun','Peoples Posts and Telecommunications Publishing House', 22.50);
INSERT INTO BOOK VALUES (446603, 'TP4 / 13', 'Database Foundation' , 'Ma Lingyun', 'Peoples Posts and Telecommunications Publishing House', 22.50);
INSERT INTO BOOK VALUES (449901, 'TP4 / 14', 'FoxPro encyclopedia', 'Zhou Hong', 'Science Press', 32.70);
INSERT INTO BOOK VALUES (449902, 'TP4 / 14', 'Foxpro Daquan', 'Zhou Hong', 'Science Press', 32.70);
INSERT INTO BOOK VALUES (118801, 'TP4 / 15', 'Computer Network' , 'Huang Lijun','Higher Education Press', 21.80);
INSERT INTO BOOK VALUES (118802, 'TP4 / 15', 'Computer Network', 'Huang Lijun', 'Higher Education Press', 21.80);

UPDATE BOOK SET BOOK_NAME = 'FoxPro Encyclopedia'
WHERE BOOK_ID = 449901;

INSERT INTO READER VALUES (111, 'Information Department', 'Wang Weili', 'female', 'Professor', '424 Building 1');
INSERT INTO READER VALUES (112, 'Department of Accounting', 'Li Li', 'male', 'Associate Professor', '316 Building 2');
INSERT INTO READER VALUES (113, 'Department of Economics', 'Zhang San', 'male', 'Lecturer', '105 Building 3');
INSERT INTO READER VALUES (114, 'Information Department', 'Zhou Huafa', 'male', 'Lecturer', '316 Building 1');
INSERT INTO READER VALUES (115, 'Information system', 'Zhao Zhengyi', 'male', 'Engineer', '224 Building 1');
INSERT INTO READER VALUES (116, 'Information Department', 'Li Ming', 'male', 'Associate Professor', '318 Building 1');
INSERT INTO READER VALUES (117, 'Computer Department', 'Li Xiaofeng', 'male', 'Teaching Assistant', '214 Building 1');
INSERT INTO READER VALUES (118, 'Computer Department', 'Xu Pengfei', 'male', 'Assistant', '216 Building 1');
INSERT INTO READER VALUES (119, 'Department of Computer Science', 'Liu Dalong', 'male', 'Professor', '318 Building 1');
INSERT INTO READER VALUES (120, 'International Trade', 'Li Xue', 'male', 'Associate Professor', '506 Building 4');
INSERT INTO READER VALUES (121, 'International Trade', 'Li Shuang', 'female', 'Lecturer', '510 Building 4');
INSERT INTO READER VALUES (122, 'International Trade', 'Wang Chun', 'female', 'Lecturer' , '512 Building 4');
INSERT INTO READER VALUES (123, 'Department of Accounting', 'Shen Xiaoxia', 'female', 'Teaching Assistant', '202 Building 2');
INSERT INTO READER VALUES (124, 'Department of Finance and Accounting', 'Zhu Hai', 'male', 'Lecturer', '210 Building 2');
INSERT INTO READER VALUES (125, 'Department of accounting', 'Ma Yingming', 'male', 'Associate Professor', '212 Building 2');
    
UPDATE READER SET COMPANY = 'Department of Accounting'
WHERE READER_ID = 125;

INSERT INTO BORROW VALUES (112, 445501, str_to_date('2006-3-19', '%Y-%m-%d'));
INSERT INTO BORROW VALUES (125, 332211, str_to_date('2006-2-12', '%Y-%m-%d'));
INSERT INTO BORROW VALUES (111, 445503, str_to_date('2006-8-21', '%Y-%m-%d'));
INSERT INTO BORROW VALUES (112, 112266, str_to_date('2006-3-14', '%Y-%m-%d'));
INSERT INTO BORROW VALUES (114, 665544, str_to_date('2006-10-21', '%Y-%m-%d'));
INSERT INTO BORROW VALUES (120, 114455, str_to_date('2006-11-02', '%Y-%m-%d'));
INSERT INTO BORROW VALUES (120, 118801, str_to_date('2006-10-18', '%Y-%m-%d'));
INSERT INTO BORROW VALUES (119, 446603, str_to_date('2006-11-12', '%Y-%m-%d'));
INSERT INTO BORROW VALUES (112, 449901, str_to_date('2006-10-23', '%Y-%m-%d'));
INSERT INTO BORROW VALUES (115, 449902, str_to_date('2006-8-21', '%Y-%m-%d'));
INSERT INTO BORROW VALUES (118, 118801, str_to_date('2006-9-10', '%Y-%m-%d'));
