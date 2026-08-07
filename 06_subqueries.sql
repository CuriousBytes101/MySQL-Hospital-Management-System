-- ==========================================================
-- Project : Hospital Database Management System
-- File    : 06_subqueries.sql
-- Purpose : Demonstrate SQL Subqueries
-- Author  : Saniya Godikat
-- ==========================================================

USE HospitalDB;

-- =========================================
-- SUBQUERIES
-- =========================================

-- =========================================
-- SCALAR SUBQUERY
-- =========================================
SELECT MAX(Salary) FROM Doctors;

-- Display the doctor with the highest salary
SELECT * FROM Doctors 
WHERE Salary =
(
   SELECT MAX(Salary)
   FROM Doctors
 );
 
-- =========================================
-- SUBQUERY WITH AGGREGATE FUNCTION
-- ========================================= 
 
-- Display appointments with consultation fees greater than the average fee
SELECT * FROM Appointments
WHERE ConsultationFee>
(
  SELECT AVG(ConsultationFee)
  FROM Appointments
);

-- =========================================
-- SUBQUERY WITH IN OPERATOR
-- =========================================

-- Display doctors who have appointments
SELECT * FROM Doctors
WHERE DoctorID IN
(
  SELECT DoctorID 
  FROM Appointments
);
--  SELECT DISTINCT DoctorID FROM Appointments;

-- =========================================
-- SUBQUERY WITH WHERE CLAUSE
-- =========================================

-- Display all patients who belong to the same city as Rahul
SELECT * FROM Patients                 
WHERE City =                  
(
   SELECT City
   FROM Patients
   WHERE FirstName = 'Rahul'              
);

-- =========================================
-- NESTED SUBQUERY
-- =========================================

-- Display the doctor with the second highest salary
SELECT * FROM Doctors
WHERE Salary =
(
   SELECT MAX(Salary)                    
   FROM Doctors
   WHERE Salary <
   (
     SELECT MAX(Salary)                  
     FROM Doctors
   )
);
-- select * from doctors;
-- select max(salary) from doctors;  -- 150000

-- =========================================
-- SUBQUERY WITH JOIN
-- =========================================

-- Display patients whose consultation fee is greater than the average consultation
SELECT P.PatientID,P.FirstName,A.ConsultationFee
FROM Patients P
JOIN Appointments A
ON P.PatientID = A.PatientID
WHERE ConsultationFee >
(
     SELECT AVG(ConsultationFee)           

     FROM Appointments          
);

--  SELECT AVG(ConsultationFee)  FROM Appointments   -- output :'798.750000'

-- =========================================
-- MULTIPLE NESTED SUBQUERIES
-- =========================================

-- Display details of patients treated by the highest-paid doctor
SELECT * FROM Patients     
WHERE PatientID IN 
(
    SELECT PatientID            
    FROM Appointments
    WHERE DoctorID = 
    (
      SELECT DoctorID         
      FROM Doctors
      WHERE Salary =
      (
        SELECT MAX(Salary)     
        FROM Doctors
      )
     )
     
);

-- ==========================================================
-- SUBQUERY WITH HAVING
-- ==========================================================

-- Finds doctors who have treated more patients than the
-- average number of patients treated by all doctors.
SELECT DoctorID,COUNT(PatientID) AS TotalPatients
FROM Appointments
GROUP BY DoctorID
HAVING COUNT(PatientID) >
( 
   SELECT AVG(PatientCount)
   FROM 
   (
     SELECT COUNT(PatientID) AS PatientCount
     FROM Appointments
     GROUP BY DoctorID
	) AS AvgPatients
);




