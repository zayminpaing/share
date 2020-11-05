-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2020 at 09:20 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`) VALUES
(1, 'Agrigate'),
(2, 'ASIC'),
(3, 'Awba'),
(4, 'Awba Group'),
(5, 'Evo'),
(6, 'HAIC'),
(7, 'MAFSCO'),
(8, 'Maha Microfinance'),
(9, 'Mahamate'),
(10, 'MAI'),
(11, 'MKTK'),
(12, 'MSCN'),
(13, 'Pahtama Seed'),
(14, 'PTPZ'),
(15, 'Village Link'),
(16, 'WSR');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'Account'),
(2, 'Admin'),
(3, 'Audit'),
(4, 'Chairman Office'),
(5, 'Cooperative'),
(6, 'Coorporate Affairs and Special'),
(7, 'Customer Service/Order Process'),
(8, 'Delivery'),
(9, 'DXIT'),
(10, 'Engineering'),
(11, 'Finance/Account'),
(12, 'HAIC'),
(13, 'HR'),
(14, 'HSE'),
(15, 'Internal Audit'),
(16, 'IT'),
(17, 'Legal'),
(18, 'Logistic'),
(19, 'Management'),
(20, 'Market Communication'),
(21, 'Marketing'),
(22, 'Operation'),
(23, 'Order'),
(24, 'Product Registration'),
(25, 'Production'),
(26, 'QA'),
(27, 'Trading'),
(28, 'Warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `is_multiple_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `name`, `is_multiple_tag`) VALUES
(1, 'CUG', 1),
(2, 'Denko', 1),
(3, 'FMS', 1),
(4, 'IT Support', 1),
(5, 'Kaizala', 1),
(6, 'Loyalty', 1),
(7, 'Loyalty 2.0', 1),
(8, 'SAP', 1),
(9, 'User Support', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_tag`
--

CREATE TABLE `project_tag` (
  `project_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_tag`
--

INSERT INTO `project_tag` (`project_id`, `tag_id`) VALUES
(8, 19),
(8, 10),
(8, 24),
(8, 14),
(8, 4),
(6, 15),
(6, 5),
(6, 9),
(6, 6),
(6, 8),
(6, 27),
(4, 11),
(4, 17),
(9, 13),
(9, 20),
(9, 21),
(9, 18),
(9, 28),
(9, 26),
(1, 3),
(1, 2),
(1, 7),
(1, 16),
(2, 22),
(2, 12),
(3, 22),
(3, 12),
(5, 25),
(5, 12),
(7, 1),
(7, 25),
(7, 8),
(7, 23);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Non-DXIT Employee'),
(2, 'Non-DXIT Manager'),
(3, 'Non-DXIT Administrator'),
(4, 'DXIT Employee'),
(5, 'DXIT Manager'),
(6, 'DXIT Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `value` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `value`) VALUES
(1, 'Opened'),
(2, 'Assigned'),
(3, 'Resolved'),
(4, 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `support_type`
--

CREATE TABLE `support_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `support_type`
--

INSERT INTO `support_type` (`id`, `name`) VALUES
(1, 'Admin Portal'),
(2, 'Communication Apps'),
(3, 'Direct Support'),
(4, 'Email'),
(5, 'Phone Call'),
(6, 'Phone Service'),
(7, 'Remote'),
(8, 'Teams call'),
(9, 'Ticket open'),
(10, 'Whatsapp');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `value`) VALUES
(1, 'App Issue'),
(2, 'Balance Issue'),
(3, 'Billing Issue'),
(4, 'Budget and Billing Request'),
(5, 'Channel app Issue'),
(6, 'Client PC Issue'),
(7, 'Connection Issue'),
(8, 'Data Retrieve Support'),
(9, 'Database Issue'),
(10, 'Functional Issue'),
(11, 'Internet billing issue'),
(12, 'Issue'),
(13, 'Laptop and Accessories Purchase issue'),
(14, 'License Request'),
(15, 'Maintenance Support'),
(16, 'Monthly Request'),
(17, 'Network issue'),
(18, 'Office 365 Issue'),
(19, 'Operational Issue'),
(20, 'Outlook Issue'),
(21, 'Printer/Scanner Issue'),
(22, 'Request'),
(23, 'Requirement Request'),
(24, 'Server Issue'),
(25, 'Training'),
(26, 'Unicode Issue'),
(27, 'User Role Request'),
(28, 'Windows/Software Setup');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `open_person` int(11) NOT NULL,
  `open_date` varchar(50) NOT NULL,
  `assign_person` int(11) NOT NULL,
  `assign_date` varchar(50) NOT NULL,
  `resolve_person` int(11) NOT NULL,
  `resolve_date` varchar(50) NOT NULL,
  `resolution_description` text NOT NULL,
  `close_person` int(11) NOT NULL,
  `close_date` varchar(50) NOT NULL,
  `support_type_id` int(11) NOT NULL,
  `remark` text NOT NULL,
  `open_dow` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tag`
--

CREATE TABLE `ticket_tag` (
  `ticket_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(70) NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `position` varchar(40) NOT NULL,
  `is_verified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_tag`
--
ALTER TABLE `project_tag`
  ADD KEY `project_tag_project` (`project_id`),
  ADD KEY `project_tag_tag` (`tag_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_type`
--
ALTER TABLE `support_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_project` (`project_id`),
  ADD KEY `ticket_status` (`status_id`),
  ADD KEY `ticket_close_person` (`user_id`),
  ADD KEY `ticket_support_type` (`support_type_id`);

--
-- Indexes for table `ticket_tag`
--
ALTER TABLE `ticket_tag`
  ADD KEY `ticket_tag_ticket` (`ticket_id`),
  ADD KEY `ticket_tag_tag` (`tag_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_company` (`company_id`),
  ADD KEY `user_department` (`department_id`),
  ADD KEY `user_role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `support_type`
--
ALTER TABLE `support_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206207;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=575;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project_tag`
--
ALTER TABLE `project_tag`
  ADD CONSTRAINT `project_tag_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `project_tag_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_assign_person` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `ticket_close_person` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `ticket_open_person` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `ticket_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `ticket_resolve_person` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `ticket_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `ticket_support_type` FOREIGN KEY (`support_type_id`) REFERENCES `support_type` (`id`),
  ADD CONSTRAINT `ticket_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `ticket_tag`
--
ALTER TABLE `ticket_tag`
  ADD CONSTRAINT `ticket_tag_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`),
  ADD CONSTRAINT `ticket_tag_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `user_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
