create database db_library1
use db_library1


create table Library_Branch (
	Branch_Id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Branch_Name varchar(50) not null,
	Branch_Address varchar(50)
);

create table Publisher ( 
	Publisher_Name varchar(30) PRIMARY KEY NOT NULL,
	Publisher_Address varchar(50),
	Publisher_phone varchar(20)
);

create table Books (
	Book_Id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Book_Title varchar(50) not null,
	Book_Publisher varchar(30) constraint fk_publisher_name 
	Foreign Key References Publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
); 

create table Book_Authors (
	Book_Id INT NOT NULL CONSTRAINT fk_Book_ID
	Foreign Key References Books(Book_Id) ON UPDATE CASCADE ON DELETE CASCADE,
	Author_Name varchar(30) NOT NULL
);

create table Book_Copies (
	Book_Id INT NOT NULL CONSTRAINT fk2_Book_ID
	Foreign Key References Books(Book_Id) ON UPDATE CASCADE ON DELETE CASCADE,
	Branch_Id INT NOT NULL CONSTRAINT fk_Branch_Id
	Foreign Key References Library_Branch(Branch_Id) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT
);

CREATE TABLE Borrower (
	Card_Number INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	Name varchar(30) not null,
	B_Address varchar(50) not null,
	B_Phone varchar(50) not null
);

