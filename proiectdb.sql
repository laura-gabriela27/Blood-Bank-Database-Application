-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2023 at 01:23 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proiectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `antigen`
--

CREATE TABLE `antigen` (
  `ANTIGEN_ID` double NOT NULL,
  `TYPE` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `antigen`
--

INSERT INTO `antigen` (`ANTIGEN_ID`, `TYPE`) VALUES
(1, 'HLA-A'),
(2, 'HLA-B'),
(3, 'HLA-C'),
(4, 'HLA-DRB1'),
(5, 'HLA-DQB1'),
(6, 'HLA-DPB1');

-- --------------------------------------------------------

--
-- Table structure for table `blood_type`
--

CREATE TABLE `blood_type` (
  `BT_ID` double NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `PLASMA_LEVEL` double NOT NULL,
  `ANTIGEN_ID` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_type`
--

INSERT INTO `blood_type` (`BT_ID`, `TYPE`, `PLASMA_LEVEL`, `ANTIGEN_ID`) VALUES
(1, 'A', 3.4, 2),
(2, 'B', 5.1, 4),
(3, 'O', 5.3, 1),
(4, 'AB', 4.1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

CREATE TABLE `clinic` (
  `CLINIC_ID` double NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `LOCATION_ID` double NOT NULL,
  `DIRECTOR` varchar(30) NOT NULL,
  `MANAGER` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clinic`
--

INSERT INTO `clinic` (`CLINIC_ID`, `NAME`, `LOCATION_ID`, `DIRECTOR`, `MANAGER`) VALUES
(1, 'Polizu', 4, 'Toader Oana', 'Calinescu Bogdan'),
(2, 'Militari', 5, 'Zamfir Bogdan', 'Nita Ana-Maria'),
(3, 'Sf. Hedwig', 1, 'Kathrin Beilecke', 'Ralf Tunn'),
(4, 'Kolan', 2, 'AHMET FIRAT GÜNGÖR', 'Betül BAKAN'),
(5, 'Harley', 3, 'Simon Marsh', 'Jerry Gilmore');

-- --------------------------------------------------------

--
-- Table structure for table `compatibility`
--

CREATE TABLE `compatibility` (
  `TEST_ID` double NOT NULL,
  `DI_ID` double NOT NULL,
  `REI_ID` double NOT NULL,
  `HLA_ANTIBODY` varchar(20) NOT NULL,
  `HLA_LEVEL` varchar(20) NOT NULL,
  `TIME` datetime(6) NOT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `compatibility`
--

INSERT INTO `compatibility` (`TEST_ID`, `DI_ID`, `REI_ID`, `HLA_ANTIBODY`, `HLA_LEVEL`, `TIME`, `DESCRIPTION`) VALUES
(1, 1, 2, '0', '56%', '2021-12-21 06:50:00.356000', 'INCOMPATIBLE (Recipient can only receive Rh- blood) - Not all requirements are met'),
(2, 2, 3, '1', '94%', '2021-03-21 11:17:00.356000', 'COMPATIBLE'),
(3, 3, 4, '1', '85%', '2021-04-21 09:05:00.356000', '\"INCOMPATIBLE (Recipient cannot receive blood from donor) - Not all requirements are met'),
(4, 4, 1, '0', '27%', '2021-01-21 03:52:00.356000', '\"COMPATIBLE'),
(5, 5, 5, '0', '12%', '2021-06-21 04:15:00.356000', 'COMPATIBLE');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `COUNTRY_ID` double NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `REGION` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`COUNTRY_ID`, `NAME`, `REGION`) VALUES
(1, 'Romania', 'Europe'),
(2, 'United Kingdom', 'Europe'),
(3, 'Canada', 'America'),
(4, 'Turkey', 'Asia'),
(5, 'Germany', 'Europe');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DOCTOR_ID` double NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `CLINIC_ID` double NOT NULL,
  `TELEPHONE` varchar(15) NOT NULL,
  `SPECIALIZATION_ID` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DOCTOR_ID`, `NAME`, `CLINIC_ID`, `TELEPHONE`, `SPECIALIZATION_ID`) VALUES
(1, 'Steve Allen', 2, '0741234578', 2),
(2, 'Popescu Ana-Maria', 1, '0741278907', 3),
(3, 'Romney Pope', 4, '0789674532', 5),
(4, 'Sarah McWilliams', 5, '0736789854', 4),
(5, 'Mark Gittos', 3, '0754674385', 1);

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `DONOR_ID` double NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `CNP` varchar(13) NOT NULL,
  `AGE` double NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `TELEPHONE` varchar(15) NOT NULL,
  `COUNTRY_ID` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`DONOR_ID`, `NAME`, `CNP`, `AGE`, `GENDER`, `TELEPHONE`, `COUNTRY_ID`) VALUES
