/*1. Find out the name and department of the reader with surname Li.*/
SELECT R.NAME as 'Reader Name', R.COMPANY as 'Department'
FROM READER R
WHERE R.NAME LIKE 'Li%';

/*2. List the book titles of all the books in the library (Book_Name) and publisher (output).*/
SELECT DISTINCT B.BOOK_NAME as 'Title', B.OUTPUT as 'Publisher'
FROM BOOK B;

/*3. Find all the book names by the publishing house called "higher education press". The results are sorted in descending order according to the unit price.*/
SELECT BOOK_ID,
SORT as 'Sort',
BOOK_NAME as 'Book Name',
WRITER as 'Writer',
OUTPUT as 'Publishing House',
PRICE as 'Unit Price'
FROM BOOK B
WHERE B.OUTPUT = 'Higher Education Press'
ORDER BY B.PRICE ASC;

/*4. Search for books with prices between 10 yuan and 20 yuan. The results are sorted in ascending order by publishing unit (output) and unit price (price).*/
SELECT B.BOOK_ID,
B.SORT as 'Sort',
B.BOOK_NAME as 'Book Name',
B.WRITER as 'Writer',
B.OUTPUT as 'Publishing House',
B.PRICE as 'Unit Price between 10 and 20 yuan'
FROM BOOK B
WHERE B.PRICE BETWEEN 10 AND 20
ORDER BY B.OUTPUT ASC, B.PRICE;

/*5. Find all books and writers whose titles begin with "computer."*/
SELECT B.BOOK_NAME as 'Title', B.WRITER as 'Writer'
FROM BOOK B
WHERE B.BOOK_NAME IN (
	SELECT BOOK_NAME 
	FROM BOOK 
    WHERE BOOK_NAME LIKE 'Computer%');
    
/*6. Extract the information with book_ID: 449901*/
SELECT *
FROM BOOK B
WHERE B.BOOK_ID = 449901;

/*7. Find out the title and borrow date of all the books.*/
SELECT B.BOOK_NAME as 'Title', BRW.BORROW_DATE as 'Borrow Date'
FROM BOOK B
JOIN BORROW BRW on BRW.BOOK_ID = B.BOOK_ID;

/*8. Query reader card numbers of readers who borrow books after October 2006 without repetition (READER_ID), name and department.*/
SELECT DISTINCT R.READER_ID as 'Reader ID', R.NAME as 'Name', R.COMPANY as 'Department'
FROM READER R
WHERE R.READER_ID IN (SELECT DISTINCT READER_ID FROM BORROW WHERE BORROW_DATE > str_to_date('2006-10-01', '%Y-%m-%d'));

/*9. Find out the library card number of the borrower of FoxPro encyclopedia.*/
SELECT R.READER_ID as 'Library Card Number'
FROM READER R
JOIN BORROW BRW on BRW.READER_ID = R.READER_ID
JOIN BOOK B on B.BOOK_ID = BRW.BOOK_ID
WHERE B.BOOK_NAME = 'FoxPro Encyclopedia';

/*10. Query the members’ names who borrowed books on the same day as Zhao Zhengyi. Display how many members borrowed books and the date of borrowing.*/
SELECT DISTINCT COUNT(*) as 'No. of borrowed books', BRW.BORROW_DATE as 'Date of borrowing'
FROM BORROW BRW
JOIN READER R
JOIN BOOK B on B.BOOK_ID = BRW.BOOK_ID
WHERE (BRW.BORROW_DATE IN (SELECT BORROW_DATE FROM BORROW WHERE R.NAME = 'Zhao Zhengyi') = BRW.BORROW_DATE IN (SELECT BORROW_DATE FROM BORROW))
GROUP BY R.READER_ID, BRW.BORROW_DATE;

