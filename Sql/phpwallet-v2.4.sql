-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2019 at 11:55 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpwallet`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(2, NULL, 1, 'Category 2', 'category-2', '2018-05-20 12:47:50', '2018-05-20 12:47:50');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `created_at`, `updated_at`, `code`) VALUES
(1, 'Us Dollar', '$', '2018-07-01 15:13:00', '2018-07-01 15:23:02', 'USD'),
(2, 'Euro', '€', '2018-07-01 15:12:00', '2018-07-01 15:24:38', 'EUR'),
(4, 'Brasilian Reais', '‎R$', '2018-07-01 15:13:00', '2018-07-01 15:22:48', 'BRL'),
(5, 'Indian Rupee', '₹', '2018-07-01 15:16:00', '2018-07-01 15:21:57', 'INR'),
(6, 'Bitcoin', '(BTC)', '2018-07-03 23:20:42', '2018-07-03 23:20:42', 'BTC'),
(7, 'Ethereum', '( ETH )', '2018-07-05 17:02:00', '2018-07-05 18:50:52', 'ETH'),
(9, 'Argentinian Peso', '$', '2018-08-28 05:18:55', '2018-08-28 05:18:55', 'ARS');

-- --------------------------------------------------------

--
-- Table structure for table `currency_deposit_methods`
--

CREATE TABLE `currency_deposit_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `deposit_method_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency_deposit_methods`
--

