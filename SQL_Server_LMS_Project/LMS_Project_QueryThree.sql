USE db_lms_seth;


SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_borrower;

CREATE PROC LMS.usp_queryThree
AS
SELECT b.CardNo_Loans, a.BorrowName
FROM tbl_borrower a
LEFT JOIN tbl_book_loans b ON b.CardNo_Loans = a.CardNo
WHERE b.CardNo_Loans IS NULL
;

EXEC LMS.usp_queryThree;