# MySQL Hospital Management System

## Project Overview

The **Hospital Management System** is a MySQL-based database project designed to manage and organize hospital-related information such as **patients, doctors, and appointments**.

This is my **first MySQL project**, created to strengthen my SQL and database fundamentals through practical implementation. I have tried to implement **different MySQL concepts learned during my practice**, from basic database operations to more advanced SQL queries.

The project focuses on understanding how a relational database can be designed and queried to solve real-world hospital management problems.

---

## Objectives

* Create and manage a relational hospital database using MySQL.
* Understand database and table creation.
* Store and manage patient, doctor, and appointment information.
* Practice SQL queries on a real-world database.
* Implement different MySQL concepts through practical examples.
* Improve SQL query-writing and problem-solving skills.

---

## Database Structure

The database consists of the following main tables:

### Patients

Stores information about patients.

Key information includes:

* Patient ID
* FirstName
* LastName
* DateofBirth
* Gender
* DOB
* Phone
* City

### Doctors

Stores information about doctors.

Key information includes:

* DoctorID
* DoctorName
* Specialization
* Salary
* JoiningDate

### Appointments

Stores information about appointments between patients and doctors.

Key information includes:

* Appointment ID
* Patient ID
* Doctor ID
* AppointmentDate
* ConsultationFee
* Diagnosis

The tables are connected using **Primary Keys and Foreign Keys** to maintain relationships between the data.

---

## MySQL Concepts Implemented

This project covers a wide range of MySQL concepts, including:

### Database and Table Management

* `CREATE DATABASE`
* `CREATE TABLE`
* `ALTER TABLE`
* `DROP TABLE`
* `TRUNCATE TABLE`

### Data Manipulation

* `INSERT`
* `UPDATE`
* `DELETE`

### Data Retrieval

* `SELECT`
* `WHERE`
* `DISTINCT`
* `ORDER BY`
* `LIMIT`

### SQL Functions

* Aggregate Functions
* String Functions
* Date and Time Functions
* Mathematical Functions

### Grouping and Conditional Logic

* `GROUP BY`
* `HAVING`
* `CASE`

### Joins

* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* `CROSS JOIN`
* `SELF JOIN`

### Subqueries

* Single-row Subqueries
* Multi-row Subqueries

### Window Functions

* `ROW_NUMBER()`
* `RANK()`
* `DENSE_RANK()`
* `LEAD()`
* `LAG()`
* Aggregate Window Functions

### Views

* Creating Views
* Querying Views
* Views with filtering and joins

---

## Technologies Used

* **Database:** MySQL
* **Language:** SQL
* **Tools:** MySQL Workbench
* **Version Control:** Git and GitHub

---

## What I Learned

This project helped me understand how SQL concepts work together in a practical database environment.

Through this project, I practiced:

* Designing relational tables
* Working with primary and foreign keys
* Writing SQL queries
* Retrieving and filtering data
* Joining multiple tables
* Using aggregate and window functions
* Writing subqueries
* Creating database views
* Organizing SQL scripts
* Solving real-world data-related problems using SQL

Most importantly, this project gave me practical experience beyond simply learning SQL syntax.

---

## Future Improvements

Some possible improvements for this project include:

* Adding more hospital-related tables such as **Departments, Billing, Medicines, and Staff**
* Adding more complex business queries
* Adding indexes for query optimization
* Creating reports and dashboards using Power BI

---

## About the Project

This is my **first MySQL project**, created as part of my SQL and database learning journey.

The main goal was not just to create a hospital database, but to **practice and implement as many MySQL concepts as possible in one practical project**.

I built this project to strengthen my SQL fundamentals and gain hands-on experience with relational databases.
