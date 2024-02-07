-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2024 at 07:30 AM
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
-- Database: `signup`
--

-- --------------------------------------------------------

--
-- Table structure for table `areaofwork`
--

CREATE TABLE `areaofwork` (
  `id` int(11) NOT NULL,
  `areaofwork` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `areaofwork`
--

INSERT INTO `areaofwork` (`id`, `areaofwork`) VALUES
(8, 'Modelling'),
(9, 'Detailing'),
(10, 'Checking'),
(11, 'Documentation');

-- --------------------------------------------------------

--
-- Table structure for table `compoff`
--

CREATE TABLE `compoff` (
  `id` int(150) NOT NULL,
  `leaveType` varchar(250) NOT NULL,
  `leaveFrom` varchar(250) NOT NULL,
  `reason` varchar(250) NOT NULL,
  `employeeName` varchar(250) NOT NULL,
  `employeeId` varchar(250) NOT NULL,
  `workHours` varchar(250) NOT NULL,
  `leaveStatus` varchar(250) NOT NULL,
  `eligibility` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `compoff`
--

INSERT INTO `compoff` (`id`, `leaveType`, `leaveFrom`, `reason`, `employeeName`, `employeeId`, `workHours`, `leaveStatus`, `eligibility`) VALUES
(23, 'CompOff', '2023-12-31', 'Personal', 'RAMACHANDHIRAN', '0016', '8', '', ''),
(24, 'CompOff', '2024-01-05', 'pp', 'KanthanPrabhu.P', '0092', '8', 'approved', '8'),
(25, 'CompOff', '2024-01-03', 'Detai', 'Abdulrahman.S', '0264', '8', 'approved', '8');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(150) NOT NULL,
  `designation` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `designation`) VALUES
(7, 'Modeler'),
(8, 'Detailer'),
(9, 'Team Lead'),
(11, 'Section Manager'),
(12, 'HR'),
(13, 'IT Manager'),
(14, 'Checker'),
(15, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `devicelogs`
--

CREATE TABLE `devicelogs` (
  `DeviceLogId` int(11) NOT NULL,
  `DownloadDate` datetime DEFAULT NULL,
  `DeviceId` int(11) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `LogDate` datetime NOT NULL,
  `Direction` varchar(255) DEFAULT NULL,
  `AttDirection` varchar(255) DEFAULT NULL,
  `C1` varchar(255) DEFAULT NULL,
  `C2` varchar(255) DEFAULT NULL,
  `C3` varchar(255) DEFAULT NULL,
  `C4` varchar(255) DEFAULT NULL,
  `C5` varchar(255) DEFAULT NULL,
  `C6` varchar(255) DEFAULT NULL,
  `C7` varchar(255) DEFAULT NULL,
  `WorkCode` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `devicelogs`
--

INSERT INTO `devicelogs` (`DeviceLogId`, `DownloadDate`, `DeviceId`, `UserId`, `LogDate`, `Direction`, `AttDirection`, `C1`, `C2`, `C3`, `C4`, `C5`, `C6`, `C7`, `WorkCode`) VALUES
(1, '2023-09-20 22:38:34', 1, '1234567', '2023-09-19 19:08:33', 'in', 'in', '1', '1', '1', '1', '1', '1', '1', '1234'),
(2, '2023-09-28 22:41:16', 2, '12345678', '2023-09-19 19:11:16', 'in', 'in', '12', '12', '12', '12', '12', '12', '21', '21'),
(4, '2023-09-22 23:56:49', 1, '1234567', '2023-09-19 09:56:49', 'in', 'in', '4', '4', '44', '4', '4', '4', '4', '4');

-- --------------------------------------------------------

--
-- Table structure for table `discipline`
--

CREATE TABLE `discipline` (
  `id` int(150) NOT NULL,
  `discipline` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discipline`
--

INSERT INTO `discipline` (`id`, `discipline`) VALUES
(7, 'Admin'),
(8, 'Structural detailing');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeName` varchar(250) NOT NULL,
  `EMPID` varchar(50) NOT NULL,
  `employeeEmail` varchar(150) NOT NULL,
  `userName` varchar(150) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` varchar(150) NOT NULL,
  `discipline` varchar(250) NOT NULL,
  `designation` varchar(250) NOT NULL,
  `date` varchar(150) NOT NULL,
  `employeeImage` varchar(250) NOT NULL,
  `employeeStatus` varchar(160) NOT NULL,
  `relievingDate` varchar(250) DEFAULT NULL,
  `permanentDate` varchar(250) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeName`, `EMPID`, `employeeEmail`, `userName`, `password`, `role`, `discipline`, `designation`, `date`, `employeeImage`, `employeeStatus`, `relievingDate`, `permanentDate`, `id`) VALUES
('RAMACHANDHIRAN', 'AR0016', 'ramachandhiran@arrisltd.com', 'AR0016', 'ar0016', 'Employee', 'Structural detailing', 'Team Lead', '2018-06-06', 'default-image-filename.jpg', 'Permanent', NULL, NULL, 28),
('Ganeshkumar R', 'AR0006', 'ganeshkumar@arrisltd.com', 'AR0006', 'ar0006', 'Admin', 'Structural detailing', 'Team Lead', '2022-12-02', 'default-image-filename.jpg', 'Permanent', 'null', '2023-12-15', 29),
('Malini', 'AR0100', 'Malini@gmail.com', 'AR0100', 'ar0100', 'TL', 'Structural detailing', 'Checker', '2023-09-14', 'default-image-filename.jpg', 'Permanent', NULL, NULL, 30),
('Sheeba', 'AR0015', 'Sheeba@gmail.com', 'AR0015', 'A66!s$', 'HR', 'Admin', 'HR', '2023-11-02', 'default-image-filename.jpg', 'Permanent', NULL, NULL, 32),
('Manikandan S', 'AR0008', 'Manikandan@gmail.com', 'AR0008', 'ar0008', 'TL', 'Structural detailing', 'Team Lead', '2023-12-01', 'default-image-filename.jpg', 'Probation', NULL, NULL, 33),
('Vimal M', 'AR0084', 'Vimal@gmail.com', 'AR0084', 'ar0084', 'TL', 'Structural detailing', 'Modeler', '2023-11-02', 'default-image-filename.jpg', 'Probation', NULL, NULL, 34),
('KanthanPrabhu.P', 'AR0092', 'KanthanPrabhu@gmail.com', 'AR0092', 'ar0092', 'Employee', 'Structural detailing', 'Detailer', '2023-12-06', 'default-image-filename.jpg', 'Traning', 'null', '2023-12-06', 36),
('Rajaprabhu B', 'AR0011', 'Rajaprabhu@gmail.com', 'AR0011', 'ar0011', 'TL', 'Structural detailing', 'Team Lead', '2023-11-07', 'default-image-filename.jpg', 'Permanent', NULL, NULL, 37),
('Elavarasan C', 'AR0002', 'Elavarasan@gmail.com', 'AR0002', 'ar0002', 'Admin', 'Structural-Detailing', 'Section Manager', '2010-10-11', 'default-image-filename.jpg', 'Permanent', NULL, NULL, 40),
('Ganesh K', 'AR0133', 'ganesh5684@gmail.com', 'AR0133', 'ar0133', 'Admin', 'Admin', 'IT Manager', '2021-02-22', 'default-image-filename.jpg', 'Permanent', 'null', '2021-02-22', 42),
('Ratheesh', 'AR0072', 'Ratheesh@gmail.com', 'AR0072', 'ar0072', 'TL', 'Structural detailing', 'Team Lead', '2023-11-25', 'default-image-filename.jpg', 'Permanent', NULL, NULL, 44),
('RamakrishnaDoss.R', 'AR0122', '', 'AR0122', 'ar0122', 'Employee', 'Structural detailing', 'Detailer', '2022-07-03', 'default-image-filename.jpg', 'Ex-Employee', NULL, NULL, 46),
('Abdulrahman.S', 'AR0264', '', 'AR0264', 'ar0264', 'Employee', 'Structural detailing', 'Detailer', '2023-02-17', 'default-image-filename.jpg', 'Permanent', 'null', '2023-12-01', 48),
('Maheshwaran R', 'AR0045', '', 'AR0045', '123', 'Admin', 'Admin', 'Manager', '2022-03-02', 'default-image-filename.jpg', 'Permanent', NULL, NULL, 49),
('NirmalRaj G,', 'AR0208', '', 'AR0208', '123', 'Employee', 'Structural detailing', 'Team Lead', '2023-11-15', 'default-image-filename.jpg', 'Permanent', NULL, NULL, 53),
('Selvaganesh', 'AR0010', '', 'AR0010', 'ar0010', 'TL', 'Structural detailing', 'Modeler', '2023-08-01', 'default-image-filename.jpg', 'Permanent', NULL, NULL, 54),
('Suresh P', 'AR0117', 'undefined', 'AR0117', '123', 'Employee', 'Structural detailing', 'Modeler', '2023-11-01', 'default-image-filename.jpg', 'Permanent', 'undefined', 'undefined', 55),
('123', '123', '', '123', '123', 'Employee', 'Structural detailing', 'Team Lead', '2024-01-04', 'default-image-filename.jpg', 'Probation', 'null', 'null', 57),
('asdf345', 'd123213421', 'AS@23412', 'ASDFASDF', 'ASDFASDF', 'Employee', 'Admin', 'Modeler', '2024-01-11', 'default-image-filename.jpg', 'Contract', 'null', 'null', 58),
('Vijayanand K', 'AR0058', 'undefined', 'AR0058', '123', 'Employee', 'Structural detailing', 'Modeler', '2024-01-09', 'default-image-filename.jpg', 'Permanent', 'null', 'null', 59);

-- --------------------------------------------------------

--
-- Table structure for table `hr`
--

CREATE TABLE `hr` (
  `id` int(11) NOT NULL,
  `hrName` varchar(250) NOT NULL,
  `userName` varchar(150) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leavedetails`
--

CREATE TABLE `leavedetails` (
  `id` int(150) NOT NULL,
  `leaveType` varchar(150) NOT NULL,
  `leaveFrom` varchar(150) NOT NULL,
  `leaveTo` varchar(150) NOT NULL,
  `leaveHours` varchar(150) NOT NULL,
  `reason` varchar(250) NOT NULL,
  `leaveStatus` varchar(150) NOT NULL,
  `employeeName` varchar(250) NOT NULL,
  `employeeId` varchar(150) NOT NULL,
  `totalLeaves` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `from` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `message` varchar(250) NOT NULL,
  `sendDate` varchar(150) NOT NULL,
  `empId` varchar(250) NOT NULL,
  `tlId` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(150) NOT NULL,
  `tlName` varchar(250) NOT NULL,
  `orderId` varchar(150) NOT NULL,
  `positionNumber` varchar(150) NOT NULL,
  `subPositionNumber` varchar(150) NOT NULL,
  `projectNo` varchar(150) NOT NULL,
  `taskJobNo` varchar(150) NOT NULL,
  `referenceNo` varchar(150) NOT NULL,
  `desciplineCode` varchar(150) NOT NULL,
  `projectName` varchar(150) NOT NULL,
  `subDivision` varchar(150) NOT NULL,
  `startDate` varchar(150) NOT NULL,
  `targetDate` varchar(150) NOT NULL,
  `allotatedHours` varchar(150) NOT NULL,
  `completion` varchar(150) NOT NULL,
  `tlID` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `tlName`, `orderId`, `positionNumber`, `subPositionNumber`, `projectNo`, `taskJobNo`, `referenceNo`, `desciplineCode`, `projectName`, `subDivision`, `startDate`, `targetDate`, `allotatedHours`, `completion`, `tlID`) VALUES
(42, 'Rajaprabhu B', '', '', '', 'GE110', '1', '1', '1', 'JB1120', '', '2024-01-01', '2024-01-31', '750', '', 'AR0011'),
(43, 'Ratheesh', '', '', '', 'JB110', '1', '2', '2', 'Airproduct', '', '2024-01-05', '2024-01-11', '30', '', 'AR0072'),
(44, 'Ganeshkumar R', '', '', '', '123', '1', '3', '1', 'SAIPEM', '', '2024-01-04', '2024-01-13', '10', '', 'AR0006'),
(45, 'Maheshwaran R', '', '', '', 'FBE-22-1834.20.13', '1', '325', '1', 'Vantaa HW  Engineering 4th pass and ECO heating surfaces', '', '2024-01-03', '2024-01-10', '300', '', 'AR0045'),
(46, 'Maheshwaran R', '', '', '', 'FBE-22-1834.20.13', '2', '332', '1', 'Vantaa HW - New opening and modifying existing opening 2d and 3d', '', '2024-01-10', '2024-01-18', '450', '', 'AR0045'),
(47, 'Maheshwaran R', '', '', '', 'FBE-22-1834.20.13', '2', '336', '1', 'Vantaa HWP- Support modelling of blowdown system', '', '2024-01-17', '2024-01-24', '335', '', 'AR0045');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(150) NOT NULL,
  `updateTitle` varchar(250) NOT NULL,
  `UpdateDisc` varchar(250) NOT NULL,
  `Announcements` varchar(250) NOT NULL,
  `Circular` varchar(250) DEFAULT NULL,
  `Gallery` varchar(250) DEFAULT NULL,
  `ViewExcel` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_lead`
--

CREATE TABLE `team_lead` (
  `id` int(150) NOT NULL,
  `leadName` varchar(250) NOT NULL,
  `teamName` varchar(250) NOT NULL,
  `EMPID` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_lead`
--

INSERT INTO `team_lead` (`id`, `leadName`, `teamName`, `EMPID`) VALUES
(30, 'Rajaprabhu B', 'ISGEC', 'AR0011'),
(31, 'Selvaganesh', 'NZ', 'AR0010'),
(32, 'Ratheesh', 'Airproduct', 'AR0072');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userName` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `password`) VALUES
(1, 'admin@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `variation`
--

CREATE TABLE `variation` (
  `id` int(150) NOT NULL,
  `variation` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `variation`
--

INSERT INTO `variation` (`id`, `variation`) VALUES
(3, 'New column');

-- --------------------------------------------------------

--
-- Table structure for table `workdetails`
--

CREATE TABLE `workdetails` (
  `id` int(11) NOT NULL,
  `employeeName` varchar(250) NOT NULL,
  `userName` varchar(250) NOT NULL,
  `referenceNo` varchar(150) NOT NULL,
  `projectName` varchar(250) NOT NULL,
  `tlName` varchar(250) NOT NULL,
  `taskNo` varchar(150) NOT NULL,
  `areaofWork` varchar(250) NOT NULL,
  `variation` varchar(250) NOT NULL,
  `subDivisionList` varchar(250) NOT NULL,
  `subDivision` varchar(250) NOT NULL,
  `monday` varchar(150) NOT NULL,
  `tuesday` varchar(150) NOT NULL,
  `wednesday` varchar(150) NOT NULL,
  `thursday` varchar(150) NOT NULL,
  `friday` varchar(150) NOT NULL,
  `saturday` varchar(150) NOT NULL,
  `sunday` varchar(150) NOT NULL,
  `totalHours` int(150) NOT NULL,
  `weekNumber` varchar(150) NOT NULL,
  `projectNo` varchar(250) DEFAULT NULL,
  `employeeNo` varchar(250) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `discipline` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  `sentDate` varchar(150) NOT NULL,
  `approvedDate` varchar(150) NOT NULL,
  `allotatedHours` varchar(150) NOT NULL,
  `desciplineCode` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workdetails`
--

INSERT INTO `workdetails` (`id`, `employeeName`, `userName`, `referenceNo`, `projectName`, `tlName`, `taskNo`, `areaofWork`, `variation`, `subDivisionList`, `subDivision`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `totalHours`, `weekNumber`, `projectNo`, `employeeNo`, `designation`, `discipline`, `status`, `sentDate`, `approvedDate`, `allotatedHours`, `desciplineCode`) VALUES
(153, 'Ganeshkumar R', 'AR0011', '1', 'JB1120', 'Rajaprabhu B', '1', 'Detailing', '', '', '', '5', '', '', '', '', '', '', 5, '1', 'GE110', 'AR0006', 'Team Lead', 'Structural detailing', '', '2024-01-06T11:33:06.352Z', '', '750', '1'),
(154, 'Ganeshkumar R', 'AR0072', '2', 'Airproduct', 'Ratheesh', '1', 'Checking', '', '', '', '', '10', '', '', '', '', '', 10, '1', 'JB110', 'AR0006', 'Team Lead', 'Structural detailing', '', '2024-01-06T11:33:29.628Z', '', '30', '2'),
(155, 'Ganeshkumar R', 'AR0006', '3', 'SAIPEM', 'Ganeshkumar R', '1', 'Documentation', '', '', '', '', '', '8', '', '', '', '', 8, '1', '123', 'AR0006', 'Team Lead', 'Structural detailing', 'approved', '2024-01-06T11:34:07.717Z', '2024-01-08T13:01:06.566Z', '10', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areaofwork`
--
ALTER TABLE `areaofwork`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compoff`
--
ALTER TABLE `compoff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devicelogs`
--
ALTER TABLE `devicelogs`
  ADD KEY `DeviceLogId` (`DeviceLogId`);

--
-- Indexes for table `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr`
--
ALTER TABLE `hr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavedetails`
--
ALTER TABLE `leavedetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_lead`
--
ALTER TABLE `team_lead`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variation`
--
ALTER TABLE `variation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workdetails`
--
ALTER TABLE `workdetails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areaofwork`
--
ALTER TABLE `areaofwork`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `compoff`
--
ALTER TABLE `compoff`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `devicelogs`
--
ALTER TABLE `devicelogs`
  MODIFY `DeviceLogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70989;

--
-- AUTO_INCREMENT for table `discipline`
--
ALTER TABLE `discipline`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `hr`
--
ALTER TABLE `hr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leavedetails`
--
ALTER TABLE `leavedetails`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `team_lead`
--
ALTER TABLE `team_lead`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variation`
--
ALTER TABLE `variation`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `workdetails`
--
ALTER TABLE `workdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
