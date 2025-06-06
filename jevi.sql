-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2025 at 01:42 PM
-- Server version: 10.6.21-MariaDB-cll-lve-log
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dortxpbw_jevi`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_class`
--

CREATE TABLE `account_class` (
  `class_id` int(11) NOT NULL,
  `account_group` int(11) NOT NULL,
  `sub_group` int(11) NOT NULL,
  `class` varchar(1024) NOT NULL,
  `class_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_class`
--

INSERT INTO `account_class` (`class_id`, `account_group`, `sub_group`, `class`, `class_code`) VALUES
(1, 1, 1, 'Bank', 0),
(2, 1, 1, 'Cash', 0),
(3, 1, 1, 'Inventories', 0),
(4, 1, 1, 'Trade Receivables', 0),
(5, 1, 2, 'Properties, Plants And Equipment', 0),
(6, 1, 2, 'Accum Depre Properties, Plant And Equipment', 0),
(7, 2, 3, 'Account Payables', 0),
(8, 2, 3, 'Tax Payables', 0),
(9, 2, 3, 'Other Payables', 0),
(10, 2, 4, 'Loans', 0),
(11, 3, 5, 'Revenue', 0),
(12, 4, 6, 'Admin And General Expense', 0),
(13, 4, 6, 'Other Expense', 0),
(14, 4, 7, 'Cost Of Sales', 0),
(15, 4, 8, 'Depreciation', 0),
(16, 5, 9, 'Share Capital', 0),
(17, 5, 9, 'Retained Earnings', 0),
(18, 4, 10, 'Loss On Disposal Of Asset', 0),
(19, 3, 5, 'Other Revenue', 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_groups`
--

CREATE TABLE `account_groups` (
  `account_id` int(11) NOT NULL,
  `account_group` varchar(50) NOT NULL,
  `account_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_groups`
--

INSERT INTO `account_groups` (`account_id`, `account_group`, `account_code`) VALUES
(1, 'Assets', 0),
(2, 'Liabilities', 0),
(3, 'Income', 0),
(4, 'Expenses', 0),
(5, 'Equity', 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_sub_groups`
--

CREATE TABLE `account_sub_groups` (
  `sub_group_id` int(11) NOT NULL,
  `account_group` int(11) NOT NULL,
  `sub_group` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_sub_groups`
--

INSERT INTO `account_sub_groups` (`sub_group_id`, `account_group`, `sub_group`) VALUES
(1, 1, 'Current Asset'),
(2, 1, 'Fixed Assets'),
(3, 2, 'Current Liabilities'),
(4, 2, 'Non Current Liabilities'),
(5, 3, 'Income'),
(6, 4, 'Operating Expenses'),
(7, 4, 'Cost Of Sales'),
(8, 4, 'Depreciation'),
(9, 5, 'Share Capital'),
(10, 4, 'Disposal Of Asset');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `asset_id` int(11) NOT NULL,
  `asset` varchar(255) NOT NULL,
  `asset_no` varchar(50) NOT NULL,
  `location` int(11) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `accum_dep` decimal(12,2) NOT NULL,
  `useful_life` float NOT NULL,
  `salvage_value` decimal(12,2) NOT NULL,
  `book_value` decimal(12,2) NOT NULL,
  `ledger` int(50) NOT NULL,
  `specification` text NOT NULL,
  `asset_status` int(11) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `deployment_date` date DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_locations`
--

CREATE TABLE `asset_locations` (
  `location_id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_locations`
--

INSERT INTO `asset_locations` (`location_id`, `location`) VALUES
(1, 'SECURITY POST'),
(2, 'FRONT DESK'),
(3, 'ICT'),
(4, 'PROCUREMENT'),
(5, 'HEAD OFFICE');

-- --------------------------------------------------------

--
-- Table structure for table `asset_postings`
--

CREATE TABLE `asset_postings` (
  `asset_id` int(11) NOT NULL,
  `asset` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `asset_ledger` int(11) NOT NULL,
  `contra_ledger` int(11) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `trans_date` date DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `audit_id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `transaction` varchar(255) NOT NULL,
  `previous_qty` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `bank_id` int(11) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`bank_id`, `bank`, `account_number`) VALUES
(6, 'STANBIC IBTC', '1010150'),
(7, 'FIDELITY BANK', '1010151'),
(8, 'FIRST BANK', '1010152'),
(9, 'STANBIC IBTC 2', '1010153'),
(10, 'FOREX', '1010199');

-- --------------------------------------------------------

--
-- Table structure for table `cash_flows`
--

CREATE TABLE `cash_flows` (
  `fow_id` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `trans_type` varchar(50) NOT NULL,
  `activity` varchar(50) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_flows`
--

INSERT INTO `cash_flows` (`fow_id`, `account`, `details`, `trx_number`, `amount`, `trans_type`, `activity`, `post_date`, `posted_by`) VALUES
(1, 1010150, 'Net Income', 'TR787041124085857', 0.00, 'inflow', 'operating', '2024-11-04 08:58:57', 3),
(3, 1010150, 'inventory purchase', 'TR754081124101225', 10967569.00, 'outflow', 'operating', '2024-11-08 10:12:25', 3),
(5, 1010150, 'inventory purchase', 'TR984081124101718', 53962199.00, 'outflow', 'operating', '2024-11-08 10:17:18', 3),
(6, 1010150, 'inventory purchase', 'TR449081124101854', 3677265.00, 'outflow', 'operating', '2024-11-08 10:18:54', 3),
(7, 1010150, 'inventory purchase', 'TR342081124102013', 154654.00, 'outflow', 'operating', '2024-11-08 10:20:13', 3),
(8, 1010150, 'inventory purchase', 'TR330081124102111', 2035793.00, 'outflow', 'operating', '2024-11-08 10:21:11', 3),
(9, 1010150, 'inventory purchase', 'TR176081124102206', 1182649.00, 'outflow', 'operating', '2024-11-08 10:22:06', 3),
(10, 1010150, 'inventory purchase', 'TR610081124102330', 21049614.00, 'outflow', 'operating', '2024-11-08 10:23:30', 3),
(11, 1010150, 'inventory purchase', 'TR895081124102952', 29879348.00, 'outflow', 'operating', '2024-11-08 10:29:52', 3),
(12, 1010150, 'inventory purchase', 'TR234081124114344', 112035107.00, 'outflow', 'operating', '2024-11-08 11:43:44', 3),
(13, 1010150, 'inventory purchase', 'TR150081124114712', 54039962.00, 'outflow', 'operating', '2024-11-08 11:47:12', 3),
(14, 1010150, 'inventory purchase', 'TR137081124115317', 83203563.00, 'outflow', 'operating', '2024-11-08 11:53:17', 3),
(16, 1010152, 'inventory purchase', 'TR855081124120924', 27678517.00, 'outflow', 'operating', '2024-11-08 12:09:24', 3),
(17, 1010150, 'inventory purchase', 'TR146081124121309', 45430915.00, 'outflow', 'operating', '2024-11-08 12:13:09', 3),
(18, 1010150, 'inventory purchase', 'TR030081124122018', 22226514.00, 'outflow', 'operating', '2024-11-08 12:20:18', 3),
(19, 1010150, 'inventory purchase', 'TR962081124122406', 22226514.00, 'outflow', 'operating', '2024-11-08 12:24:06', 3),
(20, 1010150, 'inventory purchase', 'TR252081124014054', 345064.00, 'outflow', 'operating', '2024-11-08 13:40:54', 3),
(21, 1010150, 'inventory purchase', 'TR444081124043630', 28054000.00, 'outflow', 'operating', '2024-11-08 16:36:30', 3),
(22, 1010150, 'inventory purchase', 'TR905121124023917', 1647502.00, 'outflow', 'operating', '2024-11-12 14:39:17', 3),
(23, 1010150, 'Director Remuneration', 'TR908121124025340', 3000.00, 'outflow', 'financing', '2024-11-12 14:53:40', 3),
(24, 1010150, 'inventory purchase', 'TR039121124031252', 9097300.00, 'outflow', 'operating', '2024-11-12 15:12:52', 3),
(25, 1010153, 'inventory purchase', 'TR011121124035448', 937874.00, 'outflow', 'operating', '2024-11-12 15:54:48', 3),
(26, 1010152, 'inventory purchase', 'TR863121124041224', 36389200.00, 'outflow', 'operating', '2024-11-12 16:12:24', 3),
(27, 1010150, 'inventory purchase', 'TR859121124041707', 25410578.00, 'outflow', 'operating', '2024-11-12 16:17:07', 3),
(28, 1010150, 'inventory purchase', 'TR440121124043311', 70493158.00, 'outflow', 'operating', '2024-11-12 16:33:11', 3),
(29, 1010150, 'inventory purchase', 'TR155121124043656', 47167772.00, 'outflow', 'operating', '2024-11-12 16:36:56', 3),
(30, 1010150, 'inventory purchase', 'TR573121124044834', 3566141.00, 'outflow', 'operating', '2024-11-12 16:48:34', 3),
(31, 1010150, 'inventory purchase', 'TR424121124045936', 1601124.00, 'outflow', 'operating', '2024-11-12 16:59:36', 3),
(32, 1010150, 'inventory purchase', 'TR309141124094225', 14020700.00, 'outflow', 'operating', '2024-11-14 09:42:25', 3),
(33, 1010150, 'inventory purchase', 'TR771141124094712', 84714962.00, 'outflow', 'operating', '2024-11-14 09:47:12', 3),
(34, 1010150, 'inventory purchase', 'TR922141124095056', 103540514.00, 'outflow', 'operating', '2024-11-14 09:50:56', 3),
(35, 1010150, 'inventory purchase', 'TR790141124095508', 3617340.00, 'outflow', 'operating', '2024-11-14 09:55:08', 3),
(36, 1010150, 'inventory purchase', 'TR397141124100901', 20529644.00, 'outflow', 'operating', '2024-11-14 10:09:01', 3),
(37, 1010150, 'inventory purchase', 'TR765141124101425', 7560700.00, 'outflow', 'operating', '2024-11-14 10:14:25', 3),
(38, 1010150, 'inventory purchase', 'TR075141124101733', 7560700.00, 'outflow', 'operating', '2024-11-14 10:17:33', 3),
(39, 1010150, 'inventory purchase', 'TR828141124103107', 10009474.00, 'outflow', 'operating', '2024-11-14 10:31:07', 3),
(42, 1010150, 'expense', 'TR304141124045216', 22735176.11, 'outflow', 'operating', '2024-11-14 16:52:16', 3),
(43, 1010150, 'inventory purchase', 'TR484151124095243', 13487359.00, 'outflow', 'operating', '2024-11-15 09:52:43', 3),
(44, 1010150, 'inventory purchase', 'TR783151124100105', 48670215.00, 'outflow', 'operating', '2024-11-15 10:01:05', 3),
(45, 1010150, 'inventory purchase', 'TR782151124101356', 14766262.00, 'outflow', 'operating', '2024-11-15 10:13:56', 3),
(46, 1010150, 'inventory purchase', 'TR332151124104801', 3007588.00, 'outflow', 'operating', '2024-11-15 10:48:01', 3),
(47, 1010150, 'inventory purchase', 'TR299151124110119', 29878721.00, 'outflow', 'operating', '2024-11-15 11:01:19', 3),
(48, 1010150, 'inventory purchase', 'TR707151124110617', 39681547.00, 'outflow', 'operating', '2024-11-15 11:06:17', 3),
(49, 1010150, 'inventory purchase', 'TR427151124111747', 32954898.00, 'outflow', 'operating', '2024-11-15 11:17:47', 3),
(50, 1010150, 'inventory purchase', 'TR117151124112135', 288370674.00, 'outflow', 'operating', '2024-11-15 11:21:35', 3),
(51, 1010150, 'inventory purchase', 'TR920151124114408', 36546436.00, 'outflow', 'operating', '2024-11-15 11:44:08', 3),
(52, 1010150, 'inventory purchase', 'TR161151124115235', 99264048.00, 'outflow', 'operating', '2024-11-15 11:52:35', 3),
(53, 1010150, 'inventory purchase', 'TR552151124120710', 31362600.00, 'outflow', 'operating', '2024-11-15 12:07:10', 3),
(54, 1010150, 'inventory purchase', 'TR077221124100815', 23471565.00, 'outflow', 'operating', '2024-11-22 10:08:15', 3),
(55, 1010150, 'inventory purchase', 'TR484221124101245', 754270.00, 'outflow', 'operating', '2024-11-22 10:12:45', 3),
(56, 1010150, 'inventory purchase', 'TR289221124102052', 10976910.00, 'outflow', 'operating', '2024-11-22 10:20:52', 3),
(57, 1010150, 'inventory purchase', 'TR708221124103504', 19981096.00, 'outflow', 'operating', '2024-11-22 10:35:04', 3),
(58, 1010150, 'inventory purchase', 'TR607221124110037', 2979447.00, 'outflow', 'operating', '2024-11-22 11:00:37', 3),
(59, 1010150, 'inventory purchase', 'TR584221124110113', 2979447.00, 'outflow', 'operating', '2024-11-22 11:01:13', 3),
(60, 1010150, 'inventory purchase', 'TR526221124110608', 27221670.00, 'outflow', 'operating', '2024-11-22 11:06:08', 3),
(61, 1010150, 'inventory purchase', 'TR639221124112423', 3080309.00, 'outflow', 'operating', '2024-11-22 11:24:23', 3),
(62, 1010150, 'inventory purchase', 'TR306221124112520', 3080309.00, 'outflow', 'operating', '2024-11-22 11:25:20', 3),
(63, 1010150, 'inventory purchase', 'TR114221124114719', 559678.00, 'outflow', 'operating', '2024-11-22 11:47:19', 3),
(64, 1010150, 'inventory purchase', 'TR725051224111452', 20656699.00, 'outflow', 'operating', '2024-12-05 11:14:52', 3),
(65, 1010150, 'inventory purchase', 'TR769051224111939', 60617722.00, 'outflow', 'operating', '2024-12-05 11:19:39', 3),
(66, 1010150, 'inventory purchase', 'TR016051224112404', 43171860.00, 'outflow', 'operating', '2024-12-05 11:24:04', 3),
(67, 1010150, 'inventory purchase', 'TR727051224115704', 30820618.00, 'outflow', 'operating', '2024-12-05 11:57:04', 3),
(68, 1010150, 'inventory purchase', 'TR222051224120514', 2275277.00, 'outflow', 'operating', '2024-12-05 12:05:14', 3),
(69, 1010150, 'inventory purchase', 'TR083051224121214', 64009275.00, 'outflow', 'operating', '2024-12-05 12:12:14', 3),
(70, 1010150, 'inventory purchase', 'TR670051224125420', 8597319.00, 'outflow', 'operating', '2024-12-05 12:54:20', 3),
(71, 1010150, 'inventory purchase', 'TR856051224125706', 7177372.00, 'outflow', 'operating', '2024-12-05 12:57:06', 3),
(72, 1010150, 'inventory purchase', 'TR301051224125928', 11034360.00, 'outflow', 'operating', '2024-12-05 12:59:28', 3),
(73, 1010150, 'inventory purchase', 'TR952051224010343', 26623049.00, 'outflow', 'operating', '2024-12-05 13:03:43', 3),
(74, 1010150, 'inventory purchase', 'TR357051224010547', 10617506.00, 'outflow', 'operating', '2024-12-05 13:05:47', 3),
(75, 1010150, 'inventory purchase', 'TR564051224010842', 1803849.00, 'outflow', 'operating', '2024-12-05 13:08:42', 3),
(76, 1010150, 'inventory purchase', 'TR277051224011549', 70292960.00, 'outflow', 'operating', '2024-12-05 13:15:49', 3),
(77, 1010150, 'inventory purchase', 'TR247051224011815', 10411569.00, 'outflow', 'operating', '2024-12-05 13:18:15', 3),
(78, 1010150, 'inventory purchase', 'TR177051224012016', 20657875.00, 'outflow', 'operating', '2024-12-05 13:20:16', 3),
(79, 1010150, 'inventory purchase', 'TR589051224012229', 2776418.00, 'outflow', 'operating', '2024-12-05 13:22:29', 3),
(80, 1010150, 'inventory purchase', 'TR462051224012520', 85898088.00, 'outflow', 'operating', '2024-12-05 13:25:20', 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL,
  `category` varchar(1024) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `company` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `company`, `logo`, `date_created`) VALUES
(1, 'Jevi Austin International Company', 'jevi.png', '2024-08-28 14:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `cost_of_sales`
--

CREATE TABLE `cost_of_sales` (
  `cost_of_sales_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `store` int(11) NOT NULL,
  `trans_date` date DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cost_of_sales`
--

INSERT INTO `cost_of_sales` (`cost_of_sales_id`, `amount`, `details`, `trx_number`, `store`, `trans_date`, `post_date`, `posted_by`) VALUES
(2, 9674940.00, 'cost of sales', 'TR754081124101225', 1, '2024-11-08', '2024-11-08 10:12:25', 3),
(4, 53962199.69, 'cost of sales', 'TR984081124101718', 1, '2024-11-08', '2024-11-08 10:17:18', 3),
(5, 3677265.12, 'cost of sales', 'TR449081124101854', 1, '2024-11-08', '2024-11-08 10:18:54', 3),
(6, 154654.10, 'cost of sales', 'TR342081124102013', 1, '2024-11-08', '2024-11-08 10:20:13', 3),
(7, 2035793.79, 'cost of sales', 'TR330081124102111', 1, '2024-11-08', '2024-11-08 10:21:11', 3),
(8, 1182649.00, 'cost of sales', 'TR176081124102206', 1, '2024-11-08', '2024-11-08 10:22:06', 3),
(9, 21049614.76, 'cost of sales', 'TR610081124102330', 1, '2024-11-08', '2024-11-08 10:23:30', 3),
(10, 29879348.25, 'cost of sales', 'TR895081124102952', 1, '2024-11-08', '2024-11-08 10:29:52', 3),
(11, 112035107.80, 'cost of sales', 'TR234081124114344', 1, '2024-11-08', '2024-11-08 11:43:44', 3),
(12, 54039962.00, 'cost of sales', 'TR150081124114712', 1, '2024-11-08', '2024-11-08 11:47:12', 3),
(13, 83203563.14, 'cost of sales', 'TR137081124115317', 1, '2024-11-08', '2024-11-08 11:53:17', 3),
(15, 27678517.55, 'cost of sales', 'TR855081124120924', 1, '2024-11-08', '2024-11-08 12:09:24', 3),
(16, 45430915.99, 'cost of sales', 'TR146081124121309', 1, '2024-11-08', '2024-11-08 12:13:09', 3),
(17, 22226514.26, 'cost of sales', 'TR030081124122018', 1, '2024-11-08', '2024-11-08 12:20:18', 3),
(18, 22226514.26, 'cost of sales', 'TR962081124122406', 1, '2024-11-08', '2024-11-08 12:24:06', 3),
(19, 345064.20, 'cost of sales', 'TR252081124014054', 1, '2024-11-08', '2024-11-08 13:40:54', 3),
(20, 28054000.00, 'cost of sales', 'TR444081124043630', 1, '2024-11-08', '2024-11-08 16:36:30', 3),
(21, 1647502.84, 'cost of sales', 'TR905121124023917', 1, '2024-11-12', '2024-11-12 14:39:17', 3),
(22, 9097300.00, 'cost of sales', 'TR039121124031252', 1, '2024-11-12', '2024-11-12 15:12:52', 3),
(23, 937874.70, 'cost of sales', 'TR011121124035448', 1, '2024-11-12', '2024-11-12 15:54:48', 3),
(24, 36389200.00, 'cost of sales', 'TR863121124041224', 1, '2024-11-12', '2024-11-12 16:12:24', 3),
(25, 25410578.36, 'cost of sales', 'TR859121124041707', 1, '2024-11-12', '2024-11-12 16:17:07', 3),
(26, 70493158.24, 'cost of sales', 'TR440121124043311', 1, '2024-11-12', '2024-11-12 16:33:11', 3),
(27, 47167772.01, 'cost of sales', 'TR155121124043656', 1, '2024-11-12', '2024-11-12 16:36:56', 3),
(28, 3566141.60, 'cost of sales', 'TR573121124044834', 1, '2024-11-12', '2024-11-12 16:48:34', 3),
(29, 1601124.80, 'cost of sales', 'TR424121124045936', 1, '2024-11-12', '2024-11-12 16:59:36', 3),
(30, 14020700.00, 'cost of sales', 'TR309141124094225', 1, '2024-11-14', '2024-11-14 09:42:25', 3),
(31, 84714962.20, 'cost of sales', 'TR771141124094712', 1, '2024-11-14', '2024-11-14 09:47:12', 3),
(32, 103540514.02, 'cost of sales', 'TR922141124095056', 1, '2024-11-14', '2024-11-14 09:50:56', 3),
(33, 3617340.60, 'cost of sales', 'TR790141124095508', 1, '2024-11-14', '2024-11-14 09:55:08', 3),
(34, 20529644.32, 'cost of sales', 'TR397141124100901', 1, '2024-11-14', '2024-11-14 10:09:01', 3),
(35, 7560700.00, 'cost of sales', 'TR765141124101425', 1, '2024-11-14', '2024-11-14 10:14:25', 3),
(36, 7560700.00, 'cost of sales', 'TR075141124101733', 1, '2024-11-14', '2024-11-14 10:17:33', 3),
(37, 10009474.64, 'cost of sales', 'TR828141124103107', 1, '2024-11-14', '2024-11-14 10:31:07', 3),
(38, 13487359.94, 'cost of sales', 'TR484151124095243', 1, '2024-11-15', '2024-11-15 09:52:43', 3),
(39, 48670215.00, 'cost of sales', 'TR783151124100105', 1, '2024-11-15', '2024-11-15 10:01:05', 3),
(40, 14766262.43, 'cost of sales', 'TR782151124101356', 1, '2024-11-15', '2024-11-15 10:13:56', 3),
(41, 3007588.10, 'cost of sales', 'TR332151124104801', 1, '2024-11-15', '2024-11-15 10:48:01', 3),
(42, 29878721.44, 'cost of sales', 'TR299151124110119', 1, '2024-11-15', '2024-11-15 11:01:19', 3),
(43, 39681547.80, 'cost of sales', 'TR707151124110617', 1, '2024-11-15', '2024-11-15 11:06:17', 3),
(44, 32954898.43, 'cost of sales', 'TR427151124111747', 1, '2024-11-15', '2024-11-15 11:17:47', 3),
(45, 288370674.75, 'cost of sales', 'TR117151124112135', 1, '2024-11-15', '2024-11-15 11:21:35', 3),
(46, 36546436.80, 'cost of sales', 'TR920151124114408', 1, '2024-11-15', '2024-11-15 11:44:08', 3),
(47, 99264048.70, 'cost of sales', 'TR161151124115235', 1, '2024-11-15', '2024-11-15 11:52:35', 3),
(48, 31362600.00, 'cost of sales', 'TR552151124120710', 1, '2024-11-15', '2024-11-15 12:07:10', 3),
(49, 23471565.98, 'cost of sales', 'TR077221124100815', 1, '2024-11-22', '2024-11-22 10:08:15', 3),
(50, 754270.53, 'cost of sales', 'TR484221124101245', 1, '2024-11-22', '2024-11-22 10:12:45', 3),
(51, 10976910.00, 'cost of sales', 'TR289221124102052', 1, '2024-11-22', '2024-11-22 10:20:52', 3),
(52, 19981096.78, 'cost of sales', 'TR708221124103504', 1, '2024-11-22', '2024-11-22 10:35:04', 3),
(53, 2979447.00, 'cost of sales', 'TR607221124110037', 1, '2024-11-22', '2024-11-22 11:00:37', 3),
(54, 2979447.00, 'cost of sales', 'TR584221124110113', 1, '2024-11-22', '2024-11-22 11:01:13', 3),
(55, 27221670.47, 'cost of sales', 'TR526221124110608', 1, '2024-11-22', '2024-11-22 11:06:08', 3),
(56, 3080309.12, 'cost of sales', 'TR639221124112423', 1, '2024-11-22', '2024-11-22 11:24:23', 3),
(57, 3080309.12, 'cost of sales', 'TR306221124112520', 1, '2024-11-22', '2024-11-22 11:25:20', 3),
(58, 559678.11, 'cost of sales', 'TR114221124114719', 1, '2024-11-22', '2024-11-22 11:47:19', 3),
(59, 20656699.50, 'cost of sales', 'TR725051224111452', 1, '2024-12-05', '2024-12-05 11:14:52', 3),
(60, 60617722.00, 'cost of sales', 'TR769051224111939', 1, '2024-12-05', '2024-12-05 11:19:39', 3),
(61, 43171860.35, 'cost of sales', 'TR016051224112404', 1, '2024-12-05', '2024-12-05 11:24:04', 3),
(62, 30820618.54, 'cost of sales', 'TR727051224115704', 1, '2024-12-05', '2024-12-05 11:57:04', 3),
(63, 2275277.26, 'cost of sales', 'TR222051224120514', 1, '2024-12-05', '2024-12-05 12:05:14', 3),
(64, 64009275.42, 'cost of sales', 'TR083051224121214', 1, '2024-12-05', '2024-12-05 12:12:14', 3),
(65, 8597319.42, 'cost of sales', 'TR670051224125420', 1, '2024-12-05', '2024-12-05 12:54:20', 3),
(66, 7177372.09, 'cost of sales', 'TR856051224125706', 1, '2024-12-05', '2024-12-05 12:57:06', 3),
(67, 11034360.00, 'cost of sales', 'TR301051224125928', 1, '2024-12-05', '2024-12-05 12:59:28', 3),
(68, 26623049.92, 'cost of sales', 'TR952051224010343', 1, '2024-12-05', '2024-12-05 13:03:43', 3),
(69, 10617506.40, 'cost of sales', 'TR357051224010547', 1, '2024-12-05', '2024-12-05 13:05:47', 3),
(70, 1803849.30, 'cost of sales', 'TR564051224010842', 1, '2024-12-05', '2024-12-05 13:08:42', 3),
(71, 70292960.00, 'cost of sales', 'TR277051224011549', 1, '2024-12-05', '2024-12-05 13:15:49', 3),
(72, 10411569.00, 'cost of sales', 'TR247051224011815', 1, '2024-12-05', '2024-12-05 13:18:15', 3),
(73, 20657875.00, 'cost of sales', 'TR177051224012016', 1, '2024-12-05', '2024-12-05 13:20:16', 3),
(74, 2776418.40, 'cost of sales', 'TR589051224012229', 1, '2024-12-05', '2024-12-05 13:22:29', 3),
(75, 85898088.46, 'cost of sales', 'TR462051224012520', 1, '2024-12-05', '2024-12-05 13:25:20', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer` varchar(50) NOT NULL,
  `ledger_id` int(11) NOT NULL,
  `acn` int(50) NOT NULL,
  `customer_type` varchar(20) NOT NULL,
  `phone_numbers` varchar(20) NOT NULL,
  `customer_address` varchar(100) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `wallet_balance` int(11) NOT NULL,
  `amount_due` int(11) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer`, `ledger_id`, `acn`, `customer_type`, `phone_numbers`, `customer_address`, `customer_email`, `wallet_balance`, `amount_due`, `reg_date`) VALUES
(28, 'SHELL PETROLEUM DEV COY  OF NIGERIA', 72, 1010472, '', 'SHELL', 'RUMUOBIAKANI PORT HARCOURT', 'info@shell.com', -1790, 0, '2024-09-30 06:03:44'),
(29, 'SHELL NIGERIA GAS', 73, 1010473, '', 'SHELL', '21/22 MARINA LAGOS', 'info@sng.com', 0, 0, '2024-09-30 06:04:39'),
(30, 'SHELL NIGERIA EXPLORATION AND PRODUCTION LTD', 74, 1010474, '', 'SHELL', 'LAGOS', 'info@shell.com', 0, 0, '2024-09-30 06:06:18'),
(31, 'HIQOS', 75, 1010475, '', '08036777893', 'LAGOS', 'info@hiqos.com', 0, 0, '2024-10-21 08:05:37'),
(32, 'MORPOL ENGINEERING SERVICES', 90, 1010490, '', '08035295421', 'LAGOS', 'forsteraneke@morpol.net', 0, 0, '2024-11-11 10:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_trail`
--

CREATE TABLE `customer_trail` (
  `id` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `store` int(11) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_trail`
--

INSERT INTO `customer_trail` (`id`, `customer`, `description`, `amount`, `store`, `trx_number`, `posted_by`, `post_date`) VALUES
(90, 28, 'Deposit', 0.00, 1, 'TR787041124085857', 3, '2024-11-04 03:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `debtors`
--

CREATE TABLE `debtors` (
  `debtor_id` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `store` int(11) NOT NULL,
  `debt_status` int(11) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department`) VALUES
(11, 'Raw Materials'),
(12, 'Products'),
(13, 'Consumables');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `deposit_id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `bank` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `details` varchar(255) NOT NULL,
  `trans_date` date DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`deposit_id`, `store`, `customer`, `amount`, `payment_mode`, `bank`, `invoice`, `trx_number`, `details`, `trans_date`, `post_date`, `posted_by`) VALUES
(1, 1, 28, 0.00, 'Transfer', 6, 'DEP04112409571110213', 'TR787041124085857', 'Payment For Invoices', '2024-05-04', '2024-11-04 08:58:57', 3);

-- --------------------------------------------------------

--
-- Table structure for table `depreciation`
--

CREATE TABLE `depreciation` (
  `depreciation_id` int(11) NOT NULL,
  `asset` int(11) NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `useful_life` float NOT NULL,
  `salvage_value` decimal(12,2) NOT NULL,
  `dr_ledger` int(11) NOT NULL,
  `contra_ledger` int(11) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `accum_dep` decimal(12,2) NOT NULL,
  `book_value` decimal(12,2) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `trx_date` date NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `director_posting`
--

CREATE TABLE `director_posting` (
  `director_id` int(11) NOT NULL,
  `financier` int(11) NOT NULL,
  `contra_ledger` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `trans_type` varchar(50) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `store` int(11) NOT NULL,
  `trans_date` date DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `director_posting`
--

INSERT INTO `director_posting` (`director_id`, `financier`, `contra_ledger`, `amount`, `trans_type`, `trx_number`, `details`, `store`, `trans_date`, `post_date`, `posted_by`) VALUES
(5, 49, 50, 3000.00, 'Director remuneration', 'TR908121124025340', 'Directors Annual  2022 Payment', 1, '2024-02-01', '2024-11-12 14:53:40', 3);

-- --------------------------------------------------------

--
-- Table structure for table `disposed_assets`
--

CREATE TABLE `disposed_assets` (
  `disposed_id` int(11) NOT NULL,
  `asset` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `accum_dep` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `reason` varchar(1024) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `disposed_date` datetime DEFAULT NULL,
  `disposed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `expense_head` varchar(255) NOT NULL,
  `contra` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `expense_date` datetime NOT NULL,
  `post_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`expense_id`, `store`, `posted_by`, `expense_head`, `contra`, `amount`, `trx_number`, `details`, `expense_date`, `post_date`) VALUES
(1, 1, 3, '98', 50, 22735176.11, 'TR304141124045216', 'CONVERA UK- SCHOOL FEES EXPENSE', '2024-03-15 00:00:00', '2024-11-14 16:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `expense_heads`
--

CREATE TABLE `expense_heads` (
  `exp_head_id` int(11) NOT NULL,
  `expense_head` varchar(255) NOT NULL,
  `ledger_id` int(11) NOT NULL,
  `acn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_heads`
--

INSERT INTO `expense_heads` (`exp_head_id`, `expense_head`, `ledger_id`, `acn`) VALUES
(4, 'UTILITY BILLS', 37, 40601237),
(5, 'TRANSPORTATION', 38, 40601238),
(6, 'SALARIES AND WAGES', 39, 40601239),
(7, 'DEPRECIATION', 40, 40801540),
(8, 'AMORTIZATION - SOFTWARE COST', 41, 40801541),
(9, 'LOSS ON DISPOSAL OF ASSET', 60, 401001860),
(10, 'COST OF SALES', 63, 40701463),
(11, 'COMPANY INCOME TAX', 67, 40601267),
(12, 'LOAN FEES', 68, 40601368),
(13, 'BANK CHARGES', 69, 40601369),
(14, 'MD\'S CHILDREN SCHOOL FEES', 98, 40601398),
(15, 'COURIER EXPENSES', 108, 406012108),
(16, 'FREIGHT AND CUSTOMS  DUTIES', 109, 406012109),
(17, 'PROJECT EXPENSES', 110, 407014110),
(18, 'PETTY PROJECT EXPENSES', 111, 406013111),
(19, 'TRANSFER TO MDS ACCOUNT', 112, 406013112);

-- --------------------------------------------------------

--
-- Table structure for table `finance_cost`
--

CREATE TABLE `finance_cost` (
  `finance_id` int(11) NOT NULL,
  `financier` int(11) NOT NULL,
  `contra_ledger` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `trans_type` varchar(50) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `store` int(11) NOT NULL,
  `trans_date` date DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `store` int(11) NOT NULL,
  `cost_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `batch_number` int(11) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `reorder_level` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `item`, `details`, `item_type`, `store`, `cost_price`, `quantity`, `batch_number`, `expiration_date`, `reorder_level`, `post_date`) VALUES
(1, 0, 'NBB 6502.AL', NULL, 1, 10967569, 12, 0, NULL, 0, NULL),
(2, 0, 'NBB6302 -AL', NULL, 1, 10967569, 1, 0, NULL, 0, NULL),
(3, 0, 'NBB6502-AL', NULL, 1, 9674940, 1, 0, NULL, 0, NULL),
(4, 0, 'NBE-6502.AL', NULL, 1, 9674940, 1, 0, NULL, 0, NULL),
(5, 0, 'SUPPLY OF TRENDNET POWER SUPPLY FOR SNEPCO', NULL, 1, 3677265, 1, 0, NULL, 0, NULL),
(6, 0, '1794-1B16 ALLEN-BRADLEY', NULL, 1, 154654, 1, 0, NULL, 0, NULL),
(7, 0, 'SUPPLY OF ELECTRICAL MATERIALS FOR SPDC', NULL, 1, 1182649, 1, 0, NULL, 0, NULL),
(8, 0, 'SUPPLY OF LABEL TAPES FOR SNEPCO', NULL, 1, 2035794, 1, 0, NULL, 0, NULL),
(9, 0, 'SUPPLY OF ARUBA EQUIPMENT FOR SNG', NULL, 1, 21049615, 1, 0, NULL, 0, NULL),
(10, 0, 'CCTV AND ACCESS CONTROL MATERIALS FOR NUNRIVER', NULL, 1, 72661081, 1, 0, NULL, 0, NULL),
(11, 0, ' UPS-7242-V-01 SUBSEA UPS A FAILURE FOR SNEPCO', NULL, 1, 53962200, 1, 0, NULL, 0, NULL),
(12, 0, 'ABUJA CCTV SPDC PO', NULL, 1, 29879348, 1, 0, NULL, 0, NULL),
(13, 0, 'CCTV AND ACCESS CONTROL MATERIALS FOR NUN RIVER PROJECT', NULL, 1, 112035108, 1, 0, NULL, 0, NULL),
(14, 0, 'CCTV AND ACCESS CONTROL MATERIALS FOR NUN RIVER PROJECT', NULL, 1, 54039962, 1, 0, NULL, 0, NULL),
(15, 0, 'REPLACEMENT OF DCTS FOR SHELL BONGAS UPS', NULL, 1, 83203563, 1, 0, NULL, 0, NULL),
(16, 0, 'CISCO MATERIALS FOR SNEPCO PROJECT', NULL, 1, 27678518, 1, 0, NULL, 0, NULL),
(17, 0, 'CISCO MATERIALS FOR SNEPCO PROJECT', NULL, 1, 27678518, 1, 0, NULL, 0, NULL),
(18, 0, 'CISCO MATERIALS FOR SNEPCO PROJECT', NULL, 1, 17752398, 1, 0, NULL, 0, NULL),
(19, 0, 'BOOM EDAM 100EC2-SHL', NULL, 1, 22226514, 1, 0, NULL, 0, NULL),
(20, 0, 'BOOM EDAM 100EC2-SHL', NULL, 1, 22226514, 1, 0, NULL, 0, NULL),
(21, 0, 'SUPPLY OF CABLE TIES FOR SNEPCO', NULL, 1, 345064, 1, 0, NULL, 0, NULL),
(22, 0, 'MAINTENANCE SERVICE ON ALPHA PLANT', NULL, 1, 28054000, 1, 0, NULL, 0, NULL),
(23, 0, 'SUPPLY OF POWER SUPPLY WITH TACHOMETER', NULL, 1, 1647503, 1, 0, NULL, 0, NULL),
(24, 0, 'SHELL SIM SUBSCRIPTION FEES', NULL, 1, 9097300, 1, 0, NULL, 0, NULL),
(25, 0, 'MOTOROLA DM1400 VHF MOBILE', NULL, 1, 937875, 1, 0, NULL, 0, NULL),
(26, 0, 'SUPPLLY OF HP DOCKING MONITOR FOR SNG', NULL, 1, 36389200, 1, 0, NULL, 0, NULL),
(27, 0, 'SUPPLY OF HP DOCKING MONITOR FOR SNG', NULL, 1, 25410578, 1, 0, NULL, 0, NULL),
(28, 0, 'SUPPLY OF VQS PROJECT SECURITY MATERIALS FOR SHELL', NULL, 1, 70493158, 1, 0, NULL, 0, NULL),
(29, 0, 'SUPPLY OF GENETEC SOFTWARE FOR SPDC', NULL, 1, 47167772, 1, 0, NULL, 0, NULL),
(30, 0, 'NEPTURA TRAINING', NULL, 1, 3566142, 1, 0, NULL, 0, NULL),
(31, 0, 'LOGISTICS FOR PROVIDUM ITEMS SUPPLIED', NULL, 1, 1601125, 1, 0, NULL, 0, NULL),
(32, 0, 'MAINTENANCE SERVICES ON ALPHA PLANT', NULL, 1, 14020700, 1, 0, NULL, 0, NULL),
(33, 0, 'SUPPLY OF ACCESS CONTROL MATERIALS FOR NUNRIVER PROJECT', NULL, 1, 84714962, 1, 0, NULL, 0, NULL),
(34, 0, 'SUPPLY OF IT MATERIALS FOR SNG PROJECT AT HERITAGE HOUSE', NULL, 1, 103540514, 1, 0, NULL, 0, NULL),
(35, 0, 'FREIGHT CHARGES', NULL, 1, 3617341, 1, 0, NULL, 0, NULL),
(36, 0, 'THEORETICAL AND PHYSICAL TRAINING FOR DISTRAN PRO CAMERA', NULL, 1, 20529644, 1, 0, NULL, 0, NULL),
(37, 0, 'MAINTENANCE SERVICES ON ALPHA PLANT', NULL, 1, 7560700, 1, 0, NULL, 0, NULL),
(38, 0, 'MAINTENANCE SERVICES ON ALPHA PLANT', NULL, 1, 7560700, 1, 0, NULL, 0, NULL),
(39, 0, 'US PICK-UP-BOONEDAN (TURNSTILE)', NULL, 1, 10009475, 1, 0, NULL, 0, NULL),
(40, 0, 'US PICK-UP- BOONEDAN', NULL, 1, 3477885, 1, 0, NULL, 0, NULL),
(41, 0, 'IPAD MINI 6 FOR SNEPCO', NULL, 1, 48670215, 1, 0, NULL, 0, NULL),
(42, 0, 'LEGRAND-510203', NULL, 1, 14766262, 1, 0, NULL, 0, NULL),
(43, 0, 'SUPPLY OF SPEEDLANE 900 SPARE PARTS', NULL, 1, 3007588, 1, 0, NULL, 0, NULL),
(44, 0, 'ABUJA CCTV SPDC ', NULL, 1, 29878721, 1, 0, NULL, 0, NULL),
(45, 0, 'GENETICS ITEMS', NULL, 1, 39681548, 1, 0, NULL, 0, NULL),
(46, 0, 'CISCO MATERIALS FOR ABUJA CCTV', NULL, 1, 32954898, 1, 0, NULL, 0, NULL),
(47, 0, 'CISCO MATERIALS FOR DATACOM', NULL, 1, 288370675, 1, 0, NULL, 0, NULL),
(48, 0, 'FULLRIVER 12V BATTERY', NULL, 1, 36546437, 1, 0, NULL, 0, NULL),
(49, 0, 'MATERIALS FOR SNG HELO PROJECT', NULL, 1, 99264049, 1, 0, NULL, 0, NULL),
(50, 0, 'STORAGE ON 4 PALLETS OF FULLRIVER BATTERIES AND SEA FREIGHT', NULL, 1, 31362600, 1, 0, NULL, 0, NULL),
(51, 0, 'ABACUS POLES', NULL, 1, 23471566, 1, 0, NULL, 0, NULL),
(52, 0, 'THURAYA CODE 500 UNITS', NULL, 1, 754271, 1, 0, NULL, 0, NULL),
(53, 0, 'AIRFREIGHT, CUSTOM CLEARANCE AND DELIVERY', NULL, 1, 10976910, 1, 0, NULL, 0, NULL),
(54, 0, 'GAI-TRONICS AUTELDAC 5 N/C (O BUTTON) TELEPHONE', NULL, 1, 19981097, 1, 0, NULL, 0, NULL),
(55, 0, 'SNG HERITAGE BUILDING PROJECT', NULL, 1, 2979447, 1, 0, NULL, 0, NULL),
(56, 0, 'PRINTER,HP,3WT91A,1200x1200dpi', NULL, 1, 27221670, 1, 0, NULL, 0, NULL),
(57, 0, 'Bartec PIXAVI Cam Intrinsically Safe Digital Camera, UK', NULL, 1, 3080309, 1, 0, NULL, 0, NULL),
(58, 0, 'PAYMENT FOR FREIGHT CHARGES', NULL, 1, 8554698, 1, 0, NULL, 0, NULL),
(59, 0, 'PAYMENT FOR FREIGHT CHARGES', NULL, 1, 8554698, 1, 0, NULL, 0, NULL),
(60, 0, 'PAYMENT FOR FREIGHT CHARGES', NULL, 1, 8554698, 1, 0, NULL, 0, NULL),
(61, 0, 'NETWORK SUPPLY LICENCE', NULL, 1, 559678, 1, 0, NULL, 0, NULL),
(62, 0, 'CHLORIDE UPS FINAL REPORT AND TIMESHEET BONGA', NULL, 1, 20656700, 1, 0, NULL, 0, NULL),
(63, 0, 'CISCO CATALYST 9400 SERIES 48PORT UPOE W/24p MGig 24p RJ-45', NULL, 1, 60617722, 1, 0, NULL, 0, NULL),
(64, 0, 'CISCO MATERIALS FOR DATACOM', NULL, 1, 43171860, 1, 0, NULL, 0, NULL),
(65, 0, 'TELEPHONE', NULL, 1, 30820619, 1, 0, NULL, 0, NULL),
(66, 0, 'SUPPLY OF DEMOUNTABLE WINCH', NULL, 1, 2275277, 1, 0, NULL, 0, NULL),
(67, 0, 'SUPPLY OF CRESTON TOUCH SCTREEN TSW-1070-B-S', NULL, 1, 64009275, 1, 0, NULL, 0, NULL),
(68, 0, 'SUPPLY OF IT EQUIPMENTS FOR NUN RIVER', NULL, 1, 8597319, 1, 0, NULL, 0, NULL),
(69, 0, 'SUPPLY OF IT EQUIPMENT', NULL, 1, 7177372, 1, 0, NULL, 0, NULL),
(70, 0, 'SUPPLY OF IT EQUIPMENTS FOR NUN RIVER', NULL, 1, 11034360, 1, 0, NULL, 0, NULL),
(71, 0, 'SUPPLY OF IT EQUIPMENTS', NULL, 1, 26623050, 1, 0, NULL, 0, NULL),
(72, 0, 'SNG MATERIALS', NULL, 1, 10617506, 1, 0, NULL, 0, NULL),
(73, 0, 'TELEPHONE', NULL, 1, 1803849, 1, 0, NULL, 0, NULL),
(74, 0, 'REMOTE RADIATOR', NULL, 1, 70292960, 1, 0, NULL, 0, NULL),
(75, 0, 'IRIDIUM TERMINAL', NULL, 1, 10411569, 1, 0, NULL, 0, NULL),
(76, 0, 'IRIDIUM TERMINAL', NULL, 1, 20657875, 1, 0, NULL, 0, NULL),
(77, 0, 'IRIDIUM HANDSET', NULL, 1, 2776418, 1, 0, NULL, 0, NULL),
(78, 0, 'SERVICE RENDERED', NULL, 1, 85898088, 1, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `po_number` varchar(50) NOT NULL,
  `service_order` varchar(50) NOT NULL,
  `manual_invoice` varchar(50) NOT NULL,
  `customer` int(11) NOT NULL,
  `details` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `invoice_status` int(11) NOT NULL,
  `due_days` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `trx_date` datetime DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `invoice`, `po_number`, `service_order`, `manual_invoice`, `customer`, `details`, `quantity`, `price`, `total_amount`, `invoice_status`, `due_days`, `store`, `trx_number`, `trx_date`, `due_date`, `posted_by`, `post_date`) VALUES
(14, 'PR2839331010240350', '4510491727', '502193723', '2483A', 28, 'OFFSHORE DIVISION SEA EAGLE FP CUTTERS', 1, 1628416.70, 1628416.70, 1, 45, 1, 'TR743101024035420', '2024-01-15 00:00:00', '2024-02-29', 3, '2024-10-10 15:53:10'),
(15, 'PR2855531010240356', '4510491727', '502193723', '2483B', 28, 'OFFSHORE DIVISION SEA EAGLE FP CUTTERS -MARK UP\n', 1, 260546.67, 260546.67, 1, 45, 1, 'TR531101024035837', '2024-01-15 00:00:00', '2024-02-29', 3, '2024-10-10 15:58:12'),
(16, 'PR2818831010240359', '4510491727', '502194707', '2485A', 28, 'PIPE NMET PVC\n', 1, 17187019.44, 17187019.44, 1, 45, 1, 'TR422101024040142', '2024-01-15 00:00:00', '2024-02-29', 3, '2024-10-10 16:01:19'),
(17, 'PR2871831010240401', '4510491727', '502194707', '2485B', 28, 'PIPE NMET PVC -MARK UP LINE\n\n', 1, 2984878.71, 2984878.71, 1, 45, 1, 'TR245101024040407', '2024-01-19 00:00:00', '2024-03-04', 3, '2024-10-10 16:03:45'),
(18, 'PR3015831010240406', '4510490732', '502194796', '2486A', 30, 'AUXILLIARY CONTACT BLOCK\n', 1, 5458.00, 5458.00, 1, 45, 1, 'TR149101024040850', '2024-01-19 00:00:00', '2024-03-04', 3, '2024-10-10 16:08:02'),
(19, 'PR3020431010240409', '4510490732', '502194796', '2486B', 30, 'MARK UP LINE\n', 1, 1091.68, 1091.68, 1, 45, 1, 'TR037101024041114', '2024-01-19 00:00:00', '2024-03-04', 3, '2024-10-10 16:10:34'),
(20, 'PR3063531010240411', '4510490732', '502192980', '2487A', 30, 'CONTACTOR ABB\n', 1, 1240871.72, 1240871.72, 1, 45, 1, 'TR568101024041346', '2024-01-19 00:00:00', '2024-03-04', 3, '2024-10-10 16:13:20'),
(21, 'PR3002731010240413', '4510490732', '502194896', '2487B', 30, 'MARK UP LINE FOR CONTACTOR\n', 1, 248174.34, 248174.34, 1, 45, 1, 'TR754101024041639', '2024-01-19 00:00:00', '2024-03-04', 3, '2024-10-10 16:16:18'),
(22, 'PR3055231010240417', '4510491728', '502196897', '2488', 30, 'OIL ABSORBENT SHEET\n', 1, 19158913.80, 19158913.80, 1, 45, 1, 'TR909101024041920', '2024-01-19 00:00:00', '2024-03-04', 3, '2024-10-10 16:18:33'),
(23, 'PR2834531010240422', '45104490717', '5021997937', '2490A', 28, 'PACKAGE SHELL GENETEC\n', 1, 4060215.96, 4060215.96, 1, 60, 1, 'TR634101024042721', '2024-02-02 00:00:00', '2024-04-02', 3, '2024-10-10 16:25:30'),
(24, 'PR2836131010240427', '4510491727', '5021997937', '2490B', 28, 'PACKAGE SHELL GENETEC-MARK UP LINE\n', 1, 2984878.71, 2984878.71, 1, 60, 1, 'TR148101024043015', '2024-02-02 00:00:00', '2024-04-02', 3, '2024-10-10 16:29:35'),
(25, 'PR2884731010240435', '4510489066', '502196522', '2491', 28, 'CBMC POLE 250A\n', 1, 834040.46, 834040.46, 1, 60, 1, 'TR577101024043808', '2024-02-06 00:00:00', '2024-04-06', 3, '2024-10-10 16:37:27'),
(26, 'PR3071531010240439', '4510483891', '5021991188', '2492', 30, 'SWITCH NETWORK CISCO\n', 1, 8293098.68, 8293098.68, 1, 60, 1, 'TR136101024044139', '2024-02-06 00:00:00', '2024-04-06', 3, '2024-10-10 16:40:30'),
(27, 'PR3061431010240443', '4510500324/10', '1002485196', '2494', 30, 'GENETEC ADVANTAGE RENEWAL -ACCESS POINT INTERGRATION- LADOL\n', 1, 60253974.24, 60253974.24, 1, 60, 1, 'TR557101024044643', '2024-02-13 00:00:00', '2024-04-13', 3, '2024-10-10 16:45:48'),
(28, 'PR3051331110240852', '4510498854/10', '1002487919', '2424', 30, 'DISTRAN CAMERA TRAINING\n', 1, 13400823.25, 13400823.25, 1, 60, 1, 'TR992111024085437', '2024-02-21 00:00:00', '2024-04-21', 3, '2024-10-11 08:53:50'),
(29, 'PR3057031110240856', '4510494012', '502202060', '2495', 30, 'POWER SUPPLY CISCO\n', 1, 74591173.48, 74591173.48, 1, 60, 1, 'TR946111024085845', '2024-02-16 00:00:00', '2024-04-16', 3, '2024-10-11 08:57:57'),
(30, 'PR3050831110240859', '4510494116', '502202063', '2496', 30, 'CABLE STACKING CISCO\n', 1, 445003.53, 445003.53, 1, 60, 1, 'TR584111024090103', '2024-02-16 00:00:00', '2024-04-16', 3, '2024-10-11 09:00:23'),
(32, 'PR3080831110240906', '4510490732', '502204588', '2497', 30, 'POWER CONNECTION KIT -BONGA FPS\n', 1, 397370.06, 397370.06, 1, 60, 1, 'TR874111024090802', '2024-02-28 00:00:00', '2024-04-28', 3, '2024-10-11 09:07:26'),
(33, 'PR3044631110241008', '4510490732', '502203482', '2498', 30, 'CIRCUIT BREAKER\n', 1, 98250.84, 98250.84, 1, 60, 1, 'TR638111024101028', '2024-10-11 00:00:00', '2024-12-10', 3, '2024-10-11 10:09:31'),
(34, 'PR3089531110241011', '4510494012', '502205009', '2499', 30, 'MOUNT KIT  CISCO MATERIALS\n', 1, 1876591.04, 1876591.04, 1, 60, 1, 'TR384111024101325', '2024-02-29 00:00:00', '2024-04-29', 3, '2024-10-11 10:12:38'),
(35, 'PR2815631110241018', '4510492935', '502205326', '2501', 28, 'THICKNESS GAUGE CALIBATION-SPDC WORK MGT PLANT\n', 1, 11128806.03, 11128806.03, 1, 60, 1, 'TR205111024102131', '2024-03-01 00:00:00', '2024-04-30', 3, '2024-10-11 10:20:47'),
(37, 'PR3054231110241025', '4510498697', '502205798', '2503', 30, 'TIE CABLE PANDUIT-SNEPCO WORK PLANT\n', 1, 730365.62, 730365.62, 1, 60, 1, 'TR195111024102739', '2024-03-05 00:00:00', '2024-05-04', 3, '2024-10-11 10:27:08'),
(38, 'PR3072531110241031', '4510490732', '502205626', '2502', 30, 'MICOM FEEDER PROTECTION RELAY-LADOL BASE\n', 1, 13955177.15, 13955177.15, 1, 60, 1, 'TR346111024103339', '2024-03-05 00:00:00', '2024-05-04', 3, '2024-10-11 10:32:57'),
(39, 'PR3088031110241034', '4510490732', '502204586', '2506', 30, 'TESTER PORTABLE -BONGA FPS\n', 1, 12417542.47, 12417542.47, 1, 60, 1, 'TR243111024103705', '2024-03-06 00:00:00', '2024-05-05', 3, '2024-10-11 10:36:12'),
(40, 'PR3032131110241038', '4510500324/10', '1002488721', '2507A', 30, 'MAINT OF ACCESS CONTROL INSTALL\n', 1, 4766265.28, 4766265.28, 1, 60, 1, 'TR003111024103930', '2024-03-08 00:00:00', '2024-05-07', 3, '2024-10-11 10:39:11'),
(44, 'PR2809832110241237', '4510500324/10', '1002488721', '2507B', 28, 'MAINT OF ACCESS CONTROL INSTALL\n', 1, 760000.00, 760000.00, 1, 60, 1, 'TR077211024123849', '2024-03-08 00:00:00', '2024-05-07', 3, '2024-10-21 12:38:11'),
(45, 'PR3028832110241239', '4510498697', '502206620', '2508', 30, 'CARTRIDGE LABEL\n', 1, 4388079.07, 4388079.07, 1, 60, 1, 'TR926211024124143', '2024-03-08 00:00:00', '2024-05-07', 3, '2024-10-21 12:40:33'),
(46, 'PR3095332110241243', '4510497835', '502206642', '2509', 30, 'POWER SUPPLY TRENDNET\n', 1, 6112296.70, 6112296.70, 1, 1, 1, 'TR072211024124616', '2024-03-08 00:00:00', '2024-03-09', 3, '2024-10-21 12:45:05'),
(47, 'PR3037232110241247', '4510498697', '502206988', '2510', 30, 'TAPE,ELEC, VINYL 4IN STOMP\n', 1, 1386405.56, 1386405.56, 1, 60, 1, 'TR910211024124953', '2024-03-08 00:00:00', '2024-05-07', 3, '2024-10-21 12:48:49'),
(48, 'PR3043632110241256', '4510494831', '502208984', '2511', 30, 'BIOMETRIC CARD READER\n', 1, 37685689.17, 37685689.17, 1, 60, 1, 'TR659211024125935', '2024-03-18 00:00:00', '2024-05-17', 3, '2024-10-21 12:58:38'),
(49, 'PR3056332110240101', '4510494831', '502208992', '2512', 30, 'CONN BOX, WASHERS, CAMERAS\n', 1, 109865892.63, 109865892.63, 1, 60, 1, 'TR803211024010239', '2024-03-19 00:00:00', '2024-05-18', 3, '2024-10-21 13:01:51'),
(50, 'PR3189432110240105', 'NIL', 'nil', '2513', 31, 'TECHNICAL DESIGN FOR ARUBA WITH ACCESS POINT AT ALFA SHELL NIGERIA LAGOS', 1, 2687500.00, 2687500.00, 1, 60, 1, 'TR670211024011004', '2024-03-21 00:00:00', '2024-05-20', 3, '2024-10-21 13:09:15'),
(51, 'PR2883532110240114', '4510492935', '502209456', '2514', 28, 'POWER SUPPLY UNIT\n', 1, 2693091.10, 2693091.10, 1, 60, 1, 'TR070211024011648', '2024-03-21 00:00:00', '2024-05-20', 3, '2024-10-21 13:15:45'),
(52, 'PR2868432310240950', '4510492935', '502209456', '2514', 28, 'POWER SUPPLY UNIT\n', 1, 2693091.10, 2693091.10, 1, 60, 1, 'TR068231024095144', '2024-03-21 00:00:00', '2024-05-20', 3, '2024-10-23 09:51:06'),
(53, 'PR2984232310240954', '4510490260', '1002476315', '2516A', 29, 'IDT- M4- HUDDLE ROOM ETC\n', 1, 1091084.62, 1091084.62, 1, 60, 1, 'TR081231024095639', '2024-03-26 00:00:00', '2024-05-25', 3, '2024-10-23 09:55:59'),
(54, 'PR2969732310240959', '4510490260', '1002476315', '2516B', 29, 'IDT- M4- HUDDLE ROOM ETC\n', 1, 221433.48, 221433.48, 1, 60, 1, 'TR930231024101323', '2024-03-26 00:00:00', '2024-05-25', 3, '2024-10-23 10:12:40'),
(55, 'PR2981032310241015', '4510490260', '1002476320', '2517A', 29, 'IDT-M4-MEETING ROOM 3 BEELINK\n', 1, 1091084.62, 1091084.62, 1, 60, 1, 'TR596231024101728', '2024-03-26 00:00:00', '2024-05-25', 3, '2024-10-23 10:16:28'),
(56, 'PR2999332310241017', '4510490260', '1002476320', '2517B', 29, 'IDT-M4-MEETING ROOM 3 BEELINK\n', 1, 221433.48, 221433.48, 1, 60, 1, 'TR162231024102104', '2024-10-23 00:00:00', '2024-12-22', 3, '2024-10-23 10:18:46'),
(57, 'PR2938532310241023', '4510490260/10', '1002476323', '2518A', 29, 'IDT-MA- WIRELESS ARUBA 2 ETC\n', 1, 3152010.47, 3152010.47, 1, 60, 1, 'TR038231024102539', '2024-03-26 00:00:00', '2024-05-25', 3, '2024-10-23 10:24:45'),
(58, 'PR2961032310241025', '4510490260/10', '4510490260/10', '2518B', 29, 'IDT-MA- WIRELESS ARUBA 2 ETC\n', 1, 639674.23, 639674.23, 1, 1, 1, 'TR912231024103620', '2024-03-26 00:00:00', '2024-03-27', 3, '2024-10-23 10:35:24'),
(59, 'PR2949232310241037', '4510490260/110', '1002476325', '2519A', 29, 'IDT-M4 -CCTV &AMP;ACCESS CONTROL\n', 1, 12902546.25, 12902546.25, 1, 60, 1, 'TR600231024103837', '2024-03-26 00:00:00', '2024-05-25', 3, '2024-10-23 10:37:56'),
(60, 'PR2944032310241038', '4510490260/110', '1002476325', '2519B', 29, 'IDT-M4 -CCTV &AMP;ACCESS CONTROL\n', 1, 2618551.10, 2618551.10, 1, 60, 1, 'TR616231024104021', '2024-03-26 00:00:00', '2024-05-25', 3, '2024-10-23 10:39:37'),
(61, 'PR2975432310241040', '4510490260/120', '1002476327', '2520A', 29, 'IDT-M4- EACS INSTALLTIONS 2\n', 1, 13889550.27, 13889550.27, 1, 60, 1, 'TR454231024104218', '2024-03-26 00:00:00', '2024-05-25', 3, '2024-10-23 10:41:38'),
(63, 'PR2939732310241042', '4510490260/120', '1002476327', '2520B', 29, 'IDT-M4- EACS INSTALLTIONS 2\n', 1, 2818764.36, 2818764.36, 1, 60, 1, 'TR734231024110006', '2024-03-26 00:00:00', '2024-05-25', 3, '2024-10-23 10:56:37'),
(64, 'PR2953732310241100', '4510490260/130', '1002476328', '2521A', 29, 'IDT M4- IT FITINGS-DSTV DOCKING 27\n', 1, 75063567.13, 75063567.13, 1, 60, 1, 'TR539231024110406', '2024-03-26 00:00:00', '2024-05-25', 3, '2024-10-23 11:01:24'),
(65, 'PR2952032310241104', '4510490260/130', '1002476328', '2521B', 29, 'IDT M4- IT FITINGS-DSTV DOCKING 27\n', 1, 15234143.94, 15234143.94, 1, 60, 1, 'TR556231024111356', '2024-03-26 00:00:00', '2024-05-25', 3, '2024-10-23 11:07:40'),
(66, 'PR2846032510240858', '45104903673/10', '1002496078', '2522', 28, 'PROV OF PHARMACY FEB 2024\n', 1, 719413.90, 719413.90, 1, 60, 1, 'TR773251024090039', '2024-03-27 00:00:00', '2024-05-26', 3, '2024-10-25 09:00:02'),
(67, 'PR3011632510240903', '4510494831', '502211099', '2523', 30, 'SCANNER X RAY RAPISCAN\n', 1, 18032798.75, 18032798.75, 1, 60, 1, 'TR763251024090630', '2024-03-28 00:00:00', '2024-05-27', 3, '2024-10-25 09:05:30'),
(68, 'PR2831432510240907', '45104903673/10', '1002496622', '2524', 28, 'PROV OF PHARMACY MARCH 2024\n', 1, 719413.90, 719413.90, 1, 60, 1, 'TR008251024090850', '2024-03-28 00:00:00', '2024-05-27', 3, '2024-10-25 09:08:11'),
(69, 'PR3047032510240910', '4510494831', '502211086', '2526', 30, 'PERSONAL SCANNER X RAY- \n', 1, 15947557.69, 15947557.69, 1, 60, 1, 'TR506251024091157', '2024-03-28 00:00:00', '2024-05-27', 3, '2024-10-25 09:11:21'),
(70, 'PR2861032510240913', '44510490666', '5022121231', '2525A', 28, 'TUBE FLORESCENT\n', 1, 480449.81, 480449.81, 1, 60, 1, 'TR876251024092036', '2024-04-04 00:00:00', '2024-06-03', 3, '2024-10-25 09:19:50'),
(71, 'PR2844232510240922', '44510490666', '5022121231', '2525B', 28, 'TUBE FLORESCENT-MARK UP\n', 1, 111561.45, 111561.45, 1, 60, 1, 'TR880251024092409', '2024-04-04 00:00:00', '2024-06-03', 3, '2024-10-25 09:23:48'),
(72, 'PR2800132510240948', '45104947635', '502212665', '2528A', 28, 'CAMERA OUTDOOR BULLET\n', 1, 15278818.70, 15278818.70, 1, 60, 1, 'TR288251024095047', '2024-04-15 00:00:00', '2024-06-14', 3, '2024-10-25 09:49:51'),
(73, 'PR3087730411241009', '45104947635', '502213391', '2528B', 30, 'CAMERA OUTDOOR BULLET-MARK UP\n', 1, 3035145.91, 3035145.91, 1, 60, 1, 'TR474041124101211', '2024-04-15 00:00:00', '2024-06-14', 3, '2024-11-04 10:11:17'),
(74, 'PR2815930411241014', '4510490666', '502212665', '2529A', 28, 'BATTERY NC DURACELL\n', 1, 7171.81, 7171.81, 1, 60, 1, 'TR464041124101703', '2024-04-19 00:00:00', '2024-06-18', 3, '2024-11-04 10:16:17'),
(75, 'PR2881330411241017', '4510490666', '502212665', '2529B', 28, 'BATTERY NC DURACELL-MARK UP\n', 1, 1471.14, 1471.14, 1, 60, 1, 'TR310041124101917', '2024-04-19 00:00:00', '2024-06-18', 3, '2024-11-04 10:18:39'),
(76, 'PR2827430411241022', '4510490666', '502209114', '2530', 28, 'FLEX INPUT MODULE\n', 1, 684496.92, 684496.92, 1, 60, 1, 'TR976041124102532', '2024-04-30 00:00:00', '2024-06-29', 3, '2024-11-04 10:23:40'),
(77, 'PR2877930411241026', '4510503673', '1002499944', '2531', 28, 'PROV OF COMM PHARMACY APRL 2024\n', 1, 719413.90, 719413.90, 1, 60, 1, 'TR779041124102902', '2024-04-30 00:00:00', '2024-06-29', 3, '2024-11-04 10:28:15'),
(79, 'PR2891730411241034', '4510500324', '1002501636', '2533A', 28, 'ONSITE ENGR FR MTCE SERVICES\n', 1, 3864194.40, 3864194.40, 1, 60, 1, 'TR473041124103555', '2024-04-30 00:00:00', '2024-06-29', 3, '2024-11-04 10:35:15'),
(80, 'PR2822930411241036', '4510500324', '1002501636', '2533B', 28, 'ONSITE ENGR FR MTCE SERVICES\n', 1, 760000.00, 760000.00, 1, 60, 1, 'TR824041124103831', '2024-04-30 00:00:00', '2024-06-29', 3, '2024-11-04 10:37:58'),
(81, 'PR2868130411241042', '4510482935', '502220650', '2535', 28, 'SPDC WORK MGT PLANT\n', 1, 16282720.80, 16282720.80, 1, 60, 1, 'TR143041124104528', '2024-05-16 00:00:00', '2024-07-15', 3, '2024-11-04 10:43:58'),
(82, 'PR3018330411241046', '4510506655', 'NIL', '2536', 30, 'MOVEMENT OF ANODES FROM LADOL TO OGUN\n', 1, 971075.00, 971075.00, 1, 60, 1, 'TR486041124105021', '2024-05-23 00:00:00', '2024-07-22', 3, '2024-11-04 10:49:06'),
(83, 'PR2815430411241051', '4510503673/10', '1002508772', '2537', 28, 'PROV OF PHARMACY  FOR MAY 2024\n', 1, 719413.90, 719413.90, 1, 60, 1, 'TR267041124105357', '2024-05-23 00:00:00', '2024-07-22', 3, '2024-11-04 10:53:12'),
(84, 'PR2867230411241056', '4510503673/10', '1002516489', '2539', 28, 'PROV OF PHARMACY  FOR JUNE 2024\n', 1, 719413.90, 719413.90, 1, 60, 1, 'TR872041124105853', '2024-06-24 00:00:00', '2024-08-23', 3, '2024-11-04 10:58:06'),
(85, 'PR2803030411241059', '4510487905', '1002514145/10', '2540A', 28, 'TELECOM WINSTED/MATERIAL   NUNR\n', 1, 95334455.79, 95334455.79, 1, 60, 1, 'TR140041124110155', '2024-06-18 00:00:00', '2024-08-17', 3, '2024-11-04 11:01:14'),
(86, 'PR2825730411241102', '4510487905', '1002514146/20', '2540B', 28, 'MATERIAL MARK UP 13% NUNR\n', 1, 12393481.94, 12393481.94, 1, 60, 1, 'TR727041124110526', '2024-06-18 00:00:00', '2024-08-17', 3, '2024-11-04 11:04:29'),
(87, 'PR2809430411241106', '4510485082/10', '1002516034', '2541', 28, 'ELECTRICAL\n', 1, 100749000.00, 100749000.00, 1, 60, 1, 'TR251041124110846', '2024-06-24 00:00:00', '2024-08-23', 3, '2024-11-04 11:07:55'),
(88, 'PR3025830411241109', '4510507010/10', '1002517381', '2543A', 30, 'PURCHASE OF AIRTIME GLOBAL 600UNITS 1YR\n', 1, 4533310.79, 4533310.79, 1, 60, 1, 'TR236041124111201', '2024-06-27 00:00:00', '2024-08-26', 3, '2024-11-04 11:11:12'),
(89, 'PR3054730411241112', '4510507010/10', '1002517381', '2543B', 30, 'PURCHASE OF AIRTIME MKUP\n', 1, 362597.98, 362597.98, 1, 60, 1, 'TR555041124111544', '2024-06-27 00:00:00', '2024-08-26', 3, '2024-11-04 11:14:40'),
(90, 'PR2893530411241118', '4510500234/10', '1002514884', '2544A', 28, 'ONSITE MAINT FOR MAY JUNE 2024 ACCESS CONTROL\n', 1, 9885491.52, 9885491.52, 1, 60, 1, 'TR271041124112026', '2024-07-01 00:00:00', '2024-08-30', 3, '2024-11-04 11:19:34'),
(91, 'PR2830530411241121', '4510500234/10', '1002514884', '2544B', 28, 'ONSITE MAINT FOR MAY JUNE 2024 ACCESS CONTROL\n', 1, 1520000.00, 1520000.00, 1, 60, 1, 'TR956041124112310', '2024-07-01 00:00:00', '2024-08-30', 3, '2024-11-04 11:22:35'),
(93, 'PR2940230411241130', '4510500234/10', '1002495280', '2545B', 29, 'ONSITE MAINT FOR MARCH 2024 ACCESS CONTROL\n', 1, 760000.00, 760000.00, 1, 60, 1, 'TR772041124113513', '2024-07-01 00:00:00', '2024-08-30', 3, '2024-11-04 11:34:23'),
(94, 'PR2967930411241137', '4510500234/10', '1002495280', '2545A', 29, 'ONSITE MAINT FOR MARCH 2024 ACCESS CONTROL\n', 1, 4942745.76, 4942745.76, 1, 60, 1, 'TR432041124113932', '2024-07-01 00:00:00', '2024-08-30', 3, '2024-11-04 11:38:58'),
(95, 'PR3096530411241140', '4510494012', '502230625', '2546', 30, 'MARK UP FOR CISCO CONNECTIVITY EQUIPMENT\n', 1, 13816260.27, 13816260.27, 1, 60, 1, 'TR651041124114245', '2024-07-01 00:00:00', '2024-08-30', 3, '2024-11-04 11:42:09'),
(96, 'PR3052330411241143', '4510494012', '502230628', '2547', 30, 'CONTROLLER MOBILITY HPE HIRMSE\n', 1, 6354407.75, 6354407.75, 1, 60, 1, 'TR239041124114555', '2024-07-02 00:00:00', '2024-08-31', 3, '2024-11-04 11:45:13'),
(97, 'PR2804830411241150', '4510487905/10', '1002521169', '2548A', 28, 'APIP-NUNR VIDEOTEC WAS-TLELCOM MATERIAL\n', 1, 278841708.98, 278841708.98, 1, 60, 1, 'TR533041124115242', '2024-07-16 00:00:00', '2024-09-14', 3, '2024-11-04 11:52:01'),
(98, 'PR2812530411241154', '4510487905/20', '1002521170', '2548B', 28, 'APIP-NUNR VIDEOTEC WAS-TLELCOM MATERIAL-MARK UP\n', 1, 36249426.24, 36249426.24, 1, 60, 1, 'TR669041124115759', '2024-07-16 00:00:00', '2024-09-14', 3, '2024-11-04 11:57:03'),
(99, 'PR2845230411241159', '4510496863', '502236133', '2549A', 28, 'IPAD MINI APPLE WIFI CELLULA 12GB\n', 1, 64650079.58, 64650079.58, 1, 60, 1, 'TR418041124120134', '2024-07-26 00:00:00', '2024-09-24', 3, '2024-11-04 12:00:59'),
(100, 'PR2876130411241201', '4510496863', '502236133', '2549B', 28, 'IPAD MINI APPLE WIFI CELLULA 12GB -MARK UP\n', 1, 12930015.92, 12930015.92, 1, 60, 1, 'TR816041124120429', '2024-07-26 00:00:00', '2024-09-24', 3, '2024-11-04 12:03:38'),
(101, 'PR2882330411241205', '4510503673/10', '1002524094', '2550', 28, 'PROV OF PHARMACY SERV JULY\n', 1, 719413.90, 719413.90, 1, 60, 1, 'TR899041124120751', '2024-07-30 00:00:00', '2024-09-28', 3, '2024-11-04 12:06:53'),
(102, 'PR2893230411241208', '4510500324/10', '1002523424', '2551A', 28, 'ONSITE MTCE SERVICES FOR ACCESS CONTROL\n', 1, 5022141.36, 5022141.36, 1, 60, 1, 'TR108041124121704', '2024-08-07 00:00:00', '2024-10-06', 3, '2024-11-04 12:16:07'),
(103, 'PR2816030411241219', '4510500324/10', '1002523424', '2551B', 28, 'ONSITE MTCE SERVICES FOR ACCESS CONTROL\n', 1, 760000.00, 760000.00, 1, 60, 1, 'TR208041124122155', '2024-08-07 00:00:00', '2024-10-06', 3, '2024-11-04 12:21:14'),
(104, 'PR2891030411241222', '4510506870', '502238268', '2552', 28, 'ETHERNET SURGE PROTECTOR AXIS 5801\n', 1, 22235920.00, 22235920.00, 1, 60, 1, 'TR497041124122449', '2024-08-13 00:00:00', '2024-10-12', 3, '2024-11-04 12:24:05'),
(105, 'PR2805130411241225', '4510509983/10', '1002527202', '2553A', 28, 'PROV OF ONSITE ENGR SERV FOR INSTALLTN\n', 1, 19583492.40, 19583492.40, 1, 60, 1, 'TR681041124122820', '2024-08-15 00:00:00', '2024-10-14', 3, '2024-11-04 12:27:45'),
(106, 'PR2828530411241228', '4510509983/10', '1002527202', '2553B', 28, 'PROV OF ONSITE ENGR SERV FOR INSTALLTN\n', 1, 1500000.00, 1500000.00, 1, 60, 1, 'TR519041124123113', '2024-08-15 00:00:00', '2024-10-14', 3, '2024-11-04 12:30:32'),
(107, 'PR3045930411241232', '4510505933', '502240423', '2554A', 30, 'SNEPCO  JUNCTION BOX SKU GROHEE\n', 1, 86666227.02, 86666227.02, 1, 60, 1, 'TR685041124123440', '2024-08-16 00:00:00', '2024-10-15', 3, '2024-11-04 12:33:59'),
(108, 'PR3093930411241234', '4510505933', '502240423', '2554B', 30, 'SNEPCO  JUNCTION BOX SKU GROHEE-MARK UP\n', 1, 5032533.44, 5032533.44, 1, 60, 1, 'TR561041124123644', '2024-08-16 00:00:00', '2024-10-15', 3, '2024-11-04 12:36:04'),
(109, 'PR2858830411241239', '4510506870', '502232882', '2555', 28, 'LED MONITORFHD\n', 1, 19819431.39, 19819431.39, 1, 60, 1, 'TR118041124124618', '2024-08-16 00:00:00', '2024-10-15', 3, '2024-11-04 12:45:29'),
(110, 'PR3048530411241246', '4510510008/10', '1002527934', '2556A', 30, '500 UNIT THURAYA AIRTIME\n', 1, 762374.40, 762374.40, 1, 60, 1, 'TR231041124124842', '2024-08-16 00:00:00', '2024-10-15', 3, '2024-11-04 12:47:58'),
(111, 'PR3076430411241249', '4510510008/10', '1002527934', '2556B', 30, 'MARK -UP 500 UNIT THURAYA AIRTIME\n', 1, 60989.95, 60989.95, 1, 60, 1, 'TR790041124125141', '2024-08-16 00:00:00', '2024-10-15', 3, '2024-11-04 12:50:58'),
(112, 'PR2945130411241253', '4510490250/50', '1002528481', '2557A', 29, 'IDT M5-TRANSPORTATION OF ALL MATERIALS\n', 1, 2854012.10, 2854012.10, 1, 60, 1, 'TR501041124125607', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 12:55:23'),
(113, 'PR2987930411241256', '4510490250/50', '1002528481', '2557B', 29, 'IDT M5-TRANSPORTATION OF ALL MATERIALS\n', 1, 551447.04, 551447.04, 1, 60, 1, 'TR760041124125913', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 12:58:26'),
(114, 'PR2927430411240100', '4510490260/100', '1002528487', '2558A', 29, 'IDT M5-WIRELESS ARUBA\n', 1, 2334771.60, 2334771.60, 1, 60, 1, 'TR096041124010312', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 13:02:18'),
(115, 'PR2921430411240107', '4510490260/100', '1002528487', '2558B', 29, 'IDT M5-WIRELESS ARUBA\n', 1, 451123.40, 451123.40, 1, 60, 1, 'TR071041124010940', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 13:09:05'),
(116, 'PR2923330411240204', '4510490260/110', '1002528488', '2559A', 29, 'IDT M5- CCTV AND ACCESS CONTROL\n', 1, 4043633.82, 4043633.82, 1, 60, 1, 'TR316041124020720', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 14:06:37'),
(117, 'PR2995730411240208', '4510490260/110', '1002528488', '2559B', 29, 'IDT M5- CCTV AND ACCESS CONTROL\n', 1, 781316.88, 781316.88, 1, 60, 1, 'TR372041124021025', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 14:09:36'),
(118, 'PR2902230411240211', '4510490260/60', '1002528483', '2560A', 29, 'IDT-LAN AND WAN NETWORK\n', 1, 1202169.13, 1202169.13, 1, 60, 1, 'TR920041124021330', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 14:12:55'),
(119, 'PR2941530411240213', '4510490260/60', '1002528483', '2560B', 29, 'IDT-LAN AND WAN NETWORK\n', 1, 232281.28, 232281.28, 1, 60, 1, 'TR846041124021605', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 14:15:26'),
(120, 'PR2911130411240218', '4510490260/90', '1002528486', '2561A', 29, 'IDT-CATV CABLING AND ACCESSORIES M5\n', 1, 1138193.21, 1138193.21, 1, 60, 1, 'TR455041124022122', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 14:20:41'),
(121, 'PR2981930411240222', '4510490260/90', '1002528486', '2561B', 29, 'IDT-CATV CABLING AND ACCESSORIES M5\n', 1, 219919.05, 219919.05, 1, 60, 1, 'TR513041124022533', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 14:24:35'),
(122, 'PR2915530411240226', '4510490260/120', '1002528491', '2562', 29, 'IDT-M5 EAC INTALLATION\n', 1, 9840824.05, 9840824.05, 1, 60, 1, 'TR744041124022817', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 14:27:36'),
(123, 'PR2927830411240228', '4510490260/120', '1002528491', '2562B', 29, 'IDT-M5 EAC INTALLATION\n', 1, 1901447.88, 1901447.88, 1, 60, 1, 'TR352041124023030', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 14:29:52'),
(124, 'PR2961530411240230', '4510490260/130', '1002528492', '2563A', 29, 'IDT-M5-IT FITTINGS\n', 1, 3922416.29, 3922416.29, 1, 60, 1, 'TR392041124023308', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 14:32:25'),
(125, 'PR2980630411240233', '4510490260/130', '1002528492', '2563B', 29, 'IDT-M5-IT FITTINGS\n', 1, 757887.28, 757887.28, 1, 60, 1, 'TR909041124023519', '2024-08-20 00:00:00', '2024-10-19', 3, '2024-11-04 14:34:55'),
(126, 'PR2966030511240824', '4510509168', '502241804', '2564', 29, 'PIXAVICAM BARTEC', 1, 5897696.59, 5897696.59, 1, 60, 1, 'TR218051124082709', '2024-08-23 00:00:00', '2024-10-22', 3, '2024-11-05 08:26:35'),
(127, 'PR3019130511240952', '4510509168', '502242755', '2565', 30, 'TELEPHONE HAZ', 1, 36929257.11, 36929257.11, 1, 60, 1, 'TR645051124095553', '2024-08-23 00:00:00', '2024-10-22', 3, '2024-11-05 09:55:10'),
(128, 'PR2834830511240956', '4510487905', '1002533292', '2567A', 28, 'TELECOM MATERIALS EX-WORKS', 1, 105565242.82, 105565242.82, 1, 60, 1, 'TR684051124095941', '2024-09-03 00:00:00', '2024-11-02', 3, '2024-11-05 09:58:46'),
(129, 'PR2888530511240959', '4510487905/20', '1002533293', '2567B', 28, 'MARK-UP TELECOMS MATERIALS EX-WORKS', 1, 14752760.90, 14752760.90, 1, 60, 1, 'TR934051124100320', '2024-09-03 00:00:00', '2024-11-02', 3, '2024-11-05 10:02:30'),
(130, 'PR3085830511241003', '4510494831', '502231641', '2568A', 30, 'CAMERA A LPR GENETEC', 1, 28185615.59, 28185615.59, 1, 60, 1, 'TR897051124100718', '2024-09-04 00:00:00', '2024-11-03', 3, '2024-11-05 10:06:24'),
(131, 'PR3067330511241007', '4510494831', '502231641', '2568B', 30, 'MARK-UP LINE', 1, 33531513.62, 33531513.62, 1, 60, 1, 'TR983051124101055', '2024-09-04 00:00:00', '2024-11-03', 3, '2024-11-05 10:09:48'),
(132, 'PR3059130511241011', '4510495747', '502231641', '2569A', 30, 'MONITOR FRAME WINSTED M1125', 1, 51125604.29, 51125604.29, 1, 60, 1, 'TR520051124101500', '2024-09-05 00:00:00', '2024-11-04', 3, '2024-11-05 10:14:20'),
(133, 'PR3091030511241015', '4510495747', '502243211', '2569B', 30, 'MARK-UP LINE FOR MONITOR FRAME WINSTED M1125', 1, 7144115.44, 7144115.44, 1, 60, 1, 'TR696051124101901', '2024-09-05 00:00:00', '2024-11-04', 3, '2024-11-05 10:18:06'),
(134, 'PR2892430511241019', '4510500324/10', '1002534873', '2570A', 28, 'ONSITE ENGR FOR MTCS SERVICE PROV OF ONSITE ENGINEER FOR INSTALLATION,REPAIRS', 1, 5506624.38, 5506624.38, 1, 60, 1, 'TR573051124102426', '2024-09-13 00:00:00', '2024-11-12', 3, '2024-11-05 10:23:28'),
(135, 'PR2894130511241024', '4510500324/10', '1002534873', '2570B', 28, 'ONSITE ENGR FOR MTCS SERVICES PROV OF ONSITE ENGINEERS FOR INSTALLATION,REPAIRS, DAILY INSPECTION', 1, 817.00, 817.00, 1, 60, 1, 'TR350051124102939', '2024-09-13 00:00:00', '2024-11-12', 3, '2024-11-05 10:28:48'),
(136, 'PR3057930511241030', '4510512616/10', '1002536510', '2571A', 30, 'LEVEL 3 SUBSURFACE DATA ANAL AND SERVERS YR-1', 1, 1557963.69, 1557963.69, 1, 60, 1, 'TR189051124103356', '2024-09-17 00:00:00', '2024-11-16', 3, '2024-11-05 10:32:49'),
(137, 'PR3084130511241034', '4510512616/20', '1002536848', '2571B', 30, 'MARK-UP FOR LEVEL 3 SUBSURFACE DATA ANAL AND SERVERS YR-1', 1, 171.00, 171.00, 1, 60, 1, 'TR657051124103704', '2024-09-23 00:00:00', '2024-11-22', 3, '2024-11-05 10:36:14'),
(138, 'PR2969630511241042', '451050953/10', '1002535719', '2572A', 29, 'HELO IDT ENERGY HUB LARGE MTR M6', 1, 1471385.50, 1471385.50, 1, 60, 1, 'TR774051124104651', '2024-09-19 00:00:00', '2024-11-18', 3, '2024-11-05 10:45:54'),
(139, 'PR2972430511241046', '451050953/10', '1002535719', '2572B', 29, 'HELO IDT ENERGYHUB LARGE MTR M6 ', 1, 803047.32, 803047.32, 1, 60, 1, 'TR372051124104913', '2024-09-19 00:00:00', '2024-11-18', 3, '2024-11-05 10:48:24'),
(140, 'PR2932830511241049', '451050953/10', '100253724', '2573A', 29, 'HELO IDT ACCESS CONTROL &AMP; PAGA M6 ', 1, 7230816.66, 7230816.66, 1, 60, 1, 'TR073051124105304', '2024-09-19 00:00:00', '2024-11-18', 3, '2024-11-05 10:52:11'),
(141, 'PR2991430511241053', '451050953/10', '100253724', '2573B', 29, 'HELO IDT ACCESS CONTROL &AMP; PAGA M6 ', 1, 3946431.59, 3946431.59, 1, 60, 1, 'TR283051124105557', '2024-09-19 00:00:00', '2024-11-18', 3, '2024-11-05 10:54:58'),
(142, 'PR2895530511241056', '4510506870', '502247409', '2574A', 28, 'SWITCH,NETWORK,CISCO,C9500-2', 1, 46830944.32, 46830944.32, 1, 60, 1, 'TR348051124110222', '2024-09-20 00:00:00', '2024-11-19', 3, '2024-11-05 11:01:04'),
(143, 'PR2803330511241102', '4510506870', '502247409', '2574B', 28, 'MARK-UP LINE FOR SWITCH,NETWORK,CISCO,C9500-2', 1, 24447679.83, 24447679.83, 1, 60, 1, 'TR890051124110703', '2024-09-20 00:00:00', '2024-11-19', 3, '2024-11-05 11:05:59'),
(144, 'PR2929030511241107', '451050953/20', '1002538505', '2575A', 29, 'HELO IDT ACCESS CONTROL &AMP; PAGA M7', 1, 14625869.97, 14625869.97, 1, 60, 1, 'TR440051124111236', '2024-09-26 00:00:00', '2024-11-25', 3, '2024-11-05 11:11:47'),
(145, 'PR2925130511241113', '451050953/20', '1002538505', '2575B', 29, 'HELO IDT ACCESS CONTROL &AMP; PAGA M7', 1, 7982601.36, 7982601.36, 1, 60, 1, 'TR861051124111644', '2024-09-26 00:00:00', '2024-11-25', 3, '2024-11-05 11:15:37'),
(146, 'PR2982330511241117', '451050953/30', '10025388512', '2576A', 29, 'SAMSUNG QMR 65CLASS HDR4K UHD COMMERCIAL', 1, 3244071.97, 3244071.97, 1, 60, 1, 'TR579051124112159', '2024-09-26 00:00:00', '2024-11-25', 3, '2024-11-05 11:21:06'),
(147, 'PR2955230511241122', '4510508305', '1002538512', '2576B', 29, 'SAMSUNG QMR 65CLASS HDR4K UHD COMMERCIAL', 1, 570008.84, 570008.84, 1, 60, 1, 'TR373051124112614', '2024-09-26 00:00:00', '2024-11-25', 3, '2024-11-05 11:24:48'),
(148, 'PR2880630511241126', '4510508305', '502250521', '2577A', 28, '100AH12V FULLRIVER BATTERY', 1, 47400000.00, 47400000.00, 1, 60, 1, 'TR404051124112956', '2024-09-27 00:00:00', '2024-11-26', 3, '2024-11-05 11:28:54'),
(149, 'PR2897330511241130', '4510508305', '502250521', '2577B', 28, 'MARK-UP FOR 100AH 12V FULL RIVER BATTERY', 1, 6624150.00, 6624150.00, 1, 60, 1, 'TR541051124113209', '2024-09-27 00:00:00', '2024-11-26', 3, '2024-11-05 11:31:35'),
(151, 'PR2869031111240127', '4510500324/10', '1002534873', '2570A', 28, 'ONSITE MAINTENANCE SERVICE FOR ACC CONTROL', 1, 5506624.38, 5506624.38, 1, 60, 1, 'TR659111124013010', '2024-09-13 00:00:00', '2024-11-12', 3, '2024-11-11 13:29:32'),
(152, 'PR2897531111240130', '45105000324/10', '1002534873', '2570B', 28, 'ONSITE MAINTENANCE SERVICE FOR ACC CONTROL', 1, 817000.00, 817000.00, 1, 60, 1, 'TR140111124013229', '2024-09-13 00:00:00', '2024-11-12', 3, '2024-11-11 13:31:47'),
(153, 'PR3059331111240132', '4510512616/10', '100253610', '2571', 30, 'PAY FOR 1 TDM_DW_SF FOLARIN', 1, 1557963.69, 1557963.69, 1, 60, 1, 'TR595111124013520', '2024-09-24 00:00:00', '2024-11-23', 3, '2024-11-11 13:34:27'),
(154, 'PR3084331111240135', '4510512616/20', '1002536848', '2571B', 30, 'MARK UP FOR SEPT 24 PAY FOR 1 TDM_DW_SF FOLARIN', 1, 171376.00, 171376.00, 1, 60, 1, 'TR802111124013837', '2024-09-23 00:00:00', '2024-11-22', 3, '2024-11-11 13:37:26'),
(155, 'PR2930931111240139', '451050953/10', '1002535719', '2572', 29, 'HELO IDT ENERGYHUB LARGE MTR M6', 1, 1471385.50, 1471385.50, 1, 60, 1, 'TR733111124014159', '2024-09-19 00:00:00', '2024-11-18', 3, '2024-11-11 13:41:15'),
(156, 'PR2915031111240142', '451050953/10', '1002535719', '2572B', 29, 'HELO IDT ENERGYHUB LARGE MTR M6', 1, 803.00, 803.00, 1, 60, 1, 'TR739111124014433', '2024-09-19 00:00:00', '2024-11-18', 3, '2024-11-11 13:43:55'),
(157, 'PR2938931111240144', '451050953/10', '100253724', '2573A', 29, 'HELO IDT ACCESS CONTROL &AMP; PAGA M6', 1, 7230816.66, 7230816.66, 1, 45, 1, 'TR428111124014800', '2024-09-19 00:00:00', '2024-11-03', 3, '2024-11-11 13:47:07'),
(158, 'PR2954931111240148', '451050953/10', '100253724', '2573B', 29, 'HELO IDT ACCESS CONTROL &AMP; PAGA M6', 1, 3946431.59, 3946431.59, 1, 45, 1, 'TR141111124015015', '2024-09-19 00:00:00', '2024-11-03', 3, '2024-11-11 13:49:38'),
(159, 'PR2837931111240151', '4510506870', '502247409', '2574A', 28, 'SPDC WORK MANAGEMENT PLANT', 1, 46830944.32, 46830944.32, 1, 45, 1, 'TR533111124015358', '2024-09-20 00:00:00', '2024-11-04', 3, '2024-11-11 13:53:14'),
(160, 'PR2807231111240154', '4510506870', '502247409', '2574B', 28, 'SPDC WORK MANAGEMENT PLANT', 1, 24447679.83, 24447679.83, 1, 45, 1, 'TR428111124015707', '2024-09-20 00:00:00', '2024-11-04', 3, '2024-11-11 13:56:26'),
(162, 'PR2932631111240204', '451050953/20', '1002538505', '2575A', 29, 'HELO IDT ACCESS CONTROL &AMP; PAGA', 1, 14625869.97, 14625869.97, 1, 45, 1, 'TR091111124020745', '2024-09-26 00:00:00', '2024-11-10', 3, '2024-11-11 14:06:50'),
(163, 'PR2926731111240208', '451050953/20', '1002538505', '2575B', 29, 'HELO IDT ACCESS CONTROL &AMP; PAGA M7', 1, 7982601.36, 7982601.36, 1, 45, 1, 'TR123111124020955', '2024-09-26 00:00:00', '2024-11-10', 3, '2024-11-11 14:09:17'),
(164, 'PR2949331111240210', '451050953/30', '10025388512', '2576A', 29, 'HELO IDT ADDITIONAL ITEMS', 1, 3244071.97, 3244071.97, 1, 45, 1, 'TR705111124021314', '2024-09-26 00:00:00', '2024-11-10', 3, '2024-11-11 14:12:14'),
(165, 'PR2917531111240216', '451050953/30', '1002538512', '2576B', 29, 'HELO IDT ACCESS CONTROL &AMP; PAGA M6', 1, 570008.84, 570008.84, 1, 45, 1, 'TR062111124021836', '2024-09-26 00:00:00', '2024-11-10', 3, '2024-11-11 14:17:41'),
(166, 'PR2868531111240219', '4510508305', '502250521', '2577A', 28, 'SPDC WORK MANAGEMENT PLANT', 1, 47400000.00, 47400000.00, 1, 45, 1, 'TR709111124022103', '2024-09-27 00:00:00', '2024-11-11', 3, '2024-11-11 14:20:19'),
(167, 'PR2854531111240221', '4510508305', '502250521', '2577B', 28, 'SPDC WORK MANAGEMENT PLANT', 1, 6624150.00, 6624150.00, 1, 45, 1, 'TR038111124022346', '2024-09-27 00:00:00', '2024-11-11', 3, '2024-11-11 14:23:01'),
(169, 'PR2804131111240242', '4510509217', '502252613', '2578A', 28, 'SPDC WORK MANAGEMENT PLANT', 1, 47736014.52, 47736014.52, 1, 45, 1, 'TR421111124024434', '2024-10-07 00:00:00', '2024-11-21', 3, '2024-11-11 14:43:54'),
(170, 'PR2832431111240245', '4510509217', '502252613', '2578B', 28, 'SPDC WORK MANAGEMENT PLANT', 1, 6157941.20, 6157941.20, 1, 45, 1, 'TR515111124024745', '2024-10-07 00:00:00', '2024-11-21', 3, '2024-11-11 14:46:52'),
(171, 'PR2829531111240248', '4510512340', '502252439', '2579', 28, 'SPDC WORK MANAGEMENT PLANT', 1, 4907364.10, 4907364.10, 1, 45, 1, 'TR637111124025040', '2024-10-07 00:00:00', '2024-11-21', 3, '2024-11-11 14:50:06'),
(172, 'PR2809031111240251', '4510512004', '502253414', '2580', 28, 'PORT HARCOURT MAIN WAREHOUSE', 1, 9472548.51, 9472548.51, 1, 45, 1, 'TR945111124025412', '2024-10-09 00:00:00', '2024-11-23', 3, '2024-11-11 14:52:35'),
(173, 'PR3010031111240254', '4510511919', '502252792', '2581', 30, 'SNEPCO WORK PLANT', 1, 81990526.00, 81990526.00, 1, 45, 1, 'TR456111124025706', '2024-10-09 00:00:00', '2024-11-23', 3, '2024-11-11 14:56:27'),
(174, 'PR3001031111240257', '4510505933', '502253540', '2582', 30, 'SNEPCO WORK PLANT', 1, 151816610.87, 151816610.87, 1, 45, 1, 'TR200111124025910', '2024-10-09 00:00:00', '2024-11-23', 3, '2024-11-11 14:58:40'),
(175, 'PR3055331111240300', '4510514278/10', '1002543177', '2582A', 30, 'OCT 24 PAY FOR 1 TDM_DW_SF S FOLARIN', 1, 1633281.11, 1633281.11, 1, 45, 1, 'TR171111124030542', '2024-10-16 00:00:00', '2024-11-30', 3, '2024-11-11 15:04:57'),
(176, 'PR3055831111240306', '4510514278/30', '1002543178', '2582B', 30, 'MARK UP FOR OCT 24 PAY FOR 1 TDM_DW_SF FOLARIN', 1, 179660.92, 179660.92, 1, 45, 1, 'TR517111124030920', '2024-10-16 00:00:00', '2024-11-30', 3, '2024-11-11 15:08:27'),
(177, 'PR2898431111240310', '4510500324/10', '1002540245', '2583A', 28, 'ACCESS CONTROL SYSTEM MAINTENANCE SEPT 2024', 1, 5539085.25, 5539085.25, 1, 45, 1, 'TR984111124031327', '2024-10-16 00:00:00', '2024-11-30', 3, '2024-11-11 15:12:42'),
(178, 'PR2825931111240314', '4510500324/10', '1002540245', '2583B', 28, 'ACCESS CONTROL SYSTEM MAINTENANCE SEPT 2024', 1, 817000.00, 817000.00, 1, 45, 1, 'TR198111124033248', '2024-10-16 00:00:00', '2024-11-30', 3, '2024-11-11 15:32:06'),
(179, 'PR2866531111240334', '4510509983/10', '1002540246', '2584a', 28, 'CCTV SYSTEM MAINTENANCE SEPT 2024', 1, 10833894.29, 10833894.29, 1, 45, 1, 'TR024111124033746', '2024-10-16 00:00:00', '2024-11-30', 3, '2024-11-11 15:36:51'),
(180, 'PR2821831111240338', '4510509983/10', '1002540246', '2584B', 28, 'CCTV SYSTEM MAINTENANCE SEPT 2024', 1, 806250.00, 806250.00, 1, 45, 1, 'TR318111124033954', '2024-10-16 00:00:00', '2024-11-30', 3, '2024-11-11 15:39:04'),
(181, 'PR3044531111240340', '4510511998', '4510511998', '2586', 30, 'SUMMARY OF WORK ORDER SUB ITEMS', 1, 61814304.90, 61814304.90, 1, 45, 1, 'TR875111124034235', '2024-10-17 00:00:00', '2024-12-01', 3, '2024-11-11 15:42:05'),
(182, 'PR3060431111240343', '4510505933', '502256078', '2587', 30, 'SNEPCO WORK PLANT', 1, 961871.80, 961871.80, 1, 45, 1, 'TR090111124034455', '2024-10-22 00:00:00', '2024-12-06', 3, '2024-11-11 15:44:14'),
(183, 'PR2888931111240345', '4510512003', '502256491', '2588', 28, 'SPDC WORK MANAGEMENT PLANT', 1, 18839073.10, 18839073.10, 1, 45, 1, 'TR307111124034828', '2024-10-25 00:00:00', '2024-12-09', 3, '2024-11-11 15:47:52'),
(184, 'PR2845531111240348', '4510513463/10', '1002544015', '2589', 28, 'INSTALL/CONFIGURE/INTEGRATE CCTV CAMERAS SEPT-OCT 2024', 1, 10789152.00, 10789152.00, 1, 45, 1, 'TR870111124035147', '2024-10-30 00:00:00', '2024-12-14', 3, '2024-11-11 15:50:37'),
(185, 'PR2824031111240352', '4510513303', '502256822', '2590', 28, 'SPDC WORK MANAGEMENT PLANT', 1, 335146489.10, 335146489.10, 1, 45, 1, 'TR244111124035506', '2024-11-01 00:00:00', '2024-12-16', 3, '2024-11-11 15:54:27'),
(186, 'PR2884731111240355', '4510492935', '502258777', '2591', 28, 'SPDC WORK MANAGEMENT PLANT', 1, 1869124.53, 1869124.53, 1, 45, 1, 'TR824111124035754', '2024-11-01 00:00:00', '2024-12-16', 3, '2024-11-11 15:57:17'),
(187, 'PR3229831111240410', 'MESL/MAINT/JEVI/PO/2024', '001/2024', '2592', 32, 'SUPPLY/DELIVERY OF VARIOUS GNC ELECTRICAL BULK MATERIALS', 1, 97429440.70, 97429440.70, 1, 45, 1, 'TR212111124041324', '2024-11-07 00:00:00', '2024-12-22', 3, '2024-11-11 16:12:36'),
(189, 'PR2852531311241141', '4510506870', '502260935', '2595', 28, 'SWITCH NETWORK TRENDNET-TIUPG', 1, 10269442.82, 10269442.82, 1, 45, 1, 'TR634131124114347', '2024-11-13 00:00:00', '2024-12-28', 3, '2024-11-13 11:42:55'),
(191, 'PR2838432211240910', '4510506870', '502260935', '2595', 28, 'SWITCH NETWORK TRENDNET-TIUPG', 1, 10316047.82, 10316047.82, 1, 45, 1, 'TR984221124091313', '2024-11-13 00:00:00', '2024-12-28', 3, '2024-11-22 09:12:20'),
(192, 'PR3090032211240913', '4510514278/10', '1002549194', '2596A', 30, 'LEVEL 3 SUBSURFACE DATA ANAL AND SERVERS YR-2', 1, 1633281.11, 1633281.11, 1, 45, 1, 'TR553221124091630', '2024-11-15 00:00:00', '2024-12-30', 3, '2024-11-22 09:15:26'),
(193, 'PR3059332211240916', '4510514278/30', '1002549195', '2596B', 30, 'MARK-UP FOR LEVEL 3 SUBSURFACE DATA ANAL AND SERVERS YR-1', 1, 179660.92, 179660.92, 1, 45, 1, 'TR660221124091920', '2024-11-15 00:00:00', '2024-12-30', 3, '2024-11-22 09:18:39'),
(194, 'PR2881232211240919', '4510509983/10', '1002547970', '2597A', 28, 'PROV OF ONSITE ENGR FOR INSTALLATION', 1, 11002295.76, 11002295.76, 1, 45, 1, 'TR133221124092233', '2024-11-18 00:00:00', '2025-01-02', 3, '2024-11-22 09:21:49'),
(195, 'PR2823232211240923', '4510509983/10', '1002547970', '2597B', 28, 'PROV FOR ONSITE ENGR FOR INSTALLATION', 1, 806250.00, 806250.00, 1, 45, 1, 'TR656221124092524', '2024-11-18 00:00:00', '2025-01-02', 3, '2024-11-22 09:24:31'),
(196, 'PR2806432211240925', '4510515571/10', '1002548048', '2598A', 28, 'ONSITE ENGR FOR MTEE SERVICES, PROV OF ONSITE ENGINEERS FOR INSTALLATION,REPAIR DAILY INSPECTION', 1, 5625184.50, 5625184.50, 1, 45, 1, 'TR456221124092949', '2024-11-18 00:00:00', '2025-01-02', 3, '2024-11-22 09:29:11'),
(197, 'PR2841432211240930', '4510515571/10', '1002548048', '2598B', 28, 'ONSITE ENGR FOR MTEE SERVICES, PROV OF ONSITE ENGINEERS FOR INSTALLATION,REPAIR DAILY INSPECTION', 1, 817000.00, 817000.00, 1, 45, 1, 'TR411221124093311', '2024-11-18 00:00:00', '2025-01-02', 3, '2024-11-22 09:32:32'),
(198, 'PR3043930512241005', '4510509168', '502260839', '2594', 30, 'MARK-UP FOR SPARE PARTS FOR BONGA CWE FAULY', 1, 18369750.00, 18369750.00, 1, 45, 1, 'TR383051224100826', '2024-12-05 00:00:00', '2025-01-19', 3, '2024-12-05 10:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `issue_items`
--

CREATE TABLE `issue_items` (
  `issue_id` int(11) NOT NULL,
  `from_store` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `issue_status` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `cost_price` int(11) DEFAULT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `cost_price` int(255) NOT NULL,
  `sales_price` int(255) NOT NULL,
  `pack_size` int(11) NOT NULL,
  `pack_price` int(11) NOT NULL,
  `wholesale` int(11) NOT NULL,
  `wholesale_pack` int(11) NOT NULL,
  `reorder_level` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `item_status` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_transfers`
--

CREATE TABLE `item_transfers` (
  `transfer_id` int(11) NOT NULL,
  `item_from` int(11) NOT NULL,
  `item_to` int(11) NOT NULL,
  `removed_qty` int(11) NOT NULL,
  `added_qty` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE `ledgers` (
  `ledger_id` int(11) NOT NULL,
  `account_group` int(11) NOT NULL,
  `sub_group` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `ledger` varchar(1024) NOT NULL,
  `acn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ledgers`
--

INSERT INTO `ledgers` (`ledger_id`, `account_group`, `sub_group`, `class`, `ledger`, `acn`) VALUES
(24, 1, 2, 5, 'LAND AND BUILDING', 1020524),
(25, 1, 2, 5, 'OFFICE EQUIPMENT', 1020525),
(28, 1, 1, 2, 'CASH ACCOUNT', 1010228),
(29, 1, 1, 3, 'INVENTORIES', 1010329),
(30, 3, 5, 11, 'GENERAL REVENUE', 30501130),
(37, 4, 6, 12, 'UTILITY BILLS', 40601237),
(38, 4, 6, 12, 'TRANSPORTATION', 40601238),
(39, 4, 6, 12, 'SALARIES AND WAGES', 40601239),
(40, 4, 8, 15, 'DEPRECIATION EXPENSE', 40801540),
(41, 4, 8, 15, 'AMORTIZATION - SOFTWARE COST', 40801541),
(42, 1, 2, 6, 'ACCUM DEPRE - LAND AND BUILDING', 1020642),
(44, 1, 2, 6, 'ACCUM DEPRE - OFFICE EQUIPMENT', 1020644),
(45, 5, 9, 16, 'EQUITY CAPITAL', 50901645),
(46, 5, 9, 17, 'RETAINED EARNINGS', 50901746),
(47, 1, 2, 5, 'MOTOR VEHICLES', 1020547),
(48, 1, 2, 5, 'FURNITURE AND FITTINGS', 1020548),
(49, 5, 9, 16, 'DIRECTOR CURRENT ACCOUNT', 50901649),
(50, 1, 1, 1, 'STANBIC IBTC', 1010150),
(51, 1, 1, 1, 'FIDELITY BANK', 1010151),
(52, 1, 1, 1, 'FIRST BANK', 1010152),
(53, 1, 1, 1, 'STANBIC IBTC 2', 1010153),
(60, 4, 10, 18, 'LOSS ON DISPOSAL OF ASSET', 401001860),
(61, 3, 5, 19, 'GAIN ON DISPOSAL OF ASSET', 30501961),
(62, 1, 2, 6, 'ACCUM DEPRE - MOTOR VEHICLES', 1020662),
(63, 4, 7, 14, 'LOCAL DELIVERY', 40701463),
(67, 4, 6, 13, 'COMPANY INCOME TAX', 40601267),
(68, 4, 6, 13, 'LOAN FEES', 40601368),
(69, 4, 6, 13, 'BANK CHARGES', 40601369),
(70, 2, 3, 9, 'SHORT TERM LOANS', 2030970),
(71, 2, 4, 10, 'LONG TERM LOANS', 20401071),
(72, 1, 1, 4, 'SHELL PETROLEUM DEV COY  OF NIGERIA', 1010472),
(73, 1, 1, 4, 'SHELL NIGERIA GAS', 1010473),
(74, 1, 1, 4, 'SHELL NIGERIA EXPLORATION AND PRODUCTION LTD', 1010474),
(75, 1, 1, 4, 'HIQOS', 1010475),
(76, 2, 3, 7, 'WESTCON ', 2030776),
(77, 2, 3, 7, 'PESTRA', 2030777),
(78, 2, 3, 7, 'PROVIDUM', 2030778),
(79, 2, 3, 7, 'SWAN ELECTRIC', 2030779),
(80, 2, 3, 7, 'NAS IT SOLUTIONS', 2030780),
(81, 2, 3, 7, 'ERS-ELECRONIC READING SYSTEMS LTD', 2030781),
(82, 2, 3, 7, 'CLIDINUIM ENERGY SERVICES', 2030782),
(83, 2, 3, 7, 'COSCHARIS MOTORS LTD', 2030783),
(84, 2, 3, 7, 'SUMI INTERNATIONAL FZ LLC', 2030784),
(85, 2, 3, 7, 'SHANGHAI METAL CORPORATION(HK)LTD', 2030785),
(86, 2, 3, 7, 'SUNZIK ENTERPRISES NIG LTD', 2030786),
(87, 2, 3, 7, 'ELECTRIC HOUSE TRADING COMPANY', 2030787),
(88, 2, 3, 7, 'EDIONSEL ENGINEERING LTD', 2030788),
(89, 2, 3, 7, 'ALPHATECH ENGINEERING NIG LTD', 2030789),
(90, 1, 1, 4, 'MORPOL ENGINEERING SERVICES', 1010490),
(91, 2, 3, 7, 'MURCAL INC,', 2030791),
(92, 2, 3, 7, 'IEC TELECOM', 2030792),
(93, 2, 3, 7, 'SIGMA WIRELESS COMMUNICATION LTD', 2030793),
(94, 2, 3, 7, 'NEPTURA', 2030794),
(95, 2, 3, 7, 'INTEGRATED SERVICE SOLUTIONS', 2030795),
(96, 2, 3, 7, 'A PLUS RESOURCES LIMITED', 2030796),
(97, 2, 3, 7, 'CRISTAD LOGISTICS LTD', 2030797),
(98, 4, 6, 13, 'MD\'S CHILDREN SCHOOL FEES', 40601398),
(99, 1, 1, 1, 'FOREX', 1010199),
(100, 2, 3, 7, 'SOURCING IT,', 20307100),
(101, 2, 3, 7, 'OMNICAL B.V', 20307101),
(102, 2, 3, 7, 'FULL RIVER BATTERY GROUP (HK) LTD', 20307102),
(103, 2, 3, 7, 'ITECO NIGERIA LTD', 20307103),
(104, 2, 3, 7, 'NTAKO GLOBAL RESOURCES LTD', 20307104),
(105, 2, 3, 7, 'ABACUS LIGHTNING', 20307105),
(106, 2, 3, 7, 'MEDIA &AMP; COMMUNICATION', 20307106),
(107, 2, 3, 7, 'ABLE INSTRUMENT &AMP; CONTROL LTD', 20307107),
(108, 4, 7, 14, 'COURIER EXPENSES', 406012108),
(109, 4, 7, 14, 'FREIGHT AND CUSTOMS  DUTIES', 406012109),
(110, 4, 6, 12, 'COMPUTER CONSUMABLES', 407014110),
(111, 4, 6, 13, 'PETTY PROJECT EXPENSES', 406013111),
(112, 4, 6, 13, 'TRANSFER TO MDS ACCOUNT', 406013112),
(113, 2, 3, 7, 'CHLORIDE SAS', 20307113),
(114, 2, 3, 7, 'ALTRON COMMUNICATION EQUIPMENT LTD', 20307114),
(115, 2, 3, 7, 'SYSTEM INTELLIGENZ LTD', 20307115),
(116, 2, 3, 7, 'DOLPHIN MANUFACTURING LLC', 20307116);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(11) NOT NULL,
  `financier` int(11) NOT NULL,
  `loan_account` int(11) NOT NULL,
  `contra_ledger` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `trans_type` varchar(50) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `trans_date` date DEFAULT NULL,
  `store` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `menu_id` int(11) NOT NULL,
  `menu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `menu`) VALUES
(1, 'Admin menu'),
(2, 'Sales menu'),
(3, 'Purchase menu'),
(4, 'Financial mgt'),
(5, 'Reports'),
(6, 'Financial reports'),
(8, 'Invoicing'),
(9, 'Asset Management'),
(10, 'Chart Of Account');

-- --------------------------------------------------------

--
-- Table structure for table `multiple_payments`
--

CREATE TABLE `multiple_payments` (
  `id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `cash` int(11) NOT NULL,
  `transfer` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `bank` int(11) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opening_balance`
--

CREATE TABLE `opening_balance` (
  `balance_id` int(11) NOT NULL,
  `ledger` int(11) NOT NULL,
  `trans_type` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `trans_date` date DEFAULT NULL,
  `store` int(11) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `opening_balance`
--

INSERT INTO `opening_balance` (`balance_id`, `ledger`, `trans_type`, `amount`, `trx_number`, `trans_date`, `store`, `details`, `post_date`, `posted_by`) VALUES
(23, 45, 'Credit', 1000000.00, 'TR805290924074938', '2024-01-01', 1, 'Opening Balance As At &quot;01-Jan-2024&quot;', '2024-09-29 19:49:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `other_income`
--

CREATE TABLE `other_income` (
  `income_id` int(11) NOT NULL,
  `income_head` varchar(255) NOT NULL,
  `activity` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `other_transactions`
--

CREATE TABLE `other_transactions` (
  `trx_id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `ledger` int(11) NOT NULL,
  `contra_ledger` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `trans_type` varchar(50) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `trans_date` date DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `other_transactions`
--

INSERT INTO `other_transactions` (`trx_id`, `store`, `ledger`, `contra_ledger`, `amount`, `details`, `trans_type`, `trx_number`, `trans_date`, `post_date`, `posted_by`) VALUES
(1, 1, 99, 53, 38408356.00, 'USD EXCHANGE FOR NAIRA', 'Debit', 'TR397141124050319', '2024-03-25', '2024-11-14 17:03:19', 3);

-- --------------------------------------------------------

--
-- Table structure for table `outstanding`
--

CREATE TABLE `outstanding` (
  `id` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `sales_type` varchar(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `amount_due` decimal(12,2) NOT NULL,
  `store` int(11) NOT NULL,
  `amount_paid` decimal(12,2) NOT NULL,
  `discount` int(20) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `bank` int(11) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

CREATE TABLE `production` (
  `product_id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `product_number` varchar(50) DEFAULT NULL,
  `product_qty` int(11) NOT NULL,
  `raw_material` int(11) NOT NULL,
  `raw_quantity` int(11) NOT NULL,
  `unit_cost` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `product_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `purchase_id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `item` int(11) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `cost_price` decimal(12,2) NOT NULL,
  `sales_price` decimal(12,2) NOT NULL,
  `vendor` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `waybill` decimal(12,2) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `expiration_date` date NOT NULL,
  `purchase_status` int(11) NOT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`purchase_id`, `store`, `invoice`, `item`, `details`, `cost_price`, `sales_price`, `vendor`, `quantity`, `waybill`, `trx_number`, `expiration_date`, `purchase_status`, `purchase_date`, `posted_by`, `post_date`) VALUES
(4, 1, 'LPO 273', 0, 'NBE-6502.AL', 9674940.00, 0.00, 2, 1, 1292629.25, 'TR754081124101225', '0000-00-00', 1, '2024-01-09 00:00:00', 3, '2024-11-06 11:56:13'),
(5, 1, 'LPO 276', 0, 'SUPPLY OF TRENDNET POWER SUPPLY FOR SNEPCO', 3677265.12, 0.00, 3, 1, 0.00, 'TR449081124101854', '0000-00-00', 1, '2024-01-09 00:00:00', 3, '2024-11-06 12:17:52'),
(6, 1, 'LPO 277', 0, '1794-1B16 ALLEN-BRADLEY', 154654.10, 0.00, 4, 1, 0.00, 'TR342081124102013', '0000-00-00', 1, '2024-01-19 00:00:00', 3, '2024-11-06 12:37:01'),
(7, 1, 'LPO 282', 0, 'SUPPLY OF ELECTRICAL MATERIALS FOR SPDC', 1182649.00, 0.00, 5, 1, 0.00, 'TR176081124102206', '0000-00-00', 1, '2024-02-07 00:00:00', 3, '2024-11-06 12:43:41'),
(8, 1, 'LPO 281', 0, 'SUPPLY OF LABEL TAPES FOR SNEPCO', 2035793.79, 0.00, 6, 1, 0.00, 'TR330081124102111', '0000-00-00', 1, '2024-02-08 00:00:00', 3, '2024-11-06 12:46:36'),
(9, 1, 'LPO 279', 0, 'SUPPLY OF ARUBA EQUIPMENT FOR SNG', 21049614.76, 0.00, 8, 1, 0.00, 'TR610081124102330', '0000-00-00', 1, '2024-02-06 00:00:00', 3, '2024-11-06 14:30:28'),
(11, 1, 'LPO 270', 0, ' UPS-7242-V-01 SUBSEA UPS A FAILURE FOR SNEPCO', 53962199.69, 0.00, 14, 1, 0.00, 'TR984081124101718', '0000-00-00', 1, '2024-02-09 00:00:00', 3, '2024-11-06 14:56:43'),
(12, 1, 'LPO292', 0, 'ABUJA CCTV SPDC PO', 29879348.25, 0.00, 3, 1, 0.00, 'TR895081124102952', '0000-00-00', 1, '2024-05-30 00:00:00', 3, '2024-11-06 15:46:17'),
(13, 1, 'LPO 205/2023', 0, 'CCTV AND ACCESS CONTROL MATERIALS FOR NUN RIVER PROJECT', 112035107.80, 0.00, 3, 1, 0.00, 'TR234081124114344', '0000-00-00', 1, '2024-02-12 00:00:00', 3, '2024-11-08 11:42:20'),
(14, 1, 'LPO205/2023', 0, 'CCTV AND ACCESS CONTROL MATERIALS FOR NUN RIVER PROJECT', 54039962.00, 0.00, 3, 1, 0.00, 'TR150081124114712', '0000-00-00', 1, '2023-11-15 00:00:00', 3, '2024-11-08 11:46:30'),
(15, 1, 'LPO 252/270', 0, 'REPLACEMENT OF DCTS FOR SHELL BONGAS UPS', 83203563.14, 0.00, 14, 1, 0.00, 'TR137081124115317', '0000-00-00', 1, '2024-02-09 00:00:00', 3, '2024-11-08 11:52:28'),
(17, 1, 'LPO 246', 0, 'CISCO MATERIALS FOR SNEPCO PROJECT', 27678517.55, 0.00, 1, 1, 0.00, 'TR146081124121309', '0000-00-00', 1, '2024-01-03 00:00:00', 3, '2024-11-08 12:08:20'),
(18, 1, 'LPO 246', 0, 'CISCO MATERIALS FOR SNEPCO PROJECT', 17752398.44, 0.00, 1, 1, 0.00, 'TR146081124121309', '0000-00-00', 1, '2024-01-09 00:00:00', 3, '2024-11-08 12:11:50'),
(19, 1, 'LPO 272', 0, 'BOOM EDAM 100EC2-SHL', 22226514.26, 0.00, 3, 1, 0.00, 'TR030081124122018', '0000-00-00', 1, '2024-01-09 00:00:00', 3, '2024-11-08 12:19:50'),
(20, 1, 'LPO 272  (2)', 0, 'BOOM EDAM 100EC2-SHL', 22226514.26, 0.00, 1, 1, 0.00, 'TR962081124122406', '0000-00-00', 1, '2024-02-29 00:00:00', 3, '2024-11-08 12:23:36'),
(21, 1, 'LPO 280', 0, 'SUPPLY OF CABLE TIES FOR SNEPCO', 345064.20, 0.00, 10, 1, 0.00, 'TR252081124014054', '0000-00-00', 1, '2024-02-07 00:00:00', 3, '2024-11-08 13:40:02'),
(22, 1, 'LPO 001', 0, 'MAINTENANCE SERVICE ON ALPHA PLANT', 28054000.00, 0.00, 7, 1, 0.00, 'TR444081124043630', '0000-00-00', 1, '2024-02-06 00:00:00', 3, '2024-11-08 16:35:38'),
(23, 1, 'LPO 275', 0, 'SUPPLY OF POWER SUPPLY WITH TACHOMETER', 1647502.84, 0.00, 15, 1, 0.00, 'TR905121124023917', '0000-00-00', 1, '2024-01-10 00:00:00', 3, '2024-11-12 14:38:13'),
(24, 1, '001/2024', 0, 'SHELL SIM SUBSCRIPTION FEES', 9097300.00, 0.00, 16, 1, 0.00, 'TR039121124031252', '0000-00-00', 1, '2024-02-01 00:00:00', 3, '2024-11-12 15:12:09'),
(25, 1, 'LPO 274', 0, 'MOTOROLA DM1400 VHF MOBILE', 937874.70, 0.00, 17, 1, 0.00, 'TR011121124035448', '0000-00-00', 1, '2024-01-23 00:00:00', 3, '2024-11-12 15:54:13'),
(26, 1, 'LPO 271', 0, 'SUPPLLY OF HP DOCKING MONITOR FOR SNG', 36389200.00, 0.00, 9, 1, 0.00, 'TR863121124041224', '0000-00-00', 1, '2023-12-27 00:00:00', 3, '2024-11-12 16:11:42'),
(27, 1, 'LPO 271/2', 0, 'SUPPLY OF HP DOCKING MONITOR FOR SNG', 25410578.36, 0.00, 9, 1, 0.00, 'TR859121124041707', '0000-00-00', 1, '2024-02-06 00:00:00', 3, '2024-11-12 16:16:36'),
(28, 1, 'LPO 257', 0, 'SUPPLY OF VQS PROJECT SECURITY MATERIALS FOR SHELL', 70493158.24, 0.00, 18, 1, 0.00, 'TR440121124043311', '0000-00-00', 1, '2024-02-07 00:00:00', 3, '2024-11-12 16:32:51'),
(29, 1, 'LPO 284', 0, 'SUPPLY OF GENETEC SOFTWARE FOR SPDC', 47167772.01, 0.00, 18, 1, 0.00, 'TR155121124043656', '0000-00-00', 1, '2024-02-07 00:00:00', 3, '2024-11-12 16:36:31'),
(30, 1, '001/2024', 0, 'NEPTURA TRAINING', 3566141.60, 0.00, 18, 1, 0.00, 'TR573121124044834', '0000-00-00', 1, '2024-02-12 00:00:00', 3, '2024-11-12 16:48:05'),
(31, 1, '001/2024', 0, 'LOGISTICS FOR PROVIDUM ITEMS SUPPLIED', 1601124.80, 0.00, 19, 1, 0.00, 'TR424121124045936', '0000-00-00', 1, '2024-02-12 00:00:00', 3, '2024-11-12 16:58:59'),
(32, 1, '002/2024', 0, 'MAINTENANCE SERVICES ON ALPHA PLANT', 14020700.00, 0.00, 7, 1, 0.00, 'TR309141124094225', '0000-00-00', 1, '2024-02-19 00:00:00', 3, '2024-11-14 09:41:56'),
(33, 1, 'DDIS-346', 0, 'SUPPLY OF ACCESS CONTROL MATERIALS FOR NUNRIVER PROJECT', 84714962.20, 0.00, 11, 1, 0.00, 'TR771141124094712', '0000-00-00', 1, '2024-02-19 00:00:00', 3, '2024-11-14 09:46:42'),
(34, 1, 'DDIS-366', 0, 'SUPPLY OF IT MATERIALS FOR SNG PROJECT AT HERITAGE HOUSE', 103540514.02, 0.00, 11, 1, 0.00, 'TR922141124095056', '0000-00-00', 1, '2024-02-19 00:00:00', 3, '2024-11-14 09:50:22'),
(35, 1, '257', 0, 'FREIGHT CHARGES', 3617340.60, 0.00, 18, 1, 0.00, 'TR790141124095508', '0000-00-00', 1, '2024-02-28 00:00:00', 3, '2024-11-14 09:54:46'),
(36, 1, 'LPO 244', 0, 'THEORETICAL AND PHYSICAL TRAINING FOR DISTRAN PRO CAMERA', 20529644.32, 0.00, 20, 1, 0.00, 'TR397141124100901', '0000-00-00', 1, '2024-03-01 00:00:00', 3, '2024-11-14 10:08:41'),
(37, 1, '003/2024', 0, 'MAINTENANCE SERVICES ON ALPHA PLANT', 7560700.00, 0.00, 7, 1, 0.00, 'TR765141124101425', '0000-00-00', 1, '2024-03-04 00:00:00', 3, '2024-11-14 10:14:08'),
(38, 1, '004/2024', 0, 'MAINTENANCE SERVICES ON ALPHA PLANT', 7560700.00, 0.00, 7, 1, 0.00, 'TR075141124101733', '0000-00-00', 1, '2024-03-08 00:00:00', 3, '2024-11-14 10:17:02'),
(39, 1, '001/2024', 0, 'US PICK-UP-BOONEDAN (TURNSTILE)', 10009474.64, 0.00, 21, 1, 0.00, 'TR484151124095243', '0000-00-00', 1, '2024-03-14 00:00:00', 3, '2024-11-14 10:30:49'),
(40, 1, '001/2024', 0, 'US PICK-UP- BOONEDAN', 3477885.30, 0.00, 21, 1, 0.00, 'TR484151124095243', '0000-00-00', 1, '2024-04-17 00:00:00', 3, '2024-11-15 09:52:03'),
(41, 1, 'LPO 289', 0, 'IPAD MINI 6 FOR SNEPCO', 48670215.00, 0.00, 22, 1, 0.00, 'TR783151124100105', '0000-00-00', 1, '2024-04-23 00:00:00', 3, '2024-11-15 10:00:39'),
(42, 1, 'KBD101827', 0, 'LEGRAND-510203', 14766262.43, 0.00, 23, 1, 0.00, 'TR782151124101356', '0000-00-00', 1, '2024-05-17 00:00:00', 3, '2024-11-15 10:13:23'),
(43, 1, 'ITC0000006953', 0, 'SUPPLY OF SPEEDLANE 900 SPARE PARTS', 3007588.10, 0.00, 25, 1, 0.00, 'TR332151124104801', '0000-00-00', 1, '2024-05-23 00:00:00', 3, '2024-11-15 10:46:02'),
(44, 1, 'LPO 292', 0, 'ABUJA CCTV SPDC ', 29878721.44, 0.00, 3, 1, 0.00, 'TR299151124110119', '0000-00-00', 1, '2024-05-30 00:00:00', 3, '2024-11-15 11:00:56'),
(45, 1, 'LPO 293', 0, 'GENETICS ITEMS', 39681547.80, 0.00, 18, 1, 0.00, 'TR707151124110617', '0000-00-00', 1, '2024-06-14 00:00:00', 3, '2024-11-15 11:05:54'),
(46, 1, 'LPO 294', 0, 'CISCO MATERIALS FOR ABUJA CCTV', 32954898.43, 0.00, 1, 1, 0.00, 'TR427151124111747', '0000-00-00', 1, '2024-05-21 00:00:00', 3, '2024-11-15 11:17:25'),
(47, 1, 'LPO 296', 0, 'CISCO MATERIALS FOR DATACOM', 288370674.75, 0.00, 1, 1, 0.00, 'TR117151124112135', '0000-00-00', 1, '2024-06-21 00:00:00', 3, '2024-11-15 11:21:12'),
(48, 1, 'LPO 291', 0, 'FULLRIVER 12V BATTERY', 36546436.80, 0.00, 24, 1, 0.00, 'TR920151124114408', '0000-00-00', 1, '2024-06-24 00:00:00', 3, '2024-11-15 11:43:50'),
(49, 1, 'LPO 295', 0, 'MATERIALS FOR SNG HELO PROJECT', 99264048.70, 0.00, 3, 1, 0.00, 'TR161151124115235', '0000-00-00', 1, '2024-06-24 00:00:00', 3, '2024-11-15 11:52:14'),
(50, 1, '001/2024', 0, 'STORAGE ON 4 PALLETS OF FULLRIVER BATTERIES AND SEA FREIGHT', 31362600.00, 0.00, 26, 1, 0.00, 'TR552151124120710', '0000-00-00', 1, '2024-07-01 00:00:00', 3, '2024-11-15 12:06:50'),
(51, 1, '90160963', 0, 'ABACUS POLES', 23471565.98, 0.00, 27, 1, 0.00, 'TR077221124100815', '0000-00-00', 1, '2024-07-04 00:00:00', 3, '2024-11-22 10:07:57'),
(52, 1, '17/07', 0, 'THURAYA CODE 500 UNITS', 754270.53, 0.00, 16, 1, 0.00, 'TR484221124101245', '0000-00-00', 1, '2024-07-19 00:00:00', 3, '2024-11-22 10:12:24'),
(53, 1, '003/2024', 0, 'AIRFREIGHT, CUSTOM CLEARANCE AND DELIVERY', 10976910.00, 0.00, 26, 1, 0.00, 'TR289221124102052', '0000-00-00', 1, '2024-07-19 00:00:00', 3, '2024-11-22 10:20:36'),
(54, 1, '569545A', 0, 'GAI-TRONICS AUTELDAC 5 N/C (O BUTTON) TELEPHONE', 19981096.78, 0.00, 28, 1, 0.00, 'TR708221124103504', '0000-00-00', 1, '2024-07-23 00:00:00', 3, '2024-11-22 10:34:45'),
(55, 1, 'LPO 305', 0, 'SNG HERITAGE BUILDING PROJECT', 2979447.00, 0.00, 18, 1, 0.00, 'TR584221124110113', '0000-00-00', 1, '2024-07-24 00:00:00', 3, '2024-11-22 10:59:57'),
(56, 1, 'DXB23397', 0, 'PRINTER,HP,3WT91A,1200x1200dpi', 27221670.47, 0.00, 5, 1, 0.00, 'TR526221124110608', '0000-00-00', 1, '2024-07-24 00:00:00', 3, '2024-11-22 11:05:42'),
(57, 1, 'EBA0096929', 0, 'Bartec PIXAVI Cam Intrinsically Safe Digital Camera, UK', 3080309.12, 0.00, 29, 1, 0.00, 'TR306221124112520', '0000-00-00', 1, '2024-07-31 00:00:00', 3, '2024-11-22 11:23:11'),
(60, 1, '#10620', 0, 'PAYMENT FOR FREIGHT CHARGES', 8554697.99, 0.00, 18, 1, 0.00, '', '0000-00-00', 0, '2024-07-31 00:00:00', 3, '2024-11-22 11:38:39'),
(61, 1, '569545*', 0, 'NETWORK SUPPLY LICENCE', 559678.11, 0.00, 28, 1, 0.00, 'TR114221124114719', '0000-00-00', 1, '2024-08-05 00:00:00', 3, '2024-11-22 11:46:19'),
(62, 1, 'LPO 297', 0, 'CHLORIDE UPS FINAL REPORT AND TIMESHEET BONGA', 20656699.50, 0.00, 30, 1, 0.00, '', '0000-00-00', 1, '2024-09-13 00:00:00', 3, '2024-12-05 11:14:34'),
(63, 1, 'DXB23429', 0, 'CISCO CATALYST 9400 SERIES 48PORT UPOE W/24p MGig 24p RJ-45', 60617722.00, 0.00, 5, 1, 0.00, '', '0000-00-00', 1, '2024-09-13 00:00:00', 3, '2024-12-05 11:19:21'),
(64, 1, 'LPO312', 0, 'CISCO MATERIALS FOR DATACOM', 43171860.35, 0.00, 5, 1, 0.00, '', '0000-00-00', 1, '2024-09-19 00:00:00', 3, '2024-12-05 11:23:41'),
(65, 1, 'LPO 317', 0, 'TELEPHONE', 30820618.54, 0.00, 28, 1, 0.00, '', '0000-00-00', 1, '2024-10-04 00:00:00', 3, '2024-12-05 11:56:44'),
(66, 1, 'LPO 313', 0, 'SUPPLY OF DEMOUNTABLE WINCH', 2275277.26, 0.00, 31, 1, 0.00, '', '0000-00-00', 1, '2024-09-19 00:00:00', 3, '2024-12-05 12:04:44'),
(67, 1, 'LPO309', 0, 'SUPPLY OF CRESTON TOUCH SCTREEN TSW-1070-B-S', 64009275.42, 0.00, 32, 1, 0.00, '', '0000-00-00', 1, '2024-09-20 00:00:00', 3, '2024-12-05 12:11:53'),
(68, 1, 'LPO 320', 0, 'SUPPLY OF IT EQUIPMENTS FOR NUN RIVER', 8597319.42, 0.00, 3, 1, 0.00, '', '0000-00-00', 1, '2024-10-18 00:00:00', 3, '2024-12-05 12:54:02'),
(69, 1, 'LPO 323', 0, 'SUPPLY OF IT EQUIPMENT', 7177372.09, 0.00, 3, 1, 0.00, '', '0000-00-00', 1, '2024-11-08 00:00:00', 3, '2024-12-05 12:56:50'),
(70, 1, 'LPO 319', 0, 'SUPPLY OF IT EQUIPMENTS FOR NUN RIVER', 11034360.00, 0.00, 18, 1, 0.00, '', '0000-00-00', 1, '2024-10-18 00:00:00', 3, '2024-12-05 12:59:07'),
(71, 1, 'LPO 314', 0, 'SUPPLY OF IT EQUIPMENTS', 26623049.92, 0.00, 3, 1, 0.00, '', '0000-00-00', 1, '2024-10-25 00:00:00', 3, '2024-12-05 13:03:27'),
(72, 1, 'LPO 321', 0, 'SNG MATERIALS', 10617506.40, 0.00, 5, 1, 0.00, '', '0000-00-00', 1, '2024-10-28 00:00:00', 3, '2024-12-05 13:05:32'),
(73, 1, 'LPO 322', 0, 'TELEPHONE', 1803849.30, 0.00, 28, 1, 0.00, '', '0000-00-00', 1, '2024-10-30 00:00:00', 3, '2024-12-05 13:08:26'),
(74, 1, 'LPO 318', 0, 'REMOTE RADIATOR', 70292960.00, 0.00, 33, 1, 0.00, '', '0000-00-00', 1, '2024-10-11 00:00:00', 3, '2024-12-05 13:15:28'),
(75, 1, 'LPO 327', 0, 'IRIDIUM TERMINAL', 10411569.00, 0.00, 16, 1, 0.00, '', '0000-00-00', 1, '2024-11-18 00:00:00', 3, '2024-12-05 13:17:52'),
(76, 1, 'LPO 326', 0, 'IRIDIUM TERMINAL', 20657875.00, 0.00, 16, 1, 0.00, '', '0000-00-00', 1, '2024-11-18 00:00:00', 3, '2024-12-05 13:20:00'),
(77, 1, 'LPO325', 0, 'IRIDIUM HANDSET', 2776418.40, 0.00, 16, 1, 0.00, '', '0000-00-00', 1, '2024-11-18 00:00:00', 3, '2024-12-05 13:22:12'),
(78, 1, 'INV241001209', 0, 'SERVICE RENDERED', 85898088.46, 0.00, 30, 1, 0.00, '', '0000-00-00', 1, '2024-11-22 00:00:00', 3, '2024-12-05 13:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `payment_id` int(11) NOT NULL,
  `vendor` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `product_cost` decimal(12,2) NOT NULL,
  `waybill` decimal(12,2) NOT NULL,
  `amount_due` decimal(12,2) NOT NULL,
  `amount_paid` decimal(12,2) NOT NULL,
  `payment_mode` varchar(20) NOT NULL,
  `store` int(11) NOT NULL,
  `trans_date` date DEFAULT NULL,
  `trx_number` varchar(50) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_payments`
--

INSERT INTO `purchase_payments` (`payment_id`, `vendor`, `invoice`, `product_cost`, `waybill`, `amount_due`, `amount_paid`, `payment_mode`, `store`, `trans_date`, `trx_number`, `posted_by`, `post_date`) VALUES
(2, 2, 'LPO 273', 9674940.00, 1292629.25, 10967569.00, 10967569.00, 'Full payment', 1, '2024-01-09', 'TR754081124101225', 3, '2024-11-08 10:12:25'),
(4, 14, 'LPO 270', 53962199.69, 0.00, 53962199.00, 53962199.00, 'Full payment', 1, '2024-02-09', 'TR984081124101718', 3, '2024-11-08 10:17:18'),
(5, 3, 'LPO 276', 3677265.12, 0.00, 3677265.00, 3677265.00, 'Full payment', 1, '2024-01-09', 'TR449081124101854', 3, '2024-11-08 10:18:54'),
(6, 4, 'LPO 277', 154654.10, 0.00, 154654.00, 154654.00, 'Full payment', 1, '2024-01-19', 'TR342081124102013', 3, '2024-11-08 10:20:13'),
(7, 6, 'LPO 281', 2035793.79, 0.00, 2035793.00, 2035793.00, 'Full payment', 1, '2024-02-08', 'TR330081124102111', 3, '2024-11-08 10:21:11'),
(8, 5, 'LPO 282', 1182649.00, 0.00, 1182649.00, 1182649.00, 'Full payment', 1, '2024-02-07', 'TR176081124102206', 3, '2024-11-08 10:22:06'),
(9, 8, 'LPO 279', 21049614.76, 0.00, 21049614.00, 21049614.00, 'Full payment', 1, '2024-02-06', 'TR610081124102330', 3, '2024-11-08 10:23:30'),
(10, 3, 'LPO292', 29879348.25, 0.00, 29879348.00, 29879348.00, 'Full payment', 1, '2024-05-30', 'TR895081124102952', 3, '2024-11-08 10:29:52'),
(11, 3, 'LPO 205/2023', 112035107.80, 0.00, 112035107.00, 112035107.00, 'Full payment', 1, '2024-02-12', 'TR234081124114344', 3, '2024-11-08 11:43:44'),
(12, 3, 'LPO205/2023', 54039962.00, 0.00, 54039962.00, 54039962.00, 'Full payment', 1, '2023-11-15', 'TR150081124114712', 3, '2024-11-08 11:47:12'),
(13, 14, 'LPO 252/270', 83203563.14, 0.00, 83203563.00, 83203563.00, 'Full payment', 1, '2024-02-09', 'TR137081124115317', 3, '2024-11-08 11:53:17'),
(15, 1, 'LPO 246', 27678517.55, 0.00, 27678517.00, 27678517.00, 'Full payment', 1, '2024-01-03', 'TR855081124120924', 3, '2024-11-08 12:09:24'),
(16, 1, 'LPO 246', 45430915.99, 0.00, 45430915.00, 45430915.00, 'Full payment', 1, '2024-01-09', 'TR146081124121309', 3, '2024-11-08 12:13:09'),
(17, 3, 'LPO 272', 22226514.26, 0.00, 22226514.00, 22226514.00, 'Full payment', 1, '2024-01-09', 'TR030081124122018', 3, '2024-11-08 12:20:18'),
(18, 1, 'LPO 272  (2)', 22226514.26, 0.00, 22226514.00, 22226514.00, 'Full payment', 1, '2024-02-29', 'TR962081124122406', 3, '2024-11-08 12:24:06'),
(19, 10, 'LPO 280', 345064.20, 0.00, 345064.00, 345064.00, 'Full payment', 1, '2024-02-07', 'TR252081124014054', 3, '2024-11-08 13:40:54'),
(20, 7, 'LPO 001', 28054000.00, 0.00, 28054000.00, 28054000.00, 'Full payment', 1, '2024-02-06', 'TR444081124043630', 3, '2024-11-08 16:36:30'),
(21, 15, 'LPO 275', 1647502.84, 0.00, 1647502.00, 1647502.00, 'Full payment', 1, '2024-01-10', 'TR905121124023917', 3, '2024-11-12 14:39:17'),
(22, 16, '001/2024', 9097300.00, 0.00, 9097300.00, 9097300.00, 'Full payment', 1, '2024-02-01', 'TR039121124031252', 3, '2024-11-12 15:12:52'),
(23, 17, 'LPO 274', 937874.70, 0.00, 937874.00, 937874.00, 'Full payment', 1, '2024-01-23', 'TR011121124035448', 3, '2024-11-12 15:54:48'),
(24, 9, 'LPO 271', 36389200.00, 0.00, 36389200.00, 36389200.00, 'Full payment', 1, '2023-12-27', 'TR863121124041224', 3, '2024-11-12 16:12:24'),
(25, 9, 'LPO 271/2', 25410578.36, 0.00, 25410578.00, 25410578.00, 'Full payment', 1, '2024-02-06', 'TR859121124041707', 3, '2024-11-12 16:17:07'),
(26, 18, 'LPO 257', 70493158.24, 0.00, 70493158.00, 70493158.00, 'Full payment', 1, '2024-02-07', 'TR440121124043311', 3, '2024-11-12 16:33:11'),
(27, 18, 'LPO 284', 47167772.01, 0.00, 47167772.00, 47167772.00, 'Full payment', 1, '2024-02-07', 'TR155121124043656', 3, '2024-11-12 16:36:56'),
(28, 18, '001/2024', 3566141.60, 0.00, 3566141.00, 3566141.00, 'Full payment', 1, '2024-02-12', 'TR573121124044834', 3, '2024-11-12 16:48:34'),
(29, 19, '001/2024', 1601124.80, 0.00, 1601124.00, 1601124.00, 'Full payment', 1, '2024-02-12', 'TR424121124045936', 3, '2024-11-12 16:59:36'),
(30, 7, '002/2024', 14020700.00, 0.00, 14020700.00, 14020700.00, 'Full payment', 1, '2024-02-19', 'TR309141124094225', 3, '2024-11-14 09:42:25'),
(31, 11, 'DDIS-346', 84714962.20, 0.00, 84714962.00, 84714962.00, 'Full payment', 1, '2024-02-19', 'TR771141124094712', 3, '2024-11-14 09:47:12'),
(32, 11, 'DDIS-366', 103540514.02, 0.00, 103540514.00, 103540514.00, 'Full payment', 1, '2024-02-19', 'TR922141124095056', 3, '2024-11-14 09:50:56'),
(33, 18, '257', 3617340.60, 0.00, 3617340.00, 3617340.00, 'Full payment', 1, '2024-02-28', 'TR790141124095508', 3, '2024-11-14 09:55:08'),
(34, 20, 'LPO 244', 20529644.32, 0.00, 20529644.00, 20529644.00, 'Full payment', 1, '2024-03-01', 'TR397141124100901', 3, '2024-11-14 10:09:01'),
(35, 7, '003/2024', 7560700.00, 0.00, 7560700.00, 7560700.00, 'Full payment', 1, '2024-03-04', 'TR765141124101425', 3, '2024-11-14 10:14:25'),
(36, 7, '004/2024', 7560700.00, 0.00, 7560700.00, 7560700.00, 'Full payment', 1, '2024-03-08', 'TR075141124101733', 3, '2024-11-14 10:17:33'),
(37, 21, '001/2024', 10009474.64, 0.00, 10009474.00, 10009474.00, 'Full payment', 1, '2024-03-14', 'TR828141124103107', 3, '2024-11-14 10:31:07'),
(38, 21, '001/2024', 13487359.94, 0.00, 13487359.00, 13487359.00, 'Full payment', 1, '2024-04-17', 'TR484151124095243', 3, '2024-11-15 09:52:43'),
(39, 22, 'LPO 289', 48670215.00, 0.00, 48670215.00, 48670215.00, 'Full payment', 1, '2024-04-23', 'TR783151124100105', 3, '2024-11-15 10:01:05'),
(40, 23, 'KBD101827', 14766262.43, 0.00, 14766262.00, 14766262.00, 'Full payment', 1, '2024-05-17', 'TR782151124101356', 3, '2024-11-15 10:13:56'),
(41, 25, 'ITC0000006953', 3007588.10, 0.00, 3007588.00, 3007588.00, 'Full payment', 1, '2024-05-23', 'TR332151124104801', 3, '2024-11-15 10:48:01'),
(42, 3, 'LPO 292', 29878721.44, 0.00, 29878721.00, 29878721.00, 'Full payment', 1, '2024-05-30', 'TR299151124110119', 3, '2024-11-15 11:01:19'),
(43, 18, 'LPO 293', 39681547.80, 0.00, 39681547.00, 39681547.00, 'Full payment', 1, '2024-06-14', 'TR707151124110617', 3, '2024-11-15 11:06:17'),
(44, 1, 'LPO 294', 32954898.43, 0.00, 32954898.00, 32954898.00, 'Full payment', 1, '2024-05-21', 'TR427151124111747', 3, '2024-11-15 11:17:47'),
(45, 1, 'LPO 296', 288370674.75, 0.00, 288370674.00, 288370674.00, 'Full payment', 1, '2024-06-21', 'TR117151124112135', 3, '2024-11-15 11:21:35'),
(46, 24, 'LPO 291', 36546436.80, 0.00, 36546436.00, 36546436.00, 'Full payment', 1, '2024-06-24', 'TR920151124114408', 3, '2024-11-15 11:44:08'),
(47, 3, 'LPO 295', 99264048.70, 0.00, 99264048.00, 99264048.00, 'Full payment', 1, '2024-06-24', 'TR161151124115235', 3, '2024-11-15 11:52:35'),
(48, 26, '001/2024', 31362600.00, 0.00, 31362600.00, 31362600.00, 'Full payment', 1, '2024-07-01', 'TR552151124120710', 3, '2024-11-15 12:07:10'),
(49, 27, '90160963', 23471565.98, 0.00, 23471565.00, 23471565.00, 'Full payment', 1, '2024-07-04', 'TR077221124100815', 3, '2024-11-22 10:08:15'),
(50, 16, '17/07', 754270.53, 0.00, 754270.00, 754270.00, 'Full payment', 1, '2024-07-19', 'TR484221124101245', 3, '2024-11-22 10:12:45'),
(51, 26, '003/2024', 10976910.00, 0.00, 10976910.00, 10976910.00, 'Full payment', 1, '2024-07-19', 'TR289221124102052', 3, '2024-11-22 10:20:52'),
(52, 28, '569545A', 19981096.78, 0.00, 19981096.00, 19981096.00, 'Full payment', 1, '2024-07-23', 'TR708221124103504', 3, '2024-11-22 10:35:04'),
(53, 18, 'LPO 305', 2979447.00, 0.00, 2979447.00, 2979447.00, 'Full payment', 1, '2024-07-24', 'TR607221124110037', 3, '2024-11-22 11:00:37'),
(54, 18, 'LPO 305', 2979447.00, 0.00, 2979447.00, 2979447.00, 'Full payment', 1, '2024-07-24', 'TR584221124110113', 3, '2024-11-22 11:01:13'),
(55, 5, 'DXB23397', 27221670.47, 0.00, 27221670.00, 27221670.00, 'Full payment', 1, '2024-07-24', 'TR526221124110608', 3, '2024-11-22 11:06:08'),
(56, 29, 'EBA0096929', 3080309.12, 0.00, 3080309.00, 3080309.00, 'Full payment', 1, '2024-07-31', 'TR639221124112423', 3, '2024-11-22 11:24:23'),
(57, 29, 'EBA0096929', 3080309.12, 0.00, 3080309.00, 3080309.00, 'Full payment', 1, '2024-07-31', 'TR306221124112520', 3, '2024-11-22 11:25:20'),
(58, 28, '569545*', 559678.11, 0.00, 559678.00, 559678.00, 'Full payment', 1, '2024-08-05', 'TR114221124114719', 3, '2024-11-22 11:47:19'),
(59, 30, 'LPO 297', 20656699.50, 0.00, 20656699.00, 20656699.00, 'Full payment', 1, '2024-09-13', 'TR725051224111452', 3, '2024-12-05 11:14:52'),
(60, 5, 'DXB23429', 60617722.00, 0.00, 60617722.00, 60617722.00, 'Full payment', 1, '2024-09-13', 'TR769051224111939', 3, '2024-12-05 11:19:39'),
(61, 5, 'LPO312', 43171860.35, 0.00, 43171860.00, 43171860.00, 'Full payment', 1, '2024-09-19', 'TR016051224112404', 3, '2024-12-05 11:24:04'),
(62, 28, 'LPO 317', 30820618.54, 0.00, 30820618.00, 30820618.00, 'Full payment', 1, '2024-10-04', 'TR727051224115704', 3, '2024-12-05 11:57:04'),
(63, 31, 'LPO 313', 2275277.26, 0.00, 2275277.00, 2275277.00, 'Full payment', 1, '2024-09-19', 'TR222051224120514', 3, '2024-12-05 12:05:14'),
(64, 32, 'LPO309', 64009275.42, 0.00, 64009275.00, 64009275.00, 'Full payment', 1, '2024-09-20', 'TR083051224121214', 3, '2024-12-05 12:12:14'),
(65, 3, 'LPO 320', 8597319.42, 0.00, 8597319.00, 8597319.00, 'Full payment', 1, '2024-10-18', 'TR670051224125420', 3, '2024-12-05 12:54:20'),
(66, 3, 'LPO 323', 7177372.09, 0.00, 7177372.00, 7177372.00, 'Full payment', 1, '2024-11-08', 'TR856051224125706', 3, '2024-12-05 12:57:06'),
(67, 18, 'LPO 319', 11034360.00, 0.00, 11034360.00, 11034360.00, 'Full payment', 1, '2024-10-18', 'TR301051224125928', 3, '2024-12-05 12:59:28'),
(68, 3, 'LPO 314', 26623049.92, 0.00, 26623049.00, 26623049.00, 'Full payment', 1, '2024-10-25', 'TR952051224010343', 3, '2024-12-05 13:03:43'),
(69, 5, 'LPO 321', 10617506.40, 0.00, 10617506.00, 10617506.00, 'Full payment', 1, '2024-10-28', 'TR357051224010547', 3, '2024-12-05 13:05:47'),
(70, 28, 'LPO 322', 1803849.30, 0.00, 1803849.00, 1803849.00, 'Full payment', 1, '2024-10-30', 'TR564051224010842', 3, '2024-12-05 13:08:42'),
(71, 33, 'LPO 318', 70292960.00, 0.00, 70292960.00, 70292960.00, 'Full payment', 1, '2024-10-11', 'TR277051224011549', 3, '2024-12-05 13:15:49'),
(72, 16, 'LPO 327', 10411569.00, 0.00, 10411569.00, 10411569.00, 'Full payment', 1, '2024-11-18', 'TR247051224011815', 3, '2024-12-05 13:18:15'),
(73, 16, 'LPO 326', 20657875.00, 0.00, 20657875.00, 20657875.00, 'Full payment', 1, '2024-11-18', 'TR177051224012016', 3, '2024-12-05 13:20:16'),
(74, 16, 'LPO325', 2776418.40, 0.00, 2776418.00, 2776418.00, 'Full payment', 1, '2024-11-18', 'TR589051224012229', 3, '2024-12-05 13:22:29'),
(75, 30, 'INV241001209', 85898088.46, 0.00, 85898088.00, 85898088.00, 'Full payment', 1, '2024-11-22', 'TR462051224012520', 3, '2024-12-05 13:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `remove_items`
--

CREATE TABLE `remove_items` (
  `remove_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `previous_qty` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `removed_by` int(11) NOT NULL,
  `removed_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `remove_reasons`
--

CREATE TABLE `remove_reasons` (
  `remove_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `remove_reasons`
--

INSERT INTO `remove_reasons` (`remove_id`, `reason`) VALUES
(1, 'Expiration'),
(2, 'Damages'),
(3, 'Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `rights`
--

CREATE TABLE `rights` (
  `right_id` int(11) NOT NULL,
  `menu` int(11) NOT NULL,
  `sub_menu` int(11) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rights`
--

INSERT INTO `rights` (`right_id`, `menu`, `sub_menu`, `user`) VALUES
(165, 1, 1, 18),
(166, 1, 2, 18),
(167, 1, 3, 18),
(168, 1, 4, 18),
(172, 1, 62, 18),
(173, 1, 76, 18),
(175, 1, 79, 18),
(177, 1, 115, 18),
(178, 8, 116, 18),
(179, 8, 117, 18),
(180, 8, 118, 18),
(181, 10, 119, 18),
(182, 10, 120, 18),
(183, 10, 121, 18),
(184, 10, 122, 18),
(185, 10, 123, 18),
(186, 3, 19, 18),
(187, 3, 20, 18),
(188, 3, 33, 18),
(189, 3, 40, 18),
(190, 9, 124, 18),
(191, 9, 125, 18),
(192, 9, 126, 18),
(193, 9, 127, 18),
(194, 9, 128, 18),
(195, 9, 129, 18),
(197, 4, 25, 18),
(198, 4, 80, 18),
(199, 4, 81, 18),
(200, 4, 103, 18),
(202, 4, 106, 18),
(203, 4, 107, 18),
(205, 4, 132, 18),
(206, 4, 133, 18),
(207, 6, 42, 18),
(208, 6, 43, 18),
(209, 6, 44, 18),
(210, 6, 47, 18),
(211, 6, 48, 18),
(212, 6, 66, 18),
(213, 6, 68, 18),
(214, 6, 104, 18),
(215, 6, 108, 18),
(216, 6, 109, 18),
(217, 6, 114, 18),
(218, 6, 134, 18),
(219, 6, 135, 18),
(220, 6, 131, 18),
(221, 6, 138, 18),
(222, 6, 136, 18),
(223, 6, 137, 18),
(224, 6, 139, 18),
(225, 1, 87, 18),
(226, 5, 26, 18),
(227, 5, 27, 18),
(228, 5, 28, 18),
(229, 5, 63, 18),
(230, 5, 85, 18),
(231, 4, 145, 18),
(232, 4, 140, 18),
(233, 6, 148, 18),
(234, 6, 144, 18),
(235, 6, 142, 18),
(236, 6, 141, 18),
(237, 8, 147, 18),
(238, 9, 146, 18),
(239, 1, 1, 2),
(240, 1, 2, 2),
(241, 1, 3, 2),
(242, 1, 4, 2),
(248, 1, 62, 2),
(250, 1, 76, 2),
(251, 1, 79, 2),
(252, 1, 87, 2),
(253, 1, 115, 2),
(254, 3, 19, 2),
(255, 3, 20, 2),
(256, 3, 33, 2),
(257, 3, 40, 2),
(258, 4, 25, 2),
(259, 4, 80, 2),
(260, 4, 81, 2),
(261, 4, 103, 2),
(262, 4, 106, 2),
(263, 4, 107, 2),
(264, 4, 132, 2),
(265, 4, 133, 2),
(266, 4, 140, 2),
(267, 4, 145, 2),
(268, 6, 41, 2),
(269, 6, 42, 2),
(270, 6, 43, 2),
(271, 6, 44, 2),
(272, 6, 45, 2),
(273, 6, 47, 2),
(274, 6, 48, 2),
(275, 6, 66, 2),
(276, 6, 68, 2),
(277, 6, 104, 2),
(278, 6, 108, 2),
(279, 6, 109, 2),
(280, 6, 131, 2),
(281, 6, 134, 2),
(282, 6, 135, 2),
(283, 6, 136, 2),
(284, 6, 137, 2),
(285, 6, 138, 2),
(286, 6, 139, 2),
(287, 6, 141, 2),
(288, 6, 142, 2),
(289, 6, 143, 2),
(290, 6, 144, 2),
(291, 6, 148, 2),
(292, 6, 149, 2),
(293, 6, 150, 2),
(294, 5, 26, 2),
(295, 5, 27, 2),
(296, 5, 28, 2),
(297, 5, 63, 2),
(298, 5, 85, 2),
(299, 8, 116, 2),
(300, 8, 117, 2),
(301, 8, 118, 2),
(302, 8, 147, 2),
(303, 9, 124, 2),
(304, 9, 125, 2),
(305, 9, 126, 2),
(306, 9, 127, 2),
(307, 9, 128, 2),
(308, 9, 129, 2),
(309, 9, 146, 2),
(310, 10, 119, 2),
(311, 10, 120, 2),
(312, 10, 121, 2),
(313, 10, 122, 2),
(314, 10, 123, 2),
(315, 1, 1, 3),
(316, 1, 2, 3),
(317, 1, 3, 3),
(318, 1, 4, 3),
(319, 1, 62, 3),
(320, 1, 76, 3),
(321, 1, 79, 3),
(322, 1, 87, 3),
(323, 1, 115, 3),
(324, 3, 19, 3),
(325, 3, 20, 3),
(326, 3, 33, 3),
(327, 3, 40, 3),
(328, 4, 25, 3),
(329, 4, 80, 3),
(331, 4, 103, 3),
(332, 4, 106, 3),
(333, 4, 107, 3),
(334, 4, 132, 3),
(335, 4, 133, 3),
(336, 4, 140, 3),
(337, 4, 145, 3),
(338, 6, 104, 3),
(339, 6, 42, 3),
(340, 6, 43, 3),
(341, 6, 44, 3),
(342, 6, 45, 3),
(343, 6, 47, 3),
(344, 6, 48, 3),
(345, 6, 66, 3),
(346, 6, 68, 3),
(347, 6, 108, 3),
(348, 6, 109, 3),
(349, 6, 131, 3),
(350, 6, 134, 3),
(351, 6, 135, 3),
(352, 6, 136, 3),
(353, 6, 137, 3),
(354, 6, 138, 3),
(355, 6, 139, 3),
(356, 6, 141, 3),
(357, 6, 142, 3),
(358, 6, 143, 3),
(359, 6, 144, 3),
(360, 6, 148, 3),
(361, 6, 149, 3),
(362, 6, 150, 3),
(363, 5, 26, 3),
(364, 5, 27, 3),
(365, 5, 28, 3),
(366, 5, 63, 3),
(367, 5, 85, 3),
(368, 8, 116, 3),
(369, 8, 117, 3),
(370, 8, 118, 3),
(371, 8, 147, 3),
(372, 9, 124, 3),
(373, 9, 125, 3),
(374, 9, 126, 3),
(375, 9, 127, 3),
(376, 9, 128, 3),
(377, 9, 129, 3),
(378, 9, 146, 3),
(379, 10, 119, 3),
(380, 10, 120, 3),
(381, 10, 121, 3),
(382, 10, 122, 3),
(383, 10, 123, 3),
(384, 10, 151, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `sales_type` varchar(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `sales_status` int(11) NOT NULL,
  `post_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_returns`
--

CREATE TABLE `sales_returns` (
  `return_id` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `store` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `reason` varchar(1024) NOT NULL,
  `returned_by` int(11) NOT NULL,
  `return_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments`
--

CREATE TABLE `stock_adjustments` (
  `adjust_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `adjusted_by` int(11) NOT NULL,
  `previous_qty` int(11) NOT NULL,
  `new_qty` int(11) NOT NULL,
  `adjust_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `company` int(11) NOT NULL,
  `store` varchar(124) NOT NULL,
  `store_address` varchar(255) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `company`, `store`, `store_address`, `phone_number`, `date_created`) VALUES
(1, 1, 'Main Office', '9 Market Road, Rumuomasi, Portharcourt, Rivers State', '', '2024-08-28 19:54:43');

-- --------------------------------------------------------

--
-- Table structure for table `sub_menus`
--

CREATE TABLE `sub_menus` (
  `sub_menu_id` int(11) NOT NULL,
  `menu` int(11) NOT NULL,
  `sub_menu` varchar(255) NOT NULL,
  `url` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_menus`
--

INSERT INTO `sub_menus` (`sub_menu_id`, `menu`, `sub_menu`, `url`, `status`) VALUES
(1, 1, 'Add Users', 'add_user', 0),
(2, 1, 'Disable User', 'disable_user', 0),
(3, 1, 'Activate User', 'activate_user', 0),
(4, 1, 'Reset Password', 'reset_password', 0),
(5, 1, 'Add Category', 'add_department', 1),
(6, 1, 'Add Sub-category', 'add_category', 1),
(7, 1, 'Add Items', 'add_item', 1),
(8, 1, 'Modify Item Name', 'modify_item', 1),
(9, 1, 'Add Bank', 'add_bank', 1),
(10, 1, 'Manage Prices', 'item_price', 1),
(11, 1, 'Add Remove Reasons', 'add_remove_reasons', 1),
(12, 2, 'Direct Sales', 'direct_sales', 1),
(13, 2, 'Sales Order', 'sales_order', 1),
(14, 2, 'Post Sales Order', 'post_sales_order', 1),
(15, 2, 'Sales Return', 'sales_return', 1),
(16, 2, 'Reprint Receipt', 'print_receipt', 1),
(17, 3, 'Set Reorder Level', 'reorder_level', 1),
(18, 3, 'Product Balance', 'stock_balance', 1),
(19, 3, 'Receive Purchases', 'stockin_purchase', 0),
(20, 3, 'Add Supplier', 'add_vendor', 0),
(21, 3, 'Adjust Quantity', 'stock_adjustment', 1),
(22, 3, 'Remove Item', 'remove_item', 1),
(23, 3, 'Adjust Expiration', 'adjust_expiration', 1),
(24, 4, 'Add Expense Head', 'add_exp_head', 1),
(25, 4, 'Post Expense', 'post_expense', 0),
(26, 5, 'Item List', 'item_list', 0),
(27, 5, 'Bank List', 'bank_list', 0),
(28, 5, 'List Of Suppliers', 'vendor_list', 0),
(29, 5, 'Sales Return Report', 'sales_return_report', 1),
(30, 5, 'Stock Adjustment Report', 'stock_adjustment_report', 1),
(31, 5, 'Item Removed Report', 'item_removed_report', 1),
(33, 3, 'Purchase Reports', 'purchase_reports', 0),
(34, 5, 'Out Of Stock', 'out_of_stock', 1),
(35, 5, 'Soon To Expire', 'expire_soon', 1),
(36, 5, 'Expired Items', 'expired_items', 1),
(37, 5, 'Reached Reorder Level', 'reached_reorder', 1),
(38, 5, 'Item History', 'item_history', 1),
(39, 5, 'Purchase By Item', 'purchase_by_item', 1),
(40, 3, 'Purchase Per Vendor', 'purchase_per_vendor', 0),
(41, 6, 'Sales Report', 'revenue_report', 0),
(42, 6, 'Cash Payments', 'cash_list', 0),
(43, 6, 'POS Payments', 'pos_list', 0),
(44, 6, 'Transfer Payments', 'transfer_list', 0),
(45, 6, 'Cashier Report', 'cashier_report', 0),
(46, 6, 'Revenue By Category', 'revenue_by_category', 1),
(47, 6, 'Income Statement', 'profit_and_loss', 0),
(48, 6, 'Expense Report', 'expense_report', 0),
(49, 5, 'Highest Selling Items', 'highest_selling', 1),
(50, 5, 'Fast Selling Items', 'fast_selling', 1),
(51, 1, 'Change Category', 'change_category', 1),
(52, 1, 'Update Item Barcode', 'update_barcode', 1),
(53, 3, 'Transfer Items', 'transfer_item', 1),
(54, 3, 'Pending Transfer', 'pending_transfer', 1),
(55, 3, 'Accept Items', 'accept_items', 1),
(56, 3, 'Returned Transfer', 'returned_transfer', 1),
(57, 5, 'Transferred Items Report', 'transfer_report', 1),
(58, 5, 'Accept Items Report', 'accept_report', 1),
(59, 3, 'All Store Balance', 'all_store_balance', 1),
(60, 2, 'Wholesale', 'wholesale', 1),
(62, 1, 'Add Customer', 'add_customer', 0),
(63, 5, 'Customer List', 'customer_list', 0),
(64, 6, 'Retail Sales', 'retail_sales', 1),
(65, 6, 'Wholesale Report', 'wholesale_report', 1),
(66, 6, 'Customer Statement', 'customer_statement', 0),
(67, 6, 'Credit Sales List', 'credit_sales_list', 1),
(68, 6, 'Debtors Report', 'debtors_list', 0),
(69, 4, 'Pay Debt', 'pay_debt', 1),
(70, 6, 'Debt Payment Report', 'debt_payment_report', 1),
(71, 1, 'Add Menu', 'add_menu', 1),
(72, 1, 'Add Sub-menu', 'add_sub_menu', 1),
(73, 1, 'Edit Sub Menu', 'edit_sub_menu', 1),
(74, 1, 'Manage Profile', 'manage_profile', 1),
(75, 1, 'Add Store', 'add_store', 1),
(76, 1, 'Update Store Details', 'update_store', 0),
(77, 1, 'Add User Rights', 'add_rights', 1),
(78, 1, 'Delete Rights', 'delete_right', 1),
(79, 1, 'Edit Customer Info', 'edit_customer_info', 0),
(80, 4, 'Customer Payments', 'fund_wallet', 0),
(81, 4, 'Reverse Deposit', 'reverse_deposit', 1),
(82, 1, 'Adjust Expiration', 'adjust_expiration', 1),
(83, 3, 'Transfer Qty Btw Items', 'transfer_qty', 1),
(85, 5, 'List Of Users', 'user_list', 0),
(86, 3, 'Reprint Transfer Receipt', 'reprint_transfer', 1),
(87, 1, 'Give Rights', 'give_user_right', 0),
(89, 1, 'Manage Cost Price', 'raw_material_price', 1),
(90, 3, 'Stock Balance', 'raw_material_balance', 1),
(91, 5, 'Raw Materials', 'raw_material_list', 1),
(94, 5, 'Production Report', 'production_report', 1),
(96, 2, 'Make Sales', 'wholesale', 1),
(97, 5, 'Production Statistics', 'production_statistics', 1),
(98, 3, 'Consumables', 'consumables', 1),
(99, 3, 'Issue Items', 'issue_items', 1),
(100, 5, 'Issued Items Report', 'issue_report', 1),
(101, 3, 'Pending Issued Items', 'pending_issued', 1),
(102, 5, 'Issued Item History', 'issued_item_stats', 1),
(103, 4, 'Reverse Transactions', 'reverse_transactions', 0),
(104, 6, 'Customer Payment Reports', 'deposit_report', 0),
(105, 4, 'Post Previous Debt', 'post_debt', 1),
(106, 4, 'Post Purchases', 'post_purchase', 0),
(107, 4, 'Vendor Payments', 'post_vendor_payments', 0),
(108, 6, 'Vendor Payment Report', 'vendor_payments', 0),
(109, 6, 'Vendor Statement', 'vendor_statement', 0),
(110, 4, 'Post Vendor Balance', 'post_vendor_balance', 1),
(111, 5, 'Transfer Qty Bwt Reports', 'transfer_qty_btw_reports', 1),
(113, 5, 'Ice Cream Productions', 'ice_cream_production', 1),
(114, 6, 'Outstanding Debts Posting', 'outstanding_debts', 1),
(115, 1, 'Merge Customer Files', 'merge_files', 0),
(116, 8, 'New Invoice', 'invoicing', 0),
(117, 8, 'View Invoices', 'invoice_reports', 0),
(118, 8, 'Pending Invoice', 'pending_invoice', 0),
(119, 10, 'Account Group', 'account_group', 0),
(120, 10, 'Account Sub-group', 'account_sub_group', 0),
(121, 10, 'Account Class', 'account_class', 0),
(122, 10, 'Account Ledgers', 'account_ledger', 0),
(123, 10, 'View Chart Of Account', 'chart_of_account', 0),
(124, 9, 'Add Asset Location', 'add_asset_location', 0),
(125, 9, 'Add New Asset', 'add_asset', 0),
(126, 9, 'Asset Register', 'asset_register', 0),
(127, 9, 'Allocate Asset', 'allocate_asset', 0),
(128, 9, 'View Disposed Assets', 'disposed_assets', 0),
(129, 9, 'Dispose Asset', 'dispose_asset', 0),
(130, 9, 'Setup Depreciation', 'setup_depreciation', 1),
(131, 6, 'Trial Balance', 'trial_balance', 0),
(132, 4, 'Post Fixed Asset', 'post_fixed_asset', 0),
(133, 4, 'Post Depreciation', 'post_depreciation', 0),
(134, 6, 'Asset Postings', 'asset_posting', 0),
(135, 6, 'Depreciation Report', 'depreciation_report', 0),
(136, 6, 'Monthly Financial Position', 'monthly_financial_position', 0),
(137, 6, 'Yearly Financial Position', 'yearly_financial_position', 0),
(138, 6, 'Cash Flow', 'cash_flow', 0),
(139, 6, 'Account Statement', 'account_statement', 0),
(140, 4, 'Post Other Transactions', 'post_other_trx', 0),
(141, 6, 'Loans Received', 'loans', 0),
(142, 6, 'Loan Transactions', 'loan_postings', 0),
(143, 6, 'Director Transactions', 'director_postings', 0),
(144, 6, 'FInance Costs Trx', 'other_postings', 0),
(145, 4, 'Post Opening Balance', 'post_opening_balance', 0),
(146, 9, 'Delete Asset', 'delete_asset', 0),
(147, 8, 'Invoices Due', 'invoices_due', 0),
(148, 6, 'Inventory Postings', 'inventory_posting', 0),
(149, 6, 'Yearly Income Statement', 'yearly_income_statement', 0),
(150, 6, 'Other Transactions', 'other_transactions', 0),
(151, 10, 'Update Ledger', 'update_ledger', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_type` int(11) NOT NULL,
  `sub_group` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `account` int(50) NOT NULL,
  `debit` decimal(12,2) NOT NULL,
  `credit` decimal(12,2) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `trx_status` int(11) NOT NULL,
  `trans_date` date DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `account_type`, `sub_group`, `class`, `account`, `debit`, `credit`, `trx_number`, `details`, `trx_status`, `trans_date`, `post_date`, `posted_by`) VALUES
(1, 5, 9, 0, 50901645, 0.00, 1000000.00, 'TR805290924074938', 'Opening Balance As At &quot;01-Jan-2024&quot;', 1, '2024-01-01', '2024-09-29 19:49:38', 1),
(584, 1, 1, 4, 1010472, 1628416.70, 0.00, 'TR743101024035420', 'New Customer invoice', 0, '2024-01-15', '2024-10-10 15:54:20', 3),
(585, 3, 5, 11, 30501130, 0.00, 1628416.70, 'TR743101024035420', 'New Customer invoice', 0, '2024-01-15', '2024-10-10 15:54:20', 3),
(586, 1, 1, 4, 1010472, 260546.67, 0.00, 'TR531101024035837', 'New Customer invoice', 0, '2024-01-15', '2024-10-10 15:58:37', 3),
(587, 3, 5, 11, 30501130, 0.00, 260546.67, 'TR531101024035837', 'New Customer invoice', 0, '2024-01-15', '2024-10-10 15:58:37', 3),
(588, 1, 1, 4, 1010472, 17187019.44, 0.00, 'TR422101024040142', 'New Customer invoice', 0, '2024-01-15', '2024-10-10 16:01:42', 3),
(589, 3, 5, 11, 30501130, 0.00, 17187019.44, 'TR422101024040142', 'New Customer invoice', 0, '2024-01-15', '2024-10-10 16:01:42', 3),
(590, 1, 1, 4, 1010472, 2984878.71, 0.00, 'TR245101024040407', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:04:07', 3),
(591, 3, 5, 11, 30501130, 0.00, 2984878.71, 'TR245101024040407', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:04:07', 3),
(592, 1, 1, 4, 1010474, 5458.00, 0.00, 'TR149101024040850', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:08:50', 3),
(593, 3, 5, 11, 30501130, 0.00, 5458.00, 'TR149101024040850', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:08:50', 3),
(594, 1, 1, 4, 1010474, 1091.68, 0.00, 'TR037101024041114', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:11:14', 3),
(595, 3, 5, 11, 30501130, 0.00, 1091.68, 'TR037101024041114', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:11:14', 3),
(596, 1, 1, 4, 1010474, 1240871.72, 0.00, 'TR568101024041346', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:13:46', 3),
(597, 3, 5, 11, 30501130, 0.00, 1240871.72, 'TR568101024041346', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:13:46', 3),
(598, 1, 1, 4, 1010474, 248174.34, 0.00, 'TR754101024041639', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:16:39', 3),
(599, 3, 5, 11, 30501130, 0.00, 248174.34, 'TR754101024041639', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:16:39', 3),
(600, 1, 1, 4, 1010474, 19158913.80, 0.00, 'TR909101024041920', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:19:20', 3),
(601, 3, 5, 11, 30501130, 0.00, 19158913.80, 'TR909101024041920', 'New Customer invoice', 0, '2024-01-19', '2024-10-10 16:19:20', 3),
(602, 1, 1, 4, 1010472, 4060215.96, 0.00, 'TR634101024042721', 'New Customer invoice', 0, '2024-02-02', '2024-10-10 16:27:21', 3),
(603, 3, 5, 11, 30501130, 0.00, 4060215.96, 'TR634101024042721', 'New Customer invoice', 0, '2024-02-02', '2024-10-10 16:27:21', 3),
(604, 1, 1, 4, 1010472, 2984878.71, 0.00, 'TR148101024043015', 'New Customer invoice', 0, '2024-02-02', '2024-10-10 16:30:15', 3),
(605, 3, 5, 11, 30501130, 0.00, 2984878.71, 'TR148101024043015', 'New Customer invoice', 0, '2024-02-02', '2024-10-10 16:30:15', 3),
(606, 1, 1, 4, 1010472, 834040.46, 0.00, 'TR577101024043808', 'New Customer invoice', 0, '2024-02-06', '2024-10-10 16:38:08', 3),
(607, 3, 5, 11, 30501130, 0.00, 834040.46, 'TR577101024043808', 'New Customer invoice', 0, '2024-02-06', '2024-10-10 16:38:08', 3),
(608, 1, 1, 4, 1010474, 8293098.68, 0.00, 'TR136101024044139', 'New Customer invoice', 0, '2024-02-06', '2024-10-10 16:41:39', 3),
(609, 3, 5, 11, 30501130, 0.00, 8293098.68, 'TR136101024044139', 'New Customer invoice', 0, '2024-02-06', '2024-10-10 16:41:39', 3),
(610, 1, 1, 4, 1010474, 60253974.24, 0.00, 'TR557101024044643', 'New Customer invoice', 0, '2024-02-13', '2024-10-10 16:46:43', 3),
(611, 3, 5, 11, 30501130, 0.00, 60253974.24, 'TR557101024044643', 'New Customer invoice', 0, '2024-02-13', '2024-10-10 16:46:43', 3),
(612, 1, 1, 4, 1010474, 13400823.25, 0.00, 'TR992111024085437', 'New Customer invoice', 0, '2024-02-21', '2024-10-11 08:54:37', 3),
(613, 3, 5, 11, 30501130, 0.00, 13400823.25, 'TR992111024085437', 'New Customer invoice', 0, '2024-02-21', '2024-10-11 08:54:37', 3),
(614, 1, 1, 4, 1010474, 74591173.48, 0.00, 'TR946111024085845', 'New Customer invoice', 0, '2024-02-16', '2024-10-11 08:58:45', 3),
(615, 3, 5, 11, 30501130, 0.00, 74591173.48, 'TR946111024085845', 'New Customer invoice', 0, '2024-02-16', '2024-10-11 08:58:45', 3),
(616, 1, 1, 4, 1010474, 445003.53, 0.00, 'TR584111024090103', 'New Customer invoice', 0, '2024-02-16', '2024-10-11 09:01:03', 3),
(617, 3, 5, 11, 30501130, 0.00, 445003.53, 'TR584111024090103', 'New Customer invoice', 0, '2024-02-16', '2024-10-11 09:01:03', 3),
(618, 1, 1, 4, 1010474, 397370.06, 0.00, 'TR874111024090802', 'New Customer invoice', 0, '2024-02-28', '2024-10-11 09:08:02', 3),
(619, 3, 5, 11, 30501130, 0.00, 397370.06, 'TR874111024090802', 'New Customer invoice', 0, '2024-02-28', '2024-10-11 09:08:02', 3),
(620, 1, 1, 4, 1010474, 98250.84, 0.00, 'TR638111024101028', 'New Customer invoice', 0, '2024-10-11', '2024-10-11 10:10:28', 3),
(621, 3, 5, 11, 30501130, 0.00, 98250.84, 'TR638111024101028', 'New Customer invoice', 0, '2024-10-11', '2024-10-11 10:10:28', 3),
(622, 1, 1, 4, 1010474, 1876591.04, 0.00, 'TR384111024101325', 'New Customer invoice', 0, '2024-02-29', '2024-10-11 10:13:25', 3),
(623, 3, 5, 11, 30501130, 0.00, 1876591.04, 'TR384111024101325', 'New Customer invoice', 0, '2024-02-29', '2024-10-11 10:13:25', 3),
(624, 1, 1, 4, 1010472, 11128806.03, 0.00, 'TR205111024102131', 'New Customer invoice', 0, '2024-03-01', '2024-10-11 10:21:31', 3),
(625, 3, 5, 11, 30501130, 0.00, 11128806.03, 'TR205111024102131', 'New Customer invoice', 0, '2024-03-01', '2024-10-11 10:21:31', 3),
(628, 1, 1, 4, 1010474, 730365.62, 0.00, 'TR195111024102739', 'New Customer invoice', 0, '2024-03-05', '2024-10-11 10:27:39', 3),
(629, 3, 5, 11, 30501130, 0.00, 730365.62, 'TR195111024102739', 'New Customer invoice', 0, '2024-03-05', '2024-10-11 10:27:39', 3),
(630, 1, 1, 4, 1010474, 13955177.15, 0.00, 'TR346111024103339', 'New Customer invoice', 0, '2024-03-05', '2024-10-11 10:33:39', 3),
(631, 3, 5, 11, 30501130, 0.00, 13955177.15, 'TR346111024103339', 'New Customer invoice', 0, '2024-03-05', '2024-10-11 10:33:39', 3),
(632, 1, 1, 4, 1010474, 12417542.47, 0.00, 'TR243111024103705', 'New Customer invoice', 0, '2024-03-06', '2024-10-11 10:37:05', 3),
(633, 3, 5, 11, 30501130, 0.00, 12417542.47, 'TR243111024103705', 'New Customer invoice', 0, '2024-03-06', '2024-10-11 10:37:05', 3),
(634, 1, 1, 4, 1010474, 4766265.28, 0.00, 'TR003111024103930', 'New Customer invoice', 0, '2024-03-08', '2024-10-11 10:39:30', 3),
(635, 3, 5, 11, 30501130, 0.00, 4766265.28, 'TR003111024103930', 'New Customer invoice', 0, '2024-03-08', '2024-10-11 10:39:30', 3),
(640, 1, 1, 4, 1010472, 760000.00, 0.00, 'TR077211024123849', 'New Customer invoice', 0, '2024-03-08', '2024-10-21 12:38:49', 3),
(641, 3, 5, 11, 30501130, 0.00, 760000.00, 'TR077211024123849', 'New Customer invoice', 0, '2024-03-08', '2024-10-21 12:38:49', 3),
(642, 1, 1, 4, 1010474, 4388079.07, 0.00, 'TR926211024124143', 'New Customer invoice', 0, '2024-03-08', '2024-10-21 12:41:43', 3),
(643, 3, 5, 11, 30501130, 0.00, 4388079.07, 'TR926211024124143', 'New Customer invoice', 0, '2024-03-08', '2024-10-21 12:41:43', 3),
(644, 1, 1, 4, 1010474, 6112296.70, 0.00, 'TR072211024124616', 'New Customer invoice', 0, '2024-03-08', '2024-10-21 12:46:16', 3),
(645, 3, 5, 11, 30501130, 0.00, 6112296.70, 'TR072211024124616', 'New Customer invoice', 0, '2024-03-08', '2024-10-21 12:46:16', 3),
(646, 1, 1, 4, 1010474, 1386405.56, 0.00, 'TR910211024124953', 'New Customer invoice', 0, '2024-03-08', '2024-10-21 12:49:53', 3),
(647, 3, 5, 11, 30501130, 0.00, 1386405.56, 'TR910211024124953', 'New Customer invoice', 0, '2024-03-08', '2024-10-21 12:49:53', 3),
(648, 1, 1, 4, 1010474, 37685689.17, 0.00, 'TR659211024125935', 'New Customer invoice', 0, '2024-03-18', '2024-10-21 12:59:35', 3),
(649, 3, 5, 11, 30501130, 0.00, 37685689.17, 'TR659211024125935', 'New Customer invoice', 0, '2024-03-18', '2024-10-21 12:59:35', 3),
(650, 1, 1, 4, 1010474, 109865892.63, 0.00, 'TR803211024010239', 'New Customer invoice', 0, '2024-03-19', '2024-10-21 13:02:39', 3),
(651, 3, 5, 11, 30501130, 0.00, 109865892.63, 'TR803211024010239', 'New Customer invoice', 0, '2024-03-19', '2024-10-21 13:02:39', 3),
(652, 1, 1, 4, 1010475, 2687500.00, 0.00, 'TR670211024011004', 'New Customer invoice', 0, '2024-03-21', '2024-10-21 13:10:04', 3),
(653, 3, 5, 11, 30501130, 0.00, 2687500.00, 'TR670211024011004', 'New Customer invoice', 0, '2024-03-21', '2024-10-21 13:10:04', 3),
(654, 1, 1, 4, 1010472, 2693091.10, 0.00, 'TR070211024011648', 'New Customer invoice', 0, '2024-03-21', '2024-10-21 13:16:48', 3),
(655, 3, 5, 11, 30501130, 0.00, 2693091.10, 'TR070211024011648', 'New Customer invoice', 0, '2024-03-21', '2024-10-21 13:16:48', 3),
(656, 1, 1, 4, 1010472, 2693091.10, 0.00, 'TR068231024095144', 'New Customer invoice', 0, '2024-03-21', '2024-10-23 09:51:44', 3),
(657, 3, 5, 11, 30501130, 0.00, 2693091.10, 'TR068231024095144', 'New Customer invoice', 0, '2024-03-21', '2024-10-23 09:51:44', 3),
(658, 1, 1, 4, 1010473, 1091084.62, 0.00, 'TR081231024095639', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 09:56:39', 3),
(659, 3, 5, 11, 30501130, 0.00, 1091084.62, 'TR081231024095639', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 09:56:39', 3),
(660, 1, 1, 4, 1010473, 221433.48, 0.00, 'TR930231024101323', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:13:23', 3),
(661, 3, 5, 11, 30501130, 0.00, 221433.48, 'TR930231024101323', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:13:23', 3),
(662, 1, 1, 4, 1010473, 1091084.62, 0.00, 'TR596231024101728', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:17:28', 3),
(663, 3, 5, 11, 30501130, 0.00, 1091084.62, 'TR596231024101728', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:17:28', 3),
(664, 1, 1, 4, 1010473, 221433.48, 0.00, 'TR162231024102104', 'New Customer invoice', 0, '2024-10-23', '2024-10-23 10:21:04', 3),
(665, 3, 5, 11, 30501130, 0.00, 221433.48, 'TR162231024102104', 'New Customer invoice', 0, '2024-10-23', '2024-10-23 10:21:04', 3),
(666, 1, 1, 4, 1010473, 3152010.47, 0.00, 'TR038231024102539', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:25:39', 3),
(667, 3, 5, 11, 30501130, 0.00, 3152010.47, 'TR038231024102539', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:25:39', 3),
(668, 1, 1, 4, 1010473, 639674.23, 0.00, 'TR912231024103620', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:36:20', 3),
(669, 3, 5, 11, 30501130, 0.00, 639674.23, 'TR912231024103620', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:36:20', 3),
(670, 1, 1, 4, 1010473, 12902546.25, 0.00, 'TR600231024103837', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:38:37', 3),
(671, 3, 5, 11, 30501130, 0.00, 12902546.25, 'TR600231024103837', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:38:37', 3),
(672, 1, 1, 4, 1010473, 2618551.10, 0.00, 'TR616231024104021', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:40:21', 3),
(673, 3, 5, 11, 30501130, 0.00, 2618551.10, 'TR616231024104021', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:40:21', 3),
(674, 1, 1, 4, 1010473, 13889550.27, 0.00, 'TR454231024104218', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:42:18', 3),
(675, 3, 5, 11, 30501130, 0.00, 13889550.27, 'TR454231024104218', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 10:42:18', 3),
(676, 1, 1, 4, 1010473, 2818764.36, 0.00, 'TR734231024110006', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 11:00:06', 3),
(677, 3, 5, 11, 30501130, 0.00, 2818764.36, 'TR734231024110006', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 11:00:06', 3),
(678, 1, 1, 4, 1010473, 75063567.13, 0.00, 'TR539231024110406', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 11:04:06', 3),
(679, 3, 5, 11, 30501130, 0.00, 75063567.13, 'TR539231024110406', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 11:04:06', 3),
(680, 1, 1, 4, 1010473, 15234143.94, 0.00, 'TR556231024111356', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 11:13:56', 3),
(681, 3, 5, 11, 30501130, 0.00, 15234143.94, 'TR556231024111356', 'New Customer invoice', 0, '2024-03-26', '2024-10-23 11:13:56', 3),
(682, 1, 1, 4, 1010472, 719413.90, 0.00, 'TR773251024090039', 'New Customer invoice', 0, '2024-03-27', '2024-10-25 09:00:39', 3),
(683, 3, 5, 11, 30501130, 0.00, 719413.90, 'TR773251024090039', 'New Customer invoice', 0, '2024-03-27', '2024-10-25 09:00:39', 3),
(684, 1, 1, 4, 1010474, 18032798.75, 0.00, 'TR763251024090630', 'New Customer invoice', 0, '2024-03-28', '2024-10-25 09:06:30', 3),
(685, 3, 5, 11, 30501130, 0.00, 18032798.75, 'TR763251024090630', 'New Customer invoice', 0, '2024-03-28', '2024-10-25 09:06:30', 3),
(686, 1, 1, 4, 1010472, 719413.90, 0.00, 'TR008251024090850', 'New Customer invoice', 0, '2024-03-28', '2024-10-25 09:08:50', 3),
(687, 3, 5, 11, 30501130, 0.00, 719413.90, 'TR008251024090850', 'New Customer invoice', 0, '2024-03-28', '2024-10-25 09:08:50', 3),
(688, 1, 1, 4, 1010474, 15947557.69, 0.00, 'TR506251024091157', 'New Customer invoice', 0, '2024-03-28', '2024-10-25 09:11:57', 3),
(689, 3, 5, 11, 30501130, 0.00, 15947557.69, 'TR506251024091157', 'New Customer invoice', 0, '2024-03-28', '2024-10-25 09:11:57', 3),
(690, 1, 1, 4, 1010472, 480449.81, 0.00, 'TR876251024092036', 'New Customer invoice', 0, '2024-04-04', '2024-10-25 09:20:36', 3),
(691, 3, 5, 11, 30501130, 0.00, 480449.81, 'TR876251024092036', 'New Customer invoice', 0, '2024-04-04', '2024-10-25 09:20:36', 3),
(692, 1, 1, 4, 1010472, 111561.45, 0.00, 'TR880251024092409', 'New Customer invoice', 0, '2024-04-04', '2024-10-25 09:24:09', 3),
(693, 3, 5, 11, 30501130, 0.00, 111561.45, 'TR880251024092409', 'New Customer invoice', 0, '2024-04-04', '2024-10-25 09:24:09', 3),
(694, 1, 1, 4, 1010472, 15278818.70, 0.00, 'TR288251024095047', 'New Customer invoice', 0, '2024-04-15', '2024-10-25 09:50:47', 3),
(695, 3, 5, 11, 30501130, 0.00, 15278818.70, 'TR288251024095047', 'New Customer invoice', 0, '2024-04-15', '2024-10-25 09:50:47', 3),
(696, 1, 1, 1, 1010150, 0.00, 0.00, 'TR787041124085857', 'Payment For Invoices', 0, '2024-05-04', '2024-11-04 08:58:57', 3),
(697, 1, 1, 4, 1010472, 0.00, 0.00, 'TR787041124085857', 'Payment For Invoices', 0, '2024-05-04', '2024-11-04 08:58:57', 3),
(698, 1, 1, 4, 1010474, 3035145.91, 0.00, 'TR474041124101211', 'New Customer invoice', 0, '2024-04-15', '2024-11-04 10:12:11', 3),
(699, 3, 5, 11, 30501130, 0.00, 3035145.91, 'TR474041124101211', 'New Customer invoice', 0, '2024-04-15', '2024-11-04 10:12:11', 3),
(700, 1, 1, 4, 1010472, 7171.81, 0.00, 'TR464041124101703', 'New Customer invoice', 0, '2024-04-19', '2024-11-04 10:17:03', 3),
(701, 3, 5, 11, 30501130, 0.00, 7171.81, 'TR464041124101703', 'New Customer invoice', 0, '2024-04-19', '2024-11-04 10:17:03', 3),
(702, 1, 1, 4, 1010472, 1471.14, 0.00, 'TR310041124101917', 'New Customer invoice', 0, '2024-04-19', '2024-11-04 10:19:17', 3),
(703, 3, 5, 11, 30501130, 0.00, 1471.14, 'TR310041124101917', 'New Customer invoice', 0, '2024-04-19', '2024-11-04 10:19:17', 3),
(704, 1, 1, 4, 1010472, 684496.92, 0.00, 'TR976041124102532', 'New Customer invoice', 0, '2024-04-30', '2024-11-04 10:25:32', 3),
(705, 3, 5, 11, 30501130, 0.00, 684496.92, 'TR976041124102532', 'New Customer invoice', 0, '2024-04-30', '2024-11-04 10:25:32', 3),
(706, 1, 1, 4, 1010472, 719413.90, 0.00, 'TR779041124102902', 'New Customer invoice', 0, '2024-04-30', '2024-11-04 10:29:02', 3),
(707, 3, 5, 11, 30501130, 0.00, 719413.90, 'TR779041124102902', 'New Customer invoice', 0, '2024-04-30', '2024-11-04 10:29:02', 3),
(708, 1, 1, 4, 1010472, 3864194.40, 0.00, 'TR473041124103555', 'New Customer invoice', 0, '2024-04-30', '2024-11-04 10:35:55', 3),
(709, 3, 5, 11, 30501130, 0.00, 3864194.40, 'TR473041124103555', 'New Customer invoice', 0, '2024-04-30', '2024-11-04 10:35:55', 3),
(710, 1, 1, 4, 1010472, 760000.00, 0.00, 'TR824041124103831', 'New Customer invoice', 0, '2024-04-30', '2024-11-04 10:38:31', 3),
(711, 3, 5, 11, 30501130, 0.00, 760000.00, 'TR824041124103831', 'New Customer invoice', 0, '2024-04-30', '2024-11-04 10:38:31', 3),
(712, 1, 1, 4, 1010472, 16282720.80, 0.00, 'TR143041124104528', 'New Customer invoice', 0, '2024-05-16', '2024-11-04 10:45:28', 3),
(713, 3, 5, 11, 30501130, 0.00, 16282720.80, 'TR143041124104528', 'New Customer invoice', 0, '2024-05-16', '2024-11-04 10:45:28', 3),
(714, 1, 1, 4, 1010474, 971075.00, 0.00, 'TR486041124105021', 'New Customer invoice', 0, '2024-05-23', '2024-11-04 10:50:21', 3),
(715, 3, 5, 11, 30501130, 0.00, 971075.00, 'TR486041124105021', 'New Customer invoice', 0, '2024-05-23', '2024-11-04 10:50:21', 3),
(716, 1, 1, 4, 1010472, 719413.90, 0.00, 'TR267041124105357', 'New Customer invoice', 0, '2024-05-23', '2024-11-04 10:53:57', 3),
(717, 3, 5, 11, 30501130, 0.00, 719413.90, 'TR267041124105357', 'New Customer invoice', 0, '2024-05-23', '2024-11-04 10:53:57', 3),
(718, 1, 1, 4, 1010472, 719413.90, 0.00, 'TR872041124105853', 'New Customer invoice', 0, '2024-06-24', '2024-11-04 10:58:53', 3),
(719, 3, 5, 11, 30501130, 0.00, 719413.90, 'TR872041124105853', 'New Customer invoice', 0, '2024-06-24', '2024-11-04 10:58:53', 3),
(720, 1, 1, 4, 1010472, 95334455.79, 0.00, 'TR140041124110155', 'New Customer invoice', 0, '2024-06-18', '2024-11-04 11:01:55', 3),
(721, 3, 5, 11, 30501130, 0.00, 95334455.79, 'TR140041124110155', 'New Customer invoice', 0, '2024-06-18', '2024-11-04 11:01:55', 3),
(722, 1, 1, 4, 1010472, 12393481.94, 0.00, 'TR727041124110526', 'New Customer invoice', 0, '2024-06-18', '2024-11-04 11:05:26', 3),
(723, 3, 5, 11, 30501130, 0.00, 12393481.94, 'TR727041124110526', 'New Customer invoice', 0, '2024-06-18', '2024-11-04 11:05:26', 3),
(724, 1, 1, 4, 1010472, 100749000.00, 0.00, 'TR251041124110846', 'New Customer invoice', 0, '2024-06-24', '2024-11-04 11:08:46', 3),
(725, 3, 5, 11, 30501130, 0.00, 100749000.00, 'TR251041124110846', 'New Customer invoice', 0, '2024-06-24', '2024-11-04 11:08:46', 3),
(726, 1, 1, 4, 1010474, 4533310.79, 0.00, 'TR236041124111201', 'New Customer invoice', 0, '2024-06-27', '2024-11-04 11:12:01', 3),
(727, 3, 5, 11, 30501130, 0.00, 4533310.79, 'TR236041124111201', 'New Customer invoice', 0, '2024-06-27', '2024-11-04 11:12:01', 3),
(728, 1, 1, 4, 1010474, 362597.98, 0.00, 'TR555041124111544', 'New Customer invoice', 0, '2024-06-27', '2024-11-04 11:15:44', 3),
(729, 3, 5, 11, 30501130, 0.00, 362597.98, 'TR555041124111544', 'New Customer invoice', 0, '2024-06-27', '2024-11-04 11:15:44', 3),
(730, 1, 1, 4, 1010472, 9885491.52, 0.00, 'TR271041124112026', 'New Customer invoice', 0, '2024-07-01', '2024-11-04 11:20:26', 3),
(731, 3, 5, 11, 30501130, 0.00, 9885491.52, 'TR271041124112026', 'New Customer invoice', 0, '2024-07-01', '2024-11-04 11:20:26', 3),
(732, 1, 1, 4, 1010472, 1520000.00, 0.00, 'TR956041124112310', 'New Customer invoice', 0, '2024-07-01', '2024-11-04 11:23:10', 3),
(733, 3, 5, 11, 30501130, 0.00, 1520000.00, 'TR956041124112310', 'New Customer invoice', 0, '2024-07-01', '2024-11-04 11:23:10', 3),
(736, 1, 1, 4, 1010473, 760000.00, 0.00, 'TR772041124113513', 'New Customer invoice', 0, '2024-07-01', '2024-11-04 11:35:13', 3),
(737, 3, 5, 11, 30501130, 0.00, 760000.00, 'TR772041124113513', 'New Customer invoice', 0, '2024-07-01', '2024-11-04 11:35:13', 3),
(738, 1, 1, 4, 1010473, 4942745.76, 0.00, 'TR432041124113932', 'New Customer invoice', 0, '2024-07-01', '2024-11-04 11:39:32', 3),
(739, 3, 5, 11, 30501130, 0.00, 4942745.76, 'TR432041124113932', 'New Customer invoice', 0, '2024-07-01', '2024-11-04 11:39:32', 3),
(740, 1, 1, 4, 1010474, 13816260.27, 0.00, 'TR651041124114245', 'New Customer invoice', 0, '2024-07-01', '2024-11-04 11:42:45', 3),
(741, 3, 5, 11, 30501130, 0.00, 13816260.27, 'TR651041124114245', 'New Customer invoice', 0, '2024-07-01', '2024-11-04 11:42:45', 3),
(742, 1, 1, 4, 1010474, 6354407.75, 0.00, 'TR239041124114555', 'New Customer invoice', 0, '2024-07-02', '2024-11-04 11:45:55', 3),
(743, 3, 5, 11, 30501130, 0.00, 6354407.75, 'TR239041124114555', 'New Customer invoice', 0, '2024-07-02', '2024-11-04 11:45:55', 3),
(744, 1, 1, 4, 1010472, 278841708.98, 0.00, 'TR533041124115242', 'New Customer invoice', 0, '2024-07-16', '2024-11-04 11:52:42', 3),
(745, 3, 5, 11, 30501130, 0.00, 278841708.98, 'TR533041124115242', 'New Customer invoice', 0, '2024-07-16', '2024-11-04 11:52:42', 3),
(746, 1, 1, 4, 1010472, 36249426.24, 0.00, 'TR669041124115759', 'New Customer invoice', 0, '2024-07-16', '2024-11-04 11:57:59', 3),
(747, 3, 5, 11, 30501130, 0.00, 36249426.24, 'TR669041124115759', 'New Customer invoice', 0, '2024-07-16', '2024-11-04 11:57:59', 3),
(748, 1, 1, 4, 1010472, 64650079.58, 0.00, 'TR418041124120134', 'New Customer invoice', 0, '2024-07-26', '2024-11-04 12:01:34', 3),
(749, 3, 5, 11, 30501130, 0.00, 64650079.58, 'TR418041124120134', 'New Customer invoice', 0, '2024-07-26', '2024-11-04 12:01:34', 3),
(750, 1, 1, 4, 1010472, 12930015.92, 0.00, 'TR816041124120429', 'New Customer invoice', 0, '2024-07-26', '2024-11-04 12:04:29', 3),
(751, 3, 5, 11, 30501130, 0.00, 12930015.92, 'TR816041124120429', 'New Customer invoice', 0, '2024-07-26', '2024-11-04 12:04:29', 3),
(752, 1, 1, 4, 1010472, 719413.90, 0.00, 'TR899041124120751', 'New Customer invoice', 0, '2024-07-30', '2024-11-04 12:07:51', 3),
(753, 3, 5, 11, 30501130, 0.00, 719413.90, 'TR899041124120751', 'New Customer invoice', 0, '2024-07-30', '2024-11-04 12:07:51', 3),
(754, 1, 1, 4, 1010472, 5022141.36, 0.00, 'TR108041124121704', 'New Customer invoice', 0, '2024-08-07', '2024-11-04 12:17:04', 3),
(755, 3, 5, 11, 30501130, 0.00, 5022141.36, 'TR108041124121704', 'New Customer invoice', 0, '2024-08-07', '2024-11-04 12:17:04', 3),
(756, 1, 1, 4, 1010472, 760000.00, 0.00, 'TR208041124122155', 'New Customer invoice', 0, '2024-08-07', '2024-11-04 12:21:55', 3),
(757, 3, 5, 11, 30501130, 0.00, 760000.00, 'TR208041124122155', 'New Customer invoice', 0, '2024-08-07', '2024-11-04 12:21:55', 3),
(758, 1, 1, 4, 1010472, 22235920.00, 0.00, 'TR497041124122449', 'New Customer invoice', 0, '2024-08-13', '2024-11-04 12:24:49', 3),
(759, 3, 5, 11, 30501130, 0.00, 22235920.00, 'TR497041124122449', 'New Customer invoice', 0, '2024-08-13', '2024-11-04 12:24:49', 3),
(760, 1, 1, 4, 1010472, 19583492.40, 0.00, 'TR681041124122820', 'New Customer invoice', 0, '2024-08-15', '2024-11-04 12:28:20', 3),
(761, 3, 5, 11, 30501130, 0.00, 19583492.40, 'TR681041124122820', 'New Customer invoice', 0, '2024-08-15', '2024-11-04 12:28:20', 3),
(762, 1, 1, 4, 1010472, 1500000.00, 0.00, 'TR519041124123113', 'New Customer invoice', 0, '2024-08-15', '2024-11-04 12:31:13', 3),
(763, 3, 5, 11, 30501130, 0.00, 1500000.00, 'TR519041124123113', 'New Customer invoice', 0, '2024-08-15', '2024-11-04 12:31:13', 3),
(764, 1, 1, 4, 1010474, 86666227.02, 0.00, 'TR685041124123440', 'New Customer invoice', 0, '2024-08-16', '2024-11-04 12:34:40', 3),
(765, 3, 5, 11, 30501130, 0.00, 86666227.02, 'TR685041124123440', 'New Customer invoice', 0, '2024-08-16', '2024-11-04 12:34:40', 3),
(766, 1, 1, 4, 1010474, 5032533.44, 0.00, 'TR561041124123644', 'New Customer invoice', 0, '2024-08-16', '2024-11-04 12:36:44', 3),
(767, 3, 5, 11, 30501130, 0.00, 5032533.44, 'TR561041124123644', 'New Customer invoice', 0, '2024-08-16', '2024-11-04 12:36:44', 3),
(768, 1, 1, 4, 1010472, 19819431.39, 0.00, 'TR118041124124618', 'New Customer invoice', 0, '2024-08-16', '2024-11-04 12:46:18', 3),
(769, 3, 5, 11, 30501130, 0.00, 19819431.39, 'TR118041124124618', 'New Customer invoice', 0, '2024-08-16', '2024-11-04 12:46:18', 3),
(770, 1, 1, 4, 1010474, 762374.40, 0.00, 'TR231041124124842', 'New Customer invoice', 0, '2024-08-16', '2024-11-04 12:48:42', 3),
(771, 3, 5, 11, 30501130, 0.00, 762374.40, 'TR231041124124842', 'New Customer invoice', 0, '2024-08-16', '2024-11-04 12:48:42', 3),
(772, 1, 1, 4, 1010474, 60989.95, 0.00, 'TR790041124125141', 'New Customer invoice', 0, '2024-08-16', '2024-11-04 12:51:41', 3),
(773, 3, 5, 11, 30501130, 0.00, 60989.95, 'TR790041124125141', 'New Customer invoice', 0, '2024-08-16', '2024-11-04 12:51:41', 3),
(774, 1, 1, 4, 1010473, 2854012.10, 0.00, 'TR501041124125607', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 12:56:07', 3),
(775, 3, 5, 11, 30501130, 0.00, 2854012.10, 'TR501041124125607', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 12:56:07', 3),
(776, 1, 1, 4, 1010473, 551447.04, 0.00, 'TR760041124125913', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 12:59:13', 3),
(777, 3, 5, 11, 30501130, 0.00, 551447.04, 'TR760041124125913', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 12:59:13', 3),
(778, 1, 1, 4, 1010473, 2334771.60, 0.00, 'TR096041124010312', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 13:03:12', 3),
(779, 3, 5, 11, 30501130, 0.00, 2334771.60, 'TR096041124010312', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 13:03:12', 3),
(780, 1, 1, 4, 1010473, 451123.40, 0.00, 'TR071041124010940', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 13:09:40', 3),
(781, 3, 5, 11, 30501130, 0.00, 451123.40, 'TR071041124010940', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 13:09:40', 3),
(782, 1, 1, 4, 1010473, 4043633.82, 0.00, 'TR316041124020720', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:07:20', 3),
(783, 3, 5, 11, 30501130, 0.00, 4043633.82, 'TR316041124020720', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:07:20', 3),
(784, 1, 1, 4, 1010473, 781316.88, 0.00, 'TR372041124021025', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:10:25', 3),
(785, 3, 5, 11, 30501130, 0.00, 781316.88, 'TR372041124021025', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:10:25', 3),
(786, 1, 1, 4, 1010473, 1202169.13, 0.00, 'TR920041124021330', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:13:30', 3),
(787, 3, 5, 11, 30501130, 0.00, 1202169.13, 'TR920041124021330', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:13:30', 3),
(788, 1, 1, 4, 1010473, 232281.28, 0.00, 'TR846041124021605', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:16:05', 3),
(789, 3, 5, 11, 30501130, 0.00, 232281.28, 'TR846041124021605', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:16:05', 3),
(790, 1, 1, 4, 1010473, 1138193.21, 0.00, 'TR455041124022122', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:21:22', 3),
(791, 3, 5, 11, 30501130, 0.00, 1138193.21, 'TR455041124022122', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:21:22', 3),
(792, 1, 1, 4, 1010473, 219919.05, 0.00, 'TR513041124022533', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:25:33', 3),
(793, 3, 5, 11, 30501130, 0.00, 219919.05, 'TR513041124022533', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:25:33', 3),
(794, 1, 1, 4, 1010473, 9840824.05, 0.00, 'TR744041124022817', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:28:17', 3),
(795, 3, 5, 11, 30501130, 0.00, 9840824.05, 'TR744041124022817', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:28:17', 3),
(796, 1, 1, 4, 1010473, 1901447.88, 0.00, 'TR352041124023030', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:30:30', 3),
(797, 3, 5, 11, 30501130, 0.00, 1901447.88, 'TR352041124023030', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:30:30', 3),
(798, 1, 1, 4, 1010473, 3922416.29, 0.00, 'TR392041124023308', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:33:08', 3),
(799, 3, 5, 11, 30501130, 0.00, 3922416.29, 'TR392041124023308', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:33:08', 3),
(800, 1, 1, 4, 1010473, 757887.28, 0.00, 'TR909041124023519', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:35:19', 3),
(801, 3, 5, 11, 30501130, 0.00, 757887.28, 'TR909041124023519', 'New Customer invoice', 0, '2024-08-20', '2024-11-04 14:35:19', 3),
(802, 1, 1, 4, 1010473, 5897696.59, 0.00, 'TR218051124082709', 'New Customer invoice', 0, '2024-08-23', '2024-11-05 08:27:09', 3),
(803, 3, 5, 11, 30501130, 0.00, 5897696.59, 'TR218051124082709', 'New Customer invoice', 0, '2024-08-23', '2024-11-05 08:27:09', 3),
(804, 1, 1, 4, 1010474, 36929257.11, 0.00, 'TR645051124095553', 'New Customer invoice', 0, '2024-08-23', '2024-11-05 09:55:53', 3),
(805, 3, 5, 11, 30501130, 0.00, 36929257.11, 'TR645051124095553', 'New Customer invoice', 0, '2024-08-23', '2024-11-05 09:55:53', 3),
(806, 1, 1, 4, 1010472, 105565242.82, 0.00, 'TR684051124095941', 'New Customer invoice', 0, '2024-09-03', '2024-11-05 09:59:41', 3),
(807, 3, 5, 11, 30501130, 0.00, 105565242.82, 'TR684051124095941', 'New Customer invoice', 0, '2024-09-03', '2024-11-05 09:59:41', 3),
(808, 1, 1, 4, 1010472, 14752760.90, 0.00, 'TR934051124100320', 'New Customer invoice', 0, '2024-09-03', '2024-11-05 10:03:20', 3),
(809, 3, 5, 11, 30501130, 0.00, 14752760.90, 'TR934051124100320', 'New Customer invoice', 0, '2024-09-03', '2024-11-05 10:03:20', 3),
(810, 1, 1, 4, 1010474, 28185615.59, 0.00, 'TR897051124100718', 'New Customer invoice', 0, '2024-09-04', '2024-11-05 10:07:17', 3),
(811, 3, 5, 11, 30501130, 0.00, 28185615.59, 'TR897051124100718', 'New Customer invoice', 0, '2024-09-04', '2024-11-05 10:07:17', 3),
(812, 1, 1, 4, 1010474, 33531513.62, 0.00, 'TR983051124101055', 'New Customer invoice', 0, '2024-09-04', '2024-11-05 10:10:55', 3),
(813, 3, 5, 11, 30501130, 0.00, 33531513.62, 'TR983051124101055', 'New Customer invoice', 0, '2024-09-04', '2024-11-05 10:10:55', 3),
(814, 1, 1, 4, 1010474, 51125604.29, 0.00, 'TR520051124101500', 'New Customer invoice', 0, '2024-09-05', '2024-11-05 10:15:00', 3),
(815, 3, 5, 11, 30501130, 0.00, 51125604.29, 'TR520051124101500', 'New Customer invoice', 0, '2024-09-05', '2024-11-05 10:15:00', 3),
(816, 1, 1, 4, 1010474, 7144115.44, 0.00, 'TR696051124101901', 'New Customer invoice', 0, '2024-09-05', '2024-11-05 10:19:01', 3),
(817, 3, 5, 11, 30501130, 0.00, 7144115.44, 'TR696051124101901', 'New Customer invoice', 0, '2024-09-05', '2024-11-05 10:19:01', 3),
(818, 1, 1, 4, 1010472, 5506624.38, 0.00, 'TR573051124102426', 'New Customer invoice', 0, '2024-09-13', '2024-11-05 10:24:26', 3),
(819, 3, 5, 11, 30501130, 0.00, 5506624.38, 'TR573051124102426', 'New Customer invoice', 0, '2024-09-13', '2024-11-05 10:24:26', 3),
(820, 1, 1, 4, 1010472, 817.00, 0.00, 'TR350051124102939', 'New Customer invoice', 0, '2024-09-13', '2024-11-05 10:29:38', 3),
(821, 3, 5, 11, 30501130, 0.00, 817.00, 'TR350051124102939', 'New Customer invoice', 0, '2024-09-13', '2024-11-05 10:29:38', 3),
(822, 1, 1, 4, 1010474, 1557963.69, 0.00, 'TR189051124103356', 'New Customer invoice', 0, '2024-09-17', '2024-11-05 10:33:56', 3),
(823, 3, 5, 11, 30501130, 0.00, 1557963.69, 'TR189051124103356', 'New Customer invoice', 0, '2024-09-17', '2024-11-05 10:33:56', 3),
(824, 1, 1, 4, 1010474, 171.00, 0.00, 'TR657051124103704', 'New Customer invoice', 0, '2024-09-23', '2024-11-05 10:37:04', 3),
(825, 3, 5, 11, 30501130, 0.00, 171.00, 'TR657051124103704', 'New Customer invoice', 0, '2024-09-23', '2024-11-05 10:37:04', 3),
(826, 1, 1, 4, 1010473, 1471385.50, 0.00, 'TR774051124104651', 'New Customer invoice', 0, '2024-09-19', '2024-11-05 10:46:51', 3),
(827, 3, 5, 11, 30501130, 0.00, 1471385.50, 'TR774051124104651', 'New Customer invoice', 0, '2024-09-19', '2024-11-05 10:46:51', 3),
(828, 1, 1, 4, 1010473, 803047.32, 0.00, 'TR372051124104913', 'New Customer invoice', 0, '2024-09-19', '2024-11-05 10:49:13', 3),
(829, 3, 5, 11, 30501130, 0.00, 803047.32, 'TR372051124104913', 'New Customer invoice', 0, '2024-09-19', '2024-11-05 10:49:13', 3),
(830, 1, 1, 4, 1010473, 7230816.66, 0.00, 'TR073051124105304', 'New Customer invoice', 0, '2024-09-19', '2024-11-05 10:53:04', 3),
(831, 3, 5, 11, 30501130, 0.00, 7230816.66, 'TR073051124105304', 'New Customer invoice', 0, '2024-09-19', '2024-11-05 10:53:04', 3),
(832, 1, 1, 4, 1010473, 3946431.59, 0.00, 'TR283051124105557', 'New Customer invoice', 0, '2024-09-19', '2024-11-05 10:55:57', 3),
(833, 3, 5, 11, 30501130, 0.00, 3946431.59, 'TR283051124105557', 'New Customer invoice', 0, '2024-09-19', '2024-11-05 10:55:57', 3),
(834, 1, 1, 4, 1010472, 46830944.32, 0.00, 'TR348051124110222', 'New Customer invoice', 0, '2024-09-20', '2024-11-05 11:02:22', 3),
(835, 3, 5, 11, 30501130, 0.00, 46830944.32, 'TR348051124110222', 'New Customer invoice', 0, '2024-09-20', '2024-11-05 11:02:22', 3),
(836, 1, 1, 4, 1010472, 24447679.83, 0.00, 'TR890051124110703', 'New Customer invoice', 0, '2024-09-20', '2024-11-05 11:07:03', 3),
(837, 3, 5, 11, 30501130, 0.00, 24447679.83, 'TR890051124110703', 'New Customer invoice', 0, '2024-09-20', '2024-11-05 11:07:03', 3),
(838, 1, 1, 4, 1010473, 14625869.97, 0.00, 'TR440051124111236', 'New Customer invoice', 0, '2024-09-26', '2024-11-05 11:12:36', 3),
(839, 3, 5, 11, 30501130, 0.00, 14625869.97, 'TR440051124111236', 'New Customer invoice', 0, '2024-09-26', '2024-11-05 11:12:36', 3),
(840, 1, 1, 4, 1010473, 7982601.36, 0.00, 'TR861051124111644', 'New Customer invoice', 0, '2024-09-26', '2024-11-05 11:16:44', 3),
(841, 3, 5, 11, 30501130, 0.00, 7982601.36, 'TR861051124111644', 'New Customer invoice', 0, '2024-09-26', '2024-11-05 11:16:44', 3),
(842, 1, 1, 4, 1010473, 3244071.97, 0.00, 'TR579051124112159', 'New Customer invoice', 0, '2024-09-26', '2024-11-05 11:21:59', 3),
(843, 3, 5, 11, 30501130, 0.00, 3244071.97, 'TR579051124112159', 'New Customer invoice', 0, '2024-09-26', '2024-11-05 11:21:59', 3),
(844, 1, 1, 4, 1010473, 570008.84, 0.00, 'TR373051124112614', 'New Customer invoice', 0, '2024-09-26', '2024-11-05 11:26:14', 3),
(845, 3, 5, 11, 30501130, 0.00, 570008.84, 'TR373051124112614', 'New Customer invoice', 0, '2024-09-26', '2024-11-05 11:26:14', 3),
(846, 1, 1, 4, 1010472, 47400000.00, 0.00, 'TR404051124112956', 'New Customer invoice', 0, '2024-09-27', '2024-11-05 11:29:56', 3),
(847, 3, 5, 11, 30501130, 0.00, 47400000.00, 'TR404051124112956', 'New Customer invoice', 0, '2024-09-27', '2024-11-05 11:29:56', 3),
(848, 1, 1, 4, 1010472, 6624150.00, 0.00, 'TR541051124113209', 'New Customer invoice', 0, '2024-09-27', '2024-11-05 11:32:09', 3),
(849, 3, 5, 11, 30501130, 0.00, 6624150.00, 'TR541051124113209', 'New Customer invoice', 0, '2024-09-27', '2024-11-05 11:32:09', 3),
(854, 1, 1, 3, 1010329, 10967569.00, 0.00, 'TR754081124101225', 'Inventory Purchase', 0, '2024-01-09', '2024-11-08 10:12:25', 3),
(855, 1, 1, 1, 1010150, 0.00, 10967569.00, 'TR754081124101225', 'Inventory Purchase', 0, '2024-01-09', '2024-11-08 10:12:25', 3),
(856, 4, 7, 14, 40701463, 9674940.00, 0.00, 'TR754081124101225', 'Cost of sales', 0, '2024-01-09', '2024-11-08 10:12:25', 3),
(857, 1, 1, 3, 1010329, 0.00, 9674940.00, 'TR754081124101225', 'Cost of sales', 0, '2024-01-09', '2024-11-08 10:12:25', 3),
(862, 1, 1, 3, 1010329, 53962199.00, 0.00, 'TR984081124101718', 'Inventory Purchase', 0, '2024-02-09', '2024-11-08 10:17:18', 3),
(863, 1, 1, 1, 1010150, 0.00, 53962199.00, 'TR984081124101718', 'Inventory Purchase', 0, '2024-02-09', '2024-11-08 10:17:18', 3),
(864, 4, 7, 14, 40701463, 53962199.69, 0.00, 'TR984081124101718', 'Cost of sales', 0, '2024-02-09', '2024-11-08 10:17:18', 3),
(865, 1, 1, 3, 1010329, 0.00, 53962199.69, 'TR984081124101718', 'Cost of sales', 0, '2024-02-09', '2024-11-08 10:17:18', 3),
(866, 1, 1, 3, 1010329, 3677265.00, 0.00, 'TR449081124101854', 'Inventory Purchase', 0, '2024-01-09', '2024-11-08 10:18:54', 3),
(867, 1, 1, 1, 1010150, 0.00, 3677265.00, 'TR449081124101854', 'Inventory Purchase', 0, '2024-01-09', '2024-11-08 10:18:54', 3),
(868, 4, 7, 14, 40701463, 3677265.12, 0.00, 'TR449081124101854', 'Cost of sales', 0, '2024-01-09', '2024-11-08 10:18:54', 3),
(869, 1, 1, 3, 1010329, 0.00, 3677265.12, 'TR449081124101854', 'Cost of sales', 0, '2024-01-09', '2024-11-08 10:18:54', 3),
(870, 1, 1, 3, 1010329, 154654.00, 0.00, 'TR342081124102013', 'Inventory Purchase', 0, '2024-01-19', '2024-11-08 10:20:13', 3),
(871, 1, 1, 1, 1010150, 0.00, 154654.00, 'TR342081124102013', 'Inventory Purchase', 0, '2024-01-19', '2024-11-08 10:20:13', 3),
(872, 4, 7, 14, 40701463, 154654.10, 0.00, 'TR342081124102013', 'Cost of sales', 0, '2024-01-19', '2024-11-08 10:20:13', 3),
(873, 1, 1, 3, 1010329, 0.00, 154654.10, 'TR342081124102013', 'Cost of sales', 0, '2024-01-19', '2024-11-08 10:20:13', 3),
(874, 1, 1, 3, 1010329, 2035793.00, 0.00, 'TR330081124102111', 'Inventory Purchase', 0, '2024-02-08', '2024-11-08 10:21:11', 3),
(875, 1, 1, 1, 1010150, 0.00, 2035793.00, 'TR330081124102111', 'Inventory Purchase', 0, '2024-02-08', '2024-11-08 10:21:11', 3),
(876, 4, 7, 14, 40701463, 2035793.79, 0.00, 'TR330081124102111', 'Cost of sales', 0, '2024-02-08', '2024-11-08 10:21:11', 3),
(877, 1, 1, 3, 1010329, 0.00, 2035793.79, 'TR330081124102111', 'Cost of sales', 0, '2024-02-08', '2024-11-08 10:21:11', 3),
(878, 1, 1, 3, 1010329, 1182649.00, 0.00, 'TR176081124102206', 'Inventory Purchase', 0, '2024-02-07', '2024-11-08 10:22:06', 3),
(879, 1, 1, 1, 1010150, 0.00, 1182649.00, 'TR176081124102206', 'Inventory Purchase', 0, '2024-02-07', '2024-11-08 10:22:06', 3),
(880, 4, 7, 14, 40701463, 1182649.00, 0.00, 'TR176081124102206', 'Cost of sales', 0, '2024-02-07', '2024-11-08 10:22:06', 3),
(881, 1, 1, 3, 1010329, 0.00, 1182649.00, 'TR176081124102206', 'Cost of sales', 0, '2024-02-07', '2024-11-08 10:22:06', 3),
(882, 1, 1, 3, 1010329, 21049614.00, 0.00, 'TR610081124102330', 'Inventory Purchase', 0, '2024-02-06', '2024-11-08 10:23:30', 3),
(883, 1, 1, 1, 1010150, 0.00, 21049614.00, 'TR610081124102330', 'Inventory Purchase', 0, '2024-02-06', '2024-11-08 10:23:30', 3),
(884, 4, 7, 14, 40701463, 21049614.76, 0.00, 'TR610081124102330', 'Cost of sales', 0, '2024-02-06', '2024-11-08 10:23:30', 3),
(885, 1, 1, 3, 1010329, 0.00, 21049614.76, 'TR610081124102330', 'Cost of sales', 0, '2024-02-06', '2024-11-08 10:23:30', 3),
(886, 1, 1, 3, 1010329, 29879348.00, 0.00, 'TR895081124102952', 'Inventory Purchase', 0, '2024-05-30', '2024-11-08 10:29:52', 3),
(887, 1, 1, 1, 1010150, 0.00, 29879348.00, 'TR895081124102952', 'Inventory Purchase', 0, '2024-05-30', '2024-11-08 10:29:52', 3),
(888, 4, 7, 14, 40701463, 29879348.25, 0.00, 'TR895081124102952', 'Cost of sales', 0, '2024-05-30', '2024-11-08 10:29:52', 3),
(889, 1, 1, 3, 1010329, 0.00, 29879348.25, 'TR895081124102952', 'Cost of sales', 0, '2024-05-30', '2024-11-08 10:29:52', 3),
(890, 1, 1, 3, 1010329, 112035107.00, 0.00, 'TR234081124114344', 'Inventory Purchase', 0, '2024-02-12', '2024-11-08 11:43:44', 3),
(891, 1, 1, 1, 1010150, 0.00, 112035107.00, 'TR234081124114344', 'Inventory Purchase', 0, '2024-02-12', '2024-11-08 11:43:44', 3),
(892, 4, 7, 14, 40701463, 112035107.80, 0.00, 'TR234081124114344', 'Cost of sales', 0, '2024-02-12', '2024-11-08 11:43:44', 3),
(893, 1, 1, 3, 1010329, 0.00, 112035107.80, 'TR234081124114344', 'Cost of sales', 0, '2024-02-12', '2024-11-08 11:43:44', 3),
(894, 1, 1, 3, 1010329, 54039962.00, 0.00, 'TR150081124114712', 'Inventory Purchase', 0, '2023-11-15', '2024-11-08 11:47:12', 3),
(895, 1, 1, 1, 1010150, 0.00, 54039962.00, 'TR150081124114712', 'Inventory Purchase', 0, '2023-11-15', '2024-11-08 11:47:12', 3),
(896, 4, 7, 14, 40701463, 54039962.00, 0.00, 'TR150081124114712', 'Cost of sales', 0, '2023-11-15', '2024-11-08 11:47:12', 3),
(897, 1, 1, 3, 1010329, 0.00, 54039962.00, 'TR150081124114712', 'Cost of sales', 0, '2023-11-15', '2024-11-08 11:47:12', 3),
(898, 1, 1, 3, 1010329, 83203563.00, 0.00, 'TR137081124115317', 'Inventory Purchase', 0, '2024-02-09', '2024-11-08 11:53:17', 3),
(899, 1, 1, 1, 1010150, 0.00, 83203563.00, 'TR137081124115317', 'Inventory Purchase', 0, '2024-02-09', '2024-11-08 11:53:17', 3),
(900, 4, 7, 14, 40701463, 83203563.14, 0.00, 'TR137081124115317', 'Cost of sales', 0, '2024-02-09', '2024-11-08 11:53:17', 3),
(901, 1, 1, 3, 1010329, 0.00, 83203563.14, 'TR137081124115317', 'Cost of sales', 0, '2024-02-09', '2024-11-08 11:53:17', 3),
(906, 1, 1, 3, 1010329, 27678517.00, 0.00, 'TR855081124120924', 'Inventory Purchase', 0, '2024-01-03', '2024-11-08 12:09:24', 3),
(907, 1, 1, 1, 1010152, 0.00, 27678517.00, 'TR855081124120924', 'Inventory Purchase', 0, '2024-01-03', '2024-11-08 12:09:24', 3),
(908, 4, 7, 14, 40701463, 27678517.55, 0.00, 'TR855081124120924', 'Cost of sales', 0, '2024-01-03', '2024-11-08 12:09:24', 3),
(909, 1, 1, 3, 1010329, 0.00, 27678517.55, 'TR855081124120924', 'Cost of sales', 0, '2024-01-03', '2024-11-08 12:09:24', 3),
(910, 1, 1, 3, 1010329, 45430915.00, 0.00, 'TR146081124121309', 'Inventory Purchase', 0, '2024-01-09', '2024-11-08 12:13:09', 3),
(911, 1, 1, 1, 1010150, 0.00, 45430915.00, 'TR146081124121309', 'Inventory Purchase', 0, '2024-01-09', '2024-11-08 12:13:09', 3),
(912, 4, 7, 14, 40701463, 45430915.99, 0.00, 'TR146081124121309', 'Cost of sales', 0, '2024-01-09', '2024-11-08 12:13:09', 3),
(913, 1, 1, 3, 1010329, 0.00, 45430915.99, 'TR146081124121309', 'Cost of sales', 0, '2024-01-09', '2024-11-08 12:13:09', 3),
(914, 1, 1, 3, 1010329, 22226514.00, 0.00, 'TR030081124122018', 'Inventory Purchase', 0, '2024-01-09', '2024-11-08 12:20:18', 3),
(915, 1, 1, 1, 1010150, 0.00, 22226514.00, 'TR030081124122018', 'Inventory Purchase', 0, '2024-01-09', '2024-11-08 12:20:18', 3),
(916, 4, 7, 14, 40701463, 22226514.26, 0.00, 'TR030081124122018', 'Cost of sales', 0, '2024-01-09', '2024-11-08 12:20:18', 3),
(917, 1, 1, 3, 1010329, 0.00, 22226514.26, 'TR030081124122018', 'Cost of sales', 0, '2024-01-09', '2024-11-08 12:20:18', 3),
(918, 1, 1, 3, 1010329, 22226514.00, 0.00, 'TR962081124122406', 'Inventory Purchase', 0, '2024-02-29', '2024-11-08 12:24:06', 3),
(919, 1, 1, 1, 1010150, 0.00, 22226514.00, 'TR962081124122406', 'Inventory Purchase', 0, '2024-02-29', '2024-11-08 12:24:06', 3),
(920, 4, 7, 14, 40701463, 22226514.26, 0.00, 'TR962081124122406', 'Cost of sales', 0, '2024-02-29', '2024-11-08 12:24:06', 3),
(921, 1, 1, 3, 1010329, 0.00, 22226514.26, 'TR962081124122406', 'Cost of sales', 0, '2024-02-29', '2024-11-08 12:24:06', 3),
(922, 1, 1, 3, 1010329, 345064.00, 0.00, 'TR252081124014054', 'Inventory Purchase', 0, '2024-02-07', '2024-11-08 13:40:54', 3),
(923, 1, 1, 1, 1010150, 0.00, 345064.00, 'TR252081124014054', 'Inventory Purchase', 0, '2024-02-07', '2024-11-08 13:40:54', 3),
(924, 4, 7, 14, 40701463, 345064.20, 0.00, 'TR252081124014054', 'Cost of sales', 0, '2024-02-07', '2024-11-08 13:40:54', 3),
(925, 1, 1, 3, 1010329, 0.00, 345064.20, 'TR252081124014054', 'Cost of sales', 0, '2024-02-07', '2024-11-08 13:40:54', 3),
(926, 1, 1, 3, 1010329, 28054000.00, 0.00, 'TR444081124043630', 'Inventory Purchase', 0, '2024-02-06', '2024-11-08 16:36:30', 3),
(927, 1, 1, 1, 1010150, 0.00, 28054000.00, 'TR444081124043630', 'Inventory Purchase', 0, '2024-02-06', '2024-11-08 16:36:30', 3),
(928, 4, 7, 14, 40701463, 28054000.00, 0.00, 'TR444081124043630', 'Cost of sales', 0, '2024-02-06', '2024-11-08 16:36:30', 3),
(929, 1, 1, 3, 1010329, 0.00, 28054000.00, 'TR444081124043630', 'Cost of sales', 0, '2024-02-06', '2024-11-08 16:36:30', 3),
(930, 1, 1, 4, 1010472, 5506624.38, 0.00, 'TR659111124013010', 'New Customer invoice', 0, '2024-09-13', '2024-11-11 13:30:10', 3),
(931, 3, 5, 11, 30501130, 0.00, 5506624.38, 'TR659111124013010', 'New Customer invoice', 0, '2024-09-13', '2024-11-11 13:30:10', 3),
(932, 1, 1, 4, 1010472, 817000.00, 0.00, 'TR140111124013229', 'New Customer invoice', 0, '2024-09-13', '2024-11-11 13:32:29', 3),
(933, 3, 5, 11, 30501130, 0.00, 817000.00, 'TR140111124013229', 'New Customer invoice', 0, '2024-09-13', '2024-11-11 13:32:29', 3),
(934, 1, 1, 4, 1010474, 1557963.69, 0.00, 'TR595111124013520', 'New Customer invoice', 0, '2024-09-24', '2024-11-11 13:35:20', 3),
(935, 3, 5, 11, 30501130, 0.00, 1557963.69, 'TR595111124013520', 'New Customer invoice', 0, '2024-09-24', '2024-11-11 13:35:20', 3),
(936, 1, 1, 4, 1010474, 171376.00, 0.00, 'TR802111124013837', 'New Customer invoice', 0, '2024-09-23', '2024-11-11 13:38:37', 3),
(937, 3, 5, 11, 30501130, 0.00, 171376.00, 'TR802111124013837', 'New Customer invoice', 0, '2024-09-23', '2024-11-11 13:38:37', 3),
(938, 1, 1, 4, 1010473, 1471385.50, 0.00, 'TR733111124014159', 'New Customer invoice', 0, '2024-09-19', '2024-11-11 13:41:59', 3),
(939, 3, 5, 11, 30501130, 0.00, 1471385.50, 'TR733111124014159', 'New Customer invoice', 0, '2024-09-19', '2024-11-11 13:41:59', 3),
(940, 1, 1, 4, 1010473, 803.00, 0.00, 'TR739111124014433', 'New Customer invoice', 0, '2024-09-19', '2024-11-11 13:44:33', 3),
(941, 3, 5, 11, 30501130, 0.00, 803.00, 'TR739111124014433', 'New Customer invoice', 0, '2024-09-19', '2024-11-11 13:44:33', 3),
(942, 1, 1, 4, 1010473, 7230816.66, 0.00, 'TR428111124014800', 'New Customer invoice', 0, '2024-09-19', '2024-11-11 13:48:00', 3),
(943, 3, 5, 11, 30501130, 0.00, 7230816.66, 'TR428111124014800', 'New Customer invoice', 0, '2024-09-19', '2024-11-11 13:48:00', 3),
(944, 1, 1, 4, 1010473, 3946431.59, 0.00, 'TR141111124015015', 'New Customer invoice', 0, '2024-09-19', '2024-11-11 13:50:15', 3),
(945, 3, 5, 11, 30501130, 0.00, 3946431.59, 'TR141111124015015', 'New Customer invoice', 0, '2024-09-19', '2024-11-11 13:50:15', 3),
(946, 1, 1, 4, 1010472, 46830944.32, 0.00, 'TR533111124015358', 'New Customer invoice', 0, '2024-09-20', '2024-11-11 13:53:58', 3),
(947, 3, 5, 11, 30501130, 0.00, 46830944.32, 'TR533111124015358', 'New Customer invoice', 0, '2024-09-20', '2024-11-11 13:53:58', 3),
(948, 1, 1, 4, 1010472, 24447679.83, 0.00, 'TR428111124015707', 'New Customer invoice', 0, '2024-09-20', '2024-11-11 13:57:07', 3),
(949, 3, 5, 11, 30501130, 0.00, 24447679.83, 'TR428111124015707', 'New Customer invoice', 0, '2024-09-20', '2024-11-11 13:57:07', 3),
(952, 1, 1, 4, 1010473, 14625869.97, 0.00, 'TR091111124020745', 'New Customer invoice', 0, '2024-09-26', '2024-11-11 14:07:45', 3),
(953, 3, 5, 11, 30501130, 0.00, 14625869.97, 'TR091111124020745', 'New Customer invoice', 0, '2024-09-26', '2024-11-11 14:07:45', 3),
(954, 1, 1, 4, 1010473, 7982601.36, 0.00, 'TR123111124020955', 'New Customer invoice', 0, '2024-09-26', '2024-11-11 14:09:55', 3),
(955, 3, 5, 11, 30501130, 0.00, 7982601.36, 'TR123111124020955', 'New Customer invoice', 0, '2024-09-26', '2024-11-11 14:09:55', 3),
(956, 1, 1, 4, 1010473, 3244071.97, 0.00, 'TR705111124021314', 'New Customer invoice', 0, '2024-09-26', '2024-11-11 14:13:14', 3),
(957, 3, 5, 11, 30501130, 0.00, 3244071.97, 'TR705111124021314', 'New Customer invoice', 0, '2024-09-26', '2024-11-11 14:13:14', 3),
(958, 1, 1, 4, 1010473, 570008.84, 0.00, 'TR062111124021836', 'New Customer invoice', 0, '2024-09-26', '2024-11-11 14:18:36', 3),
(959, 3, 5, 11, 30501130, 0.00, 570008.84, 'TR062111124021836', 'New Customer invoice', 0, '2024-09-26', '2024-11-11 14:18:36', 3),
(960, 1, 1, 4, 1010472, 47400000.00, 0.00, 'TR709111124022103', 'New Customer invoice', 0, '2024-09-27', '2024-11-11 14:21:03', 3),
(961, 3, 5, 11, 30501130, 0.00, 47400000.00, 'TR709111124022103', 'New Customer invoice', 0, '2024-09-27', '2024-11-11 14:21:03', 3),
(962, 1, 1, 4, 1010472, 6624150.00, 0.00, 'TR038111124022346', 'New Customer invoice', 0, '2024-09-27', '2024-11-11 14:23:46', 3),
(963, 3, 5, 11, 30501130, 0.00, 6624150.00, 'TR038111124022346', 'New Customer invoice', 0, '2024-09-27', '2024-11-11 14:23:46', 3),
(966, 1, 1, 4, 1010472, 47736014.52, 0.00, 'TR421111124024434', 'New Customer invoice', 0, '2024-10-07', '2024-11-11 14:44:34', 3),
(967, 3, 5, 11, 30501130, 0.00, 47736014.52, 'TR421111124024434', 'New Customer invoice', 0, '2024-10-07', '2024-11-11 14:44:34', 3),
(968, 1, 1, 4, 1010472, 6157941.20, 0.00, 'TR515111124024745', 'New Customer invoice', 0, '2024-10-07', '2024-11-11 14:47:45', 3),
(969, 3, 5, 11, 30501130, 0.00, 6157941.20, 'TR515111124024745', 'New Customer invoice', 0, '2024-10-07', '2024-11-11 14:47:45', 3),
(970, 1, 1, 4, 1010472, 4907364.10, 0.00, 'TR637111124025040', 'New Customer invoice', 0, '2024-10-07', '2024-11-11 14:50:40', 3),
(971, 3, 5, 11, 30501130, 0.00, 4907364.10, 'TR637111124025040', 'New Customer invoice', 0, '2024-10-07', '2024-11-11 14:50:40', 3),
(972, 1, 1, 4, 1010472, 9472548.51, 0.00, 'TR945111124025412', 'New Customer invoice', 0, '2024-10-09', '2024-11-11 14:54:12', 3),
(973, 3, 5, 11, 30501130, 0.00, 9472548.51, 'TR945111124025412', 'New Customer invoice', 0, '2024-10-09', '2024-11-11 14:54:12', 3),
(974, 1, 1, 4, 1010474, 81990526.00, 0.00, 'TR456111124025706', 'New Customer invoice', 0, '2024-10-09', '2024-11-11 14:57:06', 3),
(975, 3, 5, 11, 30501130, 0.00, 81990526.00, 'TR456111124025706', 'New Customer invoice', 0, '2024-10-09', '2024-11-11 14:57:06', 3),
(976, 1, 1, 4, 1010474, 151816610.87, 0.00, 'TR200111124025910', 'New Customer invoice', 0, '2024-10-09', '2024-11-11 14:59:10', 3),
(977, 3, 5, 11, 30501130, 0.00, 151816610.87, 'TR200111124025910', 'New Customer invoice', 0, '2024-10-09', '2024-11-11 14:59:10', 3),
(978, 1, 1, 4, 1010474, 1633281.11, 0.00, 'TR171111124030542', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:05:42', 3),
(979, 3, 5, 11, 30501130, 0.00, 1633281.11, 'TR171111124030542', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:05:42', 3),
(980, 1, 1, 4, 1010474, 179660.92, 0.00, 'TR517111124030920', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:09:20', 3),
(981, 3, 5, 11, 30501130, 0.00, 179660.92, 'TR517111124030920', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:09:20', 3),
(982, 1, 1, 4, 1010472, 5539085.25, 0.00, 'TR984111124031327', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:13:27', 3),
(983, 3, 5, 11, 30501130, 0.00, 5539085.25, 'TR984111124031327', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:13:27', 3),
(984, 1, 1, 4, 1010472, 817000.00, 0.00, 'TR198111124033248', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:32:48', 3),
(985, 3, 5, 11, 30501130, 0.00, 817000.00, 'TR198111124033248', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:32:48', 3),
(986, 1, 1, 4, 1010472, 10833894.29, 0.00, 'TR024111124033746', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:37:46', 3),
(987, 3, 5, 11, 30501130, 0.00, 10833894.29, 'TR024111124033746', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:37:46', 3),
(988, 1, 1, 4, 1010472, 806250.00, 0.00, 'TR318111124033954', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:39:54', 3),
(989, 3, 5, 11, 30501130, 0.00, 806250.00, 'TR318111124033954', 'New Customer invoice', 0, '2024-10-16', '2024-11-11 15:39:54', 3),
(990, 1, 1, 4, 1010474, 61814304.90, 0.00, 'TR875111124034235', 'New Customer invoice', 0, '2024-10-17', '2024-11-11 15:42:35', 3),
(991, 3, 5, 11, 30501130, 0.00, 61814304.90, 'TR875111124034235', 'New Customer invoice', 0, '2024-10-17', '2024-11-11 15:42:35', 3);
INSERT INTO `transactions` (`transaction_id`, `account_type`, `sub_group`, `class`, `account`, `debit`, `credit`, `trx_number`, `details`, `trx_status`, `trans_date`, `post_date`, `posted_by`) VALUES
(992, 1, 1, 4, 1010474, 961871.80, 0.00, 'TR090111124034455', 'New Customer invoice', 0, '2024-10-22', '2024-11-11 15:44:55', 3),
(993, 3, 5, 11, 30501130, 0.00, 961871.80, 'TR090111124034455', 'New Customer invoice', 0, '2024-10-22', '2024-11-11 15:44:55', 3),
(994, 1, 1, 4, 1010472, 18839073.10, 0.00, 'TR307111124034828', 'New Customer invoice', 0, '2024-10-25', '2024-11-11 15:48:28', 3),
(995, 3, 5, 11, 30501130, 0.00, 18839073.10, 'TR307111124034828', 'New Customer invoice', 0, '2024-10-25', '2024-11-11 15:48:28', 3),
(996, 1, 1, 4, 1010472, 10789152.00, 0.00, 'TR870111124035147', 'New Customer invoice', 0, '2024-10-30', '2024-11-11 15:51:47', 3),
(997, 3, 5, 11, 30501130, 0.00, 10789152.00, 'TR870111124035147', 'New Customer invoice', 0, '2024-10-30', '2024-11-11 15:51:47', 3),
(998, 1, 1, 4, 1010472, 335146489.10, 0.00, 'TR244111124035506', 'New Customer invoice', 0, '2024-11-01', '2024-11-11 15:55:06', 3),
(999, 3, 5, 11, 30501130, 0.00, 335146489.10, 'TR244111124035506', 'New Customer invoice', 0, '2024-11-01', '2024-11-11 15:55:06', 3),
(1000, 1, 1, 4, 1010472, 1869124.53, 0.00, 'TR824111124035754', 'New Customer invoice', 0, '2024-11-01', '2024-11-11 15:57:54', 3),
(1001, 3, 5, 11, 30501130, 0.00, 1869124.53, 'TR824111124035754', 'New Customer invoice', 0, '2024-11-01', '2024-11-11 15:57:54', 3),
(1002, 1, 1, 4, 1010490, 97429440.70, 0.00, 'TR212111124041324', 'New Customer invoice', 0, '2024-11-07', '2024-11-11 16:13:24', 3),
(1003, 3, 5, 11, 30501130, 0.00, 97429440.70, 'TR212111124041324', 'New Customer invoice', 0, '2024-11-07', '2024-11-11 16:13:24', 3),
(1004, 1, 1, 3, 1010329, 1647502.00, 0.00, 'TR905121124023917', 'Inventory Purchase', 0, '2024-01-10', '2024-11-12 14:39:17', 3),
(1005, 1, 1, 1, 1010150, 0.00, 1647502.00, 'TR905121124023917', 'Inventory Purchase', 0, '2024-01-10', '2024-11-12 14:39:17', 3),
(1006, 4, 7, 14, 40701463, 1647502.84, 0.00, 'TR905121124023917', 'Cost of sales', 0, '2024-01-10', '2024-11-12 14:39:17', 3),
(1007, 1, 1, 3, 1010329, 0.00, 1647502.84, 'TR905121124023917', 'Cost of sales', 0, '2024-01-10', '2024-11-12 14:39:17', 3),
(1008, 5, 9, 0, 50901649, 3000.00, 0.00, 'TR908121124025340', 'Directors Annual  2022 Payment', 0, NULL, '2024-11-12 14:53:40', 3),
(1009, 1, 1, 0, 1010150, 0.00, 3000.00, 'TR908121124025340', 'Directors Annual  2022 Payment', 0, NULL, '2024-11-12 14:53:40', 3),
(1010, 1, 1, 3, 1010329, 9097300.00, 0.00, 'TR039121124031252', 'Inventory Purchase', 0, '2024-02-01', '2024-11-12 15:12:52', 3),
(1011, 1, 1, 1, 1010150, 0.00, 9097300.00, 'TR039121124031252', 'Inventory Purchase', 0, '2024-02-01', '2024-11-12 15:12:52', 3),
(1012, 4, 7, 14, 40701463, 9097300.00, 0.00, 'TR039121124031252', 'Cost of sales', 0, '2024-02-01', '2024-11-12 15:12:52', 3),
(1013, 1, 1, 3, 1010329, 0.00, 9097300.00, 'TR039121124031252', 'Cost of sales', 0, '2024-02-01', '2024-11-12 15:12:52', 3),
(1014, 1, 1, 3, 1010329, 937874.00, 0.00, 'TR011121124035448', 'Inventory Purchase', 0, '2024-01-23', '2024-11-12 15:54:48', 3),
(1015, 1, 1, 1, 1010153, 0.00, 937874.00, 'TR011121124035448', 'Inventory Purchase', 0, '2024-01-23', '2024-11-12 15:54:48', 3),
(1016, 4, 7, 14, 40701463, 937874.70, 0.00, 'TR011121124035448', 'Cost of sales', 0, '2024-01-23', '2024-11-12 15:54:48', 3),
(1017, 1, 1, 3, 1010329, 0.00, 937874.70, 'TR011121124035448', 'Cost of sales', 0, '2024-01-23', '2024-11-12 15:54:48', 3),
(1018, 1, 1, 3, 1010329, 36389200.00, 0.00, 'TR863121124041224', 'Inventory Purchase', 0, '2023-12-27', '2024-11-12 16:12:24', 3),
(1019, 1, 1, 1, 1010152, 0.00, 36389200.00, 'TR863121124041224', 'Inventory Purchase', 0, '2023-12-27', '2024-11-12 16:12:24', 3),
(1020, 4, 7, 14, 40701463, 36389200.00, 0.00, 'TR863121124041224', 'Cost of sales', 0, '2023-12-27', '2024-11-12 16:12:24', 3),
(1021, 1, 1, 3, 1010329, 0.00, 36389200.00, 'TR863121124041224', 'Cost of sales', 0, '2023-12-27', '2024-11-12 16:12:24', 3),
(1022, 1, 1, 3, 1010329, 25410578.00, 0.00, 'TR859121124041707', 'Inventory Purchase', 0, '2024-02-06', '2024-11-12 16:17:07', 3),
(1023, 1, 1, 1, 1010150, 0.00, 25410578.00, 'TR859121124041707', 'Inventory Purchase', 0, '2024-02-06', '2024-11-12 16:17:07', 3),
(1024, 4, 7, 14, 40701463, 25410578.36, 0.00, 'TR859121124041707', 'Cost of sales', 0, '2024-02-06', '2024-11-12 16:17:07', 3),
(1025, 1, 1, 3, 1010329, 0.00, 25410578.36, 'TR859121124041707', 'Cost of sales', 0, '2024-02-06', '2024-11-12 16:17:07', 3),
(1026, 1, 1, 3, 1010329, 70493158.00, 0.00, 'TR440121124043311', 'Inventory Purchase', 0, '2024-02-07', '2024-11-12 16:33:11', 3),
(1027, 1, 1, 1, 1010150, 0.00, 70493158.00, 'TR440121124043311', 'Inventory Purchase', 0, '2024-02-07', '2024-11-12 16:33:11', 3),
(1028, 4, 7, 14, 40701463, 70493158.24, 0.00, 'TR440121124043311', 'Cost of sales', 0, '2024-02-07', '2024-11-12 16:33:11', 3),
(1029, 1, 1, 3, 1010329, 0.00, 70493158.24, 'TR440121124043311', 'Cost of sales', 0, '2024-02-07', '2024-11-12 16:33:11', 3),
(1030, 1, 1, 3, 1010329, 47167772.00, 0.00, 'TR155121124043656', 'Inventory Purchase', 0, '2024-02-07', '2024-11-12 16:36:56', 3),
(1031, 1, 1, 1, 1010150, 0.00, 47167772.00, 'TR155121124043656', 'Inventory Purchase', 0, '2024-02-07', '2024-11-12 16:36:56', 3),
(1032, 4, 7, 14, 40701463, 47167772.01, 0.00, 'TR155121124043656', 'Cost of sales', 0, '2024-02-07', '2024-11-12 16:36:56', 3),
(1033, 1, 1, 3, 1010329, 0.00, 47167772.01, 'TR155121124043656', 'Cost of sales', 0, '2024-02-07', '2024-11-12 16:36:56', 3),
(1034, 1, 1, 3, 1010329, 3566141.00, 0.00, 'TR573121124044834', 'Inventory Purchase', 0, '2024-02-12', '2024-11-12 16:48:34', 3),
(1035, 1, 1, 1, 1010150, 0.00, 3566141.00, 'TR573121124044834', 'Inventory Purchase', 0, '2024-02-12', '2024-11-12 16:48:34', 3),
(1036, 4, 7, 14, 40701463, 3566141.60, 0.00, 'TR573121124044834', 'Cost of sales', 0, '2024-02-12', '2024-11-12 16:48:34', 3),
(1037, 1, 1, 3, 1010329, 0.00, 3566141.60, 'TR573121124044834', 'Cost of sales', 0, '2024-02-12', '2024-11-12 16:48:34', 3),
(1038, 1, 1, 3, 1010329, 1601124.00, 0.00, 'TR424121124045936', 'Inventory Purchase', 0, '2024-02-12', '2024-11-12 16:59:36', 3),
(1039, 1, 1, 1, 1010150, 0.00, 1601124.00, 'TR424121124045936', 'Inventory Purchase', 0, '2024-02-12', '2024-11-12 16:59:36', 3),
(1040, 4, 7, 14, 40701463, 1601124.80, 0.00, 'TR424121124045936', 'Cost of sales', 0, '2024-02-12', '2024-11-12 16:59:36', 3),
(1041, 1, 1, 3, 1010329, 0.00, 1601124.80, 'TR424121124045936', 'Cost of sales', 0, '2024-02-12', '2024-11-12 16:59:36', 3),
(1044, 1, 1, 4, 1010472, 10269442.82, 0.00, 'TR634131124114347', 'New Customer invoice', 0, '2024-11-13', '2024-11-13 11:43:47', 3),
(1045, 3, 5, 11, 30501130, 0.00, 10269442.82, 'TR634131124114347', 'New Customer invoice', 0, '2024-11-13', '2024-11-13 11:43:47', 3),
(1046, 1, 1, 3, 1010329, 14020700.00, 0.00, 'TR309141124094225', 'Inventory Purchase', 0, '2024-02-19', '2024-11-14 09:42:25', 3),
(1047, 1, 1, 1, 1010150, 0.00, 14020700.00, 'TR309141124094225', 'Inventory Purchase', 0, '2024-02-19', '2024-11-14 09:42:25', 3),
(1048, 4, 7, 14, 40701463, 14020700.00, 0.00, 'TR309141124094225', 'Cost of sales', 0, '2024-02-19', '2024-11-14 09:42:25', 3),
(1049, 1, 1, 3, 1010329, 0.00, 14020700.00, 'TR309141124094225', 'Cost of sales', 0, '2024-02-19', '2024-11-14 09:42:25', 3),
(1050, 1, 1, 3, 1010329, 84714962.00, 0.00, 'TR771141124094712', 'Inventory Purchase', 0, '2024-02-19', '2024-11-14 09:47:12', 3),
(1051, 1, 1, 1, 1010150, 0.00, 84714962.00, 'TR771141124094712', 'Inventory Purchase', 0, '2024-02-19', '2024-11-14 09:47:12', 3),
(1052, 4, 7, 14, 40701463, 84714962.20, 0.00, 'TR771141124094712', 'Cost of sales', 0, '2024-02-19', '2024-11-14 09:47:12', 3),
(1053, 1, 1, 3, 1010329, 0.00, 84714962.20, 'TR771141124094712', 'Cost of sales', 0, '2024-02-19', '2024-11-14 09:47:12', 3),
(1054, 1, 1, 3, 1010329, 103540514.00, 0.00, 'TR922141124095056', 'Inventory Purchase', 0, '2024-02-19', '2024-11-14 09:50:56', 3),
(1055, 1, 1, 1, 1010150, 0.00, 103540514.00, 'TR922141124095056', 'Inventory Purchase', 0, '2024-02-19', '2024-11-14 09:50:56', 3),
(1056, 4, 7, 14, 40701463, 103540514.02, 0.00, 'TR922141124095056', 'Cost of sales', 0, '2024-02-19', '2024-11-14 09:50:56', 3),
(1057, 1, 1, 3, 1010329, 0.00, 103540514.02, 'TR922141124095056', 'Cost of sales', 0, '2024-02-19', '2024-11-14 09:50:56', 3),
(1058, 1, 1, 3, 1010329, 3617340.00, 0.00, 'TR790141124095508', 'Inventory Purchase', 0, '2024-02-28', '2024-11-14 09:55:08', 3),
(1059, 1, 1, 1, 1010150, 0.00, 3617340.00, 'TR790141124095508', 'Inventory Purchase', 0, '2024-02-28', '2024-11-14 09:55:08', 3),
(1060, 4, 7, 14, 40701463, 3617340.60, 0.00, 'TR790141124095508', 'Cost of sales', 0, '2024-02-28', '2024-11-14 09:55:08', 3),
(1061, 1, 1, 3, 1010329, 0.00, 3617340.60, 'TR790141124095508', 'Cost of sales', 0, '2024-02-28', '2024-11-14 09:55:08', 3),
(1062, 1, 1, 3, 1010329, 20529644.00, 0.00, 'TR397141124100901', 'Inventory Purchase', 0, '2024-03-01', '2024-11-14 10:09:01', 3),
(1063, 1, 1, 1, 1010150, 0.00, 20529644.00, 'TR397141124100901', 'Inventory Purchase', 0, '2024-03-01', '2024-11-14 10:09:01', 3),
(1064, 4, 7, 14, 40701463, 20529644.32, 0.00, 'TR397141124100901', 'Cost of sales', 0, '2024-03-01', '2024-11-14 10:09:01', 3),
(1065, 1, 1, 3, 1010329, 0.00, 20529644.32, 'TR397141124100901', 'Cost of sales', 0, '2024-03-01', '2024-11-14 10:09:01', 3),
(1066, 1, 1, 3, 1010329, 7560700.00, 0.00, 'TR765141124101425', 'Inventory Purchase', 0, '2024-03-04', '2024-11-14 10:14:25', 3),
(1067, 1, 1, 1, 1010150, 0.00, 7560700.00, 'TR765141124101425', 'Inventory Purchase', 0, '2024-03-04', '2024-11-14 10:14:25', 3),
(1068, 4, 7, 14, 40701463, 7560700.00, 0.00, 'TR765141124101425', 'Cost of sales', 0, '2024-03-04', '2024-11-14 10:14:25', 3),
(1069, 1, 1, 3, 1010329, 0.00, 7560700.00, 'TR765141124101425', 'Cost of sales', 0, '2024-03-04', '2024-11-14 10:14:25', 3),
(1070, 1, 1, 3, 1010329, 7560700.00, 0.00, 'TR075141124101733', 'Inventory Purchase', 0, '2024-03-08', '2024-11-14 10:17:33', 3),
(1071, 1, 1, 1, 1010150, 0.00, 7560700.00, 'TR075141124101733', 'Inventory Purchase', 0, '2024-03-08', '2024-11-14 10:17:33', 3),
(1072, 4, 7, 14, 40701463, 7560700.00, 0.00, 'TR075141124101733', 'Cost of sales', 0, '2024-03-08', '2024-11-14 10:17:33', 3),
(1073, 1, 1, 3, 1010329, 0.00, 7560700.00, 'TR075141124101733', 'Cost of sales', 0, '2024-03-08', '2024-11-14 10:17:33', 3),
(1074, 1, 1, 3, 1010329, 10009474.00, 0.00, 'TR828141124103107', 'Inventory Purchase', 0, '2024-03-14', '2024-11-14 10:31:07', 3),
(1075, 1, 1, 1, 1010150, 0.00, 10009474.00, 'TR828141124103107', 'Inventory Purchase', 0, '2024-03-14', '2024-11-14 10:31:07', 3),
(1076, 4, 7, 14, 40701463, 10009474.64, 0.00, 'TR828141124103107', 'Cost of sales', 0, '2024-03-14', '2024-11-14 10:31:07', 3),
(1077, 1, 1, 3, 1010329, 0.00, 10009474.64, 'TR828141124103107', 'Cost of sales', 0, '2024-03-14', '2024-11-14 10:31:07', 3),
(1082, 4, 6, 13, 40601398, 22735176.11, 0.00, 'TR304141124045216', 'CONVERA UK- SCHOOL FEES EXPENSE', 0, '2024-03-15', '2024-11-14 16:52:16', 3),
(1083, 1, 1, 1, 1010150, 0.00, 22735176.11, 'TR304141124045216', 'CONVERA UK- SCHOOL FEES EXPENSE', 0, '2024-03-15', '2024-11-14 16:52:16', 3),
(1084, 1, 1, 0, 1010199, 38408356.00, 0.00, 'TR397141124050319', 'USD EXCHANGE FOR NAIRA', 0, '2024-03-25', '2024-11-14 17:03:19', 3),
(1085, 1, 1, 0, 1010153, 0.00, 38408356.00, 'TR397141124050319', 'USD EXCHANGE FOR NAIRA', 0, '2024-03-25', '2024-11-14 17:03:19', 3),
(1086, 1, 1, 3, 1010329, 13487359.00, 0.00, 'TR484151124095243', 'Inventory Purchase', 0, '2024-04-17', '2024-11-15 09:52:43', 3),
(1087, 1, 1, 1, 1010150, 0.00, 13487359.00, 'TR484151124095243', 'Inventory Purchase', 0, '2024-04-17', '2024-11-15 09:52:43', 3),
(1088, 4, 7, 14, 40701463, 13487359.94, 0.00, 'TR484151124095243', 'Cost of sales', 0, '2024-04-17', '2024-11-15 09:52:43', 3),
(1089, 1, 1, 3, 1010329, 0.00, 13487359.94, 'TR484151124095243', 'Cost of sales', 0, '2024-04-17', '2024-11-15 09:52:43', 3),
(1090, 1, 1, 3, 1010329, 48670215.00, 0.00, 'TR783151124100105', 'Inventory Purchase', 0, '2024-04-23', '2024-11-15 10:01:05', 3),
(1091, 1, 1, 1, 1010150, 0.00, 48670215.00, 'TR783151124100105', 'Inventory Purchase', 0, '2024-04-23', '2024-11-15 10:01:05', 3),
(1092, 4, 7, 14, 40701463, 48670215.00, 0.00, 'TR783151124100105', 'Cost of sales', 0, '2024-04-23', '2024-11-15 10:01:05', 3),
(1093, 1, 1, 3, 1010329, 0.00, 48670215.00, 'TR783151124100105', 'Cost of sales', 0, '2024-04-23', '2024-11-15 10:01:05', 3),
(1094, 1, 1, 3, 1010329, 14766262.00, 0.00, 'TR782151124101356', 'Inventory Purchase', 0, '2024-05-17', '2024-11-15 10:13:56', 3),
(1095, 1, 1, 1, 1010150, 0.00, 14766262.00, 'TR782151124101356', 'Inventory Purchase', 0, '2024-05-17', '2024-11-15 10:13:56', 3),
(1096, 4, 7, 14, 40701463, 14766262.43, 0.00, 'TR782151124101356', 'Cost of sales', 0, '2024-05-17', '2024-11-15 10:13:56', 3),
(1097, 1, 1, 3, 1010329, 0.00, 14766262.43, 'TR782151124101356', 'Cost of sales', 0, '2024-05-17', '2024-11-15 10:13:56', 3),
(1098, 1, 1, 3, 1010329, 3007588.00, 0.00, 'TR332151124104801', 'Inventory Purchase', 0, '2024-05-23', '2024-11-15 10:48:01', 3),
(1099, 1, 1, 1, 1010150, 0.00, 3007588.00, 'TR332151124104801', 'Inventory Purchase', 0, '2024-05-23', '2024-11-15 10:48:01', 3),
(1100, 4, 7, 14, 40701463, 3007588.10, 0.00, 'TR332151124104801', 'Cost of sales', 0, '2024-05-23', '2024-11-15 10:48:01', 3),
(1101, 1, 1, 3, 1010329, 0.00, 3007588.10, 'TR332151124104801', 'Cost of sales', 0, '2024-05-23', '2024-11-15 10:48:01', 3),
(1102, 1, 1, 3, 1010329, 29878721.00, 0.00, 'TR299151124110119', 'Inventory Purchase', 0, '2024-05-30', '2024-11-15 11:01:19', 3),
(1103, 1, 1, 1, 1010150, 0.00, 29878721.00, 'TR299151124110119', 'Inventory Purchase', 0, '2024-05-30', '2024-11-15 11:01:19', 3),
(1104, 4, 7, 14, 40701463, 29878721.44, 0.00, 'TR299151124110119', 'Cost of sales', 0, '2024-05-30', '2024-11-15 11:01:19', 3),
(1105, 1, 1, 3, 1010329, 0.00, 29878721.44, 'TR299151124110119', 'Cost of sales', 0, '2024-05-30', '2024-11-15 11:01:19', 3),
(1106, 1, 1, 3, 1010329, 39681547.00, 0.00, 'TR707151124110617', 'Inventory Purchase', 0, '2024-06-14', '2024-11-15 11:06:17', 3),
(1107, 1, 1, 1, 1010150, 0.00, 39681547.00, 'TR707151124110617', 'Inventory Purchase', 0, '2024-06-14', '2024-11-15 11:06:17', 3),
(1108, 4, 7, 14, 40701463, 39681547.80, 0.00, 'TR707151124110617', 'Cost of sales', 0, '2024-06-14', '2024-11-15 11:06:17', 3),
(1109, 1, 1, 3, 1010329, 0.00, 39681547.80, 'TR707151124110617', 'Cost of sales', 0, '2024-06-14', '2024-11-15 11:06:17', 3),
(1110, 1, 1, 3, 1010329, 32954898.00, 0.00, 'TR427151124111747', 'Inventory Purchase', 0, '2024-05-21', '2024-11-15 11:17:47', 3),
(1111, 1, 1, 1, 1010150, 0.00, 32954898.00, 'TR427151124111747', 'Inventory Purchase', 0, '2024-05-21', '2024-11-15 11:17:47', 3),
(1112, 4, 7, 14, 40701463, 32954898.43, 0.00, 'TR427151124111747', 'Cost of sales', 0, '2024-05-21', '2024-11-15 11:17:47', 3),
(1113, 1, 1, 3, 1010329, 0.00, 32954898.43, 'TR427151124111747', 'Cost of sales', 0, '2024-05-21', '2024-11-15 11:17:47', 3),
(1114, 1, 1, 3, 1010329, 288370674.00, 0.00, 'TR117151124112135', 'Inventory Purchase', 0, '2024-06-21', '2024-11-15 11:21:35', 3),
(1115, 1, 1, 1, 1010150, 0.00, 288370674.00, 'TR117151124112135', 'Inventory Purchase', 0, '2024-06-21', '2024-11-15 11:21:35', 3),
(1116, 4, 7, 14, 40701463, 288370674.75, 0.00, 'TR117151124112135', 'Cost of sales', 0, '2024-06-21', '2024-11-15 11:21:35', 3),
(1117, 1, 1, 3, 1010329, 0.00, 288370674.75, 'TR117151124112135', 'Cost of sales', 0, '2024-06-21', '2024-11-15 11:21:35', 3),
(1118, 1, 1, 3, 1010329, 36546436.00, 0.00, 'TR920151124114408', 'Inventory Purchase', 0, '2024-06-24', '2024-11-15 11:44:08', 3),
(1119, 1, 1, 1, 1010150, 0.00, 36546436.00, 'TR920151124114408', 'Inventory Purchase', 0, '2024-06-24', '2024-11-15 11:44:08', 3),
(1120, 4, 7, 14, 40701463, 36546436.80, 0.00, 'TR920151124114408', 'Cost of sales', 0, '2024-06-24', '2024-11-15 11:44:08', 3),
(1121, 1, 1, 3, 1010329, 0.00, 36546436.80, 'TR920151124114408', 'Cost of sales', 0, '2024-06-24', '2024-11-15 11:44:08', 3),
(1122, 1, 1, 3, 1010329, 99264048.00, 0.00, 'TR161151124115235', 'Inventory Purchase', 0, '2024-06-24', '2024-11-15 11:52:35', 3),
(1123, 1, 1, 1, 1010150, 0.00, 99264048.00, 'TR161151124115235', 'Inventory Purchase', 0, '2024-06-24', '2024-11-15 11:52:35', 3),
(1124, 4, 7, 14, 40701463, 99264048.70, 0.00, 'TR161151124115235', 'Cost of sales', 0, '2024-06-24', '2024-11-15 11:52:35', 3),
(1125, 1, 1, 3, 1010329, 0.00, 99264048.70, 'TR161151124115235', 'Cost of sales', 0, '2024-06-24', '2024-11-15 11:52:35', 3),
(1126, 1, 1, 3, 1010329, 31362600.00, 0.00, 'TR552151124120710', 'Inventory Purchase', 0, '2024-07-01', '2024-11-15 12:07:10', 3),
(1127, 1, 1, 1, 1010150, 0.00, 31362600.00, 'TR552151124120710', 'Inventory Purchase', 0, '2024-07-01', '2024-11-15 12:07:10', 3),
(1128, 4, 7, 14, 40701463, 31362600.00, 0.00, 'TR552151124120710', 'Cost of sales', 0, '2024-07-01', '2024-11-15 12:07:10', 3),
(1129, 1, 1, 3, 1010329, 0.00, 31362600.00, 'TR552151124120710', 'Cost of sales', 0, '2024-07-01', '2024-11-15 12:07:10', 3),
(1130, 1, 1, 4, 1010472, 10316047.82, 0.00, 'TR984221124091313', 'New Customer invoice', 0, '2024-11-13', '2024-11-22 09:13:13', 3),
(1131, 3, 5, 11, 30501130, 0.00, 10316047.82, 'TR984221124091313', 'New Customer invoice', 0, '2024-11-13', '2024-11-22 09:13:13', 3),
(1132, 1, 1, 4, 1010474, 1633281.11, 0.00, 'TR553221124091630', 'New Customer invoice', 0, '2024-11-15', '2024-11-22 09:16:30', 3),
(1133, 3, 5, 11, 30501130, 0.00, 1633281.11, 'TR553221124091630', 'New Customer invoice', 0, '2024-11-15', '2024-11-22 09:16:30', 3),
(1134, 1, 1, 4, 1010474, 179660.92, 0.00, 'TR660221124091920', 'New Customer invoice', 0, '2024-11-15', '2024-11-22 09:19:19', 3),
(1135, 3, 5, 11, 30501130, 0.00, 179660.92, 'TR660221124091920', 'New Customer invoice', 0, '2024-11-15', '2024-11-22 09:19:19', 3),
(1136, 1, 1, 4, 1010472, 11002295.76, 0.00, 'TR133221124092233', 'New Customer invoice', 0, '2024-11-18', '2024-11-22 09:22:33', 3),
(1137, 3, 5, 11, 30501130, 0.00, 11002295.76, 'TR133221124092233', 'New Customer invoice', 0, '2024-11-18', '2024-11-22 09:22:33', 3),
(1138, 1, 1, 4, 1010472, 806250.00, 0.00, 'TR656221124092524', 'New Customer invoice', 0, '2024-11-18', '2024-11-22 09:25:24', 3),
(1139, 3, 5, 11, 30501130, 0.00, 806250.00, 'TR656221124092524', 'New Customer invoice', 0, '2024-11-18', '2024-11-22 09:25:24', 3),
(1140, 1, 1, 4, 1010472, 5625184.50, 0.00, 'TR456221124092949', 'New Customer invoice', 0, '2024-11-18', '2024-11-22 09:29:49', 3),
(1141, 3, 5, 11, 30501130, 0.00, 5625184.50, 'TR456221124092949', 'New Customer invoice', 0, '2024-11-18', '2024-11-22 09:29:49', 3),
(1142, 1, 1, 4, 1010472, 817000.00, 0.00, 'TR411221124093311', 'New Customer invoice', 0, '2024-11-18', '2024-11-22 09:33:11', 3),
(1143, 3, 5, 11, 30501130, 0.00, 817000.00, 'TR411221124093311', 'New Customer invoice', 0, '2024-11-18', '2024-11-22 09:33:11', 3),
(1144, 1, 1, 3, 1010329, 23471565.00, 0.00, 'TR077221124100815', 'Inventory Purchase', 0, '2024-07-04', '2024-11-22 10:08:15', 3),
(1145, 1, 1, 1, 1010150, 0.00, 23471565.00, 'TR077221124100815', 'Inventory Purchase', 0, '2024-07-04', '2024-11-22 10:08:15', 3),
(1146, 4, 7, 14, 40701463, 23471565.98, 0.00, 'TR077221124100815', 'Cost of sales', 0, '2024-07-04', '2024-11-22 10:08:15', 3),
(1147, 1, 1, 3, 1010329, 0.00, 23471565.98, 'TR077221124100815', 'Cost of sales', 0, '2024-07-04', '2024-11-22 10:08:15', 3),
(1148, 1, 1, 3, 1010329, 754270.00, 0.00, 'TR484221124101245', 'Inventory Purchase', 0, '2024-07-19', '2024-11-22 10:12:45', 3),
(1149, 1, 1, 1, 1010150, 0.00, 754270.00, 'TR484221124101245', 'Inventory Purchase', 0, '2024-07-19', '2024-11-22 10:12:45', 3),
(1150, 4, 7, 14, 40701463, 754270.53, 0.00, 'TR484221124101245', 'Cost of sales', 0, '2024-07-19', '2024-11-22 10:12:45', 3),
(1151, 1, 1, 3, 1010329, 0.00, 754270.53, 'TR484221124101245', 'Cost of sales', 0, '2024-07-19', '2024-11-22 10:12:45', 3),
(1152, 1, 1, 3, 1010329, 10976910.00, 0.00, 'TR289221124102052', 'Inventory Purchase', 0, '2024-07-19', '2024-11-22 10:20:52', 3),
(1153, 1, 1, 1, 1010150, 0.00, 10976910.00, 'TR289221124102052', 'Inventory Purchase', 0, '2024-07-19', '2024-11-22 10:20:52', 3),
(1154, 4, 7, 14, 40701463, 10976910.00, 0.00, 'TR289221124102052', 'Cost of sales', 0, '2024-07-19', '2024-11-22 10:20:52', 3),
(1155, 1, 1, 3, 1010329, 0.00, 10976910.00, 'TR289221124102052', 'Cost of sales', 0, '2024-07-19', '2024-11-22 10:20:52', 3),
(1156, 1, 1, 3, 1010329, 19981096.00, 0.00, 'TR708221124103504', 'Inventory Purchase', 0, '2024-07-23', '2024-11-22 10:35:04', 3),
(1157, 1, 1, 1, 1010150, 0.00, 19981096.00, 'TR708221124103504', 'Inventory Purchase', 0, '2024-07-23', '2024-11-22 10:35:04', 3),
(1158, 4, 7, 14, 40701463, 19981096.78, 0.00, 'TR708221124103504', 'Cost of sales', 0, '2024-07-23', '2024-11-22 10:35:04', 3),
(1159, 1, 1, 3, 1010329, 0.00, 19981096.78, 'TR708221124103504', 'Cost of sales', 0, '2024-07-23', '2024-11-22 10:35:04', 3),
(1160, 1, 1, 3, 1010329, 2979447.00, 0.00, 'TR607221124110037', 'Inventory Purchase', 0, '2024-07-24', '2024-11-22 11:00:37', 3),
(1161, 1, 1, 1, 1010150, 0.00, 2979447.00, 'TR607221124110037', 'Inventory Purchase', 0, '2024-07-24', '2024-11-22 11:00:37', 3),
(1162, 4, 7, 14, 40701463, 2979447.00, 0.00, 'TR607221124110037', 'Cost of sales', 0, '2024-07-24', '2024-11-22 11:00:37', 3),
(1163, 1, 1, 3, 1010329, 0.00, 2979447.00, 'TR607221124110037', 'Cost of sales', 0, '2024-07-24', '2024-11-22 11:00:37', 3),
(1164, 1, 1, 3, 1010329, 2979447.00, 0.00, 'TR584221124110113', 'Inventory Purchase', 0, '2024-07-24', '2024-11-22 11:01:13', 3),
(1165, 1, 1, 1, 1010150, 0.00, 2979447.00, 'TR584221124110113', 'Inventory Purchase', 0, '2024-07-24', '2024-11-22 11:01:13', 3),
(1166, 4, 7, 14, 40701463, 2979447.00, 0.00, 'TR584221124110113', 'Cost of sales', 0, '2024-07-24', '2024-11-22 11:01:13', 3),
(1167, 1, 1, 3, 1010329, 0.00, 2979447.00, 'TR584221124110113', 'Cost of sales', 0, '2024-07-24', '2024-11-22 11:01:13', 3),
(1168, 1, 1, 3, 1010329, 27221670.00, 0.00, 'TR526221124110608', 'Inventory Purchase', 0, '2024-07-24', '2024-11-22 11:06:08', 3),
(1169, 1, 1, 1, 1010150, 0.00, 27221670.00, 'TR526221124110608', 'Inventory Purchase', 0, '2024-07-24', '2024-11-22 11:06:08', 3),
(1170, 4, 7, 14, 40701463, 27221670.47, 0.00, 'TR526221124110608', 'Cost of sales', 0, '2024-07-24', '2024-11-22 11:06:08', 3),
(1171, 1, 1, 3, 1010329, 0.00, 27221670.47, 'TR526221124110608', 'Cost of sales', 0, '2024-07-24', '2024-11-22 11:06:08', 3),
(1172, 1, 1, 3, 1010329, 3080309.00, 0.00, 'TR639221124112423', 'Inventory Purchase', 0, '2024-07-31', '2024-11-22 11:24:23', 3),
(1173, 1, 1, 1, 1010150, 0.00, 3080309.00, 'TR639221124112423', 'Inventory Purchase', 0, '2024-07-31', '2024-11-22 11:24:23', 3),
(1174, 4, 7, 14, 40701463, 3080309.12, 0.00, 'TR639221124112423', 'Cost of sales', 0, '2024-07-31', '2024-11-22 11:24:23', 3),
(1175, 1, 1, 3, 1010329, 0.00, 3080309.12, 'TR639221124112423', 'Cost of sales', 0, '2024-07-31', '2024-11-22 11:24:23', 3),
(1176, 1, 1, 3, 1010329, 3080309.00, 0.00, 'TR306221124112520', 'Inventory Purchase', 0, '2024-07-31', '2024-11-22 11:25:20', 3),
(1177, 1, 1, 1, 1010150, 0.00, 3080309.00, 'TR306221124112520', 'Inventory Purchase', 0, '2024-07-31', '2024-11-22 11:25:20', 3),
(1178, 4, 7, 14, 40701463, 3080309.12, 0.00, 'TR306221124112520', 'Cost of sales', 0, '2024-07-31', '2024-11-22 11:25:20', 3),
(1179, 1, 1, 3, 1010329, 0.00, 3080309.12, 'TR306221124112520', 'Cost of sales', 0, '2024-07-31', '2024-11-22 11:25:20', 3),
(1180, 1, 1, 3, 1010329, 559678.00, 0.00, 'TR114221124114719', 'Inventory Purchase', 0, '2024-08-05', '2024-11-22 11:47:19', 3),
(1181, 1, 1, 1, 1010150, 0.00, 559678.00, 'TR114221124114719', 'Inventory Purchase', 0, '2024-08-05', '2024-11-22 11:47:19', 3),
(1182, 4, 7, 14, 40701463, 559678.11, 0.00, 'TR114221124114719', 'Cost of sales', 0, '2024-08-05', '2024-11-22 11:47:19', 3),
(1183, 1, 1, 3, 1010329, 0.00, 559678.11, 'TR114221124114719', 'Cost of sales', 0, '2024-08-05', '2024-11-22 11:47:19', 3),
(1186, 1, 1, 4, 1010474, 18369750.00, 0.00, 'TR383051224100826', 'New Customer invoice', 0, '2024-12-05', '2024-12-05 10:08:26', 3),
(1187, 3, 5, 11, 30501130, 0.00, 18369750.00, 'TR383051224100826', 'New Customer invoice', 0, '2024-12-05', '2024-12-05 10:08:26', 3),
(1188, 1, 1, 3, 1010329, 20656699.00, 0.00, 'TR725051224111452', 'Inventory Purchase', 0, '2024-09-13', '2024-12-05 11:14:52', 3),
(1189, 1, 1, 1, 1010150, 0.00, 20656699.00, 'TR725051224111452', 'Inventory Purchase', 0, '2024-09-13', '2024-12-05 11:14:52', 3),
(1190, 1, 1, 3, 1010329, 60617722.00, 0.00, 'TR769051224111939', 'Inventory Purchase', 0, '2024-09-13', '2024-12-05 11:19:39', 3),
(1191, 1, 1, 1, 1010150, 0.00, 60617722.00, 'TR769051224111939', 'Inventory Purchase', 0, '2024-09-13', '2024-12-05 11:19:39', 3),
(1192, 1, 1, 3, 1010329, 43171860.00, 0.00, 'TR016051224112404', 'Inventory Purchase', 0, '2024-09-19', '2024-12-05 11:24:04', 3),
(1193, 1, 1, 1, 1010150, 0.00, 43171860.00, 'TR016051224112404', 'Inventory Purchase', 0, '2024-09-19', '2024-12-05 11:24:04', 3),
(1194, 1, 1, 3, 1010329, 30820618.00, 0.00, 'TR727051224115704', 'Inventory Purchase', 0, '2024-10-04', '2024-12-05 11:57:04', 3),
(1195, 1, 1, 1, 1010150, 0.00, 30820618.00, 'TR727051224115704', 'Inventory Purchase', 0, '2024-10-04', '2024-12-05 11:57:04', 3),
(1196, 1, 1, 3, 1010329, 2275277.00, 0.00, 'TR222051224120514', 'Inventory Purchase', 0, '2024-09-19', '2024-12-05 12:05:14', 3),
(1197, 1, 1, 1, 1010150, 0.00, 2275277.00, 'TR222051224120514', 'Inventory Purchase', 0, '2024-09-19', '2024-12-05 12:05:14', 3),
(1198, 1, 1, 3, 1010329, 64009275.00, 0.00, 'TR083051224121214', 'Inventory Purchase', 0, '2024-09-20', '2024-12-05 12:12:14', 3),
(1199, 1, 1, 1, 1010150, 0.00, 64009275.00, 'TR083051224121214', 'Inventory Purchase', 0, '2024-09-20', '2024-12-05 12:12:14', 3),
(1200, 1, 1, 3, 1010329, 8597319.00, 0.00, 'TR670051224125420', 'Inventory Purchase', 0, '2024-10-18', '2024-12-05 12:54:20', 3),
(1201, 1, 1, 1, 1010150, 0.00, 8597319.00, 'TR670051224125420', 'Inventory Purchase', 0, '2024-10-18', '2024-12-05 12:54:20', 3),
(1202, 1, 1, 3, 1010329, 7177372.00, 0.00, 'TR856051224125706', 'Inventory Purchase', 0, '2024-11-08', '2024-12-05 12:57:06', 3),
(1203, 1, 1, 1, 1010150, 0.00, 7177372.00, 'TR856051224125706', 'Inventory Purchase', 0, '2024-11-08', '2024-12-05 12:57:06', 3),
(1204, 1, 1, 3, 1010329, 11034360.00, 0.00, 'TR301051224125928', 'Inventory Purchase', 0, '2024-10-18', '2024-12-05 12:59:28', 3),
(1205, 1, 1, 1, 1010150, 0.00, 11034360.00, 'TR301051224125928', 'Inventory Purchase', 0, '2024-10-18', '2024-12-05 12:59:28', 3),
(1206, 1, 1, 3, 1010329, 26623049.00, 0.00, 'TR952051224010343', 'Inventory Purchase', 0, '2024-10-25', '2024-12-05 13:03:43', 3),
(1207, 1, 1, 1, 1010150, 0.00, 26623049.00, 'TR952051224010343', 'Inventory Purchase', 0, '2024-10-25', '2024-12-05 13:03:43', 3),
(1208, 1, 1, 3, 1010329, 10617506.00, 0.00, 'TR357051224010547', 'Inventory Purchase', 0, '2024-10-28', '2024-12-05 13:05:47', 3),
(1209, 1, 1, 1, 1010150, 0.00, 10617506.00, 'TR357051224010547', 'Inventory Purchase', 0, '2024-10-28', '2024-12-05 13:05:47', 3),
(1210, 1, 1, 3, 1010329, 1803849.00, 0.00, 'TR564051224010842', 'Inventory Purchase', 0, '2024-10-30', '2024-12-05 13:08:42', 3),
(1211, 1, 1, 1, 1010150, 0.00, 1803849.00, 'TR564051224010842', 'Inventory Purchase', 0, '2024-10-30', '2024-12-05 13:08:42', 3),
(1212, 1, 1, 3, 1010329, 70292960.00, 0.00, 'TR277051224011549', 'Inventory Purchase', 0, '2024-10-11', '2024-12-05 13:15:49', 3),
(1213, 1, 1, 1, 1010150, 0.00, 70292960.00, 'TR277051224011549', 'Inventory Purchase', 0, '2024-10-11', '2024-12-05 13:15:49', 3),
(1214, 1, 1, 3, 1010329, 10411569.00, 0.00, 'TR247051224011815', 'Inventory Purchase', 0, '2024-11-18', '2024-12-05 13:18:15', 3),
(1215, 1, 1, 1, 1010150, 0.00, 10411569.00, 'TR247051224011815', 'Inventory Purchase', 0, '2024-11-18', '2024-12-05 13:18:15', 3),
(1216, 1, 1, 3, 1010329, 20657875.00, 0.00, 'TR177051224012016', 'Inventory Purchase', 0, '2024-11-18', '2024-12-05 13:20:16', 3),
(1217, 1, 1, 1, 1010150, 0.00, 20657875.00, 'TR177051224012016', 'Inventory Purchase', 0, '2024-11-18', '2024-12-05 13:20:16', 3),
(1218, 1, 1, 3, 1010329, 2776418.00, 0.00, 'TR589051224012229', 'Inventory Purchase', 0, '2024-11-18', '2024-12-05 13:22:29', 3),
(1219, 1, 1, 1, 1010150, 0.00, 2776418.00, 'TR589051224012229', 'Inventory Purchase', 0, '2024-11-18', '2024-12-05 13:22:29', 3),
(1220, 1, 1, 3, 1010329, 85898088.00, 0.00, 'TR462051224012520', 'Inventory Purchase', 0, '2024-11-22', '2024-12-05 13:25:20', 3),
(1221, 1, 1, 1, 1010150, 0.00, 85898088.00, 'TR462051224012520', 'Inventory Purchase', 0, '2024-11-22', '2024-12-05 13:25:20', 3);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `transfer_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `from_store` int(11) NOT NULL,
  `to_store` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost_price` int(11) NOT NULL,
  `sales_price` int(11) NOT NULL,
  `expiration` date NOT NULL,
  `transfer_status` int(11) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `accept_by` int(11) NOT NULL,
  `post_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(1024) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `user_password` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `username`, `user_role`, `user_password`, `status`, `store`, `reg_date`) VALUES
(1, 'Administrator', 'Sysadmin', 'Admin', '$2y$10$dcUrnR/.PvfK7XeYcP60hOyW2qnPSSvEq/Wxee6lv5DETW8pbGXYu', 0, 1, '2022-09-27 13:47:21'),
(2, 'Admin', 'Admin', 'Admin', '$2y$10$Zg86mlW4zi3KoTPoKw1fpefZbkEH7MhhrAqQz.njT0gEtX0uvXUra', 0, 1, '2024-09-13 10:48:06'),
(3, 'Kalams Helen Udodirim', 'Helen', 'Accountant', '$2y$10$D7kqmhAtZTxsocZnJJzr3uLcS8uvRee2jcAWCNC9Q8uqDMCkVLflG', 0, 1, '2024-09-30 03:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `vendor_id` int(11) NOT NULL,
  `vendor` varchar(1024) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `balance` int(11) NOT NULL,
  `account_no` int(50) NOT NULL,
  `ledger_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendor_id`, `vendor`, `contact_person`, `phone`, `email_address`, `balance`, `account_no`, `ledger_id`, `created_date`) VALUES
(1, 'WESTCON ', 'Bunmi', '08061266369', 'agboola.olubunmi@comstor.com', 0, 2030776, 76, '2024-11-06 04:00:11'),
(2, 'PESTRA', 'Jonaphine Obi', '07025130089', 'jonaphine.obi@pestra.net', 0, 2030777, 77, '2024-11-06 04:04:54'),
(3, 'PROVIDUM', 'ADENIYI AJAYI', '07064004187', 'sales@providumltd.com', 0, 2030778, 78, '2024-11-06 04:08:06'),
(4, 'SWAN ELECTRIC', 'SOPHIA', '+86-17354319552', 'sophia@swanautomation.com', 0, 2030779, 79, '2024-11-06 04:10:25'),
(5, 'NAS IT SOLUTIONS', 'SIA', '+971-568632699', 'info@nasitol.com', 0, 2030780, 80, '2024-11-06 04:21:16'),
(6, 'ERS-ELECRONIC READING SYSTEMS LTD', 'MARK FRY', '+44-01234855300', 'sales@ersltd.co.uk', 0, 2030781, 81, '2024-11-06 04:25:25'),
(7, 'CLIDINUIM ENERGY SERVICES', 'DANIEL', '080774567312', 'okoebordaniel@gmail.com', 0, 2030782, 82, '2024-11-06 04:27:32'),
(8, 'COSCHARIS MOTORS LTD', 'JULIE ENO', '08037227392', 'info@coscharis-tech.com', 0, 2030783, 83, '2024-11-06 04:30:19'),
(9, 'SUMI INTERNATIONAL FZ LLC', 'PAUL', '08066830488', 'paul@mitsumidistribution.com', 0, 2030784, 84, '2024-11-06 04:33:24'),
(10, 'SHANGHAI METAL CORPORATION(HK)LTD', 'CHINE', '+862158309368', 'shanghai@gmail.com', 0, 2030785, 85, '2024-11-06 04:42:12'),
(11, 'SUNZIK ENTERPRISES NIG LTD', 'SUNZIK', '08030963805', 'sunzik@yahoo.com', 0, 2030786, 86, '2024-11-06 04:48:16'),
(12, 'ELECTRIC HOUSE TRADING COMPANY', 'ELECTRIC', '+8888-27788890', 'onlinesales@electric-house.com', 0, 2030787, 87, '2024-11-06 05:07:38'),
(13, 'EDIONSEL ENGINEERING LTD', 'ENGR EDWARD', '08034747943', 'info@edionselengineering.com', 0, 2030788, 88, '2024-11-06 05:12:12'),
(14, 'ALPHATECH ENGINEERING NIG LTD', 'ISAAC GBENJO', '08053140317', 'alphatech@gmail.com', 0, 2030789, 89, '2024-11-06 05:15:04'),
(15, 'MURCAL INC,', 'DEANNE JOHNSON', '+661-272-4700', 'murcalinc@gmail.com', 0, 2030791, 91, '2024-11-12 08:34:16'),
(16, 'IEC TELECOM', 'MICHAEL DA SILVA', '+33.(0)1.40.17.08.03', 'www.iec-telecom.com', 0, 2030792, 92, '2024-11-12 09:09:28'),
(17, 'SIGMA WIRELESS COMMUNICATION LTD', 'BILL MCDONALD', '+353(0)1 8142100', 'billdonald@sigmawireless', 0, 2030793, 93, '2024-11-12 09:40:49'),
(18, 'NEPTURA', 'EDWARD VAN TROTSENBURG', '+35799197860', 'neptura@gmail.com', 0, 2030794, 94, '2024-11-12 10:30:30'),
(19, 'INTEGRATED SERVICE SOLUTIONS', 'TEMITOPE ESHO', '+2348157137861', 'integratedservice@gmail.com', 0, 2030795, 95, '2024-11-12 10:56:36'),
(20, 'A PLUS RESOURCES LIMITED', 'TONY OKOROAFOR', '+2348055252135', 'aplusresources@gmail.com', 0, 2030796, 96, '2024-11-14 04:05:35'),
(21, 'CRISTAD LOGISTICS LTD', 'ADA EMEKEKWE', '+2349086304357', 'cristadlogistics@gmail.com', 0, 2030797, 97, '2024-11-14 04:27:11'),
(22, 'SOURCING IT,', 'CHARLEY WEMYSS', '+44(0)1189736675', 'sourcingit@gmail.com', 0, 20307100, 100, '2024-11-15 03:57:33'),
(23, 'OMNICAL B.V', 'Neena Shinh', '+31 70 711 03 88', 'sales@omnical.co', 0, 20307101, 101, '2024-11-15 04:08:27'),
(24, 'FULL RIVER BATTERY GROUP (HK) LTD', 'JOSEPH ARBUAH', '+234-1-4227262', 'fullriver@gmail.com', 0, 20307102, 102, '2024-11-15 04:38:48'),
(25, 'ITECO NIGERIA LTD', 'Emeka Egenwe', '+234 1 634 0199', 'contact@teleng.com', 0, 20307103, 103, '2024-11-15 04:41:04'),
(26, 'NTAKO GLOBAL RESOURCES LTD', 'Ntako Global', '+2349134555666', 'ntakoglobal@gmail.com', 0, 20307104, 104, '2024-11-15 06:03:59'),
(27, 'ABACUS LIGHTNING', 'KYLE LAW', '+01623518214', 'receivables@abacuslighting.com', 0, 20307105, 105, '2024-11-22 04:04:02'),
(28, 'MEDIA &AMP; COMMUNICATION', 'Media Communication', '+234-8038905227', 'mediacommunication@gmail.com', 0, 20307106, 106, '2024-11-22 04:32:22'),
(29, 'ABLE INSTRUMENT &AMP; CONTROL LTD', 'DENISE SMITH', '+44(0)118 9311188', 'able.co.uk', 0, 20307107, 107, '2024-11-22 05:18:51'),
(30, 'CHLORIDE SAS', 'HESSEL BENOIT', '+33 4 78 13 56', 'chloridesas@gmail.com', 0, 20307113, 113, '2024-12-05 05:12:02'),
(31, 'ALTRON COMMUNICATION EQUIPMENT LTD', 'ALTRON', '+44(0)1269831431', 'altron@gmail.com', 0, 20307114, 114, '2024-12-05 06:02:08'),
(32, 'SYSTEM INTELLIGENZ LTD', 'TOSIN DADA', '08025725371', 'info@systemsintelligenz.com', 0, 20307115, 115, '2024-12-05 06:08:20'),
(33, 'DOLPHIN MANUFACTURING LLC', 'RAJEEV ARAKKAL', '+971-6-7032929', 'info@dolrad.ae', 0, 20307116, 116, '2024-12-05 07:12:07');

-- --------------------------------------------------------

--
-- Table structure for table `waybills`
--

CREATE TABLE `waybills` (
  `waybill_id` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `vendor` int(11) NOT NULL,
  `invoice_amount` decimal(12,2) NOT NULL,
  `waybill` decimal(12,2) NOT NULL,
  `trx_number` varchar(50) NOT NULL,
  `store` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `waybills`
--

INSERT INTO `waybills` (`waybill_id`, `invoice`, `vendor`, `invoice_amount`, `waybill`, `trx_number`, `store`, `post_date`, `posted_by`) VALUES
(2, 'LPO 273', 2, 9674940.00, 1292629.25, 'TR754081124101225', 1, '2024-11-08 10:12:25', 3),
(4, 'LPO 270', 14, 53962199.69, 0.00, 'TR984081124101718', 1, '2024-11-08 10:17:18', 3),
(5, 'LPO 276', 3, 3677265.12, 0.00, 'TR449081124101854', 1, '2024-11-08 10:18:54', 3),
(6, 'LPO 277', 4, 154654.10, 0.00, 'TR342081124102013', 1, '2024-11-08 10:20:13', 3),
(7, 'LPO 281', 6, 2035793.79, 0.00, 'TR330081124102111', 1, '2024-11-08 10:21:11', 3),
(8, 'LPO 282', 5, 1182649.00, 0.00, 'TR176081124102206', 1, '2024-11-08 10:22:06', 3),
(9, 'LPO 279', 8, 21049614.76, 0.00, 'TR610081124102330', 1, '2024-11-08 10:23:30', 3),
(10, 'LPO292', 3, 29879348.25, 0.00, 'TR895081124102952', 1, '2024-11-08 10:29:52', 3),
(11, 'LPO 205/2023', 3, 112035107.80, 0.00, 'TR234081124114344', 1, '2024-11-08 11:43:44', 3),
(12, 'LPO205/2023', 3, 54039962.00, 0.00, 'TR150081124114712', 1, '2024-11-08 11:47:12', 3),
(13, 'LPO 252/270', 14, 83203563.14, 0.00, 'TR137081124115317', 1, '2024-11-08 11:53:17', 3),
(15, 'LPO 246', 1, 27678517.55, 0.00, 'TR146081124121309', 1, '2024-11-08 12:09:24', 3),
(16, 'LPO 272', 3, 22226514.26, 0.00, 'TR030081124122018', 1, '2024-11-08 12:20:18', 3),
(17, 'LPO 272  (2)', 1, 22226514.26, 0.00, 'TR962081124122406', 1, '2024-11-08 12:24:06', 3),
(18, 'LPO 280', 10, 345064.20, 0.00, 'TR252081124014054', 1, '2024-11-08 13:40:54', 3),
(19, 'LPO 001', 7, 28054000.00, 0.00, 'TR444081124043630', 1, '2024-11-08 16:36:30', 3),
(20, 'LPO 275', 15, 1647502.84, 0.00, 'TR905121124023917', 1, '2024-11-12 14:39:17', 3),
(21, '001/2024', 16, 9097300.00, 0.00, 'TR039121124031252', 1, '2024-11-12 15:12:52', 3),
(22, 'LPO 274', 17, 937874.70, 0.00, 'TR011121124035448', 1, '2024-11-12 15:54:48', 3),
(23, 'LPO 271', 9, 36389200.00, 0.00, 'TR863121124041224', 1, '2024-11-12 16:12:24', 3),
(24, 'LPO 271/2', 9, 25410578.36, 0.00, 'TR859121124041707', 1, '2024-11-12 16:17:07', 3),
(25, 'LPO 257', 18, 70493158.24, 0.00, 'TR440121124043311', 1, '2024-11-12 16:33:11', 3),
(26, 'LPO 284', 18, 47167772.01, 0.00, 'TR155121124043656', 1, '2024-11-12 16:36:56', 3),
(27, '001/2024', 18, 3566141.60, 0.00, 'TR573121124044834', 1, '2024-11-12 16:48:34', 3),
(28, '001/2024', 19, 1601124.80, 0.00, 'TR424121124045936', 1, '2024-11-12 16:59:36', 3),
(29, '002/2024', 7, 14020700.00, 0.00, 'TR309141124094225', 1, '2024-11-14 09:42:25', 3),
(30, 'DDIS-346', 11, 84714962.20, 0.00, 'TR771141124094712', 1, '2024-11-14 09:47:12', 3),
(31, 'DDIS-366', 11, 103540514.02, 0.00, 'TR922141124095056', 1, '2024-11-14 09:50:56', 3),
(32, '257', 18, 3617340.60, 0.00, 'TR790141124095508', 1, '2024-11-14 09:55:08', 3),
(33, 'LPO 244', 20, 20529644.32, 0.00, 'TR397141124100901', 1, '2024-11-14 10:09:01', 3),
(34, '003/2024', 7, 7560700.00, 0.00, 'TR765141124101425', 1, '2024-11-14 10:14:25', 3),
(35, '004/2024', 7, 7560700.00, 0.00, 'TR075141124101733', 1, '2024-11-14 10:17:33', 3),
(36, '001/2024', 21, 10009474.64, 0.00, 'TR484151124095243', 1, '2024-11-14 10:31:07', 3),
(37, 'LPO 289', 22, 48670215.00, 0.00, 'TR783151124100105', 1, '2024-11-15 10:01:05', 3),
(38, 'KBD101827', 23, 14766262.43, 0.00, 'TR782151124101356', 1, '2024-11-15 10:13:56', 3),
(39, 'ITC0000006953', 25, 3007588.10, 0.00, 'TR332151124104801', 1, '2024-11-15 10:48:01', 3),
(40, 'LPO 292', 3, 29878721.44, 0.00, 'TR299151124110119', 1, '2024-11-15 11:01:19', 3),
(41, 'LPO 293', 18, 39681547.80, 0.00, 'TR707151124110617', 1, '2024-11-15 11:06:17', 3),
(42, 'LPO 294', 1, 32954898.43, 0.00, 'TR427151124111747', 1, '2024-11-15 11:17:47', 3),
(43, 'LPO 296', 1, 288370674.75, 0.00, 'TR117151124112135', 1, '2024-11-15 11:21:35', 3),
(44, 'LPO 291', 24, 36546436.80, 0.00, 'TR920151124114408', 1, '2024-11-15 11:44:08', 3),
(45, 'LPO 295', 3, 99264048.70, 0.00, 'TR161151124115235', 1, '2024-11-15 11:52:35', 3),
(46, '001/2024', 26, 31362600.00, 0.00, 'TR552151124120710', 1, '2024-11-15 12:07:10', 3),
(47, '90160963', 27, 23471565.98, 0.00, 'TR077221124100815', 1, '2024-11-22 10:08:15', 3),
(48, '17/07', 16, 754270.53, 0.00, 'TR484221124101245', 1, '2024-11-22 10:12:45', 3),
(49, '003/2024', 26, 10976910.00, 0.00, 'TR289221124102052', 1, '2024-11-22 10:20:52', 3),
(50, '569545A', 28, 19981096.78, 0.00, 'TR708221124103504', 1, '2024-11-22 10:35:04', 3),
(51, 'LPO 305', 18, 2979447.00, 0.00, 'TR584221124110113', 1, '2024-11-22 11:00:37', 3),
(52, 'DXB23397', 5, 27221670.47, 0.00, 'TR526221124110608', 1, '2024-11-22 11:06:08', 3),
(53, 'EBA0096929', 29, 3080309.12, 0.00, 'TR306221124112520', 1, '2024-11-22 11:24:23', 3),
(54, '569545*', 28, 559678.11, 0.00, 'TR114221124114719', 1, '2024-11-22 11:47:19', 3),
(55, 'LPO 297', 30, 20656699.50, 0.00, 'TR725051224111452', 1, '2024-12-05 11:14:52', 3),
(56, 'DXB23429', 5, 60617722.00, 0.00, 'TR769051224111939', 1, '2024-12-05 11:19:39', 3),
(57, 'LPO312', 5, 43171860.35, 0.00, 'TR016051224112404', 1, '2024-12-05 11:24:04', 3),
(58, 'LPO 317', 28, 30820618.54, 0.00, 'TR727051224115704', 1, '2024-12-05 11:57:04', 3),
(59, 'LPO 313', 31, 2275277.26, 0.00, 'TR222051224120514', 1, '2024-12-05 12:05:14', 3),
(60, 'LPO309', 32, 64009275.42, 0.00, 'TR083051224121214', 1, '2024-12-05 12:12:14', 3),
(61, 'LPO 320', 3, 8597319.42, 0.00, 'TR670051224125420', 1, '2024-12-05 12:54:20', 3),
(62, 'LPO 323', 3, 7177372.09, 0.00, 'TR856051224125706', 1, '2024-12-05 12:57:06', 3),
(63, 'LPO 319', 18, 11034360.00, 0.00, 'TR301051224125928', 1, '2024-12-05 12:59:28', 3),
(64, 'LPO 314', 3, 26623049.92, 0.00, 'TR952051224010343', 1, '2024-12-05 13:03:43', 3),
(65, 'LPO 321', 5, 10617506.40, 0.00, 'TR357051224010547', 1, '2024-12-05 13:05:47', 3),
(66, 'LPO 322', 28, 1803849.30, 0.00, 'TR564051224010842', 1, '2024-12-05 13:08:42', 3),
(67, 'LPO 318', 33, 70292960.00, 0.00, 'TR277051224011549', 1, '2024-12-05 13:15:49', 3),
(68, 'LPO 327', 16, 10411569.00, 0.00, 'TR247051224011815', 1, '2024-12-05 13:18:15', 3),
(69, 'LPO 326', 16, 20657875.00, 0.00, 'TR177051224012016', 1, '2024-12-05 13:20:16', 3),
(70, 'LPO325', 16, 2776418.40, 0.00, 'TR589051224012229', 1, '2024-12-05 13:22:29', 3),
(71, 'INV241001209', 30, 85898088.46, 0.00, 'TR462051224012520', 1, '2024-12-05 13:25:20', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_class`
--
ALTER TABLE `account_class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `account_groups`
--
ALTER TABLE `account_groups`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `account_sub_groups`
--
ALTER TABLE `account_sub_groups`
  ADD PRIMARY KEY (`sub_group_id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`asset_id`);

--
-- Indexes for table `asset_locations`
--
ALTER TABLE `asset_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `asset_postings`
--
ALTER TABLE `asset_postings`
  ADD PRIMARY KEY (`asset_id`);

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `cash_flows`
--
ALTER TABLE `cash_flows`
  ADD PRIMARY KEY (`fow_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `cost_of_sales`
--
ALTER TABLE `cost_of_sales`
  ADD PRIMARY KEY (`cost_of_sales_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_trail`
--
ALTER TABLE `customer_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `debtors`
--
ALTER TABLE `debtors`
  ADD PRIMARY KEY (`debtor_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`deposit_id`);

--
-- Indexes for table `depreciation`
--
ALTER TABLE `depreciation`
  ADD PRIMARY KEY (`depreciation_id`);

--
-- Indexes for table `director_posting`
--
ALTER TABLE `director_posting`
  ADD PRIMARY KEY (`director_id`);

--
-- Indexes for table `disposed_assets`
--
ALTER TABLE `disposed_assets`
  ADD PRIMARY KEY (`disposed_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `expense_heads`
--
ALTER TABLE `expense_heads`
  ADD PRIMARY KEY (`exp_head_id`);

--
-- Indexes for table `finance_cost`
--
ALTER TABLE `finance_cost`
  ADD PRIMARY KEY (`finance_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `issue_items`
--
ALTER TABLE `issue_items`
  ADD PRIMARY KEY (`issue_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `item_transfers`
--
ALTER TABLE `item_transfers`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `ledgers`
--
ALTER TABLE `ledgers`
  ADD PRIMARY KEY (`ledger_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `multiple_payments`
--
ALTER TABLE `multiple_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opening_balance`
--
ALTER TABLE `opening_balance`
  ADD PRIMARY KEY (`balance_id`);

--
-- Indexes for table `other_income`
--
ALTER TABLE `other_income`
  ADD PRIMARY KEY (`income_id`);

--
-- Indexes for table `other_transactions`
--
ALTER TABLE `other_transactions`
  ADD PRIMARY KEY (`trx_id`);

--
-- Indexes for table `outstanding`
--
ALTER TABLE `outstanding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `remove_items`
--
ALTER TABLE `remove_items`
  ADD PRIMARY KEY (`remove_id`);

--
-- Indexes for table `remove_reasons`
--
ALTER TABLE `remove_reasons`
  ADD PRIMARY KEY (`remove_id`);

--
-- Indexes for table `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`right_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `sales_returns`
--
ALTER TABLE `sales_returns`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD PRIMARY KEY (`adjust_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `sub_menus`
--
ALTER TABLE `sub_menus`
  ADD PRIMARY KEY (`sub_menu_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`vendor_id`);

--
-- Indexes for table `waybills`
--
ALTER TABLE `waybills`
  ADD PRIMARY KEY (`waybill_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_class`
--
ALTER TABLE `account_class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `account_groups`
--
ALTER TABLE `account_groups`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `account_sub_groups`
--
ALTER TABLE `account_sub_groups`
  MODIFY `sub_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_locations`
--
ALTER TABLE `asset_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `asset_postings`
--
ALTER TABLE `asset_postings`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2421;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cash_flows`
--
ALTER TABLE `cash_flows`
  MODIFY `fow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cost_of_sales`
--
ALTER TABLE `cost_of_sales`
  MODIFY `cost_of_sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `customer_trail`
--
ALTER TABLE `customer_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `debtors`
--
ALTER TABLE `debtors`
  MODIFY `debtor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `deposit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `depreciation`
--
ALTER TABLE `depreciation`
  MODIFY `depreciation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `director_posting`
--
ALTER TABLE `director_posting`
  MODIFY `director_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `disposed_assets`
--
ALTER TABLE `disposed_assets`
  MODIFY `disposed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_heads`
--
ALTER TABLE `expense_heads`
  MODIFY `exp_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `finance_cost`
--
ALTER TABLE `finance_cost`
  MODIFY `finance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `issue_items`
--
ALTER TABLE `issue_items`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT for table `item_transfers`
--
ALTER TABLE `item_transfers`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `ledger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `multiple_payments`
--
ALTER TABLE `multiple_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `opening_balance`
--
ALTER TABLE `opening_balance`
  MODIFY `balance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `other_income`
--
ALTER TABLE `other_income`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_transactions`
--
ALTER TABLE `other_transactions`
  MODIFY `trx_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `outstanding`
--
ALTER TABLE `outstanding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `production`
--
ALTER TABLE `production`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `remove_items`
--
ALTER TABLE `remove_items`
  MODIFY `remove_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `remove_reasons`
--
ALTER TABLE `remove_reasons`
  MODIFY `remove_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rights`
--
ALTER TABLE `rights`
  MODIFY `right_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1165;

--
-- AUTO_INCREMENT for table `sales_returns`
--
ALTER TABLE `sales_returns`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  MODIFY `adjust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sub_menus`
--
ALTER TABLE `sub_menus`
  MODIFY `sub_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1222;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `waybills`
--
ALTER TABLE `waybills`
  MODIFY `waybill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
