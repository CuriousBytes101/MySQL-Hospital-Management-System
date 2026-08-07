-- ==========================================================
-- Project : Hospital Database Management System
-- File    : 02_sql_commands.sql
-- Purpose : Demonstrate DDL, DML and DQL Commands
-- Author  : Saniya Godikat
-- ==========================================================

USE HospitalDB;

-- ========================================================================================================
-- DML (Data Manipulation Language)
-- Used to Insert, Update and Delete records from a table.
-- ========================================================================================================

-- =========================================
-- INSERT
-- =========================================

-- Insert a complete record into the Patients table
INSERT INTO Patients VALUES(121, 'Aarav', 'Verma', 'Male', '1998-07-15', '9876543230', 'Pune');

-- Insert data by specifying column names
INSERT INTO Patients(PatientID,FirstName,LastName,Gender,DOB,Phone,City)
VALUES(151,'Shruti','Kapoor','Female','2002-06-01','7777771090','Nagpur');


-- =========================================
-- UPDATE
-- =========================================

-- Update a single column value
UPDATE Patients
SET Gender = 'Others'
WHERE PatientID = 121;

-- Update multiple column values
UPDATE Patients
SET FirstName = 'Aaravi',Gender = 'Female',City = 'Mumbai'
WHERE PatientID = 121;

-- Verify the updated record
SELECT * FROM Patients
WHERE PatientID = 121;

-- Disable safe update mode (Use with caution)
SET sql_safe_updates = 0;

-- Update all rows in the table
UPDATE Patients
SET Gender = 'Other';

-- Display all patient records
SELECT * FROM Patients;


-- =========================================
-- DELETE
-- =========================================

-- Delete a single record
DELETE FROM Patients
WHERE PatientId = '121';

-- Delete multiple records matching the condition
DELETE FROM Patients
WHERE Gender = 'Female';

-- Delete all records while keeping the table structure
DELETE FROM Patients;


-- =========================================================================================================
-- DQL (Data Query Language)
-- Used to retrieve data from database tables.
-- =========================================================================================================

-- Display all columns from the Appointments table
SELECT * FROM Appointments;

-- Display only the FirstName column
SELECT FirstName FROM Patients;

-- Display doctor names along with their specialization
SELECT DoctorName,Specialization
FROM Doctors;

-- Display doctors whose specialization is Cardiology
SELECT DoctorName,Specialization
FROM Doctors
WHERE Specialization = 'Cardiology';


-- =================================================================================
-- DDL (Data Definition Language)
-- Used to create and modify database objects.
-- =================================================================================

-- CREATE DATABASE → Creates a new database
-- CREATE TABLE    → Creates a new table


-- =========================================
-- ALTER TABLE
-- =========================================

-- Add a new column to the Patients table
ALTER TABLE Patients
ADD Email VARCHAR(100);

-- Verify the updated table structure
DESCRIBE Patients;

-- Modify the data type of an existing column
ALTER TABLE Patients
MODIFY Phone VARCHAR(20);

-- Rename an existing column
ALTER TABLE Patients
RENAME COLUMN City TO PatientCity;

-- Remove an existing column
ALTER TABLE Patients
DROP COLUMN Email;

-- =========================================
-- DROP TABLE
-- =========================================

-- Permanently delete the table along with its structure
DROP TABLE Patients;

-- =========================================
-- TRUNCATE TABLE
-- =========================================

-- Remove all records while keeping the table structure
TRUNCATE TABLE Patients;


-- =========================================
-- FILTERING, SORTING & LIMITING
-- ORDER BY, LIMIT, OFFSET, BETWEEN, IN, LIKE
-- =========================================

-- Sort patient names in ascending order
SELECT * FROM Patients
ORDER BY FirstName ASC;

-- Sort doctors by salary in descending order
SELECT DoctorName,Salary FROM Doctors
ORDER BY Salary DESC;

-- Display the top 3 highest-paid doctors
SELECT DoctorName,Salary
FROM Doctors
ORDER BY Salary DESC
LIMIT 3;

-- Display 5 patients after skipping the first 2 records
SELECT FirstName,DOB
FROM Patients
ORDER BY DOB DESC
LIMIT 5 OFFSET 2;

-- =========================================
-- BETWEEN
-- =========================================

-- Display doctors whose salary is between 50,000 and 100,000
SELECT * FROM Doctors
WHERE Salary BETWEEN 50000 AND 100000;

-- Display patients born between 1995 and 2000
SELECT * FROM Patients
WHERE DOB BETWEEN
'1995-01-01' AND '2000-01-01';

-- =========================================
-- IN
-- =========================================

-- Display patients from Pune and Nashik
SELECT FirstName,City FROM Patients
WHERE City IN ('Pune','Nashik');


-- =========================================
-- LIKE
-- =========================================

-- Display names starting with 'S'
SELECT FirstName FROM Patients
WHERE FirstName LIKE 'S%';

-- Display cities ending with 'E'
SELECT City FROM Patients
WHERE City LIKE '%E';

-- Display cities containing 'um'
SELECT City FROM Patients
WHERE City LIKE '%um%';