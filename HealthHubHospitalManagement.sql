-- Create the database
CREATE DATABASE IF NOT EXISTS healthhubhospitalmanagement;

-- Use the database
USE healthhubhospitalmanagement;

-- Create the tables
CREATE TABLE IF NOT EXISTS Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Specialty VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Nurse (
    NurseID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Room (
    RoomNumber INT AUTO_INCREMENT PRIMARY KEY,
    RoomType VARCHAR(255),
    AvailabilityStatus ENUM('Available', 'Occupied')
);

CREATE TABLE IF NOT EXISTS Appointment (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDateTime DATETIME,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE IF NOT EXISTS Admission (
    AdmissionID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    RoomNumber INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber)
);

CREATE TABLE IF NOT EXISTS NurseAssignment (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    NurseID INT,
    PatientID INT,
    FOREIGN KEY (NurseID) REFERENCES Nurse(NurseID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Insert sample data
-- Insert into Doctor table
INSERT INTO Doctor (FirstName, LastName, Specialty, PhoneNumber, Email)
VALUES
    ('John', 'Doe', 'Cardiology', '123-456-7890', 'john.doe@example.com'),
    ('Jane', 'Smith', 'Neurology', '234-567-8901', 'jane.smith@example.com'),
    ('Michael', 'Johnson', 'Pediatrics', '345-678-9012', 'michael.johnson@example.com'),
    ('David', 'Brown', 'Dermatology', '456-789-0123', 'david.brown@example.com'),
    ('Sarah', 'Taylor', 'Oncology', '567-890-1234', 'sarah.taylor@example.com'),
    ('Robert', 'Clark', 'Orthopedics', '678-901-2345', 'robert.clark@example.com'),
    ('Emily', 'Anderson', 'Psychiatry', '789-012-3456', 'emily.anderson@example.com'),
    ('William', 'Thomas', 'Urology', '890-123-4567', 'william.thomas@example.com'),
    ('Jessica', 'Walker', 'Gynecology', '901-234-5678', 'jessica.walker@example.com'),
    ('Andrew', 'Wright', 'ENT', '012-345-6789', 'andrew.wright@example.com');

-- Insert into Nurse table
INSERT INTO Nurse (FirstName, LastName, PhoneNumber, Email)
VALUES
    ('Emily', 'Brown', '456-789-0123', 'emily.brown@example.com'),
    ('James', 'Wilson', '567-890-1234', 'james.wilson@example.com'),
    ('Emma', 'Martinez', '678-901-2345', 'emma.martinez@example.com'),
    ('Olivia', 'Lopez', '789-012-3456', 'olivia.lopez@example.com'),
    ('Daniel', 'Harris', '890-123-4567', 'daniel.harris@example.com'),
    ('Sophia', 'Young', '901-234-5678', 'sophia.young@example.com'),
    ('Liam', 'Allen', '012-345-6789', 'liam.allen@example.com'),
    ('Ava', 'Green', '123-456-7890', 'ava.green@example.com'),
    ('Logan', 'Adams', '234-567-8901', 'logan.adams@example.com'),
    ('Ethan', 'Scott', '345-678-9012', 'ethan.scott@example.com');

-- Insert into Patient table
INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, PhoneNumber, Email)
VALUES
    ('Alice', 'Jones', '1990-05-15', 'Female', '789-012-3456', 'alice.jones@example.com'),
    ('Bob', 'Lee', '1985-08-20', 'Male', '890-123-4567', 'bob.lee@example.com'),
    ('Carol', 'Garcia', '1978-12-10', 'Female', '901-234-5678', 'carol.garcia@example.com'),
    ('David', 'Brown', '1992-03-25', 'Male', '012-345-6789', 'david.brown@example.com'),
    ('Eva', 'White', '1980-07-18', 'Female', '123-456-7890', 'eva.white@example.com'),
    ('Frank', 'Robinson', '1975-11-30', 'Male', '234-567-8901', 'frank.robinson@example.com'),
    ('Grace', 'Hill', '1988-09-05', 'Female', '345-678-9012', 'grace.hill@example.com'),
    ('Henry', 'Turner', '1983-04-12', 'Male', '456-789-0123', 'henry.turner@example.com'),
    ('Ivy', 'Cook', '1995-01-22', 'Female', '567-890-1234', 'ivy.cook@example.com'),
    ('Jack', 'Evans', '1997-06-08', 'Male', '678-901-2345', 'jack.evans@example.com');

-- Insert into Room table
INSERT INTO Room (RoomType, AvailabilityStatus)
VALUES
    ('Single', 'Available'),
    ('Double', 'Occupied'),
    ('Suite', 'Available'),
    ('Single', 'Available'),
    ('Double', 'Occupied'),
    ('Suite', 'Available'),
    ('Single', 'Available'),
    ('Double', 'Occupied'),
    ('Suite', 'Available'),
    ('Single', 'Available');

-- Insert into Appointment table
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDateTime, Notes)
VALUES
    (1, 1, '2024-03-01 09:00:00', 'Regular checkup'),
    (2, 2, '2024-03-02 10:00:00', 'Follow-up appointment'),
    (3, 3, '2024-03-03 11:00:00', 'Consultation'),
    (4, 4, '2024-03-04 12:00:00', 'Routine checkup'),
    (5, 5, '2024-03-05 13:00:00', 'Annual physical'),
    (6, 6, '2024-03-06 14:00:00', 'Diagnostic evaluation'),
    (7, 7, '2024-03-07 15:00:00', 'Medication review'),
    (8, 8, '2024-03-08 16:00:00', 'Preventive care'),
    (9, 9, '2024-03-09 17:00:00', 'Surgery follow-up'),
    (10, 10, '2024-03-10 18:00:00', 'Therapy session');

-- Insert into Admission table
INSERT INTO Admission (PatientID, AdmissionDate, DischargeDate, RoomNumber)
VALUES
    (1, '2024-03-01', '2024-03-03', 1),
    (2, '2024-03-02', '2024-03-04', 2),
    (3, '2024-03-03', '2024-03-05', 3),
    (4, '2024-03-04', '2024-03-06', 4),
    (5, '2024-03-05', '2024-03-07', 5),
    (6, '2024-03-06', '2024-03-08', 6),
    (7, '2024-03-07', '2024-03-09', 7),
    (8, '2024-03-08', '2024-03-10', 8),
    (9, '2024-03-09', '2024-03-11', 9),
    (10, '2024-03-10', '2024-03-12', 10);

-- Insert into NurseAssignment table
INSERT INTO NurseAssignment (NurseID, PatientID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
