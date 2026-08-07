-- ==========================================================
-- Project : Hospital Database Management System
-- File    : 07_window_function.sql
-- Purpose : To understand and perform different window functions
-- Author  : Saniya Godikat
-- ==========================================================

USE HospitalDB;

-- ==========================================================
-- ROW_NUMBER()
-- ==========================================================

-- Assigns a unique sequential number to each appointment
-- based on Consultation Fee in descending order.
SELECT AppointmentID,DoctorID,ConsultationFee,
ROW_NUMBER() OVER(ORDER BY ConsultationFee DESC) AS RowNo
FROM Appointments;

-- ==========================================================
-- RANK()
-- ==========================================================

-- Assigns ranks to appointments based on Consultation Fee.
-- Tied values receive the same rank and the next rank is skipped.
SELECT AppointmentID,DoctorID,ConsultationFee,
RANK() OVER(ORDER BY ConsultationFee DESC) AS FeeRank
FROM Appointments;

-- ==========================================================
-- DENSE_RANK()
-- ==========================================================

-- Assigns consecutive ranks without skipping numbers
-- for tied Consultation Fee values.
SELECT AppointmentID,DoctorID,ConsultationFee,
DENSE_RANK() OVER(ORDER BY ConsultationFee DESC) AS DenseRank
FROM Appointments;

-- ==========================================================
-- NTILE()
-- ==========================================================

-- Divides appointments into four equal groups
-- based on Consultation Fee.
SELECT AppointmentID,DoctorID,ConsultationFee,
NTILE(4) OVER(ORDER BY ConsultationFee DESC) AS Quartile
FROM Appointments;

-- ==========================================================
-- LEAD()
-- ==========================================================

-- Displays the Consultation Fee of the next appointment
-- based on Appointment Date.
SELECT AppointmentID,AppointmentDate,ConsultationFee,
LEAD(ConsultationFee) OVER(ORDER BY AppointmentDate) AS NextFees
FROM Appointments;

-- ==========================================================
-- LAG()
-- ==========================================================

-- Displays the Consultation Fee of the previous appointment
-- based on Appointment Date.
SELECT AppointmentID,AppointmentDate,ConsultationFee,
LAG(ConsultationFee) OVER(ORDER BY AppointmentDate) AS PreviousFees
FROM Appointments;

-- ==========================================================
-- FIRST_VALUE()
-- ==========================================================

-- Returns the first Consultation Fee within each doctor's window.
SELECT AppointmentID,DoctorID,ConsultationFee,
FIRST_VALUE(ConsultationFee) OVER(PARTITION BY DoctorID ORDER BY ConsultationFee DESC) AS HighestFee
FROM Appointments;

-- ==========================================================
-- LAST_VALUE()
-- ==========================================================

-- Returns the last Consultation Fee within each doctor's window.
SELECT AppointmentID,DoctorID,ConsultationFee,
LAST_VALUE(ConsultationFee) 
OVER(PARTITION BY DoctorID ORDER BY ConsultationFee 
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
) AS HighestFee
FROM Appointments;

-- ==========================================================
-- SUM() OVER()
-- ==========================================================

-- Calculates the running total of Consultation Fees.
SELECT AppointmentID,AppointmentDate,ConsultationFee,
SUM(ConsultationFee) OVER(ORDER BY AppointmentDate) AS RunningTotal
FROM Appointments;

-- ==========================================================
-- SUM() OVER(PARTITION BY)
-- ==========================================================

-- Calculates the total Consultation Fee collected
-- by each doctor.
SELECT AppointmentID,DoctorID,ConsultationFee,
SUM(ConsultationFee) OVER(PARTITION BY DoctorID) AS DoctorRevenue
FROM Appointments;

-- ==========================================================
-- AVG() OVER()
-- ==========================================================

-- Calculates the average Consultation Fee.
SELECT AppointmentID,DoctorID,ConsultationFee,
AVG(ConsultationFee) OVER(ORDER BY DoctorID) AS AvgDoctorFee
FROM Appointments;

-- ==========================================================
-- COUNT() OVER()
-- Counts the total appointments for each doctor.
-- ==========================================================
SELECT AppointmentID,DoctorID,
COUNT(*) OVER(PARTITION BY DoctorID) AS TotalAppointments
FROM Appointments;

-- ==========================================================
-- MAX() OVER()
-- ==========================================================

-- Returns the maximum Consultation Fee for each doctor.
SELECT AppointmentID,DoctorID,ConsultationFee,
MAX(ConsultationFee) OVER(PARTITION BY DoctorID) AS MaximumFee
FROM Appointments;

-- ==========================================================
-- MIN() OVER()
-- ==========================================================

-- Returns the minimum Consultation Fee
-- based on the specified window.
SELECT AppointmentID,DoctorID,ConsultationFee,
MIN(ConsultationFee) OVER(ORDER BY DoctorID DESC) AS MinimumFee
FROM Appointments;

-- ==========================================================
-- RUNNING AVERAGE
-- ==========================================================

-- Calculates the cumulative average Consultation Fee.

-- SELECT AppointmentID,AppointmentDate,ConsultationFee,
-- AVG(ConsultationFee) OVER(
-- ORDER BY AppointmentDate
-- ROWS BETWEEN UNBOUNDED PRECEDING
-- AND CURRENT ROW
-- ) AS RunningAverage
-- FROM Appointments;

-- ==========================================================
-- PERCENTAGE CONTRIBUTION
-- ==========================================================

-- Calculates the percentage contribution of each
-- Consultation Fee to the doctor's total revenue.
SELECT AppointmentID,DoctorID,ConsultationFee,
ROUND(ConsultationFee * 100.0 /SUM(ConsultationFee) OVER(PARTITION BY DoctorID),2
) AS PercentageContribution
FROM Appointments;

-- ==========================================================
-- CUME_DIST()
-- ==========================================================

-- Returns the cumulative distribution of
-- Consultation Fees.
SELECT AppointmentID,ConsultationFee,
CUME_DIST() OVER(ORDER BY ConsultationFee) AS CumulativeDistribution
FROM Appointments;

-- ==========================================================
-- PERCENT_RANK()
-- ==========================================================

-- Returns the relative rank of each Consultation Fee
-- between 0 and 1.
SELECT AppointmentID,ConsultationFee,
PERCENT_RANK()
OVER(ORDER BY ConsultationFee) AS PercentRank
FROM Appointments;

-- ==========================================================
-- NTH_VALUE()
-- ==========================================================

-- Returns the second highest Consultation Fee
-- from the ordered window.
SELECT AppointmentID,ConsultationFee,
NTH_VALUE(ConsultationFee, 2) OVER (
        ORDER BY ConsultationFee DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS SecondHighestFee
FROM Appointments;