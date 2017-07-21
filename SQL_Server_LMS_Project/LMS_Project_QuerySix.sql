USE db_lms_seth;


SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_borrower;

CREATE PROC LMS.usp_querySix
AS
SELECT  a.BorrowName, a.BorrowAddress, COUNT(b.CardNo_Loans) Loans

FROM tbl_borrower a
INNER JOIN tbl_book_loans b ON b.CardNo_Loans = a.CardNo
WHERE b.CardNo_Loans IS NOT NULL
GROUP BY a.BorrowName, a.BorrowAddress, b.CardNo_Loans
HAVING COUNT(b.CardNo_Loans) > 5
;

EXEC LMS.usp_querySix;