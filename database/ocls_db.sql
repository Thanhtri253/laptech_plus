-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2025 at 02:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12
CREATE DATABASE ocls_db;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ocls_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `status`, `date_created`) VALUES
(1, 'Asus', 'Asus Brand', 1, '2023-04-03 09:25:50'),
(2, 'Acer', 'Acer Brand', 1, '2023-04-03 09:26:04'),
(3, 'MSI', 'MSI Brand', 1, '2023-04-03 09:26:32'),
(4, 'Dell', 'Dell Brand', 1, '2023-04-03 09:28:59'),
(5, 'HP', 'HP Brand', 1, '2023-04-03 09:29:24'),
(6, 'Lenovo', 'Lenovo Brand', 1, '2023-04-03 09:29:53'),
(8, 'PC Intel', 'PC Intel Brand', 1, '2025-11-12 08:36:14'),
(9, 'PC AMD', 'PC AMD Brand', 1, '2025-11-12 08:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Personal Computers', 'This category contains personal computing devices, including laptops for mobile work and desktop PCs for home and office setups.', 1, '2023-04-03 09:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(7, 'Tri', 'Le', 'Male', '0901471035', 'thanhtri25032005@gmail.com', 'e489f2c0faf34969826fac5cab6b58d7', 'Vinh Hoi Ward, Ho Chi Minh city', '2025-11-17 19:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `date_created`, `date_updated`) VALUES
(1, 1, 10, '2023-04-03 11:30:20', NULL),
(2, 2, 15, '2023-04-03 13:48:35', NULL),
(3, 3, 5, '2025-11-10 08:27:31', NULL),
(4, 4, 10, '2025-11-10 09:31:52', NULL),
(5, 5, 10, '2025-11-10 09:42:29', NULL),
(6, 6, 15, '2025-11-10 11:46:57', NULL),
(7, 7, 7, '2025-11-10 12:02:16', NULL),
(8, 8, 20, '2025-11-10 12:09:02', NULL),
(9, 9, 3, '2025-11-10 12:18:06', NULL),
(10, 10, 10, '2025-11-10 12:27:01', NULL),
(11, 11, 5, '2025-11-10 12:33:01', NULL),
(12, 12, 20, '2025-11-10 12:38:53', '2025-11-10 12:39:59'),
(13, 13, 15, '2025-11-10 12:47:02', NULL),
(14, 14, 4, '2025-11-10 12:52:28', NULL),
(15, 15, 10, '2025-11-10 12:58:47', NULL),
(16, 16, 6, '2025-11-10 13:16:19', NULL),
(17, 17, 3, '2025-11-10 13:24:58', NULL),
(18, 18, 10, '2025-11-10 14:09:04', NULL),
(19, 19, 10, '2025-11-10 14:17:00', NULL),
(20, 20, 15, '2025-11-10 14:22:05', NULL),
(21, 21, 20, '2025-11-10 14:44:46', NULL),
(23, 24, 5, '2025-11-11 15:30:11', NULL),
(24, 25, 15, '2025-11-11 16:33:10', NULL),
(25, 26, 5, '2025-11-11 16:36:33', NULL),
(26, 27, 7, '2025-11-11 16:40:39', NULL),
(27, 28, 10, '2025-11-11 16:47:41', NULL),
(28, 29, 5, '2025-11-12 08:47:07', NULL),
(29, 30, 5, '2025-11-12 09:05:39', NULL),
(30, 31, 15, '2025-11-12 09:13:23', NULL),
(31, 32, 5, '2025-11-12 09:22:03', NULL),
(32, 33, 15, '2025-11-12 09:27:07', NULL),
(33, 34, 20, '2025-11-12 09:31:48', NULL),
(34, 35, 10, '2025-11-12 09:35:55', NULL),
(35, 36, 15, '2025-11-12 09:41:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `promotion_id` int(11) DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `promotion_id`, `discount_amount`, `date_created`, `date_updated`) VALUES
(10, 1, '123 Test St, HCMC', 'cod', 1, 237476.796875, 3, 1, NULL, 0, '2025-11-14 20:46:32', NULL),
(11, 6, '456 Sample Ave, HCMC', 'cod', 1, 129942.25, 0, 0, NULL, 0, '2025-11-16 20:46:32', NULL),
(12, 1, '789 Main Rd, HCMC', 'cod', 1, 115377.25, 1, 0, NULL, 0, '2025-11-17 20:46:32', NULL),
(13, 6, '999 New Addr, HCMC', 'cod', 1, 20, 3, 1, NULL, 0, '2025-11-17 20:46:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(10, 10, 4, 2, 118738.3984375, 237476.796875),
(11, 11, 16, 1, 129942.25, 129942.25),
(12, 12, 7, 1, 115377.25, 115377.25),
(13, 13, 4, 1, 118738.3984375, 118738.3984375),
(14, 13, 16, 1, 129942.25, 129942.25);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `sub_category_id`, `name`, `price`, `status`, `date_created`) VALUES
(3, 1, 1, 2, 'Laptop ASUS ROG Zephyrus G16 GU605CX-QR147W', 268870.00, 1, '2025-11-06 10:56:06'),
(4, 1, 1, 2, 'Laptop ASUS ROG Zephyrus G14 GA403WM QS051WS', 118738.40, 1, '2025-11-10 08:51:10'),
(5, 1, 1, 2, 'Laptop ASUS ROG Strix G18 G815LP S9102W', 120979.17, 1, '2025-11-10 09:41:01'),
(6, 1, 1, 2, 'Laptop ASUS ROG Zephyrus G14 GA403WM QS058WS', 125460.71, 1, '2025-11-10 11:46:21'),
(7, 2, 1, 2, 'Laptop Acer Predator Helios PHN16 73 757W', 115377.25, 1, '2025-11-10 12:01:59'),
(8, 2, 1, 2, 'Laptop Acer Nitro V ANV15 51 78BG', 66080.31, 1, '2025-11-10 12:08:48'),
(9, 2, 1, 2, 'Laptop Acer Predator Helios 18 PH18 73 98AQ', 313685.38, 1, '2025-11-10 12:17:38'),
(10, 2, 1, 2, 'Laptop Acer Nitro Lite 16 NL16 71G 71UJ', 50394.92, 1, '2025-11-10 12:26:42'),
(11, 4, 1, 2, 'Laptop Dell G15 5530 i9H161W11GR4060', 90728.78, 1, '2025-11-10 12:32:42'),
(12, 4, 1, 2, 'Laptop Dell Inspirion N3530 i5U165W11SLU (1334U)', 35829.91, 1, '2025-11-10 12:38:34'),
(13, 4, 1, 2, 'Laptop Dell 15 DC15250 i7U161W11SLU', 47033.76, 1, '2025-11-10 12:46:24'),
(14, 4, 1, 2, 'Laptop Dell XPS 9350 XPS9350-U5IA165W11GR-FP', 123219.94, 1, '2025-11-10 12:52:06'),
(15, 5, 1, 2, 'Laptop HP VICTUS 15 fb3116AX BX8U4PA', 47033.76, 1, '2025-11-10 12:58:19'),
(16, 5, 1, 2, 'Laptop HP OMEN 16-am0127TX BX8Y0PA', 129942.25, 1, '2025-11-10 13:06:04'),
(17, 5, 1, 2, 'Laptop HP OMEN MAX 16 ah0212TX C1WR1PA', 291277.69, 1, '2025-11-10 13:23:39'),
(18, 5, 1, 2, 'Laptop HP OMEN 14-fb0135TX AY8V1PA', 134423.80, 1, '2025-11-10 14:08:18'),
(19, 6, 1, 2, 'Laptop Lenovo Legion 5 15IRX10 83LY00HWVN', 91849.16, 1, '2025-11-10 14:16:45'),
(20, 6, 1, 2, 'Laptop Lenovo LOQ 15ARP9 83JC00LVVN', 48154.15, 1, '2025-11-10 14:21:52'),
(21, 6, 1, 2, 'Laptop Lenovo ThinkPad X1 Carbon Gen 13 21NX003DVN ', 89608.39, 1, '2025-11-10 14:27:25'),
(24, 6, 1, 2, 'Legion Pro 5 2025 R9000P OLED', 103173.51, 1, '2025-11-11 15:29:43'),
(25, 3, 1, 2, 'Laptop MSI Crosshair 16 HX AI D2XWFKG 035VN', 98686.73, 1, '2025-11-11 16:32:35'),
(26, 3, 1, 2, 'Laptop MSI Titan 18 HX AI A2XWJG 622VN', 336486.06, 1, '2025-11-11 16:36:23'),
(27, 3, 1, 2, 'Laptop MSI Stealth 18 AI Studio A1VHG 025VN', 201882.67, 1, '2025-11-11 16:40:12'),
(28, 3, 1, 2, 'Laptop MSI Stealth A16 AI+ A3XWFG 018VN', 130094.19, 1, '2025-11-11 16:47:17'),
(29, 8, 1, 8, ' PC GVN x AORUS XTREME ICE', 302857.66, 1, '2025-11-12 08:46:58'),
(30, 8, 1, 8, 'PC GVN INTEL I9-14900K/VGA RTX 5080', 246750.47, 1, '2025-11-12 09:05:23'),
(31, 8, 1, 8, 'PC GVN Intel i5-14400F/ VGA RTX 5060 Ti', 73112.08, 1, '2025-11-12 09:13:12'),
(32, 9, 1, 8, 'PC GVN AMD R9-9950X/ VGA RTX 4090', 309587.81, 1, '2025-11-12 09:21:39'),
(33, 9, 1, 8, ' PC GVN AMD R5-7600/ VGA RTX 4060', 57857.03, 1, '2025-11-12 09:26:41'),
(34, 9, 1, 8, 'PC GVN AMD R5-5500/ VGA RTX 3050', 33628.42, 1, '2025-11-12 09:31:35'),
(35, 9, 1, 8, 'PC GVN AMD R7-7700/ VGA RTX 3060', 68400.96, 1, '2025-11-12 09:35:17'),
(36, 8, 1, 8, ' PC GVN x Corsair iCUE (Intel i5-14400F/ VGA RTX 5060)', 69298.32, 1, '2025-11-12 09:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('percent','fixed') NOT NULL DEFAULT 'percent',
  `value` double NOT NULL,
  `max_uses` int(11) NOT NULL DEFAULT 100,
  `uses_count` int(11) NOT NULL DEFAULT 0,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `code`, `description`, `type`, `value`, `max_uses`, `uses_count`, `start_date`, `end_date`, `status`, `date_created`) VALUES
(1, 'BLACKFRIDAY', 'Black Friday Sale - 15% off everything!', 'percent', 15, 50, 0, '2025-11-24 20:29:00', '2025-11-30 20:29:00', 1, '2025-11-17 20:31:47'),
(2, 'NEW25', 'Get $25 off your first order.', 'fixed', 25, 100, 0, '2025-11-17 20:31:00', '2025-12-17 20:31:00', 1, '2025-11-17 20:32:44'),
(3, 'CLEAR100', '$100 off select Clearance items.', 'fixed', 100, 20, 0, '2025-11-17 20:32:00', '2025-11-27 20:32:00', 1, '2025-11-17 20:33:26'),
(4, 'FREESHIP', 'Free shipping on orders over $1000', 'fixed', 5, 100, 0, '2025-11-17 20:33:00', '2025-12-17 20:33:00', 1, '2025-11-17 20:34:25');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `permissions` text DEFAULT NULL COMMENT 'Stores JSON permissions'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`) VALUES
(1, 'Super Admin', '{\"all\": true}'),
(2, 'Manager', '{\"products\": true, \"orders\": true, \"promotions\": true}'),
(3, 'Staff', '{\"orders\": true}');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(8, 10, 237476.796875, '2025-11-14 20:46:32'),
(9, 11, 129942.25, '2025-11-16 20:46:32'),
(10, 12, 115377.25, '2025-11-17 20:46:32'),
(11, 13, 20, '2025-11-17 20:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `specification_list`
--

CREATE TABLE `specification_list` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specification_list`
--

INSERT INTO `specification_list` (`id`, `product_id`, `meta_field`, `meta_value`) VALUES
(963, 4, 'processor', 'AMD Ryzen™ 9 8945HS (8 cores/16 threads)'),
(964, 4, 'clock_speed', '4.0 GHz (Base Clock) up to 5.2 GHz (Max Boost Clock)'),
(965, 4, 'GPU', 'NVIDIA® GeForce RTX™ 4060 Laptop GPU 8GB GDDR6'),
(966, 4, 'RAM', '16GB LPDDR5X 6400MHz (on-board)'),
(967, 4, 'RAM_slot', '0 (All 16GB is soldered to the mainboard)'),
(968, 4, 'SSD_OR_HDD', '1TB PCIe® 4.0 NVMe™ M.2 SSD'),
(969, 4, 'OS', 'Windows 11 Home'),
(970, 4, 'display_size', '14.0-inch'),
(971, 4, 'display_type', '3K (2880 x 1800) ROG Nebula Display, OLED, 120Hz, 0.2ms, G-Sync, 100% DCI-P3'),
(972, 4, 'display_touch', 'No'),
(973, 4, 'power_adapter', '180W AC Adapter'),
(974, 4, 'battery_capacity', '73WHrs, 4-cell Li-ion'),
(975, 4, 'battery_hour', 'Varies significantly based on usage (e.g., light work vs. gaming)'),
(976, 4, 'dimension', '31.1 x 22.0 x 1.59 ~ 1.63 cm (12.24\" x 8.66\" x 0.63\" ~ 0.64\")'),
(977, 4, 'weight', '1.5 kg (3.31 lbs)'),
(978, 4, 'colors', 'Eclipse Gray'),
(979, 4, 'IO_ports', '1x USB 4 (supports DisplayPort™ / power delivery)\r\n1x USB 3.2 Gen 2 Type-C (supports DisplayPort™)\r\n2x USB 3.2 Gen 2 Type-A\r\n\r\n\r\n1x HDMI 2.1\r\n1x MicroSD card reader (UHS-II)\r\n1x 3.5mm Combo Audio Jack'),
(980, 4, 'fingerprint_sensor', 'No (Uses IR Camera for facial recognition)'),
(981, 4, 'camera', '1080P FHD IR Camera for Windows Hello'),
(982, 4, 'keyboard', 'Backlit Chiclet Keyboard (1-Zone RGB)'),
(983, 4, 'touchpad', 'Large glass touchpad'),
(984, 4, 'WIFI', 'Wi-Fi 6E (802.11ax) (Triple band) 2*2'),
(985, 4, 'bluetooth', 'Bluetooth® 5.3'),
(986, 4, 'speaker', '4-speaker (dual force woofer) system with Smart Amplifier, Dolby Atmos'),
(987, 4, 'mic', 'Built-in 3-microphone array'),
(988, 4, 'other', 'CNC-milled aluminum chassis\r\nSlash Lighting array on the lid\r\nMUX Switch + NVIDIA Advanced Optimus'),
(1015, 5, 'processor', 'Intel® Core™ Ultra 9 Processor 275HX 2.7 GHz (24 cores, 24 Threads)'),
(1016, 5, 'clock_speed', '2.7 GHz (36MB Cache, up to 5.4 GHz)'),
(1017, 5, 'GPU', 'NVIDIA® GeForce RTX™ 5070 Laptop GPU 8GB GDDR7'),
(1018, 5, 'RAM', '32GB (2x16GB) DDR5 5600Mhz'),
(1019, 5, 'RAM_slot', '2 slots (Max 64GB)'),
(1020, 5, 'SSD_OR_HDD', '1TB PCIe® 4.0 NVMe™ M.2 SSD (1 empty M.2 slot)'),
(1021, 5, 'OS', 'Windows 11 Home'),
(1022, 5, 'display_size', '18.0-inch'),
(1023, 5, 'display_type', '2.5K (2560 x 1600) IPS-level, 240Hz, 3ms, 500 nits, 100% DCI-P3, ROG Nebula Display'),
(1024, 5, 'display_touch', 'No (Anti-glare display)'),
(1025, 5, 'power_adapter', 'Not specified in provided data'),
(1026, 5, 'battery_capacity', '90WHrs, 4-cell Li-ion'),
(1027, 5, 'battery_hour', 'Not specified (Varies based on usage)'),
(1028, 5, 'dimension', '39.9 x 29.8 x 2.35 ~ 3.20 cm'),
(1029, 5, 'weight', '3.20 Kg'),
(1030, 5, 'colors', 'Volt Green'),
(1031, 5, 'IO_ports', '1x RJ45 LAN port (2.5G)\r\n\r\n1x Thunderbolt™ 4 (DisplayPort / power delivery)\r\n1x USB 3.2 Gen 2 Type-C (DisplayPort / power delivery / G-SYNC)\r\n3x USB 3.2 Gen 2 Type-A'),
(1032, 5, 'fingerprint_sensor', 'No (Uses IR Camera)'),
(1033, 5, 'camera', '1080P FHD IR Camera for Windows Hello'),
(1034, 5, 'keyboard', 'Backlit Chiclet Keyboard (Per-Key RGB) with Copilot key'),
(1035, 5, 'touchpad', 'Large glass touchpad'),
(1036, 5, 'WIFI', 'Wi-Fi 7 (802.11be) (Triple band) 2*2'),
(1037, 5, 'bluetooth', 'Bluetooth® v5.4'),
(1038, 5, 'speaker', '2-speaker system with Smart Amplifier Technology'),
(1039, 5, 'mic', 'Built-in 3-microphone array'),
(1040, 5, 'other', 'Intel® AI Boost NPU (up to 13TOPS)'),
(1067, 3, 'processor', 'Intel® Core™ Ultra 9 285H Processor'),
(1068, 3, 'clock_speed', 'Up to 5.1 GHz Max Turbo Frequency'),
(1069, 3, 'GPU', 'NVIDIA® GeForce RTX™ 5090'),
(1070, 3, 'RAM', '64GB LPDDR5X (on-board)'),
(1071, 3, 'RAM_slot', '0 (All 64GB is soldered to the mainboard)'),
(1072, 3, 'SSD_OR_HDD', '2TB PCIe® 4.0 NVMe™ M.2 SSD'),
(1073, 3, 'OS', 'Windows 11 Home'),
(1074, 3, 'display_size', '16.0 inch'),
(1075, 3, 'display_type', '2.5K (2560 x 1600, WQXGA), 16:10, OLED, 240Hz, 0.2ms, 500 nits, ROG Nebula Display, G-Sync, Pantone Validated, Dolby Vision HDR'),
(1076, 3, 'display_touch', 'No'),
(1077, 3, 'power_adapter', '240W AC Adapter (or higher, depending on final GPU config)'),
(1078, 3, 'battery_capacity', '90WHrs, 4-cell Li-ion'),
(1079, 3, 'battery_hour', 'Varies significantly based on usage (e.g., gaming vs. web browsing)'),
(1080, 3, 'dimension', '35.4 x 24.6 x 1.49 ~ 1.74 cm'),
(1081, 3, 'weight', '1.95 kg'),
(1082, 3, 'colors', 'Eclipse Gray'),
(1083, 3, 'IO_ports', '1x Thunderbolt™ 4 (supports DisplayPort / power delivery)\r\n1x USB 3.2 Gen 2 Type-C (supports DisplayPort / power delivery)\r\n2x USB 3.2 Gen 2 Type-A\r\n1x HDMI 2.1 FRL\r\n1x 3.5mm Combo Audio Jack\r\n1x SD card reader (UHS-II)'),
(1084, 3, 'fingerprint_sensor', 'No (Uses IR Camera for facial recognition)'),
(1085, 3, 'camera', '1080P FHD IR Camera for Windows Hello'),
(1086, 3, 'keyboard', 'Backlit Chiclet Keyboard 1-Zone RGB (Per-Key RGB)'),
(1087, 3, 'touchpad', 'Large glass touchpad'),
(1088, 3, 'WIFI', 'Wi-Fi 7 (802.11be) (Triple band) 2*2'),
(1089, 3, 'bluetooth', 'Bluetooth® 5.4'),
(1090, 3, 'speaker', '4-speaker (dual force woofer) system with Smart Amplifier, Dolby Atmos'),
(1091, 3, 'mic', 'Built-in 3-microphone array'),
(1092, 3, 'other', 'Intel® AI Boost NPU\r\nMUX Switch + NVIDIA® Advanced Optimus\r\nCooling system ROG Intelligent Cooling'),
(1093, 6, 'processor', 'AMD Ryzen™ AI 9 HX 370 (12 cores, 24 Threads)'),
(1094, 6, 'clock_speed', '2.0GHz (36MB Cache, up to 5.1GHz)'),
(1095, 6, 'GPU', 'NVIDIA® GeForce RTX™ 5060 Laptop GPU 8GB GDDR7'),
(1096, 6, 'RAM', '32GB LPDDR5X 7500MHz (on-board)'),
(1097, 6, 'RAM_slot', '0 (Not upgradeable)'),
(1098, 6, 'SSD_OR_HDD', '1TB PCIe® 4.0 NVMe™ M.2 SSD (1 slot, replaceable up to 2TB)'),
(1099, 6, 'OS', 'Windows 11 Home + Microsoft Office Home 2024 + Microsoft 365 Basic'),
(1100, 6, 'display_size', '14.0-inch'),
(1101, 6, 'display_type', '3K (2880 x 1800) ROG Nebula OLED, 120Hz, G-Sync, 500 nits, 100% DCI-P3, Glossy'),
(1102, 6, 'display_touch', 'No'),
(1103, 6, 'power_adapter', '200W AC Adapter (Supports 100W USB-C Power Delivery)'),
(1104, 6, 'battery_capacity', '73WHrs, 4-cell Li-ion'),
(1105, 6, 'battery_hour', 'Varies by use (Approx. 4-10 hours depending on workload)'),
(1106, 6, 'dimension', '31.1 x 22.0 x 1.59 ~ 1.63 cm'),
(1107, 6, 'weight', '1.5 Kg'),
(1108, 6, 'colors', 'Platinum White'),
(1109, 6, 'IO_ports', '1x Type-C USB 4 (DisplayPort™ / power delivery)\r\n1x USB 3.2 Gen 2 Type-C (DisplayPort™ / power delivery / G-SYNC)\r\n2x USB 3.2 Gen 2 Type-A\r\n1x MicroSD card reader (UHS-II)\r\n1x HDMI 2.1 FRL\r\n1x 3.5mm Combo Audio Jack'),
(1110, 6, 'fingerprint_sensor', 'No (Uses IR Camera)'),
(1111, 6, 'camera', '1080P FHD IR Camera for Windows Hello'),
(1112, 6, 'keyboard', 'Backlit Chiclet Keyboard (1-Zone RGB) with Copilot key'),
(1113, 6, 'touchpad', 'Large glass touchpad'),
(1114, 6, 'WIFI', 'Wi-Fi 7 (802.11be) (Triple band) 2*2'),
(1115, 6, 'bluetooth', 'v5.4'),
(1116, 6, 'speaker', '4-speaker (dual force woofer) system with Smart Amplifier Technology, 2 Tweeters'),
(1117, 6, 'mic', 'Built-in 3-microphone array'),
(1118, 6, 'other', 'AMD XDNA™ NPU up to 50TOPS\r\nGPU Turbo Mode: 1737MHz at 90W'),
(1119, 7, 'processor', 'Intel® Core™ Ultra 7 processor 255HX (20 cores, 20 threads)'),
(1120, 7, 'clock_speed', 'Up to 5.2 GHz, 30MB Cache'),
(1121, 7, 'GPU', 'NVIDIA® GeForce RTX™ 5060 8GB GDDR7 (572 TOPS)'),
(1122, 7, 'RAM', '32GB (1x32GB) DDR5 6400MHz'),
(1123, 7, 'RAM_slot', '2x SO-DIMM sockets (up to 96GB)'),
(1124, 7, 'SSD_OR_HDD', '1TB PCIe NVMe SED SSD (1 empty M.2 Gen 4 slot)'),
(1125, 7, 'OS', 'Windows 11 Home Single Language'),
(1126, 7, 'display_size', '16.0-inch'),
(1127, 7, 'display_type', '2K+ (2560 x 1600) 240Hz, 500 nits, 100% DCI-P3, Acer ComfyView™ LED-backlit TFT LCD'),
(1128, 7, 'display_touch', 'No'),
(1129, 7, 'power_adapter', '230W AC Adapter'),
(1130, 7, 'battery_capacity', '90Wh 4-cell Li-ion battery'),
(1131, 7, 'battery_hour', 'Varies based on usage'),
(1132, 7, 'dimension', '356.78 (W) x 275.5 (D) x 13.47/23.90 (H) mm'),
(1133, 7, 'weight', '2.8 kg'),
(1134, 7, 'colors', 'Obsidian Black'),
(1135, 7, 'IO_ports', '1x Thunderbolt™ 4 (Type-C, supports DisplayPort & 100W PD)\r\n1x USB 3.2 Gen 2 Type-C (supports DisplayPort & 90W PD)\r\n1x USB 3.2 Gen 2 Type-A (with power-off charging)\r\n1x USB 3.2 Gen 2 Type-A\r\n1x USB 3.2 Gen 1 Type-A\r\n1x HDMI® 2.1\r\n1x Ethernet (RJ-45) port\r\n1x microSD Card Reader\r\n1x 3.5 mm headphone/speaker jack\r\n1x DC-in jack'),
(1136, 7, 'fingerprint_sensor', 'No'),
(1137, 7, 'camera', '1080p HD camera (60 fps)'),
(1138, 7, 'keyboard', 'Full-size, 4-Zone RGB Backlit'),
(1139, 7, 'touchpad', 'Large glass touchpad'),
(1140, 7, 'WIFI', '802.11ax (Wi-Fi 6E)'),
(1141, 7, 'bluetooth', 'Bluetooth® 5.4'),
(1142, 7, 'speaker', 'DTS X:Ultra Audio'),
(1143, 7, 'mic', 'Supported via 3.5mm headset jack'),
(1144, 7, 'other', 'LAN: Killer™ Ethernet E3100G\r\nNPU: 13 TOPS\r\nCooling: Dual Fan (1x AeroBlade 3D 5th gen), Liquid Metal\r\nMaterials: Aluminum (Lid), ABS Plastic (Base)'),
(1145, 8, 'processor', 'Intel® Core™ i7-13620H (10 Cores / 16 Threads, 24 MB Cache)'),
(1146, 8, 'clock_speed', '3.60 GHz (up to 4.90 GHz Max Turbo)'),
(1147, 8, 'GPU', 'NVIDIA® GeForce RTX™ 4060 8GB GDDR6'),
(1148, 8, 'RAM', '16GB (2x8GB) DDR5 5200MHz'),
(1149, 8, 'RAM_slot', '2x SO-DIMM sockets (up to 96GB)'),
(1150, 8, 'SSD_OR_HDD', '512GB PCIe NVMe SED SSD (1 empty M.2 slot, up to 2TB)'),
(1151, 8, 'OS', 'Windows 11 Home'),
(1152, 8, 'display_size', '15.6-inch'),
(1153, 8, 'display_type', 'FHD (1920 x 1080) IPS, 180Hz, 100% sRGB, 300 nits, Acer ComfyView™'),
(1154, 8, 'display_touch', 'No'),
(1155, 8, 'power_adapter', '135W AC Adapter'),
(1156, 8, 'battery_capacity', '57WHr, 4-cell Li-ion'),
(1157, 8, 'battery_hour', 'Varies by use (Approx. 4-7 hours of light web/video use)'),
(1158, 8, 'dimension', '362.3 (W) x 239.89 (D) x 22.9/26.9 (H) mm'),
(1159, 8, 'weight', '2.1 kg'),
(1160, 8, 'colors', 'Obsidian Black'),
(1161, 8, 'IO_ports', '1x Thunderbolt™ 4 (Type-C, supports DisplayPort)\r\n3x USB 3.2 Gen 1 Type-A (one with power-off charging)\r\n1x HDMI® 2.1\r\n1x Ethernet (RJ-45) port\r\n1x 3.5mm headphone/speaker jack'),
(1162, 8, 'fingerprint_sensor', 'No'),
(1163, 8, 'camera', '720p HD Camera'),
(1164, 8, 'keyboard', 'Backlit Chiclet Keyboard (White LED)'),
(1165, 8, 'touchpad', 'Precision Touchpad'),
(1166, 8, 'WIFI', 'Wi-Fi 6 (802.11ax), Dual Band (2.4 GHz and 5 GHz)'),
(1167, 8, 'bluetooth', 'Bluetooth® 5.1'),
(1168, 8, 'speaker', 'DTS® X:Ultra Audio'),
(1169, 8, 'mic', 'Built-in dual microphone array'),
(1170, 8, 'other', 'Material: Plastic Chassis\r\nLAN: Gigabit Ethernet\r\nCard Reader: None'),
(1171, 9, 'processor', 'Intel® Core™ Ultra 9 processor 275HX (24 Cores / 24 Threads)'),
(1172, 9, 'clock_speed', 'Up to 5.4 GHz, 36MB Cache'),
(1173, 9, 'GPU', 'NVIDIA® GeForce RTX™ 5090 24GB GDDR7 (1824 TOPS)'),
(1174, 9, 'RAM', '192GB (4x48GB) DDR5 4000Mhz'),
(1175, 9, 'RAM_slot', '4x SO-DIMM sockets'),
(1176, 9, 'SSD_OR_HDD', '6TB (2x 3TB) M.2 NVMe (Total 3 slots)'),
(1177, 9, 'OS', 'Windows 11 Pro'),
(1178, 9, 'display_size', '18.0-inch'),
(1179, 9, 'display_type', '4K (3840 x 2400) IPS MiniLED, 1000 nits (HDR), 100% DCI-P3, Acer ComfyView™'),
(1180, 9, 'display_touch', 'No'),
(1181, 9, 'power_adapter', '400W AC Adapter'),
(1182, 9, 'battery_capacity', '99.98 Wh 4-cell Li-ion battery (User provided 90Wh)'),
(1183, 9, 'battery_hour', 'Varies significantly based on usage'),
(1184, 9, 'dimension', '400.96 (W) x 307.9 (D) x 29.55 (H) mm'),
(1185, 9, 'weight', '3.5 kg'),
(1186, 9, 'colors', 'Abyssal Black'),
(1187, 9, 'IO_ports', '2x Thunderbolt™ 5 (Type-C, supports DisplayPort & 100W PD)\r\n1x USB 3.2 Gen 2 Type-A (with power-off charging)\r\n1x USB 3.2 Gen 2 Type-A\r\n1x USB 3.2 Gen 1 Type-A\r\n1x HDMI® 2.1\r\n1x Ethernet (RJ-45) port\r\n1x SD™ Card reader\r\n1x 3.5 mm headphone/speaker jack\r\n1x DC-in jack'),
(1188, 9, 'fingerprint_sensor', 'No (Uses IR Camera for Windows Hello)'),
(1189, 9, 'camera', '1080p FHD IR Camera (60 fps) with Temporal Noise Reduction'),
(1190, 9, 'keyboard', 'Per-Key RGB Backlit Chiclet Keyboard'),
(1191, 9, 'touchpad', 'Precision Touchpad'),
(1192, 9, 'WIFI', 'Killer™ Wi-Fi 7 Wireless LAN'),
(1193, 9, 'bluetooth', 'Bluetooth® 5.4'),
(1194, 9, 'speaker', '6-speaker (Quad+Dual) system (Predator Vox) with Smart Amplifier'),
(1195, 9, 'mic', 'Built-in dual microphone array'),
(1196, 9, 'other', 'LAN: Killer™ Ethernet E5000B 5G\r\nNPU: 13 TOPS\r\nCooling: Dual Fan (2x AeroBlade 3D 6th gen), Liquid Metal\r\nMaterials: Metal (Lid), ABS Plastic (Base)'),
(1223, 11, 'processor', 'Intel® Core™ i9-13900HX (24 cores, 32 threads)'),
(1224, 11, 'clock_speed', 'Up to 5.40 GHz Turbo, 36MB Cache'),
(1225, 11, 'GPU', 'NVIDIA® GeForce RTX™ 4060 8GB GDDR6'),
(1226, 11, 'RAM', '16GB (2x8GB) DDR5 4800MHz'),
(1227, 11, 'RAM_slot', '2x SO-DIMM sockets (up to 32GB)'),
(1228, 11, 'SSD_OR_HDD', '1TB M.2 PCIe NVMe SSD (2x M.2 slots total)'),
(1229, 11, 'OS', 'Windows 11 Home + Office Home & Student'),
(1230, 11, 'display_size', '15.6-inch'),
(1231, 11, 'display_type', 'FHD (1920x1080) 165Hz, 3ms, 100% sRGB, ComfortViewPlus, G-SYNC+DDS'),
(1232, 11, 'display_touch', 'No'),
(1233, 11, 'power_adapter', '330W AC Adapter'),
(1234, 11, 'battery_capacity', '86WHrs, 6-cell Li-ion'),
(1235, 11, 'battery_hour', 'Varies based on usage'),
(1236, 11, 'dimension', '357.26 x 274.52 x 26.95 (mm)'),
(1237, 11, 'weight', '2.81 kg'),
(1238, 11, 'colors', 'Dark Shadow Grey'),
(1239, 11, 'IO_ports', '1x USB-C 3.2 Gen 2 (with DisplayPort™)\r\n3x USB 3.2 Gen 1 ports\r\n1x HDMI 2.1 port\r\n1x RJ45 Ethernet port\r\n1x Headset (headphone and microphone combo) port'),
(1240, 11, 'fingerprint_sensor', 'No'),
(1241, 11, 'camera', 'HD (720p) Webcam'),
(1242, 11, 'keyboard', 'US English 4-Zone RGB Backlit Keyboard with Numeric Keypad and G-Key'),
(1243, 11, 'touchpad', 'Precision Touchpad (105mm x 60mm)'),
(1244, 11, 'WIFI', 'Intel® Wi-Fi 6 AX201, 2x2, 802.11ax'),
(1245, 11, 'bluetooth', 'Bluetooth® 5.2'),
(1246, 11, 'speaker', 'Stereo speakers with Nahimic Audio'),
(1247, 11, 'mic', 'Single Array Digital Microphone'),
(1248, 11, 'other', 'LAN: 10/100/1000 Mbps'),
(1301, 12, 'processor', 'Intel® Core™ i5-1334U (10 Cores / 12 Threads)'),
(1302, 12, 'clock_speed', 'Up to 4.6 GHz, 12MB Cache'),
(1303, 12, 'GPU', 'Intel® Iris® Xe Graphics (Active with dual-channel memory)'),
(1304, 12, 'RAM', '16GB (2x8GB) DDR4 2666MHz'),
(1305, 12, 'RAM_slot', '2x SO-DIMM sockets (Max 16GB)'),
(1306, 12, 'SSD_OR_HDD', '512GB M.2 PCIe NVMe SSD (1 Slot)'),
(1307, 12, 'OS', 'Windows 11 Home + Office Home & Student'),
(1308, 12, 'display_size', '15.6-inch'),
(1309, 12, 'display_type', 'FHD (1920 x 1080), 120Hz, Anti-glare, 250 nits, 45% NTSC, WVA (IPS)'),
(1310, 12, 'display_touch', 'No'),
(1311, 12, 'power_adapter', '65W AC Adapter'),
(1312, 12, 'battery_capacity', '41WHrs, 3-cell Li-ion'),
(1313, 12, 'battery_hour', 'Varies based on usage'),
(1314, 12, 'dimension', '358.50 (W) x 235.56 (D) x 21.07 (H) mm'),
(1315, 12, 'weight', '1.65 kg'),
(1316, 12, 'colors', 'Silver'),
(1317, 12, 'IO_ports', '2x USB 3.2 Gen 1 ports\r\n1x USB 2.0 port\r\n1x HDMI 1.4 port\r\n1x SD card slot\r\n1x Headset (headphone and microphone combo) port'),
(1318, 12, 'fingerprint_sensor', 'No'),
(1319, 12, 'camera', '720p HD Camera'),
(1320, 12, 'keyboard', 'Non-backlit keyboard with numeric keypad'),
(1321, 12, 'touchpad', 'Multi-touch touchpad'),
(1322, 12, 'WIFI', 'Wi-Fi 6 (802.11ax)'),
(1323, 12, 'bluetooth', 'Bluetooth® 5.2'),
(1324, 12, 'speaker', 'Stereo speakers (2W x 2) with Realtek ALC3204 codec'),
(1325, 12, 'mic', 'Single-integrated microphone'),
(1326, 12, 'other', 'LAN: 10/100 Mbps Ethernet port'),
(1327, 13, 'processor', 'Intel® Core™ i7-1355U (10 Cores, 12 Threads)'),
(1328, 13, 'clock_speed', 'Up to 5.0 GHz (1.7 GHz Base), 12MB Cache'),
(1329, 13, 'GPU', 'Intel® Iris® Xe Graphics (Active with dual-channel memory)'),
(1330, 13, 'RAM', '16GB (2x8GB) DDR4 2666MHz'),
(1331, 13, 'RAM_slot', '2x SO-DIMM sockets (up to 32GB supported)'),
(1332, 13, 'SSD_OR_HDD', '1TB SSD M.2 PCIe NVMe (1 Slot)'),
(1333, 13, 'OS', 'Windows 11 Home + Office Home & Student'),
(1334, 13, 'display_size', '15.6-inch'),
(1335, 13, 'display_type', 'FHD (1920 x 1080), 120Hz, Anti-Glare, LED-Backlit, Narrow Border'),
(1336, 13, 'display_touch', 'No'),
(1337, 13, 'power_adapter', '65W AC Adapter'),
(1338, 13, 'battery_capacity', '54WHrs, 4-cell Li-ion'),
(1339, 13, 'battery_hour', 'Varies based on usage'),
(1340, 13, 'dimension', '358.50 (W) x 235.56 (D) x 16.96-18.99 (H) mm'),
(1341, 13, 'weight', '1.9 kg'),
(1342, 13, 'colors', 'Platinum Silver'),
(1343, 13, 'IO_ports', '1x USB 3.2 Gen 1 Type-C (Data only)\r\n1x USB 3.2 Gen 1 Type-A\r\n1x USB 2.0 Type-A\r\n1x HDMI 1.4 port\r\n1x SD 3.0 card slot\r\n1x Universal Audio port (headphone/mic combo)'),
(1344, 13, 'fingerprint_sensor', 'No'),
(1345, 13, 'camera', '720p HD (30 fps) camera'),
(1346, 13, 'keyboard', 'Non-backlit keyboard with numeric keypad'),
(1347, 13, 'touchpad', 'Precision multi-touch touchpad'),
(1348, 13, 'WIFI', 'Realtek Wi-Fi 6 RTL8852BE, 2x2, 802.11ax, MU-MIMO'),
(1349, 13, 'bluetooth', 'Bluetooth® 5.3'),
(1350, 13, 'speaker', 'Stereo speakers with Realtek ALC3204 codec'),
(1351, 13, 'mic', 'Single-integrated microphone'),
(1352, 13, 'other', 'LAN: None'),
(1353, 14, 'processor', 'Intel® Core™ Ultra 5 226V (8 Cores, 8 Threads)'),
(1354, 14, 'clock_speed', 'Up to 4.50 GHz, 8MB Intel® Smart Cache'),
(1355, 14, 'GPU', 'Intel® Arc Graphics'),
(1356, 14, 'RAM', '16GB LPDDR5X 8533MHz (on-board)'),
(1357, 14, 'RAM_slot', '0 (Not upgradeable)'),
(1358, 14, 'SSD_OR_HDD', '512GB M.2 PCIe NVMe SSD (1 Slot)'),
(1359, 14, 'OS', 'Windows 11 Home + Microsoft Office Home 2024'),
(1360, 14, 'display_size', '13.4-inch'),
(1361, 14, 'display_type', 'QHD+ (2560x1600), 120Hz, Anti-Reflect, InfinityEdge, Eyesafe'),
(1362, 14, 'display_touch', 'Yes'),
(1363, 14, 'power_adapter', '60W AC Adapter (Type-C)'),
(1364, 14, 'battery_capacity', '55WHrs, 3-cell Li-ion'),
(1365, 14, 'battery_hour', 'Varies based on usage'),
(1366, 14, 'dimension', '295.3 x 199.10 x 15.3 mm'),
(1367, 14, 'weight', '1.21 kg'),
(1368, 14, 'colors', 'Platinum Silver'),
(1369, 14, 'IO_ports', '2x Thunderbolt™ 4 (USB Type-C™) with Power Delivery & DisplayPort'),
(1370, 14, 'fingerprint_sensor', 'Yes (Integrated into power button)'),
(1371, 14, 'camera', '1080p FHD RGB camera'),
(1372, 14, 'keyboard', 'Backlit Keyboard (Standard)'),
(1373, 14, 'touchpad', 'Seamless glass haptic touchpad'),
(1374, 14, 'WIFI', 'Intel® Killer™ Wi-Fi 7 1750i (BE201) 2x2'),
(1375, 14, 'bluetooth', 'Bluetooth® 5.4'),
(1376, 14, 'speaker', 'Quad-speaker system (tweeter + woofer), 8W total'),
(1377, 14, 'mic', 'Dual-array microphones'),
(1378, 14, 'other', 'Security: Facial recognition (Windows Hello)\r\nMaterial: Metal (CNC-milled aluminum) chassis'),
(1379, 15, 'processor', 'AMD Ryzen™ 7 7445H (6 cores, 12 threads)'),
(1380, 15, 'clock_speed', '3.8 GHz (Base), up to 4.7 GHz (Max Boost), 16 MB L3 cache'),
(1381, 15, 'GPU', 'NVIDIA® GeForce RTX™ 3050 Laptop GPU 6GB GDDR6'),
(1382, 15, 'RAM', '16 GB (1 x 16 GB) DDR5-5600 MT/s'),
(1383, 15, 'RAM_slot', '2x SO-DIMM sockets (up to 64GB)'),
(1384, 15, 'SSD_OR_HDD', '512 GB PCIe® Gen4 NVMe™ M.2 SSD (1 slot)'),
(1385, 15, 'OS', 'Windows 11 Home SL'),
(1386, 15, 'display_size', '15.6-inch'),
(1387, 15, 'display_type', 'FHD (1920 x 1080), 144 Hz, IPS, micro-edge, anti-glare, 300 nits, 45% NTSC'),
(1388, 15, 'display_touch', 'No'),
(1389, 15, 'power_adapter', '200W Smart AC power adapter'),
(1390, 15, 'battery_capacity', '70 Wh, 4-cell Li-ion polymer'),
(1391, 15, 'battery_hour', 'Varies based on usage'),
(1392, 15, 'dimension', '35.79 x 25.5 x 2.35 cm'),
(1393, 15, 'weight', '2.29 kg'),
(1394, 15, 'colors', 'Mica silver, dark chrome logo'),
(1395, 15, 'IO_ports', '1x USB Type-C® 5Gbps (DisplayPort™ 1.4a, HP Sleep and Charge)\r\n1x USB Type-A 5Gbps (HP Sleep and Charge)\r\n1x USB Type-A 5Gbps\r\n1x HDMI 2.1\r\n1x RJ-45 (Ethernet)\r\n1x headphone/microphone combo\r\n1x AC smart pin'),
(1396, 15, 'fingerprint_sensor', 'No'),
(1397, 15, 'camera', 'HP Wide Vision 720p HD camera'),
(1398, 15, 'keyboard', 'Full-size, backlit, moonstone grey keyboard with numeric keypad'),
(1399, 15, 'touchpad', 'HP Imagepad'),
(1400, 15, 'WIFI', 'Realtek Wi-Fi 6 (2x2)'),
(1401, 15, 'bluetooth', 'Bluetooth® 5.4'),
(1402, 15, 'speaker', 'Audio by B&O; Dual speakers; HP Audio Boost; DTS:X™ Ultra'),
(1403, 15, 'mic', 'Integrated dual array digital microphones'),
(1404, 15, 'other', 'LAN: 10/100/1000 GbE LAN'),
(1457, 16, 'processor', 'Intel® Core™ i9-14900HX (24 cores, 32 threads)'),
(1458, 16, 'clock_speed', 'Up to 5.8 GHz, 36 MB L3 cache'),
(1459, 16, 'GPU', 'NVIDIA® GeForce RTX™ 5070 Laptop GPU 8GB GDDR7'),
(1460, 16, 'RAM', '32GB (2x16GB) DDR5 5600MHz'),
(1461, 16, 'RAM_slot', '2x SO-DIMM sockets (up to 32GB)'),
(1462, 16, 'SSD_OR_HDD', '512 GB PCIe® Gen4 NVMe™ M.2 SSD (2 slots total)'),
(1463, 16, 'OS', 'Windows 11 Home'),
(1464, 16, 'display_size', '16.1-inch'),
(1465, 16, 'display_type', '2K (1920 x 1200) WUXGA, 165 Hz, 3 ms, IPS, 400 nits, 100% sRGB, Low Blue Light'),
(1466, 16, 'display_touch', 'No'),
(1467, 16, 'power_adapter', '230W AC power adapter'),
(1468, 16, 'battery_capacity', '83 Wh, 6-cell Li-ion polymer'),
(1469, 16, 'battery_hour', 'Varies based on usage'),
(1470, 16, 'dimension', '35.75 (W) x 26.9 (D) x 2.37-2.54 (H) cm'),
(1471, 16, 'weight', '2.43 kg'),
(1472, 16, 'colors', 'Shadow black, black chrome logo'),
(1473, 16, 'IO_ports', '1x USB Type-C® 10Gbps (USB Power Delivery 3.0, DisplayPort™ 1.4, HP Sleep and Charge)\r\n1x USB Type-A 10Gbps\r\n2x USB Type-A 5Gbps\r\n1x HDMI 2.1\r\n1x RJ-45\r\n1x headphone/microphone combo\r\n1x AC smart pin'),
(1474, 16, 'fingerprint_sensor', 'No'),
(1475, 16, 'camera', 'HP True Vision 1080p FHD camera'),
(1476, 16, 'keyboard', 'Full-size, 4-zone RGB backlit keyboard with 26-Key Rollover'),
(1477, 16, 'touchpad', 'HP Imagepad'),
(1478, 16, 'WIFI', 'Intel® Wi-Fi 6E AX211 (2x2)'),
(1479, 16, 'bluetooth', 'Bluetooth® 5.3'),
(1480, 16, 'speaker', 'Dual speakers; DTS:X® Ultra; HP Audio Boost; (Tuned by) HyperX'),
(1481, 16, 'mic', 'Integrated dual array digital microphones'),
(1482, 16, 'other', 'LAN: Integrated 10/100/1000 GbE LAN'),
(1509, 17, 'processor', 'Intel® Core™ Ultra 9 275HX (24 cores, 24 threads, NPU 13 TOPS)'),
(1510, 17, 'clock_speed', 'Up to 5.4GHz, 36MB L3 cache'),
(1511, 17, 'GPU', 'NVIDIA® GeForce RTX™ 5090 Laptop GPU 24GB GDDR7'),
(1512, 17, 'RAM', '64GB (2x32GB) DDR5 5600MHz'),
(1513, 17, 'RAM_slot', '2x SO-DIMM sockets (Dual-channel)'),
(1514, 17, 'SSD_OR_HDD', '2TB PCIe Gen 4 NVMe M.2 SSD (2 slots total)'),
(1515, 17, 'OS', 'Windows 11 Home SL, Microsoft Office Home 2024, M365 Basic'),
(1516, 17, 'display_size', '16.0-inch'),
(1517, 17, 'display_type', '2.5K (2560 x 1600) OLED, 240Hz, VRR, 400 nits, 100% sRGB, Anti-glare'),
(1518, 17, 'display_touch', 'No'),
(1519, 17, 'power_adapter', '330W AC Adapter'),
(1520, 17, 'battery_capacity', '83WHrs, 6-cell Li-ion polymer (Fast Charge 50% in 30 min)'),
(1521, 17, 'battery_hour', 'Varies based on usage'),
(1522, 17, 'dimension', '35.66 (W) x 26.9 (D) x 2.29 ~ 2.49 (H) cm'),
(1523, 17, 'weight', '2.77 kg (approx. 6.1 lbs)'),
(1524, 17, 'colors', 'Shadow Black'),
(1525, 17, 'IO_ports', '2x Thunderbolt™ 4 (USB-C 40Gbps, DP 2.1, PD, Sleep & Charge)\r\n2x USB Type-A 10Gbps\r\n1x HDMI 2.1\r\n1x RJ-45 (Ethernet)\r\n1x headphone/microphone combo\r\n1x AC smart pin'),
(1526, 17, 'fingerprint_sensor', 'No'),
(1527, 17, 'camera', 'HP True Vision 1080p FHD IR camera (with privacy shutter)'),
(1528, 17, 'keyboard', 'Full-size, Per-Key RGB, Numpad, NKRO Anti-Ghosting, Copilot key'),
(1529, 17, 'touchpad', 'HP Imagepad'),
(1530, 17, 'WIFI', 'Intel® Wi-Fi 6E AX211 (2x2)'),
(1531, 17, 'bluetooth', 'Bluetooth® 5.3'),
(1532, 17, 'speaker', 'Dual speakers; DTS:X® Ultra; HP Audio Boost; (Tuned by) HyperX'),
(1533, 17, 'mic', 'Integrated dual array digital microphones'),
(1534, 17, 'other', 'LAN: 10/100/1000/2500 Mbps\r\nMaterial: Unibody aluminum chassis with light bar\r\nSecurity: Windows Hello (Facial Recognition)'),
(1535, 18, 'processor', 'Intel® Core™ Ultra 7 155H (16 cores, 22 threads)'),
(1536, 18, 'clock_speed', 'Up to 4.8 GHz, 24 MB L3 cache'),
(1537, 18, 'GPU', 'NVIDIA® GeForce RTX™ 4060 8GB GDDR6'),
(1538, 18, 'RAM', '16GB LPDDR5x 7467 MHz (Onboard)'),
(1539, 18, 'RAM_slot', '0 (Not upgradeable)'),
(1540, 18, 'SSD_OR_HDD', '1TB PCIe® Gen4 NVMe™ Performance M.2 SSD'),
(1541, 18, 'OS', 'Windows 11 Home'),
(1542, 18, 'display_size', '14.0-inch'),
(1543, 18, 'display_type', '2.8K (2880 x 1800), OLED, 120Hz, 0.2ms, 100% DCI-P3, HDR 500 nits'),
(1544, 18, 'display_touch', 'No'),
(1545, 18, 'power_adapter', '140W USB-C AC power adapter'),
(1546, 18, 'battery_capacity', '71 WHr, 6-cell Li-ion polymer'),
(1547, 18, 'battery_hour', 'Varies based on usage'),
(1548, 18, 'dimension', '31.3 x 23.35 x 1.69 cm'),
(1549, 18, 'weight', '1.63 kg'),
(1550, 18, 'colors', 'Ceramic white aluminum'),
(1551, 18, 'IO_ports', '1x Thunderbolt™ 4 (Type-C, 40Gbps, PD, DisplayPort™ 2.1, HP Sleep & Charge)\r\n1x USB Type-C® 10Gbps (PD, DisplayPort™ 1.4a, HP Sleep & Charge)\r\n2x USB Type-A 10Gbps (One with HP Sleep & Charge)\r\n1x HDMI 2.1\r\n1x headphone/microphone combo'),
(1552, 18, 'fingerprint_sensor', 'No (Uses IR Camera for Windows Hello)'),
(1553, 18, 'camera', 'HP True Vision 1080p FHD IR camera'),
(1554, 18, 'keyboard', 'Full-size, 4-zone RGB backlit, 26-Key Rollover Anti-Ghosting'),
(1555, 18, 'touchpad', 'HP Imagepad'),
(1556, 18, 'WIFI', 'Intel® Wi-Fi 6E AX211 (2x2)'),
(1557, 18, 'bluetooth', 'Bluetooth® 5.3'),
(1558, 18, 'speaker', 'Dual speakers; DTS:X® Ultra; HP Audio Boost; (Tuned by) HyperX'),
(1559, 18, 'mic', 'Integrated dual array digital microphones'),
(1560, 18, 'other', 'LAN: None\r\nAI TOPs: 233'),
(1561, 19, 'processor', 'Intel® Core™ i7-14700HX, 20C (8P + 12E) / 28T'),
(1562, 19, 'clock_speed', 'Up to 5.5GHz (P-core) / 3.9GHz (E-core), 33MB Cache'),
(1563, 19, 'GPU', 'NVIDIA® GeForce RTX™ 5060 8GB GDDR7 (TGP 115W, 572 AI TOPS)'),
(1564, 19, 'RAM', '16GB (1x16GB) SO-DIMM DDR5 5600MHz'),
(1565, 19, 'RAM_slot', '2 slots (up to 32GB)'),
(1566, 19, 'SSD_OR_HDD', '512GB SSD M.2 2242 PCIe® 4.0x4 NVMe® (2 M.2 slots total)'),
(1567, 19, 'OS', 'Windows® 11 Home Single Language, English + Office Home 2024'),
(1568, 19, 'display_size', '15.1-inch'),
(1569, 19, 'display_type', 'WQXGA (2560x1600) OLED, 165Hz, 100% DCI-P3, Glossy, 1000 nits (peak), DisplayHDR™ True Black 600'),
(1570, 19, 'display_touch', 'No'),
(1571, 19, 'power_adapter', '245W Slim Tip (3-pin)'),
(1572, 19, 'battery_capacity', '80Wh'),
(1573, 19, 'battery_hour', 'Varies based on usage'),
(1574, 19, 'dimension', '344.9 x 255.35 x 19.95-21.54 mm'),
(1575, 19, 'weight', 'Starting at 1.9 kg (4.19 lbs)'),
(1576, 19, 'colors', 'Eclipse Black'),
(1577, 19, 'IO_ports', '1x USB-C 10Gbps (PD 100W, DP 2.1)\r\n1x USB-C 10Gbps (DP 1.4)\r\n3x USB-A 5Gbps (One Always On)\r\n1x HDMI® 2.1 (up to 8K/60Hz)\r\n1x Ethernet (RJ-45)\r\n1x Headphone / microphone combo jack (3.5mm)\r\n1x Power connector'),
(1578, 19, 'fingerprint_sensor', 'No'),
(1579, 19, 'camera', '5.0MP with E-shutter'),
(1580, 19, 'keyboard', '24-Zone RGB Backlit, English'),
(1581, 19, 'touchpad', 'Multi-touch Touchpad'),
(1582, 19, 'WIFI', 'Wi-Fi® 7, 802.11be 2x2'),
(1583, 19, 'bluetooth', 'v5.4'),
(1584, 19, 'speaker', 'Stereo speakers, 2W x2, audio by HARMAN, Nahimic Audio'),
(1585, 19, 'mic', 'Built-in dual microphone array'),
(1586, 19, 'other', 'AI Chip: LA1\r\nLAN: 100/1000M (RJ-45)\r\nMaterial: Aluminum (Top), PC-ABS (Bottom)'),
(1587, 20, 'processor', 'AMD Ryzen™ 5 7235HS (4C / 8T, 8MB L3 Cache)'),
(1588, 20, 'clock_speed', '3.2 GHz (Base) / 4.2 GHz (Boost)'),
(1589, 20, 'GPU', 'NVIDIA® GeForce RTX™ 3050 6GB GDDR6 (TGP 95W)'),
(1590, 20, 'RAM', '16GB (2x8GB) DDR5-4800 SO-DIMM'),
(1591, 20, 'RAM_slot', '2x SO-DIMM sockets (up to 32GB)'),
(1592, 20, 'SSD_OR_HDD', '512GB SSD M.2 2242 PCIe® 4.0x4 NVMe® (2 M.2 slots total)'),
(1593, 20, 'OS', 'Windows® 11 Home Single Language, English'),
(1594, 20, 'display_size', '15.6-inch'),
(1595, 20, 'display_type', 'FHD (1920x1080) IPS, 300 nits, Anti-glare, 100% sRGB, 144Hz, G-SYNC®'),
(1596, 20, 'display_touch', 'No'),
(1597, 20, 'power_adapter', '170W Slim Tip (3-pin) AC Adapter'),
(1598, 20, 'battery_capacity', '60Wh, 4-cell Li-ion (Integrated)'),
(1599, 20, 'battery_hour', 'Varies based on usage'),
(1600, 20, 'dimension', '359.86 x 258.7 x 21.9-23.9 mm'),
(1601, 20, 'weight', '2.38 kg'),
(1602, 20, 'colors', 'Luna Grey'),
(1603, 20, 'IO_ports', '1x USB-C® 10Gbps (Lenovo® PD 140W, DisplayPort™ 1.4)\r\n3x USB-A 5Gbps\r\n1x HDMI® 2.1 (up to 8K/60Hz)\r\n1x Ethernet (RJ-45)\r\n1x Headphone / microphone combo jack (3.5mm)\r\n1x Power connector'),
(1604, 20, 'fingerprint_sensor', 'No'),
(1605, 20, 'camera', 'HD 720p with E-shutter (privacy shutter)'),
(1606, 20, 'keyboard', 'White Backlit, English'),
(1607, 20, 'touchpad', 'Multi-touch Touchpad'),
(1608, 20, 'WIFI', 'Wi-Fi® 6, 11ax 2x2'),
(1609, 20, 'bluetooth', 'Bluetooth® 5.2'),
(1610, 20, 'speaker', 'Stereo speakers, 2W x2, optimized with Nahimic Audio'),
(1611, 20, 'mic', 'Built-in dual microphone array'),
(1612, 20, 'other', 'LAN: 100/1000M (RJ-45)\r\nMaterial: PC-ABS (Top & Bottom)'),
(1613, 21, 'processor', 'Intel® Core™ Ultra 5 225H, 14C (4P + 8E + 2LPE) / 14T'),
(1614, 21, 'clock_speed', 'Up to 4.9GHz, 18MB Cache'),
(1615, 21, 'GPU', 'Integrated Intel® Arc™ 130T GPU'),
(1616, 21, 'RAM', '16GB Soldered LPDDR5x-8400'),
(1617, 21, 'RAM_slot', '0 (Not upgradeable)'),
(1618, 21, 'SSD_OR_HDD', '1TB SSD M.2 2280 PCIe® 4.0x4 NVMe® Opal 2.0 (1 slot total)'),
(1619, 21, 'OS', 'Windows® 11 Pro, English (US) / English (UK)'),
(1620, 21, 'display_size', '14.0-inch'),
(1621, 21, 'display_type', 'WUXGA (1920x1200) IPS, 500 nits, Anti-glare, 100% sRGB, 60Hz, Low Power'),
(1622, 21, 'display_touch', 'No'),
(1623, 21, 'power_adapter', '65W USB-C® Slim (3-pin)'),
(1624, 21, 'battery_capacity', 'Integrated 57Wh'),
(1625, 21, 'battery_hour', 'Varies based on usage'),
(1626, 21, 'dimension', '312.80 (W) x 214.75 (D) x 14.96 (H) mm'),
(1627, 21, 'weight', '1.06 kg'),
(1628, 21, 'colors', 'Black, Paint'),
(1629, 21, 'IO_ports', '2x USB-C® (Thunderbolt™ 4 / USB4® 40Gbps, PD 3.0, DP 2.1)\r\n2x USB-A 5Gbps (One Always On)\r\n1x HDMI® 2.1 (up to 4K/60Hz)\r\n1x Headphone / microphone combo jack (3.5mm)'),
(1630, 21, 'fingerprint_sensor', 'Yes (Touch style, Integrated in Power Button)'),
(1631, 21, 'camera', 'FHD 1080p + IR Discrete with Privacy Shutter'),
(1632, 21, 'keyboard', 'Backlit, English'),
(1633, 21, 'touchpad', 'Haptic ForcePad'),
(1634, 21, 'WIFI', 'Intel® Wi-Fi® 7 BE201, 802.11be 2x2'),
(1635, 21, 'bluetooth', 'Bluetooth® 5.4'),
(1636, 21, 'speaker', 'Stereo speakers, 2W x2, Dolby Atmos®'),
(1637, 21, 'mic', 'Dual-array microphones'),
(1638, 21, 'other', 'LAN: No Onboard Ethernet\r\nMaterial: Carbon Fiber (Top), Aluminium (Bottom)'),
(1691, 24, 'processor', 'AMD Ryzen™ 9 9955HX (16 cores, 32 threads)'),
(1692, 24, 'clock_speed', '2.5 GHz (Base) up to 5.4 GHz (Boost), 16MB L2 / 64MB L3 Cache'),
(1693, 24, 'GPU', 'NVIDIA® GeForce RTX™ 5060 Laptop GPU 8GB GDDR7 (+ AMD Radeon™ Graphics)'),
(1694, 24, 'RAM', '32GB DDR5-5600MHz'),
(1695, 24, 'RAM_slot', '2x SO-DIMM sockets (up to 64GB)'),
(1696, 24, 'SSD_OR_HDD', '1TB PCIe® NVMe M.2 SSD (2x M.2 2280 slots total)'),
(1697, 24, 'OS', 'Windows 11 Home'),
(1698, 24, 'display_size', '16.0-inch'),
(1699, 24, 'display_type', '2.5K (2560x1600) OLED, 240Hz, Glossy, 1100 nits (peak), 100% DCI-P3, G-SYNC®, Dolby Vision®, DisplayHDR™ True Black 1000'),
(1700, 24, 'display_touch', 'No'),
(1701, 24, 'power_adapter', '300W Slim Tip AC Adapter'),
(1702, 24, 'battery_capacity', '80Wh'),
(1703, 24, 'battery_hour', 'Varies based on usage'),
(1704, 24, 'dimension', 'Approx. 363.4 x 261.75 x 21.99-26.95 mm'),
(1705, 24, 'weight', '~2.6 kg'),
(1706, 24, 'colors', 'Eclipse Black'),
(1707, 24, 'IO_ports', '1x USB-C 3.2 Gen 2 (DP 2.1, 140W PD 3.0)\r\n1x USB-C 3.2 Gen 2 (DP 2.1)\r\n1x USB-A 3.2 Gen 2 (10Gbps, 5V/2A)\r\n2x USB-A 3.2 Gen 1 (5Gbps)\r\n1x HDMI 2.1\r\n1x Ethernet (RJ-45)\r\n1x Headphone / microphone combo jack (3.5mm)\r\n1x E-camera shutter switch\r\n1x DC-in (Slim Tip)'),
(1708, 24, 'fingerprint_sensor', 'No'),
(1709, 24, 'camera', 'HD (720p) Webcam with E-shutter'),
(1710, 24, 'keyboard', 'Full-size, 4-Zone RGB Backlit, English'),
(1711, 24, 'touchpad', 'Multi-touch Touchpad'),
(1712, 24, 'WIFI', 'Wi-Fi 7'),
(1713, 24, 'bluetooth', 'Bluetooth® 5.4'),
(1714, 24, 'speaker', 'Stereo speakers (2W x2), optimized with Nahimic Audio'),
(1715, 24, 'mic', 'Built-in dual microphone array'),
(1716, 24, 'other', 'LAN: 10/100/1000M (Gigabit) Ethernet\r\nMaterial: Metal (Chassis)\r\nStatus: New, FullBox, Imported\r\nWarranty: 12 months'),
(1769, 10, 'processor', 'Intel® Core™ i7-13620H (10 cores, 16 threads)'),
(1770, 10, 'clock_speed', 'Up to 4.9 GHz, 24MB Cache'),
(1771, 10, 'GPU', 'NVIDIA® GeForce® RTX™ 3050 6GB GDDR6'),
(1772, 10, 'RAM', '16GB (8GB Onboard + 8GB Sodimm) DDR5 4800MHz'),
(1773, 10, 'RAM_slot', '1x SO-DIMM socket (up to 56GB)'),
(1774, 10, 'SSD_OR_HDD', '512GB PCIe NVMe SED SSD (Total 1 M.2 slot, max 2TB)'),
(1775, 10, 'OS', 'Windows 11 Home Single Language'),
(1776, 10, 'display_size', '16.0-inch'),
(1777, 10, 'display_type', 'WUXGA (1920x1200) 16:10, IPS, 165Hz, 300 nits, 45% NTSC, Acer ComfyView™'),
(1778, 10, 'display_touch', 'No'),
(1779, 10, 'power_adapter', '135W AC Adapter (Supports 65W USB-C Power Delivery)'),
(1780, 10, 'battery_capacity', '53WHr, 3-cell Li-ion'),
(1781, 10, 'battery_hour', 'Varies based on usage'),
(1782, 10, 'dimension', '362.2 (W) x 248.47 (D) x 22.9 (H) mm'),
(1783, 10, 'weight', '1.95 kg'),
(1784, 10, 'colors', 'White'),
(1785, 10, 'IO_ports', '1x Thunderbolt™ 4 (Type-C, supports USB 3.2 Gen 2, DisplayPort & 65W PD)\r\n\r\n2x USB 3.2 Gen 1 Type-A (one with power-off charging)\r\n\r\n1x HDMI® 2.1\r\n\r\n1x Ethernet (RJ-45) port\r\n\r\n1x 3.5mm headphone/speaker jack'),
(1786, 10, 'fingerprint_sensor', 'No'),
(1787, 10, 'camera', 'FHD (1080p) Webcam'),
(1788, 10, 'keyboard', 'Single-color (White) Backlit with Numpad, Copilot Key'),
(1789, 10, 'touchpad', 'Multi-touch Touchpad'),
(1790, 10, 'WIFI', 'Wi-Fi 6 (802.11ax)'),
(1791, 10, 'bluetooth', 'Bluetooth® 5.0'),
(1792, 10, 'speaker', 'Dual speakers'),
(1793, 10, 'mic', 'Built-in dual microphone array'),
(1794, 10, 'other', 'LAN: Gigabit Ethernet\r\n\r\nCooling: Dual fans\r\n\r\nMaterial: Plastic (All covers A, B, C, D)'),
(1795, 25, 'processor', 'Intel® Core™ Ultra 9 275HX (24 cores / 24 threads)'),
(1796, 25, 'clock_speed', 'Up to 5.4 GHz, 40MB Cache'),
(1797, 25, 'GPU', 'NVIDIA® GeForce RTX™ 5060 Laptop GPU (115W TGP, 572 AI TOPS)'),
(1798, 25, 'RAM', '32GB (2x16GB) DDR5 5600MHz'),
(1799, 25, 'RAM_slot', '2x SO-DIMM sockets (up to 96GB)'),
(1800, 25, 'SSD_OR_HDD', '1TB NVMe PCIe Gen4x4 SSD (2x M.2 slots total)'),
(1801, 25, 'OS', 'Windows 11 Home'),
(1802, 25, 'display_size', '16.0-inch'),
(1803, 25, 'display_type', 'QHD+ (2560x1600) 16:10, IPS, 240Hz, 500 nits, 100% DCI-P3, 3ms, Anti-glare'),
(1804, 25, 'display_touch', 'No'),
(1805, 25, 'power_adapter', '240W AC Adapter'),
(1806, 25, 'battery_capacity', '90Whr, 4-cell'),
(1807, 25, 'battery_hour', 'Varies based on usage'),
(1808, 25, 'dimension', '359 x 266.4 x 21.8-27.9 mm'),
(1809, 25, 'weight', '2.5 kg'),
(1810, 25, 'colors', 'Cosmos Gray'),
(1811, 25, 'IO_ports', '1x Thunderbolt™ 4 (DisplayPort / Power Delivery 3.0)\r\n\r\n\r\n3x Type-A USB3.2 Gen1\r\n\r\n\r\n1x HDMI™ 2.1 (8K@60Hz / 4K@120Hz)\r\n\r\n\r\n1x RJ45\r\n\r\n\r\n1x Mic-in/Headphone-out Combo Jack'),
(1812, 25, 'fingerprint_sensor', 'No'),
(1813, 25, 'camera', 'HD (720p@30fps) with 3D Noise Reduction (3DNR)'),
(1814, 25, 'keyboard', '24-Zone RGB Gaming Keyboard with Copilot Key'),
(1815, 25, 'touchpad', 'Multi-touch Touchpad'),
(1816, 25, 'WIFI', 'Intel® Wi-Fi 6E AX211'),
(1817, 25, 'bluetooth', 'Bluetooth® v5.3'),
(1818, 25, 'speaker', '2x 2W Speaker (Hi-Res Audio Ready, Nahimic 3)'),
(1819, 25, 'mic', 'AI Noise Cancelling Microphone Array'),
(1820, 25, 'other', 'LAN: Gigabit Ethernet (RTL8111H-CG)\r\n\r\n\r\nCard Reader: None'),
(1821, 26, 'processor', 'Intel® Core™ Ultra 9 285HX (24 cores, 24 threads)'),
(1822, 26, 'clock_speed', 'Up to 5.5 GHz (Max Turbo)'),
(1823, 26, 'GPU', 'NVIDIA® GeForce RTX™ 5090 Laptop GPU 24GB GDDR7'),
(1824, 26, 'RAM', '64GB (2 x 32GB) DDR5 6400MHz'),
(1825, 26, 'RAM_slot', '2x SO-DIMM sockets (up to 96GB)'),
(1826, 26, 'SSD_OR_HDD', '6TB NVMe PCIe (4 slots total: 1x Gen5 + 3x Gen4)'),
(1827, 26, 'OS', 'Windows 11 Home'),
(1828, 26, 'display_size', '18.0-inch'),
(1829, 26, 'display_type', 'UHD+ (3840x2400) 16:10, MiniLED, 120Hz, 100% DCI-P3, VESA DisplayHDR™ 1000'),
(1830, 26, 'display_touch', 'No'),
(1831, 26, 'power_adapter', '400W AC Adapter'),
(1832, 26, 'battery_capacity', '99.99Whr, 4-cell'),
(1833, 26, 'battery_hour', 'Varies based on usage'),
(1834, 26, 'dimension', '404 (W) x 307.5 (D) x 24~32.05 (H) mm'),
(1835, 26, 'weight', '3.6 kg'),
(1836, 26, 'colors', 'Core Black'),
(1837, 26, 'IO_ports', '2x Thunderbolt™ 5 (DisplayPort / Power Delivery 3.1)\r\n\r\n\r\n3x USB 3.2 Gen2 Type-A\r\n\r\n\r\n1x HDMI™ 2.1 (8K@60Hz / 4K@120Hz)\r\n\r\n\r\n1x SD Express Memory Card Reader\r\n\r\n\r\n1x Audio combo jack'),
(1838, 26, 'fingerprint_sensor', 'No (Uses IR Camera for Windows Hello)'),
(1839, 26, 'camera', 'IR FHD (1080p@30fps) with HDR & 3D Noise Reduction+'),
(1840, 26, 'keyboard', 'Cherry Mechanical Per-Key RGB keyboard by SteelSeries (w/ Copilot Key)'),
(1841, 26, 'touchpad', 'Seamless RGB Haptic Touchpad'),
(1842, 26, 'WIFI', 'Intel® Killer™ Wi-Fi 7 BE1750'),
(1843, 26, 'bluetooth', 'v5.4'),
(1844, 26, 'speaker', '6-Speaker system by Dynaudio (4x 2W Speakers + 2x 2W Woofers)'),
(1845, 26, 'mic', 'Array Microphone'),
(1846, 26, 'other', 'LAN: Gigabit Ethernet (up to 2.5GbE)'),
(1925, 27, 'processor', 'Intel® Core™ Ultra 9 185H (16 cores, 22 threads)'),
(1926, 27, 'clock_speed', '1.8GHz (Base) up to 5.1GHz (Max Turbo), 24 MB Cache'),
(1927, 27, 'GPU', 'NVIDIA® GeForce RTX™ 4080 Laptop GPU 12GB GDDR6 (150W TGP)'),
(1928, 27, 'RAM', '32GB (2x16GB) DDR5 5600MHz'),
(1929, 27, 'RAM_slot', '2x SO-DIMM sockets (up to 96GB)'),
(1930, 27, 'SSD_OR_HDD', '2TB NVMe PCIe Gen4x4 SSD (2x M.2 slots total)'),
(1931, 27, 'OS', 'Windows 11 Home'),
(1932, 27, 'display_size', '18.0-inch'),
(1933, 27, 'display_type', 'UHD+ (3840x2400) 16:10, MiniLED, 120Hz, 100% DCI-P3, IPS-Level'),
(1934, 27, 'display_touch', 'No'),
(1935, 27, 'power_adapter', '280W AC Adapter'),
(1936, 27, 'battery_capacity', '99.9Whr, 4-cell'),
(1937, 27, 'battery_hour', 'Varies based on usage'),
(1938, 27, 'dimension', '399.99 (W) x 289.67 (D) x 19.9-23.99 (H) mm'),
(1939, 27, 'weight', '2.89 kg'),
(1940, 27, 'colors', 'Midnight Black'),
(1941, 27, 'IO_ports', '1x Thunderbolt™ 4 (Type-C, w/ PD3.1 charging, DP)\r\n\r\n\r\n1x Type-C (USB3.2 Gen2 / DP)\r\n\r\n\r\n2x Type-A USB3.2 Gen2\r\n\r\n\r\n1x HDMI™ 2.1 (8K@60Hz / 4K@120Hz)\r\n\r\n\r\n1x SD Express Card Reader\r\n\r\n\r\n1x RJ45\r\n\r\n\r\n(No 3.5mm audio jack)'),
(1942, 27, 'fingerprint_sensor', 'Yes'),
(1943, 27, 'camera', 'IR FHD (1080p@30fps) with HDR & 3D Noise Reduction+'),
(1944, 27, 'keyboard', 'Per-Key RGB Gaming Keyboard by SteelSeries'),
(1945, 27, 'touchpad', 'Seamless RGB Haptic Touchpad'),
(1946, 27, 'WIFI', 'Wi-Fi 7 (802.11be)'),
(1947, 27, 'bluetooth', 'Bluetooth® v5.4'),
(1948, 27, 'speaker', '6-speaker system (2x 2W Speakers + 4x 2W Woofers) by Dynaudio'),
(1949, 27, 'mic', 'Quad-microphone array with AI Noise Cancellation'),
(1950, 27, 'other', 'LAN: Killer Gb LAN (Up to 2.5G)\r\n\r\n\r\nMaterial: Magnesium-Aluminum Alloy\r\n\r\n\r\nSecurity: Fingerprint, fTPM 2.0'),
(1951, 28, 'processor', 'AMD Ryzen™ AI 9 HX 370 (12 cores, 24 threads, 50 NPU TOPS)'),
(1952, 28, 'clock_speed', 'Up to 5.1 GHz, 36MB cache'),
(1953, 28, 'GPU', 'NVIDIA® GeForce RTX™ 5060 Laptop GPU (572 AI TOPS)'),
(1954, 28, 'RAM', '32GB (2x16GB) DDR5 5600MHz'),
(1955, 28, 'RAM_slot', '2x SO-DIMM sockets (up to 96GB)'),
(1956, 28, 'SSD_OR_HDD', '2TB NVMe SSD PCIe Gen4 (2x M.2 slots total)'),
(1957, 28, 'OS', 'Windows 11 Home'),
(1958, 28, 'display_size', '16.0-inch'),
(1959, 28, 'display_type', 'QHD+ (2560 x 1600) 16:10, OLED, 240Hz, 1ms, 100% DCI-P3, VESA DisplayHDR™ True Black 600'),
(1960, 28, 'display_touch', 'No'),
(1961, 28, 'power_adapter', '240W AC Adapter'),
(1962, 28, 'battery_capacity', '99.9Whr, 4-cell'),
(1963, 28, 'battery_hour', 'Varies based on usage'),
(1964, 28, 'dimension', '355.8 x 259.7 x 19.95 mm'),
(1965, 28, 'weight', '2.1 kg'),
(1966, 28, 'colors', 'Core Black'),
(1967, 28, 'IO_ports', '1x Type-C (USB4® / DP / PD 3.0 / Thunderbolt™ 4 compatible)\r\n\r\n\r\n2x Type-A USB3.2 Gen2\r\n\r\n\r\n1x HDMI™ 2.1 (8K@60Hz / 4K@120Hz)\r\n\r\n\r\n1x Micro SD Card Reader\r\n\r\n\r\n1x RJ45\r\n\r\n\r\n1x Mic-in/Headphone-out Combo Jack'),
(1968, 28, 'fingerprint_sensor', 'Yes'),
(1969, 28, 'camera', 'IR FHD (1080p@30fps) with HDR & 3D Noise Reduction+'),
(1970, 28, 'keyboard', 'Per-Key RGB Gaming Keyboard by SteelSeries (w/ Copilot Key)'),
(1971, 28, 'touchpad', 'Multi-touch Touchpad'),
(1972, 28, 'WIFI', 'Wi-Fi 7'),
(1973, 28, 'bluetooth', 'Bluetooth® v5.4'),
(1974, 28, 'speaker', '6-speaker system (2x 2W speakers + 4x 2W woofers) by Dynaudio'),
(1975, 28, 'mic', 'Built-in array microphone'),
(1976, 28, 'other', 'LAN: 2.5 Gigabit Ethernet\r\n\r\n\r\nMaterial: Metal (Lid, Keyboard deck, Bottom), Plastic (Bezel)\r\n\r\n\r\nSecurity: Fingerprint, fTPM 2.0'),
(1977, 29, 'processor', 'Intel® Core™ i9-14900K (24 Cores / 32 Threads)'),
(1978, 29, 'clock_speed', 'Up to 6.0 GHz'),
(1979, 29, 'GPU', 'GIGABYTE AORUS GeForce RTX 4080 SUPER XTREME ICE 16G'),
(1980, 29, 'RAM', '64GB (2x32GB) Corsair Dominator Titanium White RGB 6600 DDR5'),
(1981, 29, 'RAM_slot', '4x DDR5 DIMM Sockets (2 used)'),
(1982, 29, 'SSD_OR_HDD', 'None'),
(1983, 29, 'OS', 'None'),
(1984, 29, 'display_size', 'None'),
(1985, 29, 'display_type', 'None'),
(1986, 29, 'display_touch', 'None'),
(1987, 29, 'power_adapter', 'GIGABYTE AORUS ELITE P1000W PCIe 5.0 ICE (1000W PSU)'),
(1988, 29, 'battery_capacity', 'None'),
(1989, 29, 'battery_hour', 'Varies on usage'),
(1990, 29, 'dimension', '470 x 320 x 470 mm'),
(1991, 29, 'weight', 'Varies based on final components'),
(1992, 29, 'colors', 'Snow White'),
(1993, 29, 'IO_ports', 'Case (Front/Top):\r\n\r\n\r\n• 1x USB-C 3.2 Gen 2\r\n\r\n\r\n• 2x USB-A 3.2 Gen 1\r\n\r\n\r\n• 1x 3.5mm Audio/Mic Combo Jack\r\n\r\n\r\n\r\nMotherboard (Rear):\r\n\r\n\r\n• 2x Thunderbolt™ 4 (USB-C)\r\n\r\n\r\n• 10x USB 3.2 Gen 2 (Type-A)\r\n\r\n\r\n• 1x 10GbE LAN (RJ-45)\r\n\r\n\r\n• 1x 2.5GbE LAN (RJ-45)\r\n\r\n\r\n• 2x SMA Antenna Connectors (Wi-Fi 7)\r\n\r\n\r\n• 1x Optical S/PDIF Out\r\n\r\n\r\n• 2x Audio Jacks\r\n\r\n\r\n\r\nGraphics Card (Rear):\r\n\r\n\r\n• 3x DisplayPort 1.4a\r\n\r\n\r\n• 1x HDMI 2.1a'),
(1994, 29, 'fingerprint_sensor', 'None'),
(1995, 29, 'camera', 'None'),
(1996, 29, 'keyboard', 'None'),
(1997, 29, 'touchpad', 'None'),
(1998, 29, 'WIFI', 'Wi-Fi 7 (Intel® Wi-Fi 7 BE200)'),
(1999, 29, 'bluetooth', 'Bluetooth® 5.3'),
(2000, 29, 'speaker', 'None'),
(2001, 29, 'mic', 'None'),
(2002, 29, 'other', 'Case Screen: 14.9-inch 2.5K (682x2560) Capacitive Touchscreen'),
(2003, 30, 'processor', 'Intel® Core™ i9-14900K (24 Cores / 32 Threads)'),
(2004, 30, 'clock_speed', '4.4 GHz (Base) up to 6.0 GHz (Turbo)'),
(2005, 30, 'GPU', 'ASUS ROG Astral GeForce RTX 5080 16GB GDDR7 OC Edition'),
(2006, 30, 'RAM', '64GB (2x32GB) Corsair Dominator Titanium White RGB 6000 DDR5'),
(2007, 30, 'RAM_slot', '4x DDR5 DIMM Sockets (2 used)'),
(2008, 30, 'SSD_OR_HDD', '1TB Samsung 990 EVO Plus M.2 PCIe Gen4 NVMe (HDD Optional)'),
(2009, 30, 'OS', 'None'),
(2010, 30, 'display_size', 'None'),
(2011, 30, 'display_type', 'None'),
(2012, 30, 'display_touch', 'None'),
(2013, 30, 'power_adapter', 'ASUS ROG Thor 1000P2 (1000W, 80 Plus Platinum, Full Modular)'),
(2014, 30, 'battery_capacity', 'None'),
(2015, 30, 'battery_hour', 'None'),
(2016, 30, 'dimension', '268 x 639 x 659 mm (Case: ASUS ROG Hyperion GR701)'),
(2017, 30, 'weight', 'None (Varies based on final build)'),
(2018, 30, 'colors', 'White'),
(2019, 30, 'IO_ports', 'Case (Front/Top):\r\n\r\n\r\n• 1x USB-C 3.2 Gen 2x2 (supports 60W PD)\r\n\r\n\r\n• 4x USB-A 3.2 Gen 1\r\n\r\n\r\n• 1x 3.5mm Audio/Mic Combo Jack\r\n\r\n\r\n\r\nMotherboard (Rear):\r\n\r\n\r\n• 1x USB-C 20Gbps (Gen 2x2)\r\n\r\n\r\n• 5x USB-A 10Gbps (Gen 2)\r\n\r\n\r\n• 4x USB-A 5Gbps (Gen 1)\r\n\r\n\r\n• 1x HDMI\r\n\r\n\r\n• 1x DisplayPort (Input only)\r\n\r\n\r\n• 1x 2.5GbE LAN (RJ-45)\r\n\r\n\r\n• Wi-Fi Antenna Connectors\r\n\r\n\r\n• 5x Audio Jacks + 1x Optical S/PDIF\r\n\r\n\r\n\r\nGraphics Card (Rear):\r\n\r\n\r\n• (Typically 3x DisplayPort, 1x HDMI)'),
(2020, 30, 'fingerprint_sensor', 'None'),
(2021, 30, 'camera', 'None'),
(2022, 30, 'keyboard', 'None'),
(2023, 30, 'touchpad', 'None'),
(2024, 30, 'WIFI', 'Wi-Fi 6E (Onboard Motherboard)'),
(2025, 30, 'bluetooth', 'Bluetooth® 5.4 (Onboard Motherboard)'),
(2026, 30, 'speaker', 'None'),
(2027, 30, 'mic', 'None'),
(2028, 30, 'other', 'CPU Cooler: ASUS ROG RYUJIN III 360 ARGB White'),
(2029, 31, 'processor', 'Intel® Core™ i5-14400F (10 Cores / 16 Threads)'),
(2030, 31, 'clock_speed', 'Up to 4.7 GHz (P-core Max Turbo)'),
(2031, 31, 'GPU', 'Asus GeForce RTX 5060 Ti DUAL OC 16GB'),
(2032, 31, 'RAM', '32GB Corsair Vengeance RGB 5600 DDR5'),
(2033, 31, 'RAM_slot', '4x DDR5 DIMM Sockets (2 used)'),
(2034, 31, 'SSD_OR_HDD', '1TB Kingston NV3 M.2 PCIe NVMe Gen4 (HDD Optional)'),
(2035, 31, 'OS', 'None'),
(2036, 31, 'display_size', 'None'),
(2037, 31, 'display_type', 'None'),
(2038, 31, 'display_touch', 'None'),
(2039, 31, 'power_adapter', 'FSP HV PRO 650W - 80 Plus Bronze (PSU)'),
(2040, 31, 'battery_capacity', 'None'),
(2041, 31, 'battery_hour', 'None'),
(2042, 31, 'dimension', '383 x 210 x 445 mm (Case: Xigmatek QUANTUM 4AF)'),
(2043, 31, 'weight', 'None (Varies based on final build)'),
(2044, 31, 'colors', 'Black'),
(2045, 31, 'IO_ports', 'Case (Front/Top):\r\n\r\n\r\n• 1x USB 3.0\r\n\r\n\r\n• 2x USB 2.0\r\n\r\n\r\n• 1x HD Audio/Mic Jack\r\n\r\n\r\n\r\nMotherboard (Rear):\r\n\r\n\r\n• 1x USB-C 20Gbps (Gen 2x2)\r\n\r\n\r\n• 1x USB-A 10Gbps (Gen 2)\r\n\r\n\r\n• 2x USB-A 5Gbps (Gen 1)\r\n\r\n\r\n• 2x USB 2.0\r\n\r\n\r\n• 1x DisplayPort\r\n\r\n\r\n• 1x HDMI\r\n\r\n\r\n• 1x 2.5GbE LAN (RJ-45)\r\n\r\n\r\n• Wi-Fi 6E Antenna Connectors\r\n\r\n\r\n• 5x Audio Jacks + 1x Optical S/PDIF\r\n\r\n\r\n\r\nGraphics Card (Rear):\r\n\r\n\r\n• (Typically 3x DisplayPort, 1x HDMI)'),
(2046, 31, 'fingerprint_sensor', 'None'),
(2047, 31, 'camera', 'None'),
(2048, 31, 'keyboard', 'None'),
(2049, 31, 'touchpad', 'None'),
(2050, 31, 'WIFI', 'Wi-Fi 6E (Onboard Motherboard)'),
(2051, 31, 'bluetooth', 'Bluetooth® 5.3 (Onboard Motherboard)'),
(2052, 31, 'speaker', 'None'),
(2053, 31, 'mic', 'None'),
(2054, 31, 'other', 'CPU Cooler: Cooler Master Hyper 212 Spectrum V3 ARGB'),
(2055, 32, 'processor', 'AMD Ryzen™ 9 9950X (16 cores / 32 threads)'),
(2056, 32, 'clock_speed', '4.3 GHz (Base) up to 5.7 GHz (Boost)'),
(2057, 32, 'GPU', 'ASUS TUF Gaming GeForce RTX 4090 24GB GDDR6X OG OC Edition'),
(2058, 32, 'RAM', '48GB (2x24GB) TeamGroup T-Force XTreem ARGB 8000Mhz DDR5'),
(2059, 32, 'RAM_slot', '4x DDR5 DIMM Sockets (2 used)'),
(2060, 32, 'SSD_OR_HDD', '2TB Samsung 990 PRO M.2 PCIe Gen4 NVMe (HDD Optional)'),
(2061, 32, 'OS', 'None'),
(2062, 32, 'display_size', 'None'),
(2063, 32, 'display_type', 'None'),
(2064, 32, 'display_touch', 'None'),
(2065, 32, 'power_adapter', 'ASUS ROG Thor 1200P2 (1200W, 80 Plus Platinum, Full Modular)'),
(2066, 32, 'battery_capacity', 'None'),
(2067, 32, 'battery_hour', 'None'),
(2068, 32, 'dimension', '268 x 639 x 659 mm (Case: ASUS ROG Hyperion GR701)'),
(2069, 32, 'weight', 'None'),
(2070, 32, 'colors', 'Black'),
(2071, 32, 'IO_ports', 'Case (Front/Top):\r\n\r\n\r\n• 1x USB-C 3.2 Gen 2x2 (supports 60W PD)\r\n\r\n\r\n• 4x USB-A 3.2 Gen 1\r\n\r\n\r\n• 1x 3.5mm Audio/Mic Combo Jack\r\n\r\n\r\n\r\nMotherboard (Rear):\r\n\r\n\r\n• 1x USB-C 20Gbps (Gen 2x2)\r\n\r\n\r\n• 1x USB-C 10Gbps (Gen 2)\r\n\r\n\r\n• 8x USB-A 10Gbps (Gen 2)\r\n\r\n\r\n• 2x USB-A 5Gbps (Gen 1)\r\n\r\n\r\n• 1x 5GbE LAN (RJ-45)\r\n\r\n\r\n• Wi-Fi 7 Antenna Connectors\r\n\r\n\r\n• 5x Audio Jacks + 1x Optical S/PDIF\r\n\r\n\r\n\r\nGraphics Card (Rear):\r\n\r\n\r\n• 3x DisplayPort 1.4a\r\n\r\n\r\n• 1x HDMI 2.1'),
(2072, 32, 'fingerprint_sensor', 'None'),
(2073, 32, 'camera', 'None'),
(2074, 32, 'keyboard', 'None'),
(2075, 32, 'touchpad', 'None'),
(2076, 32, 'WIFI', 'Wi-Fi 7 (Onboard Motherboard)'),
(2077, 32, 'bluetooth', 'Bluetooth® 5.4 (Onboard Motherboard)'),
(2078, 32, 'speaker', 'None'),
(2079, 32, 'mic', 'None'),
(2080, 32, 'other', 'CPU Cooler: ASUS ROG Ryujin III 360 ARGB Extreme'),
(2081, 33, 'processor', 'AMD Ryzen™ 5 7600 (6 cores / 12 threads)'),
(2082, 33, 'clock_speed', '3.8 GHz (Base) up to 5.1 GHz (Boost)'),
(2083, 33, 'GPU', 'GIGABYTE GeForce RTX 4060 WINDFORCE OC 8G'),
(2084, 33, 'RAM', '16GB (2x8GB) Kingston Fury Beast RGB 5600 DDR5'),
(2085, 33, 'RAM_slot', '4x DDR5 DIMM Sockets (2 used)'),
(2086, 33, 'SSD_OR_HDD', '500GB WD Black SN770 M.2 NVMe PCIe Gen4 (HDD Optional)'),
(2087, 33, 'OS', 'None'),
(2088, 33, 'display_size', 'None'),
(2089, 33, 'display_type', 'None'),
(2090, 33, 'display_touch', 'None'),
(2091, 33, 'power_adapter', 'Corsair CX750 (750W, 80 Plus Bronze) (PSU)'),
(2092, 33, 'battery_capacity', 'None'),
(2093, 33, 'battery_hour', 'None'),
(2094, 33, 'dimension', '430 x 220 x 465 mm (Case: ASUS A21 BLACK)'),
(2095, 33, 'weight', 'None (Varies based on final build)'),
(2096, 33, 'colors', 'Black'),
(2097, 33, 'IO_ports', 'Case (Front/Top):\r\n\r\n\r\n• 2x USB 3.0\r\n\r\n\r\n• 1x Headphone/Mic Combo Jack\r\n\r\n\r\n\r\nMotherboard (Rear):\r\n\r\n\r\n• 1x USB-C 10Gbps (Gen 2)\r\n\r\n\r\n• 2x USB-A 10Gbps (Gen 2)\r\n\r\n\r\n• 1x USB-A 5Gbps (Gen 1)\r\n\r\n\r\n• 1x DisplayPort\r\n\r\n\r\n• 1x HDMI\r\n\r\n\r\n• 1x 2.5GbE LAN (RJ-45)\r\n\r\n\r\n• Wi-Fi 6E Antenna Connectors\r\n\r\n\r\n• 3x Audio Jacks\r\n\r\n\r\n\r\nGraphics Card (Rear):<Additional IO ports from the GPU, typically 2x DisplayPort 1.4a, 2x HDMI 2.1a>'),
(2098, 33, 'fingerprint_sensor', 'None '),
(2099, 33, 'camera', 'None '),
(2100, 33, 'keyboard', 'None '),
(2101, 33, 'touchpad', 'None '),
(2102, 33, 'WIFI', 'Wi-Fi 6E (Onboard Motherboard)'),
(2103, 33, 'bluetooth', 'Bluetooth® 5.3 (Onboard Motherboard)'),
(2104, 33, 'speaker', 'None'),
(2105, 33, 'mic', 'None'),
(2106, 33, 'other', 'CPU Cooler: Cooler Master Hyper 212 Spectrum V3 ARGB\r\n\r\n\r\nCase Fans: 3x Xigmatek STARLINK ARGB BLACK'),
(2107, 34, 'processor', 'AMD Ryzen™ 5 5500 (6 cores / 12 threads)'),
(2108, 34, 'clock_speed', '3.6 GHz (Base) up to 4.2 GHz (Boost)'),
(2109, 34, 'GPU', 'MSI GeForce RTX 3050 VENTUS 2X E 6G OC'),
(2110, 34, 'RAM', '16GB (2x8GB) V-Color Skywalker Plus 3600 RGB DDR4'),
(2111, 34, 'RAM_slot', '4x DDR4 DIMM Sockets (2 used)'),
(2112, 34, 'SSD_OR_HDD', '500GB WD Black SN770 M.2 NVMe PCIe Gen4 (HDD Optional)'),
(2113, 34, 'OS', 'None'),
(2114, 34, 'display_size', 'None'),
(2115, 34, 'display_type', 'None'),
(2116, 34, 'display_touch', 'None'),
(2117, 34, 'power_adapter', 'FSP HV PRO 650W - 80 Plus Bronze (PSU)'),
(2118, 34, 'battery_capacity', 'None'),
(2119, 34, 'battery_hour', 'None');
INSERT INTO `specification_list` (`id`, `product_id`, `meta_field`, `meta_value`) VALUES
(2120, 34, 'dimension', '378 x 210 x 453 mm (Case: Xigmatek QUANTUM 3GF)'),
(2121, 34, 'weight', 'None (Varies based on final build)'),
(2122, 34, 'colors', 'Black'),
(2123, 34, 'IO_ports', 'Case (Front/Top):\r\n\r\n\r\n• 1x USB 3.0\r\n\r\n\r\n• 2x USB 2.0\r\n\r\n\r\n• 1x HD Audio/Mic Jack\r\n\r\n\r\n\r\nMotherboard (Rear):\r\n\r\n\r\n• 2x USB 3.2 Gen 2 (Type-A)\r\n\r\n\r\n• 4x USB 3.2 Gen 1 (Type-A)<L> • 1x DisplayPort\r\n\r\n\r\n• 1x HDMI\r\n\r\n\r\n• 1x D-Sub (VGA)\r\n\r\n\r\n• 1x 1GbE LAN (RJ-45)\r\n\r\n\r\n• Wi-Fi 6 Antenna Connectors\r\n\r\n\r\n• 3x Audio Jacks\r\n\r\n\r\n\r\nGraphics Card (Rear):\r\n\r\n\r\n• 1x DisplayPort 1.4a\r\n\r\n\r\n• 1x HDMI 2.1\r\n\r\n\r\n• 1x DVI-D'),
(2124, 34, 'fingerprint_sensor', 'None'),
(2125, 34, 'camera', 'None'),
(2126, 34, 'keyboard', 'None'),
(2127, 34, 'touchpad', 'None'),
(2128, 34, 'WIFI', 'Wi-Fi 6 (Onboard Motherboard)'),
(2129, 34, 'bluetooth', 'Bluetooth® 5.2 (Onboard Motherboard)'),
(2130, 34, 'speaker', 'None'),
(2131, 34, 'mic', 'None'),
(2132, 34, 'other', 'CPU Cooler: Cooler Master Hyper 212 Spectrum V3 ARGB'),
(2133, 35, 'processor', 'AMD Ryzen™ 7 7700 (8 cores / 16 threads)'),
(2134, 35, 'clock_speed', '3.8 GHz (Base) up to 5.3 GHz (Boost)'),
(2135, 35, 'GPU', 'ASUS Dual GeForce RTX 3060 12GB V2'),
(2136, 35, 'RAM', '32GB (2x16GB) Corsair Vengeance RGB 5600 DDR5'),
(2137, 35, 'RAM_slot', '4x DDR5 DIMM Sockets (2 used)'),
(2138, 35, 'SSD_OR_HDD', '500GB WD Black SN770 M.2 NVMe PCIe Gen4 (HDD Optional)'),
(2139, 35, 'OS', 'None'),
(2140, 35, 'display_size', 'None'),
(2141, 35, 'display_type', 'None'),
(2142, 35, 'display_touch', 'None'),
(2143, 35, 'power_adapter', 'Corsair CX750 (750W, 80 Plus Bronze) (PSU)'),
(2144, 35, 'battery_capacity', 'None'),
(2145, 35, 'battery_hour', 'None'),
(2146, 35, 'dimension', '458 x 230 x 471 mm (Case: Deepcool CH560 DIGITAL)'),
(2147, 35, 'weight', 'None (Varies based on final build)'),
(2148, 35, 'colors', 'White'),
(2149, 35, 'IO_ports', 'Case (Front/Top):\r\n\r\n\r\n• 1x USB-C 3.2 Gen 1\r\n\r\n\r\n• 1x USB-A 3.0\r\n\r\n\r\n• 1x Headphone/Mic Combo Jack\r\n\r\n\r\n\r\nMotherboard (Rear):\r\n\r\n\r\n• 2x USB 3.2 Gen 2 (Type-A)\r\n\r\n\r\n• 1x USB 3.2 Gen 1 (Type-A)\r\n\r\n\r\n• 1x DisplayPort\r\n\r\n\r\n• 1x HDMI\r\n\r\n\r\n• 1x 2.5GbE LAN (RJ-45)\r\n\r\n\r\n• Wi-Fi 6E Antenna Connectors\r\n\r\n\r\n• 3x Audio Jacks\r\n\r\n\r\n\r\nGraphics Card (Rear):\r\n\r\n\r\n• 3x DisplayPort 1.4a\r\n\r\n\r\n• 1x HDMI 2.1'),
(2150, 35, 'fingerprint_sensor', 'None'),
(2151, 35, 'camera', 'None'),
(2152, 35, 'keyboard', 'None'),
(2153, 35, 'touchpad', 'None'),
(2154, 35, 'WIFI', 'Wi-Fi 6E (Onboard Motherboard)'),
(2155, 35, 'bluetooth', 'Bluetooth® 5.3 (Onboard Motherboard)'),
(2156, 35, 'speaker', 'None'),
(2157, 35, 'mic', 'None'),
(2158, 35, 'other', 'CPU Cooler: Deepcool LT520 White (240mm AIO)\r\n\r\n\r\nCase Feature: Digital CPU/GPU Status Screen'),
(2159, 36, 'processor', 'Intel® Core™ i5-14400F (10 Cores / 16 Threads)'),
(2160, 36, 'clock_speed', 'Up to 4.7 GHz (Max Turbo)'),
(2161, 36, 'GPU', 'Asus GeForce RTX 5060 DUAL OC 8GB'),
(2162, 36, 'RAM', '32GB Corsair Vengeance RGB 5600 DDR5'),
(2163, 36, 'RAM_slot', '4x DDR5 DIMM Sockets (2 used)'),
(2164, 36, 'SSD_OR_HDD', '1TB Kingston NV3 M.2 PCIe NVMe Gen4 (HDD Optional)'),
(2165, 36, 'OS', 'None'),
(2166, 36, 'display_size', 'None'),
(2167, 36, 'display_type', 'None'),
(2168, 36, 'display_touch', 'None'),
(2169, 36, 'power_adapter', 'Corsair CX750 (750W, 80 Plus Bronze) (PSU)'),
(2170, 36, 'battery_capacity', 'None'),
(2171, 36, 'battery_hour', 'None'),
(2172, 36, 'dimension', '506 x 240 x 460 mm (Case: Corsair 3500X)'),
(2173, 36, 'weight', 'None (Varies based on final build)'),
(2174, 36, 'colors', 'Black'),
(2175, 36, 'IO_ports', 'Case (Front/Top):\r\n\r\n\r\n• 1x USB 3.2 Gen 2 Type-C\r\n\r\n\r\n• 2x USB 3.2 Gen 1 Type-A\r\n\r\n\r\n• 1x Headphone/Mic Combo Jack\r\n\r\n\r\n\r\nMotherboard (Rear):\r\n\r\n\r\n• 1x USB 3.2 Gen 2x2 Type-C (20Gbps)\r\n\r\n\r\n• 1x USB 3.2 Gen 2 Type-A (10Gbps)\r\n\r\n\r\n• 2x USB 3.2 Gen 1 Type-A (5Gbps)\r\n\r\n\r\n• 2x USB 2.0\r\n\r\n\r\n• 1x DisplayPort / 1x HDMI\r\n\r\n\r\n• 1x 2.5GbE LAN (RJ-45)\r\n\r\n\r\n• Wi-Fi 6E Antenna Connectors\r\n\r\n\r\n• 5x Audio Jacks + 1x Optical S/PDIF\r\n\r\n\r\n\r\nGraphics Card (Rear):\r\n\r\n\r\n• (Typically 3x DisplayPort, 1x HDMI)'),
(2176, 36, 'fingerprint_sensor', 'None'),
(2177, 36, 'camera', 'None'),
(2178, 36, 'keyboard', 'None'),
(2179, 36, 'touchpad', 'None'),
(2180, 36, 'WIFI', 'Wi-Fi 6E (Onboard Motherboard)'),
(2181, 36, 'bluetooth', 'Bluetooth® 5.3 (Onboard Motherboard)'),
(2182, 36, 'speaker', 'None'),
(2183, 36, 'mic', 'None'),
(2184, 36, 'other', 'CPU Cooler: None (Air or AIO Cooler Required)\r\n\r\n\r\nCase Fans: 3x Corsair RS120 ARGB BLACK');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `role_id` int(11) DEFAULT 3,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `role_id`, `status`, `last_login`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '$2y$10$y0p7spgiauysy1J.XC8/3u9nV58HFab64sSKckQpVySGydVODKbme', 'uploads/1624240500_avatar.png', 1, 1, NULL, '2021-01-20 14:02:37', '2023-04-03 13:26:20');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(2, 1, 'Laptop', 'All portable computers featuring a built-in screen, keyboard, and battery. Covers a wide range of mobile devices for various uses.', 1, '2023-04-03 09:37:12'),
(8, 1, 'Desktop PC', 'A range of desktop computers designed for stationary use. Ideal for home offices, professional workstations, or high-performance gaming setups.', 1, '2025-11-12 08:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Mobile Store Management System - PHP'),
(6, 'short_name', 'TechNova'),
(11, 'logo', 'uploads/1680484800_logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1680484800_bg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '$2y$10$y0p7spgiauysy1J.XC8/3u9nV58HFab64sSKckQpVySGydVODKbme', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2023-04-03 13:26:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specification_list`
--
ALTER TABLE `specification_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id_fk` (`product_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `specification_list`
--
ALTER TABLE `specification_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2185;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `specification_list`
--
ALTER TABLE `specification_list`
  ADD CONSTRAINT `product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
