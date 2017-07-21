CREATE DATABASE db_lms_seth;

USE db_lms_seth;

CREATE TABLE tbl_book (
	BookId INT PRIMARY KEY NOT NULL IDENTITY (1000,1), /*Run fourth*/
	Title VARCHAR(50) NOT NULL,
	PubId_Book INT NOT NULL CONSTRAINT fk_pub_id FOREIGN KEY REFERENCES tbl_publisher(PubId) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE tbl_publisher (						/*Run third*/
	PubId INT PRIMARY KEY NOT NULL IDENTITY (50,1),
	PubName VARCHAR(50) NOT NULL,
	PubAddress VARCHAR(50) NOT NULL,
	PubPhone VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_book_authors (						/*Run fifth*/
	BookId_Auth INT NOT NULL CONSTRAINT fk_book_id_auth FOREIGN KEY REFERENCES tbl_book(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_loans (						/*Run sixth*/
	BookId_Loans INT NOT NULL CONSTRAINT fk_book_id_loans FOREIGN KEY REFERENCES tbl_book(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchId_Loans INT NOT NULL CONSTRAINT fk_branch_id_loans FOREIGN KEY REFERENCES tbl_library_branch(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo_Loans INT NOT NULL CONSTRAINT fk_card_no_loans FOREIGN KEY REFERENCES tbl_borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(30) NOT NULL,
	DueDate VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_book_copies (						/*Run seventh/last*/
	BookId_Copies INT NOT NULL CONSTRAINT fk_book_id_copies FOREIGN KEY REFERENCES tbl_book(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchId_Copies INT NOT NULL CONSTRAINT fk_branch_id_copies FOREIGN KEY REFERENCES tbl_library_branch(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
);

CREATE TABLE tbl_borrower (								/*Run second*/
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (10000,1),
	BorrowName VARCHAR(30) NOT NULL,
	BorrowAddress VARCHAR(30) NOT NULL,
	BorrowPhone VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_library_branch (						/*Run first*/
	BranchId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(30),
	BranchAddress VARCHAR(30)
);