create table Book_Loans (
	Book_Id INT NOT NULL CONSTRAINT fk3_Book_ID 
	FOREIGN KEY REFERENCES Books(Book_Id) ON UPDATE CASCADE ON DELETE CASCADE,
	Branch_Id INT NOT NULL constraint fk2_Branch_Id 
	FOREIGN KEY REFERENCES Library_Branch(Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Card_Number int not null constraint fk_Card_Number 
	FOREIGN KEY REFERENCES Borrower(Card_Number) on update cascade on delete cascade,
	Date_Out DATE not null, 
	Date_Due Date not null
);

INSERT INTO Library_Branch
	(Branch_Name, Branch_Address)
	Values
	('Sharpstown', '2108 Lawrence St 80205'),
	('Central', '5300 E Cherry Creek South 80246'),
	('Five Points', '3214 Knox St 80201'),
	('East', '3975 Peoria St 80211')
;

INSERT INTO Publisher
	(Publisher_Name, Publisher_Address, Publisher_phone)
	VALUES
	('Penguin Press', '1400 Wazee St 80205', '720-422-0011'),
	('Books By Us', '11 Stadium Drive 80219', '303-218-1982'),
	('Ready to Read', '2211 Seatown Ave 80011', '303-444-1267'),
	('Easy Publishing', '954 Easy Street 80201', '720-618-1924')
;

INSERT INTO Books
	(Book_Title, Book_Publisher)
	VALUES
	('The Lost Tribe','Penguin Press'),
	('Mayan Tribes','Ready to Read'),
	('Robots and Us','Penguin Press'),
	('Reading for Dummies','Books By Us'),
	('Chicken Soup for the Soul','Ready to Read'),
	('Penguin Party','Penguin Press'),
	('Co-op Living','Easy Publishing'),
	('Mardi Gras: Tips and Tricks','Penguin Press'),
	('Life Down Under','Easy Publishing'),
	('Sharks','Books By Us'),
	('History of Baseball','Ready to Read'),
	('Roadless Travelers','Easy Publishing'),
	('Hiking and Fitness','Penguin Press'),
	('Stop Watching TV','Ready to Read'),
	('Coffee Time','Books By Us'),
	('Truth Detective','Easy Publishing'),
	('Cormoran Strikes Back','Books By Us'),
	('Stop Complaining and Start Living','Ready to Read'),
	('Zen Gardens','Books By Us'),
	('Galaxy Wars','Easy Publishing')
;

INSERT INTO Book_Authors
	(Book_Id, Author_Name)
	VALUES
	(100,'James Smith'),
	(101,'Robert Johnson'),
	(102,'Stephen King'),
	(103,'Dan Ebert'),
	(104,'Matt Kowalski'),
	(105,'Freddie Mercury'),
	(106,'Larry Legend'),
	(107,'Kip Smitt'),
	(108,'Earl Gray'),
	(109,'Chris McFurley'),
	(110,'Earl Gray'),
	(111,'Chris McFurley'),
	(112,'Matt Kowalski'),
	(113,'Robert Johnson'),
	(114,'James Smith'),
	(115,'Stephen King'),
	(116,'Craig Uhlrich'),
	(117,'Will Ingrick'),
	(118,'Kip Smitt'),
	(119,'Tristian Reyes')
;

INSERT INTO BORROWER
	(Name, B_Address, B_Phone)
	Values
	('Frank Alioto','22 S Jasper St 80222','303-132-2356'),
	('Joey Peppatone','1879 S Franklin St 80246','720-657-2136'),
	('Matt Groble','156 E Alameda Ave 80212','303-567-2145'),
	('Tom Savage','678 W Hampden Ave 80246','303-822-2155'),
	('Dontrelle Willis','568 Ballpark Ave 80122','303-720-1225'),
	('Nolan Story','4236 E 6th Ave 80246','303-666-6161'),
	('Trevor Arenado','333 MVP Way 80205','720-453-2177'),
	('Dylan Henricks','5322 W Walker St 80219','303-520-1952'),
	('Frankie Fugazzi', '22 Elm St 80246', '414-552-2453')
;

INSERT INTO Book_Loans
	(Book_Id, Branch_Id, Card_Number, Date_Out, Date_Due)
	VALUES
	(100,1,1005,'2018-10-23','2018-10-30'),
	(100,1,1001,'2018-10-21','2018-10-28'),
	(100,2,1002,'2018-10-18','2018-10-25'),
	(100,3,1003,'2018-10-24','2018-10-31'),
	(100,4,1000,'2018-10-23','2018-10-30'),
	(101,1,1005,'2018-10-21','2018-10-28'),
	(101,2,1006,'2018-10-18','2018-10-25'),
	(101,3,1002,'2018-10-22','2018-10-29'),
	(102,4,1000,'2018-10-21','2018-10-28'),
	(102,1,1004,'2018-10-23','2018-10-30'),
	(103,2,1006,'2018-10-24','2018-10-31'),
	(103,3,1000,'2018-10-22','2018-10-29'),
	(103,4,1007,'2018-10-18','2018-10-25'),
	(104,1,1003,'2018-10-24','2018-10-31'),
	(104,1,1005,'2018-10-21','2018-10-28'),
	(105,2,1004,'2018-10-18','2018-10-25'),
	(105,3,1001,'2018-10-23','2018-10-30'),
	(106,4,1002,'2018-10-24','2018-10-31'),
	(106,1,1001,'2018-10-22','2018-10-29'),
	(107,2,1006,'2018-10-21','2018-10-28'),
	(107,3,1007,'2018-10-23','2018-10-30'),
	(108,4,1000,'2018-10-18','2018-10-25'),
	(109,1,1001,'2018-10-24','2018-10-31'),
	(109,2,1006,'2018-10-20','2018-10-27'),
	(110,2,1006,'2018-10-21','2018-10-28'),
	(110,3,1007,'2018-10-23','2018-10-30'),
	(111,4,1004,'2018-10-22','2018-10-29'),
	(112,1,1001,'2018-10-20','2018-10-27'),
	(112,2,1002,'2018-10-23','2018-10-30'),
	(113,2,1002,'2018-10-18','2018-10-25'),
	(113,4,1000,'2018-10-24','2018-10-31'),
	(114,3,1003,'2018-10-23','2018-10-30'),
	(114,4,1000,'2018-10-20','2018-10-27'),
	(114,1,1001,'2018-10-21','2018-10-28'),
	(114,2,1002,'2018-10-23','2018-10-30'),
	(114,2,1002,'2018-10-22','2018-10-29'),
	(114,4,1004,'2018-10-18','2018-10-25'),
	(114,3,1003,'2018-10-24','2018-10-31'),
	(115,1,1001,'2018-10-21','2018-10-28'),
	(116,1,1001,'2018-10-23','2018-10-30'),
	(116,2,1002,'2018-10-16','2018-10-23'),
	(117,3,1007,'2018-10-18','2018-10-25'),
	(117,4,1000,'2018-10-21','2018-10-28'),
	(117,2,1002,'2018-10-23','2018-10-30'),
	(117,1,1000,'2018-10-22','2018-10-29'),
	(118,3,1001,'2018-10-24','2018-10-31'),
	(118,1,1001,'2018-10-18','2018-10-25'),
	(118,2,1006,'2018-10-15','2018-10-22'),
	(119,4,1004,'2018-10-21','2018-10-28'),
	(119,2,1002,'2018-10-23','2018-10-30')
;

INSERT INTO Book_Copies
	(Book_Id, Branch_Id, Number_Of_Copies)
	Values
	(100,1,5),
	(101,1,2),
	(102,1,2),
	(104,1,4),
	(106,1,2),
	(109,1,2),
	(112,1,2),
	(114,1,2),
	(115,1,2),
	(116,1,2),
	(117,1,3),
	(118,1,2),
	(100,2,2),
	(101,2,3),
	(102,2,4),
	(103,2,3),
	(105,2,3),
	(107,2,3),
	(109,2,3),
	(110,2,3),
	(112,2,3),
	(113,2,3),
	(114,2,3),
	(115,2,3),
	(116,2,3),
	(117,2,2),
	(118,2,3),
	(119,2,3),
	(100,3,3),
	(101,3,2),
	(103,3,4),
	(105,3,2),
	(107,3,2),
	(110,3,3),
	(114,3,3),
	(115,3,2),
	(117,3,2),
	(118,3,2),
	(119,3,2),
	(100,4,4),
	(102,4,3),
	(103,4,3),
	(106,4,3),
	(108,4,2),
	(111,4,5),
	(113,4,4),
	(114,4,3),
	(117,4,3),
	(118,4,2),
	(119,4,3)
;

/*-- Query 1 --*/

SELECT a1.Number_Of_Copies, a2.Branch_Name
FROM Book_Copies a1
INNER JOIN Library_Branch a2 ON a2.Branch_id = a1.Branch_id
INNER JOIN Books a3 ON a3.Book_Id = a1.Book_id
Where a3.book_title = 'The Lost Tribe' and a2.Branch_Name = 'Sharpstown'
;

/*-- Query 2 --*/

SELECT a1.Number_Of_Copies, a2.Branch_Name
	FROM Book_Copies a1
	INNER JOIN Library_Branch a2 ON a2.Branch_id = a1.Branch_id
	INNER JOIN Books a3 ON a3.Book_Id = a1.Book_id
	Where a3.book_title = 'The Lost Tribe'
;

/*-- Query 3 --*/

Select a1.Name
From Borrower a1
left join Book_Loans a2 ON a2.Card_Number = a1.Card_Number
WHERE a2.card_number is null

/*-- Query 4 --*/

select a2.book_title, a3.Name, a3.B_Address
FROM book_loans a1
inner join Books a2 on a2.book_id = a1.book_id
inner join Borrower a3 on a3.card_number = a1.card_number
inner join Library_Branch a4 on a4.branch_id = a1.branch_id
where a4.branch_name = 'Sharpstown' and a1.Date_due = '2018/10/25'

/*-- Query 5 --*/

select count(a1.Branch_Id) as 'Book''s Loaned' , a2.Branch_Name as 'Branch Name'
from book_loans a1
inner join Library_Branch a2 on a2.branch_id = a1.branch_id
group by a2.branch_name

/*-- Query 6 --*/

select a2.name as 'Name', a2.b_address as 'Address', count(a1.card_number) as 'Book''s Loaned'
from Borrower a2
inner join book_loans a1 on a1.Card_Number = a2.Card_Number
group by a2.name, a2.B_Address
having count(a1.card_number) > 5
order by count(a1.card_number) desc;

/*-- Query 7 --*/

select a3.Book_Title, a4.Number_Of_Copies
from book_Copies a4
inner join Books a3 on a3.book_id = a4.book_id
inner join Book_Authors a1 on a1.Book_Id = a3.book_id
inner join Library_Branch a2 on a2.branch_id = a4.Branch_Id
where a2.Branch_Name = 'Central' and a1.Author_Name = 'Stephen King'