-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 30, 2019 at 05:15 AM
-- Server version: 10.1.37-MariaDB-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scrizrea_shoppingcart`
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
(7, NULL, 1, 'Men\'s Clothing', 'men-s-clothing', '2019-01-28 20:59:52', '2019-01-28 20:59:52'),
(8, NULL, 1, 'Women\'s Clothing', 'women-s-clothing', '2019-01-28 21:00:27', '2019-01-28 21:00:27'),
(9, NULL, 1, 'Consumer Electronics', 'consumer-electronics', '2019-01-28 21:01:00', '2019-01-28 21:01:00'),
(10, NULL, 1, 'Home & Garden', 'home-and-garden', '2019-01-28 21:01:24', '2019-01-28 21:01:24'),
(11, NULL, 1, 'Computer & Office', 'computer-and-office', '2019-01-28 21:02:02', '2019-01-28 21:02:02'),
(12, NULL, 1, 'Mobile Phones', 'mobile-phones', '2019-01-28 21:07:00', '2019-01-28 21:07:00'),
(13, NULL, 1, 'Lights & Lighting', 'lights-and-lighting', '2019-01-28 21:08:24', '2019-01-28 21:08:24');

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
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, '', 12),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '', 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, '', 9),
(23, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(24, 4, 'parent_id', 'hidden', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(25, 4, 'order', 'hidden', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(26, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(27, 4, 'slug', 'hidden', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(28, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(29, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
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
(57, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(58, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, NULL, 2),
(59, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 3),
(60, 7, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, NULL, 8),
(61, 7, 'thumbnailurl', 'text', 'Thumbnailurl', 0, 1, 1, 1, 1, 1, NULL, 5),
(62, 7, 'thumbnail', 'hidden', 'Thumbnail', 0, 1, 1, 1, 1, 1, NULL, 9),
(63, 7, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, NULL, 4),
(64, 7, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 6),
(65, 7, 'categorie_id', 'hidden', 'Categorie Id', 0, 1, 1, 1, 1, 1, NULL, 7),
(66, 7, 'product_belongsto_category_relationship', 'relationship', 'Category', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Categorie\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"categorie_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(73, 9, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, NULL, 1),
(74, 9, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, NULL, 3),
(75, 9, 'json_data', 'text', 'Json Data', 0, 0, 1, 0, 0, 0, NULL, 4),
(76, 9, 'is_paid', 'text', 'Is Paid', 0, 1, 1, 1, 1, 1, NULL, 5),
(77, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(78, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(79, 9, 'invoice_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(80, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(81, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(82, 10, 'category_id', 'hidden', 'Category Id', 1, 1, 1, 1, 1, 1, NULL, 4),
(83, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(84, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(85, 10, 'subcategory_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Categorie\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(86, 7, 'preview1_url', 'text', 'Preview1 Url', 0, 1, 1, 1, 1, 1, NULL, 12),
(87, 7, 'preview2_url', 'text', 'Preview2 Url', 0, 1, 1, 1, 1, 1, NULL, 13),
(88, 7, 'preview3_url', 'text', 'Preview3 Url', 0, 1, 1, 1, 1, 1, NULL, 14),
(89, 7, 'preview4_url', 'text', 'Preview4 Url', 0, 1, 1, 1, 1, 1, NULL, 15),
(90, 7, 'preview5_url', 'text', 'Preview5 Url', 0, 1, 1, 1, 1, 1, NULL, 16),
(91, 7, 'old_price', 'text', 'Old Price', 1, 1, 1, 1, 1, 1, NULL, 17),
(92, 7, 'product_belongsto_subcategory_relationship', 'relationship', 'subcategorie', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Subcategorie\",\"table\":\"subcategories\",\"type\":\"belongsTo\",\"column\":\"subcategorie_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(93, 7, 'subcategorie_id', 'text', 'Subcategorie Id', 0, 1, 1, 1, 1, 1, NULL, 18);

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
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-05-25 13:09:23', '2019-01-28 20:47:14'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(7, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-05-28 07:40:35', '2018-11-28 13:03:15'),
(9, 'invoices', 'invoices', 'Invoice', 'Invoices', 'voyager-text-file', 'App\\Invoice', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-03 15:20:45', '2018-11-28 12:12:36'),
(10, 'subcategories', 'subcategories', 'Subcategory', 'Subcategories', 'voyager-folder', 'App\\Subcategorie', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2019-01-28 20:43:54', '2019-01-28 20:43:54');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `json_data` longtext COLLATE utf8_unicode_ci,
  `is_paid` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `json_data`, `is_paid`, `created_at`, `updated_at`) VALUES
(26, 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":2,\"description\":null}],\"invoice_id\":26,\"invoice_description\":\"Order with Invoice 26\",\"total\":438,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-03 15:43:17', '2018-07-03 15:43:39'),
(27, 1, NULL, 0, '2018-07-05 03:08:28', '2018-07-05 03:08:28'),
(28, 16, NULL, 0, '2018-07-05 10:50:01', '2018-07-05 10:50:01'),
(29, 16, NULL, 0, '2018-07-05 10:50:32', '2018-07-05 10:50:32'),
(30, 17, NULL, 0, '2018-07-06 09:34:23', '2018-07-06 09:34:23'),
(31, 4, NULL, 0, '2018-07-06 19:56:16', '2018-07-06 19:56:16'),
(32, 4, NULL, 0, '2018-07-06 20:27:09', '2018-07-06 20:27:09'),
(33, 17, NULL, 0, '2018-07-08 14:12:21', '2018-07-08 14:12:21'),
(34, 17, NULL, 0, '2018-07-08 16:28:16', '2018-07-08 16:28:16'),
(35, 17, NULL, 0, '2018-07-08 16:30:22', '2018-07-08 16:30:22'),
(36, 17, NULL, 0, '2018-07-09 21:40:53', '2018-07-09 21:40:53'),
(37, 17, NULL, 0, '2018-07-10 03:17:36', '2018-07-10 03:17:36'),
(38, 17, NULL, 0, '2018-07-10 20:07:37', '2018-07-10 20:07:37'),
(39, 17, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":39,\"invoice_description\":\"Order with Invoice 39\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-13 12:47:05', '2018-07-13 12:48:51'),
(40, 17, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":40,\"invoice_description\":\"Order with Invoice 40\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-15 01:15:10', '2018-07-15 01:15:40'),
(41, 1, NULL, 0, '2018-07-15 12:50:50', '2018-07-15 12:50:50'),
(42, 19, '{\"items\":[],\"invoice_id\":42,\"invoice_description\":\"Order with Invoice 42\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-15 14:11:20', '2018-07-15 14:12:11'),
(43, 17, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":2,\"description\":null}],\"invoice_id\":43,\"invoice_description\":\"Order with Invoice 43\",\"total\":438,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-16 19:12:04', '2018-07-16 19:12:51'),
(44, 17, NULL, 0, '2018-07-16 19:13:11', '2018-07-16 19:13:11'),
(45, 1, NULL, 0, '2018-07-18 16:11:28', '2018-07-18 16:11:28'),
(46, 20, NULL, 0, '2018-07-21 04:25:33', '2018-07-21 04:25:33'),
(47, 21, NULL, 0, '2018-07-21 09:14:45', '2018-07-21 09:14:45'),
(48, 17, NULL, 0, '2018-07-21 22:00:37', '2018-07-21 22:00:37'),
(49, 17, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":2,\"description\":null}],\"invoice_id\":49,\"invoice_description\":\"Order with Invoice 49\",\"total\":278,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-22 20:29:55', '2018-07-22 20:30:57'),
(50, 22, NULL, 0, '2018-07-23 17:40:56', '2018-07-23 17:40:56'),
(51, 17, NULL, 0, '2018-07-24 17:18:52', '2018-07-24 17:18:52'),
(52, 17, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":52,\"invoice_description\":\"Order with Invoice 52\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-24 17:25:09', '2018-07-24 17:25:28'),
(53, 17, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":53,\"invoice_description\":\"Order with Invoice 53\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-24 17:29:05', '2018-07-24 17:29:19'),
(54, 17, NULL, 0, '2018-07-27 03:02:54', '2018-07-27 03:02:54'),
(55, 17, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":55,\"invoice_description\":\"Order with Invoice 55\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-27 13:50:50', '2018-07-27 13:51:40'),
(56, 23, NULL, 0, '2018-07-27 14:39:12', '2018-07-27 14:39:12'),
(57, 17, NULL, 0, '2018-07-29 13:34:18', '2018-07-29 13:34:18'),
(58, 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":2,\"description\":null}],\"invoice_id\":58,\"invoice_description\":\"Order with Invoice 58\",\"total\":240,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-31 04:06:13', '2018-07-31 04:07:11'),
(59, 1, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":2,\"description\":null}],\"invoice_id\":59,\"invoice_description\":\"Order with Invoice 59\",\"total\":240,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-07-31 04:07:46', '2018-07-31 04:08:33'),
(60, 17, NULL, 0, '2018-08-02 21:03:45', '2018-08-02 21:03:45'),
(61, 17, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":61,\"invoice_description\":\"Order with Invoice 61\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-02 23:00:43', '2018-08-02 23:01:38'),
(62, 17, NULL, 0, '2018-08-03 19:32:43', '2018-08-03 19:32:43'),
(63, 17, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"10\",\"description\":null}],\"invoice_id\":63,\"invoice_description\":\"Order with Invoice 63\",\"total\":1200,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-03 19:34:46', '2018-08-03 19:35:07'),
(64, 17, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":64,\"invoice_description\":\"Order with Invoice 64\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-05 18:56:48', '2018-08-05 18:57:30'),
(65, 17, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":65,\"invoice_description\":\"Order with Invoice 65\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-05 19:36:25', '2018-08-05 19:37:17'),
(66, 25, NULL, 0, '2018-08-06 07:39:33', '2018-08-06 07:39:33'),
(67, 25, NULL, 0, '2018-08-06 07:41:50', '2018-08-06 07:41:50'),
(68, 25, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":3,\"description\":null}],\"invoice_id\":68,\"invoice_description\":\"Order with Invoice 68\",\"total\":417,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-06 07:43:42', '2018-08-06 07:45:07'),
(69, 25, NULL, 0, '2018-08-06 08:22:25', '2018-08-06 08:22:25'),
(70, 17, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":70,\"invoice_description\":\"Order with Invoice 70\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-06 21:15:45', '2018-08-06 21:16:11'),
(71, 26, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":71,\"invoice_description\":\"Order with Invoice 71\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-07 12:06:14', '2018-08-07 12:50:06'),
(72, 27, NULL, 0, '2018-08-07 16:51:45', '2018-08-07 16:51:45'),
(73, 17, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":73,\"invoice_description\":\"Order with Invoice 73\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-07 23:32:48', '2018-08-07 23:33:15'),
(74, 17, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":74,\"invoice_description\":\"Order with Invoice 74\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-08 10:59:16', '2018-08-08 10:59:31'),
(75, 28, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":75,\"invoice_description\":\"Order with Invoice 75\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-08 23:35:15', '2018-08-08 23:35:46'),
(76, 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":76,\"invoice_description\":\"Order with Invoice 76\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-09 00:02:15', '2018-08-09 00:03:00'),
(77, 1, NULL, 0, '2018-08-10 00:01:39', '2018-08-10 00:01:39'),
(78, 17, '{\"items\":[{\"name\":\"Denim shirt\",\"price\":120,\"qty\":\"1\",\"description\":null}],\"invoice_id\":78,\"invoice_description\":\"Order with Invoice 78\",\"total\":120,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-10 06:33:41', '2018-08-10 06:34:30'),
(79, 1, NULL, 0, '2018-08-10 16:11:20', '2018-08-10 16:11:20'),
(80, 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":80,\"invoice_description\":\"Order with Invoice 80\",\"total\":297,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-10 17:12:30', '2018-08-10 17:13:11'),
(81, 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":81,\"invoice_description\":\"Order with Invoice 81\",\"total\":297,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-10 17:13:43', '2018-08-10 17:14:03'),
(82, 1, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"3\",\"description\":null}],\"invoice_id\":82,\"invoice_description\":\"Order with Invoice 82\",\"total\":297,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-10 17:14:41', '2018-08-10 17:15:15'),
(83, 1, NULL, 0, '2018-08-10 17:45:31', '2018-08-10 17:45:31'),
(84, 10, NULL, 0, '2018-08-11 14:39:01', '2018-08-11 14:39:01'),
(85, 10, NULL, 0, '2018-08-11 14:55:52', '2018-08-11 14:55:52'),
(86, 17, NULL, 0, '2018-08-11 17:24:20', '2018-08-11 17:24:20'),
(87, 1, NULL, 0, '2018-08-16 13:40:16', '2018-08-16 13:40:16'),
(88, 1, NULL, 0, '2018-08-16 14:08:18', '2018-08-16 14:08:18'),
(89, 1, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null},{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":89,\"invoice_description\":\"Order with Invoice 89\",\"total\":318,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-16 14:36:51', '2018-08-16 14:38:14'),
(90, 29, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":90,\"invoice_description\":\"Order with Invoice 90\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-29 10:44:59', '2018-08-29 10:50:10'),
(91, 29, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":91,\"invoice_description\":\"Order with Invoice 91\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-08-29 10:54:54', '2018-08-29 10:55:16'),
(92, 30, NULL, 0, '2018-08-31 01:56:52', '2018-08-31 01:56:52'),
(93, 17, '{\"items\":[{\"name\":\"Grey blouse\",\"price\":99,\"qty\":\"1\",\"description\":null}],\"invoice_id\":93,\"invoice_description\":\"Order with Invoice 93\",\"total\":99,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-09-02 13:33:47', '2018-09-02 13:34:07'),
(94, 31, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":94,\"invoice_description\":\"Order with Invoice 94\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-09-03 23:07:52', '2018-09-03 23:09:54'),
(95, 17, NULL, 0, '2018-09-04 11:14:45', '2018-09-04 11:14:45'),
(96, 17, NULL, 0, '2018-09-04 15:11:18', '2018-09-04 15:11:18'),
(97, 17, NULL, 0, '2018-09-04 15:11:22', '2018-09-04 15:11:22'),
(98, 17, '{\"items\":[{\"name\":\"Sweatshirt\",\"price\":139,\"qty\":\"1\",\"description\":null}],\"invoice_id\":98,\"invoice_description\":\"Order with Invoice 98\",\"total\":139,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-09-04 21:10:01', '2018-09-04 21:11:05'),
(99, 17, NULL, 0, '2018-09-06 19:29:12', '2018-09-06 19:29:12'),
(100, 32, NULL, 0, '2018-09-07 01:09:15', '2018-09-07 01:09:15'),
(101, 17, NULL, 0, '2018-09-10 21:00:15', '2018-09-10 21:00:15'),
(102, 17, NULL, 0, '2018-09-10 21:22:44', '2018-09-10 21:22:44'),
(103, 33, '{\"items\":[{\"name\":\"Black jacket\",\"price\":219,\"qty\":\"1\",\"description\":null}],\"invoice_id\":103,\"invoice_description\":\"Order with Invoice 103\",\"total\":219,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-09-13 10:45:08', '2018-09-13 10:46:24'),
(104, 34, NULL, 0, '2018-09-14 21:09:25', '2018-09-14 21:09:25'),
(105, 1, NULL, 0, '2018-09-16 17:22:08', '2018-09-16 17:22:08'),
(106, 35, NULL, 0, '2018-09-17 09:30:17', '2018-09-17 09:30:17'),
(107, 35, NULL, 0, '2018-09-17 09:31:58', '2018-09-17 09:31:58'),
(108, 36, NULL, 0, '2018-09-18 05:00:12', '2018-09-18 05:00:12'),
(109, 17, NULL, 0, '2018-09-18 10:41:28', '2018-09-18 10:41:28'),
(110, 1, NULL, 0, '2018-09-18 22:30:01', '2018-09-18 22:30:01'),
(111, 17, NULL, 0, '2018-09-22 13:56:26', '2018-09-22 13:56:26'),
(112, 17, NULL, 0, '2018-09-22 14:32:20', '2018-09-22 14:32:20'),
(113, 17, NULL, 0, '2018-09-22 23:08:27', '2018-09-22 23:08:27'),
(114, 1, NULL, 0, '2018-09-23 13:49:09', '2018-09-23 13:49:09'),
(115, 1, NULL, 0, '2018-09-23 13:49:58', '2018-09-23 13:49:58'),
(116, 1, NULL, 0, '2018-09-23 15:13:21', '2018-09-23 15:13:21'),
(117, 37, NULL, 0, '2018-09-23 15:49:46', '2018-09-23 15:49:46'),
(118, 37, NULL, 0, '2018-09-23 16:56:27', '2018-09-23 16:56:27'),
(119, 37, NULL, 0, '2018-09-23 16:58:06', '2018-09-23 16:58:06'),
(120, 37, NULL, 0, '2018-09-23 17:02:55', '2018-09-23 17:02:55'),
(121, 37, NULL, 0, '2018-09-24 17:16:31', '2018-09-24 17:16:31'),
(122, 37, NULL, 0, '2018-09-24 19:49:46', '2018-09-24 19:49:46'),
(123, 37, NULL, 0, '2018-09-24 20:40:23', '2018-09-24 20:40:23'),
(124, 17, NULL, 0, '2018-09-30 21:34:00', '2018-09-30 21:34:00'),
(125, 38, NULL, 0, '2018-10-05 23:01:48', '2018-10-05 23:01:48'),
(126, 17, NULL, 0, '2018-10-13 00:44:26', '2018-10-13 00:44:26'),
(127, 39, NULL, 0, '2018-10-15 09:46:24', '2018-10-15 09:46:24'),
(128, 40, NULL, 0, '2018-10-23 15:36:44', '2018-10-23 15:36:44'),
(129, 42, NULL, 0, '2018-10-30 19:26:11', '2018-10-30 19:26:11'),
(130, 17, NULL, 0, '2018-11-03 01:37:07', '2018-11-03 01:37:07'),
(131, 1, NULL, 0, '2018-11-06 19:54:55', '2018-11-06 19:54:55'),
(132, 17, NULL, 0, '2018-11-06 20:37:07', '2018-11-06 20:37:07'),
(133, 44, NULL, 0, '2018-11-07 02:11:06', '2018-11-07 02:11:06'),
(134, 45, NULL, 0, '2018-11-07 13:52:25', '2018-11-07 13:52:25'),
(135, 17, NULL, 0, '2018-11-08 04:04:38', '2018-11-08 04:04:38'),
(136, 17, NULL, 0, '2018-11-10 01:49:39', '2018-11-10 01:49:39'),
(137, 46, NULL, 0, '2018-11-12 00:41:12', '2018-11-12 00:41:12'),
(138, 17, NULL, 0, '2018-11-15 12:48:19', '2018-11-15 12:48:19'),
(139, 17, NULL, 0, '2018-11-15 13:05:10', '2018-11-15 13:05:10'),
(140, 47, NULL, 0, '2018-11-18 19:17:57', '2018-11-18 19:17:57'),
(141, 1, NULL, 0, '2018-11-20 15:43:47', '2018-11-20 15:43:47'),
(142, 1, NULL, 0, '2018-11-20 15:59:52', '2018-11-20 15:59:52'),
(143, 17, NULL, 0, '2018-11-23 02:59:44', '2018-11-23 02:59:44'),
(144, 49, NULL, 0, '2018-11-23 12:48:21', '2018-11-23 12:48:21'),
(145, 50, NULL, 0, '2018-11-24 20:08:30', '2018-11-24 20:08:30'),
(146, 17, NULL, 0, '2018-11-25 11:28:08', '2018-11-25 11:28:08'),
(147, 51, NULL, 0, '2018-11-27 01:38:04', '2018-11-27 01:38:04'),
(148, 51, NULL, 0, '2018-11-27 01:47:21', '2018-11-27 01:47:21'),
(149, 1, NULL, 0, '2018-11-30 13:35:20', '2018-11-30 13:35:20'),
(150, 1, NULL, 0, '2018-11-30 13:36:53', '2018-11-30 13:36:53'),
(151, 52, NULL, 0, '2018-12-02 00:37:40', '2018-12-02 00:37:40'),
(152, 17, NULL, 0, '2018-12-05 09:01:00', '2018-12-05 09:01:00'),
(153, 1, NULL, 0, '2018-12-10 21:22:07', '2018-12-10 21:22:07'),
(154, 17, NULL, 0, '2018-12-11 15:08:18', '2018-12-11 15:08:18'),
(155, 17, NULL, 0, '2018-12-11 15:21:09', '2018-12-11 15:21:09'),
(156, 17, NULL, 0, '2018-12-12 10:13:03', '2018-12-12 10:13:03'),
(157, 54, NULL, 0, '2018-12-13 22:48:21', '2018-12-13 22:48:21'),
(158, 54, NULL, 0, '2018-12-14 01:19:23', '2018-12-14 01:19:23'),
(159, 55, NULL, 0, '2018-12-14 11:08:55', '2018-12-14 11:08:55'),
(160, 56, NULL, 0, '2018-12-14 19:12:31', '2018-12-14 19:12:31'),
(161, 1, NULL, 0, '2018-12-15 00:25:48', '2018-12-15 00:25:48'),
(162, 57, NULL, 0, '2018-12-15 00:29:08', '2018-12-15 00:29:08'),
(163, 58, NULL, 0, '2018-12-17 15:39:38', '2018-12-17 15:39:38'),
(164, 59, NULL, 0, '2018-12-18 05:23:05', '2018-12-18 05:23:05'),
(165, 36, NULL, 0, '2018-12-19 14:01:13', '2018-12-19 14:01:13'),
(166, 57, NULL, 0, '2018-12-23 21:18:53', '2018-12-23 21:18:53'),
(167, 1, NULL, 0, '2018-12-24 12:29:11', '2018-12-24 12:29:11'),
(168, 1, NULL, 0, '2018-12-24 12:39:54', '2018-12-24 12:39:54'),
(169, 1, NULL, 0, '2018-12-24 12:42:09', '2018-12-24 12:42:09'),
(170, 1, NULL, 0, '2018-12-24 12:53:10', '2018-12-24 12:53:10'),
(171, 1, NULL, 0, '2018-12-24 12:59:46', '2018-12-24 12:59:46'),
(172, 1, NULL, 0, '2018-12-24 13:01:03', '2018-12-24 13:01:03'),
(173, 1, NULL, 0, '2018-12-24 13:05:58', '2018-12-24 13:05:58'),
(174, 1, NULL, 0, '2018-12-24 13:07:32', '2018-12-24 13:07:32'),
(175, 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":175,\"invoice_description\":\"Order with Invoice 175\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-12-24 14:06:41', '2018-12-24 14:07:18'),
(176, 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":176,\"invoice_description\":\"Order with Invoice 176\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-12-24 14:10:07', '2018-12-24 14:11:09'),
(177, 60, NULL, 0, '2018-12-24 18:42:38', '2018-12-24 18:42:38'),
(178, 60, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":178,\"invoice_description\":\"Order with Invoice 178\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-12-24 18:43:17', '2018-12-24 18:43:50'),
(179, 61, NULL, 0, '2018-12-25 04:30:07', '2018-12-25 04:30:07'),
(180, 17, NULL, 0, '2018-12-27 14:30:13', '2018-12-27 14:30:13'),
(181, 17, NULL, 0, '2018-12-28 17:52:50', '2018-12-28 17:52:50'),
(182, 62, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":182,\"invoice_description\":\"Order with Invoice 182\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2018-12-31 23:05:06', '2018-12-31 23:06:08'),
(183, 63, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":2,\"description\":null}],\"invoice_id\":183,\"invoice_description\":\"Order with Invoice 183\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2019-01-01 07:38:36', '2019-01-01 07:39:23'),
(184, 64, NULL, 0, '2019-01-01 13:55:14', '2019-01-01 13:55:14'),
(185, 65, NULL, 0, '2019-01-04 08:45:47', '2019-01-04 08:45:47'),
(186, 65, '{\"items\":[],\"invoice_id\":186,\"invoice_description\":\"Order with Invoice 186\",\"total\":0,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2019-01-04 08:46:43', '2019-01-04 08:50:20'),
(187, 65, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"2\",\"description\":null}],\"invoice_id\":187,\"invoice_description\":\"Order with Invoice 187\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2019-01-04 08:49:04', '2019-01-04 08:51:57'),
(188, 17, NULL, 0, '2019-01-04 22:40:18', '2019-01-04 22:40:18'),
(189, 17, NULL, 0, '2019-01-06 02:46:53', '2019-01-06 02:46:53'),
(190, 17, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":190,\"invoice_description\":\"Order with Invoice 190\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2019-01-06 14:44:35', '2019-01-06 14:46:26'),
(191, 66, NULL, 0, '2019-01-07 02:40:31', '2019-01-07 02:40:31'),
(192, 17, NULL, 0, '2019-01-07 20:22:00', '2019-01-07 20:22:00'),
(193, 17, NULL, 0, '2019-01-07 20:22:34', '2019-01-07 20:22:34'),
(194, 17, NULL, 0, '2019-01-07 20:24:13', '2019-01-07 20:24:13'),
(195, 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":2,\"description\":null}],\"invoice_id\":195,\"invoice_description\":\"Order with Invoice 195\",\"total\":20,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2019-01-08 06:22:19', '2019-01-08 06:25:57'),
(196, 17, NULL, 0, '2019-01-09 17:27:50', '2019-01-09 17:27:50'),
(197, 17, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"100\",\"description\":null}],\"invoice_id\":197,\"invoice_description\":\"Order with Invoice 197\",\"total\":1000,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2019-01-09 17:31:52', '2019-01-09 17:32:53'),
(198, 17, NULL, 0, '2019-01-11 02:57:35', '2019-01-11 02:57:35'),
(199, 67, NULL, 0, '2019-01-11 06:45:55', '2019-01-11 06:45:55'),
(200, 68, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":200,\"invoice_description\":\"Order with Invoice 200\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2019-01-11 15:14:14', '2019-01-11 15:14:58'),
(201, 68, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"1\",\"description\":null}],\"invoice_id\":201,\"invoice_description\":\"Order with Invoice 201\",\"total\":10,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2019-01-11 18:12:59', '2019-01-11 18:13:39'),
(202, 1, '{\"items\":[{\"name\":\"Sportswear\",\"price\":10,\"qty\":\"3\",\"description\":null}],\"invoice_id\":202,\"invoice_description\":\"Order with Invoice 202\",\"total\":30,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2019-01-28 20:21:16', '2019-01-28 20:22:06'),
(203, 17, '{\"items\":[{\"name\":\"Men Winter Long Pile Leather Jacket\",\"price\":45.9500000000000028421709430404007434844970703125,\"qty\":2,\"description\":null}],\"invoice_id\":203,\"invoice_description\":\"Order with Invoice 203\",\"total\":91.900000000000005684341886080801486968994140625,\"return_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/success?\",\"cancel_url\":\"http:\\/\\/shoppingcart.scriptdemo.website\\/public\\/pay\\/cancel\"}', 1, '2019-01-29 07:36:47', '2019-01-29 07:39:27'),
(204, 66, NULL, 0, '2019-01-30 13:57:32', '2019-01-30 13:57:32');

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
(1, 'admin', '2018-05-25 13:09:21', '2018-05-25 13:09:21');

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
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2018-05-25 13:09:21', '2018-05-25 13:09:21', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2018-05-25 13:09:21', '2018-09-25 03:31:10', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2018-05-25 13:09:21', '2018-05-25 13:09:21', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2018-05-25 13:09:21', '2018-05-25 13:09:21', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2018-05-25 13:09:21', '2019-01-28 21:11:18', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2018-05-25 13:09:21', '2018-09-25 03:31:10', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2018-05-25 13:09:21', '2018-09-25 03:31:10', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2018-05-25 13:09:21', '2018-09-25 03:31:10', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2018-05-25 13:09:21', '2018-09-25 03:31:10', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2018-05-25 13:09:21', '2019-01-28 21:11:05', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2018-05-25 13:09:23', '2018-09-25 03:31:10', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2018-05-25 13:09:24', '2018-09-25 03:31:10', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2018-05-25 13:09:24', '2018-09-25 03:31:10', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2018-05-25 13:09:24', '2018-09-25 03:31:10', 'voyager.hooks', NULL),
(15, 1, 'Products', '', '_self', 'voyager-bag', NULL, NULL, 11, '2018-05-28 07:40:35', '2019-01-28 21:11:05', 'voyager.products.index', NULL),
(17, 1, 'Invoices', '', '_self', 'voyager-receipt', '#000000', NULL, 12, '2018-07-03 15:20:45', '2019-01-28 21:11:05', 'voyager.invoices.index', 'null'),
(18, 1, 'Subcategories', '', '_self', 'voyager-folder', NULL, NULL, 8, '2019-01-28 20:43:54', '2019-01-28 21:11:18', 'voyager.subcategories.index', NULL);

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
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2016_01_01_000000_create_pages_table', 2),
(24, '2016_01_01_000000_create_posts_table', 2),
(25, '2016_02_15_204651_create_categories_table', 2),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

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
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2018-05-25 13:09:24', '2018-05-25 13:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'browse_admin', NULL, '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(2, 'browse_bread', NULL, '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(3, 'browse_database', NULL, '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(4, 'browse_media', NULL, '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(5, 'browse_compass', NULL, '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(6, 'browse_menus', 'menus', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(7, 'read_menus', 'menus', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(8, 'edit_menus', 'menus', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(9, 'add_menus', 'menus', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(10, 'delete_menus', 'menus', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(11, 'browse_roles', 'roles', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(12, 'read_roles', 'roles', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(13, 'edit_roles', 'roles', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(14, 'add_roles', 'roles', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(15, 'delete_roles', 'roles', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(16, 'browse_users', 'users', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(17, 'read_users', 'users', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(18, 'edit_users', 'users', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(19, 'add_users', 'users', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(20, 'delete_users', 'users', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(21, 'browse_settings', 'settings', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(22, 'read_settings', 'settings', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(23, 'edit_settings', 'settings', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(24, 'add_settings', 'settings', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(25, 'delete_settings', 'settings', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(26, 'browse_categories', 'categories', '2018-05-25 13:09:23', '2018-05-25 13:09:23'),
(27, 'read_categories', 'categories', '2018-05-25 13:09:23', '2018-05-25 13:09:23'),
(28, 'edit_categories', 'categories', '2018-05-25 13:09:23', '2018-05-25 13:09:23'),
(29, 'add_categories', 'categories', '2018-05-25 13:09:23', '2018-05-25 13:09:23'),
(30, 'delete_categories', 'categories', '2018-05-25 13:09:23', '2018-05-25 13:09:23'),
(31, 'browse_posts', 'posts', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(32, 'read_posts', 'posts', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(33, 'edit_posts', 'posts', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(34, 'add_posts', 'posts', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(35, 'delete_posts', 'posts', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(36, 'browse_pages', 'pages', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(37, 'read_pages', 'pages', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(38, 'edit_pages', 'pages', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(39, 'add_pages', 'pages', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(40, 'delete_pages', 'pages', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(41, 'browse_hooks', NULL, '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(42, 'browse_products', 'products', '2018-05-28 07:40:35', '2018-05-28 07:40:35'),
(43, 'read_products', 'products', '2018-05-28 07:40:35', '2018-05-28 07:40:35'),
(44, 'edit_products', 'products', '2018-05-28 07:40:35', '2018-05-28 07:40:35'),
(45, 'add_products', 'products', '2018-05-28 07:40:35', '2018-05-28 07:40:35'),
(46, 'delete_products', 'products', '2018-05-28 07:40:35', '2018-05-28 07:40:35'),
(52, 'browse_invoices', 'invoices', '2018-07-03 15:20:45', '2018-07-03 15:20:45'),
(53, 'read_invoices', 'invoices', '2018-07-03 15:20:45', '2018-07-03 15:20:45'),
(54, 'edit_invoices', 'invoices', '2018-07-03 15:20:45', '2018-07-03 15:20:45'),
(55, 'add_invoices', 'invoices', '2018-07-03 15:20:45', '2018-07-03 15:20:45'),
(56, 'delete_invoices', 'invoices', '2018-07-03 15:20:45', '2018-07-03 15:20:45'),
(57, 'browse_subcategories', 'subcategories', '2019-01-28 20:43:54', '2019-01-28 20:43:54'),
(58, 'read_subcategories', 'subcategories', '2019-01-28 20:43:54', '2019-01-28 20:43:54'),
(59, 'edit_subcategories', 'subcategories', '2019-01-28 20:43:54', '2019-01-28 20:43:54'),
(60, 'add_subcategories', 'subcategories', '2019-01-28 20:43:54', '2019-01-28 20:43:54'),
(61, 'delete_subcategories', 'subcategories', '2019-01-28 20:43:54', '2019-01-28 20:43:54');

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
(12, 1),
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
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1);

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
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-05-25 13:09:24', '2018-05-25 13:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `thumbnailurl` text COLLATE utf8_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `preview1_url` text COLLATE utf8_unicode_ci,
  `preview2_url` text COLLATE utf8_unicode_ci,
  `preview3_url` text COLLATE utf8_unicode_ci,
  `preview4_url` text COLLATE utf8_unicode_ci,
  `preview5_url` text COLLATE utf8_unicode_ci,
  `old_price` float NOT NULL DEFAULT '0',
  `subcategorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `description`, `thumbnailurl`, `thumbnail`, `title`, `price`, `categorie_id`, `preview1_url`, `preview2_url`, `preview3_url`, `preview4_url`, `preview5_url`, `old_price`, `subcategorie_id`) VALUES
