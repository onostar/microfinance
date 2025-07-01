-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2025 at 03:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `microfinance`
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
(10, 'FOREX', '1010199'),
(11, 'ACCESS BANK', '10101119');

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
(1, 'Demo Microfinance Ltd', 'icon.png', '2025-06-06 14:46:39');

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

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ledger_id` int(11) NOT NULL,
  `acn` int(50) NOT NULL,
  `customer_type` varchar(20) NOT NULL,
  `phone_numbers` varchar(20) NOT NULL,
  `customer_address` varchar(100) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `state_region` varchar(50) NOT NULL,
  `lga` varchar(255) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `religion` varchar(50) NOT NULL,
  `marital_status` varchar(50) NOT NULL,
  `occupation` varchar(50) NOT NULL,
  `business` varchar(255) NOT NULL,
  `business_address` varchar(255) NOT NULL,
  `income` varchar(50) NOT NULL,
  `nok` varchar(255) NOT NULL,
  `nok_address` varchar(255) NOT NULL,
  `nok_phone` varchar(50) NOT NULL,
  `nok_relation` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `account_number` int(11) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `photo` varchar(1024) NOT NULL,
  `reg_status` int(11) NOT NULL,
  `wallet_balance` int(11) NOT NULL,
  `amount_due` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer`, `user_id`, `ledger_id`, `acn`, `customer_type`, `phone_numbers`, `customer_address`, `customer_email`, `state_region`, `lga`, `landmark`, `gender`, `dob`, `religion`, `marital_status`, `occupation`, `business`, `business_address`, `income`, `nok`, `nok_address`, `nok_phone`, `nok_relation`, `bank`, `account_number`, `account_name`, `photo`, `reg_status`, `wallet_balance`, `amount_due`, `created_by`, `reg_date`) VALUES
(38, 'IKPEFUA KELLY', 8, 122, 10104122, '', '07068897068', '1b Ogidan Street Off Atican Beachview Estate, Okun-ajah Community', 'onostarkels@gmail.com', 'LAGOS', 'ETI-OSA', 'Abraham Adesanya Estate', 'Male', '1989-05-15', 'Christian', 'Married', 'Business Person', 'onostar media', 'Ogidan, Lagos state', '1,000,000', 'PAUL IKPEFUA', 'Abraka, Delta State', '091565677', 'BROTHER', 'Access Bank', 30596252, 'IKPEFUA KELLY ONOLUNOSE', '684fd6924b626.png', 1, 0, 0, 1, '2025-06-09 14:21:04'),
(40, 'IKPEFUA VICTORY', 10, 124, 10104124, '', '09012345678', 'Iyan-ipaja', 'victory@mail.com', 'LAGOS', 'IYAN', 'I', 'Female', '2001-05-25', 'Christian', 'Single', 'Banker', 'torys hair', 'jkhkh', '200000', 'PAUL', 'Khjkh', 'hghg', 'JKH', 'Jaiz Bank', 8786, '786786', 'user.png', 1, 0, 0, 1, '2025-06-09 15:19:33');

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
-- Table structure for table `kyc`
--