/*11.Check the library card number, name and number of readers who have not borrowed books since July 2006.*/
SELECT R.READER_ID as 'Library Card No.', R.NAME as 'Name', COUNT(*) as 'The number of readers not borrowed books since July 2006'
FROM READER R
JOIN BORROW BRW on BRW.READER_ID = R.READER_ID
JOIN BOOK B on B.BOOK_ID = BRW.BOOK_ID
WHERE R.READER_ID NOT IN (SELECT READER_ID FROM BORROW WHERE BORROW_DATE > str_to_date('2006-07-01', '%Y-%m-%d'))
GROUP BY R.READER_ID;

/*12. Extract the highest unit price, lowest unit price and average unit price of "Science Press" books.*/
SELECT Max(B.PRICE) as 'Highest Unit Price', Min(B.PRICE) as 'Lowest Unit Price', ROUND(AVG(B.PRICE),2) as 'Average Unit Price'
FROM READER R
JOIN BORROW BWR on BWR.READER_ID = R.READER_ID
JOIN BOOK B on B.BOOK_ID = BWR.BOOK_ID
WHERE B.OUTPUT IN (SELECT OUTPUT FROM BOOK WHERE OUTPUT = 'Science Press');

/*13.Find out the number of readers from Information Department who borrowed books.*/
SELECT COUNT(*) as 'No. of readers from Information Department'
FROM READER R
JOIN BORROW BRW on BRW.READER_ID = R.READER_ID
JOIN BOOK B on B.BOOK_ID = BRW.BOOK_ID
WHERE BRW.READER_ID IN (SELECT DISTINCT READER_ID FROM READER WHERE COMPANY = 'Information Department');

/*14. Display the highest price, the lowest price and the total number of books of each publishing house.*/
SELECT Max(B.PRICE) as 'Highest Price', Min(B.PRICE) as 'Lowest Price', COUNT(*) as 'No. of books of each publishing house'
FROM BOOK B
GROUP BY B.OUTPUT;

/*15. For each department, query the number of readers who borrowed books.*/
SELECT R.COMPANY as 'Department', COUNT(*) as 'No. of readers borrowed books'
FROM READER R
JOIN BORROW BRW on BRW.READER_ID = R.READER_ID
JOIN BOOK B on B.BOOK_ID = BRW.BOOK_ID
GROUP BY R.COMPANY
HAVING COUNT(R.READER_ID) >= 1;

/*16. Find out the names of the readers who have borrowed at least 2 books and the number of books borrowed.*/
SELECT distinct R.NAME as 'Reader Name', COUNT(*) as 'No. of books borrowed'
FROM READER R
JOIN BORROW BRW on BRW.READER_ID = R.READER_ID
JOIN BOOK B on B.BOOK_ID = BRW.BOOK_ID
GROUP BY R.READER_ID
HAVING COUNT(R.READER_ID) >= 2
ORDER BY R.NAME DESC;

/*17. Find out the name of each publishing house in the collection, 
the total number of books of each publishing house (each type may have more than one), and the total value of the book.*/
SELECT distinct B.OUTPUT as 'Publishing House', COUNT(B.OUTPUT) as 'Total no. of books of each publishing house', sum(B.PRICE) as 'Total Value'
FROM READER R
JOIN BORROW BRW on BRW.READER_ID = R.READER_ID
JOIN BOOK B on B.BOOK_ID = BRW.BOOK_ID AND B.PRICE
GROUP BY B.OUTPUT
ORDER BY COUNT(B.OUTPUT);

/*18. Check whether the Economics Department has borrowed any books. If so, display the names, department and titles of all readers in Economics Department.*/
SELECT R.NAME as 'Name', R.COMPANY as 'Department', R.GRADE as 'Grade'
FROM READER R
JOIN BORROW BRW on BRW.READER_ID = R.READER_ID
JOIN BOOK B on B.BOOK_ID = BRW.BOOK_ID 
WHERE R.READER_ID IN (SELECT READER_ID FROM READER WHERE COMPANY = 'Economic Department')
GROUP BY 1,2,3
HAVING COUNT(R.READER_ID) >= 1;
