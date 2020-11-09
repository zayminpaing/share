-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2020 at 09:18 AM
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
-- Database: `sap`
--

-- --------------------------------------------------------

--
-- Table structure for table `awba_sales`
--

CREATE TABLE `awba_sales` (
  `doc_date` date NOT NULL,
  `customer_code` varchar(10) NOT NULL,
  `item_code` varchar(10) NOT NULL,
  `qty_net` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `awba_sales`
--

INSERT INTO `awba_sales` (`doc_date`, `customer_code`, `item_code`, `qty_net`, `total`) VALUES
('2020-11-01', 'c1', 'item1', 2, 10000),
('2020-11-01', 'c2', 'item1', 3, 15000),
('2020-11-02', 'c3', 'item2', 1, 4000),
('2020-11-02', 'c3', 'item1', 2, 9000),
('2020-11-03', 'c2', 'item2', 4, 16000),
('2020-12-01', 'c1', 'item1', 3, 15000),
('2020-12-01', 'c2', 'item1', 4, 20000),
('2020-12-02', 'c3', 'item2', 2, 8000),
('2020-12-02', 'c3', 'item1', 3, 14000),
('2020-12-03', 'c2', 'item2', 5, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `awba_target`
--

CREATE TABLE `awba_target` (
  `month` date NOT NULL,
  `customer_code` varchar(10) NOT NULL,
  `item_code` varchar(10) NOT NULL,
  `target_quantity` int(11) NOT NULL,
  `target_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `awba_target`
--

INSERT INTO `awba_target` (`month`, `customer_code`, `item_code`, `target_quantity`, `target_amount`) VALUES
('2020-11-01', 'c1', 'item1', 4, 20000),
('2020-11-01', 'c1', 'item2', 2, 8000),
('2020-11-01', 'c2', 'item1', 3, 15000),
('2020-11-01', 'c2', 'item2', 1, 4000),
('2020-11-01', 'c3', 'item1', 5, 25000),
('2020-11-01', 'c3', 'item2', 3, 12000),
('2020-12-01', 'c1', 'item1', 5, 25000),
('2020-12-01', 'c1', 'item2', 3, 12000),
('2020-12-01', 'c2', 'item1', 4, 20000),
('2020-12-01', 'c2', 'item2', 2, 8000),
('2020-12-01', 'c3', 'item1', 3, 15000),
('2020-12-01', 'c3', 'item2', 1, 4000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sales_target`
-- (See below for the actual view)
--
CREATE TABLE `sales_target` (
`sales_month` int(11)
,`sales_customer_code` varchar(10)
,`sales_item_code` varchar(10)
,`qty_net` decimal(32,0)
,`total` decimal(32,0)
,`target_month` int(11)
,`target_customer_code` varchar(10)
,`target_item_code` varchar(10)
,`target_quantity` decimal(32,0)
,`target_amount` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Structure for view `sales_target`
--
DROP TABLE IF EXISTS `sales_target`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_target`  AS  select `sales`.`sales_month` AS `sales_month`,`sales`.`sales_customer_code` AS `sales_customer_code`,`sales`.`sales_item_code` AS `sales_item_code`,`sales`.`qty_net` AS `qty_net`,`sales`.`total` AS `total`,`target`.`target_month` AS `target_month`,`target`.`target_customer_code` AS `target_customer_code`,`target`.`target_item_code` AS `target_item_code`,`target`.`target_quantity` AS `target_quantity`,`target`.`target_amount` AS `target_amount` from ((select month(`awba_sales`.`doc_date`) AS `sales_month`,`awba_sales`.`customer_code` AS `sales_customer_code`,`awba_sales`.`item_code` AS `sales_item_code`,sum(`awba_sales`.`qty_net`) AS `qty_net`,sum(`awba_sales`.`total`) AS `total` from `awba_sales` group by `awba_sales`.`doc_date`,`awba_sales`.`customer_code`,`awba_sales`.`item_code` order by `awba_sales`.`doc_date`) `sales` left join (select month(`awba_target`.`month`) AS `target_month`,`awba_target`.`customer_code` AS `target_customer_code`,`awba_target`.`item_code` AS `target_item_code`,sum(`awba_target`.`target_quantity`) AS `target_quantity`,sum(`awba_target`.`target_amount`) AS `target_amount` from `awba_target` group by `awba_target`.`month`,`awba_target`.`customer_code`,`awba_target`.`item_code` order by `awba_target`.`month`) `target` on(`sales`.`sales_month` = `target`.`target_month` and `sales`.`sales_customer_code` = `target`.`target_customer_code` and `sales`.`sales_item_code` = `target`.`target_item_code`)) union select `sales`.`sales_month` AS `sales_month`,`sales`.`sales_customer_code` AS `sales_customer_code`,`sales`.`sales_item_code` AS `sales_item_code`,`sales`.`qty_net` AS `qty_net`,`sales`.`total` AS `total`,`target`.`target_month` AS `target_month`,`target`.`target_customer_code` AS `target_customer_code`,`target`.`target_item_code` AS `target_item_code`,`target`.`target_quantity` AS `target_quantity`,`target`.`target_amount` AS `target_amount` from ((select month(`awba_target`.`month`) AS `target_month`,`awba_target`.`customer_code` AS `target_customer_code`,`awba_target`.`item_code` AS `target_item_code`,sum(`awba_target`.`target_quantity`) AS `target_quantity`,sum(`awba_target`.`target_amount`) AS `target_amount` from `awba_target` group by `awba_target`.`month`,`awba_target`.`customer_code`,`awba_target`.`item_code` order by `awba_target`.`month`) `target` left join (select month(`awba_sales`.`doc_date`) AS `sales_month`,`awba_sales`.`customer_code` AS `sales_customer_code`,`awba_sales`.`item_code` AS `sales_item_code`,sum(`awba_sales`.`qty_net`) AS `qty_net`,sum(`awba_sales`.`total`) AS `total` from `awba_sales` group by `awba_sales`.`doc_date`,`awba_sales`.`customer_code`,`awba_sales`.`item_code` order by `awba_sales`.`doc_date`) `sales` on(`sales`.`sales_month` = `target`.`target_month` and `sales`.`sales_customer_code` = `target`.`target_customer_code` and `sales`.`sales_item_code` = `target`.`target_item_code`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
