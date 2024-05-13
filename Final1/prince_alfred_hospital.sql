-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2023 at 07:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prince_alfred_hospital`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAppointmentDepartment` (IN `Appointment_number` INT, IN `numberOfDepartment` INT, `hoursSpent` DECIMAL(10,2))   BEGIN 
INSERT INTO appointment_department(appointment_number,department_number,hours)
VALUES ( Appointment_number , numberOfDepartment , hoursSpent);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addDoctor` (IN `doctorId` VARCHAR(10), IN `Name` VARCHAR(30), IN `specialty` VARCHAR(25), IN `email` VARCHAR(30))   BEGIN
    INSERT INTO doctors (doctor_id, doctor_name, speciality, email_address)
    VALUES (doctorId,Name, specialty, email);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPatientMedicalRecord` (IN `medicalRecordNumber` INT, IN `appointmentNumber` INT, IN `proceduresDesc` VARCHAR(60), IN `medicalProblemDesc` VARCHAR(60))   BEGIN
INSERT INTO medical_record (medical_record_number, appointment_number, procedures_desc, medical_problem_desc)
    VALUES (medicalRecordNumber, appointmentNumber, proceduresDesc, medicalProblemDesc);
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPatients` (IN `id` VARCHAR(10), IN `firstName` VARCHAR(15), IN `lastName` VARCHAR(15), IN `dateOfBirth` DATE, IN `address` VARCHAR(30), IN `phoneNumber` VARCHAR(10))   BEGIN
    INSERT INTO patients (patient_id,first_name, last_name, Birthdate, address, phone_number)
    VALUES (id,firstName, lastName, dateOfBirth, address, phoneNumber);
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAppointment` (IN `appointmentNumber` INT)   BEGIN
    DELETE FROM appointments
    WHERE appointment_number = appointmentNumber;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDoctor` (IN `doctorId` VARCHAR(10))   BEGIN
    DELETE FROM doctors
    WHERE doctor_id = doctorId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePatient` (IN `patientId` VARCHAR(10))   BEGIN
    DELETE FROM patients
    WHERE patient_id = patientId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editDoctor` (IN `doctorId` VARCHAR(10), IN `Name` VARCHAR(30), IN `specialty` VARCHAR(25), IN `email` VARCHAR(30))   BEGIN
    UPDATE doctors
    SET doctor_name = Name,
        email_address = email,
        speciality = specialty
    WHERE doctor_id = doctorId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editPatient` (IN `id` VARCHAR(10), IN `firstName` VARCHAR(15), IN `lastName` VARCHAR(15), IN `dateOfBirth` DATE, IN `address` VARCHAR(30), IN `phoneNumber` VARCHAR(10))   BEGIN
    UPDATE patients
    SET first_name = firstName,
        last_name = lastName,
        birthdate = dateOfBirth,
        address = address,
        phone_number = phoneNumber
    WHERE patient_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAppointmentByDate` (IN `date_` DATE)   BEGIN 
SELECT doctors.doctor_name as 'doctor name',doctors.speciality as 'doctor speciality',patients.first_name as 'patient name',appointment_time 
FROM appointments 
JOIN patients ON patients.patient_id = appointments.patient_id
JOIN doctors on doctors.doctor_id=appointments.doctor_id
WHERE appointment_date = date_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDepartmentByNumber` (IN `number` INT)   BEGIN 
SELECT name,floor 
FROM departments 
WHERE department_number = number;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorBySpeciality` (IN `speciality` VARCHAR(25))   BEGIN 
SELECT doctors.doctor_name, doctors_phone_number.phone_number, doctors.email_address
FROM doctors
JOIN doctors_phone_number ON doctors_phone_number.doctor_id=doctors.doctor_id
WHERE doctors.speciality = speciality;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getMedicalRecordByPatientID` (IN `id` INT)   BEGIN 
SELECT medical_record.appointment_number, medical_record.procedures_desc,medical_record.medical_problem_desc
FROM  medical_record
JOIN  appointments ON  appointments.appointment_number=medical_record.appointment_number 
JOIN   patients ON  patients.patient_id=appointments.patient_id
WHERE patients.patient_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPatientById` (IN `id` VARCHAR(10))   BEGIN
SELECT first_name, last_name,birthdate,address,phone_number 
FROM patients 
WHERE patient_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `NurseScheduleAppointment` (IN `appointmentNumber` INT, IN `doctorId` VARCHAR(10), IN `patientId` VARCHAR(10), IN `appointmentDate` DATE, IN `appointmentTime` TIME)   BEGIN
    INSERT INTO appointments (appointment_number, doctor_id, patient_id, appointment_date, appointment_time)
    VALUES (appointmentNumber, doctorId, patientId, appointmentDate, appointmentTime);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePatientMedicalRecord` (IN `medicalRecordNumber` INT, IN `appointmentNumber` INT, IN `proceduresDesc` VARCHAR(60), IN `medicalProblemDesc` VARCHAR(60))   BEGIN
    UPDATE medical_record
    SET appointment_number = appointmentNumber,
        procedures_desc = proceduresDesc,
        medical_problem_desc = medicalProblemDesc
    WHERE medical_record_number = medicalRecordNumber;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_number` int(11) NOT NULL,
  `doctor_id` varchar(10) NOT NULL,
  `patient_id` varchar(10) NOT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL
) ;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_number`, `doctor_id`, `patient_id`, `appointment_date`, `appointment_time`) VALUES
(17, '115406', '41220307', '2023-10-26', '13:45:00'),
(29, '119200', '21110312', '0000-00-00', '10:15:00'),
(121, '113456', '22210313', '2019-09-01', '08:30:00'),
(192, '115406', '31210791', '2021-08-19', '10:30:00'),
(195, '117231', '21110312', '2018-02-01', '08:50:00'),
(201, '110209', '21186811', '2017-09-29', '14:30:00'),
(211, '110209', '10000310', '2017-07-17', '01:50:00'),
(221, '110209', '10000310', '2017-09-29', '12:35:00'),
(223, '115903', '21730115', '2018-01-08', '16:45:00'),
(290, '119200', '21110312', '2017-02-13', '00:00:00'),
(396, '115406', '21110313', '2019-07-22', '14:40:00'),
(397, '113456', '21110312', '2016-03-17', '16:15:00'),
(401, '112491', '21110313', '2019-08-25', '16:14:00'),
(444, '117231', '21110313', '2022-11-11', '10:30:00'),
(449, '117231', '21110312', '2020-12-29', '09:10:00'),
(469, '117231', '21110313', '2019-10-17', '09:00:00'),
(602, '102011', '21110293', '2023-10-19', '12:23:00'),
(613, '117231', '21186811', '2017-03-22', '11:15:00'),
(760, '117231', '21186811', '2018-05-31', '11:15:00'),
(764, '117231', '21186811', '2012-10-11', '11:15:00'),
(767, '110209', '21110308', '2022-06-02', '12:45:00'),
(818, '110209', '10000310', '2018-10-01', '12:35:00'),
(823, '118006', '21110293', '2022-07-24', '09:00:00'),
(872, '119200', '21188794', '2019-12-01', '14:15:00'),
(893, '117231', '21186811', '2020-11-27', '11:15:00'),
(895, '117231', '21186811', '2019-03-24', '10:40:00'),
(901, '117231', '10000310', '2017-09-25', '11:00:00'),
(923, '112491', '42110303', '2021-09-26', '11:00:00'),
(945, '115406', '31210791', '2020-10-19', '12:23:00'),
(992, '112491', '41220307', '2017-04-28', '10:15:00'),
(1001, '112491', '21610305', '2019-05-26', '13:45:00'),
(1008, '115903', '21001306', '2020-12-11', '14:20:00'),
(1024, '102011', '21110312', '2021-09-22', '14:30:00'),
(1102, '112491', '41220307', '2023-12-01', '14:15:00'),
(1129, '738212', '21110312', '2020-07-12', '08:00:00'),
(1199, '118006', '21110312', '2023-12-29', '17:30:00'),
(1203, '115903', '21730115', '2023-12-29', '17:30:00'),
(9931, '113456', '22210313', '2018-11-22', '16:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_department`
--

CREATE TABLE `appointment_department` (
  `appointment_number` int(11) NOT NULL,
  `department_number` int(11) NOT NULL,
  `hours` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_department`
--

INSERT INTO `appointment_department` (`appointment_number`, `department_number`, `hours`) VALUES
(192, 15, 5.00),
(192, 19, 3.20),
(192, 22, 11.00),
(823, 14, 2.00),
(945, 12, 1.20),
(992, 20, 3.25),
(992, 21, 2.30),
(1001, 13, 2.00),
(1001, 21, 2.10),
(1008, 15, 3.00),
(1008, 17, 1.35),
(1008, 18, 4.00);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_number` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `floor` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_number`, `name`, `floor`) VALUES
(12, 'X-RAY and MRI', 2),
(13, 'Laboratory', 3),
(14, 'Cardiology', 4),
(15, 'Orthopedics', 2),
(16, 'Oncology', 5),
(17, 'Neurology', 6),
(18, 'Dermatology', 1),
(19, 'Gastroenterolog', 3),
(20, 'Pediatrics', 7),
(21, 'Pharmacy', 4),
(22, 'Surgery', 5),
(30, 'eyes', 5),
(36, 'Anesthesia', 17);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` varchar(10) NOT NULL,
  `doctor_name` varchar(30) NOT NULL,
  `speciality` varchar(25) DEFAULT NULL,
  `email_address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `doctor_name`, `speciality`, `email_address`) VALUES
('029211', 'Dr. Sana Abasa', 'Neurosurgent and Brain', 'SSnanh201@gmail.com'),
('102011', 'Dr. Rachel Green', 'GENERAL SURGERY', '20Pages@gmail.com'),
('102678', 'Dr. lubna lenar', 'EYE SURGERY', 'lubnatuqan@gmail.com'),
('109000', 'Dr. Ross Geller', 'GENERAL SURGERY', 'FrontAndBack@gmail.com'),
('110209', 'Dr.Emily Sweene', 'Dermatologist', 'RajBroken0209@gmail.com'),
('112491', 'Dr. Jade Kenely', 'CARDIOVASCULAR SURGEON', 'JadeShami2491@hotmail.com'),
('113432', 'Dr. Bert vlankton', 'Bones and Nerves', 'DoctorBert@gmail.com'),
('113456', 'Dr. Caleb Zotti', 'ALLERGIST', 'Caleb_Maka@gmail.com'),
('115406', 'Dr. Amy Farrah Fowler', 'Neurosurgent', 'Amy406@gmail.com'),
('115903', 'Dr. Leonard Hofstadter', 'SURGEON', 'Leonard&Penny59@gmail.com'),
('117231', 'Dr. Kira Taing', 'CARDIOLOGIST', 'Kira_comp@hotmail.com'),
('118006', 'Dr. Sheldon Cooper', 'DENTISTS', 'SheldonTheBest006@gmail.com'),
('119200', 'Dr.Bernadette Rostenkowski', 'PLASTIC SURGEON', 'WolowitzAstr200@gmail.com'),
('738212', 'Dr. hawerd symance', 'DENTISTS', 'haweesnike@hotmail.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `doctors_appointments`
-- (See below for the actual view)
--
CREATE TABLE `doctors_appointments` (
`Doctor ID` varchar(10)
,`Doctor Name` varchar(30)
,`Date` date
,`Time` time
,`Patient Name` varchar(15)
,`Patient PhoneNumber` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `doctors_phone_number`
--

CREATE TABLE `doctors_phone_number` (
  `doctor_id` varchar(10) NOT NULL,
  `phone_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors_phone_number`
--

INSERT INTO `doctors_phone_number` (`doctor_id`, `phone_number`) VALUES
('102011', '0794420341'),
('102011', '0796565650'),
('109000', '079082112'),
('109000', '079739054'),
('109000', '079934934'),
('110209', '0781450023'),
('112491', '0798342371'),
('113456', '0795558282'),
('115406', '0780001929'),
('115406', '0784762341'),
('115903', '0792349001'),
('117231', '0123456789'),
('117231', '0781238901'),
('118006', '0793322100'),
('118006', '0799121221'),
('118006', '0799911232'),
('119200', '0791221219'),
('119200', '0796161712'),
('738212', '0793737273');

-- --------------------------------------------------------

--
-- Table structure for table `medical_record`
--

CREATE TABLE `medical_record` (
  `medical_record_number` int(11) NOT NULL,
  `appointment_number` int(11) NOT NULL,
  `procedures_desc` varchar(60) DEFAULT NULL,
  `medical_problem_desc` varchar(60) DEFAULT NULL
) ;

--
-- Dumping data for table `medical_record`
--

INSERT INTO `medical_record` (`medical_record_number`, `appointment_number`, `procedures_desc`, `medical_problem_desc`) VALUES
(16, 17, 'mineral testing', 'blood loss'),
(22, 602, 'ultrasound', 'High heart rate'),
(183, 1008, 'Allergy test', 'Allergic reaction'),
(195, 401, 'Physical examination', 'Cough and cold'),
(201, 1001, 'X-ray and blood Test', 'Back pain and Fever'),
(220, 945, 'MRI scan', 'Headache'),
(292, 192, 'Blood test', 'Fever and Cold'),
(876, 992, 'Blood pressure monitoring', 'Hypertension'),
(999, 823, 'CT scan', 'Migraine');

-- --------------------------------------------------------

--
-- Stand-in structure for view `medical_record_count`
-- (See below for the actual view)
--
CREATE TABLE `medical_record_count` (
`medical_record_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `number_of_appointments_for_doctors`
-- (See below for the actual view)
--
CREATE TABLE `number_of_appointments_for_doctors` (
`doctor_id` varchar(10)
,`doctor_name` varchar(30)
,`Num_Of_Appointments` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `nurse_appointment_view_after2020`
-- (See below for the actual view)
--
CREATE TABLE `nurse_appointment_view_after2020` (
`patient_id` varchar(10)
,`patient first name` varchar(15)
,`patient last name` varchar(15)
,`doctor_id` varchar(10)
,`doctor_name` varchar(30)
,`appointment_date` date
,`appointment_time` time
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `nurse_medicalrecord_view`
-- (See below for the actual view)
--
CREATE TABLE `nurse_medicalrecord_view` (
`patient_id` varchar(10)
,`first_name` varchar(15)
,`last_name` varchar(15)
,`phone_number` varchar(10)
,`doctor_name` varchar(30)
,`appointment_number` int(11)
,`procedures` varchar(60)
,`medical_problem` varchar(60)
);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` varchar(10) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(30) DEFAULT 'unknown',
  `phone_number` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `birthdate`, `address`, `phone_number`) VALUES
('10000310', 'Lily', 'KIMILY', '2009-09-25', '235 New Oak tree Avenue', '555-666-77'),
('21001306', 'Noah', 'Gonzalez', '1989-07-10', '789 Maple Avenue', '222-333-44'),
('21100194', 'lane', 'borde', '1992-05-12', 'unknown', '727-654-00'),
('21110293', 'khalid', 'hammad', '1990-05-24', '123 Main Street', '123-456-78'),
('21110308', 'Lucas', 'Torres', '2003-11-12', '654 Bircha Line', '888-999-00'),
('21110312', 'Harper', 'Patel', '2016-08-17', '789 Maple Laine', '444-555-66'),
('21110313', 'Benjamin', 'Wang', '2021-01-05', '21 Cedary Street', '777-020-99'),
('21186811', 'James', 'Nguyen', '1999-06-30', '567 prince Road', '222-333-44'),
('21188794', 'John', 'Doe', '1985-09-12', '456 karen Street', '727-654-00'),
('21610305', 'Mia', 'Rodriguez', '1987-12-28', '456 Pine Road', '444-555-66'),
('21730115', 'Jane', 'Smith', '1992-03-08', '789 seema Avenue', '555-123-55'),
('22210313', 'Avery', 'Rivera', '2011-05-06', '876 Elmine Road', '111-222-33'),
('31210791', 'rama', 'sami', '2002-08-11', '923 Main road', '988-416-93'),
('41220307', 'Isabella', 'Perez', '2001-03-20', '321 sumby hills', '777-888-99'),
('42110303', 'Emma', 'Garcia', '1988-04-02', '987 loren Street', '555-666-77'),
('91110304', 'Liam', 'Lopez', '1985-09-15', '991 barak foren', '111-222-33');

-- --------------------------------------------------------

--
-- Stand-in structure for view `patients_appointment_view`
-- (See below for the actual view)
--
CREATE TABLE `patients_appointment_view` (
`patient_id` varchar(10)
,`doctor_name` varchar(30)
,`appointment_date` date
,`appointment_time` time
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `patients_medical_record`
-- (See below for the actual view)
--
CREATE TABLE `patients_medical_record` (
`patient_id` varchar(10)
,`first_name` varchar(15)
,`appointment_number` int(11)
,`medical_problem_desc` varchar(60)
,`procedures_desc` varchar(60)
);

-- --------------------------------------------------------

--
-- Structure for view `doctors_appointments`
--
DROP TABLE IF EXISTS `doctors_appointments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doctors_appointments`  AS SELECT `doctors`.`doctor_id` AS `Doctor ID`, `doctors`.`doctor_name` AS `Doctor Name`, `appointments`.`appointment_date` AS `Date`, `appointments`.`appointment_time` AS `Time`, `patients`.`first_name` AS `Patient Name`, `patients`.`phone_number` AS `Patient PhoneNumber` FROM ((`doctors` join `appointments` on(`appointments`.`doctor_id` = `doctors`.`doctor_id`)) join `patients` on(`appointments`.`patient_id` = `patients`.`patient_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `medical_record_count`
--
DROP TABLE IF EXISTS `medical_record_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medical_record_count`  AS SELECT count(`medical_record`.`medical_record_number`) AS `medical_record_count` FROM `medical_record` ;

-- --------------------------------------------------------

--
-- Structure for view `number_of_appointments_for_doctors`
--
DROP TABLE IF EXISTS `number_of_appointments_for_doctors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `number_of_appointments_for_doctors`  AS SELECT `doctors`.`doctor_id` AS `doctor_id`, `doctors`.`doctor_name` AS `doctor_name`, count(`appointments`.`appointment_number`) AS `Num_Of_Appointments` FROM (`doctors` left join `appointments` on(`doctors`.`doctor_id` = `appointments`.`doctor_id`)) GROUP BY `doctors`.`doctor_id`, `doctors`.`doctor_name` ;

-- --------------------------------------------------------

--
-- Structure for view `nurse_appointment_view_after2020`
--
DROP TABLE IF EXISTS `nurse_appointment_view_after2020`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nurse_appointment_view_after2020`  AS SELECT `patients`.`patient_id` AS `patient_id`, `patients`.`first_name` AS `patient first name`, `patients`.`last_name` AS `patient last name`, `doctors`.`doctor_id` AS `doctor_id`, `doctors`.`doctor_name` AS `doctor_name`, `appointments`.`appointment_date` AS `appointment_date`, `appointments`.`appointment_time` AS `appointment_time` FROM ((`patients` join `appointments` on(`appointments`.`patient_id` = `patients`.`patient_id`)) join `doctors` on(`doctors`.`doctor_id` = `appointments`.`doctor_id`)) WHERE `appointments`.`appointment_date` > '2020-12-31' ;

-- --------------------------------------------------------

--
-- Structure for view `nurse_medicalrecord_view`
--
DROP TABLE IF EXISTS `nurse_medicalrecord_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nurse_medicalrecord_view`  AS SELECT `patients`.`patient_id` AS `patient_id`, `patients`.`first_name` AS `first_name`, `patients`.`last_name` AS `last_name`, `patients`.`phone_number` AS `phone_number`, `doctors`.`doctor_name` AS `doctor_name`, `medical_record`.`appointment_number` AS `appointment_number`, `medical_record`.`procedures_desc` AS `procedures`, `medical_record`.`medical_problem_desc` AS `medical_problem` FROM (((`medical_record` join `appointments` on(`medical_record`.`appointment_number` = `appointments`.`appointment_number`)) join `patients` on(`patients`.`patient_id` = `appointments`.`patient_id`)) join `doctors` on(`doctors`.`doctor_id` = `appointments`.`doctor_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `patients_appointment_view`
--
DROP TABLE IF EXISTS `patients_appointment_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patients_appointment_view`  AS SELECT `patients`.`patient_id` AS `patient_id`, `doctors`.`doctor_name` AS `doctor_name`, `appointments`.`appointment_date` AS `appointment_date`, `appointments`.`appointment_time` AS `appointment_time` FROM ((`patients` join `appointments` on(`appointments`.`patient_id` = `patients`.`patient_id`)) join `doctors` on(`doctors`.`doctor_id` = `appointments`.`doctor_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `patients_medical_record`
--
DROP TABLE IF EXISTS `patients_medical_record`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patients_medical_record`  AS SELECT `patients`.`patient_id` AS `patient_id`, `patients`.`first_name` AS `first_name`, `appointments`.`appointment_number` AS `appointment_number`, `medical_record`.`medical_problem_desc` AS `medical_problem_desc`, `medical_record`.`procedures_desc` AS `procedures_desc` FROM ((`patients` join `appointments` on(`appointments`.`patient_id` = `patients`.`patient_id`)) join `medical_record` on(`medical_record`.`appointment_number` = `appointments`.`appointment_number`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_number`),
  ADD KEY `appointment_number_fk1` (`doctor_id`),
  ADD KEY `appointment_number_fk2` (`patient_id`);

--
-- Indexes for table `appointment_department`
--
ALTER TABLE `appointment_department`
  ADD PRIMARY KEY (`appointment_number`,`department_number`),
  ADD KEY `appointment_department_fk2` (`department_number`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_number`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `doctors_phone_number`
--
ALTER TABLE `doctors_phone_number`
  ADD PRIMARY KEY (`doctor_id`,`phone_number`);

--
-- Indexes for table `medical_record`
--
ALTER TABLE `medical_record`
  ADD PRIMARY KEY (`medical_record_number`),
  ADD UNIQUE KEY `appointment_number` (`appointment_number`),
  ADD KEY `medical_record_fk` (`appointment_number`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointment_number_fk1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_number_fk2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment_department`
--
ALTER TABLE `appointment_department`
  ADD CONSTRAINT `appointment_department_fk1` FOREIGN KEY (`appointment_number`) REFERENCES `appointments` (`appointment_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_department_fk2` FOREIGN KEY (`department_number`) REFERENCES `departments` (`department_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctors_phone_number`
--
ALTER TABLE `doctors_phone_number`
  ADD CONSTRAINT `doctors_phone_number_fk` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medical_record`
--
ALTER TABLE `medical_record`
  ADD CONSTRAINT `medical_record_fk` FOREIGN KEY (`appointment_number`) REFERENCES `appointments` (`appointment_number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
