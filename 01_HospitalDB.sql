-- ==========================================================
-- Project : Hospital Database Management System
-- File    : 01_hospitalDB.sql
-- Purpose : Create HospitalDB and insert sample data
-- Author  : Saniya Godikat
-- ==========================================================

-- =========================================
-- Create Database
-- =========================================

DROP DATABASE IF EXISTS HospitalDB;
CREATE DATABASE HospitalDB ;
USE HospitalDB;

-- =========================================
-- Create Patients Table
-- =========================================
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    Phone VARCHAR(15),
    City VARCHAR(50)
);

-- =========================================
-- Create Doctors Table
-- =========================================
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    Specialization VARCHAR(50),
    Salary DECIMAL(10,2),
    JoiningDate DATE
);

-- =========================================
-- Create Appointment Table
-- =========================================
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    ConsultationFee DECIMAL(8,2),
    Diagnosis VARCHAR(100),

    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

 -- =========================================
-- Insert Patients Records
-- =========================================

INSERT INTO Patients VALUES
(101,'Rahul','Sharma','Male','1998-05-12','9876543210','Pune'),
(102,'Priya','Patil','Female','2000-10-20','9876543211','Mumbai'),
(103,'Amit','Joshi','Male','1995-08-18','9876543212','Nagpur'),
(104,'Sneha','Kulkarni','Female','1999-01-25','9876543213','Pune'),
(105,'Rohan','Deshmukh','Male','2002-06-11','9876543214','Nashik'),
(106,'Anjali','Desai','Female','1997-03-14','9876543215','Mumbai'),
(107,'Karan','Shinde','Male','1994-11-22','9876543216','Pune'),
(108,'Neha','More','Female','2001-07-09','9876543217','Nagpur'),
(109,'Vikas','Pawar','Male','1996-02-28','9876543218','Nashik'),
(110,'Pooja','Jadhav','Female','1993-12-05','9876543219','Pune'),
(111,'Arjun','Kale','Male','2000-04-17','9876543220','Mumbai'),
(112,'Riya','Bhosale','Female','1998-09-30','9876543221','Kolhapur'),
(113,'Aditya','Chavan','Male','1992-01-19','9876543222','Pune'),
(114,'Isha','Gore','Female','2003-05-26','9876543223','Nashik'),
(115,'Sahil','Mane','Male','1999-10-08','9876543224','Nagpur'),
(116,'Meera','Joshi','Female','1995-06-21','9876543225','Mumbai'),
(117,'Akash','Wagh','Male','2001-02-13','9876543226','Pune'),
(118,'Tanvi','Rane','Female','1997-08-03','9876543227','Kolhapur'),
(119,'Nikhil','Sawant','Male','1990-11-11','9876543228','Nashik'),
(120,'Simran','Khan','Female','2002-12-24','9876543229','Mumbai');

DESCRIBE Patients;
SELECT * FROM Patients;
-- =========================================
-- Insert Doctor Records
-- =========================================

INSERT INTO Doctors VALUES
(1,'Dr. Mehta','Cardiology',120000,'2018-06-10'),
(2,'Dr. Singh','Orthopedic',95000,'2019-02-20'),
(3,'Dr. Shah','Neurology',150000,'2017-11-15'),
(4,'Dr. Patil','Pediatrics',85000,'2020-08-25'),
(5,'Dr. Rao','Dermatology',110000,'2018-03-12'),
(6,'Dr. Kapoor','General Medicine',75000,'2021-01-18'),
(7,'Dr. Joshi','Gynecology',130000,'2016-09-05'),
(8,'Dr. Kulkarni','ENT',90000,'2019-12-10'),
(9,'Dr. Desai','Ophthalmology',105000,'2022-04-22'),
(10,'Dr. Khan','Dentistry',80000,'2020-06-15');

DESCRIBE Doctors;
SELECT * FROM Doctors;

-- =========================================
-- Insert Appointments Record
-- =========================================

INSERT INTO Appointments VALUES
(1001,101,1,'2025-07-10 10:30:00',800,'Heart Checkup'),
(1002,102,2,'2025-07-11 11:00:00',600,'Fracture'),
(1003,103,3,'2025-07-12 09:15:00',1200,'Migraine'),
(1004,104,4,'2025-07-13 16:00:00',500,'Fever'),
(1005,105,2,'2025-07-14 14:30:00',700,'Knee Pain'),

(1006,106,5,'2025-07-15 10:00:00',900,'Skin Allergy'),
(1007,107,1,'2025-07-16 11:30:00',1000,'Chest Pain'),
(1008,108,3,'2025-07-17 09:45:00',1100,'Headache'),
(1009,109,6,'2025-07-18 14:00:00',500,'Cold'),
(1010,110,7,'2025-07-19 16:30:00',900,'Routine Checkup'),

(1011,111,8,'2025-07-20 10:15:00',600,'Ear Infection'),
(1012,112,9,'2025-07-21 11:00:00',750,'Eye Checkup'),
(1013,113,2,'2025-07-22 15:00:00',800,'Back Pain'),
(1014,114,6,'2025-07-23 09:30:00',450,'Fever'),
(1015,115,10,'2025-07-24 12:00:00',700,'Toothache'),

(1016,116,1,'2025-08-01 10:30:00',850,'Heart Checkup'),
(1017,117,2,'2025-08-02 13:15:00',650,'Joint Pain'),
(1018,118,5,'2025-08-03 15:30:00',950,'Acne'),
(1019,119,3,'2025-08-04 11:45:00',1300,'Migraine'),
(1020,120,7,'2025-08-05 16:00:00',1000,'Health Checkup'),

(1021,101,6,'2025-08-06 09:00:00',550,'Flu'),
(1022,102,1,'2025-08-07 10:45:00',950,'Blood Pressure'),
(1023,103,3,'2025-08-08 14:30:00',1250,'Severe Headache'),
(1024,104,8,'2025-08-09 15:15:00',600,'Sore Throat'),
(1025,105,2,'2025-08-10 11:30:00',750,'Knee Pain'),

(1026,106,9,'2025-08-11 13:00:00',800,'Vision Problem'),
(1027,107,10,'2025-08-12 14:45:00',650,'Dental Cleaning'),
(1028,108,5,'2025-08-13 10:00:00',850,'Skin Rash'),
(1029,109,6,'2025-08-14 11:15:00',500,'Cough'),
(1030,110,7,'2025-08-15 16:15:00',950,'Women Health'),

(1031,111,8,'2025-08-16 09:30:00',550,'Sinus Problem'),
(1032,112,9,'2025-08-17 12:30:00',700,'Eye Infection'),
(1033,113,1,'2025-08-18 15:00:00',900,'Heart Checkup'),
(1034,114,6,'2025-08-19 10:30:00',500,'Viral Fever'),
(1035,115,10,'2025-08-20 13:45:00',800,'Dental Pain'),

(1036,116,3,'2025-08-21 11:00:00',1200,'Migraine'),
(1037,117,2,'2025-08-22 14:15:00',700,'Shoulder Pain'),
(1038,118,5,'2025-08-23 15:45:00',1000,'Hair Loss'),
(1039,119,6,'2025-08-24 09:15:00',550,'Cold'),
(1040,120,7,'2025-08-25 16:30:00',950,'Routine Checkup');

DESCRIBE Appointments;
SELECT * FROM Appointments;
