USE db_lms_seth;

SELECT * FROM tbl_book_copies;
SELECT * FROM tbl_library_branch;
SELECT * FROM tbl_book;

CREATE PROC LMS.usp_queryTwo
AS
SELECT c.BranchName, b.Title, a.No_Of_Copies
FROM tbl_book_copies a
INNER JOIN tbl_book b ON b.BookId = a.BookId_Copies
INNER JOIN tbl_library_branch c ON c.BranchId = a.BranchId_Copies
WHERE Title = 'The Lost Tribe'
;

EXEC LMS.usp_queryTwo;