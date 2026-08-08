-- ==========================================================
-- Project : Hospital Database Management System
-- File    : 08_views.sql
-- Purpose : To understand and perform different SQL views
-- Author  : Saniya Godikat
-- ==========================================================


USE HospitalDB;

-- =====================================================
--  CREATE A BASIC VIEW
--    Patient Information
-- =====================================================

CREATE VIEW PatientInfo AS
SELECT
    PatientID,
    FirstName,
    DOB,
    Gender
FROM Patients;

SELECT * FROM PatientInfo;

-- =====================================================
--  VIEW WITH WHERE CONDITION
--    Gender is Other
-- =====================================================

CREATE VIEW MalePatients AS
SELECT *
FROM Patients
WHERE Gender = 'Other';

SELECT * FROM MalePatients;

-- =====================================================
--  VIEW WITH SELECTED COLUMNS
--    Patient Contact Details
-- =====================================================

CREATE VIEW PatientDetails AS
SELECT
    PatientID,
    FirstName,
    PatientCity
FROM Patients;

SELECT * FROM PatientDetails;

-- =====================================================
--  VIEW WITH MULTIPLE CONDITIONS
--    Patients FirstName is Rahul and from Pune
-- =====================================================

CREATE VIEW PunePatients AS
SELECT *
FROM Patients
WHERE PatientCity = 'Pune'
AND FirstName = 'Rahul';

SELECT * FROM PunePatients;

-- =====================================================
--  VIEW USING INNER JOIN
--    Appointment + Patient
-- =====================================================

CREATE VIEW PatientAppointments AS
SELECT
    A.AppointmentID,
    P.PatientID,
    P.FirstName,
    A.AppointmentDate,
    A.ConsultationFee
FROM Appointments A
INNER JOIN Patients P
    ON A.PatientID = P.PatientID;

SELECT * FROM PatientAppointments;

-- =====================================================
--  VIEW USING INNER JOIN
--    Appointment + Doctor
-- =====================================================

CREATE VIEW DoctorAppointments AS
SELECT
    A.AppointmentID,
    D.DoctorID,
    D.DoctorName,
    D.Specialization,
    A.AppointmentDate,
    A.ConsultationFee
FROM Appointments A
INNER JOIN Doctors D
    ON A.DoctorID = D.DoctorID;

SELECT * FROM DoctorAppointments;


-- =====================================================
--  VIEW USING MULTIPLE INNER JOINS
--    Patient + Doctor + Appointment
-- =====================================================

CREATE VIEW HospitalAppointments AS
SELECT
    A.AppointmentID,
    P.FirstName,
    D.DoctorName,
    D.Specialization,
    A.AppointmentDate,
    A.ConsultationFee
FROM Appointments A
INNER JOIN Patients P
    ON A.PatientID = P.PatientID
INNER JOIN Doctors D
    ON A.DoctorID = D.DoctorID;

SELECT * FROM HospitalAppointments;


-- =====================================================
--  VIEW USING AGGREGATE FUNCTION
--    Average Consultation Fee by Doctor
-- =====================================================

CREATE VIEW DoctorAverageFee AS
SELECT
    DoctorID,
    AVG(ConsultationFee) AS AverageFee
FROM Appointments
GROUP BY DoctorID;

SELECT * FROM DoctorAverageFee;


-- =====================================================
--  VIEW USING AGGREGATE FUNCTION
--    Number of Appointments by Doctor
-- =====================================================

CREATE VIEW DoctorAppointmentCount AS
SELECT
    DoctorID,
    COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY DoctorID;

SELECT * FROM DoctorAppointmentCount;


-- =====================================================
--  UPDATABLE VIEW
--    Patients from Pune
-- =====================================================

CREATE VIEW PunePatientView AS
SELECT *
FROM Patients
WHERE PatientCity = 'Pune';

SELECT * FROM PunePatientView;


-- =====================================================
--  UPDATE DATA THROUGH VIEW
-- =====================================================

UPDATE PunePatientView
SET PatientCity = 'Mumbai'
WHERE PatientID = 104;

SELECT * FROM Patients;


-- =====================================================
--  INSERT DATA THROUGH VIEW
-- =====================================================

SELECT * FROM Patients;

INSERT INTO PunePatientView
VALUES
(150, 'Saniya','Abdulsattar','Female', '2003-07-08',7777009901, 'Pune');

SELECT * FROM Patients;


-- =====================================================
--  ALTER VIEW
--    Add City and Phone Column
-- =====================================================

SELECT * FROM PatientInfo;

ALTER VIEW PatientInfo AS
SELECT
    PatientID,
    FirstName,
    Gender,
    PatientCity,
    Phone
FROM Patients;

SELECT * FROM PatientInfo;


-- =====================================================
--  VIEW WITH COLUMN ALIASES
-- =====================================================

CREATE VIEW PatientAgeDetails AS
SELECT
    FirstName AS Patient,
    DOB AS PatientDOB
FROM Patients;

SELECT * FROM PatientAgeDetails;


-- =====================================================
--  NESTED VIEW
--    Step 1: Doctors with Cardiology Specialization
-- =====================================================

CREATE VIEW CardiologyDoctors AS
SELECT *
FROM Doctors
WHERE Specialization = 'Cardiology';


-- =====================================================
--  NESTED VIEW
--    Step 2: Cardiology Doctors with their Appointments
-- =====================================================

CREATE VIEW CardiologyAppointments AS
SELECT
    D.DoctorID,
    D.DoctorName,
    D.Specialization,
    A.AppointmentID,
    A.AppointmentDate,
    A.ConsultationFee
FROM CardiologyDoctors D
INNER JOIN Appointments A
    ON D.DoctorID = A.DoctorID;

SELECT * FROM CardiologyAppointments;


-- =====================================================
--  PUBLIC VIEW
--    Hide Sensitive Patient Information
-- =====================================================

CREATE VIEW PatientPublic AS
SELECT
    PatientID,
    FirstName,
    DOB,
    Gender,
    PatientCity
FROM Patients;

SELECT * FROM PatientPublic;


-- =====================================================
--  DROP VIEW
-- =====================================================

DROP VIEW PatientPublic;


-- =====================================================
--  VERIFY ALL CREATED VIEWS
-- =====================================================

SELECT * FROM PatientInfo;
SELECT * FROM MalePatients;
SELECT * FROM PatientDetails;
SELECT * FROM PunePatients;
SELECT * FROM PatientAppointments;
SELECT * FROM DoctorAppointments;
SELECT * FROM HospitalAppointments;
SELECT * FROM DoctorAverageFee;
SELECT * FROM DoctorAppointmentCount;
SELECT * FROM PatientAgeDetails;
SELECT * FROM PunePatientView;
SELECT * FROM CardiologyDoctors;
SELECT * FROM CardiologyAppointments;

