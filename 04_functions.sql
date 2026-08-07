-- ==========================================================
-- Project : Hospital Database Management System
-- File    : 04_functions.sql
-- Purpose : Demonstrate SQL Functions
-- Author  : Saniya Godikat
-- ==========================================================

USE HospitalDB;

-- ==========================================================
-- STRING FUNCTIONS
-- UPPER(), LOWER(), LENGTH(), CONCAT(), LEFT(), RIGHT(),
-- SUBSTRING(), TRIM(), REPLACE(), REVERSE()
-- ==========================================================

-- Convert patient first names to uppercase
SELECT UPPER(FirstName) AS UpperName
FROM Patients;

-- Convert doctor names to lowercase
SELECT LOWER(DoctorName) AS LowerName
FROM Doctors;

-- Display the length of each patient's first name
SELECT FirstName,LENGTH(FirstName) AS NameLength
FROM Patients;

-- Combine first name and last name into a full name
SELECT CONCAT(FirstName,' ',LastName) AS FullName
FROM Patients;

-- Display the first 3 characters of the patient's first name
SELECT FirstName,LEFT(FirstName,3) AS FirstThree
FROM Patients;

-- Display the last 2 characters of the patient's first name
SELECT FirstName,RIGHT(FirstName,2) AS LastTwo
FROM Patients;

-- Extract the first 3 characters using SUBSTRING()
SELECT SUBSTRING(FirstName,1,3) AS NamePart
FROM Patients;

-- Remove leading and trailing spaces from first names
SELECT TRIM(FirstName) AS CleanedName
FROM Patients;

-- Replace 'Mumbai' with 'Bombay' in the City column
SELECT REPLACE(City,'Mumbai','Bombay')  AS replaced_city
FROM Patients;

-- Replace a specific phone number with a new phone number
SELECT REPLACE(Phone,9876543210,9999999999)
FROM Patients;

-- Reverse the characters of each patient's first name
SELECT reverse(FirstName) as ReversedName
FROM Patients;

-- ==========================================================
-- NUMERIC / MATHEMATICAL FUNCTIONS
-- ROUND(), CEIL(), FLOOR(), ABS(), MOD(), POWER(), SQRT()
-- ==========================================================

-- Round the average value of the amount column
SELECT ROUND(AVG(amount))
FROM transactions;

-- Round a decimal number to the nearest whole number
SELECT ROUND(1256.75) AS Rounded_value;

-- Round a decimal number up to the nearest integer
SELECT CEIL(1256.25) AS Ceil_value;

-- Round a decimal number down to the nearest integer
SELECT FLOOR(1256.75) AS Floor_Value;

-- Return the absolute (positive) value of a number
SELECT ABS(-2500) AS Abs_Value;

-- Return the remainder after division
SELECT MOD(25,4) AS Remainder;         -- MOD(dividend, divisor)

-- Return the square root of a number
SELECT SQRT(16) AS Sq_root;

-- =========================================
-- DATETIME FUNCTIONS
-- MONTH(), YEAR(), DAYNAME(),
-- TIMESTAMPDIFF(), DATEDIFF(),
-- DATE_ADD(), DATE_SUB()
-- =========================================

-- Display the month from the appointment date
SELECT MONTH(AppointmentDate)
FROM Appointments;

-- Display the joining year of each doctor
SELECT JoiningDate,YEAR(JoiningDate)
FROM Doctors;

-- Display the day name of each appointment
SELECT AppointmentDate,DAYNAME(AppointmentDate) as Day
FROM Appointments;

-- Calculate the age of each patient
SELECT FirstName,
TIMESTAMPDIFF(YEAR,DOB,CURDATE()) AS AGE
FROM Patients;

-- Calculate the number of days between today and the appointment date
SELECT AppointmentID,
DATEDIFF(CURDATE(),AppointmentDate)
FROM Appointments;

-- Add 10 days to the appointment date
SELECT AppointmentDate,
DATE_ADD(AppointmentDate ,INTERVAL 10 DAY) AS renewed_appointment
FROM Appointments;

-- Subtract 2 months from the appointment date
SELECT AppointmentDate,
DATE_SUB(AppointmentDate,INTERVAL 2 MONTH) AS renewed_appointment
FROM Appointments;

-- =========================================
-- AGGREGATE FUNCTIONS & GROUP BY/HAVING
-- =========================================
-- Calculate the total salary of all doctors
SELECT SUM(Salary) AS Total_Salary
FROM Doctors;

-- Find the minimum salary among all doctors
SELECT MIN(Salary) AS Min_Salary
FROM Doctors;

-- Find the maximum salary among all doctors
SELECT MAX(Salary) AS Max_Salary
FROM Doctors;

-- Calculate the average salary of all doctors
SELECT AVG(Salary) AS Avg_Salary
FROM Doctors;

-- Count the total number of records in the Doctors table
SELECT COUNT(*) AS TotalRecords
FROM Doctors;

-- =========================================
-- GROUP BY
-- =========================================

-- Calculate the average salary for each specialization
SELECT Specialization,AVG(Salary) AS Avg_Salary
FROM Doctors
GROUP BY Specialization;

-- =========================================
-- HAVING
-- =========================================

-- Display specializations with an average salary greater than 90,000
SELECT Specialization,AVG(Salary) AS Avg_Salary
FROM Doctors
GROUP BY Specialization
HAVING Avg_Salary>90000;