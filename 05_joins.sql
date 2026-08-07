-- ==========================================================
-- Project : Hospital Database Management System
-- File    : 05_joins.sql
-- Purpose : Demonstrate SQL JOIN Operations
-- Author  : Saniya Godikat
-- ==========================================================

USE HospitalDB;

-- =========================================
-- JOINS
-- =========================================

-- Display Specialization  and their Appointments
SELECT 
      D.specialization,A.appointmentID
FROM Doctors D 
JOIN Appointments A
ON D.DoctorID = A.DoctorID;

-- =========================================
-- INNER JOIN
-- =========================================

-- Display PatientName & their AppointmentDates
SELECT 
      P.FirstName,A.AppointmentDate
FROM Patients P
INNER JOIN Appointments A
ON P.PatientID = A.PatientID;

-- =========================================
-- LEFT JOIN
-- =========================================

-- Display all Patients and their Appointment IDs 
SELECT 
      P.FirstName,A.AppointmentID
FROM Patients P 
LEFT JOIN Appointments A
ON P.PatientID = A.PatientID;

-- =========================================
-- RIGHT JOIN
-- =========================================

-- Display Patientid And All Appointments
SELECT 
      P.FirstName,A.AppointmentID
FROM Patients P 
RIGHT JOIN Appointments A
ON P.PatientID = A.PatientID;


-- =========================================
-- MULTIPLE TABLE JOINS
-- =========================================

SELECT
      P.FirstName ,P.LastName,D.DoctorName
FROM Patients P
INNER JOIN Appointments A
ON P.PatientID = A.PatientID
INNER JOIN Doctors D
ON A.DoctorID = D.DoctorID;

SELECT 
       P.FirstName ,P.LastName,D.DoctorName
FROM Patients P
LEFT JOIN Appointments  A
ON P.PatientID = A.PatientID
LEFT JOIN Doctors D
ON D.DoctorID = A.DoctorID;

SELECT 
      P.FirstName ,P.LastName,D.DoctorName
FROM Patients P
RIGHT JOIN Appointments A
ON P.PatientID = A.PatientID
RIGHT JOIN Doctors D
ON D.DoctorID = A.DoctorID;

-- =========================================
-- UNION
-- =========================================
SELECT 
       P.FirstName ,P.LastName,D.DoctorName
FROM Patients P
LEFT JOIN Appointments  A
ON P.PatientID = A.PatientID
LEFT JOIN Doctors D
ON D.DoctorID = A.DoctorID
UNION
SELECT 
      P.FirstName ,P.LastName,D.DoctorName
FROM Patients P
RIGHT JOIN Appointments A
ON P.PatientID = A.PatientID
RIGHT JOIN Doctors D
ON D.DoctorID = A.DoctorID;

SELECT 
       P.FirstName,P.LastName,D,DoctorName,A.AppointmentDate
FROM Patients P
JOIN Appointment A 
ON P.PatientID = A.PatientsID
JOIN Doctors D
ON A.DoctorID = D.DoctorID;

-- =========================================
-- JOIN WITH AGGREGATE FUNCTION
-- =========================================
SELECT D.DoctorName,COUNT(A.PatientID) AS TotalPatients
FROM Doctors D
JOIN Appointments A
ON D.DoctorID = A.DoctorID
GROUP BY D.DoctorName;

-- SELECT 
--        P.FirstName,D.DoctorName
-- FROM Patients P
-- JOIN Appointments A
-- ON P.PatientID = A.PatientID
-- JOIN Doctors D
-- ON A.DoctorID = D.DoctorID
-- WHERE P.Gender= 'Male';

-- =========================================
-- JOIN WITH WHERE CLAUSE
-- =========================================
SELECT 
      D.DoctorName,A.ConsultationFee
FROM Doctors D
JOIN Appointments A
ON D.DoctorID = A.DoctorID
WHERE ConsultationFee > 700;
