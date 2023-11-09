create database BBMS;
use BBMS;
CREATE TABLE BB_Manager
( M_id int NOT NULL PRIMARY KEY,
 mName varchar(100) NOT NULL,
 m_phNo bigint
);
CREATE TABLE Blood_Donor
( bd_ID int NOT NULL PRIMARY KEY,
 bd_name varchar(100) NOT NULL,
 bd_age varchar(100),
 bd_sex varchar(100),
 bd_Bgroup varchar(10),
 bd_reg_date date,
 reco_ID int NOT NULL,
 City_ID int NOT NULL,
 FOREIGN KEY(reco_ID) REFERENCES Recording_Staff(reco_ID),
 FOREIGN KEY(City_ID) REFERENCES City(City_ID)
);
CREATE TABLE BloodSpecimen
( specimen_number int NOT NULL,
 b_group varchar(10) NOT NULL,
 status int,
 dfind_ID int NOT NULL,
 M_id int NOT NULL,
primary key (specimen_number,b_group),
FOREIGN KEY(M_id) REFERENCES Manager(M_id),
FOREIGN KEY(dfind_ID) REFERENCES DiseaseFinder(dfind_ID)
);
CREATE TABLE City
( City_ID int NOT NULL PRIMARY KEY,
 City_name varchar(100) NOT NULL
);
CREATE TABLE DiseaseFinder
( dfind_ID int NOT NULL PRIMARY KEY,
 dfind_name varchar(100) NOT NULL,
 dfind_PhNo bigint
);
CREATE TABLE Hospital_Info_1
( hosp_ID int NOT NULL,
 hosp_name varchar(100) NOT NULL,
 City_ID int NOT NULL,
 M_id int NOT NULL,
 primary key(hosp_ID),
 FOREIGN KEY(M_id) REFERENCES Manager(M_id),
 FOREIGN KEY(City_ID) REFERENCES City(City_ID)
);
CREATE TABLE Hospital_Info_2
( hosp_ID int NOT NULL,
 hosp_name varchar(100) NOT NULL,
 hosp_needed_Bgrp varchar(10),
 hosp_needed_qnty int,
 primary key(hosp_ID,hosp_needed_Bgrp)
);
CREATE TABLE Recipient
( reci_ID int NOT NULL PRIMARY kEY,
 reci_name varchar(100) NOT NULL,
 reci_age varchar(10),
 reci_Brgp varchar(100),
 reci_Bqnty float,
 reco_ID int NOT NULL,
 City_ID int NOT NULL,
 M_id int NOT NULL,
 FOREIGN KEY(M_id) REFERENCES Manager(M_id),
 FOREIGN KEY(City_ID) REFERENCES City(City_ID)
);
Alter table Recipient
ADD reci_sex varchar(100);
Alter table Recipient
ADD reci_reg_date date;
CREATE TABLE Recording_Staff
( reco_ID int NOT NULL PRIMARY KEY,
 reco_Name varchar(100) NOT NULL,
 reco_phNo bigint
);
