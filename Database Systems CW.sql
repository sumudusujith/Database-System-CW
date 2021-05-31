-- Database Systems CW

-- Company table
CREATE TABLE W17901147_Company
(
W17901147_compCode INT(8),
W17901147_compName VARCHAR(30) UNIQUE NOT NULL,
W17901147_compDescrip VARCHAR(30) NOT NULL,
CONSTRAINT PK_W17901147_compCode PRIMARY KEY (W17901147_compCode)
);


-- Staff Table
CREATE TABLE W17901147_Staff
(
W17901147_staffId INT(15),
W17901147_staffFullName VARCHAR(30) UNIQUE NOT NULL,
W17901147_staffPosition VARCHAR(30) NOT NULL,
W17901147_staffEmail VARCHAR(40) UNIQUE NOT NULL,
W17901147_compCode INT(8)NOT NULL,
CONSTRAINT PK_W17901147_staffId PRIMARY KEY (W17901147_staffId),
CONSTRAINT FK_W17901147_Company_compCode FOREIGN KEY (W17901147_compCode)
REFERENCES W17901147_Company(W17901147_compCode)
);

-- Offer Table
CREATE TABLE W17901147_Offer
(
W17901147_offerCode INT (7),
W17901147_offerName VARCHAR(20) UNIQUE NOT NULL,
W17901147_offerDescrip VARCHAR(50) NOT NULL,
W17901147_offerDeadline DATE,
W17901147_offerStartDate DATE,
W17901147_compCode INT(8) NOT NULL,
CONSTRAINT PK_W17901147_Offer_offerCode PRIMARY KEY(W17901147_offerCode),
CONSTRAINT FK_W17901147_Offer_compCode FOREIGN KEY(W17901147_compCode)
REFERENCES W17901147_Company(W17901147_compCode)
);

-- Data insert to company table
INSERT INTO
W17901147_Company (W17901147_compCode, W17901147_compName, W17901147_compDescrip)
VALUES
(1001,'Lokeey finance',"We providing big loans "),
(1002,'Subhuthi Technologies',"We provide techies.."),
(1003,'Sam pvt Ltd',"We take the all work problems.");

-- Data insert to staff table
INSERT INTO
W17901147_Staff
(W17901147_staffId,W17901147_staffFullName,W17901147_staffPosition,W17901147_staffEmail,W17901147_compCode
)
VALUES
(2001,'Josh Perera','Finance Director','joshi9@gmail.com',1001),
(2002,'Vicoria bliss','IT Manager','vic1221@gmail.com',1002),
(2003,'Andrew simon','Senior Project Manager','simon11@gmail.com',1003),
(2004,'Issac mendis','System Analyst','99isaac@gmail.com',1002);

-- Data insert to offer table
INSERT INTO
W17901147_Offer (W17901147_offerCode, W17901147_offerName, W17901147_offerDescrip,W17901147_offerDeadline
,W17901147_offerStartDate,W17901147_compCode)
VALUES
(0001,'shoppy dealz',"This sale during weekends,you can get more deals.",'2020-10-29','2020-11-15',1001),
(0002,'christmas Z',"Buy one drive from our stores,get one free.",'2020-12-22','2020-12-25',1003),
(0003,'Half of dozen',"It’s a more effiecient offer to get six caps.",'2020-09-05','2020-10-05',1001),
(0004,'new year sale',"This sale is more famous than it looks.",'2020-10-17','2020-10-27',1002),
(0005,'hayday',"This sale is give 25% offer.",'2020-08-17','2020-09-27',1003);

-- Write a SQL query to retrieve a list of company codes and company names and for each company the
-- number of staff that they employ, making sure that the header shows the number of employees in
-- each company as “Number of staff”.

SELECT c.W17901147_compName, c.W17901147_compCode, COUNT(s.W17901147_compCode)AS "Number of Staff"
FROM W17901147_Staff s
JOIN W17901147_Company c
ON c.W17901147_compCode = s.W17901147_compCode
GROUP BY s.W17901147_compCode

-- Write a SQL query that displays a list of company names along the names and positions of staff they
-- employ and the names and descriptions of the offers they prop
SELECT
c.W17901147_compName,s.W17901147_staffFullName,s.W17901147_staffPosition,o.W17901147_offerName,o.W179011
47_offerDescrip
FROM W17901147_Company c JOIN W17901147_Staff s
ON c.W17901147_compCode=s.W17901147_compCode
JOIN W17901147_Offer o
ON c.W17901147_compCode=o.W17901147_compCode