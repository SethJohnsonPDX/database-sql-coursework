USE db_lms_seth;


SELECT * FROM tbl_library_branch;
SELECT * FROM tbl_book_authors;
SELECT * FROM tbl_book;
SELECT * FROM tbl_book_copies;

CREATE PROC LMS.usp_querySeven
AS
SELECT b.AuthorName, a.Title, c.BranchName,  e.No_Of_Copies

FROM tbl_book a
INNER JOIN tbl_book_authors b ON b.BookId_Auth = a.BookId
INNER JOIN tbl_book_copies e ON e.BookId_Copies = a.BookId
INNER JOIN tbl_library_branch c ON c.BranchId = e.BranchId_Copies
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central'
;

EXEC LMS.usp_querySeven;