(1, 'Iliescu Laura-Gabriela', '6020927098761', 20, 'F', '0741098765', 1),
(2, 'Timisica Andrei', '5020923098765', 20, 'M', '0732456789', 4),
(3, 'Ionescu Adrian', '2590807123456', 63, 'M', '0734567893', 2),
(4, 'Sarah Scott', '1670809456789', 55, 'F', '0749876534', 5),
(5, 'Bucurescu Stefan', '5090704765342', 13, 'M', '0734765987', 3);

-- --------------------------------------------------------

--
-- Table structure for table `donor_add_info`
--

CREATE TABLE `donor_add_info` (
  `DI_ID` double NOT NULL,
  `DONOR_ID` double NOT NULL,
  `BIRTH_DATE` datetime NOT NULL,
  `DEATH_DATE` datetime(6) DEFAULT NULL,
  `BT_ID` double NOT NULL,
  `CLINIC_ID` double NOT NULL,
  `RH_ID` double NOT NULL,
  `DOCTOR_ID` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donor_add_info`
--

INSERT INTO `donor_add_info` (`DI_ID`, `DONOR_ID`, `BIRTH_DATE`, `DEATH_DATE`, `BT_ID`, `CLINIC_ID`, `RH_ID`, `DOCTOR_ID`) VALUES
(1, 1, '2002-09-27 00:35:07', NULL, 1, 4, 1, 3),
(2, 2, '2002-09-23 00:36:42', NULL, 2, 1, 5, 2),
(3, 3, '1959-08-07 00:36:42', '2022-12-12 00:37:42.000000', 4, 2, 3, 1),
(4, 4, '1967-08-09 00:36:42', '2022-11-05 00:38:43.000000', 3, 5, 4, 4),
(5, 5, '2009-07-04 00:39:25', '2022-12-24 00:39:25.000000', 3, 3, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `donor_card`
--

CREATE TABLE `donor_card` (
  `DC_ID` double NOT NULL,
  `DONOR_ID` double NOT NULL,
  `DO_ID` double NOT NULL,
  `DONATION_DATE` datetime NOT NULL,
  `DETAILS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donor_card`
--

INSERT INTO `donor_card` (`DC_ID`, `DONOR_ID`, `DO_ID`, `DONATION_DATE`, `DETAILS`) VALUES
(1, 1, 4, '2022-11-09 00:40:32', 'the cornea has been successfully removed'),
(2, 3, 2, '2022-12-12 00:40:49', ''),
(3, 2, 1, '2022-07-01 00:41:03', ''),
(4, 4, 5, '2022-11-05 00:41:29', ''),
(5, 5, 3, '2022-12-24 00:41:44', '');

-- --------------------------------------------------------

--
-- Table structure for table `donor_organ`
--

CREATE TABLE `donor_organ` (
  `DO_ID` double NOT NULL,
  `OT_ID` double NOT NULL,
  `STATE` varchar(20) NOT NULL,
  `ORGAN_SIZE` varchar(20) NOT NULL,
  `TIME` datetime(6) NOT NULL,
  `AVAILABILITY` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donor_organ`
--

INSERT INTO `donor_organ` (`DO_ID`, `OT_ID`, `STATE`, `ORGAN_SIZE`, `TIME`, `AVAILABILITY`) VALUES
(1, 1, 'excelent', 'medium', '2022-07-01 00:42:12.000000', 1),
(2, 3, 'good', 'medium', '2022-12-12 00:42:34.000000', 1),
(3, 4, 'excellent', 'small', '2022-12-24 00:42:47.000000', 1),
(4, 5, 'good', 'medium', '2022-11-09 00:42:59.000000', 1),
(5, 2, 'damaged', 'medium', '2022-11-05 00:43:13.000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `do_medical_record`
--

CREATE TABLE `do_medical_record` (
  `MR_ID` double NOT NULL,
  `DONOR_ID` double NOT NULL,
  `CJD` double NOT NULL,
  `EBOLA` double NOT NULL,
  `CANCER` double NOT NULL,
  `HIV` double NOT NULL,
  `OTHER_ILLNESS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `do_medical_record`
--

INSERT INTO `do_medical_record` (`MR_ID`, `DONOR_ID`, `CJD`, `EBOLA`, `CANCER`, `HIV`, `OTHER_ILLNESS`) VALUES
(1, 1, 0, 0, 0, 0, ''),
(2, 2, 0, 0, 0, 0, ''),
(3, 3, 0, 0, 1, 0, 'Epilepsy'),
(4, 4, 1, 0, 0, 1, 'Ulcer'),
(5, 5, 0, 0, 0, 0, 'Anemia');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `INSURANCE_ID` double NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `PERIOD` varchar(20) NOT NULL,
  `SUM` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`INSURANCE_ID`, `TYPE`, `PERIOD`, `SUM`) VALUES
(1, 'HMO', '8', 1000000),
(2, 'EPO', '6', 700000),
(3, 'POS', '4', 600000),
(4, 'PPO', '3', 300000),
(5, 'HDHP', '10', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `LOC_ID` double NOT NULL,
  `ADDRESS` varchar(50) NOT NULL,
  `POSTAL_CODE` varchar(30) NOT NULL,
  `COUNTRY_ID` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LOC_ID`, `ADDRESS`, `POSTAL_CODE`, `COUNTRY_ID`) VALUES
(1, 'Grosse Hamburger Str. 5-11', '10115', 5),
(2, 'Darülaceze Cd. No:14', '34384', 4),
(3, '152 Harley Street, London', '123532', 2),
(4, 'Strada Gheorghe Polizu 38-52', '127715', 1),
(5, 'BERTHELOT HENRI MATHIAS nr.7-9', '700483', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organ_type`
--

CREATE TABLE `organ_type` (
  `OT_ID` double NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `TISSUE_TYPE` varchar(20) NOT NULL,
  `FUNCTION` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organ_type`
--

INSERT INTO `organ_type` (`OT_ID`, `NAME`, `TISSUE_TYPE`, `FUNCTION`, `DESCRIPTION`) VALUES
(1, 'liver', 'connective tissue', 'processes blood', 'the largest organ in our body'),
(2, 'lungs', 'pleura, lymphoid', 'respiratory', 'a pair of primary organs'),
(3, 'bone marrow', 'connective tissue', 'produces blood cells', 'red blood cells carry oxygen'),
(4, 'heart', 'cardiac muscle', 'circulatory', 'pump blood through the body'),
(5, 'cornea', 'epithelial', 'protects the eye', 'focuses light rays on retina');

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `RECIPIENT_ID` double NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `CNP` varchar(13) NOT NULL,
  `AGE` double NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `TELEPHONE` varchar(15) NOT NULL,
  `COUNTRY_ID` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`RECIPIENT_ID`, `NAME`, `CNP`, `AGE`, `GENDER`, `TELEPHONE`, `COUNTRY_ID`) VALUES
(1, 'Ana Trujillo', '6221201017618', 25, 'F', '(171) 555-2222', 2),
(2, 'Yoshi Nagase', '5121211016947', 31, 'M', '(03) 3555-5011', 4),
(3, 'Carlos Diaz', '7921216019651', 63, 'M', '(11) 555 4640', 3),
(4, 'Petra Winkler', '8020927017549', 20, 'F', '(010) 9984510', 5),
(5, 'Chandra Leka', '8020409279648', 47, 'F', '555-8787', 5);

-- --------------------------------------------------------

--
-- Table structure for table `recipient_card`
--

CREATE TABLE `recipient_card` (
  `REC_ID` double NOT NULL,
  `ORGAN` varchar(20) NOT NULL,
  `RECIPIENT_ID` double NOT NULL,
  `DETAILS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipient_card`
--

INSERT INTO `recipient_card` (`REC_ID`, `ORGAN`, `RECIPIENT_ID`, `DETAILS`) VALUES
(1, 'Bone Marrow', 5, 'Aplastic anemia is a serious blood condition'),
(2, 'Heart', 1, 'Birth defects of the heart'),
(3, 'Lungs', 2, 'Severe iron deficiency'),
(4, 'Liver', 4, 'Sudden acute loss of liver function'),
(5, 'Eyes', 3, '-');

-- --------------------------------------------------------

--
-- Table structure for table `re_add_info`
--

CREATE TABLE `re_add_info` (
  `REI_ID` double NOT NULL,
  `RECIPIENT_ID` double NOT NULL,
  `BIRTH_DATE` datetime NOT NULL,
  `BT_ID` double NOT NULL,
  `CLINIC_ID` double NOT NULL,
  `INSURANCE_ID` double NOT NULL,
  `RH_ID` double NOT NULL,
  `DOCTOR_ID` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `re_add_info`
--

INSERT INTO `re_add_info` (`REI_ID`, `RECIPIENT_ID`, `BIRTH_DATE`, `BT_ID`, `CLINIC_ID`, `INSURANCE_ID`, `RH_ID`, `DOCTOR_ID`) VALUES
(1, 2, '1991-12-09 00:45:09', 4, 1, 2, 3, 2),
(2, 3, '1959-03-18 00:36:42', 4, 3, 1, 2, 3),
(3, 4, '2002-02-05 00:36:42', 3, 4, 3, 2, 5),
(4, 5, '1975-07-29 00:36:42', 2, 2, 4, 1, 3),
(5, 1, '1997-01-01 00:36:42', 1, 5, 5, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `re_medical_record`
--

CREATE TABLE `re_medical_record` (
  `REMR_ID` double NOT NULL,
  `RECIPIENT_ID` double NOT NULL,
  `ILLNESS` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `re_medical_record`
--

INSERT INTO `re_medical_record` (`REMR_ID`, `RECIPIENT_ID`, `ILLNESS`) VALUES
(1, 3, 'Allergies'),
(2, 4, 'Hepatitis A'),
(3, 5, 'Anaemia'),
(4, 1, 'Down syndrome'),
(5, 2, 'Cancer');

-- --------------------------------------------------------

--
-- Table structure for table `rh`
--

CREATE TABLE `rh` (
  `RH_ID` double NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `D_ANTIGEN` varchar(20) NOT NULL,
  `PROTEIN` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rh`
--

INSERT INTO `rh` (`RH_ID`, `TYPE`, `D_ANTIGEN`, `PROTEIN`) VALUES
(1, '+', '1', 'D '),
(2, '-', '0', 'C '),
(3, '-', '0', 'C '),
(4, '-', '0', 'E '),
(5, '-', '0', 'E ');

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

CREATE TABLE `specialization` (
  `SPEC_ID` double NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `EXP_REQ` double NOT NULL,
  `DETAILS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialization`
--

INSERT INTO `specialization` (`SPEC_ID`, `NAME`, `EXP_REQ`, `DETAILS`) VALUES
(1, 'Vascular', 10, 'unsightly veins, circulation problems'),
(2, 'Neurosurgery', 15, 'brain and spine diseases, brain tumors'),
(3, 'Anesthesiology and Reanimation', 8, 'medical evaluation prior to intervention'),
(4, 'Oncology', 13, 'identifying people at risk of cancer'),
(5, 'General Intensive Care', 7, 'treatment areas for vital support arises');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antigen`
--
ALTER TABLE `antigen`
  ADD PRIMARY KEY (`ANTIGEN_ID`);

--
-- Indexes for table `blood_type`
--
ALTER TABLE `blood_type`
  ADD PRIMARY KEY (`BT_ID`);

--
-- Indexes for table `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`CLINIC_ID`),
  ADD KEY `CLINIC_FK` (`LOCATION_ID`);

--
-- Indexes for table `compatibility`
--
ALTER TABLE `compatibility`
  ADD PRIMARY KEY (`TEST_ID`),
  ADD KEY `COMPATIBILITY_FK` (`DI_ID`),
  ADD KEY `COMPATIBILITY_FK2` (`REI_ID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`COUNTRY_ID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DOCTOR_ID`),
  ADD KEY `DOCTOR_FK` (`CLINIC_ID`),
  ADD KEY `DOCTOR_FK2` (`SPECIALIZATION_ID`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`DONOR_ID`);

--
-- Indexes for table `donor_add_info`
--
ALTER TABLE `donor_add_info`
  ADD PRIMARY KEY (`DI_ID`),
  ADD KEY `DONOR_ADD_INFO_FK` (`DONOR_ID`),
  ADD KEY `DONOR_ADD_INFO_FK2` (`BT_ID`),
  ADD KEY `DONOR_ADD_INFO_FK3` (`RH_ID`),
  ADD KEY `DONOR_ADD_INFO_FK4` (`DOCTOR_ID`);

--
-- Indexes for table `donor_card`
--
ALTER TABLE `donor_card`
  ADD PRIMARY KEY (`DC_ID`),
  ADD KEY `DONOR_CARD_FK` (`DONOR_ID`),
  ADD KEY `DONOR_CARD_FK2` (`DO_ID`);

--
-- Indexes for table `donor_organ`
--
ALTER TABLE `donor_organ`
  ADD PRIMARY KEY (`DO_ID`),
  ADD KEY `DONOR_ORGAN_FK` (`OT_ID`);

--
-- Indexes for table `do_medical_record`
--
ALTER TABLE `do_medical_record`
  ADD PRIMARY KEY (`MR_ID`),
  ADD KEY `DO_MEDICAL_RECORD_FK` (`DONOR_ID`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`INSURANCE_ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LOC_ID`),
  ADD KEY `LOCATION_FK` (`COUNTRY_ID`);

--
-- Indexes for table `organ_type`
--
ALTER TABLE `organ_type`
  ADD PRIMARY KEY (`OT_ID`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`RECIPIENT_ID`);

--
-- Indexes for table `recipient_card`
--
ALTER TABLE `recipient_card`
  ADD PRIMARY KEY (`REC_ID`),
  ADD KEY `RECIPIENT_CARD_FK` (`RECIPIENT_ID`);

--
-- Indexes for table `re_add_info`
--
ALTER TABLE `re_add_info`
  ADD PRIMARY KEY (`REI_ID`),
  ADD KEY `RE_ADD_INFO_FK` (`RECIPIENT_ID`),
  ADD KEY `RE_ADD_INFO_FK2` (`BT_ID`),
  ADD KEY `RE_ADD_INFO_FK3` (`INSURANCE_ID`),
  ADD KEY `RE_ADD_INFO_FK4` (`RH_ID`),
  ADD KEY `RE_ADD_INFO_FK5` (`DOCTOR_ID`);

--
-- Indexes for table `re_medical_record`
--
ALTER TABLE `re_medical_record`
  ADD PRIMARY KEY (`REMR_ID`),
  ADD KEY `RE_MEDICAL_RECORD_FK` (`RECIPIENT_ID`);

--
-- Indexes for table `rh`
--
ALTER TABLE `rh`
  ADD PRIMARY KEY (`RH_ID`);

--
-- Indexes for table `specialization`
--
ALTER TABLE `specialization`
  ADD PRIMARY KEY (`SPEC_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clinic`
--
ALTER TABLE `clinic`
  ADD CONSTRAINT `CLINIC_FK` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOC_ID`);

--
-- Constraints for table `compatibility`
--
ALTER TABLE `compatibility`
  ADD CONSTRAINT `COMPATIBILITY_FK` FOREIGN KEY (`DI_ID`) REFERENCES `donor_add_info` (`DI_ID`),
  ADD CONSTRAINT `COMPATIBILITY_FK2` FOREIGN KEY (`REI_ID`) REFERENCES `re_add_info` (`REI_ID`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `DOCTOR_FK` FOREIGN KEY (`CLINIC_ID`) REFERENCES `clinic` (`CLINIC_ID`),
  ADD CONSTRAINT `DOCTOR_FK2` FOREIGN KEY (`SPECIALIZATION_ID`) REFERENCES `specialization` (`SPEC_ID`);

--
-- Constraints for table `donor_add_info`
--
ALTER TABLE `donor_add_info`
  ADD CONSTRAINT `DONOR_ADD_INFO_FK` FOREIGN KEY (`DONOR_ID`) REFERENCES `donor` (`DONOR_ID`),
  ADD CONSTRAINT `DONOR_ADD_INFO_FK2` FOREIGN KEY (`BT_ID`) REFERENCES `blood_type` (`BT_ID`),
  ADD CONSTRAINT `DONOR_ADD_INFO_FK3` FOREIGN KEY (`RH_ID`) REFERENCES `rh` (`RH_ID`),
  ADD CONSTRAINT `DONOR_ADD_INFO_FK4` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `doctor` (`DOCTOR_ID`);

--
-- Constraints for table `donor_card`
--
ALTER TABLE `donor_card`
  ADD CONSTRAINT `DONOR_CARD_FK` FOREIGN KEY (`DONOR_ID`) REFERENCES `donor` (`DONOR_ID`),
  ADD CONSTRAINT `DONOR_CARD_FK2` FOREIGN KEY (`DO_ID`) REFERENCES `donor_organ` (`DO_ID`);

--
-- Constraints for table `donor_organ`
--
ALTER TABLE `donor_organ`
  ADD CONSTRAINT `DONOR_ORGAN_FK` FOREIGN KEY (`OT_ID`) REFERENCES `organ_type` (`OT_ID`);

--
-- Constraints for table `do_medical_record`
--
ALTER TABLE `do_medical_record`
  ADD CONSTRAINT `DO_MEDICAL_RECORD_FK` FOREIGN KEY (`DONOR_ID`) REFERENCES `donor` (`DONOR_ID`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `LOCATION_FK` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`);

--
-- Constraints for table `recipient_card`
--
ALTER TABLE `recipient_card`
  ADD CONSTRAINT `RECIPIENT_CARD_FK` FOREIGN KEY (`RECIPIENT_ID`) REFERENCES `recipient` (`RECIPIENT_ID`);

--
-- Constraints for table `re_add_info`
--
ALTER TABLE `re_add_info`
  ADD CONSTRAINT `RE_ADD_INFO_FK` FOREIGN KEY (`RECIPIENT_ID`) REFERENCES `recipient` (`RECIPIENT_ID`),
  ADD CONSTRAINT `RE_ADD_INFO_FK2` FOREIGN KEY (`BT_ID`) REFERENCES `blood_type` (`BT_ID`),
  ADD CONSTRAINT `RE_ADD_INFO_FK3` FOREIGN KEY (`INSURANCE_ID`) REFERENCES `insurance` (`INSURANCE_ID`),
  ADD CONSTRAINT `RE_ADD_INFO_FK4` FOREIGN KEY (`RH_ID`) REFERENCES `rh` (`RH_ID`),
  ADD CONSTRAINT `RE_ADD_INFO_FK5` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `doctor` (`DOCTOR_ID`);

--
-- Constraints for table `re_medical_record`
--
ALTER TABLE `re_medical_record`
  ADD CONSTRAINT `RE_MEDICAL_RECORD_FK` FOREIGN KEY (`RECIPIENT_ID`) REFERENCES `recipient` (`RECIPIENT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
