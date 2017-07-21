USE db_lms_seth;

SELECT * FROM tbl_borrower;
SELECT * FROM tbl_library_branch;
SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_book;

CREATE PROC LMS.usp_queryFour
AS
SELECT c.BranchName, a.DueDate, e.Title, b.BorrowName, b.BorrowAddress 
FROM tbl_book_loans a
INNER JOIN tbl_borrower b ON b.CardNo = a.CardNo_Loans
INNER JOIN tbl_library_branch c ON c.BranchId = a.BranchId_Loans
INNER JOIN tbl_book e ON e.BookId = a.BookId_Loans
WHERE c.BranchName = 'Sharpstown'
AND a.DueDate = '2017-07-19'
;

EXEC LMS.usp_queryFour;