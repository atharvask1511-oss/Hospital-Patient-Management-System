create table Login(
User_id int auto_increment primary key,
User_name varchar(20) not null unique,
Password varchar(255)not null,
role enum("patient","doctor","admin")not null,
Createed_at datetime default Current_timestamp
);

Create Table Patient (
Patient_id int auto_increment primary key,
Patient_name varchar(50),
Patient_age int,
Patient_Gender ENUM("Male","Female","Other"),
Patient_Contact_num Bigint,
Patient_History text,
Patient_Email varchar(50),
User_id int,
foreign key(User_id)references Login(User_id) ON delete CASCADE 
);

CREATE table DOCTOR(
DOCTOR_ID INT auto_increment primary KEY,
DOCTOR_NAME VARCHAR(100),
DOCTOR_SPECIALIZATION varchar(100),
DOCTOR_CONTACT_NUM BIGINT,
DOCTOR_EMAIL VARCHAR(100),
AVALABILITY_STATUS ENUM("AVALABLE","UNAVALABLE") DEFAULT "AVALABLE",
DOCTOR_ROOM VARCHAR (100),
User_id INT ,
foreign key (User_id) references Login(User_id) ON DELETE cascade
);

CREATE table appointment(
Appointment_id int auto_increment primary key,
Patient_id int,
DOCTOR_ID INT,
Appointment_Time time,
Appointment_Date date,
Status ENUM("Scheduled","Completed","Cancelled") default "Scheduled",
Disease varchar(255),
foreign key (Patient_id) references Patient(Patient_id),
foreign key (DOCTOR_ID) references DOCTOR(DOCTOR_ID)
);

CREATE TABLE bed_bookings (
    bed_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    bed_type ENUM('ICU', 'General', 'Semi-Private', 'Private'),
    booking_date DATE,
    discharge_date DATE,
    status ENUM('Occupied','Available','Released') DEFAULT 'Occupied',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

CREATE TABLE doctor_leave (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT,
    leave_start_date DATE,
    leave_end_date DATE,
    reason VARCHAR(255),
    status ENUM('Approved','Pending','Rejected') DEFAULT 'Pending',
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE
);