CREATE TABLE `kyc` (
  `kyc_id` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `id_type` varchar(50) NOT NULL,
  `id_number` varchar(50) NOT NULL,
  `id_card` varchar(1024) NOT NULL,
  `bvn` int(11) NOT NULL,
  `verification` int(11) NOT NULL,
  `verified_by` int(11) NOT NULL,
  `verified_date` datetime DEFAULT NULL,
  `kyc_date` datetime DEFAULT NULL,
  `posted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyc`
--

INSERT INTO `kyc` (`kyc_id`, `customer`, `id_type`, `id_number`, `id_card`, `bvn`, `verification`, `verified_by`, `verified_date`, `kyc_date`, `posted_by`) VALUES
(5, 40, 'VOTER&#039;S CARD', '87686876ug', '26680_40.jpg', 2147483647, 1, 1, '2025-06-09 15:20:20', '2025-06-09 15:19:56', 1),
(6, 38, 'NIN', '0990099000', '20820_38.jpg', 2147483647, 1, 1, '2025-06-18 15:41:20', '2025-06-18 15:33:58', 8);

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
(98, 4, 6, 13, 'MD\'S CHILDREN SCHOOL FEES', 40601398),
(99, 1, 1, 1, 'FOREX', 1010199),
(108, 4, 7, 14, 'COURIER EXPENSES', 406012108),
(109, 4, 7, 14, 'FREIGHT AND CUSTOMS  DUTIES', 406012109),
(110, 4, 6, 12, 'COMPUTER CONSUMABLES', 407014110),
(111, 4, 6, 13, 'PETTY PROJECT EXPENSES', 406013111),
(112, 4, 6, 13, 'TRANSFER TO MDS ACCOUNT', 406013112),
(119, 1, 1, 1, 'ACCESS BANK', 10101119),
(122, 1, 1, 4, 'IKPEFUA KELLY', 10104122),
(124, 1, 1, 4, 'IKPEFUA VICTORY', 10104124);

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
-- Table structure for table `loan_applications`
--

CREATE TABLE `loan_applications` (
  `loan_id` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `frequency` varchar(50) NOT NULL,
  `installment` decimal(10,0) NOT NULL,
  `interest_rate` float NOT NULL,
  `interest` decimal(10,0) NOT NULL,
  `processing_rate` float NOT NULL,
  `processing_fee` decimal(10,0) NOT NULL,
  `total_payable` decimal(10,0) NOT NULL,
  `loan_term` float NOT NULL,
  `collateral` text NOT NULL,
  `posted_by` int(11) NOT NULL,
  `application_date` datetime DEFAULT NULL,
  `loan_status` int(11) NOT NULL,
  `approved_by` int(11) NOT NULL,
  `approve_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_applications`
--

INSERT INTO `loan_applications` (`loan_id`, `customer`, `product`, `amount`, `purpose`, `frequency`, `installment`, `interest_rate`, `interest`, `processing_rate`, `processing_fee`, `total_payable`, `loan_term`, `collateral`, `posted_by`, `application_date`, `loan_status`, `approved_by`, `approve_date`, `start_date`, `due_date`) VALUES
(14, 38, 3, 200000, 'House Rent', 'Monthly', 70000, 4, 8, 1, 2, 210, 3, '', 8, '2025-07-01 12:49:21', 1, 1, '2025-07-01 13:37:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loan_products`
--

CREATE TABLE `loan_products` (
  `product_id` int(11) NOT NULL,
  `product` varchar(1024) NOT NULL,
  `description` text NOT NULL,
  `interest` decimal(10,0) NOT NULL,
  `repayment` varchar(50) NOT NULL,
  `minimum` decimal(10,0) NOT NULL,
  `maximum` decimal(10,0) NOT NULL,
  `duration` int(11) NOT NULL,
  `processing` decimal(10,0) NOT NULL,
  `penalty` decimal(10,0) NOT NULL,
  `collateral` varchar(50) NOT NULL,
  `product_status` int(11) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_products`
--

INSERT INTO `loan_products` (`product_id`, `product`, `description`, `interest`, `repayment`, `minimum`, `maximum`, `duration`, `processing`, `penalty`, `collateral`, `product_status`, `posted_by`, `post_date`) VALUES
(1, 'SME LOAN', 'For Small Businesess', 3, 'Weekly', 50000, 300000, 3, 1, 2, 'Yes', 0, 1, '2025-06-17 14:10:52'),
(3, 'SALARY ADVANCE', 'For Employed Individuals Needing Short-term Cash Before Payday', 4, 'Monthly', 100000, 500000, 6, 1, 2, 'No', 0, 1, '2025-06-18 15:56:22'),
(4, 'COOPERATIVE LOAN', 'Group-based Loans Under A Registered Cooperative', 5, 'Weekly', 500000, 1000000, 12, 2, 3, 'No', 0, 1, '2025-06-18 15:58:26');

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
(10, 'Chart Of Account'),
(11, 'Client Module'),
(12, 'Customer'),
(13, 'Loan Management');

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
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `not_status` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `client`, `subject`, `message`, `not_status`, `post_date`) VALUES
(3, 38, 'KYC Verification Approved', '<p>Dear IKPEFUA KELLY, <br> We’re happy to inform you that your KYC verification has been successfully completed. 🎉<br><br> Your account is now fully verified, and you can enjoy uninterrupted access to all features and services.<br><br>Thank you for completing the verification process. If you have any questions or need assistance, feel free to reach out to our support team.<br><br>\r\nBest regards,<br>Demo Microfinance Ltd</p>;\r\n\r\n', 1, '2025-06-09 14:42:29'),
(4, 40, 'KYC Verification Approved', '<p>Dear IKPEFUA VICTORY, <br> We’re happy to inform you that your KYC verification has been successfully completed. 🎉<br><br> Your account is now fully verified, and you can enjoy uninterrupted access to all features and services.<br><br>Thank you for completing the verification process. If you have any questions or need assistance, feel free to reach out to our support team.<br><br>\r\nBest regards,<br>Demo Microfinance Ltd</p>;\r\n\r\n', 0, '2025-06-09 15:20:20'),
(5, 38, 'KYC Verification Approved', 'Dear IKPEFUA KELLY, \r\n\r\n            We’re happy to inform you that your KYC verification has been successfully completed. 🎉\r\n            \r\n            Your account is now fully verified, and you can enjoy uninterrupted access to all features and services.\r\n\r\n            Thank you for completing the verification process. If you have any questions or need assistance, feel free to reach out to our support team.\r\n            \r\n            Best regards,Demo Microfinance Ltd', 1, '2025-06-18 15:41:20'),
(6, 38, 'Loan Application Declined', 'Dear IKPEFUA KELLY, \r\n\r\n           Thank you for choosing  for your financial needs.\r\n            \r\n           After careful review of your recent loan application, we regret to inform you that your request has not been approved at this time. This decision was based on our internal assessment and current lending criteria.\r\n           Your application was declined for the following reasons:\r\n            You Curently Hava Bad Credit Score\r\n           We understand this may be disappointing, and we encourage you to reapply in the future or reach out to us to discuss possible alternatives or ways to strengthen your eligibility.\r\n           \r\n           Thank you once again for considering \r\n            \r\n            Warm regards,\r\n            ', 1, '2025-07-01 12:04:57'),
(7, 38, 'Loan Application Declined', 'Dear IKPEFUA KELLY, \r\n            Thank you for choosing Demo Microfinance Ltd for your financial needs.\r\n            \r\n            After careful review of your recent loan application, we regret to inform you that your request has not been approved at this time. This decision was based on our internal assessment and current lending criteria.\r\n            \r\n            Your application was declined for the following reasons:\r\n            Your Nin Has Expired, And Your Bvn Doesnt Seem To Be Correct\r\n            \r\n            We understand this may be disappointing, and we encourage you to reapply in the future or reach out to us to discuss possible alternatives or ways to strengthen your eligibility.\r\n            \r\n            Thank you once again for considering Demo Microfinance Ltd\r\n            \r\n            Warm regards,\r\n            Demo Microfinance Ltd', 1, '2025-07-01 12:40:08'),
(8, 38, 'Your Loan Has Been Approved', 'Dear IKPEFUA KELLY, \r\n\r\n            We’re pleased to inform you that your loan application has been approved ✅.\r\n\r\nYour loan is now awaiting disbursement, and you will receive a notification once the funds have been released to your account.\r\n\r\nThank you for choosing us. We’re excited to support your financial journey!\r\n            \r\n            Best regards,Demo Microfinance Ltd', 1, '2025-07-01 13:29:13'),
(9, 38, 'Your Loan Has Been Approved', 'Dear IKPEFUA KELLY, \r\n\r\n            We’re pleased to inform you that your loan application has been approved ✅.\r\n\r\nYour loan is now awaiting disbursement, and you will receive a notification once the funds have been released to your account.\r\n\r\nThank you for choosing us. We’re excited to support your financial journey!\r\n            \r\n            Best regards,Demo Microfinance Ltd', 1, '2025-07-01 13:33:04'),
(10, 38, 'Your Loan Has Been Approved', 'Dear IKPEFUA KELLY, \r\n\r\n            We’re pleased to inform you that your loan application has been approved ✅.\r\n\r\nYour loan is now awaiting disbursement, and you will receive a notification once the funds have been released to your account.\r\n\r\nThank you for choosing us. We’re excited to support your financial journey!\r\n            \r\n            Best regards,Demo Microfinance Ltd', 1, '2025-07-01 13:34:39'),
(11, 38, 'Your Loan Has Been Approved', 'Dear IKPEFUA KELLY, \r\n\r\n            We’re pleased to inform you that your loan application has been approved ✅.\r\n\r\nYour loan is now awaiting disbursement, and you will receive a notification once the funds have been released to your account.\r\n\r\nThank you for choosing us. We’re excited to support your financial journey!\r\n            \r\n            Best regards,Demo Microfinance Ltd', 1, '2025-07-01 13:37:14');

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
(1, 1, 'Main Office', 'Demo road', '', '2025-06-06 19:54:43');

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
(62, 11, 'Add New Client', 'add_customer', 0),
(63, 11, 'Customer List', 'customer_list', 0),
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
(79, 11, 'Edit Customer Info', 'edit_customer_info', 0),
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
(115, 11, 'Merge Customer Files', 'merge_files', 0),
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
(151, 10, 'Update Ledger', 'update_ledger', 0),
(152, 11, 'Verify Kyc', 'verify_kyc', 0),
(153, 12, 'Update Details', 'update_my_details', 0),
(154, 12, 'Upload Kyc', 'upload_kyc', 0),
(155, 12, 'Update Photo', 'update_my_photo', 0),
(156, 12, 'Notifications', 'notifications', 0),
(157, 13, 'Loan Products', 'loan_products', 0),
(158, 12, 'Apply For A Loan', 'apply_loan', 0),
(159, 13, 'Apply For A Loan', 'apply_loan_customer', 0),
(160, 12, 'Loan Status', 'loan_status', 0),
(161, 13, 'Loan Applications', 'pending_applications', 0);

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
(8, 'IKPEFUA KELLY', '07068897068', 'Client', '$2y$10$XmlBV8k.A7XRVkuG.Ipq6Ojr1sq8uTbBUmYceMFPXcTfpLgiosMkK', 0, 1, '2025-06-09 14:21:04'),
(10, 'IKPEFUA VICTORY', '09012345678', 'Client', '$2y$10$6Gx.GseolPz6HoOFTdd2IekSC.FHe4PqH43j6cIEcCGVn4oEMtuCG', 0, 1, '2025-06-09 15:19:33');

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
-- Indexes for table `kyc`
--
ALTER TABLE `kyc`
  ADD PRIMARY KEY (`kyc_id`);

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
-- Indexes for table `loan_applications`
--
ALTER TABLE `loan_applications`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `loan_products`
--
ALTER TABLE `loan_products`
  ADD PRIMARY KEY (`product_id`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

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
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `asset_locations`
--
ALTER TABLE `asset_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `asset_postings`
--
ALTER TABLE `asset_postings`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2421;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cash_flows`
--
ALTER TABLE `cash_flows`
  MODIFY `fow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

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
  MODIFY `cost_of_sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `customer_trail`
--
ALTER TABLE `customer_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

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
  MODIFY `deposit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `depreciation`
--
ALTER TABLE `depreciation`
  MODIFY `depreciation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `director_posting`
--
ALTER TABLE `director_posting`
  MODIFY `director_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `disposed_assets`
--
ALTER TABLE `disposed_assets`
  MODIFY `disposed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_heads`
--
ALTER TABLE `expense_heads`
  MODIFY `exp_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `finance_cost`
--
ALTER TABLE `finance_cost`
  MODIFY `finance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

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
-- AUTO_INCREMENT for table `kyc`
--
ALTER TABLE `kyc`
  MODIFY `kyc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `ledger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan_applications`
--
ALTER TABLE `loan_applications`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `loan_products`
--
ALTER TABLE `loan_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `multiple_payments`
--
ALTER TABLE `multiple_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `opening_balance`
--
ALTER TABLE `opening_balance`
  MODIFY `balance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `other_income`
--
ALTER TABLE `other_income`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

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
  MODIFY `sub_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1258;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `waybills`
--
ALTER TABLE `waybills`
  MODIFY `waybill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
