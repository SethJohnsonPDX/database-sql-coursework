USE db_lms_seth;


SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_library_branch;

CREATE PROC LMS.usp_queryFive
AS
SELECT  b.BranchName, COUNT(a.BranchId_Loans) Loans
FROM tbl_book_loans a
INNER JOIN tbl_library_branch b ON b.BranchId = a.BranchId_Loans
GROUP BY b.BranchName
;

EXEC LMS.usp_queryFive;