(7, '2019-01-28 21:47:42', '2019-01-28 22:21:56', '<p><strong>Main Features:</strong><br />&bull; High quality PU leather material and pile design keep our warm in winter<br />&bull; Fashionable outlook design push us at the edge of vogue<br />&bull; Stand collar satisfies not only our need for fashion but also for warm<br />&bull; The trim design highlights our figure</p>', 'http://shoppingcart.scriptdemo.website/public/storage/product_thumbnails/Men%20Winter%20Fashionable%20Stand%20Collar%20Long%20Pile%20Leather%20Jacket%20-%20SCHOOL%20BUS%20YELLOW%20L/aOcnuRYQaMn0cD6IM6yZMdDjbF0Is0wr2avdrReu.webp', NULL, 'Men Winter Long Pile Leather Jacket', 45.95, 7, 'http://shoppingcart.scriptdemo.website/public/storage/product_thumbnails/Men%20Winter%20Fashionable%20Stand%20Collar%20Long%20Pile%20Leather%20Jacket%20-%20SCHOOL%20BUS%20YELLOW%20L/02w6sN1gNGfqk1chsLWVDdFi4V8nRSO5cD30lrOl.jpeg', 'http://shoppingcart.scriptdemo.website/public/storage/product_thumbnails/Men%20Winter%20Fashionable%20Stand%20Collar%20Long%20Pile%20Leather%20Jacket%20-%20SCHOOL%20BUS%20YELLOW%20L/DB59eaMR12kADCYZ5yOiQdQiDU0su7oXo2ob6YWH.webp', 'http://shoppingcart.scriptdemo.website/public/storage/product_thumbnails/Men%20Winter%20Fashionable%20Stand%20Collar%20Long%20Pile%20Leather%20Jacket%20-%20SCHOOL%20BUS%20YELLOW%20L/L3zDILiXsINtNRXp4bKL0GhhMX1nHkNygE3psK1n.webp', 'http://shoppingcart.scriptdemo.website/public/storage/product_thumbnails/Men%20Winter%20Fashionable%20Stand%20Collar%20Long%20Pile%20Leather%20Jacket%20-%20SCHOOL%20BUS%20YELLOW%20L/oWdIBlg0GI30kmzy9HUX4tvnl3xzdbA2hOReyvAk.webp', 'http://shoppingcart.scriptdemo.website/public/storage/product_thumbnails/Men%20Winter%20Fashionable%20Stand%20Collar%20Long%20Pile%20Leather%20Jacket%20-%20SCHOOL%20BUS%20YELLOW%20L/9Ww6yCVumlTWquRWvamLZ90RcZdmBXlwMx4az6rZ.jpeg', 95, 1);

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
(1, 'admin', 'Administrator', '2018-05-25 13:09:21', '2018-05-25 13:09:21'),
(2, 'user', 'Normal User', '2018-05-25 13:09:21', '2018-05-25 13:09:21');

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
(1, 'site.title', 'Site Title', 'ShoppingCart', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', NULL, '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', NULL, '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'ShoppingCart', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Shoppingcart . The Missing Admin for The Shopingcart script', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', NULL, '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', NULL, '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'phpwallet.merchant_key', 'Merchant Key', '$2y$10$ZpqJHz9zxdgnkjyDVj0P4O765wzJVDUGrt9v75JVhKMs2S7JLtFaS', NULL, 'text', 6, 'phpWallet'),
(12, 'phpwallet.merchant_id', 'Merchant ID', '2', NULL, 'text', 7, 'phpWallet'),
(17, 'phpwallet.merchant_currency', 'Merchant Currency Code', 'USD', NULL, 'text', 8, 'phpWallet'),
(18, 'phpwallet.merchant_currency_symbol', 'Merchant Currency Symbol', '$', NULL, 'text', 9, 'phpWallet'),
(23, 'phpwallet.merchant_request_status_url', 'Merchant Transaction Status URL', 'https://pagador.scriptdemo.website/public/request/status', NULL, 'text', 11, 'phpWallet'),
(24, 'phpwallet.merchant_request_url', 'Merchant Request URL', 'https://pagador.scriptdemo.website/public/purchase/link', NULL, 'text', 10, 'phpWallet');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Men\'s Jackets & Coats', 7, '2019-01-28 21:13:35', '2019-01-28 21:13:35');

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
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2018-05-25 13:09:24', '2018-05-25 13:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$/T5jZSeOLXoGLu2FX1wwr.YZsdkcaJlLW36hLIooRK3C625NZVm3y', 'KDUxZW8HA4taTO6ABdakDOoPqIxSbQANHA9k4s1ERqoAHu1q90xT5pJDy9s8', NULL, '2018-05-25 13:09:24', '2018-05-25 13:09:24'),
(2, 2, 'mrtmrt', 'mertsuslu@gmail.com', 'users/default.png', '$2y$10$.nY9BwQvR5si/4SrL.SxJOv/rVKWY5v7fzJuq/z0Y5n4XgoTejHGq', NULL, NULL, '2018-06-07 14:16:57', '2018-06-07 14:16:57'),
(3, 2, 'teste', 'a@a.com', 'users/default.png', '$2y$10$dtmD29ZpM3HpjKCogKGGG.D/KtByW3QxIYakbmVz/cL9TaBwCOa/u', NULL, NULL, '2018-06-15 21:37:42', '2018-06-15 21:37:42'),
(4, 2, 'artem', 'tcpr.ru@yandex.ru', 'users/default.png', '$2y$10$taRwrF16Yvs2ZBeou86R1OkBE0Hu/PypN8XNy5eXNK3UY73MgyRvu', NULL, NULL, '2018-06-16 02:57:56', '2018-06-16 02:57:56'),
(5, 2, 'zied', 'ziedmoney@gmail.com', 'users/default.png', '$2y$10$Ejk6vXC4cq5yXJ5TY3XZwun0L/TM6/ms0gMnpjAg2CPQ4LwiMhj3K', NULL, NULL, '2018-06-18 07:42:45', '2018-06-18 07:42:45'),
(6, 2, '123456', '123456@abcdefg.com', 'users/default.png', '$2y$10$yVnapNbxqmYzXoEeU5I6m.gvCMdFZ4w20zEj/7MDOT4xxPLg9VutC', NULL, NULL, '2018-06-18 19:16:20', '2018-06-18 19:16:20'),
(7, 2, 'ykk', 'ykk@theykk.net', 'users/default.png', '$2y$10$OPjVy1rC05q6DRW9jtEZdO1tIGOHi7F4oN7uAX5fgQa9dqcq146JW', NULL, NULL, '2018-06-19 13:43:50', '2018-06-19 13:43:50'),
(8, 2, 'Full Name', 'Fullmail@hotmail.com', 'users/default.png', '$2y$10$kkwAa4r1yAXbdG5F9Wyi0ebeJAzoJbuKmevy5CcY0Xm1dQ2MkdMUG', NULL, NULL, '2018-06-19 18:56:49', '2018-06-19 18:56:49'),
(9, 2, 'Md Abu bokor siddick', 'bestsocialdiary.help@gmail.com', 'users/default.png', '$2y$10$RhjJn3YiR5Uwx.4l0jPu3OgdJ8ZZocY6GVljbZqiW/1L6R8lepW6S', NULL, NULL, '2018-06-20 00:16:56', '2018-06-20 00:16:56'),
(10, 2, 'Micheal', 'tcetackles@gmail.com', 'users/default.png', '$2y$10$82xi4/3OS0PeLYEtU0VezuQ.OzC1W7dSftXJBgP5/9DKCTkhmZcmW', NULL, NULL, '2018-06-22 11:25:16', '2018-06-22 11:25:16'),
(11, 2, 'Jamil', 'jamilfernandez@gmail.com', 'users/default.png', '$2y$10$VHazKXJ3lq5S9PJ9uOkIcuOc.HsqzjqZ66HxP5Ji1yKCdBT8wrxJG', 'z6xyHaO342KMcBK553BEwiruhWJqRabgdbEwHjpQVgLj2PChrPIdoh303DeT', NULL, '2018-06-27 08:23:40', '2018-06-27 08:23:40'),
(12, 2, 'asdadas', 'gembel@gmail.com', 'users/default.png', '$2y$10$cyWR5YYjE51RS04IoulTCOEt9oC0biOLYTMAcJtaKeaICeY9a29Cy', NULL, NULL, '2018-06-29 04:15:38', '2018-06-29 04:15:38'),
(13, 2, 'san', 'sanayar2008@gamil.com', 'users/default.png', '$2y$10$1SSieVrxg1Y9yUAgnX6eM.vX0Omf4uu/IZULmztZ26fCX/VHRUBpi', NULL, NULL, '2018-06-29 19:41:35', '2018-06-29 19:41:35'),
(14, 2, 'nosaint', 'nosaint@gmail.com', 'users/default.png', '$2y$10$yFcgfP8r77hpXfyz9VZq/.ylxlxg1dZOgbiJfmVrqaWIRfRcLAybW', NULL, NULL, '2018-07-01 05:33:34', '2018-07-01 05:33:34'),
(15, 2, 'san', 'sanayar2008@gmail.com', 'users/default.png', '$2y$10$1aV8W7CaUMO1XJi0HbqLqeP1HUiBonG7H9f9m/6zLYdBwo5h5AC2e', NULL, NULL, '2018-07-01 18:36:57', '2018-07-01 18:36:57'),
(16, 2, 'Maria Luziene Souza', 'ninahoppus182@gmail.com', 'users/default.png', '$2y$10$GTFjvzk1lhikiLVxG/w7Y.MaFheVKFXSRCyIZLtvCazBg1uTzj8Ne', NULL, NULL, '2018-07-05 10:49:16', '2018-07-05 10:49:16'),
(17, 2, 'demouser@demouser.com', 'demouser@demouser.com', 'users/default.png', '$2y$10$KseSmODd0ZyJSPRf8d0HFu1OH7dMj4dOR0sw/1kk.chaZYvzZUwXq', 'jHL4B5YxajESyfsxvAJzAfSH51RRhFzXrw8Ru0YGuSJe9YQsvVZtgjuBNfFJ', NULL, '2018-07-06 09:33:56', '2018-07-06 09:33:56'),
(18, 2, 'elsner', 'elsnertechnologies@demo.com', 'users/default.png', '$2y$10$hMnsne0wncVnflzNSu/bCeFHq6TqMpWGnKeD00r9/5Q6Iv9c77.0G', NULL, NULL, '2018-07-13 09:34:03', '2018-07-13 09:34:03'),
(19, 2, 'Asif', 'masifp91@gmail.com', 'users/default.png', '$2y$10$uXtH0KABS6LEUcfS9MKguuCUkgfAl8gy0RRF/SUa3ScYRHW6ahv7e', NULL, NULL, '2018-07-15 14:10:56', '2018-07-15 14:10:56'),
(20, 2, 'fordemoonly', 'fordemoonly@gmail.com', 'users/default.png', '$2y$10$K7UL11M.Z2bi4Zl4LkevkuH0TjvyHK51G.KgBpGxsiUHzft3KIZGu', NULL, NULL, '2018-07-21 04:24:44', '2018-07-21 04:24:44'),
(21, 2, 'nakryt', 'nakrytik@Mail.ru', 'users/default.png', '$2y$10$TlPjOSK9bjl37dq6bV1G0OV52ppNvB/q4h04lemDLXAqLJE84yVHO', NULL, NULL, '2018-07-21 09:14:15', '2018-07-21 09:14:16'),
(22, 2, 'markson ell', 'marksonel74@gmail.com', 'users/default.png', '$2y$10$.9Z/2XMbwIuMuXwknq.Cquoo31lU0qeL6w2rXbG63vaiV55FcFJiC', NULL, NULL, '2018-07-23 17:39:33', '2018-07-23 17:39:33'),
(23, 2, 'Gaurav Kale', 'gavgaurav@gmail.com', 'users/default.png', '$2y$10$dHMCg49/tCmiwUxGi9yk3eZfuEiz0HRoXcteqs0gw5H6HirrDqSWC', NULL, NULL, '2018-07-27 14:38:48', '2018-07-27 14:38:48'),
(24, 2, 'Shop Borges', 'estoquesquidfacil@gmail.com', 'users/default.png', '$2y$10$AEGXGtavogSgGL/pUM9EvelULh6WNbcoVGtkX8sHGVSc.5ZdaUHR6', 'X3AHLAmQR1oY9tpIMvHzv12H5czvUgMVwGIdAjl1oBHhkvdqA6x5QUZA1bdI', NULL, '2018-08-03 03:13:02', '2018-08-03 03:13:02'),
(25, 2, 'Syafiq Affandi', 'syafiq.affandiy@gmail.com', 'users/default.png', '$2y$10$joFV4XmdnuseM7mGm7uI5O12RZD.Nf3clrdSPdkSTHwrtcH6DR4rO', 'd9H0LfXhFHnTO3fO2cSyQ7HerTJsb6uTKkcfQptkUMQeUiyx6w8FiYnhrlQx', NULL, '2018-08-06 07:27:12', '2018-08-06 07:27:12'),
(26, 2, 'demo', 'demo@demo.com', 'users/default.png', '$2y$10$zhWShwHM25INLozk7BUJKu2UwNVmWh2t0I1h1lFPE3BFi7InT1nyG', 'Y3b2E1FurZoNjOs6eXp7WJKOCSJBZGtUysrRxF635G7EmAANUR3zjn6fPxK5', NULL, '2018-08-07 11:33:03', '2018-08-07 11:33:03'),
(27, 2, 'hbsag', 'hhhh@yahoo.com', 'users/default.png', '$2y$10$JpKDOoBzmRvOyDa0xa.h8Ojhsxpqtbi28VsJUoVKlRHYwrcEd0Pea', NULL, NULL, '2018-08-07 16:50:40', '2018-08-07 16:50:40'),
(28, 2, 'a', 'a@mail.com', 'users/default.png', '$2y$10$pF/NLNLL1fO5Onk8Q3pefO/lYU7T/imBd9fria6nblhwvYuE9whQy', NULL, NULL, '2018-08-08 23:34:53', '2018-08-08 23:34:53'),
(29, 2, 'sandu', 'bitrakertrailers@gmail.com', 'users/default.png', '$2y$10$6QJdoG7s09xnO/fMdMeI2uZgz5oZ1J7Ge1AagbZN4u1jKGHmdvoa2', NULL, NULL, '2018-08-29 10:44:11', '2018-08-29 10:44:11'),
(30, 2, 'Emirhan', 'emirhn507@gmail.com', 'users/default.png', '$2y$10$MlPjrQhL5z35AHnAwDKeWucBhsEUMTgUpAskA5T6aMoWNdT8ziqXm', NULL, NULL, '2018-08-31 01:56:02', '2018-08-31 01:56:02'),
(31, 2, 'robert', 'wimopac@hurify1.com', 'users/default.png', '$2y$10$heSrVcRFJyWgjY96dZTMC.D4e3SD7DhI.P0wZAtXwiG0Am3/yI0sy', NULL, NULL, '2018-09-03 23:07:15', '2018-09-03 23:07:15'),
(32, 2, 'nak', 'nakrytik1@mail.ru', 'users/default.png', '$2y$10$SFRBnNV42nlm8dgUK6tKLu7RNl/1smfZfuFX.LIX.Xl1UhqlgATea', NULL, NULL, '2018-09-07 01:08:44', '2018-09-07 01:08:44'),
(33, 2, 'Engineer Vincent', 'simmshade@gmail.com', 'users/default.png', '$2y$10$9fGqbqAZX8KZGfqNA2uUz.iksfkCYEJpPuS4mgNCJ8R5LQdgQWcWW', NULL, NULL, '2018-09-13 10:44:45', '2018-09-13 10:44:45'),
(34, 2, 'Septyaman', 'im@septyaman.com', 'users/default.png', '$2y$10$8uWUGmwDzzCTeWAblVMBAedlKRoTun89fC1oRvY8IQDulz.Txnr8q', NULL, NULL, '2018-09-14 21:08:47', '2018-09-14 21:08:47'),
(35, 2, 'SURESH', 'suresh@jargonhandlers.com', 'users/default.png', '$2y$10$opip6pTj7u.CiVpeNrOFze0KscfktgziMw6D78MVowe1OOc3yyjG.', NULL, NULL, '2018-09-17 09:30:01', '2018-09-17 09:30:01'),
(36, 2, 'Constance J. Bassett', 'ConstanceJBassett@teleworm.us', 'users/default.png', '$2y$10$FjGqZnAQkMYhAKgqLqyt9eDqUMG0kIgUEab2XX/FUdzrlKCHg3MdS', NULL, NULL, '2018-09-18 04:45:43', '2018-09-18 04:45:43'),
(37, 2, 'xzfva', 'sales@gorillacontact.in', 'users/default.png', '$2y$10$b1eXQmgoS2IWSwAAr8PuaOH.MN83/qEHcNVk90p5d/bK6XuOdgmkG', 'M70D8p7tRfIRujSwVDRWJqjj7yHfVvVMmQfQFNsEfHkrfsSg0tfHOiy6a5YI', NULL, '2018-09-23 15:47:49', '2018-09-23 15:47:49'),
(38, 2, 'nfally', 'nfally05@gmail.com', 'users/default.png', '$2y$10$5anEn/ILzBOFcK6opXngtOfa7Vz.qnFAziutpzOJeftSM21CDoGKK', NULL, NULL, '2018-10-05 22:59:22', '2018-10-05 22:59:22'),
(39, 2, 'test', 'pong0969@gmail.com', 'users/default.png', '$2y$10$l5A8GLg00dN1SnWceWdKKezs7vZcTAcptIehcfsuWarfmUTVT31KG', NULL, NULL, '2018-10-15 09:45:48', '2018-10-15 09:45:48'),
(40, 2, 'Prince Charles Ejikeme', 'expressexpand@gmail.com', 'users/default.png', '$2y$10$PZ/GNR16lJ.d4txctRPC/en7W5/4a8R3lV5.//zmX2Yh.PAiGNSBq', 'LIxvH0hZAOEX6AzRZ2RoOQSJFK6QhU87W8f0cQk7z1Flm6gfUJPelklg0Oe3', NULL, '2018-10-23 15:35:34', '2018-10-23 15:35:34'),
(41, 2, 'Evgenii Antonenko', 'senior.an2014@yandex.ru', 'users/default.png', '$2y$10$7SRKveSeF0c5TD1h.SxuBOonTkXBL0jhzQTlsGisSnb3XeiUD9qbm', NULL, NULL, '2018-10-28 14:54:21', '2018-10-28 14:54:21'),
(42, 2, 'test123', 'test@gmail.com', 'users/default.png', '$2y$10$6UKkaS0JzI8Ow9M9RitdPO/oz6dpHxWynhzZgHks9PSmRmjG06I76', NULL, NULL, '2018-10-30 19:25:57', '2018-10-30 19:25:57'),
(43, 2, 'demo', 'demo123456@demo.com', 'users/default.png', '$2y$10$hDh0G/huXcsEku2.1iF9KOqOoYEuJnIv7GZ41R9/0yuEcQSzO8nxa', NULL, NULL, '2018-11-03 20:25:50', '2018-11-03 20:25:50'),
(44, 2, 'Test', 'richimwill@gmail.com', 'users/default.png', '$2y$10$eKGRZYZ5kcI9LKPas20MneBw1dXyRzcn2LzfhWPfEXj4vKof8L7HW', 'FfCXyuO0YsoEMwdmlaSoQhX87b8hAgL0Gl3HX6aA9Mw0RiNkHFuu6MxGB6D2', NULL, '2018-11-06 19:43:43', '2018-11-06 19:43:43'),
(45, 2, 'Ahmed Rageh', 'ahmedrageh@hotmail.com', 'users/default.png', '$2y$10$bNbbkTXEZz3SXceuNWOzruYWDEuaPS6N2GH2dJoZ0beUHqW3IT3Ai', NULL, NULL, '2018-11-07 13:50:59', '2018-11-07 13:50:59'),
(46, 2, 'Jose Melena', 'jose@dotsik.com', 'users/default.png', '$2y$10$ZOKVUSEJeLktGH5lLGwSoOZkxt1IN0c8sRuZQj8m./8ZjLIqKKXfa', 'uejSl3VNwldUwd7Lk7PdI0jtE8xeI0XCrbX7mamLf2w0UkJXtRztB4SnV6nt', NULL, '2018-11-12 00:40:36', '2018-11-12 00:40:36'),
(47, 2, 'asdjad asdfjasdflk', 'shajka@ashjkasc.com', 'users/default.png', '$2y$10$B28LD7fHNP5L42plnj07iun5YxWOwwIhfpG.TfYM1vGo9IzFDAIYO', NULL, NULL, '2018-11-18 19:17:19', '2018-11-18 19:17:19'),
(48, 2, 'Mizanur Rahman', 'sylpe2017@gmail.com', 'users/default.png', '$2y$10$RdTI5efC8a3wV0WY.zDRMeYZRKPsMJ4nXPWL1ySd2Vm0LqupA7QGq', NULL, NULL, '2018-11-20 06:30:59', '2018-11-20 06:30:59'),
(49, 2, 'nakrytik', 'nakrytt@gmail.com', 'users/default.png', '$2y$10$T9kBOwgjjLGwbzAOkKR0oOfXb03SxQjoZckwMU9/yTLWgnEpv/EJu', NULL, NULL, '2018-11-23 12:47:33', '2018-11-23 12:47:33'),
(50, 2, 'satyam', 'satyam.luvit@gmail.com', 'users/default.png', '$2y$10$7t8q890k9yJZ2.o/0dRUFOhb7EUECpxDbpXICnxtw82EWMA7EWJMO', NULL, NULL, '2018-11-24 20:07:44', '2018-11-24 20:07:44'),
(51, 2, 'Thabani Njoko', 'zumgeu@gobzii.ml', 'users/default.png', '$2y$10$IsBcObNMWCgV7ACbMDXCwOcQpX/rB2BdSmebTllR0skx0GYfBR.DO', NULL, NULL, '2018-11-27 01:37:05', '2018-11-27 01:37:05'),
(52, 2, 'test111', 'test111@mail.ru', 'users/default.png', '$2y$10$5YTgItch3ba/hTCsAzN0jODjzmu7JdLgX3ZnwGsi/dag1kcSKBbby', NULL, NULL, '2018-12-02 00:37:16', '2018-12-02 00:37:16'),
(53, 2, 'test', 'test@testing.com', 'users/default.png', '$2y$10$4L.dfl21nXb4AFYx9utnJ.QmyRd.r0tTqyVD.zMDO4MPlhcGFN7My', NULL, NULL, '2018-12-02 05:03:56', '2018-12-02 05:03:56'),
(54, 2, 'mikel stone', 'mikelstone2017@gmail.com', 'users/default.png', '$2y$10$CPRhGNpJnWXmR92YJbFYluvoGBdMFgPznAYDRHWk3AjQ6UlP.mJWG', NULL, NULL, '2018-12-13 22:47:22', '2018-12-13 22:47:22'),
(55, 2, 'abdiel', 'hh.abdiel@gmail.com', 'users/default.png', '$2y$10$00L2lNgxTy2bYn3U/cOsLOL1.TY4r6ud1mOy2Y.buxvHRbAWFFrO2', NULL, NULL, '2018-12-14 11:08:35', '2018-12-14 11:08:35'),
(56, 2, 'bill Johnson', 'test@example.com', 'users/default.png', '$2y$10$wDMcY2TQCdOsggQpNK0rsubVmEjYfW8ltnWaJDgz9RNNTuSMlmeJi', NULL, NULL, '2018-12-14 19:11:16', '2018-12-14 19:11:16'),
(57, 2, 'mjasi', 'admin@admino.com', 'users/default.png', '$2y$10$Oe.junQ0VZs9slpsXZ7EaOmKXsUHvZzczgHks5dLAQeakHRvUts7e', NULL, NULL, '2018-12-15 00:28:12', '2018-12-15 00:28:12'),
(58, 2, 'frefergreg', 'grzegregreger@gregrgerg.com', 'users/default.png', '$2y$10$iHO5rwtGWEgm4K1/ek5gjOUnXnr64P5DElFFAWhgHcC7zcecjC2TC', NULL, NULL, '2018-12-17 15:39:09', '2018-12-17 15:39:09'),
(59, 2, 'medy', 'guzmanahmed@gmail.com', 'users/default.png', '$2y$10$UiQiQiDk88NwgiDPW17zJ.Ef9dMNGi4/cgkVK2ZjbWq8lRQruDNZK', NULL, NULL, '2018-12-18 05:22:19', '2018-12-18 05:22:19'),
(60, 2, 'djasndj', 'adkisrael@gmail.com', 'users/default.png', '$2y$10$yrxbv4fRa2IkHNZ20N7r7u3vhV9./8UrkzjmAzPkVDB1nUpDDMr9O', NULL, NULL, '2018-12-24 18:42:22', '2018-12-24 18:42:22'),
(61, 2, 'nfally', 'nfally@yahoo.com', 'users/default.png', '$2y$10$gLrpRntNch.LrCEJHnNN.e.z1ApvxyBxr5xF7xDW8R83Qz1HrC/1G', NULL, NULL, '2018-12-25 04:29:19', '2018-12-25 04:29:19'),
(62, 2, 'SEZNEC', 'electro76@live.fr', 'users/default.png', '$2y$10$Sn1THwhBvvypIWmwE7v8NeIkNEGlSdVs/yF6qD8M/HDVZcpsx720S', NULL, NULL, '2018-12-31 23:04:35', '2018-12-31 23:04:35'),
(63, 2, 'demouser1@demouser.com', 'delijsd@glsd.csd', 'users/default.png', '$2y$10$FD4TQQFJA/QYRxTfSQP8i.AbBlCzw6q1S5cE0CaQosCDEzPztB7uu', NULL, NULL, '2019-01-01 07:37:43', '2019-01-01 07:37:43'),
(64, 2, 'SVC', 'webnappcoders@gmail.com', 'users/default.png', '$2y$10$k8X8WZfRl5t2dqXbCjsOMOAZ63Au5ozSdKPGRsN7dUqxdUxaXgH.e', NULL, NULL, '2019-01-01 13:54:52', '2019-01-01 13:54:52'),
(65, 2, 'Xeyiw', 'xeyiw@geroev.net', 'users/default.png', '$2y$10$4RQiXj6SzTSe708dprouQugiCsDHCaanKT73WdZb6ftw8iecayUNu', NULL, NULL, '2019-01-04 08:45:02', '2019-01-04 08:45:02'),
(66, 2, 'Jacque Cameroun', 'kamga.jk@gmail.com', 'users/default.png', '$2y$10$BLRbVFSDUk3UaXZbwpIHvO0vmGPgaclKTAbRaYXvSs2JG1VLX6Gpm', NULL, NULL, '2019-01-07 02:39:48', '2019-01-07 02:39:48'),
(67, 2, 'Constance J. Bassett', 'ConstanceJBassett@hotmail.com', 'users/default.png', '$2y$10$Z6oOLgmyxh3dj79dZvvqeeSW9kYOhNiJ1t3fTy3mUDSBK5.foPMmy', NULL, NULL, '2019-01-11 06:45:29', '2019-01-11 06:45:29'),
(68, 2, 'david tariot', 'worldwildeinvestor@gmail.com', 'users/default.png', '$2y$10$rkYISVliaPnJgQAZpYJgmu5zsQmGqQxFHcj1aHBlis9fEgelehBHK', '76nsEYwkpvSyWsgRsOWgKDl45t7BOZzQXOEdZ9kKQNWknDPtdSXOObCYBf5p', NULL, '2019-01-11 15:13:19', '2019-01-11 15:13:19'),
(69, 2, 'feijao', 'feijao@gmail.com', 'users/default.png', '$2y$10$J8PEQP9VECw93bCUYBT6LOkLVN8aqSp5ENG.aGyEOCB1RgWXRUm.m', 'Hgx2EJdabtoPYVzem4U7J60GTRiJ6A4sVqIiBq8JYvmzcVwAy3883x4a9HQM', NULL, '2019-01-28 15:26:18', '2019-01-28 15:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

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