INSERT INTO `currency_deposit_methods` (`id`, `currency_id`, `deposit_method_id`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '2018-07-04 13:41:01', '2018-07-04 13:41:01'),
(4, 2, 1, '2018-07-04 14:08:28', '2018-07-04 14:08:28'),
(5, 4, 1, '2018-07-04 14:20:55', '2018-07-04 14:20:55'),
(6, 5, 1, '2018-07-04 14:21:10', '2018-07-04 14:21:10'),
(9, 6, 1, '2018-07-04 14:21:00', '2018-07-05 17:38:19'),
(10, 7, 2, '2018-07-05 18:21:21', '2018-07-05 18:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `currency_exchange_rates`
--

CREATE TABLE `currency_exchange_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_currency_id` int(11) NOT NULL,
  `second_currency_id` int(11) NOT NULL,
  `exchanges_to_second_currency_value` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency_exchange_rates`
--

INSERT INTO `currency_exchange_rates` (`id`, `first_currency_id`, `second_currency_id`, `exchanges_to_second_currency_value`, `created_at`, `updated_at`) VALUES
(6, 6, 1, 6260.3, '2018-07-14 21:52:22', '2018-07-14 21:52:22'),
(7, 1, 6, 0.00016, '2018-07-14 21:54:09', '2018-07-14 21:54:09'),
(8, 9, 1, 31.7, '2018-08-28 05:20:37', '2018-08-28 05:20:37'),
(9, 1, 9, 39.93, '2018-08-28 05:21:00', '2018-09-15 17:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `currency_withdrawal_methods`
--

CREATE TABLE `currency_withdrawal_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `withdrawal_method_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency_withdrawal_methods`
--

INSERT INTO `currency_withdrawal_methods` (`id`, `currency_id`, `withdrawal_method_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-07-04 15:12:29', '2018-07-04 15:12:29'),
(2, 2, 1, '2018-07-04 15:12:43', '2018-07-04 15:12:43'),
(3, 4, 1, '2018-07-04 15:12:52', '2018-07-04 15:12:52'),
(4, 5, 1, '2018-07-04 15:13:06', '2018-07-04 15:13:06'),
(5, 6, 1, '2018-07-04 15:13:16', '2018-07-04 15:13:16'),
(6, 9, 1, '2018-08-28 05:27:17', '2018-08-28 05:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 0, 0, 0, 0, 0, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(22, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, NULL, 9),
(23, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(24, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(25, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(26, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 4),
(27, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(28, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '', 6),
(29, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7),
(30, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(31, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '', 2),
(32, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '', 3),
(33, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 4),
(34, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, '', 5),
(35, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 6),
(36, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(37, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(38, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, '', 9),
(39, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '', 10),
(40, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(41, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 12),
(42, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 13),
(43, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, '', 14),
(44, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '', 15),
(45, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(46, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '', 2),
(47, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 3),
(48, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, '', 4),
(49, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 5),
(50, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(51, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, '', 7),
(52, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '', 8),
(53, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(54, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, '', 10),
(55, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '', 11),
(56, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '', 12),
(57, 7, 'id', 'hidden', 'Id', 1, 1, 1, 1, 0, 0, NULL, 1),
(58, 7, 'user_id', 'hidden', 'User Id', 1, 0, 0, 1, 0, 0, NULL, 4),
(59, 7, 'transaction_state_id', 'hidden', 'Transaction State Id', 1, 0, 1, 1, 0, 0, NULL, 5),
(60, 7, 'withdrawal_method_id', 'hidden', 'Withdrawal Method Id', 1, 0, 0, 0, 0, 0, NULL, 6),
(61, 7, 'gross', 'text', 'Gross', 1, 1, 1, 0, 0, 0, NULL, 7),
(62, 7, 'fee', 'hidden', 'Fee', 1, 1, 1, 0, 0, 0, NULL, 8),
(63, 7, 'net', 'hidden', 'Net', 1, 1, 1, 0, 0, 0, NULL, 9),
(64, 7, 'platform_id', 'hidden', 'Platform Id', 1, 1, 1, 0, 0, 0, NULL, 10),
(65, 7, 'json_data', 'hidden', 'Json Data', 0, 0, 0, 0, 0, 0, NULL, 11),
(66, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(67, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(68, 7, 'withdrawal_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 0, 0, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(69, 7, 'withdrawal_belongsto_withdrawal_method_relationship', 'relationship', 'Withdrawal Method', 0, 1, 1, 1, 0, 0, '{\"model\":\"App\\\\Models\\\\WithdrawalMethod\",\"table\":\"withdrawal_methods\",\"type\":\"belongsTo\",\"column\":\"withdrawal_method_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(70, 7, 'withdrawal_belongsto_transaction_state_relationship', 'relationship', 'transaction_states', 0, 1, 1, 1, 0, 0, '{\"model\":\"App\\\\Models\\\\TransactionState\",\"table\":\"transaction_states\",\"type\":\"belongsTo\",\"column\":\"transaction_state_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(71, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(72, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(73, 8, 'comment', 'rich_text_box', 'Comment', 1, 1, 1, 1, 1, 1, NULL, 3),
(74, 8, 'percentage_fee', 'number', 'Percentage Fee', 1, 1, 1, 1, 1, 1, NULL, 4),
(75, 8, 'fixed_fee', 'number', 'Fixed Fee', 1, 1, 1, 1, 1, 1, NULL, 5),
(76, 8, 'json_data', 'text', 'Json Data', 0, 1, 1, 1, 1, 1, NULL, 6),
(77, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 7),
(78, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 8),
(79, 9, 'id', 'hidden', 'Id', 1, 1, 1, 1, 0, 0, NULL, 2),
(80, 9, 'user_id', 'hidden', 'User Id', 1, 1, 1, 1, 0, 0, NULL, 4),
(81, 9, 'transaction_state_id', 'hidden', 'Transaction State Id', 1, 0, 0, 1, 0, 0, NULL, 5),
(82, 9, 'deposit_method_id', 'hidden', 'Deposit Method Id', 1, 0, 0, 1, 0, 0, NULL, 6),
(83, 9, 'gross', 'text', 'Gross', 1, 1, 1, 1, 0, 0, NULL, 7),
(84, 9, 'fee', 'text', 'Fee', 1, 1, 1, 0, 0, 0, NULL, 8),
(85, 9, 'net', 'text', 'Net', 1, 1, 1, 0, 0, 0, NULL, 9),
(86, 9, 'transaction_receipt', 'image', 'Transaction Receipt', 0, 1, 1, 0, 0, 0, NULL, 10),
(87, 9, 'json_data', 'hidden', 'Json Data', 0, 0, 0, 0, 0, 0, NULL, 11),
(88, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 12),
(89, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(90, 10, 'id', 'text', 'Id', 1, 1, 1, 1, 0, 0, NULL, 1),
(91, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(92, 10, 'how_to', 'rich_text_box', 'How To', 1, 1, 1, 1, 1, 1, NULL, 3),
(93, 10, 'json_data', 'hidden', 'Json Data', 0, 1, 1, 1, 1, 1, NULL, 4),
(94, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(95, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(96, 11, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 0, NULL, 1),
(97, 11, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(98, 11, 'json_data', 'hidden', 'Json Data', 0, 1, 1, 1, 1, 1, NULL, 3),
(99, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(100, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(102, 1, 'last_name', 'text', 'Last Name', 0, 1, 1, 1, 1, 1, NULL, 5),
(103, 1, 'verified', 'text', 'Verified', 1, 1, 1, 1, 1, 1, NULL, 9),
(104, 1, 'merchant', 'text', 'Merchant', 1, 1, 1, 1, 1, 1, NULL, 10),
(106, 1, 'social', 'text', 'Social', 1, 1, 1, 1, 1, 1, NULL, 12),
(107, 1, 'balance', 'text', 'Balance', 1, 1, 1, 1, 1, 1, NULL, 13),
(108, 1, 'json_data', 'text', 'Json Data', 0, 1, 1, 1, 1, 1, NULL, 14),
(109, 1, 'account_status', 'text', 'Account Status', 1, 1, 1, 1, 1, 1, NULL, 15),
(110, 1, 'ticketit_admin', 'text', 'Ticketit Admin', 1, 1, 1, 1, 1, 1, NULL, 20),
(111, 1, 'ticketit_agent', 'text', 'Ticketit Agent', 1, 1, 1, 1, 1, 1, NULL, 21),
(112, 12, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, NULL, 1),
(113, 12, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, NULL, 4),
(114, 12, 'request_id', 'text', 'Request Id', 0, 1, 1, 1, 1, 1, NULL, 5),
(115, 12, 'transactionable_id', 'text', 'Transactionable Id', 1, 1, 1, 1, 1, 1, NULL, 6),
(116, 12, 'transactionable_type', 'text', 'Transactionable Type', 1, 1, 1, 1, 1, 1, NULL, 7),
(117, 12, 'entity_id', 'text', 'Entity Id', 1, 1, 1, 1, 1, 1, NULL, 8),
(118, 12, 'entity_name', 'text', 'Entity Name', 1, 1, 1, 1, 1, 1, NULL, 9),
(119, 12, 'transaction_state_id', 'text', 'Transaction State Id', 1, 1, 1, 1, 1, 1, NULL, 10),
(120, 12, 'currency', 'text', 'Currency', 1, 1, 1, 1, 1, 1, NULL, 11),
(121, 12, 'activity_title', 'text', 'Activity Title', 1, 1, 1, 1, 1, 1, NULL, 12),
(122, 12, 'money_flow', 'text', 'Money Flow', 1, 1, 1, 1, 1, 1, NULL, 13),
(123, 12, 'gross', 'text', 'Gross', 1, 1, 1, 1, 1, 1, NULL, 14),
(124, 12, 'fee', 'text', 'Fee', 1, 1, 1, 1, 1, 1, NULL, 15),
(125, 12, 'net', 'text', 'Net', 1, 1, 1, 1, 1, 1, NULL, 16),
(126, 12, 'balance', 'text', 'Balance', 0, 1, 1, 1, 1, 1, NULL, 17),
(127, 12, 'json_data', 'text', 'Json Data', 0, 1, 1, 1, 1, 1, NULL, 18),
(128, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 19),
(129, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 20),
(130, 12, 'transactionable_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(131, 12, 'transactionable_belongsto_category_relationship', 'relationship', 'Transaction State', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\TransactionState\",\"table\":\"transaction_states\",\"type\":\"belongsTo\",\"column\":\"transaction_state_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(132, 9, 'deposit_belongsto_transaction_state_relationship', 'relationship', 'transaction state', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\TransactionState\",\"table\":\"transaction_states\",\"type\":\"belongsTo\",\"column\":\"transaction_state_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(133, 13, 'id', 'text', 'Id', 1, 1, 1, 1, 0, 0, NULL, 2),
(134, 13, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, NULL, 3),
(135, 13, 'merchant_key', 'text', 'Merchant Key', 1, 1, 1, 1, 1, 1, NULL, 4),
(136, 13, 'site_url', 'text', 'Site Url', 1, 1, 1, 1, 1, 1, NULL, 5),
(137, 13, 'success_link', 'text', 'Success Link', 1, 1, 1, 1, 1, 1, NULL, 6),
(138, 13, 'fail_link', 'text', 'Fail Link', 1, 1, 1, 1, 1, 1, NULL, 7),
(139, 13, 'logo', 'hidden', 'Logo', 0, 1, 1, 1, 1, 1, NULL, 8),
(140, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 9),
(141, 13, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, NULL, 10),
(142, 13, 'json_data', 'hidden', 'Json Data', 0, 1, 1, 1, 1, 1, NULL, 11),
(143, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 12),
(144, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(145, 13, 'merchant_belongsto_user_relationship', 'relationship', 'user', 0, 1, 1, 0, 0, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 1),
(146, 15, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, NULL, 1),
(147, 15, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(148, 15, 'symbol', 'text', 'Symbol', 0, 1, 1, 1, 1, 1, NULL, 3),
(160, 18, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, NULL, 1),
(161, 18, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(162, 18, 'symbol', 'text', 'Symbol', 0, 1, 1, 1, 1, 1, NULL, 3),
(163, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(164, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(165, 18, 'code', 'text', 'Code', 0, 1, 1, 1, 1, 1, NULL, 4),
(172, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(173, 19, 'first_currency_id', 'hidden', 'First Currency Id', 1, 1, 1, 1, 1, 1, NULL, 4),
(174, 19, 'second_currency_id', 'hidden', 'Second Currency Id', 1, 1, 1, 1, 1, 1, NULL, 5),
(176, 19, 'exchanges_to_second_currency_value', 'text', 'One ( 1 ) first currency exchanges to second currency value', 1, 1, 1, 1, 1, 1, NULL, 7),
(177, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 8),
(178, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 9),
(179, 19, 'currency_exchange_rate_belongsto_currency_relationship', 'relationship', 'First Currency', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Currency\",\"table\":\"currencies\",\"type\":\"belongsTo\",\"column\":\"first_currency_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(180, 19, 'currency_exchange_rate_belongsto_currency_relationship_1', 'relationship', 'Second Currency', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Currency\",\"table\":\"currencies\",\"type\":\"belongsTo\",\"column\":\"second_currency_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(181, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(182, 21, 'user_id', 'text', 'User Id', 1, 1, 1, 0, 0, 0, NULL, 5),
(183, 21, 'currency_id', 'text', 'Currency Id', 1, 1, 1, 1, 1, 1, NULL, 6),
(184, 21, 'amount', 'text', 'Amount', 0, 1, 1, 1, 1, 1, NULL, 7),
(185, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 8),
(186, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 10),
(187, 21, 'wallet_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(188, 21, 'wallet_belongsto_currency_relationship', 'relationship', 'Wallet Currency', 0, 1, 1, 0, 1, 1, '{\"model\":\"App\\\\Models\\\\Currency\",\"table\":\"currencies\",\"type\":\"belongsTo\",\"column\":\"currency_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(191, 9, 'currency_id', 'hidden', 'Currency Id', 0, 1, 1, 1, 1, 1, NULL, 14),
(192, 9, 'currency_symbol', 'text', 'Currency Symbol', 0, 1, 1, 1, 1, 1, NULL, 15),
(193, 9, 'wallet_id', 'text', 'Wallet Id', 0, 1, 1, 1, 1, 1, NULL, 16),
(194, 9, 'deposit_belongsto_wallet_relationship', 'relationship', 'wallet', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Wallet\",\"table\":\"wallets\",\"type\":\"belongsTo\",\"column\":\"wallet_id\",\"key\":\"id\",\"label\":\"currency_id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 1),
(195, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(196, 23, 'currency_id', 'text', 'Currency Id', 0, 1, 1, 1, 1, 1, NULL, 2),
(197, 23, 'deposit_method_id', 'text', 'Deposit Method Id', 0, 1, 1, 1, 1, 1, NULL, 3),
(198, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(199, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(200, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(201, 24, 'currency_id', 'hidden', 'Currency Id', 0, 1, 1, 1, 1, 1, NULL, 2),
(202, 24, 'deposit_method_id', 'hidden', 'Deposit Method Id', 0, 1, 1, 1, 1, 1, NULL, 3),
(203, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(204, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(205, 24, 'currencie_deposit_belongsto_currency_relationship', 'relationship', 'currencies', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Currency\",\"table\":\"currencies\",\"type\":\"belongsTo\",\"column\":\"currency_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(206, 24, 'currencie_deposit_belongsto_deposit_method_relationship', 'relationship', 'deposit_methods', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\DepositMethod\",\"table\":\"deposit_methods\",\"type\":\"belongsTo\",\"column\":\"deposit_method_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(207, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(208, 25, 'currency_id', 'hidden', 'Currency Id', 0, 1, 1, 1, 1, 1, NULL, 2),
(209, 25, 'deposit_method_id', 'hidden', 'Deposit Method Id', 0, 1, 1, 1, 1, 1, NULL, 3),
(210, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(211, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(212, 25, 'currency_deposit_method_belongsto_currency_relationship', 'relationship', 'currencies', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Currency\",\"table\":\"currencies\",\"type\":\"belongsTo\",\"column\":\"currency_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(213, 25, 'currency_deposit_method_belongsto_deposit_method_relationship', 'relationship', 'deposit_methods', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\DepositMethod\",\"table\":\"deposit_methods\",\"type\":\"belongsTo\",\"column\":\"deposit_method_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 7),
(214, 28, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(215, 28, 'currency_id', 'hidden', 'Currency Id', 0, 0, 0, 1, 1, 1, NULL, 4),
(216, 28, 'deposit_method_id', 'hidden', 'Deposit Method Id', 0, 0, 0, 1, 1, 1, NULL, 5),
(217, 28, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(218, 28, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(219, 29, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(220, 29, 'currency_id', 'hidden', 'Currency Id', 0, 1, 1, 1, 1, 1, NULL, 4),
(222, 29, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(223, 29, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(224, 29, 'currency_withdrawal_method_belongsto_currency_relationship', 'relationship', 'currencies', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Currency\",\"table\":\"currencies\",\"type\":\"belongsTo\",\"column\":\"currency_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(225, 29, 'currency_withdrawal_method_belongsto_withdrawal_method_relationship', 'relationship', 'withdrawal_methods', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\WithdrawalMethod\",\"table\":\"withdrawal_methods\",\"type\":\"belongsTo\",\"column\":\"withdrawal_method_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(227, 28, 'currency_deposit_method_belongsto_currency_relationship_1', 'relationship', 'currencies', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Currency\",\"table\":\"currencies\",\"type\":\"belongsTo\",\"column\":\"currency_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(228, 28, 'currency_deposit_method_belongsto_deposit_method_relationship_1', 'relationship', 'deposit_methods', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\DepositMethod\",\"table\":\"deposit_methods\",\"type\":\"belongsTo\",\"column\":\"deposit_method_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(229, 29, 'withdrawal_method_id', 'text', 'Withdrawal Method Id', 0, 1, 1, 1, 1, 1, NULL, 5),
(230, 12, 'currency_id', 'text', 'Currency Id', 0, 1, 1, 1, 1, 1, NULL, 19),
(231, 12, 'currency_symbol', 'text', 'Currency Symbol', 0, 1, 1, 1, 1, 1, NULL, 20),
(232, 7, 'withdrawal_belongsto_currency_relationship', 'relationship', 'currency', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Currency\",\"table\":\"currencies\",\"type\":\"belongsTo\",\"column\":\"currency_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(233, 7, 'currency_id', 'hidden', 'Currency Id', 0, 1, 1, 1, 1, 1, NULL, 14),
(234, 7, 'currency_symbol', 'hidden', 'Currency Symbol', 0, 1, 1, 1, 1, 1, NULL, 15),
(235, 30, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(236, 30, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(237, 30, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(238, 30, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(239, 9, 'message', 'hidden', 'Message', 0, 1, 1, 1, 1, 1, NULL, 15),
(240, 7, 'wallet_id', 'hidden', 'Wallet Id', 0, 1, 1, 1, 1, 1, NULL, 14),
(241, 31, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, NULL, 1),
(242, 31, 'user_id', 'text', 'User Id', 0, 1, 1, 0, 0, 0, NULL, 2),
(243, 31, 'voucher_amount', 'text', 'Voucher Amount', 1, 1, 1, 0, 0, 0, NULL, 3),
(244, 31, 'voucher_code', 'text', 'Voucher Code', 1, 1, 1, 0, 0, 0, NULL, 4),
(245, 31, 'json_data', 'text', 'Json Data', 0, 1, 1, 0, 0, 0, NULL, 5),
(246, 31, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(247, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(248, 31, 'currency_id', 'text', 'Currency Id', 0, 1, 1, 0, 0, 0, NULL, 8),
(249, 31, 'currency_symbol', 'text', 'Currency Symbol', 0, 1, 1, 0, 0, 0, NULL, 9),
(250, 31, 'user_loader', 'text', 'User Loader', 0, 1, 1, 0, 0, 0, NULL, 10),
(251, 31, 'is_loaded', 'text', 'Is Loaded', 0, 1, 1, 0, 0, 0, NULL, 11),
(252, 31, 'voucher_fee', 'text', 'Voucher Fee', 0, 1, 1, 0, 0, 0, NULL, 12),
(253, 31, 'wallet_id', 'text', 'Wallet Id', 0, 1, 1, 0, 0, 0, NULL, 13),
(254, 31, 'voucher_value', 'text', 'Voucher Value', 0, 1, 1, 0, 0, 0, NULL, 14),
(255, 1, 'first_name', 'text', 'First Name', 0, 1, 1, 1, 1, 1, NULL, 4),
(256, 1, 'currency_id', 'text', 'Currency Id', 0, 1, 1, 1, 1, 1, NULL, 21),
(257, 1, 'is_ticket_admin', 'text', 'Is Ticket Admin', 0, 1, 1, 1, 1, 1, NULL, 22),
(258, 1, 'verification_token', 'text', 'Verification Token', 0, 1, 1, 1, 1, 1, NULL, 23),
(259, 13, 'currency_id', 'text', 'Currency Id', 0, 1, 1, 1, 1, 1, NULL, 13);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-05-20 12:47:48', '2018-12-14 14:52:37'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(7, 'withdrawals', 'withdrawals', 'Withdrawal', 'Withdrawals', 'voyager-external', 'App\\Models\\Withdrawal', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-05-21 05:25:46', '2019-02-25 19:16:47'),
(8, 'withdrawal_methods', 'withdrawal-methods', 'Withdrawal Method', 'Withdrawal Methods', 'voyager-pie-chart', 'App\\Models\\WithdrawalMethod', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-05-21 05:34:39', '2018-05-21 05:34:39'),
(9, 'deposits', 'deposits', 'Deposit', 'Deposits', 'voyager-book', 'App\\Models\\Deposit', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-05-21 05:51:52', '2019-02-25 19:17:12'),
(10, 'deposit_methods', 'deposit-methods', 'Deposit Method', 'Deposit Methods', 'voyager-paypal', 'App\\Models\\DepositMethod', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-05-21 05:59:16', '2018-05-21 05:59:56'),
(11, 'transaction_states', 'transaction-states', 'Transaction State', 'Transaction States', 'voyager-check', 'App\\Models\\TransactionState', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-05-21 06:15:47', '2018-05-21 06:15:47'),
(12, 'transactionable', 'transactionable', 'Transaction', 'Transactions', 'voyager-dollar', 'App\\Models\\Transaction', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-06-15 14:31:29', '2018-09-24 16:58:20'),
(13, 'merchants', 'merchants', 'Merchant', 'Merchants', 'voyager-credit-card', 'App\\Models\\Merchant', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-06-21 13:30:20', '2019-02-25 19:19:16'),
(15, 'currencys', 'currencys', 'Currency', 'Currencies', 'voyager-diamond', 'App\\Models\\Currency', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-01 14:52:25', '2018-07-01 14:52:25'),
(18, 'currencies', 'currencies', 'Currency', 'Currencies', 'voyager-list-add', 'App\\Models\\Currency', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-01 15:20:20', '2018-07-01 15:20:20'),
(19, 'currency_exchange_rates', 'currency-exchange-rates', 'Currency Exchange Rate', 'Currency Exchange Rates', 'vayager-lab', 'App\\Models\\CurrencyExchangeRate', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-01 16:03:17', '2018-07-01 16:03:17'),
(21, 'wallets', 'wallets', 'Wallet', 'Wallets', 'voyager-wallet', 'App\\Models\\Wallet', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-01 16:34:40', '2018-12-14 12:47:46'),
(23, 'currency_depositmethod', 'currency-depositmethod', 'Currency By Deposit', 'Currency By Deposit', NULL, 'App\\Models\\CurrencyDeposit', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-04 00:34:44', '2018-07-04 13:11:56'),
(24, 'currencie_deposit', 'currencie-deposit', 'Currencie Deposit', 'Currencie Deposits', NULL, 'App\\Models\\CurrencyDeposit', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-04 13:17:25', '2018-07-04 13:17:25'),
(25, 'currency_deposit_method', 'currency-deposit-method', 'Currency Deposit Method', 'Currency Deposit Methods', NULL, 'App\\Models\\CurrencyDepositMethod', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-04 13:34:24', '2018-07-04 13:34:24'),
(28, 'currency_deposit_methods', 'currency-deposit-methods', 'Currency Deposit Method', 'Currency Deposit Methods', NULL, 'App\\Models\\CurrencyDepositMethod', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-04 14:49:54', '2018-07-04 14:49:54'),
(29, 'currency_withdrawal_methods', 'currency-withdrawal-methods', 'Currency Withdrawal Method', 'Currency Withdrawal Methods', NULL, 'App\\Models\\CurrencyWithdrawalMethod', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-04 14:57:35', '2018-07-04 14:57:35'),
(30, 'ticketcategories', 'ticketcategories', 'Ticketcategory', 'Ticketcategories', 'voyager-ticket', 'App\\Models\\Ticketcategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-19 22:41:21', '2018-07-19 22:42:09'),
(31, 'vouchers', 'vouchers', 'Voucher', 'Vouchers', 'voyager-treasure', 'App\\Models\\Voucher', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-16 13:35:48', '2019-02-25 19:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_state_id` int(11) NOT NULL,
  `deposit_method_id` int(11) NOT NULL,
  `gross` double(8,2) NOT NULL,
  `fee` double(8,2) NOT NULL,
  `net` double(8,2) NOT NULL,
  `transaction_receipt` text COLLATE utf8mb4_unicode_ci,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_methods`
--

CREATE TABLE `deposit_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `how_to` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposit_methods`
--

INSERT INTO `deposit_methods` (`id`, `name`, `how_to`, `json_data`, `created_at`, `updated_at`) VALUES
(1, 'PayPal', '<p>Log in to your <a title=\"paypal\" href=\"https://paypal.com\" target=\"_blank\" rel=\"noopener noreferrer\">PayPal</a> account and send money to <strong>meticoin@gmail.com</strong> then make a creenshot of the transaction receipt and upload the screenshoot in the field below.</p>', NULL, '2018-05-21 06:05:00', '2018-05-22 10:44:17'),
(2, 'myetherwallet', '<p>Please create an ethereum wallet in <a href=\"https://www.myetherwallet.com/\">https://www.myetherwallet.com/</a>&nbsp;and send the amount you want to deposit to your phpWallet Ethereum then send a screenshot of the transaction receipt to the upload field below.</p>', NULL, '2018-07-05 18:20:47', '2018-07-05 18:20:47'),
(3, 'MercadoPago', '<div class=\"s-payments__methods-container\" style=\"box-sizing: border-box; margin: 0px auto; max-width: 54em; color: #333333; font-family: \'Proxima Nova\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px;\">\r\n<h2 class=\"s-payments__title\" style=\"box-sizing: border-box; margin: 0px 0px 2.08824em; font-weight: 400; color: #2d3277; font-size: 2.125em; line-height: 1.11765; max-width: 10.2941em;\">Us&aacute; el medio de pago que prefieras</h2>\r\n<div class=\"s-payments__methods\" style=\"box-sizing: border-box; display: flex; -webkit-box-orient: horizontal; -webkit-box-direction: normal; flex-flow: row wrap;\">\r\n<div class=\"s-payments__credit-cards\" style=\"box-sizing: border-box; width: 864px;\">\r\n<div class=\"ui-payment-methods  mla\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ui-payment-methods__title\" style=\"box-sizing: border-box; margin: 0px 0.85714em 1.85714em 0px; font-weight: 400; display: inline-block; color: #7a8899; font-size: 0.875em; letter-spacing: 0.07143em; line-height: 1.28571em; text-transform: uppercase;\">TARJETAS DE CR&Eacute;DITO</h4>\r\n<span class=\"ui-payment-methods__highlighted-text\" style=\"box-sizing: border-box; display: inline-block; background-color: #2ec74b; border-radius: 0.15385em; color: #ffffff; font-size: 12px; padding: 0.29167em 0.83333em; line-height: 1.5; text-align: center; margin: 0px 1em 1.83333em 0px;\">Hasta 12 cuotas</span>\r\n<ul class=\"ui-payment-methods__list\" style=\"box-sizing: border-box; margin: 0px -1.0625em 0px 0px; padding: 0px; list-style: none;\">\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-visa paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -49px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); width: 63px; height: 21px;\">visa</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-master paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -100px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 36px; width: 46px;\">master</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-amex paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -150px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 27px; width: 26px;\">amex</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-mercadopago_cc paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -1049px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 27px; width: 38px;\">mercadopago_cc</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-naranja paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -300px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 34px; width: 24px;\">naranja</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-nativa paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -350px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 27px; width: 58px;\">nativa</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-tarshop paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -400px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); width: 42px; height: 27px;\">tarshop</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-cabal\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 2px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -500px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-default.png\'); height: 17px; width: 52px;\">cabal</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-diners\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 2px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -200px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-default.png\'); height: 16px; width: 62px;\">diners</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-argencard paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -550px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 28px; width: 28px;\">argencard</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-cordial paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -900px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 25px; width: 38px;\">cordial</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-cordobesa paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 0px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -998px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 18px; width: 64px;\">cordobesa</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-cmr paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -949px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 31px; width: 42px;\">cmr</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"s-payments__debit-cards\" style=\"box-sizing: border-box; margin-top: 2.9375em; width: 432px;\">\r\n<div class=\"ui-payment-methods payments-section__cash-debit--debit mla\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ui-payment-methods__title\" style=\"box-sizing: border-box; margin: 0px 0.85714em 1.85714em 0px; font-weight: 400; display: inline-block; color: #7a8899; font-size: 0.875em; letter-spacing: 0.07143em; line-height: 1.28571em; text-transform: uppercase;\">TARJETAS DE D&Eacute;BITO</h4>\r\n<ul class=\"ui-payment-methods__list\" style=\"box-sizing: border-box; margin: 0px -1.0625em 0px 0px; padding: 0px; list-style: none;\">\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-debvisa\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 2px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -1248px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-default.png\'); width: 58px; height: 16px;\">debvisa</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-debmaster\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 2px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -1148px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-default.png\'); height: 26px; width: 49px;\">debmaster</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-maestro\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 2px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -1197px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-default.png\'); height: 25px; width: 30px;\">maestro</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-debcabal\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 2px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -1298px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-default.png\'); height: 24px; width: 52px;\">debcabal</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"s-payments__cash\" style=\"box-sizing: border-box; margin-top: 2.9375em; width: 432px;\">\r\n<div class=\"ui-payment-methods payments-section__cash-debit--cash mla\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ui-payment-methods__title\" style=\"box-sizing: border-box; margin: 0px 0.85714em 1.85714em 0px; font-weight: 400; display: inline-block; color: #7a8899; font-size: 0.875em; letter-spacing: 0.07143em; line-height: 1.28571em; text-transform: uppercase;\">EN EFECTIVO</h4>\r\n<ul class=\"ui-payment-methods__list\" style=\"box-sizing: border-box; margin: 0px -1.0625em 0px 0px; padding: 0px; list-style: none;\">\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-pagofacil paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -600px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 31px; width: 31px;\">pagofacil</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-rapipago\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 2px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -650px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-default.png\'); height: 11px; width: 56px;\">rapipago</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-cobroexpress\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 2px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -1448px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-default.png\'); height: 16px; width: 58px;\">cobroexpress</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-redlink paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -700px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 31px; width: 31px;\">redlink</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-bapropagos\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 2px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -800px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-default.png\'); width: 54px; height: 24px;\">bapropagos</span></li>\r\n<li class=\"ui-payment-methods__item\" style=\"box-sizing: border-box; background-color: #f7f7f7; border-radius: 0.125em; display: inline-block; height: 2.75em; line-height: 2.5625em; margin: 0px 1em 1em 0px; text-align: center; width: 4.5em;\"><span class=\"ui-payment-methods__icon paymentmethod paymentmethod-cargavirtual paymentmethod-large\" style=\"box-sizing: border-box; background-repeat: no-repeat; display: inline-block; margin: 5px; overflow: hidden; text-indent: 100%; vertical-align: middle; white-space: nowrap; background-position: 0px -849px; background-image: url(\'https://http2.mlstatic.com/secure/org-img/ui/payment-methods/1.7.5/ar/payment-methods-large.png\'); height: 33px; width: 32px;\">cargavirtual</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ui-box s-payments__banks\" style=\"box-sizing: border-box; padding: 4em 0px 4em 5.625em; display: flex; margin: 2em 0px 0px; box-shadow: rgba(155, 169, 187, 0.3) 0px 5px 10px 0px; border-radius: 0.25em; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; z-index: 3; position: relative; background-image: url(\'https://http2.mlstatic.com/resources/frontend/statics/buyers-landings/d09d769bb2a0e519b710539c075800f9.jpg\'); background-position: 111.5% 4px; background-size: 33%; max-width: 65em; background-repeat: no-repeat; -webkit-box-align: start; align-items: flex-start; color: #333333; font-family: \'Proxima Nova\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px;\">\r\n<div class=\"ui-box__body ui-box__body--left\" style=\"box-sizing: border-box; max-width: 37.6875em; -webkit-box-align: start; align-items: flex-start; margin-top: 0px;\">\r\n<h2 class=\"ui-box__title\" style=\"box-sizing: border-box; margin: 0px 0px 0.16667em; font-weight: 400; line-height: 1.16667;\">Pag&aacute; siempre en 6 cuotas sin inter&eacute;s</h2>\r\n</div>\r\n</div>', NULL, '2018-08-28 05:23:43', '2018-08-28 05:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `exchanges`
--

CREATE TABLE `exchanges` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_currency_id` int(11) DEFAULT NULL,
  `second_currency_id` int(11) DEFAULT NULL,
  `gross` double DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `net` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2018-05-20 12:47:48', '2018-05-20 12:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 2, '2018-05-20 12:47:48', '2018-07-04 13:14:57', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 18, '2018-05-20 12:47:48', '2018-09-16 13:38:44', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2018-05-20 12:47:48', '2018-07-04 13:14:57', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 17, '2018-05-20 12:47:48', '2018-09-16 13:38:44', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 1, '2018-05-20 12:47:48', '2018-07-04 13:14:57', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2018-05-20 12:47:48', '2018-06-21 13:31:38', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2018-05-20 12:47:48', '2018-06-21 13:31:38', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2018-05-20 12:47:48', '2018-06-21 13:31:38', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2018-05-20 12:47:48', '2018-06-21 13:31:38', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 3, '2018-05-20 12:47:48', '2018-07-04 13:14:57', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 20, '2018-05-20 12:47:50', '2018-09-16 13:38:44', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 19, '2018-05-20 12:47:50', '2018-09-16 13:38:44', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 21, '2018-05-20 12:47:50', '2018-09-16 13:38:44', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2018-05-20 12:47:51', '2018-06-21 13:31:38', 'voyager.hooks', NULL),
(15, 1, 'Withdrawals', '', '_self', 'voyager-external', NULL, NULL, 6, '2018-05-21 05:25:46', '2018-07-04 13:14:57', 'voyager.withdrawals.index', NULL),
(16, 1, 'Withdrawal Methods', '', '_self', 'voyager-pie-chart', NULL, NULL, 10, '2018-05-21 05:34:39', '2018-09-16 13:38:52', 'voyager.withdrawal-methods.index', NULL),
(17, 1, 'Deposits', '', '_self', 'voyager-book', NULL, NULL, 7, '2018-05-21 05:51:52', '2018-07-04 13:14:57', 'voyager.deposits.index', NULL),
(18, 1, 'Deposit Methods', '', '_self', 'voyager-paypal', '#000000', NULL, 11, '2018-05-21 05:59:16', '2018-09-16 13:38:52', 'voyager.deposit-methods.index', 'null'),
(19, 1, 'Transaction States', '', '_self', 'voyager-check', NULL, NULL, 12, '2018-05-21 06:15:47', '2018-09-16 13:38:52', 'voyager.transaction-states.index', NULL),
(20, 1, 'Transactions', '', '_self', 'voyager-dollar', NULL, NULL, 9, '2018-06-15 14:31:29', '2018-09-16 13:38:59', 'voyager.transactionable.index', NULL),
(21, 1, 'Merchants', '', '_self', 'voyager-credit-card', NULL, NULL, 5, '2018-06-21 13:30:20', '2018-07-04 13:14:57', 'voyager.merchants.index', NULL),
(23, 1, 'Currency Exchange Rates', '', '_self', 'voyager-lab', NULL, NULL, 14, '2018-07-01 14:54:04', '2018-09-16 13:38:44', 'voyager.currency-exchange-rates.index', NULL),
(25, 1, 'Currencies', '', '_self', 'voyager-list-add', NULL, NULL, 13, '2018-07-01 15:20:20', '2018-09-16 13:38:44', 'voyager.currencies.index', NULL),
(26, 1, 'Wallets', '', '_self', 'voyager-wallet', NULL, NULL, 15, '2018-07-01 16:34:40', '2018-09-16 13:38:44', 'voyager.wallets.index', NULL),
(30, 1, 'link Method to Currency', '', '_self', 'voyager-code', '#000000', 18, 2, '2018-07-04 14:49:54', '2018-07-05 18:07:22', 'voyager.currency-deposit-methods.index', 'null'),
(31, 1, 'Link Method to Currency', '', '_self', 'voyager-code', '#000000', 16, 2, '2018-07-04 14:57:35', '2018-07-09 15:03:45', 'voyager.currency-withdrawal-methods.index', 'null'),
(32, 1, 'Add Method', '', '_self', 'voyager-list-add', '#000000', 18, 1, '2018-07-05 18:05:56', '2018-07-05 18:06:06', 'voyager.deposit-methods.index', NULL),
(33, 1, 'Add Methods', '', '_self', 'voyager-list-add', '#000000', 16, 1, '2018-07-09 15:02:23', '2018-07-09 15:02:45', 'voyager.withdrawal-methods.index', NULL),
(34, 1, 'Ticket Categories', '', '_self', 'voyager-ticket', '#000000', NULL, 16, '2018-07-19 22:41:21', '2018-09-16 13:38:44', 'voyager.ticketcategories.index', 'null'),
(35, 1, 'Vouchers', '', '_self', 'voyager-treasure', NULL, NULL, 8, '2018-09-16 13:35:48', '2018-09-16 13:38:59', 'voyager.vouchers.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `merchant_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `success_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fail_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_07_22_123254_alter_users_table', 1),
(4, '2016_01_01_000000_add_voyager_user_fields', 1),
(5, '2016_01_01_000000_create_data_types_table', 1),
(6, '2016_05_19_173453_create_menu_table', 1),
(7, '2016_10_21_190000_create_roles_table', 1),
(8, '2016_10_21_190000_create_settings_table', 1),
(9, '2016_11_30_135954_create_permission_table', 1),
(10, '2016_11_30_141208_create_permission_role_table', 1),
(11, '2016_12_26_201236_data_types__add__server_side', 1),
(12, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(13, '2017_01_14_005015_create_translations_table', 1),
(14, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(15, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(16, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(17, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(18, '2017_08_05_000000_add_group_to_settings_table', 1),
(19, '2017_11_26_013050_add_user_role_relationship', 1),
(20, '2017_11_26_015000_create_user_roles_table', 1),
(21, '2018_01_18_055610_create_deposits_table', 1),
(22, '2018_01_18_055834_create_withdrawals_table', 1),
(23, '2018_01_18_060522_create_vouchers_table', 1),
(24, '2018_01_18_060828_create_sales_table', 1),
(25, '2018_01_18_060915_create_purchases_table', 1),
(26, '2018_01_18_060953_create_transactionable_table', 1),
(27, '2018_01_18_062513_create_deposit_methods_table', 1),
(28, '2018_01_18_063252_create_transaction_states_table', 1),
(29, '2018_01_18_063430_create_withdrawal_methods_table', 1),
(30, '2018_03_11_000000_add_user_settings', 1),
(31, '2018_03_14_000000_add_details_to_data_types_table', 1),
(32, '2018_03_16_000000_make_settings_value_nullable', 1),
(33, '2018_04_10_114839_create_merchants_table', 1),
(34, '2018_04_23_074708_create_sends_table', 1),
(35, '2018_04_23_074854_create_receives_table', 1),
(36, '2018_05_01_142738_create_requests_table', 1),
(37, '2015_07_22_115516_create_ticketit_tables', 2),
(38, '2015_09_29_123456_add_completed_at_column_to_ticketit_table', 2),
(39, '2015_10_08_123457_create_settings_table', 2),
(40, '2016_01_15_002617_add_htmlcontent_to_ticketit_and_comments', 2),
(41, '2016_01_15_040207_enlarge_settings_columns', 2),
(42, '2016_01_15_120557_add_indexes', 2),
(43, '2016_01_01_000000_create_pages_table', 3),
(44, '2016_01_01_000000_create_posts_table', 3),
(45, '2016_02_15_204651_create_categories_table', 3),
(46, '2017_04_11_000000_alter_post_nullable_fields_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(2, 1, 'Privacy Policy', 'Page Content', '<p>Page Content</p>', NULL, 'privacy-policy', 'Meta Description', 'Meta Keywords', 'ACTIVE', '2018-07-28 14:10:08', '2018-07-28 14:10:08'),
(3, 1, 'Terms of Use', 'Page Content', '<p>Page Content</p>', NULL, 'terms-of-use', 'Meta Description', 'Meta Keywords', 'ACTIVE', '2018-07-28 14:11:31', '2018-07-28 14:11:31'),
(4, 1, 'About Us', 'Excerpt', '<p>Page Content</p>', NULL, 'about-us', 'meta-description', 'meta-keywords', 'ACTIVE', '2018-07-28 14:13:47', '2018-07-28 14:13:47'),
(5, 1, 'FAQ', 'Excerpt', '<p>Body</p>', NULL, 'faq', 'meta-description', 'meta-keywords', 'INACTIVE', '2018-07-28 14:18:57', '2018-07-28 14:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('pswkta@fidelium10.com', '$2y$10$UEh/4K7g8H6eUyoWbazj4.zyxdlFXjVgZQ7bj5uvOKX9.Buf0IjtO', '2018-09-07 13:41:34');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(2, 'browse_bread', NULL, '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(3, 'browse_database', NULL, '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(4, 'browse_media', NULL, '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(5, 'browse_compass', NULL, '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(6, 'browse_menus', 'menus', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(7, 'read_menus', 'menus', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(8, 'edit_menus', 'menus', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(9, 'add_menus', 'menus', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(10, 'delete_menus', 'menus', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(11, 'browse_roles', 'roles', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(12, 'read_roles', 'roles', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(13, 'edit_roles', 'roles', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(14, 'add_roles', 'roles', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(15, 'delete_roles', 'roles', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(16, 'browse_users', 'users', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(17, 'read_users', 'users', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(18, 'edit_users', 'users', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(19, 'add_users', 'users', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(20, 'delete_users', 'users', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(21, 'browse_settings', 'settings', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(22, 'read_settings', 'settings', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(23, 'edit_settings', 'settings', '2018-05-20 12:47:49', '2018-05-20 12:47:49'),
(24, 'add_settings', 'settings', '2018-05-20 12:47:49', '2018-05-20 12:47:49'),
(25, 'delete_settings', 'settings', '2018-05-20 12:47:49', '2018-05-20 12:47:49'),
(26, 'browse_categories', 'categories', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(27, 'read_categories', 'categories', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(28, 'edit_categories', 'categories', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(29, 'add_categories', 'categories', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(30, 'delete_categories', 'categories', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(31, 'browse_posts', 'posts', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(32, 'read_posts', 'posts', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(33, 'edit_posts', 'posts', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(34, 'add_posts', 'posts', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(35, 'delete_posts', 'posts', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(36, 'browse_pages', 'pages', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(37, 'read_pages', 'pages', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(38, 'edit_pages', 'pages', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(39, 'add_pages', 'pages', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(40, 'delete_pages', 'pages', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(41, 'browse_hooks', NULL, '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(42, 'browse_withdrawals', 'withdrawals', '2018-05-21 05:25:46', '2018-05-21 05:25:46'),
(43, 'read_withdrawals', 'withdrawals', '2018-05-21 05:25:46', '2018-05-21 05:25:46'),
(44, 'edit_withdrawals', 'withdrawals', '2018-05-21 05:25:46', '2018-05-21 05:25:46'),
(45, 'add_withdrawals', 'withdrawals', '2018-05-21 05:25:46', '2018-05-21 05:25:46'),
(46, 'delete_withdrawals', 'withdrawals', '2018-05-21 05:25:46', '2018-05-21 05:25:46'),
(47, 'browse_withdrawal_methods', 'withdrawal_methods', '2018-05-21 05:34:39', '2018-05-21 05:34:39'),
(48, 'read_withdrawal_methods', 'withdrawal_methods', '2018-05-21 05:34:39', '2018-05-21 05:34:39'),
(49, 'edit_withdrawal_methods', 'withdrawal_methods', '2018-05-21 05:34:39', '2018-05-21 05:34:39'),
(50, 'add_withdrawal_methods', 'withdrawal_methods', '2018-05-21 05:34:39', '2018-05-21 05:34:39'),
(51, 'delete_withdrawal_methods', 'withdrawal_methods', '2018-05-21 05:34:39', '2018-05-21 05:34:39'),
(52, 'browse_deposits', 'deposits', '2018-05-21 05:51:52', '2018-05-21 05:51:52'),
(53, 'read_deposits', 'deposits', '2018-05-21 05:51:52', '2018-05-21 05:51:52'),
(54, 'edit_deposits', 'deposits', '2018-05-21 05:51:52', '2018-05-21 05:51:52'),
(55, 'add_deposits', 'deposits', '2018-05-21 05:51:52', '2018-05-21 05:51:52'),
(56, 'delete_deposits', 'deposits', '2018-05-21 05:51:52', '2018-05-21 05:51:52'),
(57, 'browse_deposit_methods', 'deposit_methods', '2018-05-21 05:59:16', '2018-05-21 05:59:16'),
(58, 'read_deposit_methods', 'deposit_methods', '2018-05-21 05:59:16', '2018-05-21 05:59:16'),
(59, 'edit_deposit_methods', 'deposit_methods', '2018-05-21 05:59:16', '2018-05-21 05:59:16'),
(60, 'add_deposit_methods', 'deposit_methods', '2018-05-21 05:59:16', '2018-05-21 05:59:16'),
(61, 'delete_deposit_methods', 'deposit_methods', '2018-05-21 05:59:16', '2018-05-21 05:59:16'),
(62, 'browse_transaction_states', 'transaction_states', '2018-05-21 06:15:47', '2018-05-21 06:15:47'),
(63, 'read_transaction_states', 'transaction_states', '2018-05-21 06:15:47', '2018-05-21 06:15:47'),
(64, 'edit_transaction_states', 'transaction_states', '2018-05-21 06:15:47', '2018-05-21 06:15:47'),
(65, 'add_transaction_states', 'transaction_states', '2018-05-21 06:15:47', '2018-05-21 06:15:47'),
(66, 'delete_transaction_states', 'transaction_states', '2018-05-21 06:15:47', '2018-05-21 06:15:47'),
(67, 'browse_transactionable', 'transactionable', '2018-06-15 14:31:29', '2018-06-15 14:31:29'),
(68, 'read_transactionable', 'transactionable', '2018-06-15 14:31:29', '2018-06-15 14:31:29'),
(69, 'edit_transactionable', 'transactionable', '2018-06-15 14:31:29', '2018-06-15 14:31:29'),
(70, 'add_transactionable', 'transactionable', '2018-06-15 14:31:29', '2018-06-15 14:31:29'),
(71, 'delete_transactionable', 'transactionable', '2018-06-15 14:31:29', '2018-06-15 14:31:29'),
(72, 'browse_merchants', 'merchants', '2018-06-21 13:30:20', '2018-06-21 13:30:20'),
(73, 'read_merchants', 'merchants', '2018-06-21 13:30:20', '2018-06-21 13:30:20'),
(74, 'edit_merchants', 'merchants', '2018-06-21 13:30:20', '2018-06-21 13:30:20'),
(75, 'add_merchants', 'merchants', '2018-06-21 13:30:20', '2018-06-21 13:30:20'),
(76, 'delete_merchants', 'merchants', '2018-06-21 13:30:20', '2018-06-21 13:30:20'),
(77, 'browse_currencys', 'currencys', '2018-07-01 14:52:25', '2018-07-01 14:52:25'),
(78, 'read_currencys', 'currencys', '2018-07-01 14:52:25', '2018-07-01 14:52:25'),
(79, 'edit_currencys', 'currencys', '2018-07-01 14:52:25', '2018-07-01 14:52:25'),
(80, 'add_currencys', 'currencys', '2018-07-01 14:52:25', '2018-07-01 14:52:25'),
(81, 'delete_currencys', 'currencys', '2018-07-01 14:52:25', '2018-07-01 14:52:25'),
(92, 'browse_currencies', 'currencies', '2018-07-01 15:20:20', '2018-07-01 15:20:20'),
(93, 'read_currencies', 'currencies', '2018-07-01 15:20:20', '2018-07-01 15:20:20'),
(94, 'edit_currencies', 'currencies', '2018-07-01 15:20:20', '2018-07-01 15:20:20'),
(95, 'add_currencies', 'currencies', '2018-07-01 15:20:20', '2018-07-01 15:20:20'),
(96, 'delete_currencies', 'currencies', '2018-07-01 15:20:20', '2018-07-01 15:20:20'),
(97, 'browse_currency_exchange_rates', 'currency_exchange_rates', '2018-07-01 16:03:17', '2018-07-01 16:03:17'),
(98, 'read_currency_exchange_rates', 'currency_exchange_rates', '2018-07-01 16:03:17', '2018-07-01 16:03:17'),
(99, 'edit_currency_exchange_rates', 'currency_exchange_rates', '2018-07-01 16:03:17', '2018-07-01 16:03:17'),
(100, 'add_currency_exchange_rates', 'currency_exchange_rates', '2018-07-01 16:03:17', '2018-07-01 16:03:17'),
(101, 'delete_currency_exchange_rates', 'currency_exchange_rates', '2018-07-01 16:03:17', '2018-07-01 16:03:17'),
(102, 'browse_wallets', 'wallets', '2018-07-01 16:34:40', '2018-07-01 16:34:40'),
(103, 'read_wallets', 'wallets', '2018-07-01 16:34:40', '2018-07-01 16:34:40'),
(104, 'edit_wallets', 'wallets', '2018-07-01 16:34:40', '2018-07-01 16:34:40'),
(105, 'add_wallets', 'wallets', '2018-07-01 16:34:40', '2018-07-01 16:34:40'),
(106, 'delete_wallets', 'wallets', '2018-07-01 16:34:40', '2018-07-01 16:34:40'),
(107, 'browse_currency_depositmethod', 'currency_depositmethod', '2018-07-04 00:34:44', '2018-07-04 00:34:44'),
(108, 'read_currency_depositmethod', 'currency_depositmethod', '2018-07-04 00:34:44', '2018-07-04 00:34:44'),
(109, 'edit_currency_depositmethod', 'currency_depositmethod', '2018-07-04 00:34:44', '2018-07-04 00:34:44'),
(110, 'add_currency_depositmethod', 'currency_depositmethod', '2018-07-04 00:34:44', '2018-07-04 00:34:44'),
(111, 'delete_currency_depositmethod', 'currency_depositmethod', '2018-07-04 00:34:44', '2018-07-04 00:34:44'),
(112, 'browse_currencie_deposit', 'currencie_deposit', '2018-07-04 13:17:26', '2018-07-04 13:17:26'),
(113, 'read_currencie_deposit', 'currencie_deposit', '2018-07-04 13:17:26', '2018-07-04 13:17:26'),
(114, 'edit_currencie_deposit', 'currencie_deposit', '2018-07-04 13:17:26', '2018-07-04 13:17:26'),
(115, 'add_currencie_deposit', 'currencie_deposit', '2018-07-04 13:17:26', '2018-07-04 13:17:26'),
(116, 'delete_currencie_deposit', 'currencie_deposit', '2018-07-04 13:17:26', '2018-07-04 13:17:26'),
(117, 'browse_currency_deposit_method', 'currency_deposit_method', '2018-07-04 13:34:24', '2018-07-04 13:34:24'),
(118, 'read_currency_deposit_method', 'currency_deposit_method', '2018-07-04 13:34:24', '2018-07-04 13:34:24'),
(119, 'edit_currency_deposit_method', 'currency_deposit_method', '2018-07-04 13:34:24', '2018-07-04 13:34:24'),
(120, 'add_currency_deposit_method', 'currency_deposit_method', '2018-07-04 13:34:24', '2018-07-04 13:34:24'),
(121, 'delete_currency_deposit_method', 'currency_deposit_method', '2018-07-04 13:34:24', '2018-07-04 13:34:24'),
(122, 'browse_currency_deposit_methods', 'currency_deposit_methods', '2018-07-04 14:49:54', '2018-07-04 14:49:54'),
(123, 'read_currency_deposit_methods', 'currency_deposit_methods', '2018-07-04 14:49:54', '2018-07-04 14:49:54'),
(124, 'edit_currency_deposit_methods', 'currency_deposit_methods', '2018-07-04 14:49:54', '2018-07-04 14:49:54'),
(125, 'add_currency_deposit_methods', 'currency_deposit_methods', '2018-07-04 14:49:54', '2018-07-04 14:49:54'),
(126, 'delete_currency_deposit_methods', 'currency_deposit_methods', '2018-07-04 14:49:54', '2018-07-04 14:49:54'),
(127, 'browse_currency_withdrawal_methods', 'currency_withdrawal_methods', '2018-07-04 14:57:35', '2018-07-04 14:57:35'),
(128, 'read_currency_withdrawal_methods', 'currency_withdrawal_methods', '2018-07-04 14:57:35', '2018-07-04 14:57:35'),
(129, 'edit_currency_withdrawal_methods', 'currency_withdrawal_methods', '2018-07-04 14:57:35', '2018-07-04 14:57:35'),
(130, 'add_currency_withdrawal_methods', 'currency_withdrawal_methods', '2018-07-04 14:57:35', '2018-07-04 14:57:35'),
(131, 'delete_currency_withdrawal_methods', 'currency_withdrawal_methods', '2018-07-04 14:57:35', '2018-07-04 14:57:35'),
(132, 'browse_ticketcategories', 'ticketcategories', '2018-07-19 22:41:21', '2018-07-19 22:41:21'),
(133, 'read_ticketcategories', 'ticketcategories', '2018-07-19 22:41:21', '2018-07-19 22:41:21'),
(134, 'edit_ticketcategories', 'ticketcategories', '2018-07-19 22:41:21', '2018-07-19 22:41:21'),
(135, 'add_ticketcategories', 'ticketcategories', '2018-07-19 22:41:21', '2018-07-19 22:41:21'),
(136, 'delete_ticketcategories', 'ticketcategories', '2018-07-19 22:41:21', '2018-07-19 22:41:21'),
(137, 'browse_vouchers', 'vouchers', '2018-09-16 13:35:48', '2018-09-16 13:35:48'),
(138, 'read_vouchers', 'vouchers', '2018-09-16 13:35:48', '2018-09-16 13:35:48'),
(139, 'edit_vouchers', 'vouchers', '2018-09-16 13:35:48', '2018-09-16 13:35:48'),
(140, 'add_vouchers', 'vouchers', '2018-09-16 13:35:48', '2018-09-16 13:35:48'),
(141, 'delete_vouchers', 'vouchers', '2018-09-16 13:35:48', '2018-09-16 13:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 3),
(12, 1),
(12, 3),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(36, 3),
(37, 1),
(37, 3),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(57, 1),
(57, 3),
(58, 1),
(58, 3),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(62, 3),
(63, 1),
(63, 3),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(72, 1),
(73, 1),
(74, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-05-20 12:47:50', '2018-05-20 12:47:50');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `document_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `transaction_state_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `gross` double(8,2) NOT NULL,
  `fee` double(8,2) NOT NULL,
  `net` double(8,2) NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receives`
--

CREATE TABLE `receives` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `send_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `transaction_state_id` int(11) NOT NULL,
  `gross` double(8,2) NOT NULL,
  `fee` double(8,2) NOT NULL,
  `net` double(8,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `merchant_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_expired` tinyint(1) NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `attempts`, `merchant_key`, `ref`, `is_expired`, `data`, `created_at`, `updated_at`, `currency_code`, `currency_id`) VALUES
(1, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528379313', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":46,\"invoice_description\":\"Order with Invoice 46\",\"total\":139}', '2018-06-07 17:48:33', '2018-06-07 17:48:54', NULL, NULL),
(2, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528532994', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"3\",\"description\":null}],\"invoice_id\":17,\"invoice_description\":\"Order with Invoice 17\",\"total\":417}', '2018-06-09 12:29:54', '2018-06-09 12:29:55', NULL, NULL),
(3, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528792888', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"3\",\"description\":null}],\"invoice_id\":19,\"invoice_description\":\"Order with Invoice 19\",\"total\":657,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?&\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 12:41:28', '2018-06-12 12:45:14', NULL, NULL),
(4, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528793182', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"3\",\"description\":null}],\"invoice_id\":7,\"invoice_description\":\"Order with Invoice 7\",\"total\":657,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?&\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 12:46:22', '2018-06-12 12:48:06', NULL, NULL),
(5, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528794625', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":4,\"invoice_description\":\"Order with Invoice 4\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?&\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 13:10:25', '2018-06-12 13:10:56', NULL, NULL),
(6, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528794917', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":12,\"invoice_description\":\"Order with Invoice 12\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?&\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 13:15:17', '2018-06-12 13:15:18', NULL, NULL),
(7, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528795941', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":3,\"invoice_description\":\"Order with Invoice 3\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?&\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 13:32:21', '2018-06-12 13:32:22', NULL, NULL),
(8, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528796271', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":39,\"invoice_description\":\"Order with Invoice 39\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?&\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 13:37:51', '2018-06-12 13:37:52', NULL, NULL),
(9, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528796769', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":4,\"invoice_description\":\"Order with Invoice 4\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 13:46:09', '2018-06-12 13:46:10', NULL, NULL),
(10, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528801046', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":35,\"invoice_description\":\"Order with Invoice 35\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 14:57:26', '2018-06-12 14:57:27', NULL, NULL),
(11, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528801163', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":25,\"invoice_description\":\"Order with Invoice 25\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 14:59:23', '2018-06-12 14:59:24', NULL, NULL),
(12, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528801298', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":2,\"invoice_description\":\"Order with Invoice 2\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 15:01:38', '2018-06-12 15:01:39', NULL, NULL),
(13, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528802586', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":30,\"invoice_description\":\"Order with Invoice 30\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 15:23:06', '2018-06-12 15:23:07', NULL, NULL),
(14, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528802986', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":29,\"invoice_description\":\"Order with Invoice 29\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 15:29:46', '2018-06-12 15:29:47', NULL, NULL),
(15, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528803470', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":15,\"invoice_description\":\"Order with Invoice 15\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 15:37:50', '2018-06-12 15:37:51', NULL, NULL),
(16, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528803865', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":7,\"invoice_description\":\"Order with Invoice 7\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-12 15:44:25', '2018-06-12 15:44:39', NULL, NULL),
(17, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1528885042', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":19,\"invoice_description\":\"Order with Invoice 19\",\"total\":297,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-13 14:17:22', '2018-06-19 01:06:47', NULL, NULL),
(18, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529084285', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":47,\"invoice_description\":\"Order with Invoice 47\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-15 21:38:05', '2018-06-15 21:38:35', NULL, NULL),
(19, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529103515', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":30,\"invoice_description\":\"Order with Invoice 30\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-16 02:58:35', '2018-06-16 02:58:35', NULL, NULL),
(20, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529293411', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":44,\"invoice_description\":\"Order with Invoice 44\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-18 07:43:31', '2018-06-18 07:44:38', NULL, NULL),
(21, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529293582', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":31,\"invoice_description\":\"Order with Invoice 31\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-18 07:46:22', '2018-07-02 19:59:32', NULL, NULL),
(22, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529335032', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":20,\"invoice_description\":\"Order with Invoice 20\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-18 19:17:12', '2018-06-18 19:17:32', NULL, NULL),
(23, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529401458', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":14,\"invoice_description\":\"Order with Invoice 14\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-19 13:44:18', '2018-06-19 13:44:19', NULL, NULL),
(24, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529403844', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":24,\"invoice_description\":\"Order with Invoice 24\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-19 14:24:04', '2018-06-19 14:24:04', NULL, NULL),
(25, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529404819', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"80\",\"description\":null}],\"invoice_id\":37,\"invoice_description\":\"Order with Invoice 37\",\"total\":8040,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-19 14:40:19', '2018-06-19 14:49:06', NULL, NULL),
(26, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529408368', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null},{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":26,\"invoice_description\":\"Order with Invoice 26\",\"total\":259,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-19 15:39:28', '2018-06-19 15:39:29', NULL, NULL),
(27, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529420238', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":25,\"invoice_description\":\"Order with Invoice 25\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-19 18:57:18', '2018-06-19 18:57:28', NULL, NULL),
(28, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529439472', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":39,\"invoice_description\":\"Order with Invoice 39\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-20 00:17:52', '2018-06-20 00:18:17', NULL, NULL),
(29, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1529652456', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":34,\"invoice_description\":\"Order with Invoice 34\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-22 11:27:36', '2018-06-22 11:27:36', NULL, NULL),
(30, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530048445', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":25,\"invoice_description\":\"Order with Invoice 25\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-27 01:27:25', '2018-06-27 01:27:25', NULL, NULL),
(31, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530231430', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"10\",\"description\":null}],\"invoice_id\":14,\"invoice_description\":\"Order with Invoice 14\",\"total\":1200,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-29 04:17:10', '2018-06-29 04:18:33', NULL, NULL),
(32, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530286943', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":4,\"invoice_description\":\"Order with Invoice 4\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-29 19:42:23', '2018-06-29 19:43:20', NULL, NULL),
(33, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530287168', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":9,\"invoice_description\":\"Order with Invoice 9\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-29 19:46:08', '2018-06-29 19:46:09', NULL, NULL),
(34, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530301239', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":2,\"invoice_description\":\"Order with Invoice 2\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-29 23:40:39', '2018-06-29 23:40:40', NULL, NULL),
(35, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530310375', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":3,\"invoice_description\":\"Order with Invoice 3\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-30 02:12:55', '2018-06-30 02:13:36', NULL, NULL),
(36, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530343160', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":4,\"invoice_description\":\"Order with Invoice 4\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-06-30 11:19:20', '2018-06-30 11:19:21', NULL, NULL),
(37, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530408930', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":5,\"invoice_description\":\"Order with Invoice 5\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-01 05:35:30', '2018-07-01 05:54:29', NULL, NULL),
(38, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530410116', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":3,\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":6,\"invoice_description\":\"Order with Invoice 6\",\"total\":516,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-01 05:55:16', '2018-07-01 05:55:16', NULL, NULL),
(39, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530450874', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":7,\"invoice_description\":\"Order with Invoice 7\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-01 17:14:34', '2018-07-01 17:14:48', NULL, NULL),
(40, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530459454', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":11,\"invoice_description\":\"Order with Invoice 11\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-01 19:37:34', '2018-07-01 19:41:34', 'USD', NULL),
(41, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530502138', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":12,\"invoice_description\":\"Order with Invoice 12\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-02 07:28:58', '2018-07-02 07:28:59', 'USD', NULL),
(42, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530502772', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":19,\"invoice_description\":\"Order with Invoice 19\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-02 07:39:32', '2018-07-02 07:39:47', 'EUR', NULL),
(43, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530503493', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":20,\"invoice_description\":\"Order with Invoice 20\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-02 07:51:33', '2018-07-02 07:57:27', 'EUR', 2),
(44, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530504061', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":21,\"invoice_description\":\"Order with Invoice 21\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-02 08:01:01', '2018-07-02 08:01:17', 'BRL', 4),
(45, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530616596', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":24,\"invoice_description\":\"Order with Invoice 24\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-03 15:16:36', '2018-07-03 15:16:37', 'USD', 1),
(46, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530617394', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":25,\"invoice_description\":\"Order with Invoice 25\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-03 15:29:54', '2018-07-03 15:29:55', 'USD', 1),
(47, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530618198', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":2,\"description\":null}],\"invoice_id\":26,\"invoice_description\":\"Order with Invoice 26\",\"total\":438,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-03 15:43:18', '2018-07-03 15:43:19', 'USD', 1),
(48, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530745709', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":27,\"invoice_description\":\"Order with Invoice 27\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-05 03:08:29', '2018-07-05 03:08:31', 'USD', 1),
(49, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530773402', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":28,\"invoice_description\":\"Order with Invoice 28\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-05 10:50:02', '2018-07-05 10:50:02', 'USD', 1),
(50, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530773432', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":29,\"invoice_description\":\"Order with Invoice 29\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-05 10:50:32', '2018-07-05 10:50:33', 'USD', 1),
(51, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530855264', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":30,\"invoice_description\":\"Order with Invoice 30\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-06 09:34:24', '2018-07-06 09:34:25', 'USD', 1),
(52, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530892576', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":31,\"invoice_description\":\"Order with Invoice 31\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-06 19:56:16', '2018-07-06 19:56:17', 'USD', 1),
(53, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1530894430', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":32,\"invoice_description\":\"Order with Invoice 32\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-06 20:27:10', '2018-07-06 20:27:10', 'USD', 1),
(54, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531044742', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":33,\"invoice_description\":\"Order with Invoice 33\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-08 14:12:22', '2018-07-08 14:12:26', 'USD', 1),
(55, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531052896', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":34,\"invoice_description\":\"Order with Invoice 34\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-08 16:28:16', '2018-07-08 16:31:07', 'USD', 1),
(56, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531053022', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":2,\"description\":null}],\"invoice_id\":35,\"invoice_description\":\"Order with Invoice 35\",\"total\":198,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-08 16:30:22', '2018-07-08 16:30:23', 'USD', 1),
(57, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531158054', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":2,\"description\":null}],\"invoice_id\":36,\"invoice_description\":\"Order with Invoice 36\",\"total\":278,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-09 21:40:54', '2018-07-09 21:40:55', 'USD', 1),
(58, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531178257', 1, '{\"items\":[],\"invoice_id\":37,\"invoice_description\":\"Order with Invoice 37\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-10 03:17:37', '2018-07-10 03:17:38', 'USD', 1),
(59, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531238857', 1, '{\"items\":[],\"invoice_id\":38,\"invoice_description\":\"Order with Invoice 38\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-10 20:07:37', '2018-07-10 20:07:51', 'USD', 1),
(60, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531471626', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":39,\"invoice_description\":\"Order with Invoice 39\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-13 12:47:06', '2018-07-13 12:47:07', 'USD', 1),
(61, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531602910', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":40,\"invoice_description\":\"Order with Invoice 40\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-15 01:15:10', '2018-07-15 01:15:11', 'USD', 1),
(62, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531644650', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":41,\"invoice_description\":\"Order with Invoice 41\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-15 12:50:50', '2018-07-15 12:55:04', 'USD', 1),
(63, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531649480', 1, '{\"items\":[],\"invoice_id\":42,\"invoice_description\":\"Order with Invoice 42\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-15 14:11:20', '2018-07-15 14:11:20', 'USD', 1),
(64, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531753925', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":2,\"description\":null}],\"invoice_id\":43,\"invoice_description\":\"Order with Invoice 43\",\"total\":438,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-16 19:12:05', '2018-07-16 19:12:05', 'USD', 1),
(65, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531753991', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":2,\"description\":null}],\"invoice_id\":44,\"invoice_description\":\"Order with Invoice 44\",\"total\":438,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-16 19:13:11', '2018-07-16 19:13:25', 'USD', 1),
(66, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1531915888', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":45,\"invoice_description\":\"Order with Invoice 45\",\"total\":297,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-18 16:11:28', '2018-07-18 16:12:13', 'USD', 1),
(67, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532132735', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":46,\"invoice_description\":\"Order with Invoice 46\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-21 04:25:35', '2018-07-21 04:26:17', 'USD', 1),
(68, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532150088', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":47,\"invoice_description\":\"Order with Invoice 47\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-21 09:14:48', '2018-07-21 09:15:28', 'USD', 1),
(69, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532196038', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":48,\"invoice_description\":\"Order with Invoice 48\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-21 22:00:38', '2018-07-21 22:01:20', 'USD', 1),
(70, 5, '$2y$10$g0lB2wll/GrT2a9RRK8.su4ej2UDnHkbj98NbkdmXP20Z/JtW.NuG', '1532232239', 1, '{\"items\":[{\"name\":\"Product 1\",\"price\":20,\"description\":\"Product 1 description\",\"qty\":1},{\"name\":\"Product 2\",\"price\":10,\"description\":\"Product 2 description\",\"qty\":1},{\"name\":\"Product 3\",\"price\":10,\"description\":\"Product 3 description\",\"qty\":1}],\"invoice_id\":16,\"invoice_description\":\"Order with Invoice 16\",\"total\":40,\"return_url\":\"http:\\/\\/localhost\\/AcceptCoin\\/?success=true\",\"cancel_url\":\"http:\\/\\/localhost\\/AcceptCoin\\/?success=false\"}', '2018-07-22 08:03:59', '2018-07-22 08:05:00', 'USD', 1),
(71, 4, '$2y$10$g0lB2wll/GrT2a9RRK8.su4ej2UDnHkbj98NbkdmXP20Z/JtW.NuG', '1532232625', 1, '{\"items\":[{\"name\":\"Product 1\",\"price\":20,\"description\":\"Product 1 description\",\"qty\":1},{\"name\":\"Product 2\",\"price\":10,\"description\":\"Product 2 description\",\"qty\":1},{\"name\":\"Product 3\",\"price\":10,\"description\":\"Product 3 description\",\"qty\":1}],\"invoice_id\":46,\"invoice_description\":\"Order with Invoice 46\",\"total\":40,\"return_url\":\"http:\\/\\/localhost\\/AcceptCoin\\/?success=true\",\"cancel_url\":\"http:\\/\\/localhost\\/AcceptCoin\\/?success=false\"}', '2018-07-22 08:10:25', '2018-07-22 08:10:57', 'USD', 1),
(72, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532276996', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":2,\"description\":null}],\"invoice_id\":49,\"invoice_description\":\"Order with Invoice 49\",\"total\":278,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-22 20:29:56', '2018-07-22 20:29:57', 'USD', 1),
(73, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532353258', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":50,\"invoice_description\":\"Order with Invoice 50\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-23 17:40:58', '2018-07-23 17:41:29', 'USD', 1),
(74, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532438332', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":2,\"description\":null}],\"invoice_id\":51,\"invoice_description\":\"Order with Invoice 51\",\"total\":278,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-24 17:18:52', '2018-07-24 18:23:45', 'USD', 1),
(75, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532438710', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":52,\"invoice_description\":\"Order with Invoice 52\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-24 17:25:10', '2018-07-24 17:25:11', 'USD', 1),
(76, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532438946', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":53,\"invoice_description\":\"Order with Invoice 53\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-24 17:29:06', '2018-07-24 17:29:06', 'USD', 1),
(77, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532646175', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":54,\"invoice_description\":\"Order with Invoice 54\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-27 03:02:55', '2018-07-27 03:02:56', 'USD', 1),
(78, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532685050', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":55,\"invoice_description\":\"Order with Invoice 55\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-27 13:50:50', '2018-07-27 13:50:50', 'USD', 1),
(79, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532687953', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":56,\"invoice_description\":\"Order with Invoice 56\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-27 14:39:13', '2018-07-27 14:39:38', 'USD', 1),
(80, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532856859', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":57,\"invoice_description\":\"Order with Invoice 57\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-29 13:34:19', '2018-07-29 13:34:20', 'USD', 1),
(81, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532995574', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":2,\"description\":null}],\"invoice_id\":58,\"invoice_description\":\"Order with Invoice 58\",\"total\":240,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-31 04:06:14', '2018-07-31 04:06:15', 'USD', 1),
(82, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1532995666', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":2,\"description\":null}],\"invoice_id\":59,\"invoice_description\":\"Order with Invoice 59\",\"total\":240,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-07-31 04:07:46', '2018-07-31 04:07:46', 'USD', 1),
(83, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533229426', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":60,\"invoice_description\":\"Order with Invoice 60\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-02 21:03:46', '2018-08-02 21:03:47', 'USD', 1),
(84, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533236443', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":61,\"invoice_description\":\"Order with Invoice 61\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-02 23:00:43', '2018-08-02 23:00:44', 'USD', 1),
(85, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533310363', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"10\",\"description\":null}],\"invoice_id\":62,\"invoice_description\":\"Order with Invoice 62\",\"total\":1200,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-03 19:32:43', '2018-08-03 19:32:43', 'USD', 1),
(86, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533310486', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"10\",\"description\":null}],\"invoice_id\":63,\"invoice_description\":\"Order with Invoice 63\",\"total\":1200,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-03 19:34:46', '2018-08-03 19:34:46', 'USD', 1),
(87, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533481009', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":64,\"invoice_description\":\"Order with Invoice 64\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-05 18:56:49', '2018-08-05 18:56:50', 'USD', 1),
(88, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533483386', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":65,\"invoice_description\":\"Order with Invoice 65\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-05 19:36:26', '2018-08-05 19:36:27', 'USD', 1),
(89, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533526774', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null},{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"2\",\"description\":null}],\"invoice_id\":66,\"invoice_description\":\"Order with Invoice 66\",\"total\":537,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-06 07:39:34', '2018-08-06 07:40:27', 'USD', 1),
(90, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533526910', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null},{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"2\",\"description\":null}],\"invoice_id\":67,\"invoice_description\":\"Order with Invoice 67\",\"total\":537,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-06 07:41:50', '2018-08-06 07:42:21', 'USD', 1),
(91, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533527022', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":3,\"description\":null}],\"invoice_id\":68,\"invoice_description\":\"Order with Invoice 68\",\"total\":417,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-06 07:43:42', '2018-08-06 07:44:05', 'USD', 1),
(92, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533529345', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":3,\"description\":null}],\"invoice_id\":69,\"invoice_description\":\"Order with Invoice 69\",\"total\":417,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-06 08:22:25', '2018-08-06 08:22:25', 'USD', 1),
(93, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533575746', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":70,\"invoice_description\":\"Order with Invoice 70\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-06 21:15:46', '2018-08-06 21:15:46', 'USD', 1),
(94, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533629175', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":71,\"invoice_description\":\"Order with Invoice 71\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-07 12:06:15', '2018-08-07 12:09:22', 'USD', 1),
(95, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533646306', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":72,\"invoice_description\":\"Order with Invoice 72\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-07 16:51:46', '2018-08-07 16:53:14', 'USD', 1),
(96, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533670368', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":73,\"invoice_description\":\"Order with Invoice 73\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-07 23:32:48', '2018-08-07 23:32:48', 'USD', 1),
(97, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533711556', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":74,\"invoice_description\":\"Order with Invoice 74\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-08 10:59:16', '2018-08-08 10:59:17', 'USD', 1),
(98, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533756915', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":75,\"invoice_description\":\"Order with Invoice 75\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-08 23:35:15', '2018-08-08 23:35:30', 'USD', 1),
(99, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533758536', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":76,\"invoice_description\":\"Order with Invoice 76\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-09 00:02:16', '2018-08-09 00:02:19', 'USD', 1),
(100, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533830713', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":39,\"invoice_description\":\"Order with Invoice 39\",\"total\":120,\"return_url\":\"http:\\/\\/shop.ebizcard.net\\/script\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shop.ebizcard.net\\/script\\/public\\/pay\\/cancel\"}', '2018-08-09 20:05:13', '2018-08-09 20:05:14', 'USD', 1);
INSERT INTO `requests` (`id`, `attempts`, `merchant_key`, `ref`, `is_expired`, `data`, `created_at`, `updated_at`, `currency_code`, `currency_id`) VALUES
(101, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533832448', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":40,\"invoice_description\":\"Order with Invoice 40\",\"total\":120,\"return_url\":\"http:\\/\\/shop.ebizcard.net\\/script\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shop.ebizcard.net\\/script\\/public\\/pay\\/cancel\"}', '2018-08-09 20:34:08', '2018-08-11 12:56:27', 'USD', 1),
(102, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533844900', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":77,\"invoice_description\":\"Order with Invoice 77\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-10 00:01:40', '2018-08-10 00:01:42', 'USD', 1),
(103, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533868421', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":78,\"invoice_description\":\"Order with Invoice 78\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-10 06:33:41', '2018-08-10 06:33:42', 'USD', 1),
(104, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533903081', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":79,\"invoice_description\":\"Order with Invoice 79\",\"total\":297,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-10 16:11:21', '2018-08-10 16:11:22', 'USD', 1),
(105, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533906751', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":80,\"invoice_description\":\"Order with Invoice 80\",\"total\":297,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-10 17:12:31', '2018-08-10 17:12:34', 'USD', 1),
(106, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533906824', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":81,\"invoice_description\":\"Order with Invoice 81\",\"total\":297,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-10 17:13:44', '2018-08-10 17:13:44', 'USD', 1),
(107, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533906881', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":82,\"invoice_description\":\"Order with Invoice 82\",\"total\":297,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-10 17:14:41', '2018-08-10 17:14:46', 'USD', 1),
(108, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533908732', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":83,\"invoice_description\":\"Order with Invoice 83\",\"total\":297,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-10 17:45:32', '2018-08-10 17:45:33', 'USD', 1),
(109, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533983941', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":84,\"invoice_description\":\"Order with Invoice 84\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-11 14:39:01', '2018-08-11 14:39:02', 'USD', 1),
(110, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533984954', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":85,\"invoice_description\":\"Order with Invoice 85\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-11 14:55:54', '2018-08-11 14:55:54', 'USD', 1),
(111, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1533993860', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":86,\"invoice_description\":\"Order with Invoice 86\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-11 17:24:20', '2018-08-11 17:24:20', 'USD', 1),
(112, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1534412416', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":87,\"invoice_description\":\"Order with Invoice 87\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-16 13:40:16', '2018-08-16 13:40:17', 'USD', 1),
(113, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1534414098', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":88,\"invoice_description\":\"Order with Invoice 88\",\"total\":318,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-16 14:08:18', '2018-08-16 14:08:19', 'USD', 1),
(114, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1534415812', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":89,\"invoice_description\":\"Order with Invoice 89\",\"total\":318,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-16 14:36:52', '2018-08-16 14:36:54', 'USD', 1),
(115, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1535525100', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":90,\"invoice_description\":\"Order with Invoice 90\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-29 10:45:00', '2018-08-29 10:45:01', 'USD', 1),
(116, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1535525695', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":91,\"invoice_description\":\"Order with Invoice 91\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-29 10:54:55', '2018-08-29 10:54:55', 'USD', 1),
(117, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1535666213', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":92,\"invoice_description\":\"Order with Invoice 92\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-08-31 01:56:53', '2018-08-31 01:57:37', 'USD', 1),
(118, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1535880827', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":93,\"invoice_description\":\"Order with Invoice 93\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-02 13:33:47', '2018-09-02 13:33:49', 'USD', 1),
(119, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536001672', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":94,\"invoice_description\":\"Order with Invoice 94\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-03 23:07:52', '2018-09-03 23:07:53', 'USD', 1),
(120, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536045285', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":95,\"invoice_description\":\"Order with Invoice 95\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-04 11:14:45', '2018-09-04 11:14:46', 'USD', 1),
(121, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536059479', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":6,\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"7\",\"description\":null}],\"invoice_id\":96,\"invoice_description\":\"Order with Invoice 96\",\"total\":1527,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-04 15:11:19', '2018-09-04 15:11:19', 'USD', 1),
(122, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536059482', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":6,\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"7\",\"description\":null}],\"invoice_id\":97,\"invoice_description\":\"Order with Invoice 97\",\"total\":1527,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-04 15:11:22', '2018-09-04 15:11:42', 'USD', 1),
(123, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536081001', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":98,\"invoice_description\":\"Order with Invoice 98\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-04 21:10:01', '2018-09-04 21:10:03', 'USD', 1),
(124, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536247753', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":99,\"invoice_description\":\"Order with Invoice 99\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-06 19:29:13', '2018-09-06 19:29:13', 'USD', 1),
(125, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536268155', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":100,\"invoice_description\":\"Order with Invoice 100\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-07 01:09:15', '2018-09-07 01:09:38', 'USD', 1),
(126, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536598816', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":101,\"invoice_description\":\"Order with Invoice 101\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-10 21:00:16', '2018-09-10 21:00:17', 'USD', 1),
(127, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536600164', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":102,\"invoice_description\":\"Order with Invoice 102\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-10 21:22:44', '2018-09-10 21:22:55', 'USD', 1),
(128, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536821109', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":103,\"invoice_description\":\"Order with Invoice 103\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-13 10:45:09', '2018-09-13 10:45:11', 'USD', 1),
(129, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1536944966', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":104,\"invoice_description\":\"Order with Invoice 104\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-14 21:09:26', '2018-09-14 21:09:46', 'USD', 1),
(130, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537104129', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":105,\"invoice_description\":\"Order with Invoice 105\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-16 17:22:09', '2018-09-16 17:22:10', 'USD', 1),
(131, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537162218', 1, '{\"items\":[],\"invoice_id\":106,\"invoice_description\":\"Order with Invoice 106\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-17 09:30:18', '2018-09-17 09:30:44', 'USD', 1),
(132, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537162318', 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":2,\"description\":null}],\"invoice_id\":107,\"invoice_description\":\"Order with Invoice 107\",\"total\":438,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-17 09:31:58', '2018-09-17 09:33:00', 'USD', 1),
(133, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537232413', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":108,\"invoice_description\":\"Order with Invoice 108\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-18 05:00:13', '2018-09-18 05:08:19', 'USD', 1),
(134, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537252888', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":109,\"invoice_description\":\"Order with Invoice 109\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-18 10:41:28', '2018-09-18 10:41:29', 'USD', 1),
(135, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537295401', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":110,\"invoice_description\":\"Order with Invoice 110\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-18 22:30:01', '2018-09-18 22:30:02', 'USD', 1),
(136, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537610186', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":111,\"invoice_description\":\"Order with Invoice 111\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-22 13:56:26', '2018-09-22 13:56:29', 'USD', 1),
(137, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537612340', 1, '{\"items\":[],\"invoice_id\":112,\"invoice_description\":\"Order with Invoice 112\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-22 14:32:20', '2018-09-22 14:32:22', 'USD', 1),
(138, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537643308', 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":113,\"invoice_description\":\"Order with Invoice 113\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-22 23:08:28', '2018-09-22 23:08:57', 'USD', 1),
(139, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537696149', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":114,\"invoice_description\":\"Order with Invoice 114\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-23 13:49:09', '2018-09-23 13:49:11', 'USD', 1),
(140, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537696199', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":115,\"invoice_description\":\"Order with Invoice 115\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-23 13:49:59', '2018-09-23 13:49:59', 'USD', 1),
(141, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537701201', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":116,\"invoice_description\":\"Order with Invoice 116\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-23 15:13:21', '2018-09-24 11:37:11', 'USD', 1),
(142, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537703387', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":9,\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":117,\"invoice_description\":\"Order with Invoice 117\",\"total\":1548,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-23 15:49:47', '2018-09-23 15:50:31', 'USD', 1),
(143, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537707388', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":9,\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null},{\"name\":\"Denim shirt\",\"price\":120,\"qty\":2,\"description\":null}],\"invoice_id\":118,\"invoice_description\":\"Order with Invoice 118\",\"total\":1788,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-23 16:56:28', '2018-09-23 16:57:41', 'USD', 1),
(144, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537707486', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":9,\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null},{\"name\":\"Denim shirt\",\"price\":120,\"qty\":2,\"description\":null}],\"invoice_id\":119,\"invoice_description\":\"Order with Invoice 119\",\"total\":1788,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-23 16:58:06', '2018-09-23 17:02:25', 'USD', 1),
(145, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537707775', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":9,\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null},{\"name\":\"Denim shirt\",\"price\":120,\"qty\":2,\"description\":null}],\"invoice_id\":120,\"invoice_description\":\"Order with Invoice 120\",\"total\":1788,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-23 17:02:55', '2018-09-23 17:02:56', 'USD', 1),
(146, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537794991', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":121,\"invoice_description\":\"Order with Invoice 121\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-24 17:16:31', '2018-09-24 17:16:33', 'USD', 1),
(147, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537804186', 1, '{\"items\":[],\"invoice_id\":122,\"invoice_description\":\"Order with Invoice 122\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-24 19:49:46', '2018-09-24 19:49:48', 'USD', 1),
(148, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537807224', 1, '{\"items\":[],\"invoice_id\":123,\"invoice_description\":\"Order with Invoice 123\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-24 20:40:24', '2018-09-24 20:40:26', 'USD', 1),
(149, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537996293', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":90,\"invoice_description\":\"Order with Invoice 90\",\"total\":120,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 01:11:33', '2018-09-27 01:11:34', 'USD', 1),
(150, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537996463', 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":91,\"invoice_description\":\"Order with Invoice 91\",\"total\":120,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 01:14:23', '2018-09-27 01:56:09', 'USD', 1),
(151, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537997176', 1, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":92,\"invoice_description\":\"Order with Invoice 92\",\"total\":139,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 01:26:16', '2018-09-27 01:26:18', 'USD', 1),
(152, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1537997295', 1, '{\"items\":[{\"name\":\"test item\",\"price\":1000,\"qty\":\"1\",\"description\":null}],\"invoice_id\":93,\"invoice_description\":\"Order with Invoice 93\",\"total\":1000,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 01:28:15', '2018-09-27 01:28:16', 'USD', 1),
(153, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1538004637', 1, '{\"items\":[{\"name\":\"10,000 ARABIT\",\"price\":4500,\"qty\":\"1\",\"description\":null}],\"invoice_id\":90,\"invoice_description\":\"Order with Invoice 90\",\"total\":4500,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 03:30:37', '2018-09-27 03:30:37', 'USD', 1),
(154, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1538004706', 1, '{\"items\":[{\"name\":\"10,000 ARABIT\",\"price\":4500,\"qty\":\"1\",\"description\":null}],\"invoice_id\":91,\"invoice_description\":\"Order with Invoice 91\",\"total\":4500,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 03:31:46', '2018-09-27 03:31:46', 'USD', 1),
(155, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1538004737', 1, '{\"items\":[{\"name\":\"10,000 ARABIT\",\"price\":4500,\"qty\":\"1\",\"description\":null}],\"invoice_id\":92,\"invoice_description\":\"Order with Invoice 92\",\"total\":4500,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 03:32:17', '2018-09-27 03:32:18', 'USD', 1),
(156, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1538004889', 1, '{\"items\":[{\"name\":\"10,000 ARABIT\",\"price\":4500,\"qty\":\"1\",\"description\":null}],\"invoice_id\":94,\"invoice_description\":\"Order with Invoice 94\",\"total\":4500,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 03:34:49', '2018-09-27 03:34:49', 'USD', 1),
(157, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1538006366', 1, '{\"items\":[{\"name\":\"10,000 ARABIT\",\"price\":4500,\"qty\":\"1\",\"description\":null}],\"invoice_id\":104,\"invoice_description\":\"Order with Invoice 104\",\"total\":4500,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 03:59:26', '2018-09-27 03:59:27', 'USD', 1),
(158, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1538006551', 1, '{\"items\":[{\"name\":\"10,000 ARABIT\",\"price\":4500,\"qty\":\"1\",\"description\":null}],\"invoice_id\":106,\"invoice_description\":\"Order with Invoice 106\",\"total\":4500,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 04:02:31', '2018-09-27 04:02:31', 'USD', 1),
(159, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1538007253', 1, '{\"items\":[{\"name\":\"10,000 ARABIT\",\"price\":4500,\"qty\":\"1\",\"description\":null}],\"invoice_id\":112,\"invoice_description\":\"Order with Invoice 112\",\"total\":4500,\"return_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/marketplace.altcoinscard.com\\/pay\\/cancel\"}', '2018-09-27 04:14:13', '2018-09-27 04:14:14', 'USD', 1),
(160, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1538328840', 1, '{\"items\":[],\"invoice_id\":124,\"invoice_description\":\"Order with Invoice 124\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-09-30 21:34:00', '2018-09-30 21:34:01', 'USD', 1),
(161, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1538766108', 1, '{\"items\":[],\"invoice_id\":125,\"invoice_description\":\"Order with Invoice 125\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-10-05 23:01:48', '2018-10-05 23:01:49', 'USD', 1),
(162, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1539377067', 1, '{\"items\":[],\"invoice_id\":126,\"invoice_description\":\"Order with Invoice 126\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-10-13 00:44:27', '2018-10-13 00:44:52', 'USD', 1),
(163, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1539582384', 1, '{\"items\":[],\"invoice_id\":127,\"invoice_description\":\"Order with Invoice 127\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-10-15 09:46:24', '2018-10-15 09:46:41', 'USD', 1),
(164, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1540294604', 1, '{\"items\":[],\"invoice_id\":128,\"invoice_description\":\"Order with Invoice 128\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-10-23 15:36:44', '2018-10-23 15:37:28', 'USD', 1),
(165, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1540913172', 1, '{\"items\":[],\"invoice_id\":129,\"invoice_description\":\"Order with Invoice 129\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-10-30 19:26:12', '2018-10-30 19:35:51', 'USD', 1),
(166, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1541194628', 1, '{\"items\":[],\"invoice_id\":130,\"invoice_description\":\"Order with Invoice 130\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-03 01:37:08', '2018-11-03 01:37:33', 'USD', 1),
(167, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1541516096', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":131,\"invoice_description\":\"Order with Invoice 131\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-06 19:54:56', '2018-11-06 19:54:57', 'USD', 1),
(168, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1541518628', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":132,\"invoice_description\":\"Order with Invoice 132\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-06 20:37:08', '2018-11-06 20:37:09', 'USD', 1),
(169, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1541538667', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":133,\"invoice_description\":\"Order with Invoice 133\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-07 02:11:07', '2018-11-07 02:11:07', 'USD', 1),
(170, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1541580745', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":134,\"invoice_description\":\"Order with Invoice 134\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-07 13:52:25', '2018-11-07 13:52:37', 'USD', 1),
(171, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1541631879', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":135,\"invoice_description\":\"Order with Invoice 135\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-08 04:04:39', '2018-11-08 04:04:40', 'USD', 1),
(172, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1541796579', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":136,\"invoice_description\":\"Order with Invoice 136\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-10 01:49:39', '2018-11-10 01:49:40', 'USD', 1),
(173, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1541965273', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":137,\"invoice_description\":\"Order with Invoice 137\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-12 00:41:13', '2018-11-12 00:41:58', 'USD', 1),
(174, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1542268100', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"5\",\"description\":null}],\"invoice_id\":138,\"invoice_description\":\"Order with Invoice 138\",\"total\":50,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-15 12:48:20', '2018-11-15 12:49:06', 'USD', 1),
(175, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1542269111', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":15,\"description\":null}],\"invoice_id\":139,\"invoice_description\":\"Order with Invoice 139\",\"total\":150,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-15 13:05:11', '2018-11-15 13:05:12', 'USD', 1),
(176, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1542550678', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":140,\"invoice_description\":\"Order with Invoice 140\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-18 19:17:58', '2018-11-18 20:42:16', 'USD', 1),
(177, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1542710628', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":141,\"invoice_description\":\"Order with Invoice 141\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-20 15:43:48', '2018-11-20 15:44:03', 'USD', 1),
(178, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1542711592', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":2,\"description\":null}],\"invoice_id\":142,\"invoice_description\":\"Order with Invoice 142\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-20 15:59:52', '2018-11-20 15:59:54', 'USD', 1),
(179, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1542923985', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":143,\"invoice_description\":\"Order with Invoice 143\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-23 02:59:45', '2018-11-23 02:59:46', 'USD', 1),
(180, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1542959301', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":144,\"invoice_description\":\"Order with Invoice 144\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-23 12:48:21', '2018-11-23 12:48:43', 'USD', 1),
(181, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1543072111', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":145,\"invoice_description\":\"Order with Invoice 145\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-24 20:08:31', '2018-11-24 20:08:32', 'USD', 1),
(182, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1543127289', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":146,\"invoice_description\":\"Order with Invoice 146\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-25 11:28:09', '2018-11-25 11:28:10', 'USD', 1),
(183, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1543264685', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":2,\"description\":null}],\"invoice_id\":147,\"invoice_description\":\"Order with Invoice 147\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-27 01:38:05', '2018-11-27 01:38:08', 'USD', 1),
(184, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1543265241', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":2,\"description\":null}],\"invoice_id\":148,\"invoice_description\":\"Order with Invoice 148\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-27 01:47:21', '2018-11-27 01:47:29', 'USD', 1),
(185, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1543566921', 1, '{\"items\":[],\"invoice_id\":149,\"invoice_description\":\"Order with Invoice 149\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-30 13:35:21', '2018-11-30 13:35:21', 'USD', 1),
(186, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1543567013', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":150,\"invoice_description\":\"Order with Invoice 150\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-11-30 13:36:53', '2018-11-30 13:41:16', 'USD', 1),
(187, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1543693060', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":2,\"description\":null}],\"invoice_id\":151,\"invoice_description\":\"Order with Invoice 151\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-02 00:37:40', '2018-12-02 00:37:42', 'USD', 1),
(188, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1543982461', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":152,\"invoice_description\":\"Order with Invoice 152\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-05 09:01:01', '2018-12-05 09:01:03', 'USD', 1),
(189, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1544458930', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":153,\"invoice_description\":\"Order with Invoice 153\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-10 21:22:10', '2018-12-10 21:49:40', 'USD', 1),
(190, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1544522898', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":154,\"invoice_description\":\"Order with Invoice 154\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-11 15:08:18', '2018-12-11 15:08:28', 'USD', 1),
(191, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1544523669', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":155,\"invoice_description\":\"Order with Invoice 155\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-11 15:21:09', '2018-12-11 15:21:09', 'USD', 1),
(192, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1544591583', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":156,\"invoice_description\":\"Order with Invoice 156\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-12 10:13:03', '2018-12-12 10:13:04', 'USD', 1),
(193, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1544723302', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":157,\"invoice_description\":\"Order with Invoice 157\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-13 22:48:22', '2018-12-13 22:58:16', 'USD', 1),
(194, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1544732364', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":158,\"invoice_description\":\"Order with Invoice 158\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-14 01:19:24', '2018-12-14 11:26:19', 'USD', 1),
(195, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1544767736', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":159,\"invoice_description\":\"Order with Invoice 159\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-14 11:08:56', '2018-12-14 11:08:56', 'USD', 1),
(196, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1544796751', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":160,\"invoice_description\":\"Order with Invoice 160\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-14 19:12:31', '2018-12-14 19:12:33', 'USD', 1),
(197, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1544815548', 1, '{\"items\":[],\"invoice_id\":161,\"invoice_description\":\"Order with Invoice 161\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-15 00:25:48', '2018-12-15 00:25:49', 'USD', 1),
(198, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1544815748', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":162,\"invoice_description\":\"Order with Invoice 162\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-15 00:29:08', '2018-12-15 00:29:09', 'USD', 1),
(199, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545043179', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":163,\"invoice_description\":\"Order with Invoice 163\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-17 15:39:39', '2018-12-17 15:40:05', 'USD', 1),
(200, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545092585', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":164,\"invoice_description\":\"Order with Invoice 164\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-18 05:23:05', '2018-12-18 05:25:34', 'USD', 1),
(201, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545210073', 1, '{\"items\":[],\"invoice_id\":165,\"invoice_description\":\"Order with Invoice 165\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-19 14:01:13', '2018-12-19 14:01:14', 'USD', 1);
INSERT INTO `requests` (`id`, `attempts`, `merchant_key`, `ref`, `is_expired`, `data`, `created_at`, `updated_at`, `currency_code`, `currency_id`) VALUES
(202, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545332273', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":149,\"invoice_description\":\"Order with Invoice 149\",\"total\":10,\"return_url\":\"http:\\/\\/midiaoffer.joinville.br\\/comprar\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/midiaoffer.joinville.br\\/comprar\\/public\\/pay\\/cancel\"}', '2018-12-20 23:57:53', '2018-12-20 23:57:54', 'USD', 1),
(203, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545332274', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":150,\"invoice_description\":\"Order with Invoice 150\",\"total\":10,\"return_url\":\"http:\\/\\/midiaoffer.joinville.br\\/comprar\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/midiaoffer.joinville.br\\/comprar\\/public\\/pay\\/cancel\"}', '2018-12-20 23:57:54', '2018-12-20 23:57:55', 'USD', 1),
(204, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545581934', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":166,\"invoice_description\":\"Order with Invoice 166\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-23 21:18:54', '2018-12-23 21:18:56', 'USD', 1),
(205, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545636551', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":167,\"invoice_description\":\"Order with Invoice 167\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 12:29:11', '2018-12-24 12:29:14', 'USD', 1),
(206, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545637195', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":168,\"invoice_description\":\"Order with Invoice 168\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 12:39:55', '2018-12-24 12:39:56', 'USD', 1),
(207, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545637329', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":169,\"invoice_description\":\"Order with Invoice 169\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 12:42:09', '2018-12-24 12:42:11', 'USD', 1),
(208, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545637990', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":170,\"invoice_description\":\"Order with Invoice 170\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 12:53:10', '2018-12-24 12:53:12', 'USD', 1),
(209, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545638386', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":171,\"invoice_description\":\"Order with Invoice 171\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 12:59:46', '2018-12-24 12:59:48', 'USD', 1),
(210, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545638463', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":172,\"invoice_description\":\"Order with Invoice 172\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 13:01:03', '2018-12-24 13:01:05', 'USD', 1),
(211, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545638758', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":173,\"invoice_description\":\"Order with Invoice 173\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 13:05:58', '2018-12-24 13:06:01', 'USD', 1),
(212, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545638852', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":174,\"invoice_description\":\"Order with Invoice 174\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 13:07:32', '2018-12-24 13:07:34', 'USD', 1),
(213, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545642402', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":175,\"invoice_description\":\"Order with Invoice 175\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 14:06:42', '2018-12-24 14:06:45', 'USD', 1),
(214, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545642608', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":176,\"invoice_description\":\"Order with Invoice 176\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 14:10:08', '2018-12-24 14:10:19', 'USD', 1),
(215, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545658958', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":177,\"invoice_description\":\"Order with Invoice 177\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 18:42:38', '2018-12-24 18:43:02', 'USD', 1),
(216, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545658997', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":178,\"invoice_description\":\"Order with Invoice 178\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-24 18:43:17', '2018-12-24 18:43:17', 'USD', 1),
(217, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545694208', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":179,\"invoice_description\":\"Order with Invoice 179\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-25 04:30:08', '2018-12-25 04:30:08', 'USD', 1),
(218, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1545903014', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":180,\"invoice_description\":\"Order with Invoice 180\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-27 14:30:14', '2018-12-27 14:30:15', 'USD', 1),
(219, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546001570', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":181,\"invoice_description\":\"Order with Invoice 181\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-28 17:52:50', '2018-12-28 17:53:42', 'USD', 1),
(220, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546279507', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":182,\"invoice_description\":\"Order with Invoice 182\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2018-12-31 23:05:07', '2018-12-31 23:05:08', 'USD', 1),
(221, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546310316', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":2,\"description\":null}],\"invoice_id\":183,\"invoice_description\":\"Order with Invoice 183\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-01 07:38:36', '2019-01-01 07:38:37', 'USD', 1),
(222, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546332914', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":184,\"invoice_description\":\"Order with Invoice 184\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-01 13:55:14', '2019-01-01 13:55:15', 'USD', 1),
(223, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546573547', 1, '{\"items\":[],\"invoice_id\":185,\"invoice_description\":\"Order with Invoice 185\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-04 08:45:47', '2019-01-04 08:45:48', 'USD', 1),
(224, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546573603', 1, '{\"items\":[],\"invoice_id\":186,\"invoice_description\":\"Order with Invoice 186\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-04 08:46:43', '2019-01-04 08:46:44', 'USD', 1),
(225, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546573745', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":187,\"invoice_description\":\"Order with Invoice 187\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-04 08:49:05', '2019-01-04 08:49:06', 'USD', 1),
(226, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546623619', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":188,\"invoice_description\":\"Order with Invoice 188\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-04 22:40:19', '2019-01-04 22:40:21', 'USD', 1),
(227, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546724814', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":2,\"description\":null}],\"invoice_id\":189,\"invoice_description\":\"Order with Invoice 189\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-06 02:46:54', '2019-01-06 02:46:55', 'USD', 1),
(228, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546767876', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":190,\"invoice_description\":\"Order with Invoice 190\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-06 14:44:36', '2019-01-06 14:44:39', 'USD', 1),
(229, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546810832', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":191,\"invoice_description\":\"Order with Invoice 191\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-07 02:40:32', '2019-01-07 02:41:41', 'USD', 1),
(230, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546874520', 1, '{\"items\":[],\"invoice_id\":192,\"invoice_description\":\"Order with Invoice 192\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-07 20:22:00', '2019-01-07 20:22:02', 'USD', 1),
(231, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546874554', 1, '{\"items\":[],\"invoice_id\":193,\"invoice_description\":\"Order with Invoice 193\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-07 20:22:34', '2019-01-07 20:22:34', 'USD', 1),
(232, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546874653', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":194,\"invoice_description\":\"Order with Invoice 194\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-07 20:24:13', '2019-01-07 20:24:14', 'USD', 1),
(233, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1546910540', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":2,\"description\":null}],\"invoice_id\":195,\"invoice_description\":\"Order with Invoice 195\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-08 06:22:20', '2019-01-08 06:23:03', 'USD', 1),
(234, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1547036871', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"100\",\"description\":null}],\"invoice_id\":196,\"invoice_description\":\"Order with Invoice 196\",\"total\":1000,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-09 17:27:51', '2019-01-09 17:27:52', 'USD', 1),
(235, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1547037113', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"100\",\"description\":null}],\"invoice_id\":197,\"invoice_description\":\"Order with Invoice 197\",\"total\":1000,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-09 17:31:53', '2019-01-09 17:31:54', 'USD', 1),
(236, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1547157456', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":198,\"invoice_description\":\"Order with Invoice 198\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-11 02:57:36', '2019-01-11 02:57:36', 'USD', 1),
(237, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1547171156', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":199,\"invoice_description\":\"Order with Invoice 199\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-11 06:45:56', '2019-01-11 06:46:55', 'USD', 1),
(238, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1547201654', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":200,\"invoice_description\":\"Order with Invoice 200\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-11 15:14:14', '2019-01-11 15:14:16', 'USD', 1),
(239, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1547212380', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":201,\"invoice_description\":\"Order with Invoice 201\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-11 18:13:00', '2019-01-11 18:13:02', 'USD', 1),
(240, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1548688877', 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"3\",\"description\":null}],\"invoice_id\":202,\"invoice_description\":\"Order with Invoice 202\",\"total\":30,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-28 20:21:17', '2019-01-28 20:21:19', 'USD', 1),
(241, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1548729408', 1, '{\"items\":[{\"name\":\"Men Winter Long Pile Leather Jacket\",\"price\":45.9500000000000028421709430404007434844970703125,\"qty\":2,\"description\":null}],\"invoice_id\":203,\"invoice_description\":\"Order with Invoice 203\",\"total\":91.900000000000005684341886080801486968994140625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-29 07:36:48', '2019-01-29 07:36:51', 'USD', 1),
(242, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1548838652', 1, '{\"items\":[{\"name\":\"Men Winter Long Pile Leather Jacket\",\"price\":45.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":204,\"invoice_description\":\"Order with Invoice 204\",\"total\":45.9500000000000028421709430404007434844970703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-30 13:57:32', '2019-01-30 13:57:34', 'USD', 1),
(243, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1548922650', 1, '{\"items\":[],\"invoice_id\":205,\"invoice_description\":\"Order with Invoice 205\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-31 13:17:30', '2019-01-31 13:17:32', 'USD', 1),
(244, 0, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1548922820', 0, '{\"items\":[],\"invoice_id\":206,\"invoice_description\":\"Order with Invoice 206\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-31 13:20:20', '2019-01-31 13:20:20', 'USD', 1),
(245, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1548922821', 1, '{\"items\":[],\"invoice_id\":207,\"invoice_description\":\"Order with Invoice 207\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-01-31 13:20:21', '2019-01-31 13:20:21', 'USD', 1),
(246, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1548977489', 1, '{\"items\":[{\"name\":\"Men Winter Long Pile Leather Jacket\",\"price\":45.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":208,\"invoice_description\":\"Order with Invoice 208\",\"total\":45.9500000000000028421709430404007434844970703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-01 04:31:29', '2019-02-01 04:36:09', 'USD', 1),
(247, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549025074', 1, '{\"items\":[{\"name\":\"Two Tone Color Denim Jeans\",\"price\":35.81000000000000227373675443232059478759765625,\"qty\":\"2\",\"description\":null},{\"name\":\"Hole Denim Jeans - BLACK L\",\"price\":15.980000000000000426325641456060111522674560546875,\"qty\":\"1\",\"description\":null},{\"name\":\"Men Casual Suit Slim Fit One Button Business Formal Blazer\",\"price\":12.5999999999999996447286321199499070644378662109375,\"qty\":\"1\",\"description\":null},{\"name\":\"Lapel Single Breasted Flap Pocket Jacquard Blazer\",\"price\":59.9200000000000017053025658242404460906982421875,\"qty\":\"1\",\"description\":null},{\"name\":\"Men\'s Jacket Casual Winter Plus Velvet Thick Loose Lapel Denim\",\"price\":39.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null},{\"name\":\"Men Winter Long Pile Leather Jacket\",\"price\":45.9500000000000028421709430404007434844970703125,\"qty\":\"7\",\"description\":null}],\"invoice_id\":209,\"invoice_description\":\"Order with Invoice 209\",\"total\":521.720000000000027284841053187847137451171875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-01 17:44:34', '2019-02-01 17:44:54', 'USD', 1),
(248, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549049324', 1, '{\"items\":[],\"invoice_id\":210,\"invoice_description\":\"Order with Invoice 210\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-02 00:28:44', '2019-02-02 00:29:18', 'USD', 1),
(249, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549129124', 1, '{\"items\":[{\"name\":\"Men\'s Jacket Casual Winter Plus Velvet Thick Loose Lapel Denim\",\"price\":39.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":211,\"invoice_description\":\"Order with Invoice 211\",\"total\":39.9500000000000028421709430404007434844970703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-02 22:38:44', '2019-02-02 22:38:45', 'USD', 1),
(250, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549222001', 1, '{\"items\":[{\"name\":\"Uleemark Men Light Weight Goose Down Jacket from Xiaomi Youpin - DEEP GREEN M\",\"price\":50.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":212,\"invoice_description\":\"Order with Invoice 212\",\"total\":50.81000000000000227373675443232059478759765625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-04 00:26:41', '2019-02-04 00:26:43', 'USD', 1),
(251, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549312765', 1, '{\"items\":[],\"invoice_id\":213,\"invoice_description\":\"Order with Invoice 213\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-05 01:39:25', '2019-02-05 01:39:27', 'USD', 1),
(252, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549436320', 1, '{\"items\":[],\"invoice_id\":214,\"invoice_description\":\"Order with Invoice 214\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-06 11:58:40', '2019-02-06 11:59:12', 'USD', 1),
(253, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549436416', 1, '{\"items\":[{\"name\":\"Uleemark Men Light Weight Goose Down Jacket from Xiaomi Youpin - DEEP GREEN M\",\"price\":50.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":215,\"invoice_description\":\"Order with Invoice 215\",\"total\":50.81000000000000227373675443232059478759765625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-06 12:00:16', '2019-02-06 12:00:17', 'USD', 1),
(254, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549743811', 1, '{\"items\":[],\"invoice_id\":216,\"invoice_description\":\"Order with Invoice 216\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-10 01:23:31', '2019-02-10 01:23:33', 'USD', 1),
(255, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549744522', 1, '{\"items\":[],\"invoice_id\":217,\"invoice_description\":\"Order with Invoice 217\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-10 01:35:22', '2019-02-10 01:35:23', 'USD', 1),
(256, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549744704', 1, '{\"items\":[],\"invoice_id\":218,\"invoice_description\":\"Order with Invoice 218\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-10 01:38:24', '2019-02-10 01:38:52', 'USD', 1),
(257, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549772951', 1, '{\"items\":[],\"invoice_id\":219,\"invoice_description\":\"Order with Invoice 219\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-10 09:29:11', '2019-02-10 09:29:44', 'USD', 1),
(258, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1549773039', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":220,\"invoice_description\":\"Order with Invoice 220\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-10 09:30:39', '2019-02-10 09:30:40', 'USD', 1),
(259, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550142332', 1, '{\"items\":[],\"invoice_id\":221,\"invoice_description\":\"Order with Invoice 221\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-14 16:05:32', '2019-02-14 16:05:34', 'USD', 1),
(260, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550142412', 1, '{\"items\":[{\"name\":\"Men\'s Jacket Casual Winter Plus Velvet Thick Loose Lapel Denim\",\"price\":39.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null},{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":222,\"invoice_description\":\"Order with Invoice 222\",\"total\":112.0199999999999960209606797434389591217041015625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-14 16:06:52', '2019-02-14 16:07:10', 'USD', 1),
(261, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550220044', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null},{\"name\":\"Men\'s Jacket Casual Winter Plus Velvet Thick Loose Lapel Denim\",\"price\":39.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null},{\"name\":\"Men Winter Long Pile Leather Jacket\",\"price\":45.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":223,\"invoice_description\":\"Order with Invoice 223\",\"total\":157.969999999999998863131622783839702606201171875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-15 13:40:44', '2019-02-15 13:40:47', 'USD', 1),
(262, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550351909', 1, '{\"items\":[],\"invoice_id\":205,\"invoice_description\":\"Order with Invoice 205\",\"total\":0,\"return_url\":\"http:\\/\\/ecommerce.paygate.online\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/ecommerce.paygate.online\\/pay\\/cancel\"}', '2019-02-17 02:18:29', '2019-02-17 02:20:15', 'USD', 1),
(263, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550411306', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":224,\"invoice_description\":\"Order with Invoice 224\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-17 18:48:26', '2019-02-17 18:50:42', 'USD', 1),
(264, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550413826', 1, '{\"items\":[{\"name\":\"Uleemark Men Light Weight Goose Down Jacket from Xiaomi Youpin - DEEP GREEN M\",\"price\":50.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":225,\"invoice_description\":\"Order with Invoice 225\",\"total\":50.81000000000000227373675443232059478759765625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-17 19:30:26', '2019-02-17 19:30:28', 'USD', 1),
(265, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550414595', 1, '{\"items\":[{\"name\":\"Uleemark Men Light Weight Goose Down Jacket from Xiaomi Youpin - DEEP GREEN M\",\"price\":50.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null},{\"name\":\"Men\'s Jacket Casual Winter Plus Velvet Thick Loose Lapel Denim\",\"price\":39.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null},{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":2,\"description\":null}],\"invoice_id\":226,\"invoice_description\":\"Order with Invoice 226\",\"total\":234.8999999999999772626324556767940521240234375,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-17 19:43:15', '2019-02-17 19:43:16', 'USD', 1),
(266, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550419032', 1, '{\"items\":[{\"name\":\"Uleemark Men Light Weight Goose Down Jacket from Xiaomi Youpin - DEEP GREEN M\",\"price\":50.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":227,\"invoice_description\":\"Order with Invoice 227\",\"total\":50.81000000000000227373675443232059478759765625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-17 20:57:12', '2019-02-17 20:57:13', 'USD', 1),
(267, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550419760', 1, '{\"items\":[{\"name\":\"Men\'s Thickening Down Jacket for Winter - WHITE X\",\"price\":59.590000000000003410605131648480892181396484375,\"qty\":\"1\",\"description\":null}],\"invoice_id\":228,\"invoice_description\":\"Order with Invoice 228\",\"total\":59.590000000000003410605131648480892181396484375,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-17 21:09:20', '2019-02-17 21:10:29', 'USD', 1),
(268, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550420702', 1, '{\"items\":[{\"name\":\"Uleemark Men Light Weight Goose Down Jacket from Xiaomi Youpin - DEEP GREEN M\",\"price\":50.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":229,\"invoice_description\":\"Order with Invoice 229\",\"total\":50.81000000000000227373675443232059478759765625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-17 21:25:02', '2019-02-17 21:26:15', 'USD', 1),
(269, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550421183', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":230,\"invoice_description\":\"Order with Invoice 230\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-17 21:33:03', '2019-02-17 21:33:04', 'USD', 1),
(270, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550422179', 1, '{\"items\":[{\"name\":\"Uleemark Men Light Weight Goose Down Jacket from Xiaomi Youpin - DEEP GREEN M\",\"price\":50.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":231,\"invoice_description\":\"Order with Invoice 231\",\"total\":50.81000000000000227373675443232059478759765625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-17 21:49:39', '2019-02-17 21:50:04', 'USD', 1),
(271, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550423744', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":232,\"invoice_description\":\"Order with Invoice 232\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-17 22:15:44', '2019-02-17 22:16:13', 'USD', 1),
(272, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550427969', 1, '{\"items\":[],\"invoice_id\":149,\"invoice_description\":\"Order with Invoice 149\",\"total\":0,\"return_url\":\"https:\\/\\/shopi.test\\/pay\\/success?\",\"cancel_url\":\"https:\\/\\/shopi.test\\/pay\\/cancel\"}', '2019-02-17 23:26:09', '2019-02-17 23:55:25', 'USD', 1),
(273, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550429648', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":233,\"invoice_description\":\"Order with Invoice 233\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-17 23:54:08', '2019-02-17 23:54:09', 'USD', 1),
(274, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550430529', 1, '{\"items\":[],\"invoice_id\":234,\"invoice_description\":\"Order with Invoice 234\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 00:08:49', '2019-02-18 00:09:16', 'USD', 1),
(275, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550431049', 1, '{\"items\":[],\"invoice_id\":235,\"invoice_description\":\"Order with Invoice 235\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 00:17:29', '2019-02-18 00:17:44', 'USD', 1),
(276, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550432798', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":2,\"description\":null}],\"invoice_id\":236,\"invoice_description\":\"Order with Invoice 236\",\"total\":144.1399999999999863575794734060764312744140625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 00:46:38', '2019-02-18 00:47:12', 'USD', 1),
(277, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550434171', 1, '{\"items\":[{\"name\":\"V-neck Floral Insert Vintage Flare Dress - BLUE M 2\",\"price\":24.129999999999999005240169935859739780426025390625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":237,\"invoice_description\":\"Order with Invoice 237\",\"total\":24.129999999999999005240169935859739780426025390625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 01:09:31', '2019-02-18 01:09:33', 'USD', 1),
(278, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550441482', 1, '{\"items\":[{\"name\":\"Men\'s Jacket Casual Winter Plus Velvet Thick Loose Lapel Denim\",\"price\":39.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":238,\"invoice_description\":\"Order with Invoice 238\",\"total\":39.9500000000000028421709430404007434844970703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 03:11:22', '2019-02-18 03:11:23', 'USD', 1),
(279, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550447130', 1, '{\"items\":[{\"name\":\"Uleemark Men Light Weight Goose Down Jacket from Xiaomi Youpin - DEEP GREEN M\",\"price\":50.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":239,\"invoice_description\":\"Order with Invoice 239\",\"total\":50.81000000000000227373675443232059478759765625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 04:45:30', '2019-02-18 04:45:31', 'USD', 1),
(280, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550457213', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":240,\"invoice_description\":\"Order with Invoice 240\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 07:33:33', '2019-02-18 07:33:35', 'USD', 1),
(281, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550460418', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":241,\"invoice_description\":\"Order with Invoice 241\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 08:26:58', '2019-02-18 08:28:10', 'USD', 1),
(282, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550460606', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":242,\"invoice_description\":\"Order with Invoice 242\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 08:30:06', '2019-02-18 08:30:07', 'USD', 1),
(283, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550466667', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":243,\"invoice_description\":\"Order with Invoice 243\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 10:11:07', '2019-02-18 10:11:08', 'USD', 1),
(284, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550471355', 1, '{\"items\":[{\"name\":\"Men\'s Thickening Down Jacket for Winter - WHITE X\",\"price\":59.590000000000003410605131648480892181396484375,\"qty\":\"1\",\"description\":null}],\"invoice_id\":244,\"invoice_description\":\"Order with Invoice 244\",\"total\":59.590000000000003410605131648480892181396484375,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 11:29:15', '2019-02-18 11:29:16', 'USD', 1),
(285, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550479194', 1, '{\"items\":[{\"name\":\"V-neck Floral Insert Vintage Flare Dress - BLUE M 2\",\"price\":24.129999999999999005240169935859739780426025390625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":245,\"invoice_description\":\"Order with Invoice 245\",\"total\":24.129999999999999005240169935859739780426025390625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 13:39:54', '2019-02-18 13:39:55', 'USD', 1),
(286, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550492168', 1, '{\"items\":[{\"name\":\"Men Casual Suit Slim Fit One Button Business Formal Blazer\",\"price\":12.5999999999999996447286321199499070644378662109375,\"qty\":\"1\",\"description\":null}],\"invoice_id\":246,\"invoice_description\":\"Order with Invoice 246\",\"total\":12.5999999999999996447286321199499070644378662109375,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 17:16:08', '2019-02-18 17:16:29', 'USD', 1),
(287, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550497027', 1, '{\"items\":[],\"invoice_id\":247,\"invoice_description\":\"Order with Invoice 247\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 18:37:07', '2019-02-18 18:37:36', 'USD', 1),
(288, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550506660', 1, '{\"items\":[],\"invoice_id\":248,\"invoice_description\":\"Order with Invoice 248\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-18 21:17:40', '2019-02-18 21:18:37', 'USD', 1),
(289, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550526070', 1, '{\"items\":[],\"invoice_id\":249,\"invoice_description\":\"Order with Invoice 249\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-19 02:41:10', '2019-02-19 02:42:12', 'USD', 1),
(290, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550577528', 1, '{\"items\":[],\"invoice_id\":250,\"invoice_description\":\"Order with Invoice 250\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-19 16:58:48', '2019-02-19 16:59:27', 'USD', 1),
(291, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550578472', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":7,\"description\":null}],\"invoice_id\":251,\"invoice_description\":\"Order with Invoice 251\",\"total\":300.08999999999997498889570124447345733642578125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-19 17:14:32', '2019-02-19 17:14:33', 'USD', 1),
(292, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550580601', 1, '{\"items\":[{\"name\":\"Uleemark Men Light Weight Goose Down Jacket from Xiaomi Youpin - DEEP GREEN M\",\"price\":50.81000000000000227373675443232059478759765625,\"qty\":\"2\",\"description\":null}],\"invoice_id\":252,\"invoice_description\":\"Order with Invoice 252\",\"total\":101.6200000000000045474735088646411895751953125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-19 17:50:01', '2019-02-19 17:50:04', 'USD', 1);
INSERT INTO `requests` (`id`, `attempts`, `merchant_key`, `ref`, `is_expired`, `data`, `created_at`, `updated_at`, `currency_code`, `currency_id`) VALUES
(293, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550595434', 1, '{\"items\":[{\"name\":\"Men\'s Thickening Down Jacket for Winter - WHITE X\",\"price\":59.590000000000003410605131648480892181396484375,\"qty\":\"1\",\"description\":null},{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":253,\"invoice_description\":\"Order with Invoice 253\",\"total\":102.460000000000007958078640513122081756591796875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-19 21:57:14', '2019-02-19 21:57:15', 'USD', 1),
(294, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550656607', 1, '{\"items\":[],\"invoice_id\":254,\"invoice_description\":\"Order with Invoice 254\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-20 14:56:47', '2019-02-20 14:59:00', 'USD', 1),
(295, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550686832', 1, '{\"items\":[{\"name\":\"Men\'s Thickening Down Jacket for Winter - WHITE X\",\"price\":59.590000000000003410605131648480892181396484375,\"qty\":\"1\",\"description\":null}],\"invoice_id\":255,\"invoice_description\":\"Order with Invoice 255\",\"total\":59.590000000000003410605131648480892181396484375,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-20 23:20:32', '2019-02-20 23:20:33', 'USD', 1),
(296, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550688711', 1, '{\"items\":[{\"name\":\"Retro Polka Dot Party Pin Up Dress\",\"price\":25.67999999999999971578290569595992565155029296875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":256,\"invoice_description\":\"Order with Invoice 256\",\"total\":25.67999999999999971578290569595992565155029296875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-20 23:51:51', '2019-02-20 23:53:03', 'USD', 1),
(297, 3, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550710212', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":257,\"invoice_description\":\"Order with Invoice 257\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-21 05:50:12', '2019-02-21 05:52:30', 'USD', 1),
(298, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550754289', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":258,\"invoice_description\":\"Order with Invoice 258\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-21 18:04:49', '2019-02-21 18:04:50', 'USD', 1),
(299, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550754311', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":259,\"invoice_description\":\"Order with Invoice 259\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-21 18:05:11', '2019-02-21 18:05:12', 'USD', 1),
(300, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550754505', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null},{\"name\":\"Two Tone Color Denim Jeans\",\"price\":35.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null},{\"name\":\"Men Casual Suit Slim Fit One Button Business Formal Blazer\",\"price\":12.5999999999999996447286321199499070644378662109375,\"qty\":\"1\",\"description\":null}],\"invoice_id\":260,\"invoice_description\":\"Order with Invoice 260\",\"total\":120.479999999999989768184605054557323455810546875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-21 18:08:25', '2019-02-21 18:08:25', 'USD', 1),
(301, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550775812', 1, '{\"items\":[],\"invoice_id\":261,\"invoice_description\":\"Order with Invoice 261\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-22 00:03:32', '2019-02-22 00:04:21', 'USD', 1),
(302, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550798728', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":2,\"description\":null}],\"invoice_id\":262,\"invoice_description\":\"Order with Invoice 262\",\"total\":85.7399999999999948840923025272786617279052734375,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-22 06:25:28', '2019-02-22 06:25:29', 'USD', 1),
(303, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550852634', 1, '{\"items\":[],\"invoice_id\":263,\"invoice_description\":\"Order with Invoice 263\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-22 21:23:54', '2019-02-22 21:23:57', 'USD', 1),
(304, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550877865', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":264,\"invoice_description\":\"Order with Invoice 264\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-23 04:24:25', '2019-02-23 04:24:26', 'USD', 1),
(305, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550883812', 1, '{\"items\":[{\"name\":\"Men\'s Jacket Casual Winter Plus Velvet Thick Loose Lapel Denim\",\"price\":39.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":265,\"invoice_description\":\"Order with Invoice 265\",\"total\":39.9500000000000028421709430404007434844970703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-23 06:03:32', '2019-02-23 06:03:34', 'USD', 1),
(306, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550883857', 1, '{\"items\":[{\"name\":\"Men\'s Jacket Casual Winter Plus Velvet Thick Loose Lapel Denim\",\"price\":39.9500000000000028421709430404007434844970703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":266,\"invoice_description\":\"Order with Invoice 266\",\"total\":39.9500000000000028421709430404007434844970703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-23 06:04:17', '2019-02-23 06:04:18', 'USD', 1),
(307, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550891305', 1, '{\"items\":[],\"invoice_id\":267,\"invoice_description\":\"Order with Invoice 267\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-23 08:08:25', '2019-02-23 08:09:05', 'USD', 1),
(308, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550891463', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":268,\"invoice_description\":\"Order with Invoice 268\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-23 08:11:03', '2019-02-23 08:11:04', 'USD', 1),
(309, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550898681', 1, '{\"items\":[{\"name\":\"Lapel Single Breasted Flap Pocket Jacquard Blazer\",\"price\":59.9200000000000017053025658242404460906982421875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":269,\"invoice_description\":\"Order with Invoice 269\",\"total\":59.9200000000000017053025658242404460906982421875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-23 10:11:21', '2019-02-23 10:11:22', 'USD', 1),
(310, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550911029', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":270,\"invoice_description\":\"Order with Invoice 270\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-23 13:37:09', '2019-02-23 13:37:38', 'USD', 1),
(311, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550924317', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":271,\"invoice_description\":\"Order with Invoice 271\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-23 17:18:37', '2019-02-23 17:20:54', 'USD', 1),
(312, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550924937', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":272,\"invoice_description\":\"Order with Invoice 272\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-23 17:28:57', '2019-02-23 17:29:33', 'USD', 1),
(313, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550936354', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":273,\"invoice_description\":\"Order with Invoice 273\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-23 20:39:14', '2019-02-23 20:40:05', 'USD', 1),
(314, 2, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1550953065', 1, '{\"items\":[],\"invoice_id\":274,\"invoice_description\":\"Order with Invoice 274\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-24 01:17:45', '2019-02-24 01:18:01', 'USD', 1),
(315, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551015013', 1, '{\"items\":[],\"invoice_id\":275,\"invoice_description\":\"Order with Invoice 275\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-24 18:30:13', '2019-02-24 18:30:14', 'USD', 1),
(316, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551015530', 1, '{\"items\":[{\"name\":\"Two Tone Color Denim Jeans\",\"price\":35.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":276,\"invoice_description\":\"Order with Invoice 276\",\"total\":35.81000000000000227373675443232059478759765625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-24 18:38:50', '2019-02-24 18:54:35', 'USD', 1),
(317, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551016522', 1, '{\"items\":[{\"name\":\"Two Tone Color Denim Jeans\",\"price\":35.81000000000000227373675443232059478759765625,\"qty\":2,\"description\":null}],\"invoice_id\":277,\"invoice_description\":\"Order with Invoice 277\",\"total\":71.6200000000000045474735088646411895751953125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-24 18:55:22', '2019-02-24 18:56:20', 'USD', 1),
(318, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551016627', 1, '{\"items\":[{\"name\":\"Two Tone Color Denim Jeans\",\"price\":35.81000000000000227373675443232059478759765625,\"qty\":2,\"description\":null},{\"name\":\"Hole Denim Jeans - BLACK L\",\"price\":15.980000000000000426325641456060111522674560546875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":278,\"invoice_description\":\"Order with Invoice 278\",\"total\":87.6000000000000085265128291212022304534912109375,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-24 18:57:07', '2019-02-24 18:57:07', 'USD', 1),
(319, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551016718', 1, '{\"items\":[{\"name\":\"Two Tone Color Denim Jeans\",\"price\":35.81000000000000227373675443232059478759765625,\"qty\":\"1\",\"description\":null}],\"invoice_id\":279,\"invoice_description\":\"Order with Invoice 279\",\"total\":35.81000000000000227373675443232059478759765625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-24 18:58:38', '2019-02-24 18:58:39', 'USD', 1),
(320, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551016877', 1, '{\"items\":[{\"name\":\"Two Tone Color Denim Jeans\",\"price\":35.81000000000000227373675443232059478759765625,\"qty\":\"3\",\"description\":null}],\"invoice_id\":280,\"invoice_description\":\"Order with Invoice 280\",\"total\":107.43000000000000682121026329696178436279296875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-24 19:01:17', '2019-02-24 19:01:17', 'USD', 1),
(321, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551022950', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":281,\"invoice_description\":\"Order with Invoice 281\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-24 20:42:30', '2019-02-24 20:42:31', 'USD', 1),
(322, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551022995', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":282,\"invoice_description\":\"Order with Invoice 282\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-24 20:43:15', '2019-02-24 20:43:16', 'USD', 1),
(323, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551076536', 1, '{\"items\":[{\"name\":\"Men\'s Cold-resistant Thicken Down Coat - TANGERINE L\",\"price\":72.06999999999999317878973670303821563720703125,\"qty\":\"1\",\"description\":null}],\"invoice_id\":283,\"invoice_description\":\"Order with Invoice 283\",\"total\":72.06999999999999317878973670303821563720703125,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-25 11:35:36', '2019-02-25 11:35:37', 'USD', 1),
(324, 5, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551106375', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":284,\"invoice_description\":\"Order with Invoice 284\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-25 19:52:55', '2019-02-25 19:57:54', 'USD', 1),
(325, 4, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551106478', 1, '{\"items\":[],\"invoice_id\":285,\"invoice_description\":\"Order with Invoice 285\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-25 19:54:38', '2019-02-25 19:56:32', 'USD', 1),
(326, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551155397', 1, '{\"items\":[{\"name\":\"Men Cotton Fashion Down Coat Parka - RED WINE M\",\"price\":42.86999999999999744204615126363933086395263671875,\"qty\":\"1\",\"description\":null}],\"invoice_id\":286,\"invoice_description\":\"Order with Invoice 286\",\"total\":42.86999999999999744204615126363933086395263671875,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-26 09:29:57', '2019-02-26 09:29:58', 'USD', 1),
(327, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551162807', 1, '{\"items\":[],\"invoice_id\":287,\"invoice_description\":\"Order with Invoice 287\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-26 11:33:27', '2019-02-26 11:33:27', 'USD', 1),
(328, 1, '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', '1551174699', 1, '{\"items\":[],\"invoice_id\":288,\"invoice_description\":\"Order with Invoice 288\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', '2019-02-26 14:51:39', '2019-02-26 14:51:42', 'USD', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(2, 'user', 'Normal User', '2018-05-20 12:47:48', '2018-05-20 12:47:48'),
(3, 'demo', 'demo', '2018-06-05 17:10:22', '2018-06-05 17:10:22');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `transaction_state_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `gross` double(8,2) NOT NULL,
  `fee` double(8,2) NOT NULL,
  `net` double(8,2) NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sends`
--

CREATE TABLE `sends` (
  `id` int(10) UNSIGNED NOT NULL,
  `receive_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `transaction_state_id` int(11) NOT NULL,
  `gross` double(8,2) NOT NULL,
  `fee` double(8,2) NOT NULL,
  `net` double(8,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'phpWallet', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', NULL, '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', NULL, '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'phpWallet', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to phpWallet Backend. The Admininstration Area.', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', NULL, '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', NULL, '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '106437665209-iqdqs0rgg4sumhi7oc039k6s0i5hvm88.apps.googleusercontent.com', '', 'text', 1, 'Admin'),
(11, 'site.site_name', 'Site Name', 'phpWallet', NULL, 'text', 6, 'Site'),
(13, 'merchant.merchant_fixed_fee', 'Merchant Fixed Fee', '3', NULL, 'text', 7, 'Merchant'),
(14, 'money-transfers.mt_percentage_fee', 'Money Transfer Percentage Fee', '2.9', NULL, 'text', 9, 'Money Transfers'),
(15, 'money-transfers.mt_fixed_fee', 'Money Transfer Fixed Fee', '3', NULL, 'text', 10, 'Money Transfers'),
(16, 'merchant.merchant_percentage_fee', 'Merchant Percentage Fee', '2.9', NULL, 'text', 11, 'Merchant'),
(18, 'footer.footer_text', 'Footer Text', '<p><u><a href=\"https://www.nationaltransaction.com/\">National Transaction Corporation</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>\r\n<p class=\"h6\">&amp;copy All right Reversed.<a class=\"text-green ml-2\" href=\"https://www.sunlimetech.com\" target=\"_blank\" rel=\"noopener\">Sunlimetech</a></p>', NULL, 'rich_text_box', 12, 'Footer');

-- --------------------------------------------------------

--
-- Table structure for table `ticketcategories`
--

CREATE TABLE `ticketcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticketcategories`
--

INSERT INTO `ticketcategories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'support', '2018-07-19 22:42:30', '2018-07-19 22:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `ticketcomments`
--

CREATE TABLE `ticketcomments` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticketcomments`
--

INSERT INTO `ticketcomments` (`id`, `ticket_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 8, 37, 'hello, please i need a response. Thanks!', '2018-12-24 23:13:57', '2018-12-24 23:13:57'),
(2, 8, 37, 'opllklklk', '2019-01-12 04:56:09', '2019-01-12 04:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticketcategory_id` int(11) DEFAULT NULL,
  `ticket_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactionable`
--

CREATE TABLE `transactionable` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `transactionable_id` int(11) NOT NULL,
  `transactionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `entity_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_state_id` int(11) NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `activity_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `money_flow` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gross` double(8,2) NOT NULL,
  `fee` double(8,2) NOT NULL DEFAULT '0.00',
  `net` double(8,2) NOT NULL,
  `balance` double DEFAULT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_states`
--

CREATE TABLE `transaction_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_states`
--

INSERT INTO `transaction_states` (`id`, `name`, `json_data`, `created_at`, `updated_at`) VALUES
(1, 'Completed', NULL, '2018-05-21 06:22:38', '2018-05-21 06:22:38'),
(2, 'Rejected', NULL, '2018-05-21 06:19:57', '2018-05-21 06:19:57'),
(3, 'Pending', NULL, '2018-05-21 06:19:00', '2018-05-21 06:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2018-05-20 12:47:50', '2018-05-20 12:47:50'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2018-05-20 12:47:51', '2018-05-20 12:47:51'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2018-05-20 12:47:51', '2018-05-20 12:47:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `merchant` tinyint(1) NOT NULL DEFAULT '0',
  `social` tinyint(1) NOT NULL DEFAULT '0',
  `balance` double(8,2) NOT NULL DEFAULT '0.00',
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `account_status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ticketit_admin` tinyint(1) NOT NULL DEFAULT '0',
  `ticketit_agent` tinyint(1) NOT NULL DEFAULT '0',
  `currency_id` int(11) DEFAULT '1',
  `is_ticket_admin` tinyint(4) DEFAULT '0',
  `verification_token` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `first_name`, `last_name`, `email`, `avatar`, `password`, `verified`, `merchant`, `social`, `balance`, `json_data`, `account_status`, `remember_token`, `settings`, `created_at`, `updated_at`, `ticketit_admin`, `ticketit_agent`, `currency_id`, `is_ticket_admin`, `verification_token`) VALUES
(104, 1, 'admin', 'admin', 'admin', 'admin@admin.com', 'users/admin/3bba2a866a36d83bfde76d292946baef372f8da3.png', '$2y$10$DstFMtZLCVGaEg0E1gwx1e.MYuU2moWbp592Rj8rfx8OOoD7/BEtC', 1, 0, 0, 0.00, NULL, 1, 'xaYBxOF19AkstXMZDS5CTsddzjbXhLoVihUMPWgBOKXcgmu9Uu5p1Zwx4yKG', NULL, '2018-07-11 01:21:24', '2019-02-25 11:22:23', 0, 0, 1, 1, 'q7fAPhFkc0tdxcnXH4JBls6krz2HfmyTtG4KiIRt');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `voucher_amount` double NOT NULL,
  `voucher_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_loader` int(11) DEFAULT NULL,
  `is_loaded` tinyint(4) DEFAULT '0',
  `voucher_fee` double DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL,
  `voucher_value` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `currency_id` int(10) NOT NULL,
  `amount` double DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_state_id` int(11) NOT NULL,
  `withdrawal_method_id` int(11) NOT NULL,
  `gross` double(8,2) NOT NULL,
  `fee` double(8,2) NOT NULL,
  `net` double(8,2) NOT NULL,
  `platform_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_methods`
--

CREATE TABLE `withdrawal_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage_fee` double(8,2) NOT NULL,
  `fixed_fee` double(8,2) NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawal_methods`
--

INSERT INTO `withdrawal_methods` (`id`, `name`, `comment`, `percentage_fee`, `fixed_fee`, `json_data`, `created_at`, `updated_at`) VALUES
(1, 'PayPal', '<p>PayPal Withdrawals Take up tp <strong>3 days</strong> to be processed.</p>', 2.00, 4.00, NULL, '2018-05-21 05:37:49', '2018-05-21 05:37:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`);

--
-- Indexes for table `currency_deposit_methods`
--
ALTER TABLE `currency_deposit_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_depositmethod_currency_id_` (`currency_id`),
  ADD KEY `currencie_deposit_deposit_method_id_index` (`deposit_method_id`);

--
-- Indexes for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_withdrawal_methods`
--
ALTER TABLE `currency_withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_methods`
--
ALTER TABLE `deposit_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receives`
--
ALTER TABLE `receives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `requests_ref_unique` (`ref`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sends`
--
ALTER TABLE `sends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `ticketcategories`
--
ALTER TABLE `ticketcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticketcomments`
--
ALTER TABLE `ticketcomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_ticket_id_unique` (`ticket_id`);

--
-- Indexes for table `transactionable`
--
ALTER TABLE `transactionable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_states`
--
ALTER TABLE `transaction_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vouchers_voucher_id_unique` (`voucher_code`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `currency_deposit_methods`
--
ALTER TABLE `currency_deposit_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `currency_withdrawal_methods`
--
ALTER TABLE `currency_withdrawal_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_methods`
--
ALTER TABLE `deposit_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exchanges`
--
ALTER TABLE `exchanges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receives`
--
ALTER TABLE `receives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sends`
--
ALTER TABLE `sends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ticketcategories`
--
ALTER TABLE `ticketcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticketcomments`
--
ALTER TABLE `ticketcomments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactionable`
--
ALTER TABLE `transactionable`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_states`
--
ALTER TABLE `transaction_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=617;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
