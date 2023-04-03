-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 09, 2022 at 11:01 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

--
-- Database: `install_modesy`
--

-- --------------------------------------------------------

--
-- Table structure for table `abuse_reports`
--

CREATE TABLE `abuse_reports` (
  `id` int(11) NOT NULL,
  `item_type` varchar(30) DEFAULT 'product',
  `item_id` int(11) DEFAULT NULL,
  `report_user_id` int(11) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ad_spaces`
--

CREATE TABLE `ad_spaces` (
  `id` tinyint(4) NOT NULL,
  `ad_space` text DEFAULT NULL,
  `ad_code_728` text DEFAULT NULL,
  `ad_code_468` text DEFAULT NULL,
  `ad_code_300` text DEFAULT NULL,
  `ad_code_250` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_spaces`
--

INSERT INTO `ad_spaces` (`id`, `ad_space`, `ad_code_728`, `ad_code_468`, `ad_code_300`, `ad_code_250`) VALUES
(1, 'index_1', NULL, NULL, NULL, NULL),
(2, 'index_2', NULL, NULL, NULL, NULL),
(3, 'products', NULL, NULL, NULL, NULL),
(4, 'products_sidebar', NULL, NULL, NULL, NULL),
(5, 'product', NULL, NULL, NULL, NULL),
(6, 'product_bottom', NULL, NULL, NULL, NULL),
(7, 'profile', NULL, NULL, NULL, NULL),
(8, 'profile_sidebar', NULL, NULL, NULL, NULL),
(9, 'blog_1', NULL, NULL, NULL, NULL),
(10, 'blog_2', NULL, NULL, NULL, NULL),
(11, 'blog_post_details', NULL, NULL, NULL, NULL),
(12, 'blog_post_details_sidebar', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_transfers`
--

CREATE TABLE `bank_transfers` (
  `id` int(11) NOT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  `payment_note` varchar(500) DEFAULT NULL,
  `receipt_path` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `ip_address` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL,
  `lang_id` tinyint(4) DEFAULT 1,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `category_order` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` varchar(5000) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_images`
--

CREATE TABLE `blog_images` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `image_path_thumb` varchar(255) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `lang_id` tinyint(4) DEFAULT 1,
  `title` varchar(500) DEFAULT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local',
  `image_default` varchar(255) DEFAULT NULL,
  `image_small` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `tag_slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `tree_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent_tree` varchar(255) DEFAULT NULL,
  `title_meta_tag` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `category_order` mediumint(9) DEFAULT 0,
  `featured_order` mediumint(9) DEFAULT 1,
  `homepage_order` mediumint(9) DEFAULT 5,
  `visibility` tinyint(1) DEFAULT 1,
  `is_featured` tinyint(1) DEFAULT 0,
  `show_on_main_menu` tinyint(1) DEFAULT 1,
  `show_image_on_main_menu` tinyint(1) DEFAULT 0,
  `show_products_on_index` tinyint(1) DEFAULT 0,
  `show_subcategory_products` tinyint(1) DEFAULT 0,
  `storage` varchar(20) DEFAULT 'local',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories_lang`
--

CREATE TABLE `categories_lang` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `lang_id` tinyint(4) DEFAULT 1,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` varchar(5000) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(5000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  `product_id` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conversation_messages`
--

CREATE TABLE `conversation_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` varchar(10000) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_user_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `discount_rate` smallint(6) DEFAULT NULL,
  `coupon_count` int(11) DEFAULT NULL,
  `minimum_order_amount` bigint(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `usage_type` varchar(20) DEFAULT 'single',
  `category_ids` text DEFAULT NULL,
  `expiry_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupons_used`
--

CREATE TABLE `coupons_used` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_products`
--

CREATE TABLE `coupon_products` (
  `id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `currency_format` varchar(30) DEFAULT 'us',
  `symbol_direction` varchar(30) DEFAULT 'left',
  `space_money_symbol` tinyint(1) DEFAULT 0,
  `exchange_rate` double DEFAULT 1,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `name_array` text DEFAULT NULL,
  `field_type` varchar(20) DEFAULT NULL,
  `row_width` varchar(20) DEFAULT 'half',
  `is_required` tinyint(1) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `field_order` int(11) DEFAULT 1,
  `is_product_filter` tinyint(1) DEFAULT 0,
  `product_filter_key` varchar(255) DEFAULT NULL,
  `sort_options` varchar(30) DEFAULT 'alphabetically'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_category`
--

CREATE TABLE `custom_fields_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_options`
--

CREATE TABLE `custom_fields_options` (
  `id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `option_key` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_options_lang`
--

CREATE TABLE `custom_fields_options_lang` (
  `id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `option_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_product`
--

CREATE TABLE `custom_fields_product` (
  `id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_filter_key` varchar(255) DEFAULT NULL,
  `field_value` varchar(1000) DEFAULT NULL,
  `selected_option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `digital_files`
--

CREATE TABLE `digital_files` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `digital_sales`
--

CREATE TABLE `digital_sales` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_title` varchar(500) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `license_key` varchar(255) DEFAULT NULL,
  `purchase_code` varchar(100) NOT NULL,
  `currency` varchar(20) NOT NULL DEFAULT 'USD',
  `price` bigint(20) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(11) NOT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  `order_product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sale_amount` bigint(20) DEFAULT NULL,
  `vat_rate` double DEFAULT NULL,
  `vat_amount` bigint(20) DEFAULT NULL,
  `commission_rate` tinyint(4) DEFAULT NULL,
  `commission` bigint(20) DEFAULT NULL,
  `coupon_discount` bigint(20) DEFAULT NULL,
  `shipping_cost` bigint(20) DEFAULT NULL,
  `earned_amount` bigint(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT 'USD',
  `exchange_rate` double DEFAULT 1,
  `is_refunded` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `following_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fonts`
--

CREATE TABLE `fonts` (
  `id` int(11) NOT NULL,
  `font_name` varchar(255) DEFAULT NULL,
  `font_url` varchar(2000) DEFAULT NULL,
  `font_family` varchar(500) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fonts`
--

INSERT INTO `fonts` (`id`, `font_name`, `font_url`, `font_family`, `is_default`) VALUES
(1, 'Arial', NULL, 'font-family: Arial, Helvetica, sans-serif', 1),
(2, 'Arvo', '<link href=\"https://fonts.googleapis.com/css?family=Arvo:400,700&display=swap\" rel=\"stylesheet\">\r\n', 'font-family: \"Arvo\", Helvetica, sans-serif', 0),
(3, 'Averia Libre', '<link href=\"https://fonts.googleapis.com/css?family=Averia+Libre:300,400,700&display=swap\" rel=\"stylesheet\">\r\n', 'font-family: \"Averia Libre\", Helvetica, sans-serif', 0),
(4, 'Bitter', '<link href=\"https://fonts.googleapis.com/css?family=Bitter:400,400i,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Bitter\", Helvetica, sans-serif', 0),
(5, 'Cabin', '<link href=\"https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap&subset=latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Cabin\", Helvetica, sans-serif', 0),
(6, 'Cherry Swash', '<link href=\"https://fonts.googleapis.com/css?family=Cherry+Swash:400,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Cherry Swash\", Helvetica, sans-serif', 0),
(7, 'Encode Sans', '<link href=\"https://fonts.googleapis.com/css?family=Encode+Sans:300,400,500,600,700&display=swap&subset=latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Encode Sans\", Helvetica, sans-serif', 0),
(8, 'Helvetica', NULL, 'font-family: Helvetica, sans-serif', 1),
(9, 'Hind', '<link href=\"https://fonts.googleapis.com/css?family=Hind:300,400,500,600,700&display=swap&subset=devanagari,latin-ext\" rel=\"stylesheet\">', 'font-family: \"Hind\", Helvetica, sans-serif', 0),
(10, 'Josefin Sans', '<link href=\"https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,600,700&display=swap&subset=latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Josefin Sans\", Helvetica, sans-serif', 0),
(11, 'Kalam', '<link href=\"https://fonts.googleapis.com/css?family=Kalam:300,400,700&display=swap&subset=devanagari,latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Kalam\", Helvetica, sans-serif', 0),
(12, 'Khula', '<link href=\"https://fonts.googleapis.com/css?family=Khula:300,400,600,700&display=swap&subset=devanagari,latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Khula\", Helvetica, sans-serif', 0),
(13, 'Lato', '<link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">', 'font-family: \"Lato\", Helvetica, sans-serif', 0),
(14, 'Lora', '<link href=\"https://fonts.googleapis.com/css?family=Lora:400,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Lora\", Helvetica, sans-serif', 0),
(15, 'Merriweather', '<link href=\"https://fonts.googleapis.com/css?family=Merriweather:300,400,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Merriweather\", Helvetica, sans-serif', 0),
(16, 'Montserrat', '<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Montserrat\", Helvetica, sans-serif', 0),
(17, 'Mukta', '<link href=\"https://fonts.googleapis.com/css?family=Mukta:300,400,500,600,700&display=swap&subset=devanagari,latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Mukta\", Helvetica, sans-serif', 0),
(18, 'Nunito', '<link href=\"https://fonts.googleapis.com/css?family=Nunito:300,400,600,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Nunito\", Helvetica, sans-serif', 0),
(19, 'Open Sans', '<link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap\" rel=\"stylesheet\">', 'font-family: \"Open Sans\", Helvetica, sans-serif', 0),
(20, 'Oswald', '<link href=\"https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext,vietnamese\" rel=\"stylesheet\">', 'font-family: \"Oswald\", Helvetica, sans-serif', 0),
(21, 'Oxygen', '<link href=\"https://fonts.googleapis.com/css?family=Oxygen:300,400,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Oxygen\", Helvetica, sans-serif', 0),
(22, 'Poppins', '<link href=\"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap&subset=devanagari,latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Poppins\", Helvetica, sans-serif', 0),
(23, 'PT Sans', '<link href=\"https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"PT Sans\", Helvetica, sans-serif', 0),
(24, 'Raleway', '<link href=\"https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Raleway\", Helvetica, sans-serif', 0),
(25, 'Roboto', '<link href=\"https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese\" rel=\"stylesheet\">', 'font-family: \"Roboto\", Helvetica, sans-serif', 0),
(26, 'Roboto Condensed', '<link href=\"https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700&display=swap&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Roboto Condensed\", Helvetica, sans-serif', 0),
(27, 'Roboto Slab', '<link href=\"https://fonts.googleapis.com/css?family=Roboto+Slab:300,400,500,600,700&display=swap&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Roboto Slab\", Helvetica, sans-serif', 0),
(28, 'Rokkitt', '<link href=\"https://fonts.googleapis.com/css?family=Rokkitt:300,400,500,600,700&display=swap&subset=latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Rokkitt\", Helvetica, sans-serif', 0),
(29, 'Source Sans Pro', '<link href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese\" rel=\"stylesheet\">', 'font-family: \"Source Sans Pro\", Helvetica, sans-serif', 0),
(30, 'Titillium Web', '<link href=\"https://fonts.googleapis.com/css?family=Titillium+Web:300,400,600,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">', 'font-family: \"Titillium Web\", Helvetica, sans-serif', 0),
(31, 'Ubuntu', '<link href=\"https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700&display=swap&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext\" rel=\"stylesheet\">', 'font-family: \"Ubuntu\", Helvetica, sans-serif', 0),
(32, 'Verdana', NULL, 'font-family: Verdana, Helvetica, sans-serif', 1),
(33, 'Work Sans', '<link href=\"https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600&display=swap&subset=latin-ext,vietnamese\" rel=\"stylesheet\"> ', 'font-family: \"Work Sans\", Helvetica, sans-serif', 0),
(34, 'Libre Baskerville', '<link href=\"https://fonts.googleapis.com/css?family=Libre+Baskerville:400,400i&display=swap&subset=latin-ext\" rel=\"stylesheet\"> ', 'font-family: \"Libre Baskerville\", Helvetica, sans-serif', 0),
(35, 'Signika', '<link href=\"https://fonts.googleapis.com/css2?family=Signika:wght@300;400;600;700&display=swap\" rel=\"stylesheet\">', 'font-family: \'Signika\', sans-serif;', 0),
(36, 'Tajawal', '<link href=\"https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700&display=swap\" rel=\"stylesheet\">', 'font-family: \'Tajawal\', sans-serif;', 0);

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `physical_products_system` tinyint(1) DEFAULT 1,
  `digital_products_system` tinyint(1) DEFAULT 1,
  `marketplace_system` tinyint(1) DEFAULT 1,
  `classified_ads_system` tinyint(1) DEFAULT 1,
  `bidding_system` tinyint(1) DEFAULT 1,
  `selling_license_keys_system` tinyint(1) DEFAULT 1,
  `multi_vendor_system` tinyint(1) DEFAULT 1,
  `membership_plans_system` tinyint(1) DEFAULT 0,
  `vat_status` tinyint(1) DEFAULT 1,
  `site_lang` tinyint(4) DEFAULT 1,
  `timezone` varchar(100) DEFAULT 'America/New_York',
  `application_name` varchar(255) DEFAULT NULL,
  `selected_navigation` tinyint(4) DEFAULT 1,
  `menu_limit` tinyint(4) DEFAULT 9,
  `recaptcha_site_key` varchar(500) DEFAULT NULL,
  `recaptcha_secret_key` varchar(500) DEFAULT NULL,
  `recaptcha_lang` varchar(30) DEFAULT NULL,
  `custom_css_codes` mediumtext DEFAULT NULL,
  `custom_javascript_codes` mediumtext DEFAULT NULL,
  `mail_library` varchar(50) DEFAULT 'swift',
  `mail_protocol` varchar(20) DEFAULT 'smtp',
  `mail_encryption` varchar(100) DEFAULT 'tls',
  `mail_host` varchar(255) DEFAULT NULL,
  `mail_port` varchar(20) DEFAULT NULL,
  `mail_username` varchar(255) DEFAULT NULL,
  `mail_password` varchar(255) DEFAULT NULL,
  `mail_title` varchar(255) DEFAULT NULL,
  `mail_reply_to` varchar(255) DEFAULT 'noreply@domain.com ',
  `email_verification` tinyint(1) DEFAULT 0,
  `facebook_app_id` varchar(500) DEFAULT NULL,
  `facebook_app_secret` varchar(500) DEFAULT NULL,
  `google_client_id` varchar(500) DEFAULT NULL,
  `google_client_secret` varchar(500) DEFAULT NULL,
  `vk_app_id` varchar(500) DEFAULT NULL,
  `vk_secure_key` varchar(500) DEFAULT NULL,
  `google_analytics` text DEFAULT NULL,
  `promoted_products` tinyint(1) DEFAULT 1,
  `multilingual_system` tinyint(1) DEFAULT 1,
  `product_comments` tinyint(1) DEFAULT 1,
  `comment_approval_system` tinyint(1) DEFAULT 0,
  `reviews` tinyint(1) DEFAULT 1,
  `blog_comments` tinyint(1) DEFAULT 1,
  `slider_status` tinyint(4) DEFAULT 1,
  `slider_type` varchar(30) DEFAULT 'full_width',
  `slider_effect` varchar(30) DEFAULT 'fade',
  `featured_categories` tinyint(1) DEFAULT 1,
  `index_promoted_products` tinyint(1) DEFAULT 1,
  `index_promoted_products_count` tinyint(1) DEFAULT 8,
  `index_latest_products` tinyint(1) DEFAULT 1,
  `index_latest_products_count` tinyint(1) DEFAULT 4,
  `index_blog_slider` tinyint(1) DEFAULT 1,
  `product_link_structure` varchar(20) DEFAULT 'slug-id',
  `mds_key` varchar(500) DEFAULT NULL,
  `purchase_code` varchar(500) DEFAULT NULL,
  `site_color` varchar(100) DEFAULT 'default',
  `logo` varchar(255) DEFAULT NULL,
  `logo_email` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `watermark_image_large` varchar(255) DEFAULT NULL,
  `watermark_image_mid` varchar(255) DEFAULT NULL,
  `watermark_image_small` varchar(255) DEFAULT NULL,
  `watermark_vrt_alignment` varchar(20) DEFAULT 'middle',
  `watermark_hor_alignment` varchar(20) DEFAULT 'center',
  `watermark_product_images` tinyint(1) DEFAULT 0,
  `watermark_blog_images` tinyint(1) DEFAULT 0,
  `watermark_thumbnail_images` tinyint(1) DEFAULT 0,
  `facebook_comment` text DEFAULT NULL,
  `facebook_comment_status` tinyint(1) DEFAULT 0,
  `product_cache_system` tinyint(1) DEFAULT 0,
  `static_content_cache_system` tinyint(1) DEFAULT 0,
  `refresh_cache_database_changes` tinyint(1) DEFAULT 0,
  `cache_refresh_time` int(11) DEFAULT 1800,
  `rss_system` tinyint(1) DEFAULT 1,
  `approve_before_publishing` tinyint(1) DEFAULT 1,
  `commission_rate` tinyint(4) DEFAULT 0,
  `send_email_new_product` tinyint(1) DEFAULT 0,
  `send_email_buyer_purchase` tinyint(1) DEFAULT 0,
  `send_email_contact_messages` tinyint(1) DEFAULT 0,
  `send_email_order_shipped` tinyint(1) DEFAULT 0,
  `send_email_shop_opening_request` tinyint(1) DEFAULT 0,
  `send_email_bidding_system` tinyint(1) DEFAULT 0,
  `mail_options_account` varchar(100) DEFAULT NULL,
  `vendor_verification_system` tinyint(1) DEFAULT 1,
  `hide_vendor_contact_information` tinyint(1) DEFAULT 0,
  `guest_checkout` tinyint(1) DEFAULT 0,
  `maintenance_mode_title` varchar(500) DEFAULT NULL,
  `maintenance_mode_description` varchar(2000) DEFAULT NULL,
  `maintenance_mode_status` tinyint(1) DEFAULT 0,
  `product_image_limit` smallint(6) DEFAULT 20,
  `max_file_size_image` bigint(20) DEFAULT 10485760,
  `max_file_size_video` bigint(20) DEFAULT 31457280,
  `max_file_size_audio` bigint(20) DEFAULT 10485760,
  `google_adsense_code` varchar(2000) DEFAULT NULL,
  `sort_categories` varchar(30) DEFAULT 'category_order',
  `sort_parent_categories_by_order` tinyint(1) DEFAULT 1,
  `pwa_status` tinyint(1) DEFAULT 0,
  `location_search_header` tinyint(1) DEFAULT 1,
  `vendor_bulk_product_upload` tinyint(1) DEFAULT 1,
  `show_sold_products` tinyint(1) DEFAULT 1,
  `newsletter_status` tinyint(1) DEFAULT 1,
  `newsletter_popup` tinyint(1) DEFAULT 1,
  `request_documents_vendors` tinyint(1) DEFAULT 0,
  `explanation_documents_vendors` varchar(500) DEFAULT NULL,
  `last_cron_update` timestamp NULL DEFAULT NULL,
  `last_cron_update_long` timestamp NULL DEFAULT NULL,
  `version` varchar(30) DEFAULT '2.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `physical_products_system`, `digital_products_system`, `marketplace_system`, `classified_ads_system`, `bidding_system`, `selling_license_keys_system`, `multi_vendor_system`, `membership_plans_system`, `vat_status`, `site_lang`, `timezone`, `application_name`, `selected_navigation`, `menu_limit`, `recaptcha_site_key`, `recaptcha_secret_key`, `recaptcha_lang`, `custom_css_codes`, `custom_javascript_codes`, `mail_library`, `mail_protocol`, `mail_encryption`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_title`, `mail_reply_to`, `email_verification`, `facebook_app_id`, `facebook_app_secret`, `google_client_id`, `google_client_secret`, `vk_app_id`, `vk_secure_key`, `google_analytics`, `promoted_products`, `multilingual_system`, `product_comments`, `comment_approval_system`, `reviews`, `blog_comments`, `slider_status`, `slider_type`, `slider_effect`, `featured_categories`, `index_promoted_products`, `index_promoted_products_count`, `index_latest_products`, `index_latest_products_count`, `index_blog_slider`, `product_link_structure`, `mds_key`, `purchase_code`, `site_color`, `logo`, `logo_email`, `favicon`, `watermark_image_large`, `watermark_image_mid`, `watermark_image_small`, `watermark_vrt_alignment`, `watermark_hor_alignment`, `watermark_product_images`, `watermark_blog_images`, `watermark_thumbnail_images`, `facebook_comment`, `facebook_comment_status`, `product_cache_system`, `static_content_cache_system`, `refresh_cache_database_changes`, `cache_refresh_time`, `rss_system`, `approve_before_publishing`, `commission_rate`, `send_email_new_product`, `send_email_buyer_purchase`, `send_email_contact_messages`, `send_email_order_shipped`, `send_email_shop_opening_request`, `send_email_bidding_system`, `mail_options_account`, `vendor_verification_system`, `hide_vendor_contact_information`, `guest_checkout`, `maintenance_mode_title`, `maintenance_mode_description`, `maintenance_mode_status`, `product_image_limit`, `max_file_size_image`, `max_file_size_video`, `max_file_size_audio`, `google_adsense_code`, `sort_categories`, `sort_parent_categories_by_order`, `pwa_status`, `location_search_header`, `vendor_bulk_product_upload`, `show_sold_products`, `newsletter_status`, `newsletter_popup`, `request_documents_vendors`, `explanation_documents_vendors`, `last_cron_update`, `last_cron_update_long`, `version`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 'America/New_York', 'Modesy', 1, 7, NULL, NULL, 'en', NULL, NULL, 'swift', 'smtp', 'tls', NULL, '587', NULL, NULL, 'Modesy', 'noreply@domain.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 'full_width', 'fade', 1, 1, 10, 1, 10, 1, 'slug-id', NULL, NULL, '#222222', NULL, NULL, NULL, NULL, NULL, NULL, 'middle', 'center', 0, 0, 0, NULL, 0, 0, 0, 0, 1800, 1, 1, 10, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 1, 'Coming Soon', 'Our website is under construction. We\'ll be here soon with our new awesome site.', 0, 20, 5242880, 31457280, 31457280, '', 'category_order', 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL, NULL, '2.0');

-- --------------------------------------------------------

--
-- Table structure for table `homepage_banners`
--

CREATE TABLE `homepage_banners` (
  `id` int(11) NOT NULL,
  `banner_url` varchar(1000) DEFAULT NULL,
  `banner_image_path` varchar(255) DEFAULT NULL,
  `banner_order` int(11) NOT NULL DEFAULT 1,
  `banner_width` double DEFAULT NULL,
  `banner_location` varchar(100) DEFAULT 'featured_products'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_default` varchar(255) DEFAULT NULL,
  `image_big` varchar(255) DEFAULT NULL,
  `image_small` varchar(255) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT 0,
  `storage` varchar(20) DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `images_file_manager`
--

CREATE TABLE `images_file_manager` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `images_variation`
--

CREATE TABLE `images_variation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variation_option_id` int(11) DEFAULT 0,
  `image_default` varchar(255) DEFAULT NULL,
  `image_big` varchar(255) DEFAULT NULL,
  `image_small` varchar(255) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT 0,
  `storage` varchar(20) DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  `client_username` varchar(255) DEFAULT NULL,
  `client_first_name` varchar(100) DEFAULT NULL,
  `client_last_name` varchar(100) DEFAULT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `client_phone_number` varchar(100) DEFAULT NULL,
  `client_address` varchar(500) DEFAULT NULL,
  `client_country` varchar(100) DEFAULT NULL,
  `client_state` varchar(100) DEFAULT NULL,
  `client_city` varchar(100) DEFAULT NULL,
  `invoice_items` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base`
--

CREATE TABLE `knowledge_base` (
  `id` int(11) NOT NULL,
  `lang_id` tinyint(4) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  `content_order` smallint(6) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base_categories`
--

CREATE TABLE `knowledge_base_categories` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `category_order` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_form` varchar(20) NOT NULL,
  `language_code` varchar(20) NOT NULL,
  `text_direction` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `language_order` tinyint(4) NOT NULL DEFAULT 1,
  `text_editor_lang` varchar(10) DEFAULT 'en',
  `flag_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_form`, `language_code`, `text_direction`, `status`, `language_order`, `text_editor_lang`, `flag_path`) VALUES
(1, 'English', 'en', 'en-US', 'ltr', 1, 1, 'en', 'uploads/blocks/flag_eng.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `language_translations`
--

CREATE TABLE `language_translations` (
  `id` int(11) NOT NULL,
  `lang_id` smallint(6) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `translation` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language_translations`
--

INSERT INTO `language_translations` (`id`, `lang_id`, `label`, `translation`) VALUES
(1, 1, '1_business_day', 'Ready to ship in 1 Business Day'),
(2, 1, '2_3_business_days', 'Ready to ship in 2-3 Business Days'),
(3, 1, '4_7_business_days', 'Ready to ship in 4-7 Business Days'),
(4, 1, '8_15_business_days', 'Ready to ship in 8-15 Business Days'),
(5, 1, 'abuse_reports', 'Abuse Reports'),
(6, 1, 'abuse_report_exp', 'Briefly describe the issue you\'re facing'),
(7, 1, 'abuse_report_msg', 'Your report has reached us. Thank you!'),
(8, 1, 'accept_quote', 'Accept Quote'),
(9, 1, 'access_key', 'Access Key'),
(10, 1, 'activate_all', 'Activate All'),
(11, 1, 'active', 'Active'),
(12, 1, 'active_orders', 'Active Orders'),
(13, 1, 'active_payment_request_error', 'You already have an active payment request! Once this is complete, you can make a new request.'),
(14, 1, 'active_sales', 'Active Sales'),
(15, 1, 'added_to_cart', 'Added to Cart'),
(16, 1, 'additional_information', 'Additional Information'),
(17, 1, 'address', 'Address'),
(18, 1, 'address_title', 'Address Title'),
(19, 1, 'add_administrator', 'Add Administrator'),
(20, 1, 'add_a_comment', 'Add a comment'),
(21, 1, 'add_banner', 'Add Banner'),
(22, 1, 'add_category', 'Add Category'),
(23, 1, 'add_city', 'Add City'),
(24, 1, 'add_content', 'Add Content'),
(25, 1, 'add_country', 'Add Country'),
(26, 1, 'add_coupon', 'Add Coupon'),
(27, 1, 'add_currency', 'Add Currency'),
(28, 1, 'add_custom_field', 'Add Custom Field'),
(29, 1, 'add_delivery_time', 'Add Delivery Time'),
(30, 1, 'add_feature', 'Add Feature'),
(31, 1, 'add_font', 'Add Font'),
(32, 1, 'add_image', 'Add Image'),
(33, 1, 'add_language', 'Add Language'),
(34, 1, 'add_license_keys', 'Add License Keys'),
(35, 1, 'add_license_keys_exp', 'Add all license keys with comma(,) separator. (i.e. License Key, License Key...)'),
(36, 1, 'add_new_address', 'Add New Address'),
(37, 1, 'add_option', 'Add Option'),
(38, 1, 'add_page', 'Add Page'),
(39, 1, 'add_payout', 'Add Payout'),
(40, 1, 'add_post', 'Add Post'),
(41, 1, 'add_product', 'Add Product'),
(42, 1, 'add_product_for_sale', 'Add a Product for Sale'),
(43, 1, 'add_product_for_sale_exp', 'Add a product to sell on the site'),
(44, 1, 'add_product_get_price_requests', 'Add a Product to Receive Quote (Price) Requests'),
(45, 1, 'add_product_get_price_requests_exp', 'Add a product without adding a price to get price requests from customers'),
(46, 1, 'add_product_sell_license_keys', 'Add a Product to Sell License Keys'),
(47, 1, 'add_product_sell_license_keys_exp', 'Add a product to sell only license keys'),
(48, 1, 'add_product_services_listing', 'Add a Product or Service as an Ordinary Listing'),
(49, 1, 'add_product_services_listing_exp', 'Add a product or service without buy option'),
(50, 1, 'add_review', 'Add Review'),
(51, 1, 'add_role', 'Add Role'),
(52, 1, 'add_shipping_class', 'Add Shipping Class'),
(53, 1, 'add_shipping_method', 'Add Shipping Method'),
(54, 1, 'add_shipping_option', 'Add Shipping Option'),
(55, 1, 'add_shipping_zone', 'Add Shipping Zone'),
(56, 1, 'add_slider_item', 'Add Slider Item'),
(57, 1, 'add_space_between_money_currency', 'Add Space Between Money and Currency'),
(58, 1, 'add_state', 'Add State'),
(59, 1, 'add_to_cart', 'Add to Cart'),
(60, 1, 'add_to_featured', 'Add to Featured'),
(61, 1, 'add_to_product_filters', 'Add to Product Filters'),
(62, 1, 'add_to_special_offers', 'Add to Special Offers'),
(63, 1, 'add_to_wishlist', 'Add to wishlist'),
(64, 1, 'add_user', 'Add User'),
(65, 1, 'add_variation', 'Add Variation'),
(66, 1, 'add_video', 'Add Video'),
(67, 1, 'add_watermark_blog_images', 'Add Watermark to Blog Images'),
(68, 1, 'add_watermark_product_images', 'Add Watermark to Product Images'),
(69, 1, 'add_watermark_thumbnail_images', 'Add Watermark to Thumbnail (Small) Images'),
(70, 1, 'administrators', 'Administrators'),
(71, 1, 'admin_emails_will_send', 'Admin emails will be sent to this address'),
(72, 1, 'admin_panel', 'Admin Panel'),
(73, 1, 'admin_panel_link', 'Admin Panel Link'),
(74, 1, 'adsense_head_exp', 'The codes you add here will be added in the <head></head> tags.'),
(75, 1, 'ad_spaces', 'Ad Spaces'),
(76, 1, 'all', 'All'),
(77, 1, 'allowed_file_extensions', 'Allowed File Extensions'),
(78, 1, 'allow_all_currencies_classified_ads', 'Allow All Currencies for Ordinary Listing'),
(79, 1, 'allow_duplicate_license_keys', 'Allow Duplicate License Keys'),
(80, 1, 'all_active_currencies', 'All active currencies'),
(81, 1, 'all_categories', 'All Categories'),
(82, 1, 'all_countries', 'All Countries'),
(83, 1, 'all_help_topics', 'All Help Topics'),
(84, 1, 'all_permissions', 'All Permissions'),
(85, 1, 'all_states', 'All States'),
(86, 1, 'alphabetically', 'Alphabetically'),
(87, 1, 'already_have_active_request', 'You already have an active request for this product!'),
(88, 1, 'always', 'Always'),
(89, 1, 'animations', 'Animations'),
(90, 1, 'api_key', 'Api Key'),
(91, 1, 'appear_on_homepage', 'Appear on the Homepage'),
(92, 1, 'apply', 'Apply'),
(93, 1, 'approve', 'Approve'),
(94, 1, 'approved', 'Approved'),
(95, 1, 'approved_comments', 'Approved Comments'),
(96, 1, 'approve_before_publishing', 'Approve Products Before Publishing'),
(97, 1, 'approve_refund', 'Approve Refund'),
(98, 1, 'app_id', 'App ID'),
(99, 1, 'app_name', 'Application Name'),
(100, 1, 'app_secret', 'App Secret'),
(101, 1, 'april', 'April'),
(102, 1, 'ask_question', 'Ask Question'),
(103, 1, 'assign_membership_plan', 'Assign Membership Plan'),
(104, 1, 'attachments', 'Attachments'),
(105, 1, 'audio', 'Audio'),
(106, 1, 'audio_preview', 'Audio Preview'),
(107, 1, 'audio_preview_exp', 'MP3 or WAV preview audio'),
(108, 1, 'august', 'August'),
(109, 1, 'automatically_update_exchange_rates', 'Automatically Update Exchange Rates'),
(110, 1, 'awaiting_payment', 'Awaiting Payment'),
(111, 1, 'awaiting_sellers_bid', 'Awaiting Seller\'s Bid'),
(112, 1, 'aws_base_url', 'AWS Base URL'),
(113, 1, 'aws_key', 'AWS Access Key'),
(114, 1, 'aws_secret', 'AWS Secret Key'),
(115, 1, 'aws_storage', 'AWS S3 Storage'),
(116, 1, 'back', 'Back'),
(117, 1, 'backward', 'Backward'),
(118, 1, 'balance', 'Balance'),
(119, 1, 'balance_exp', 'Approved earnings'),
(120, 1, 'bank_accounts', 'Bank Accounts'),
(121, 1, 'bank_accounts_exp', 'You can make your payment to one of these bank accounts.'),
(122, 1, 'bank_account_holder_name', 'Bank Account Holder\'s Name'),
(123, 1, 'bank_branch_city', 'Bank Branch City'),
(124, 1, 'bank_branch_country', 'Bank Branch Country'),
(125, 1, 'bank_name', 'Bank Name'),
(126, 1, 'bank_transfer', 'Bank Transfer'),
(127, 1, 'bank_transfer_accepted', 'Bank transfer accepted'),
(128, 1, 'bank_transfer_declined', 'Bank transfer declined'),
(129, 1, 'bank_transfer_exp', 'Make your payment directly into our bank account.'),
(130, 1, 'bank_transfer_notifications', 'Bank Transfers Notifications'),
(131, 1, 'banned', 'Banned'),
(132, 1, 'banner', 'Banner'),
(133, 1, 'banner_location_exp', 'The banner will be added under the selected section'),
(134, 1, 'banner_width', 'Banner Width'),
(135, 1, 'ban_user', 'Ban User'),
(136, 1, 'base_currency', 'Base Currency'),
(137, 1, 'bidding_system', 'Bidding System'),
(138, 1, 'bidding_system_emails', 'Bidding system emails'),
(139, 1, 'bidding_system_request_quote', 'Bidding System (Request Quote)'),
(140, 1, 'billing_address', 'Billing Address'),
(141, 1, 'bitcoin', 'Bitcoin (BTC)'),
(142, 1, 'blog', 'Blog'),
(143, 1, 'blog_ad_space_1', 'Blog Ad Space 1'),
(144, 1, 'blog_ad_space_2', 'Blog Ad Space 2'),
(145, 1, 'blog_comments', 'Blog Comments'),
(146, 1, 'blog_posts', 'Blog Posts'),
(147, 1, 'blog_post_details_ad_space', 'Blog Post Details Ad Space'),
(148, 1, 'blog_post_details_sidebar_ad_space', 'Blog Post Details Sidebar Ad Space'),
(149, 1, 'blog_slider', 'Blog Slider'),
(150, 1, 'bottom', 'Bottom'),
(151, 1, 'boxed', 'Boxed'),
(152, 1, 'browse_files', 'Browse Files'),
(153, 1, 'btc_address', 'BTC Address'),
(154, 1, 'bucket_name', 'Bucket Name'),
(155, 1, 'bulk_category_upload', 'Bulk Category Upload'),
(156, 1, 'bulk_category_upload_exp', 'You can add your categories with a CSV file from this section\r\n'),
(157, 1, 'bulk_product_upload', 'Bulk Product Upload'),
(158, 1, 'bulk_product_upload_exp', 'You can add your products with a CSV file from this section'),
(159, 1, 'button', 'Button'),
(160, 1, 'button_color', 'Button Color'),
(161, 1, 'button_text', 'Button Text'),
(162, 1, 'button_text_color', 'Button Text Color'),
(163, 1, 'buyer', 'Buyer'),
(164, 1, 'buy_button_link', 'Buy button link'),
(165, 1, 'buy_now', 'Buy Now'),
(166, 1, 'by', 'By'),
(167, 1, 'by_category_order', 'by Category Order'),
(168, 1, 'by_date', 'by Date'),
(169, 1, 'cache_refresh_time', 'Cache Refresh Time (Minute)'),
(170, 1, 'cache_refresh_time_exp', 'After this time, your cache files will be refreshed.'),
(171, 1, 'cache_system', 'Cache System'),
(172, 1, 'calculated_price', 'Calculated Price'),
(173, 1, 'cancel', 'Cancel'),
(174, 1, 'cancelled', 'Cancelled'),
(175, 1, 'cancelled_sales', 'Cancelled Sales'),
(176, 1, 'cancel_order', 'Cancel Order'),
(177, 1, 'card_number', 'Card Number'),
(178, 1, 'cart', 'Cart'),
(179, 1, 'cash_on_delivery', 'Cash on Delivery'),
(180, 1, 'cash_on_delivery_exp', 'Pay with cash upon delivery.'),
(181, 1, 'cash_on_delivery_warning', 'You have selected \'Cash on Delivery\' as your payment method. You must pay the total amount when you receive your package. If you accept this payment method, please click the button below to complete your order.'),
(182, 1, 'categories', 'Categories'),
(183, 1, 'categories_all', 'All Categories'),
(184, 1, 'category', 'Category'),
(185, 1, 'category_id_finder', 'Category Id Finder'),
(186, 1, 'category_id_finder_exp', 'You can use this section to find out the Id of a category'),
(187, 1, 'category_level', 'Category Level'),
(188, 1, 'category_name', 'Category Name'),
(189, 1, 'cell_phone', 'Cell Phone'),
(190, 1, 'center', 'Center'),
(191, 1, 'change_password', 'Change Password'),
(192, 1, 'change_user_role', 'Change User Role'),
(193, 1, 'charge_shipping_for_each_different_product', 'Charge shipping for each different product in the cart'),
(194, 1, 'charge_shipping_for_each_product', 'Charge shipping for each product in the cart'),
(195, 1, 'checkbox', 'Checkbox (Multiple Selection)'),
(196, 1, 'checking_out_as_guest', 'You are checking out as a guest'),
(197, 1, 'checkout', 'Checkout'),
(198, 1, 'choose_plan', 'Choose Plan'),
(199, 1, 'cities', 'Cities'),
(200, 1, 'city', 'City'),
(201, 1, 'classified_ads', 'Classified Ads'),
(202, 1, 'classified_ads_adding_product_as_listing', 'Classified Ads (Adding a Product or Service as an Ordinary Listing)'),
(203, 1, 'clear', 'Clear'),
(204, 1, 'client_id', 'Client ID'),
(205, 1, 'client_information', 'Client Information'),
(206, 1, 'client_secret', 'Client Secret'),
(207, 1, 'close', 'Close'),
(208, 1, 'closed', 'Closed'),
(209, 1, 'close_seller_shop', 'Close Seller\'s Shop'),
(210, 1, 'close_ticket', 'Close Ticket'),
(211, 1, 'close_user_shop', 'Close User Shop'),
(212, 1, 'cod_cancel_exp', 'You can cancel your order within 24 hours after the order date.'),
(213, 1, 'color', 'Color'),
(214, 1, 'comment', 'Comment'),
(215, 1, 'comments', 'Comments'),
(216, 1, 'comment_approval_system', 'Comment Approval System'),
(217, 1, 'commission_rate', 'Commission Rate'),
(218, 1, 'completed', 'Completed'),
(219, 1, 'completed_orders', 'Completed Orders'),
(220, 1, 'completed_payouts', 'Completed Payouts'),
(221, 1, 'completed_sales', 'Completed Sales'),
(222, 1, 'confirmed', 'Confirmed'),
(223, 1, 'confirm_action', 'Are you sure you want to perform this action?'),
(224, 1, 'confirm_approve_order', 'Are you sure you want to confirm this order?'),
(225, 1, 'confirm_category', 'Are you sure you want to delete this category?'),
(226, 1, 'confirm_close_user_shop', 'Are you sure you want to close this shop?'),
(227, 1, 'confirm_comment', 'Are you sure you want to delete this comment?'),
(228, 1, 'confirm_comments', 'Are you sure you want to delete selected comments?'),
(229, 1, 'confirm_custom_field', 'Are you sure you want to delete this custom field?'),
(230, 1, 'confirm_delete', 'Are you sure you want to delete this item?'),
(231, 1, 'confirm_language', 'Are you sure you want to delete this language?'),
(232, 1, 'confirm_message', 'Are you sure you want to delete this conversation?'),
(233, 1, 'confirm_messages', 'Are you sure you want to delete selected conversations?'),
(234, 1, 'confirm_option', 'Are you sure you want to delete this option?'),
(235, 1, 'confirm_order_received', 'Confirm Order Received'),
(236, 1, 'confirm_order_received_exp', 'Confirm if you have received your order.'),
(237, 1, 'confirm_order_received_warning', 'When you receive your order, please check the products you have purchased. If there is not any problem, click \'Confirm Order Received\' button. After confirming your order, the money will be transferred to the seller.'),
(238, 1, 'confirm_page', 'Are you sure you want to delete this page?'),
(239, 1, 'confirm_payment', 'Confirm Payment'),
(240, 1, 'confirm_post', 'Are you sure you want to delete this post?'),
(241, 1, 'confirm_product', 'Are you sure you want to delete this product?'),
(242, 1, 'confirm_products', 'Are you sure you want to delete selected products?'),
(243, 1, 'confirm_product_audio', 'Are you sure you want to delete this audio?'),
(244, 1, 'confirm_product_permanent', 'Are you sure you want to permanently delete this product?'),
(245, 1, 'confirm_product_video', 'Are you sure you want to delete this video?'),
(246, 1, 'confirm_quote_request', 'Are you sure you want to delete this quote request?'),
(247, 1, 'confirm_review', 'Are you sure you want to delete this review?'),
(248, 1, 'confirm_reviews', 'Are you sure you want to delete selected reviews?'),
(249, 1, 'confirm_slider_item', 'Are you sure you want to delete this slider item?'),
(250, 1, 'confirm_user', 'Are you sure you want to delete this user?'),
(251, 1, 'confirm_user_email', 'Confirm Email'),
(252, 1, 'confirm_variation', 'Are you sure you want to delete this variation?'),
(253, 1, 'confirm_your_account', 'Confirm Your Account'),
(254, 1, 'connect_with_facebook', 'Connect with Facebook'),
(255, 1, 'connect_with_google', 'Connect with Google'),
(256, 1, 'connect_with_vk', 'Connect with VKontakte'),
(257, 1, 'contact', 'Contact'),
(258, 1, 'contact_message', 'Contact Message'),
(259, 1, 'contact_messages', 'Contact Messages'),
(260, 1, 'contact_seller', 'Contact Seller'),
(261, 1, 'contact_settings', 'Contact Settings'),
(262, 1, 'contact_support', 'Contact Support'),
(263, 1, 'contact_support_exp', 'If you didn\'t find what you were looking for, you can submit a support request here.'),
(264, 1, 'contact_text', 'Contact Text'),
(265, 1, 'content', 'Content'),
(266, 1, 'contents', 'Contents'),
(267, 1, 'content_type', 'Content Type'),
(268, 1, 'continent', 'Continent'),
(269, 1, 'continue_to_checkout', 'Continue to Checkout'),
(270, 1, 'continue_to_payment', 'Continue to Payment'),
(271, 1, 'continue_to_payment_method', 'Continue to Payment Method'),
(272, 1, 'cookies_warning', 'Cookies Warning'),
(273, 1, 'copyright', 'Copyright'),
(274, 1, 'cost', 'Cost'),
(275, 1, 'cost_calculation_type', 'Cost Calculation Type'),
(276, 1, 'countries', 'Countries'),
(277, 1, 'country', 'Country'),
(278, 1, 'coupon', 'Coupon'),
(279, 1, 'coupons', 'Coupons'),
(280, 1, 'coupon_code', 'Coupon Code'),
(281, 1, 'coupon_minimum_cart_total_exp', 'Minimum cart total needed to use the coupon'),
(282, 1, 'coupon_usage_type', 'Coupon Usage Type'),
(283, 1, 'coupon_usage_type_1', 'Each user can use it for only one order'),
(284, 1, 'coupon_usage_type_2', 'Each user can use it for multiple orders (Guests can use)'),
(285, 1, 'cover_image', 'Cover Image'),
(286, 1, 'cpf', 'CPF'),
(287, 1, 'created_variations', 'Created Variations'),
(288, 1, 'create_new_plan', 'Create a New Plan'),
(289, 1, 'credit_card', 'Credit Card'),
(290, 1, 'csv_file', 'CSV File'),
(291, 1, 'currencies', 'Currencies'),
(292, 1, 'currency', 'Currency'),
(293, 1, 'currency_code', 'Currency Code'),
(294, 1, 'currency_converter', 'Currency Converter'),
(295, 1, 'currency_converter_api', 'Currency Converter API'),
(296, 1, 'currency_format', 'Currency Format'),
(297, 1, 'currency_name', 'Currency Name'),
(298, 1, 'currency_settings', 'Currency Settings'),
(299, 1, 'currency_symbol', 'Currency Symbol'),
(300, 1, 'currency_symbol_format', 'Currency Symbol Format'),
(301, 1, 'current_plan', 'Current Plan'),
(302, 1, 'custom', 'Custom'),
(303, 1, 'custom_css_codes', 'Custom CSS Codes'),
(304, 1, 'custom_css_codes_exp', 'These codes will be added to the header of the site.'),
(305, 1, 'custom_field', 'Custom Field'),
(306, 1, 'custom_fields', 'Custom Fields'),
(307, 1, 'custom_field_options', 'Custom Field Options'),
(308, 1, 'custom_javascript_codes', 'Custom JavaScript Codes'),
(309, 1, 'custom_javascript_codes_exp', 'These codes will be added to the footer of the site.'),
(310, 1, 'cvv', 'CVV'),
(311, 1, 'cvv_exp', 'Three-digits code on the back of your card'),
(312, 1, 'daily', 'Daily'),
(313, 1, 'daily_plan', 'Daily Plan'),
(314, 1, 'dashboard', 'Dashboard'),
(315, 1, 'dashboard_font', 'Dashboard Font'),
(316, 1, 'data_type', 'Data Type'),
(317, 1, 'date', 'Date'),
(318, 1, 'date_of_birth', 'Date of Birth'),
(319, 1, 'day', 'Day'),
(320, 1, 'days', 'Days'),
(321, 1, 'days_ago', 'days ago'),
(322, 1, 'days_left', 'days left'),
(323, 1, 'day_ago', 'day ago'),
(324, 1, 'day_count', 'Number of Days'),
(325, 1, 'december', 'December'),
(326, 1, 'decline', 'Decline'),
(327, 1, 'declined', 'Declined'),
(328, 1, 'default', 'Default'),
(329, 1, 'default_currency', 'Default Currency'),
(330, 1, 'default_language', 'Default Language'),
(331, 1, 'default_option', 'Default Option'),
(332, 1, 'default_option_exp', 'This option will be selected by default. It will use the default images and price'),
(333, 1, 'delete', 'Delete'),
(334, 1, 'deleted', 'Deleted'),
(335, 1, 'deleted_products', 'Deleted Products'),
(336, 1, 'delete_conversation', 'Delete Conversation'),
(337, 1, 'delete_permanently', 'Delete Permanently'),
(338, 1, 'delete_quote', 'Delete Quote'),
(339, 1, 'delivery_time', 'Delivery Time'),
(340, 1, 'demo_url', 'Demo URL'),
(341, 1, 'demo_url_exp', 'Add a preview URL (i.e. https://demo.com)'),
(342, 1, 'description', 'Description'),
(343, 1, 'details', 'Details'),
(344, 1, 'digital', 'Digital'),
(345, 1, 'digital_exp', 'A digital file that buyers will download'),
(346, 1, 'digital_files', 'Digital Files'),
(347, 1, 'digital_file_required', 'Digital file is required!'),
(348, 1, 'digital_products', 'Digital Products'),
(349, 1, 'digital_sales', 'Digital Sales'),
(350, 1, 'disable', 'Disable'),
(351, 1, 'discount', 'Discount'),
(352, 1, 'discount_coupon', 'Discount Coupon'),
(353, 1, 'discount_rate', 'Discount Rate'),
(354, 1, 'documentation', 'Documentation'),
(355, 1, 'dont_have_account', 'Don\'t have an account?'),
(356, 1, 'dont_want_receive_emails', 'Don\'t want receive these emails?'),
(357, 1, 'download', 'Download'),
(358, 1, 'downloads', 'Downloads'),
(359, 1, 'download_csv_example', 'Download CSV Example'),
(360, 1, 'download_csv_template', 'Download CSV Template'),
(361, 1, 'download_license_key', 'Download License Key'),
(362, 1, 'download_sitemap', 'Download Sitemap'),
(363, 1, 'do_not_have_membership_plan', 'You do not have a membership plan. Click the button below to buy a membership plan.'),
(364, 1, 'draft', 'Draft'),
(365, 1, 'drafts', 'Drafts'),
(366, 1, 'draft_added', 'Draft added successfully!'),
(367, 1, 'drag_drop_file_here', 'Drag and drop file here or'),
(368, 1, 'drag_drop_images_here', 'Drag and drop images here or'),
(369, 1, 'dropdown', 'Dropdown (Single Selection)'),
(370, 1, 'duration', 'Duration'),
(371, 1, 'earned_amount', 'Earned Amount'),
(372, 1, 'earnings', 'Earnings'),
(373, 1, 'edit', 'Edit'),
(374, 1, 'edit_address', 'Edit Address'),
(375, 1, 'edit_banner', 'Edit Banner'),
(376, 1, 'edit_content', 'Edit Content'),
(377, 1, 'edit_coupon', 'Edit Coupon'),
(378, 1, 'edit_delivery_time', 'Edit Delivery Time'),
(379, 1, 'edit_details', 'Edit Details'),
(380, 1, 'edit_option', 'Edit Option'),
(381, 1, 'edit_options', 'Edit Options'),
(382, 1, 'edit_order', 'Edit Order'),
(383, 1, 'edit_plan', 'Edit Plan'),
(384, 1, 'edit_product', 'Edit Product'),
(385, 1, 'edit_role', 'Edit Role'),
(386, 1, 'edit_shipping_class', 'Edit Shipping Class'),
(387, 1, 'edit_shipping_zone', 'Edit Shipping Zone'),
(388, 1, 'edit_translations', 'Edit Translations'),
(389, 1, 'edit_user', 'Edit User'),
(390, 1, 'edit_variation', 'Edit Variation'),
(391, 1, 'effect', 'Effect'),
(392, 1, 'email', 'Email'),
(393, 1, 'email_address', 'Email Address'),
(394, 1, 'email_options', 'Email Options'),
(395, 1, 'email_option_contact_messages', 'Send contact messages to email address'),
(396, 1, 'email_option_product_added', 'Send email when a new product is added'),
(397, 1, 'email_option_send_email_new_message', 'Send me an email when someone send me a message'),
(398, 1, 'email_option_send_email_order_shipped', 'Send email to buyer when order shipped'),
(399, 1, 'email_option_send_order_to_buyer', 'Send email to buyer after purchase (Send order summary)'),
(400, 1, 'email_reset_password', 'Please click on the button below to reset your password.'),
(401, 1, 'email_settings', 'Email Settings'),
(402, 1, 'email_status', 'Email Status'),
(403, 1, 'email_template', 'Email Template'),
(404, 1, 'email_text_new_order', 'Your order has been received and is now processed. Your order details are shown below.'),
(405, 1, 'email_text_new_product', 'A new product has been added'),
(406, 1, 'email_text_see_product', 'Click the button below to see the product.'),
(407, 1, 'email_text_thank_for_order', 'Thank you for your order!'),
(408, 1, 'email_verification', 'Email Verification'),
(409, 1, 'enable', 'Enable'),
(410, 1, 'encryption', 'Encryption'),
(411, 1, 'end', 'End'),
(412, 1, 'enter_email', 'Enter your email'),
(413, 1, 'enter_location', 'Enter Location'),
(414, 1, 'example', 'Example'),
(415, 1, 'exchange_rate', 'Exchange Rate'),
(416, 1, 'expiration_date', 'Expiration Date (MM / YY)'),
(417, 1, 'expired', 'Expired'),
(418, 1, 'expired_products', 'Expired Products'),
(419, 1, 'expiry_date', 'Expiry Date'),
(420, 1, 'explanation', 'Explanation'),
(421, 1, 'export', 'Export'),
(422, 1, 'exp_special_characters', 'Do not use special characters'),
(423, 1, 'external_link', 'External Link'),
(424, 1, 'external_link_exp', 'You can add an external product link. (i.e. https://domain.com/product)'),
(425, 1, 'facebook_comments', 'Facebook Comments'),
(426, 1, 'facebook_comments_code', 'Facebook Comments Plugin Code'),
(427, 1, 'facebook_login', 'Facebook Login'),
(428, 1, 'facebook_url', 'Facebook URL'),
(429, 1, 'favicon', 'Favicon'),
(430, 1, 'feature', 'Feature'),
(431, 1, 'featured', 'Featured'),
(432, 1, 'featured_badge', 'Featured Badge'),
(433, 1, 'featured_categories', 'Featured Categories'),
(434, 1, 'featured_categories_exp', 'Select the categories you want to show under the slider'),
(435, 1, 'featured_products', 'Featured Products'),
(436, 1, 'featured_products_exp', 'Last added featured products'),
(437, 1, 'featured_products_payment_currency', 'Featured Products Payment Currency'),
(438, 1, 'featured_products_system', 'Featured Products System'),
(439, 1, 'featured_products_transactions', 'Featured Products Transactions'),
(440, 1, 'features', 'Features'),
(441, 1, 'february', 'February'),
(442, 1, 'field', 'Field'),
(443, 1, 'field_name', 'Field Name'),
(444, 1, 'files_included', 'Files Included'),
(445, 1, 'files_included_ext', 'Enter the extensions of the files that you are going to sell (i.e. JPG, MP4, MP3)'),
(446, 1, 'file_too_large', 'File is too large. Max file size:'),
(447, 1, 'file_upload', 'File Upload'),
(448, 1, 'filter', 'Filter'),
(449, 1, 'filter_key', 'Filter Key'),
(450, 1, 'filter_key_exp', 'Don\'t add special characters'),
(451, 1, 'filter_products', 'Filter Products'),
(452, 1, 'first_name', 'First Name'),
(453, 1, 'fixed_shipping_cost_for_cart_total', 'Fixed Shipping Cost for Cart Total'),
(454, 1, 'flag', 'Flag'),
(455, 1, 'flat_rate', 'Flat Rate'),
(456, 1, 'folder_name', 'Folder Name'),
(457, 1, 'follow', 'Follow'),
(458, 1, 'followers', 'Followers'),
(459, 1, 'following', 'Following'),
(460, 1, 'follow_us', 'Follow Us'),
(461, 1, 'fonts', 'Fonts'),
(462, 1, 'font_family', 'Font Family'),
(463, 1, 'font_settings', 'Font Settings'),
(464, 1, 'footer', 'Footer'),
(465, 1, 'footer_about_section', 'Footer About Section'),
(466, 1, 'footer_information', 'Information'),
(467, 1, 'footer_quick_links', 'Quick Links'),
(468, 1, 'forgot_password', 'Forgot Password?'),
(469, 1, 'form_validation_is_unique', 'The {field} field must contain a unique value.'),
(470, 1, 'form_validation_matches', 'The {field} field does not match the {param} field.'),
(471, 1, 'form_validation_max_length', 'The {field} field cannot exceed {param} characters in length.'),
(472, 1, 'form_validation_min_length', 'The {field} field must be at least {param} characters in length.'),
(473, 1, 'form_validation_required', 'The {field} field is required.'),
(474, 1, 'forward', 'Forward'),
(475, 1, 'free', 'Free'),
(476, 1, 'free_product', 'Free Product'),
(477, 1, 'free_promotion', 'Free Promotion'),
(478, 1, 'free_shipping', 'Free Shipping'),
(479, 1, 'frequency', 'Frequency'),
(480, 1, 'frequency_exp', 'This value indicates how frequently the content at a particular URL is likely to change '),
(481, 1, 'friday', 'Friday'),
(482, 1, 'from', 'From:'),
(483, 1, 'full_name', 'Full Name'),
(484, 1, 'full_width', 'Full Width'),
(485, 1, 'general', 'General'),
(486, 1, 'general_information', 'General Information'),
(487, 1, 'general_settings', 'General Settings'),
(488, 1, 'generate', 'Generate'),
(489, 1, 'google_adsense_code', 'Google Adsense Code'),
(490, 1, 'google_analytics', 'Google Analytics Code'),
(491, 1, 'google_login', 'Google Login'),
(492, 1, 'google_recaptcha', 'Google reCAPTCHA'),
(493, 1, 'google_url', 'Google+ URL'),
(494, 1, 'goto_home', 'Go to the Homepage'),
(495, 1, 'go_back_to_products', 'Go Back to the Products Page'),
(496, 1, 'go_back_to_shop_settings', 'Go Back to the Shop Settings'),
(497, 1, 'go_to_your_product', 'Go to Your Product'),
(498, 1, 'guest', 'Guest'),
(499, 1, 'guest_checkout', 'Guest Checkout'),
(500, 1, 'half_width', 'Half Width'),
(501, 1, 'have_account', 'Have an account?'),
(502, 1, 'header', 'Header'),
(503, 1, 'help_center', 'Help Center'),
(504, 1, 'help_documents', 'Help Documents'),
(505, 1, 'help_documents_exp', 'You can use these documents to generate your CSV file\r\n'),
(506, 1, 'hi', 'Hi'),
(507, 1, 'hidden', 'Hidden'),
(508, 1, 'hidden_products', 'Hidden Products'),
(509, 1, 'hide', 'Hide'),
(510, 1, 'hide_vendor_contact_information', 'Hide Vendor Contact Information on the Site'),
(511, 1, 'highest_price', 'Highest Price'),
(512, 1, 'home', 'Home'),
(513, 1, 'homepage', 'Homepage'),
(514, 1, 'homepage_banners', 'Homepage Banners'),
(515, 1, 'homepage_banners_exp', 'You can manage the product banners on the homepage from this section'),
(516, 1, 'homepage_manager', 'Homepage Manager'),
(517, 1, 'homepage_title', 'Homepage Title'),
(518, 1, 'horizontal_alignment', 'Horizontal Alignment'),
(519, 1, 'hourly', 'Hourly'),
(520, 1, 'hours_ago', 'hours ago'),
(521, 1, 'hour_ago', 'hour ago'),
(522, 1, 'how_can_we_help', 'How can we help?'),
(523, 1, 'iban', 'IBAN'),
(524, 1, 'iban_long', 'International Bank Account Number'),
(525, 1, 'id', 'Id'),
(526, 1, 'identity_number', 'Identity Number'),
(527, 1, 'image', 'Image'),
(528, 1, 'images', 'Images'),
(529, 1, 'import_language', 'Import Language'),
(530, 1, 'inactivate_all', 'Inactivate All'),
(531, 1, 'inactive', 'Inactive'),
(532, 1, 'index_ad_space_1', 'Index Ad Space 1'),
(533, 1, 'index_ad_space_2', 'Index Ad Space 2'),
(534, 1, 'index_slider', 'Index Slider'),
(535, 1, 'input_explanation', 'Input Explanation'),
(536, 1, 'instagram_url', 'Instagram URL'),
(537, 1, 'instant_download', 'Instant download'),
(538, 1, 'invalid_attempt', 'Invalid Attempt!'),
(539, 1, 'invalid_file_type', 'Invalid file type!'),
(540, 1, 'invalid_withdrawal_amount', 'Invalid withdrawal amount!'),
(541, 1, 'invoice', 'Invoice'),
(542, 1, 'invoices', 'Invoices'),
(543, 1, 'invoice_currency_warning', 'All amounts shown on this invoice are in'),
(544, 1, 'in_stock', 'In Stock'),
(545, 1, 'ip_address', 'Ip Address'),
(546, 1, 'item', 'Item'),
(547, 1, 'iyzico', 'Iyzico'),
(548, 1, 'iyzico_warning', 'This is the \"Checkout Form\" integration, not the \"Marketplace\" integration.'),
(549, 1, 'january', 'January'),
(550, 1, 'join_newsletter', 'Join Our Newsletter'),
(551, 1, 'json_language_file', 'JSON Language File'),
(552, 1, 'july', 'July'),
(553, 1, 'june', 'June'),
(554, 1, 'just_now', 'Just Now'),
(555, 1, 'keep_shopping', 'Keep Shopping'),
(556, 1, 'keywords', 'Keywords'),
(557, 1, 'knowledge_base', 'Knowledge Base'),
(558, 1, 'label', 'Label'),
(559, 1, 'language', 'Language'),
(560, 1, 'languages', 'Languages'),
(561, 1, 'language_code', 'Language Code'),
(562, 1, 'language_name', 'Language Name'),
(563, 1, 'language_settings', 'Language Settings'),
(564, 1, 'last_modification', 'Last Modification'),
(565, 1, 'last_modification_exp', 'The time the URL was last modified'),
(566, 1, 'last_name', 'Last Name'),
(567, 1, 'last_seen', 'Last seen: '),
(568, 1, 'last_update', 'Last Update'),
(569, 1, 'latest_blog_posts', 'Latest Blog Posts'),
(570, 1, 'latest_blog_posts_exp', 'Last added blog posts'),
(571, 1, 'latest_comments', 'Latest Comments'),
(572, 1, 'latest_members', 'Latest Members'),
(573, 1, 'latest_orders', 'Latest Orders'),
(574, 1, 'latest_pending_products', 'Latest Pending Products'),
(575, 1, 'latest_posts', 'Latest Posts'),
(576, 1, 'latest_products', 'Latest Products'),
(577, 1, 'latest_products_exp', 'Last added products'),
(578, 1, 'latest_reviews', 'Latest Reviews'),
(579, 1, 'latest_sales', 'Latest Sales'),
(580, 1, 'latest_transactions', 'Latest Transactions'),
(581, 1, 'left', 'Left'),
(582, 1, 'left_to_right', 'Left to Right (LTR)'),
(583, 1, 'license_certificate', 'License Certificate'),
(584, 1, 'license_key', 'License Key'),
(585, 1, 'license_keys', 'License Keys'),
(586, 1, 'license_keys_system_exp', 'Add all your license keys from here. The system will automatically give a license key to each buyer.'),
(587, 1, 'link', 'Link'),
(588, 1, 'linkedin_url', 'Linkedin URL'),
(589, 1, 'listing_type', 'Listing Type'),
(590, 1, 'live_preview', 'Live Preview'),
(591, 1, 'load_more', 'Load More'),
(592, 1, 'local_pickup', 'Local Pickup'),
(593, 1, 'local_storage', 'Local Storage'),
(594, 1, 'location', 'Location'),
(595, 1, 'location_explanation', '{field} allows you to shop from anywhere in the world.'),
(596, 1, 'login', 'Login'),
(597, 1, 'login_error', 'Wrong email or password!'),
(598, 1, 'login_with_email', 'Or login with email'),
(599, 1, 'logo', 'Logo'),
(600, 1, 'logout', 'Logout'),
(601, 1, 'logo_email', 'Logo Email'),
(602, 1, 'lowest_price', 'Lowest Price'),
(603, 1, 'mail', 'Mail'),
(604, 1, 'mail_host', 'Mail Host'),
(605, 1, 'mail_library', 'Mail Library'),
(606, 1, 'mail_password', 'Mail Password'),
(607, 1, 'mail_port', 'Mail Port'),
(608, 1, 'mail_protocol', 'Mail Protocol'),
(609, 1, 'mail_title', 'Mail Title'),
(610, 1, 'mail_username', 'Mail Username'),
(611, 1, 'main', 'main'),
(612, 1, 'maintenance_mode', 'Maintenance Mode'),
(613, 1, 'main_files', 'Main File(s)'),
(614, 1, 'main_menu', 'Main Menu'),
(615, 1, 'management_tools', 'Management Tools'),
(616, 1, 'march', 'March'),
(617, 1, 'marketplace', 'Marketplace'),
(618, 1, 'marketplace_selling_product_on_the_site', 'Marketplace (Selling Products on the Site)'),
(619, 1, 'max', 'Max'),
(620, 1, 'max_file_size', 'Max File Size'),
(621, 1, 'may', 'May'),
(622, 1, 'member', 'Member'),
(623, 1, 'members', 'Members'),
(624, 1, 'membership', 'Membership'),
(625, 1, 'membership_number_of_ads', 'Number of Active Ads'),
(626, 1, 'membership_payments', 'Membership Payments'),
(627, 1, 'membership_plan', 'Membership Plan'),
(628, 1, 'membership_plans', 'Membership Plans'),
(629, 1, 'membership_plan_payment', 'Membership Plan Payment'),
(630, 1, 'membership_transactions', 'Membership Transactions'),
(631, 1, 'member_since', 'Member since'),
(632, 1, 'menu_limit', 'Menu Limit'),
(633, 1, 'message', 'Message'),
(634, 1, 'messages', 'Messages'),
(635, 1, 'meta_tag', 'Meta Tag'),
(636, 1, 'method_name', 'Method Name'),
(637, 1, 'middle', 'Middle'),
(638, 1, 'min', 'Min'),
(639, 1, 'minimum_order_amount', 'Minimum order amount'),
(640, 1, 'minutes_ago', 'minutes ago'),
(641, 1, 'minute_ago', 'minute ago'),
(642, 1, 'min_poyout_amount', 'Minimum payout amount'),
(643, 1, 'min_poyout_amounts', 'Minimum Payout Amounts'),
(644, 1, 'mode', 'Mode'),
(645, 1, 'monday', 'Monday'),
(646, 1, 'month', 'Month'),
(647, 1, 'monthly', 'Monthly'),
(648, 1, 'monthly_plan', 'Monthly Plan'),
(649, 1, 'monthly_sales', 'Monthly sales'),
(650, 1, 'months_ago', 'months ago'),
(651, 1, 'month_ago', 'month ago'),
(652, 1, 'month_count', 'Number of Months'),
(653, 1, 'more', 'More'),
(654, 1, 'more_from', 'More from'),
(655, 1, 'most_recent', 'Most Recent'),
(656, 1, 'most_viewed_products', 'Most Viewed Products'),
(657, 1, 'msg_accept_bank_transfer', 'Are you sure you want to set this order as payment received?'),
(658, 1, 'msg_accept_terms', 'You have to accept the terms!'),
(659, 1, 'msg_added', 'Item successfully added!'),
(660, 1, 'msg_add_license_keys', 'License keys successfully added!'),
(661, 1, 'msg_add_product_success', 'Your payment has been successfully completed! Once your product is approved, it will be published on our site!'),
(662, 1, 'msg_administrator_added', 'Administrator successfully added!'),
(663, 1, 'msg_bank_transfer_text', 'Once you have placed your order, you can make your payment to one of these bank accounts. Please add your order number to your payment description.'),
(664, 1, 'msg_bank_transfer_text_order_completed', 'You can make your payment to one of these bank accounts. Please add your order number to your payment description.'),
(665, 1, 'msg_bank_transfer_text_transaction_completed', 'You can make your payment to one of these bank accounts. Please add your transaction number to your payment description.'),
(666, 1, 'msg_ban_error', 'Your account has been suspended!'),
(667, 1, 'msg_category_added', 'Category successfully added!'),
(668, 1, 'msg_category_deleted', 'Category successfully deleted!'),
(669, 1, 'msg_change_password_error', 'There was a problem changing your password!'),
(670, 1, 'msg_change_password_success', 'Your password has been successfully changed!'),
(671, 1, 'msg_comment_approved', 'Comment successfully approved!'),
(672, 1, 'msg_comment_deleted', 'Comment successfully deleted!'),
(673, 1, 'msg_comment_sent_successfully', 'Your comment has been sent. It will be published after being reviewed by the site management.'),
(674, 1, 'msg_complete_payment', 'Please click the button below to complete the payment.'),
(675, 1, 'msg_confirmation_email', 'Please click on the button below to confirm your account.'),
(676, 1, 'msg_confirmed', 'Your email address has been successfully confirmed!'),
(677, 1, 'msg_confirmed_required', 'In order to login to the site, you must confirm your email address.'),
(678, 1, 'msg_contact_error', 'There was a problem sending your message!'),
(679, 1, 'msg_contact_success', 'Your message has been successfully sent!'),
(680, 1, 'msg_coupon_auth', 'This coupon is for registered members only!'),
(681, 1, 'msg_coupon_cart_total', 'Your cart total is not enough to use this coupon. Minimum cart total:'),
(682, 1, 'msg_coupon_code_added_before', 'This coupon code has already been added before. Please add another coupon code.'),
(683, 1, 'msg_coupon_limit', 'Coupon usage limit has been reached!'),
(684, 1, 'msg_coupon_used', 'This coupon code has been used before!'),
(685, 1, 'msg_cron_sitemap', 'With this URL you can automatically update your sitemap.'),
(686, 1, 'msg_custom_field_added', 'Custom field successfully added!'),
(687, 1, 'msg_custom_field_deleted', 'Custom field successfully deleted!'),
(688, 1, 'msg_default_language_delete', 'Default language cannot be deleted!'),
(689, 1, 'msg_default_page_delete', 'Default pages cannot be deleted!'),
(690, 1, 'msg_deleted', 'Item successfully deleted!'),
(691, 1, 'msg_delete_posts', 'Please delete posts belonging to this category first!'),
(692, 1, 'msg_delete_subcategories', 'Please delete subcategories belonging to this category first!'),
(693, 1, 'msg_digital_product_register_error', 'You must create an account to purchase a digital product.'),
(694, 1, 'msg_dont_have_downloadable_files', 'You don\'t have any downloadable files.'),
(695, 1, 'msg_email_sent', 'Email successfully sent!'),
(696, 1, 'msg_email_unique_error', 'The email has already been taken.'),
(697, 1, 'msg_error', 'An error occurred please try again!'),
(698, 1, 'msg_error_cart_unapproved_products', 'Unapproved products cannot be added to the cart!'),
(699, 1, 'msg_error_product_type', 'You must enable at least one product type'),
(700, 1, 'msg_error_selected_system', 'You must enable at least one system'),
(701, 1, 'msg_error_sku', 'This SKU is used for your another product!'),
(702, 1, 'msg_expired_plan', 'When your plan expires, if you do not renew your plan within 3 days, your ads will be added to the \"Expired Products\" section and will not be displayed on the site.'),
(703, 1, 'msg_insufficient_balance', 'Insufficient balance!'),
(704, 1, 'msg_invalid_coupon', 'This coupon code is invalid or has expired!'),
(705, 1, 'msg_invalid_email', 'Invalid email address!'),
(706, 1, 'msg_language_added', 'Language successfully added!'),
(707, 1, 'msg_language_deleted', 'Language successfully deleted!'),
(708, 1, 'msg_membership_renewed', 'Your membership plan has been successfully renewed!'),
(709, 1, 'msg_message_deleted', 'Message successfully deleted!'),
(710, 1, 'msg_message_sent', 'Your message has been successfully sent!'),
(711, 1, 'msg_message_sent_error', 'You cannot send message to yourself!'),
(712, 1, 'msg_newsletter_error', 'Your email address is already registered!'),
(713, 1, 'msg_newsletter_success', 'Your email address has been successfully added!'),
(714, 1, 'msg_no_created_variations', 'You have no created variations.'),
(715, 1, 'msg_option_added', 'Option added successfully!'),
(716, 1, 'msg_option_exists', 'This option already exists!'),
(717, 1, 'msg_order_completed', 'Your order has been successfully completed!'),
(718, 1, 'msg_page_added', 'Page successfully added!'),
(719, 1, 'msg_page_deleted', 'Page successfully deleted!'),
(720, 1, 'msg_payment_completed', 'Payment completed successfully!'),
(721, 1, 'msg_payment_database_error', 'Your payment has been successfully completed, but there was a problem with adding the order to the database! Please contact our site management for this order!'),
(722, 1, 'msg_payment_error', 'An error occurred during the payment!'),
(723, 1, 'msg_payment_success', 'Your payment has been successfully completed!'),
(724, 1, 'msg_payout_bitcoin_address_error', 'You must enter your BTC address to make this payment request'),
(725, 1, 'msg_payout_paypal_error', 'You must enter your PayPal email address to make this payment request'),
(726, 1, 'msg_plan_expired', 'Your membership plan has expired!'),
(727, 1, 'msg_post_added', 'Post successfully added!'),
(728, 1, 'msg_post_deleted', 'Post successfully deleted!'),
(729, 1, 'msg_product_approved', 'Product successfully approved!'),
(730, 1, 'msg_product_deleted', 'Product successfully deleted!'),
(731, 1, 'msg_product_slug_used', 'This slug is used by another product!'),
(732, 1, 'msg_promote_bank_transfer_text', 'Once you have placed your order, you can make your payment to one of these bank accounts. Please add your transaction number to your payment description.'),
(733, 1, 'msg_quote_request_error', 'You cannot request a quote for your own item!'),
(734, 1, 'msg_quote_request_sent', 'Your request has been successfully submitted.'),
(735, 1, 'msg_reached_ads_limit', 'You have reached your ad adding limit! If you want to add more ads, you can upgrade your current plan by clicking the button below.'),
(736, 1, 'msg_recaptcha', 'Please confirm that you are not a robot!'),
(737, 1, 'msg_refund_request_email', 'You have received a refund request. Please click the button below to see the details.'),
(738, 1, 'msg_refund_request_update_email', 'There is an update for your refund request. Please click the button below to see the details.'),
(739, 1, 'msg_register_success', 'Your account has been created successfully!'),
(740, 1, 'msg_request_sent', 'The request has been sent successfully!'),
(741, 1, 'msg_reset_cache', 'All cache files have been deleted!'),
(742, 1, 'msg_reset_password_error', 'We can\'t find a user with that e-mail address!'),
(743, 1, 'msg_reset_password_success', 'We\'ve sent an email for resetting your password to your email address. Please check your email for next steps.'),
(744, 1, 'msg_review_added', 'Your review has been successfully added!'),
(745, 1, 'msg_review_deleted', 'Review successfully deleted!'),
(746, 1, 'msg_send_confirmation_email', 'An activation email has been sent to your email address. Please confirm your account.'),
(747, 1, 'msg_shop_name_unique_error', 'The shop name has already been taken.'),
(748, 1, 'msg_shop_opening_requests', 'Your request to open a store is under evaluation!'),
(749, 1, 'msg_shop_request_declined', 'Your shop opening request has been declined. Thank you for your interest.'),
(750, 1, 'msg_sitemap_updated', 'Sitemap successfully updated!'),
(751, 1, 'msg_slider_added', 'Slider item successfully added!'),
(752, 1, 'msg_slider_deleted', 'Slider item successfully deleted!'),
(753, 1, 'msg_slug_unique_error', 'The slug has already been taken.'),
(754, 1, 'msg_start_selling', 'We have received your request. Your store will be open when your request is approved.'),
(755, 1, 'msg_subscriber_deleted', 'Subscriber successfully deleted!'),
(756, 1, 'msg_unsubscribe', 'You will no longer receive emails from us!'),
(757, 1, 'msg_updated', 'Changes successfully saved!'),
(758, 1, 'msg_username_unique_error', 'The username has already been taken.'),
(759, 1, 'msg_user_deleted', 'User successfully deleted!'),
(760, 1, 'msg_wrong_old_password', 'Wrong old password!'),
(761, 1, 'multilingual_system', 'Multilingual System'),
(762, 1, 'multiple_sale', 'Multiple Sale'),
(763, 1, 'multiple_sale_option_1', 'Yes, I want to sell this product to more than one customer'),
(764, 1, 'multiple_sale_option_2', 'No, I want to sell this product to a single customer'),
(765, 1, 'multi_vendor_system', 'Multi-Vendor System'),
(766, 1, 'multi_vendor_system_exp', 'If you disable it, only Admin can add product.'),
(767, 1, 'my_account', 'My Account'),
(768, 1, 'my_cart', 'My Cart'),
(769, 1, 'name', 'Name'),
(770, 1, 'name_on_the_card', 'Name on the Card'),
(771, 1, 'navigation', 'Navigation'),
(772, 1, 'navigation_template', 'Navigation Template'),
(773, 1, 'need_more_help', 'Need more help?'),
(774, 1, 'never', 'Never'),
(775, 1, 'new', 'New'),
(776, 1, 'newsletter', 'Newsletter'),
(777, 1, 'newsletter_desc', 'Join our subscribers list to get the latest news, updates and special offers directly in your inbox'),
(778, 1, 'newsletter_popup', 'Newsletter Popup'),
(779, 1, 'newsletter_send_many_exp', 'Some servers do not allow mass mailing. Therefore, instead of sending your mails to all subscribers at once, you can send them part by part (Example: 50 subscribers at once). If your mail server stops sending mail, the sending process will also stop.'),
(780, 1, 'new_arrivals', 'New Arrivals'),
(781, 1, 'new_message', 'New'),
(782, 1, 'new_password', 'New Password'),
(783, 1, 'new_quote_request', 'New Quote Request'),
(784, 1, 'next', 'Next'),
(785, 1, 'no', 'No'),
(786, 1, 'none', 'None'),
(787, 1, 'not_added_shipping_address', 'You have not added a shipping address yet.'),
(788, 1, 'not_added_vendor_balance', 'Not Added to Vendor Balance'),
(789, 1, 'november', 'November'),
(790, 1, 'no_comments_found', 'No comments found for this product. Be the first to comment!'),
(791, 1, 'no_delivery_is_made_to_address', 'No delivery is made to the address you have chosen.'),
(792, 1, 'no_discount', 'No Discount'),
(793, 1, 'no_members_found', 'No members found!'),
(794, 1, 'no_messages_found', 'No messages found!'),
(795, 1, 'no_products_found', 'No products found!'),
(796, 1, 'no_records_found', 'No records found!'),
(797, 1, 'no_results_found', 'No Results Found!'),
(798, 1, 'no_reviews_found', 'No reviews found!'),
(799, 1, 'no_thanks', 'No, thanks'),
(800, 1, 'number', 'Number'),
(801, 1, 'number_featured_products', 'Number of Featured Products to Show'),
(802, 1, 'number_latest_products', 'Number of Latest Products to Show'),
(803, 1, 'number_of_ads', 'Number of Ads'),
(804, 1, 'number_of_coupons', 'Number of Coupons'),
(805, 1, 'number_of_coupons_exp', 'How many times a coupon can be used by all customers before being invalid'),
(806, 1, 'number_of_days', 'Number of Days'),
(807, 1, 'number_of_entries', 'Number of Entries'),
(808, 1, 'number_of_links_in_menu', 'The number of links that appear in the menu'),
(809, 1, 'number_of_results', 'Number of Results'),
(810, 1, 'number_of_total_sales', 'Number of total sales'),
(811, 1, 'number_remaining_ads', 'Number of Remaining Ads'),
(812, 1, 'num_articles', '{field} Articles'),
(813, 1, 'october', 'October'),
(814, 1, 'ok', 'OK'),
(815, 1, 'old_password', 'Old Password'),
(816, 1, 'online', 'Online'),
(817, 1, 'open', 'Open'),
(818, 1, 'open_user_shop', 'Open User Shop'),
(819, 1, 'option', 'Option'),
(820, 1, 'optional', 'Optional'),
(821, 1, 'options', 'Options'),
(822, 1, 'option_display_type', 'Option Display Type'),
(823, 1, 'option_name', 'Option Name'),
(824, 1, 'order', 'Order'),
(825, 1, 'orders', 'Orders'),
(826, 1, 'order_details', 'Order Details'),
(827, 1, 'order_has_been_shipped', 'The order has been shipped!'),
(828, 1, 'order_id', 'Order Id'),
(829, 1, 'order_information', 'Order Information'),
(830, 1, 'order_not_yet_shipped', 'The order has not yet been shipped.'),
(831, 1, 'order_number', 'Order Number'),
(832, 1, 'order_processing', 'Processing'),
(833, 1, 'order_summary', 'Order Summary'),
(834, 1, 'out_of_stock', 'Out of Stock'),
(835, 1, 'pages', 'Pages'),
(836, 1, 'page_not_found', 'Page not found'),
(837, 1, 'page_not_found_sub', 'The page you are looking for doesn\'t exist.'),
(838, 1, 'page_type', 'Page Type'),
(839, 1, 'page_views', 'Page Views'),
(840, 1, 'pagseguro', 'PagSeguro'),
(841, 1, 'paid', 'Paid'),
(842, 1, 'panel', 'Panel'),
(843, 1, 'parent', 'Parent'),
(844, 1, 'parent_category', 'Parent Category'),
(845, 1, 'parent_option', 'Parent Option'),
(846, 1, 'parent_variation', 'Parent Variation'),
(847, 1, 'password', 'Password'),
(848, 1, 'password_confirm', 'Confirm Password'),
(849, 1, 'password_reset', 'Password Reset'),
(850, 1, 'paste_ad_code', 'Paste Ad Code'),
(851, 1, 'paste_ad_url', 'Paste Ad URL'),
(852, 1, 'pause', 'Pause'),
(853, 1, 'pay', 'Pay'),
(854, 1, 'payer_email', 'Payer Email'),
(855, 1, 'payment', 'Payment'),
(856, 1, 'payments', 'Payments'),
(857, 1, 'payment_amount', 'Payment Amount'),
(858, 1, 'payment_details', 'Payment Details'),
(859, 1, 'payment_history', 'Payment History'),
(860, 1, 'payment_id', 'Payment Id'),
(861, 1, 'payment_method', 'Payment Method'),
(862, 1, 'payment_note', 'Payment Note'),
(863, 1, 'payment_received', 'Payment Received'),
(864, 1, 'payment_settings', 'Payment Settings'),
(865, 1, 'payment_status', 'Payment Status'),
(866, 1, 'payouts', 'Payouts'),
(867, 1, 'payout_requests', 'Payout Requests'),
(868, 1, 'payout_settings', 'Payout Settings'),
(869, 1, 'paypal', 'PayPal'),
(870, 1, 'paypal_email_address', 'PayPal Email Address'),
(871, 1, 'paystack', 'PayStack'),
(872, 1, 'pay_now', 'Pay Now'),
(873, 1, 'pending', 'Pending'),
(874, 1, 'pending_comments', 'Pending Comments'),
(875, 1, 'pending_payment', 'Pending Payment'),
(876, 1, 'pending_products', 'Pending Products'),
(877, 1, 'pending_quote', 'Pending Quote'),
(878, 1, 'permissions', 'Permissions'),
(879, 1, 'personal_website_url', 'Personal Website URL'),
(880, 1, 'phone', 'Phone'),
(881, 1, 'phone_number', 'Phone Number'),
(882, 1, 'physical', 'Physical'),
(883, 1, 'physical_exp', 'A tangible product that you will ship to buyers'),
(884, 1, 'physical_products', 'Physical Products'),
(885, 1, 'pinterest_url', 'Pinterest URL'),
(886, 1, 'place_order', 'Place Order'),
(887, 1, 'plan_expiration_date', 'Plan Expiration Date'),
(888, 1, 'play', 'Play'),
(889, 1, 'please_wait', 'Please wait...'),
(890, 1, 'popular', 'Popular'),
(891, 1, 'postal_code', 'Postal Code'),
(892, 1, 'postcode', 'Postcode'),
(893, 1, 'posts', 'Posts'),
(894, 1, 'preferences', 'Preferences'),
(895, 1, 'preview', 'Preview'),
(896, 1, 'price', 'Price'),
(897, 1, 'price_per_day', 'Price Per Day'),
(898, 1, 'price_per_month', 'Price Per Month'),
(899, 1, 'pricing', 'Pricing'),
(900, 1, 'primary', 'Primary'),
(901, 1, 'print', 'Print'),
(902, 1, 'priority', 'Priority'),
(903, 1, 'priority_exp', 'The priority of a particular URL relative to other pages on the same site'),
(904, 1, 'priority_none', 'Automatically Calculated Priority'),
(905, 1, 'processing', 'Processing...'),
(906, 1, 'product', 'Product'),
(907, 1, 'production', 'Production'),
(908, 1, 'products', 'Products'),
(909, 1, 'products_ad_space', 'Products Ad Space'),
(910, 1, 'products_by_category', 'Products by Category'),
(911, 1, 'products_by_category_exp', 'Show products by categories on the homepage'),
(912, 1, 'products_sent_different_stores', 'Your products will be sent by different stores.'),
(913, 1, 'products_sidebar_ad_space', 'Products Sidebar Ad Space'),
(914, 1, 'product_added', 'Product added successfully!'),
(915, 1, 'product_ad_space', 'Product Ad Space'),
(916, 1, 'product_approve_published', 'Once it is approved, it will be published on the site.'),
(917, 1, 'product_bottom_ad_space', 'Product Bottom Ad Space'),
(918, 1, 'product_cache_system', 'Product Cache System'),
(919, 1, 'product_code', 'Product Code'),
(920, 1, 'product_comments', 'Product Comments'),
(921, 1, 'product_details', 'Product Details'),
(922, 1, 'product_does_not_ship_location', 'This product does not ship to this location.\r\n'),
(923, 1, 'product_id', 'Product Id'),
(924, 1, 'product_image_exp', 'Products with good and clear images are sold faster!'),
(925, 1, 'product_link_structure', 'Product Link Structure'),
(926, 1, 'product_location_system', 'Product Location System'),
(927, 1, 'product_or_seller_profile_url', 'Product or seller profile URL'),
(928, 1, 'product_price', 'Product Price'),
(929, 1, 'product_promoting_payment', 'Product Promotion Payment'),
(930, 1, 'product_promoting_payment_exp', 'Product Promotion Payment'),
(931, 1, 'product_promotion', 'Product Promotion'),
(932, 1, 'product_settings', 'Product Settings'),
(933, 1, 'product_type', 'Product Type'),
(934, 1, 'product_url', 'Product URL'),
(935, 1, 'profile', 'Profile'),
(936, 1, 'profile_ad_space', 'Profile Ad Space'),
(937, 1, 'profile_sidebar_ad_space', 'Profile Sidebar Ad Space'),
(938, 1, 'promote', 'Promote'),
(939, 1, 'promote_plan', 'Promote Plan'),
(940, 1, 'promote_your_product', 'Promote Your Product'),
(941, 1, 'promotion_payments', 'Promotion Payments'),
(942, 1, 'public_key', 'Public Key'),
(943, 1, 'publishable_key', 'Publishable Key'),
(944, 1, 'purchased_plan', 'Purchased Plan'),
(945, 1, 'purchase_code', 'Purchase Code'),
(946, 1, 'pwa', 'Progressive Web App (PWA)');
INSERT INTO `language_translations` (`id`, `lang_id`, `label`, `translation`) VALUES
(947, 1, 'pwa_warning', 'If you enable PWA option, read \'Progressive Web App (PWA)\' section from the documentation to make the necessary settings.'),
(948, 1, 'quantity', 'Quantity'),
(949, 1, 'quote', 'Quote'),
(950, 1, 'quote_request', 'Quote Request'),
(951, 1, 'quote_requests', 'Quote Requests'),
(952, 1, 'radio_button', 'Radio Button (Single Selection)'),
(953, 1, 'rate_this_product', 'Rate this product'),
(954, 1, 'reason', 'Reason'),
(955, 1, 'receipt', 'Receipt'),
(956, 1, 'received_quote_requests', 'Received Quote Requests'),
(957, 1, 'refresh_cache_database_changes', 'Refresh Cache Files When Database Changes'),
(958, 1, 'refund', 'Refund'),
(959, 1, 'refund_admin_complete_exp', 'To complete a refund request, you must return the buyer\'s money. If you click the \"Approve Refund\" button, the system will change the order status to \"Refund Approved\" and deduct the order amount from the seller\'s balance.'),
(960, 1, 'refund_approved', 'Refund Approved'),
(961, 1, 'refund_approved_exp', 'Your refund request has been approved by the seller. The total amount for this product will be refunded to you.'),
(962, 1, 'refund_declined_exp', 'Your refund request has been declined by the seller. If you want to raise a dispute, you can contact the site management.'),
(963, 1, 'refund_reason_explain', 'Why do you want a refund? Explain in detail.'),
(964, 1, 'refund_request', 'Refund Request'),
(965, 1, 'refund_requests', 'Refund Requests'),
(966, 1, 'region', 'Region'),
(967, 1, 'regions', 'Regions'),
(968, 1, 'register', 'Register'),
(969, 1, 'register_with_email', 'Or register with email'),
(970, 1, 'regular', 'Regular'),
(971, 1, 'regular_listing', 'Regular Listing'),
(972, 1, 'reject', 'Reject'),
(973, 1, 'rejected', 'Rejected'),
(974, 1, 'rejected_quote', 'Rejected Quote'),
(975, 1, 'reject_quote', 'Reject Quote'),
(976, 1, 'related_help_topics', 'Related Help Topics'),
(977, 1, 'related_posts', 'Related Posts'),
(978, 1, 'remaining_days', 'Remaining Days'),
(979, 1, 'remove', 'Remove'),
(980, 1, 'remove_from_featured', 'Remove from Featured'),
(981, 1, 'remove_from_product_filters', 'Remove from Product Filters'),
(982, 1, 'remove_from_special_offers', 'Remove from Special Offers'),
(983, 1, 'remove_from_wishlist', 'Remove from wishlist'),
(984, 1, 'remove_user_ban', 'Remove User Ban'),
(985, 1, 'renew_your_plan', 'Renew Your Plan'),
(986, 1, 'reply', 'Reply'),
(987, 1, 'reply_to', 'Reply to'),
(988, 1, 'report', 'Report'),
(989, 1, 'reported_content', 'Reported Content'),
(990, 1, 'report_bank_transfer', 'Report Bank Transfer'),
(991, 1, 'report_comment', 'Report Comment'),
(992, 1, 'report_review', 'Report Review'),
(993, 1, 'report_this_product', 'Report this product'),
(994, 1, 'report_this_seller', 'Report this seller'),
(995, 1, 'request_a_quote', 'Request a Quote'),
(996, 1, 'request_documents_vendors', 'Request Documents from Vendors to Open a Store'),
(997, 1, 'required', 'Required'),
(998, 1, 'required_files', 'Required Files'),
(999, 1, 'resend_activation_email', 'Resend Activation Email'),
(1000, 1, 'reset', 'Reset'),
(1001, 1, 'reset_cache', 'Reset Cache'),
(1002, 1, 'reset_filters', 'Reset Filters'),
(1003, 1, 'reset_location', 'Reset Location'),
(1004, 1, 'reset_password', 'Reset Password'),
(1005, 1, 'reset_password_subtitle', 'Enter your email address'),
(1006, 1, 'responded', 'Responded'),
(1007, 1, 'restore', 'Restore'),
(1008, 1, 'return_to_cart', 'Return to cart'),
(1009, 1, 'review', 'Review'),
(1010, 1, 'reviews', 'Reviews'),
(1011, 1, 'right', 'Right'),
(1012, 1, 'right_to_left', 'Right to Left (RTL)'),
(1013, 1, 'role', 'Role'),
(1014, 1, 'roles', 'Roles'),
(1015, 1, 'roles_permissions', 'Roles & Permissions'),
(1016, 1, 'role_name', 'Role Name'),
(1017, 1, 'route_settings', 'Route Settings'),
(1018, 1, 'route_settings_warning', 'You cannot use special characters in routes. If your language contains special characters, please be careful when editing routes. If you enter an invalid route, you will not be able to access the related page.'),
(1019, 1, 'row_width', 'Row Width'),
(1020, 1, 'rss_feeds', 'RSS Feeds'),
(1021, 1, 'rss_system', 'RSS System'),
(1022, 1, 'sale', 'Sale'),
(1023, 1, 'sales', 'Sales'),
(1024, 1, 'sale_id', 'Sale Id'),
(1025, 1, 'sandbox', 'Sandbox'),
(1026, 1, 'saturday', 'Saturday'),
(1027, 1, 'save_and_continue', 'Save and Continue'),
(1028, 1, 'save_as_draft', 'Save as Draft'),
(1029, 1, 'save_changes', 'Save Changes'),
(1030, 1, 'search', 'Search'),
(1031, 1, 'search_by_location', 'Search by Location'),
(1032, 1, 'search_exp', 'Search for products or members'),
(1033, 1, 'search_products', 'Search Products'),
(1034, 1, 'search_results', 'Search Results'),
(1035, 1, 'secret_key', 'Secret Key'),
(1036, 1, 'secure_key', 'Secure Key'),
(1037, 1, 'see_details', 'See Details'),
(1038, 1, 'see_more', 'See more'),
(1039, 1, 'see_order_details', 'See Order Details'),
(1040, 1, 'select', 'Select'),
(1041, 1, 'select_ad_space', 'Select Ad Space'),
(1042, 1, 'select_all', 'Select All'),
(1043, 1, 'select_category', 'Select Category'),
(1044, 1, 'select_country', 'Select Country'),
(1045, 1, 'select_existing_variation', 'Select an Existing Variation'),
(1046, 1, 'select_favicon', 'Select Favicon'),
(1047, 1, 'select_file', 'Select File'),
(1048, 1, 'select_image', 'Select Image'),
(1049, 1, 'select_language', 'Select Language'),
(1050, 1, 'select_location', 'Select Location'),
(1051, 1, 'select_logo', 'Select Logo'),
(1052, 1, 'select_option', 'Select an option'),
(1053, 1, 'select_payment_option', 'Select Payment Option'),
(1054, 1, 'select_region', 'Select Region'),
(1055, 1, 'select_your_location', 'Select Your Location'),
(1056, 1, 'select_your_plan', 'Select Your Plan'),
(1057, 1, 'select_your_plan_exp', 'Select your membership plan to continue'),
(1058, 1, 'seller', 'Seller'),
(1059, 1, 'sellers_bid', 'Seller\'s Bid'),
(1060, 1, 'seller_balances', 'Seller Balances'),
(1061, 1, 'seller_does_not_ship_to_address', 'This seller does not ship to the address you have chosen. You can continue by removing the products of this seller from your cart.'),
(1062, 1, 'selling_license_keys', 'Selling License Keys'),
(1063, 1, 'sell_my_product_on_site', 'Sell product on the site'),
(1064, 1, 'sell_now', 'Sell Now'),
(1065, 1, 'send', 'Send'),
(1066, 1, 'send_email', 'Send Email'),
(1067, 1, 'send_email_shop_opening_request', 'Send email when there is a new shop opening request'),
(1068, 1, 'send_email_subscribers', 'Send Email to Subscribers'),
(1069, 1, 'send_email_to_buyer', 'Send Email to Buyer'),
(1070, 1, 'send_message', 'Send Message'),
(1071, 1, 'send_test_email', 'Send Test Email'),
(1072, 1, 'send_test_email_exp', 'You can send a test mail to check if your mail server is working.'),
(1073, 1, 'sent_by', 'Sent By'),
(1074, 1, 'seo', 'SEO'),
(1075, 1, 'seo_tools', 'Seo Tools'),
(1076, 1, 'september', 'September'),
(1077, 1, 'server_key', 'Server Key'),
(1078, 1, 'server_response', 'Server\'s Response'),
(1079, 1, 'settings', 'Settings'),
(1080, 1, 'settings_language', 'Settings Language'),
(1081, 1, 'set_as_default', 'Set as Default'),
(1082, 1, 'set_payout_account', 'Set Payout Account'),
(1083, 1, 'share', 'Share'),
(1084, 1, 'shipped', 'Shipped'),
(1085, 1, 'shipped_product', 'Shipped Product'),
(1086, 1, 'shipping', 'Shipping'),
(1087, 1, 'shipping_address', 'Shipping Address'),
(1088, 1, 'shipping_class', 'Shipping Class'),
(1089, 1, 'shipping_classes', 'Shipping Classes'),
(1090, 1, 'shipping_classes_exp', 'Shipping classes allow you to define different shipping costs for your products. If you have products with high shipping costs (large in weight and size), you can add a class from here and set a different price for each shipping method for this class. You can choose shipping classes during adding your products.'),
(1091, 1, 'shipping_class_costs', 'Shipping Class Costs'),
(1092, 1, 'shipping_cost', 'Shipping Cost'),
(1093, 1, 'shipping_delivery_times', 'Shipping Delivery Times'),
(1094, 1, 'shipping_delivery_times_exp', 'You can add shipping delivery times from here (E.g: Ready to ship in 1 Business Day)'),
(1095, 1, 'shipping_information', 'Shipping Information'),
(1096, 1, 'shipping_location', 'Shipping & Location'),
(1097, 1, 'shipping_method', 'Shipping Method'),
(1098, 1, 'shipping_methods', 'Shipping Methods'),
(1099, 1, 'shipping_settings', 'Shipping Settings'),
(1100, 1, 'shipping_time', 'Shipping Time'),
(1101, 1, 'shipping_zones', 'Shipping Zones '),
(1102, 1, 'shop', 'Shop'),
(1103, 1, 'shopping_cart', 'Shopping Cart'),
(1104, 1, 'shop_description', 'Shop Description'),
(1105, 1, 'shop_location', 'Shop Location'),
(1106, 1, 'shop_name', 'Shop Name'),
(1107, 1, 'shop_now', 'Shop Now'),
(1108, 1, 'shop_opening_request', 'Shop Opening Request'),
(1109, 1, 'shop_opening_requests', 'Shop Opening Requests'),
(1110, 1, 'shop_settings', 'Shop Settings'),
(1111, 1, 'short_form', 'Short Form'),
(1112, 1, 'show', 'Show'),
(1113, 1, 'show_all', 'Show All'),
(1114, 1, 'show_breadcrumb', 'Show Breadcrumb'),
(1115, 1, 'show_category_image_on_menu', 'Show Category Image on Menu'),
(1116, 1, 'show_cookies_warning', 'Show Cookies Warning'),
(1117, 1, 'show_first_search_lists', 'Show first in search lists'),
(1118, 1, 'show_image_on_main_menu', 'Show Image on Main Menu'),
(1119, 1, 'show_image_on_navigation', 'Show Category Image on the Navigation'),
(1120, 1, 'show_my_email', 'Show my email address'),
(1121, 1, 'show_my_location', 'Show my location'),
(1122, 1, 'show_my_phone', 'Show my phone number'),
(1123, 1, 'show_on_main_menu', 'Show on Main Menu'),
(1124, 1, 'show_option_images_on_slider', 'Show Option Images on Slider When an Option is Selected'),
(1125, 1, 'show_reason', 'Show Reason'),
(1126, 1, 'show_right_column', 'Show Right Column'),
(1127, 1, 'show_sold_products_on_site', 'Show Sold Products on the Site'),
(1128, 1, 'show_subcategory_products', 'Show subcategory products'),
(1129, 1, 'show_title', 'Show Title'),
(1130, 1, 'show_under_these_categories', 'Custom field will be displayed under these categories'),
(1131, 1, 'sitemap', 'Sitemap'),
(1132, 1, 'site_description', 'Site Description'),
(1133, 1, 'site_font', 'Site Font'),
(1134, 1, 'site_key', 'Site Key'),
(1135, 1, 'site_title', 'Site Title'),
(1136, 1, 'skip', 'Skip'),
(1137, 1, 'sku', 'SKU'),
(1138, 1, 'slider', 'Slider'),
(1139, 1, 'slider_items', 'Slider Items'),
(1140, 1, 'slider_settings', 'Slider Settings'),
(1141, 1, 'slug', 'Slug'),
(1142, 1, 'slug_exp', 'If you leave it empty, it will be generated automatically.'),
(1143, 1, 'social_login', 'Social Login'),
(1144, 1, 'social_media', 'Social Media'),
(1145, 1, 'social_media_settings', 'Social Media Settings'),
(1146, 1, 'sold', 'Sold'),
(1147, 1, 'sold_products', 'Sold Products'),
(1148, 1, 'sort_by', 'Sort By:'),
(1149, 1, 'sort_categories', 'Sort Categories'),
(1150, 1, 'sort_options', 'Sort Options'),
(1151, 1, 'sort_parent_categories_by_category_order', 'Sort Parent Categories by Category Order'),
(1152, 1, 'special_offers', 'Special Offers'),
(1153, 1, 'start', 'Start'),
(1154, 1, 'start_selling', 'Start Selling'),
(1155, 1, 'start_selling_exp', 'In order to sell your products, you must be a verified member. Verification is a one-time process. This verification process is necessary because of spammers and fraud.'),
(1156, 1, 'state', 'State'),
(1157, 1, 'states', 'States'),
(1158, 1, 'static_content_cache_system', 'Static Content Cache System'),
(1159, 1, 'status', 'Status'),
(1160, 1, 'still_have_questions', 'Still have questions?'),
(1161, 1, 'still_have_questions_exp', 'If you still have a question, you can submit a support request here.'),
(1162, 1, 'stock', 'Stock'),
(1163, 1, 'storage', 'Storage'),
(1164, 1, 'store_name', 'Store Name'),
(1165, 1, 'stripe', 'Stripe'),
(1166, 1, 'stripe_checkout', 'Stripe Checkout'),
(1167, 1, 'stripe_payment_for', 'Promote payment for'),
(1168, 1, 'subcategory', 'Subcategory'),
(1169, 1, 'subject', 'Subject'),
(1170, 1, 'submit', 'Submit'),
(1171, 1, 'submit_a_new_quote', 'Submit a New Quote'),
(1172, 1, 'submit_a_quote', 'Submit a Quote'),
(1173, 1, 'submit_a_request', 'Submit a Request'),
(1174, 1, 'submit_refund_request', 'Submit a Refund Request'),
(1175, 1, 'subscribe', 'Subscribe'),
(1176, 1, 'subscribers', 'Subscribers'),
(1177, 1, 'subtotal', 'Subtotal'),
(1178, 1, 'succeeded', 'Succeeded'),
(1179, 1, 'summary', 'Summary'),
(1180, 1, 'sunday', 'Sunday'),
(1181, 1, 'support_tickets', 'Support Tickets'),
(1182, 1, 'swift', 'SWIFT'),
(1183, 1, 'swift_code', 'SWIFT Code'),
(1184, 1, 'swift_iban', 'Bank Account Number/IBAN'),
(1185, 1, 'system_settings', 'System Settings'),
(1186, 1, 'tag', 'Tag'),
(1187, 1, 'tags', 'Tags'),
(1188, 1, 'telegram_url', 'Telegram URL'),
(1189, 1, 'tell_us_about_shop', 'Tell Us About Your Shop'),
(1190, 1, 'terms_conditions_exp', 'I have read and agree to the'),
(1191, 1, 'text', 'Text'),
(1192, 1, 'textarea', 'Textarea'),
(1193, 1, 'text_color', 'Text Color'),
(1194, 1, 'text_direction', 'Text Direction'),
(1195, 1, 'text_editor_language', 'Text Editor Language'),
(1196, 1, 'there_is_shop_opening_request', 'There is a new shop opening request.'),
(1197, 1, 'the_operation_completed', 'The operation completed successfully!'),
(1198, 1, 'thursday', 'Thursday'),
(1199, 1, 'ticket', 'Ticket'),
(1200, 1, 'timezone', 'Timezone'),
(1201, 1, 'time_limit_for_plan', 'A time limit for the plan'),
(1202, 1, 'title', 'Title'),
(1203, 1, 'to', 'To:'),
(1204, 1, 'token', 'Token'),
(1205, 1, 'top', 'Top'),
(1206, 1, 'top_menu', 'Top Menu'),
(1207, 1, 'total', 'Total'),
(1208, 1, 'total_amount', 'Total Amount:'),
(1209, 1, 'tracking_code', 'Tracking Code'),
(1210, 1, 'tracking_url', 'Tracking URL'),
(1211, 1, 'transactions', 'Transactions'),
(1212, 1, 'transaction_number', 'Transaction Number'),
(1213, 1, 'translation', 'Translation'),
(1214, 1, 'tuesday', 'Tuesday'),
(1215, 1, 'twitter_url', 'Twitter URL'),
(1216, 1, 'type', 'Type'),
(1217, 1, 'type_extension', 'Type an extension and hit enter '),
(1218, 1, 'type_tag', 'Type tag and hit enter'),
(1219, 1, 'unconfirmed', 'Unconfirmed'),
(1220, 1, 'unfollow', 'Unfollow'),
(1221, 1, 'unit_price', 'Unit Price'),
(1222, 1, 'unlimited', 'Unlimited'),
(1223, 1, 'unlimited_stock', 'Unlimited Stock'),
(1224, 1, 'unsubscribe', 'Unsubscribe'),
(1225, 1, 'unsubscribe_successful', 'Unsubscribe Successful!'),
(1226, 1, 'updated', 'Updated'),
(1227, 1, 'update_category', 'Update Category'),
(1228, 1, 'update_city', 'Update City'),
(1229, 1, 'update_country', 'Update Country'),
(1230, 1, 'update_currency', 'Update Currency'),
(1231, 1, 'update_custom_field', 'Update Custom Field'),
(1232, 1, 'update_exchange_rates', 'Update Exchange Rates'),
(1233, 1, 'update_font', 'Update Font'),
(1234, 1, 'update_language', 'Update Language'),
(1235, 1, 'update_location', 'Update Location'),
(1236, 1, 'update_order_status', 'Update Order Status'),
(1237, 1, 'update_page', 'Update Page'),
(1238, 1, 'update_post', 'Update Post'),
(1239, 1, 'update_product', 'Update Product'),
(1240, 1, 'update_profile', 'Update Profile'),
(1241, 1, 'update_quote', 'Update Quote'),
(1242, 1, 'update_seller_balance', 'Update Seller Balance'),
(1243, 1, 'update_sitemap', 'Update Sitemap'),
(1244, 1, 'update_slider_item', 'Update Slider Item'),
(1245, 1, 'update_state', 'Update State'),
(1246, 1, 'upload', 'Upload'),
(1247, 1, 'uploaded', 'Uploaded'),
(1248, 1, 'uploading', 'Uploading...'),
(1249, 1, 'upload_your_banner', 'Upload Your Banner'),
(1250, 1, 'url', 'URL'),
(1251, 1, 'used', 'Used'),
(1252, 1, 'user', 'User'),
(1253, 1, 'username', 'Username'),
(1254, 1, 'users', 'Users'),
(1255, 1, 'user_id', 'User Id'),
(1256, 1, 'user_reviews', 'User Reviews'),
(1257, 1, 'use_default_payment_account', 'Use as default payment account'),
(1258, 1, 'use_default_price', 'Use default price'),
(1259, 1, 'use_different_price_for_options', 'Use Different Price for Options'),
(1260, 1, 'use_same_address_for_billing', 'Use same address for billing address'),
(1261, 1, 'use_this_date', 'Use This Date'),
(1262, 1, 'variations', 'Variations'),
(1263, 1, 'variations_exp', 'Add available options, like color or size that buyers can choose during checkout'),
(1264, 1, 'variation_type', 'Variation Type'),
(1265, 1, 'vat', 'VAT'),
(1266, 1, 'vat_exp', 'Value-Added Tax'),
(1267, 1, 'vat_included', 'VAT Included'),
(1268, 1, 'vendor', 'Vendor'),
(1269, 1, 'vendors', 'Vendors'),
(1270, 1, 'vendor_bulk_product_upload', 'Vendor Bulk Product Upload'),
(1271, 1, 'vendor_no_shipping_option_warning', 'If you want to sell a physical product, you must add your shipping options before adding the product. Please go to this section and add your shipping options:'),
(1272, 1, 'vendor_verification_system', 'Vendor Verification System'),
(1273, 1, 'vendor_verification_system_exp', 'Disable if you want to allow all users to add products.'),
(1274, 1, 'vertical_alignment', 'Vertical Alignment'),
(1275, 1, 'video', 'Video'),
(1276, 1, 'video_preview', 'Video Preview'),
(1277, 1, 'video_preview_exp', 'MP4 or WEBM preview video'),
(1278, 1, 'view_all', 'View All'),
(1279, 1, 'view_content', 'View Content'),
(1280, 1, 'view_details', 'View Details'),
(1281, 1, 'view_invoice', 'View Invoice'),
(1282, 1, 'view_license_keys', 'View License Keys'),
(1283, 1, 'view_options', 'View Options'),
(1284, 1, 'view_product', 'View Product'),
(1285, 1, 'view_site', 'View Site'),
(1286, 1, 'visibility', 'Visibility'),
(1287, 1, 'visible', 'Visible'),
(1288, 1, 'visual_settings', 'Visual Settings'),
(1289, 1, 'vk_login', 'VKontakte Login'),
(1290, 1, 'vk_url', 'VK URL'),
(1291, 1, 'waiting', 'Waiting...'),
(1292, 1, 'warning', 'Warning'),
(1293, 1, 'warning_add_order_tracking_code', 'You can add the order tracking code and link while changing the order status.'),
(1294, 1, 'warning_cannot_choose_plan', 'You cannot choose this plan due to the number of products you have added'),
(1295, 1, 'warning_category_sort', 'Sorting with drag and drop will be active only when the \"by Category Order\" option is selected.'),
(1296, 1, 'warning_membership_admin_role', 'Admin role does not require a membership plan.'),
(1297, 1, 'warning_plan_used', 'This plan has been used before'),
(1298, 1, 'warning_static_content_cache_system', 'Static content cache system is for records (categories, custom fields, language translations etc.) that do not change much on the site. The cache files will be refreshed automatically when there is a change in these records. It is recommended to activate this system always for a faster site.'),
(1299, 1, 'watermark', 'Watermark'),
(1300, 1, 'watermark_image', 'Watermark Image'),
(1301, 1, 'wednesday', 'Wednesday'),
(1302, 1, 'weekly', 'Weekly'),
(1303, 1, 'whatsapp_url', 'WhatsApp URL'),
(1304, 1, 'wishlist', 'Wishlist'),
(1305, 1, 'withdraw_amount', 'Withdrawal Amount'),
(1306, 1, 'withdraw_method', 'Withdrawal Method'),
(1307, 1, 'withdraw_money', 'Withdraw Money'),
(1308, 1, 'write_a_message', 'Write a message...'),
(1309, 1, 'write_review', 'Write a Review...'),
(1310, 1, 'yearly', 'Yearly'),
(1311, 1, 'years_ago', 'years ago'),
(1312, 1, 'year_ago', 'year ago'),
(1313, 1, 'yes', 'Yes'),
(1314, 1, 'your_balance', 'Your Balance'),
(1315, 1, 'your_cart_is_empty', 'Your cart is empty!'),
(1316, 1, 'your_order_shipped', 'Your order has been shipped'),
(1317, 1, 'your_quote_accepted', 'Your quote has been accepted.'),
(1318, 1, 'your_quote_rejected', 'Your quote has been rejected.'),
(1319, 1, 'your_quote_request_replied', 'Your quote request has been replied.'),
(1320, 1, 'your_rating', 'Your Rating:'),
(1321, 1, 'your_shop_opening_request_approved', 'Your shop opening request has been approved. You can go to our site and start to sell your items!'),
(1322, 1, 'youtube_url', 'Youtube URL'),
(1323, 1, 'you_have_new_message', 'You have a new message'),
(1324, 1, 'you_have_new_order', 'You have a new order'),
(1325, 1, 'you_have_new_quote_request', 'You have a new quote request.'),
(1326, 1, 'you_may_also_like', 'You May Also Like'),
(1327, 1, 'you_will_earn', 'You Will Earn'),
(1328, 1, 'zip_code', 'Zip Code'),
(1329, 1, 'zone_name', 'Zone Name'),
(1330, 1, 'error_image_limit', 'Image upload limit exceeded!'),
(1331, 1, 'product_image_upload_limit', 'Product Image Upload Limit'),
(1332, 1, 'commission', 'Commission');

-- --------------------------------------------------------

--
-- Table structure for table `location_cities`
--

CREATE TABLE `location_cities` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(200) NOT NULL,
  `country_id` smallint(6) NOT NULL,
  `state_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `location_countries`
--

CREATE TABLE `location_countries` (
  `id` smallint(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `continent_code` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location_states`
--

CREATE TABLE `location_states` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(200) NOT NULL,
  `country_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `media_type` varchar(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `membership_plans`
--

CREATE TABLE `membership_plans` (
  `id` int(11) NOT NULL,
  `title_array` text DEFAULT NULL,
  `number_of_ads` int(11) DEFAULT NULL,
  `number_of_days` int(11) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `is_free` tinyint(1) DEFAULT 0,
  `is_unlimited_number_of_ads` tinyint(1) DEFAULT 0,
  `is_unlimited_time` tinyint(1) DEFAULT 0,
  `features_array` text DEFAULT NULL,
  `plan_order` smallint(6) DEFAULT 1,
  `is_popular` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `membership_transactions`
--

CREATE TABLE `membership_transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `plan_title` varchar(500) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `payment_amount` varchar(50) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  `buyer_id` int(11) NOT NULL,
  `buyer_type` varchar(20) DEFAULT NULL,
  `price_subtotal` varchar(50) DEFAULT NULL,
  `price_vat` bigint(20) DEFAULT 0,
  `price_shipping` varchar(50) DEFAULT NULL,
  `price_total` varchar(50) DEFAULT NULL,
  `price_currency` varchar(50) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_products` text DEFAULT NULL,
  `coupon_discount` bigint(20) DEFAULT NULL,
  `coupon_discount_rate` smallint(6) DEFAULT 0,
  `coupon_seller_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `buyer_type` varchar(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT 'physical',
  `listing_type` varchar(20) DEFAULT NULL,
  `product_title` varchar(500) DEFAULT NULL,
  `product_slug` varchar(500) DEFAULT NULL,
  `product_unit_price` bigint(20) DEFAULT NULL,
  `product_quantity` tinyint(4) DEFAULT NULL,
  `product_currency` varchar(20) DEFAULT NULL,
  `product_vat_rate` double DEFAULT 0,
  `product_vat` bigint(20) DEFAULT 0,
  `product_total_price` bigint(20) DEFAULT NULL,
  `variation_option_ids` varchar(255) DEFAULT NULL,
  `commission_rate` tinyint(4) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT 0,
  `shipping_tracking_number` varchar(255) DEFAULT NULL,
  `shipping_tracking_url` varchar(500) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `seller_shipping_cost` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_shipping`
--

CREATE TABLE `order_shipping` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `shipping_first_name` varchar(255) DEFAULT NULL,
  `shipping_last_name` varchar(255) DEFAULT NULL,
  `shipping_email` varchar(255) DEFAULT NULL,
  `shipping_phone_number` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_country` varchar(255) DEFAULT NULL,
  `shipping_state` varchar(255) DEFAULT NULL,
  `shipping_city` varchar(255) DEFAULT NULL,
  `shipping_zip_code` varchar(20) DEFAULT NULL,
  `billing_first_name` varchar(255) DEFAULT NULL,
  `billing_last_name` varchar(255) DEFAULT NULL,
  `billing_email` varchar(255) DEFAULT NULL,
  `billing_phone_number` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `billing_country` varchar(255) DEFAULT NULL,
  `billing_state` varchar(255) DEFAULT NULL,
  `billing_city` varchar(255) DEFAULT NULL,
  `billing_zip_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `title` varchar(500) DEFAULT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `page_content` longtext DEFAULT NULL,
  `page_order` int(11) DEFAULT 1,
  `visibility` tinyint(1) DEFAULT 1,
  `title_active` tinyint(1) DEFAULT 1,
  `location` varchar(50) DEFAULT 'information',
  `is_custom` tinyint(1) NOT NULL DEFAULT 1,
  `page_default_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `lang_id`, `title`, `slug`, `description`, `keywords`, `page_content`, `page_order`, `visibility`, `title_active`, `location`, `is_custom`, `page_default_name`, `created_at`) VALUES
(1, 1, 'Terms & Conditions', 'terms-conditions', 'Terms & Conditions Page', 'Terms, Conditions, Page', NULL, 1, 1, 1, 'information', 0, 'terms_conditions', '2020-11-21 10:40:30'),
(2, 1, 'Contact', 'contact', 'Contact Page', 'Contact, Page', NULL, 1, 1, 1, 'top_menu', 0, 'contact', '2020-11-21 10:40:30'),
(3, 1, 'Blog', 'blog', 'Blog Page', 'Blog, Page', NULL, 1, 1, 1, 'quick_links', 0, 'blog', '2020-11-21 10:40:30'),
(4, 1, 'Shops', 'shops', 'Shops Page', 'shops, page', NULL, 1, 1, 1, 'quick_links', 0, 'shops', '2021-11-02 23:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `payment_amount` varchar(50) DEFAULT NULL,
  `payer_email` varchar(100) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `purchased_plan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_key` varchar(255) DEFAULT NULL,
  `public_key` varchar(500) DEFAULT NULL,
  `secret_key` varchar(500) DEFAULT NULL,
  `environment` varchar(30) DEFAULT 'production',
  `locale` varchar(30) DEFAULT NULL,
  `base_currency` varchar(30) DEFAULT 'all',
  `status` tinyint(1) DEFAULT 0,
  `logos` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `name_key`, `public_key`, `secret_key`, `environment`, `locale`, `base_currency`, `status`, `logos`) VALUES
(1, 'PayPal', 'paypal', '', '', 'production', '', 'all', 0, 'visa,mastercard,amex,discover,paypal'),
(2, 'Stripe', 'stripe', '', '', 'production', 'auto', 'all', 0, 'visa,mastercard,amex,stripe'),
(3, 'Paystack', 'paystack', '', '', 'production', '', 'all', 0, 'visa,mastercard,verve,paystack'),
(4, 'Razorpay', 'razorpay', '', '', 'production', '', 'INR', 0, 'visa,mastercard,amex,maestro,diners,rupay,razorpay'),
(5, 'Flutterwave', 'flutterwave', '', '', 'production', '', 'all', 0, 'visa,mastercard,amex,maestro,flutterwave'),
(6, 'Iyzico', 'iyzico', '', '', 'production', '', 'TRY', 0, 'visa,mastercard,amex,troy,iyzico'),
(7, 'Midtrans', 'midtrans', '', '', 'production', '', 'IDR', 0, 'visa,mastercard,amex,jcb,midtrans'),
(8, 'Mercado Pago', 'mercado_pago', '', '', 'production', '', 'BRL', 0, 'visa,mastercard,amex,discover,mercado_pago');

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL,
  `default_currency` varchar(30) DEFAULT 'USD',
  `allow_all_currencies_for_classied` tinyint(1) DEFAULT 1,
  `currency_converter` tinyint(1) DEFAULT 0,
  `auto_update_exchange_rates` tinyint(1) DEFAULT 1,
  `currency_converter_api` varchar(100) DEFAULT NULL,
  `currency_converter_api_key` varchar(255) DEFAULT NULL,
  `bank_transfer_enabled` tinyint(1) DEFAULT 0,
  `bank_transfer_accounts` text DEFAULT NULL,
  `cash_on_delivery_enabled` tinyint(1) DEFAULT 1,
  `price_per_day` bigint(20) DEFAULT 1,
  `price_per_month` bigint(20) DEFAULT 3,
  `free_product_promotion` tinyint(1) DEFAULT 0,
  `payout_paypal_enabled` tinyint(1) DEFAULT 1,
  `payout_bitcoin_enabled` tinyint(1) DEFAULT 0,
  `payout_iban_enabled` tinyint(1) DEFAULT 1,
  `payout_swift_enabled` tinyint(1) DEFAULT 1,
  `min_payout_paypal` bigint(20) DEFAULT 5000,
  `min_payout_bitcoin` bigint(20) DEFAULT 5000,
  `min_payout_iban` bigint(20) DEFAULT 5000,
  `min_payout_swift` bigint(20) DEFAULT 50000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `default_currency`, `allow_all_currencies_for_classied`, `currency_converter`, `auto_update_exchange_rates`, `currency_converter_api`, `currency_converter_api_key`, `bank_transfer_enabled`, `bank_transfer_accounts`, `cash_on_delivery_enabled`, `price_per_day`, `price_per_month`, `free_product_promotion`, `payout_paypal_enabled`, `payout_bitcoin_enabled`, `payout_iban_enabled`, `payout_swift_enabled`, `min_payout_paypal`, `min_payout_bitcoin`, `min_payout_iban`, `min_payout_swift`) VALUES
(1, 'USD', 1, 0, 0, NULL, NULL, 0, NULL, 0, 10, 100, 0, 1, 0, 1, 1, 5000, 5000, 5000, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payout_method` varchar(100) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT 'physical',
  `listing_type` varchar(20) DEFAULT 'sell_on_site',
  `sku` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `discount_rate` smallint(3) DEFAULT 0,
  `vat_rate` double DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_promoted` tinyint(1) DEFAULT 0,
  `promote_start_date` timestamp NULL DEFAULT NULL,
  `promote_end_date` timestamp NULL DEFAULT NULL,
  `promote_plan` varchar(100) DEFAULT NULL,
  `promote_day` int(11) DEFAULT NULL,
  `is_special_offer` tinyint(1) DEFAULT 0,
  `special_offer_date` timestamp NULL DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 1,
  `rating` varchar(50) DEFAULT '0',
  `pageviews` int(11) DEFAULT 0,
  `demo_url` varchar(1000) DEFAULT NULL,
  `external_link` varchar(1000) DEFAULT NULL,
  `files_included` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 1,
  `shipping_class_id` int(11) DEFAULT NULL,
  `shipping_delivery_time_id` int(11) DEFAULT NULL,
  `multiple_sale` tinyint(1) DEFAULT 1,
  `is_sold` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `is_draft` tinyint(1) DEFAULT 0,
  `is_free_product` tinyint(1) DEFAULT 0,
  `is_rejected` tinyint(1) DEFAULT 0,
  `reject_reason` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `lang_id` tinyint(4) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_license_keys`
--

CREATE TABLE `product_license_keys` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `license_key` varchar(500) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_settings`
--

CREATE TABLE `product_settings` (
  `id` int(11) NOT NULL,
  `marketplace_sku` tinyint(1) DEFAULT 1,
  `marketplace_variations` tinyint(1) DEFAULT 1,
  `marketplace_shipping` tinyint(1) DEFAULT 1,
  `marketplace_product_location` tinyint(1) DEFAULT 1,
  `classified_price` tinyint(1) DEFAULT 1,
  `classified_price_required` tinyint(1) DEFAULT 1,
  `classified_product_location` tinyint(1) DEFAULT 1,
  `classified_external_link` tinyint(1) DEFAULT 1,
  `physical_demo_url` tinyint(1) DEFAULT 0,
  `physical_video_preview` tinyint(1) DEFAULT 1,
  `physical_audio_preview` tinyint(1) DEFAULT 1,
  `digital_demo_url` tinyint(1) DEFAULT 1,
  `digital_video_preview` tinyint(1) DEFAULT 1,
  `digital_audio_preview` tinyint(1) DEFAULT 1,
  `digital_allowed_file_extensions` varchar(500) DEFAULT 'zip',
  `sitemap_frequency` varchar(30) DEFAULT 'monthly',
  `sitemap_last_modification` varchar(30) DEFAULT 'server_response',
  `sitemap_priority` varchar(30) DEFAULT 'automatically'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_settings`
--

INSERT INTO `product_settings` (`id`, `marketplace_sku`, `marketplace_variations`, `marketplace_shipping`, `marketplace_product_location`, `classified_price`, `classified_price_required`, `classified_product_location`, `classified_external_link`, `physical_demo_url`, `physical_video_preview`, `physical_audio_preview`, `digital_demo_url`, `digital_video_preview`, `digital_audio_preview`, `digital_allowed_file_extensions`, `sitemap_frequency`, `sitemap_last_modification`, `sitemap_priority`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '\"zip\"', 'daily', 'server_response', 'automatically');

-- --------------------------------------------------------

--
-- Table structure for table `promoted_transactions`
--

CREATE TABLE `promoted_transactions` (
  `id` int(11) NOT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `payment_amount` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `purchased_plan` varchar(255) DEFAULT NULL,
  `day_count` int(11) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quote_requests`
--

CREATE TABLE `quote_requests` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_title` varchar(500) DEFAULT NULL,
  `product_quantity` mediumint(9) DEFAULT 1,
  `seller_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `price_offered` bigint(20) DEFAULT NULL,
  `price_currency` varchar(20) DEFAULT NULL,
  `is_buyer_deleted` tinyint(1) DEFAULT 0,
  `is_seller_deleted` tinyint(1) DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  `order_product_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `is_completed` tinyint(1) DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests_messages`
--

CREATE TABLE `refund_requests_messages` (
  `id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_buyer` tinyint(1) NOT NULL DEFAULT 1,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` varchar(10000) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL,
  `role_name` text DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `is_super_admin` tinyint(1) DEFAULT 0,
  `is_default` tinyint(1) DEFAULT 0,
  `is_admin` tinyint(1) DEFAULT 0,
  `is_vendor` tinyint(1) DEFAULT 0,
  `is_member` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`id`, `role_name`, `permissions`, `is_super_admin`, `is_default`, `is_admin`, `is_vendor`, `is_member`) VALUES
(1, 'a:1:{i:0;a:2:{s:7:\"lang_id\";s:1:\"1\";s:4:\"name\";s:11:\"Super Admin\";}}', 'all', 1, 1, 1, 0, 0),
(2, 'a:1:{i:0;a:2:{s:7:\"lang_id\";s:1:\"1\";s:4:\"name\";s:6:\"Vendor\";}}', '2', 0, 1, 0, 1, 0),
(3, 'a:1:{i:0;a:2:{s:7:\"lang_id\";s:1:\"1\";s:4:\"name\";s:6:\"Member\";}}', '', 0, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `route_key` varchar(100) DEFAULT NULL,
  `route` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `route_key`, `route`) VALUES
(1, 'admin', 'admin'),
(2, 'blog', 'blog'),
(3, 'tag', 'tag'),
(4, 'quote_requests', 'quote-requests'),
(5, 'cart', 'cart'),
(6, 'shipping', 'shipping'),
(7, 'payment_method', 'payment-method'),
(8, 'payment', 'payment'),
(9, 'promote_payment_completed', 'promote-payment-completed'),
(10, 'orders', 'orders'),
(11, 'order_details', 'order-details'),
(12, 'order_completed', 'order-completed'),
(13, 'messages', 'messages'),
(14, 'conversation', 'conversation'),
(15, 'dashboard', 'dashboard'),
(16, 'profile', 'profile'),
(17, 'wishlist', 'wishlist'),
(18, 'settings', 'settings'),
(19, 'update_profile', 'update-profile'),
(20, 'followers', 'followers'),
(21, 'following', 'following'),
(22, 'sales', 'sales'),
(23, 'sale', 'sale'),
(24, 'product', 'product'),
(25, 'add_product', 'add-product'),
(26, 'start_selling', 'start-selling'),
(27, 'products', 'products'),
(28, 'product_details', 'product-details'),
(29, 'edit_product', 'edit-product'),
(30, 'pending_products', 'pending-products'),
(31, 'hidden_products', 'hidden-products'),
(32, 'latest_products', 'latest-products'),
(33, 'featured_products', 'featured-products'),
(34, 'drafts', 'drafts'),
(35, 'bulk_product_upload', 'bulk-product-upload'),
(36, 'downloads', 'downloads'),
(37, 'seller', 'seller'),
(38, 'earnings', 'earnings'),
(39, 'withdraw_money', 'withdraw-money'),
(40, 'payouts', 'payouts'),
(41, 'set_payout_account', 'set-payout-account'),
(42, 'comments', 'comments'),
(43, 'reviews', 'reviews'),
(44, 'category', 'category'),
(45, 'completed_sales', 'completed-sales'),
(46, 'shop_settings', 'shop-settings'),
(47, 'shipping_address', 'shipping-address'),
(48, 'social_media', 'social-media'),
(49, 'search', 'search'),
(50, 'register', 'register'),
(51, 'members', 'members'),
(52, 'forgot_password', 'forgot-password'),
(53, 'change_password', 'change-password'),
(54, 'reset_password', 'reset-password'),
(55, 'rss_feeds', 'rss-feeds'),
(56, 'terms_conditions', 'terms-conditions'),
(57, 'contact', 'contact'),
(58, 'select_membership_plan', 'select-membership-plan'),
(59, 'membership_payment_completed', 'membership-payment-completed'),
(60, 'payment_history', 'payment-history'),
(61, 'expired_products', 'expired-products'),
(62, 'cover_image', 'cover-image'),
(63, 'sold_products', 'sold-products'),
(64, 'shipping_settings', 'shipping-settings'),
(65, 'add_shipping_zone', 'add-shipping-zone'),
(66, 'edit_shipping_zone', 'edit-shipping-zone'),
(67, 'help_center', 'help-center'),
(68, 'tickets', 'tickets'),
(69, 'submit_request', 'submit-request'),
(70, 'ticket', 'ticket'),
(72, 'shops', 'shops'),
(73, 'cancelled_sales', 'cancelled-sales'),
(74, 'refund_requests', 'refund-requests'),
(75, 'coupons', 'coupons'),
(76, 'add_coupon', 'add-coupon'),
(77, 'edit_coupon', 'edit-coupon');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `site_font` smallint(6) DEFAULT 19,
  `dashboard_font` smallint(6) DEFAULT 22,
  `site_title` varchar(255) DEFAULT NULL,
  `homepage_title` varchar(255) DEFAULT 'Home',
  `site_description` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `facebook_url` varchar(500) DEFAULT NULL,
  `twitter_url` varchar(500) DEFAULT NULL,
  `instagram_url` varchar(500) DEFAULT NULL,
  `pinterest_url` varchar(500) DEFAULT NULL,
  `linkedin_url` varchar(500) DEFAULT NULL,
  `vk_url` varchar(500) DEFAULT NULL,
  `whatsapp_url` varchar(500) DEFAULT NULL,
  `telegram_url` varchar(500) DEFAULT NULL,
  `youtube_url` varchar(500) DEFAULT NULL,
  `about_footer` varchar(1000) DEFAULT NULL,
  `contact_text` text DEFAULT NULL,
  `contact_address` varchar(500) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `copyright` varchar(500) DEFAULT NULL,
  `cookies_warning` tinyint(1) DEFAULT 0,
  `cookies_warning_text` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `lang_id`, `site_font`, `dashboard_font`, `site_title`, `homepage_title`, `site_description`, `keywords`, `facebook_url`, `twitter_url`, `instagram_url`, `pinterest_url`, `linkedin_url`, `vk_url`, `whatsapp_url`, `telegram_url`, `youtube_url`, `about_footer`, `contact_text`, `contact_address`, `contact_email`, `contact_phone`, `copyright`, `cookies_warning`, `cookies_warning_text`, `created_at`) VALUES
(1, 1, 19, 22, 'Modesy - Marketplace - Classified Ads Script', 'Home', 'Modesy Index Page', 'index, home, modesy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Copyright 2022 Modesy - All Rights Reserved.', 0, NULL, '2021-02-20 22:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `country_id` varchar(20) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_classes`
--

CREATE TABLE `shipping_classes` (
  `id` int(11) NOT NULL,
  `name_array` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_delivery_times`
--

CREATE TABLE `shipping_delivery_times` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `option_array` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_zones`
--

CREATE TABLE `shipping_zones` (
  `id` int(11) NOT NULL,
  `name_array` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_zone_locations`
--

CREATE TABLE `shipping_zone_locations` (
  `id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `continent_code` varchar(10) DEFAULT NULL,
  `country_id` int(11) DEFAULT 0,
  `state_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_zone_methods`
--

CREATE TABLE `shipping_zone_methods` (
  `id` int(11) NOT NULL,
  `name_array` text DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `method_type` varchar(100) DEFAULT NULL,
  `flat_rate_cost_calculation_type` varchar(100) DEFAULT NULL,
  `flat_rate_cost` bigint(20) DEFAULT NULL,
  `flat_rate_class_costs_array` text DEFAULT NULL,
  `local_pickup_cost` bigint(20) DEFAULT NULL,
  `free_shipping_min_amount` bigint(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `lang_id` tinyint(4) DEFAULT 1,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `item_order` smallint(6) DEFAULT 1,
  `button_text` varchar(255) DEFAULT NULL,
  `animation_title` varchar(50) DEFAULT 'none',
  `animation_description` varchar(50) DEFAULT 'none',
  `animation_button` varchar(50) DEFAULT 'none',
  `image` varchar(255) DEFAULT NULL,
  `image_mobile` varchar(255) DEFAULT NULL,
  `text_color` varchar(30) DEFAULT '#ffffff',
  `button_color` varchar(30) DEFAULT '#222222',
  `button_text_color` varchar(30) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `storage_settings`
--

CREATE TABLE `storage_settings` (
  `id` int(11) NOT NULL,
  `storage` varchar(255) DEFAULT 'local',
  `aws_key` varchar(255) DEFAULT NULL,
  `aws_secret` varchar(255) DEFAULT NULL,
  `aws_bucket` varchar(255) DEFAULT NULL,
  `aws_region` varchar(255) DEFAULT 'us-west-2',
  `aws_base_url` varchar(1000) DEFAULT 'https://s3.amazonaws.com/'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `storage_settings`
--

INSERT INTO `storage_settings` (`id`, `storage`, `aws_key`, `aws_secret`, `aws_bucket`, `aws_region`, `aws_base_url`) VALUES
(1, 'local', NULL, NULL, NULL, NULL, 'https://s3.amazonaws.com/');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `support_subtickets`
--

CREATE TABLE `support_subtickets` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `is_support_reply` tinyint(1) DEFAULT 0,
  `storage` varchar(20) DEFAULT 'local',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT 0,
  `status` smallint(6) DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(30) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `payment_amount` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT 'name@domain.com',
  `email_status` tinyint(1) DEFAULT 0,
  `token` varchar(500) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` smallint(6) DEFAULT 3,
  `has_active_shop` tinyint(1) DEFAULT 0,
  `balance` bigint(20) DEFAULT 0,
  `number_of_sales` int(11) DEFAULT 0,
  `user_type` varchar(20) DEFAULT 'registered',
  `facebook_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `vkontakte_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `cover_image_type` varchar(30) DEFAULT 'full_width',
  `banned` tinyint(1) DEFAULT 0,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `about_me` varchar(5000) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `show_email` tinyint(1) DEFAULT 0,
  `show_phone` tinyint(1) DEFAULT 0,
  `show_location` tinyint(1) DEFAULT 0,
  `personal_website_url` varchar(500) DEFAULT NULL,
  `facebook_url` varchar(500) DEFAULT NULL,
  `twitter_url` varchar(500) DEFAULT NULL,
  `instagram_url` varchar(500) DEFAULT NULL,
  `pinterest_url` varchar(500) DEFAULT NULL,
  `linkedin_url` varchar(500) DEFAULT NULL,
  `vk_url` varchar(500) DEFAULT NULL,
  `youtube_url` varchar(500) DEFAULT NULL,
  `whatsapp_url` varchar(500) DEFAULT NULL,
  `telegram_url` varchar(500) DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `show_rss_feeds` tinyint(1) DEFAULT 0,
  `send_email_new_message` tinyint(1) DEFAULT 0,
  `is_active_shop_request` tinyint(1) DEFAULT 0,
  `vendor_documents` varchar(1000) DEFAULT NULL,
  `is_membership_plan_expired` tinyint(1) DEFAULT 0,
  `is_used_free_plan` tinyint(1) DEFAULT 0,
  `cash_on_delivery` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_membership_plans`
--

CREATE TABLE `users_membership_plans` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `plan_title` varchar(500) DEFAULT NULL,
  `number_of_ads` int(11) DEFAULT NULL,
  `number_of_days` int(11) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT 'USD',
  `is_free` tinyint(1) DEFAULT 0,
  `is_unlimited_number_of_ads` tinyint(1) DEFAULT 0,
  `is_unlimited_time` tinyint(1) DEFAULT 0,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `plan_status` tinyint(1) DEFAULT 0,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_payout_accounts`
--

CREATE TABLE `users_payout_accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payout_paypal_email` varchar(255) DEFAULT NULL,
  `payout_bitcoin_address` varchar(500) DEFAULT NULL,
  `iban_full_name` varchar(255) DEFAULT NULL,
  `iban_country_id` varchar(20) DEFAULT NULL,
  `iban_bank_name` varchar(255) DEFAULT NULL,
  `iban_number` varchar(500) DEFAULT NULL,
  `swift_full_name` varchar(255) DEFAULT NULL,
  `swift_address` varchar(500) DEFAULT NULL,
  `swift_state` varchar(255) DEFAULT NULL,
  `swift_city` varchar(255) DEFAULT NULL,
  `swift_postcode` varchar(100) DEFAULT NULL,
  `swift_country_id` varchar(20) DEFAULT NULL,
  `swift_bank_account_holder_name` varchar(255) DEFAULT NULL,
  `swift_iban` varchar(255) DEFAULT NULL,
  `swift_code` varchar(255) DEFAULT NULL,
  `swift_bank_name` varchar(255) DEFAULT NULL,
  `swift_bank_branch_city` varchar(255) DEFAULT NULL,
  `swift_bank_branch_country_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `label_names` text DEFAULT NULL,
  `variation_type` varchar(50) DEFAULT NULL,
  `insert_type` varchar(10) DEFAULT 'new',
  `option_display_type` varchar(30) DEFAULT 'text',
  `show_images_on_slider` tinyint(1) DEFAULT 0,
  `use_different_price` tinyint(1) DEFAULT 0,
  `is_visible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `variation_options`
--

CREATE TABLE `variation_options` (
  `id` int(11) NOT NULL,
  `variation_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `option_names` text DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `discount_rate` smallint(3) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `use_default_price` tinyint(1) NOT NULL DEFAULT 0,
  `no_discount` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abuse_reports`
--
ALTER TABLE `abuse_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ad_spaces`
--
ALTER TABLE `ad_spaces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_transfers`
--
ALTER TABLE `bank_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang_id` (`lang_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_post_id` (`post_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `blog_images`
--
ALTER TABLE `blog_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang_id` (`lang_id`),
  ADD KEY `idx_category_id` (`category_id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_post_id` (`post_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_visibility` (`visibility`),
  ADD KEY `idx_is_featured` (`is_featured`),
  ADD KEY `idx_show_products_on_index` (`show_products_on_index`),
  ADD KEY `idx_category_order` (`category_order`),
  ADD KEY `idx_featured_order` (`featured_order`),
  ADD KEY `idx_show_on_main_menu` (`show_on_main_menu`),
  ADD KEY `idx_tree_id` (`tree_id`),
  ADD KEY `idx_level` (`level`);

--
-- Indexes for table `categories_lang`
--
ALTER TABLE `categories_lang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_id` (`category_id`),
  ADD KEY `idx_lang_id` (`lang_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sender_id` (`sender_id`),
  ADD KEY `idx_receiver_id` (`receiver_id`);

--
-- Indexes for table `conversation_messages`
--
ALTER TABLE `conversation_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_conversation_id` (`conversation_id`),
  ADD KEY `idx_sender_id` (`sender_id`),
  ADD KEY `idx_receiver_id` (`receiver_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons_used`
--
ALTER TABLE `coupons_used`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_products`
--
ALTER TABLE `coupon_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields_category`
--
ALTER TABLE `custom_fields_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_id` (`category_id`),
  ADD KEY `idx_field_id` (`field_id`);

--
-- Indexes for table `custom_fields_options`
--
ALTER TABLE `custom_fields_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_field_id` (`field_id`),
  ADD KEY `idx_option_key` (`option_key`);

--
-- Indexes for table `custom_fields_options_lang`
--
ALTER TABLE `custom_fields_options_lang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_option_id` (`option_id`),
  ADD KEY `idx_lang_id` (`lang_id`);

--
-- Indexes for table `custom_fields_product`
--
ALTER TABLE `custom_fields_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_field_id` (`field_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_selected_option_id` (`selected_option_id`);

--
-- Indexes for table `digital_files`
--
ALTER TABLE `digital_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `digital_sales`
--
ALTER TABLE `digital_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_product_id` (`product_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_following_id` (`following_id`),
  ADD KEY `idx_follower_id` (`follower_id`);

--
-- Indexes for table `fonts`
--
ALTER TABLE `fonts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homepage_banners`
--
ALTER TABLE `homepage_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_is_main` (`is_main`);

--
-- Indexes for table `images_file_manager`
--
ALTER TABLE `images_file_manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `images_variation`
--
ALTER TABLE `images_variation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_variation_option_id` (`variation_option_id`),
  ADD KEY `idx_is_main` (`is_main`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`);

--
-- Indexes for table `knowledge_base`
--
ALTER TABLE `knowledge_base`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knowledge_base_categories`
--
ALTER TABLE `knowledge_base_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_translations`
--
ALTER TABLE `language_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang_id` (`lang_id`);

--
-- Indexes for table `location_cities`
--
ALTER TABLE `location_cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_country_id` (`country_id`),
  ADD KEY `idx_state_id` (`state_id`);

--
-- Indexes for table `location_countries`
--
ALTER TABLE `location_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_states`
--
ALTER TABLE `location_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_country_id` (`country_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`);

--
-- Indexes for table `membership_plans`
--
ALTER TABLE `membership_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_transactions`
--
ALTER TABLE `membership_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_number` (`order_number`),
  ADD KEY `idx_buyer_id` (`buyer_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_seller_id` (`seller_id`),
  ADD KEY `idx_buyer_id` (`buyer_id`),
  ADD KEY `idx_product_id` (`product_id`);

--
-- Indexes for table `order_shipping`
--
ALTER TABLE `order_shipping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payment_id` (`payment_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_product_id` (`product_id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_id` (`category_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_is_promoted` (`is_promoted`),
  ADD KEY `idx_visibility` (`visibility`),
  ADD KEY `idx_is_deleted` (`is_deleted`),
  ADD KEY `idx_is_draft` (`is_draft`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_price` (`price`),
  ADD KEY `idx_discount_rate` (`discount_rate`),
  ADD KEY `idx_is_special_offer` (`is_special_offer`),
  ADD KEY `idx_is_sold` (`is_sold`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_lang_id` (`lang_id`);

--
-- Indexes for table `product_license_keys`
--
ALTER TABLE `product_license_keys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_is_used` (`is_used`);

--
-- Indexes for table `product_settings`
--
ALTER TABLE `product_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promoted_transactions`
--
ALTER TABLE `promoted_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quote_requests`
--
ALTER TABLE `quote_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_seller_id` (`seller_id`),
  ADD KEY `idx_buyer_id` (`buyer_id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests_messages`
--
ALTER TABLE `refund_requests_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `shipping_classes`
--
ALTER TABLE `shipping_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `shipping_delivery_times`
--
ALTER TABLE `shipping_delivery_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `shipping_zones`
--
ALTER TABLE `shipping_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `shipping_zone_locations`
--
ALTER TABLE `shipping_zone_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zone_id` (`zone_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `shipping_zone_methods`
--
ALTER TABLE `shipping_zone_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zone_id` (`zone_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storage_settings`
--
ALTER TABLE `storage_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_subtickets`
--
ALTER TABLE `support_subtickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payment_id` (`payment_id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_banned` (`banned`);

--
-- Indexes for table `users_membership_plans`
--
ALTER TABLE `users_membership_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_payout_accounts`
--
ALTER TABLE `users_payout_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_is_visible` (`is_visible`);

--
-- Indexes for table `variation_options`
--
ALTER TABLE `variation_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_variation_id` (`variation_id`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abuse_reports`
--
ALTER TABLE `abuse_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ad_spaces`
--
ALTER TABLE `ad_spaces`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bank_transfers`
--
ALTER TABLE `bank_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_images`
--
ALTER TABLE `blog_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories_lang`
--
ALTER TABLE `categories_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversation_messages`
--
ALTER TABLE `conversation_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons_used`
--
ALTER TABLE `coupons_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_products`
--
ALTER TABLE `coupon_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_category`
--
ALTER TABLE `custom_fields_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_options`
--
ALTER TABLE `custom_fields_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_options_lang`
--
ALTER TABLE `custom_fields_options_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_product`
--
ALTER TABLE `custom_fields_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `digital_files`
--
ALTER TABLE `digital_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `digital_sales`
--
ALTER TABLE `digital_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fonts`
--
ALTER TABLE `fonts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `homepage_banners`
--
ALTER TABLE `homepage_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images_file_manager`
--
ALTER TABLE `images_file_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images_variation`
--
ALTER TABLE `images_variation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_base`
--
ALTER TABLE `knowledge_base`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_base_categories`
--
ALTER TABLE `knowledge_base_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `language_translations`
--
ALTER TABLE `language_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1333;

--
-- AUTO_INCREMENT for table `location_cities`
--
ALTER TABLE `location_cities`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_countries`
--
ALTER TABLE `location_countries`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_states`
--
ALTER TABLE `location_states`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_plans`
--
ALTER TABLE `membership_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_transactions`
--
ALTER TABLE `membership_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_shipping`
--
ALTER TABLE `order_shipping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_license_keys`
--
ALTER TABLE `product_license_keys`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_settings`
--
ALTER TABLE `product_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `promoted_transactions`
--
ALTER TABLE `promoted_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quote_requests`
--
ALTER TABLE `quote_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests_messages`
--
ALTER TABLE `refund_requests_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_classes`
--
ALTER TABLE `shipping_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_delivery_times`
--
ALTER TABLE `shipping_delivery_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_zones`
--
ALTER TABLE `shipping_zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_zone_locations`
--
ALTER TABLE `shipping_zone_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_zone_methods`
--
ALTER TABLE `shipping_zone_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storage_settings`
--
ALTER TABLE `storage_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_subtickets`
--
ALTER TABLE `support_subtickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_membership_plans`
--
ALTER TABLE `users_membership_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_payout_accounts`
--
ALTER TABLE `users_payout_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_options`
--
ALTER TABLE `variation_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
