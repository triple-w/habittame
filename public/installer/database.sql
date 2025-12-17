-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 06, 2025 at 04:53 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `estaty`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_sections`
--

CREATE TABLE `about_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `btn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years_of_expricence` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_sections`
--

INSERT INTO `about_sections` (`id`, `language_id`, `title`, `sub_title`, `client_text`, `description`, `btn_name`, `btn_url`, `years_of_expricence`, `created_at`, `updated_at`) VALUES
(1, 20, 'About Us', 'We Always Provide Your Favorite Destination', '5k+ Active Client’s', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora odio laborum magnam sequi, ducimus impedit eum eius quia obcaecati suscipit corrupti unde eaque illo fugit, maxime aliquid.</p>\r\n<p> </p>\r\n<p>Curabitur non nulla sit amet nisl tempus convallis quisac . Nulla porttitor accumsan tincidunt. Curabitur arcu erat, accumsan.</p>', 'About Us', 'https://example.com', 5, '2023-12-09 23:08:36', '2024-06-12 12:32:31'),
(2, 25, 'معلومات عنا', 'نوفّر لك وجهتك المفضلة دائمًا', '5 آلاف+ عميل نشط', '<p>ن ينتقد شخص ما أراد أن يشعر بالسعادة التي لا تشوبها عواقب أليمةلا يوجد منفذ إضافي. عصر ن ينتقد شخص ما أراد أن يشعر بالسعادة التي لا تشوبها عواقب أليمة يستخدم معرف الحمية الغذائية والنقل في.</p>\r\n<p><br>رضا العميل بنسبة 100%</p>\r\n<p>نحن دائما نشعر بالقلق إزاء لدينا<br>المشروع والعميل</p>\r\n<p><br>رضا العميل بنسبة 100%</p>\r\n<p>نحن دائما نشعر بالقلق إزاء لدينا<br>المشروع والعميل</p>', 'معلومات عنا', 'https://example.com', 2, '2024-03-27 00:10:45', '2024-06-14 07:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb3_unicode_ci,
  `details` text COLLATE utf8mb3_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1',
  `show_email_addresss` tinyint NOT NULL DEFAULT '1',
  `show_phone_number` tinyint NOT NULL DEFAULT '1',
  `show_contact_form` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `first_name`, `last_name`, `image`, `username`, `email`, `phone`, `password`, `address`, `details`, `status`, `show_email_addresss`, `show_phone_number`, `show_contact_form`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Leonard', 'Bourne', '66693d3c45263.png', 'admin', 'admin@example.com', '278964587', '$2y$10$7rcuMv8LG9adF09JnRjt.O35YL/3dkFWA7EBhBT.LOZvS07OaeDFm', 'House no 3, Road 5/c, sector 11, Uttara, Dhaka, Bangladesh', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Molestiae blanditiis minus tempora quibusdam quas quo magni, repellat sit? Adipisci accusantium quasi autem tempora nemo aspernatur tenetur repellat numquam sed cupiditate.', 1, 1, 1, 1, NULL, '2024-06-12 06:17:20'),
(10, 6, 'Abu', 'Farhan', '65a8b757a8e70.png', 'admin2', 'admin1@example.com', NULL, '$2y$10$oISo31x6WkoMa9u5t1sPhuc/YwPQ4AYoBgS88WDX6qOAqN5FS4SaW', NULL, NULL, 1, 1, 1, 1, '2024-01-17 23:29:59', '2024-01-17 23:29:59');

-- --------------------------------------------------------

--
-- Table structure for table `admin_infos`
--

CREATE TABLE `admin_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_infos`
--

INSERT INTO `admin_infos` (`id`, `admin_id`, `language_id`, `first_name`, `last_name`, `country`, `city`, `state`, `zipcode`, `address`, `details`, `created_at`, `updated_at`) VALUES
(1, 1, 20, 'Alex', 'Daddario', 'USA', 'Demra, Dhaka.', 'Texas', NULL, NULL, NULL, '2024-02-05 04:31:07', '2024-06-12 06:16:00'),
(2, 1, 24, 'Abu', 'Farhan', 'Bangladesh', 'Demra, Dhaka.', 'Dhaka', '1361', '11/64 Dogair Bazar', 'asdf', '2024-02-05 04:31:07', '2024-02-05 04:32:40'),
(3, 1, 25, 'أليكس', 'داداريو', 'الولايات المتحدة الأمريكية', NULL, 'تكساس', NULL, NULL, NULL, '2024-06-12 06:16:00', '2024-06-12 06:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint UNSIGNED NOT NULL,
  `ad_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `resolution_type` smallint UNSIGNED NOT NULL COMMENT '1 => 300 x 250, 2 => 300 x 600, 3 => 728 x 90',
  `image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `slot` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `views` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `ad_type`, `resolution_type`, `image`, `url`, `slot`, `views`, `created_at`, `updated_at`) VALUES
(7, 'banner', 3, '65bf7088a2c9f.png', 'http://example.com/', NULL, 4, '2021-08-15 22:44:47', '2024-02-04 05:10:00'),
(8, 'banner', 2, '65bf704fb05c6.png', 'http://example.com/', NULL, 0, '2021-08-15 22:45:21', '2024-02-04 05:09:03'),
(9, 'banner', 1, '65bf6fee56fbd.png', 'http://example.com/', NULL, 0, '2021-08-15 23:12:31', '2024-02-04 05:07:26'),
(10, 'banner', 1, '65bf7005b181d.png', 'http://example.com/', NULL, 2, '2021-08-15 23:13:44', '2024-02-04 05:07:49'),
(11, 'banner', 2, '65bf703742894.png', 'http://example.com/', NULL, 2, '2021-08-15 23:15:14', '2024-02-04 05:08:39'),
(12, 'banner', 1, '65bf5a21d896f.png', 'http://example.com/', NULL, 1, '2021-08-15 23:16:41', '2024-02-04 03:34:25'),
(13, 'banner', 3, '65bf707d02fb5.png', 'http://example.com/', NULL, 1, '2021-08-17 04:52:09', '2024-02-04 05:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `show_email_addresss` tinyint NOT NULL DEFAULT '1',
  `show_phone_number` tinyint NOT NULL DEFAULT '1',
  `show_contact_form` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `vendor_id`, `username`, `email`, `password`, `phone`, `image`, `status`, `show_email_addresss`, `show_phone_number`, `show_contact_form`, `created_at`, `updated_at`) VALUES
(19, 35, 'brock_drury', 'vayabaj671@jadsys.com', '$2y$10$5P7awICCTamA3aihg6ZTqe.0Y6BH9cQKdW.ticRjDciteH7iCRLNS', 24651562, '6669404b98b1b.png', 1, 1, 1, 1, '2024-06-12 06:29:31', '2024-06-13 11:27:12'),
(20, 35, 'cooper_nicolle', 'cooper_nicolle@example.com', '$2y$10$C/y2WeUi2CSdf5hnOtV0ruT0YhJGIwmSUlQZsiY6wzOAvQ/qyIhaK', 54546354, '6669409cbd993.jpg', 1, 1, 1, 1, '2024-06-12 06:30:52', '2024-06-13 11:33:19'),
(21, 0, 'rendall', 'alex _rendall@example.com', '$2y$10$gNb9XK7baGBzdhM3SKzH1.WFzSEKkwOAHL/tCPdQJGB2gD5dOr26G', 26454285, '6669428f99932.png', 1, 1, 1, 1, '2024-06-12 06:39:11', '2025-11-05 12:13:08'),
(22, 39, 'brayden', 'brayden354@example.com', '$2y$10$bYu3MDvbTi1rwMH/78krqebjf5rWoOOH/7rScGOECc0Wj/C56J756', 45616541, '6669432319a9c.png', 1, 1, 1, 1, '2024-06-12 06:41:39', '2024-06-13 12:15:59'),
(23, 36, 'blake_nerli', 'blake_nerli@example.com', '$2y$10$Yr0.qUpaB88Zt9G76VEL4ODBGDd5RMQLJV4sAQTRhthuplWQg7TOm', 56785634, '6669440cccdaf.png', 1, 1, 1, 1, '2024-06-12 06:45:32', '2024-06-13 11:59:37'),
(24, 35, 'cameron', 'cameron@example.com', '$2y$10$njD93FUbOGf3jAjnWLs4WOEJ4DyFHagkEEtZkzPJK85cwk/WOT58S', 5623587, '666946ac95776.jpg', 1, 1, 1, 1, '2024-06-12 06:56:44', '2024-06-13 11:48:31'),
(25, 38, 'jamie_boag', 'jamie_boag@example.com', '$2y$10$rXWBY.SvGAUmT6CII4/NsuPopdJifa8cQKuspWibefnh2JQGv.Vse', 5645646, '66694b36416b2.jpg', 1, 1, 1, 1, '2024-06-12 07:16:06', '2024-06-13 12:09:05'),
(26, 0, 'stieglitz', 'stieglitz@example.com', '$2y$10$flLfRx7F89LHfEAn9lGgjOFEt5DE/SUYONRk1TaGXZAbk3g4uI89m', 2461632, '666ac2e39a524.png', 1, 1, 1, 1, '2024-06-13 09:58:59', '2024-06-13 10:31:18'),
(27, 0, 'morten', 'norgaard@example.com', '$2y$10$pRrU58AHiYU47VyOq/ci0u..cGpxHlsdwnRxhJVjBF7.X1cpqUWZu', 57469465, '666ac353140a8.png', 1, 1, 1, 1, '2024-06-13 10:00:51', '2024-06-13 10:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `agent_infos`
--

CREATE TABLE `agent_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `agent_id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `zip_code` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_infos`
--

INSERT INTO `agent_infos` (`id`, `agent_id`, `language_id`, `first_name`, `last_name`, `country`, `state`, `city`, `address`, `details`, `zip_code`, `created_at`, `updated_at`) VALUES
(30, 19, 20, 'Brock', 'Drury', 'USA', 'Miami', 'Homestead', 'Main Street Homestead, FL 34030', 'Drury has been living in Miami and selling Real Estate for the past 28 years. She specializes in Key Biscayne, Brickell, and Sunny Isles. She is in the top half of the top 1% of Real Estate agents nationwide. As a multi-million dollar Top Producer and Diamond level Member, she is a reliable and loyal agent who cares about her clientele. She puts their needs above anything, allowing her to form close, personal relationships, and eventually good friendships, with the people she works with. Because she has been living in Miami for 27 years, she has witnessed the city grow and expand into the incredible Metropolitan city it has become today. She is an expert, and extremely knowledgeable on all things Real Estate. Additionally, she is fluent in Spanish, English and Portuguese, allowing her to work with a broad range of people.', NULL, '2024-06-12 06:29:31', '2024-06-13 11:27:12'),
(31, 19, 25, 'بروك', 'دروري', 'الولايات المتحدة الأمريكية', 'ميامي', 'هومستيد', 'مين ستريت هومستيد، فلوريدا 43030', 'يعيش دروري في ميامي ويبيع العقارات منذ 28 عامًا. وهي متخصصة في بريكل وصني آيلز. إنها ضمن النصف العلوي من أفضل 1% من وكلاء العقارات على مستوى البلاد. بصفتها منتجة رائدة تبلغ قيمتها ملايين الدولارات وعضوة على مستوى الماس، فهي وكيلة موثوقة ومخلصة تهتم بعملائها. إنها تضع احتياجاتهم فوق أي شيء، مما يسمح لها بتكوين علاقات شخصية وثيقة، وفي النهاية صداقات جيدة، مع الأشخاص الذين تعمل معهم. ولأنها تعيش في ميامي منذ 27 عامًا، فقد شهدت نمو المدينة وتوسعها لتصبح المدينة الحضرية المذهلة التي أصبحت عليها اليوم. إنها خبيرة وذو معرفة كبيرة بكل ما يتعلق بالعقارات. بالإضافة إلى ذلك، فهي تتحدث الإسبانية والإنجليزية والبرتغالية بطلاقة، مما يسمح لها بالعمل مع مجموعة واسعة من الأشخاص.', NULL, '2024-06-12 06:29:31', '2024-06-13 11:27:12'),
(32, 20, 20, 'Cooper', 'icolle', 'USA', 'Miami', 'Homestead', 'Main Street  Homestead, FL 33030', 'Turn-key Unit!! Upgraded 1 BED + 1.5 BATHS at the legendary Seacoast Condo built by iconic architect Morris Lapidus. Partial ocean views. Features brand new double glass impact hurricane windows and doors, porcelain floors, marble bathrooms. Large walking closet. 1 parking included. Situated in the heart of Miami Beach on \"Millionaires Row\" Seacoast Condo has 4 acres of vast grounds featuring one majestic fountain lobby, a 6,000 SQFT state of the art gym, pristine gardens and tikki bar area, lounge chairs & umbrellas service at the beach and two new barbecues cabanas. There is a grocery market at the lobby area and an events ballroom. Private boat dock marinas. Min 30-day rentals. Equal Housing Opportunity.', NULL, '2024-06-12 06:30:52', '2024-06-13 11:33:19'),
(33, 20, 25, 'كوبر', 'كلية', 'الولايات المتحدة الأمريكية', 'ميامي', 'هومستيد', 'مين ستريت هومستيد، فلوريدا', 'وحدة تسليم المفتاح!! ترقية غرفة نوم واحدة + 1.5 حمام في شقة Seacoast Condo الأسطورية التي بناها المهندس المعماري الشهير موريس لابيدوس. إطلالات جزئية على المحيط. تتميز بنوافذ وأبواب زجاجية مزدوجة جديدة تمامًا مقاومة للإعصار وأرضيات بورسلين وحمامات رخامية. خزانة مشي كبيرة. 1 موقف سيارات متضمن. يقع في قلب ميامي بيتش في شارع المليونيرات، ويحتوي على 4 أفدنة من الأراضي الشاسعة التي تضم ردهة نافورة مهيبة وصالة ألعاب رياضية حديثة بمساحة 6000 قدم مربع وحدائق نقية ومنطقة بار تيكي وخدمة كراسي الاستلقاء والمظلات على الشاطئ. واثنين من كابانات الشواء الجديدة يوجد سوق بقالة في منطقة الردهة وقاعة حفلات خاصة لإيجار القوارب لمدة 30 يومًا.', NULL, '2024-06-12 06:30:52', '2024-06-13 11:33:19'),
(34, 21, 20, 'Alex', 'Rendall', 'USA', NULL, NULL, 'Miami, FL', 'Alex Rendall  is a highly experienced, multilingual real estate professional specializing in global luxury markets spanning residential and commercial acquisitions. An avid seller and investor, Bozana knows the ins and outs of the business and works fiercely to negotiate the best outcome no matter which side you’re on.\r\n\r\nHer keen eye for global and domestic business deals has taken her all over—from Dubrovnik, Croatia to Toronto, Canada to Beverly Hills, California to Miami, Florida where she continues to influence the luxury real estate market. With residences around the world and successful businesses in several of the country’s largest affluent sectors, Bozana is uniquely positioned to shepherd clients in high-yielding investments.\r\n\r\nAs CEO of Creative Forces - Bozana connects with high-net-worth individuals and luxury brands around the globe. She works tirelessly to generate new business and seek out exciting opportunities for clients. From organizing engaging sales events to participating in luxury showcases to tapping into her vast client base, Bozana’s active role in the community translates to unequivocal success for every person she engages with.\r\n\r\nIn her spare time, Bozana enjoys traveling the world, immersing herself in different cultures, and meeting new people. She’s involved in the arts and has been instrumental in the development of prominent cultural districts, where she also owns a Landmark Hotel and a thriving private bar and restaurant. She takes a no-nonsense approach to life and business, valuing honesty and integrity above all.\r\n\r\nYou can trust Bozana to remain transparent and committed to selling your property at the highest value or finding you the home of your dreams at the right price. With decades of experience and unparalleled expertise in residential and commercial real estate, Bozana is the solution-driven advocate you want on your side.', NULL, '2024-06-12 06:39:11', '2024-06-13 10:33:25'),
(35, 21, 25, 'أليكس', 'ريندال', 'الولايات المتحدة الأمريكية', NULL, NULL, 'ميامي، FL', 'يتمتع Alex Rendall بخبرة عالية ومتخصص في مجال العقارات ومتعدد اللغات ومتخصص في الأسواق العالمية الفاخرة التي تشمل عمليات الاستحواذ السكنية والتجارية. بصفته بائعًا ومستثمرًا متحمسًا، يعرف بوزانا خصوصيات وعموميات العمل ويعمل بجهد للتفاوض على أفضل النتائج بغض النظر عن الجانب الذي تقف فيه.\r\n\r\nلقد أخذتها نظرتها الثاقبة للصفقات التجارية العالمية والمحلية في كل مكان - من دوبروفنيك، كرواتيا إلى تورونتو، كندا إلى بيفرلي هيلز، كاليفورنيا إلى ميامي، فلوريدا حيث تواصل التأثير على سوق العقارات الفاخرة. مع وجود مساكن في جميع أنحاء العالم وشركات ناجحة في العديد من أكبر القطاعات الغنية في البلاد، تتمتع بوزانا بموقع فريد لرعاية العملاء في الاستثمارات ذات العائد المرتفع.\r\n\r\nبصفته الرئيس التنفيذي لشركة Creative Forces - يتواصل بوزانا مع الأفراد ذوي الثروات العالية والعلامات التجارية الفاخرة في جميع أنحاء العالم. إنها تعمل بلا كلل لتوليد أعمال جديدة والبحث عن فرص مثيرة للعملاء. من تنظيم أحداث المبيعات الجذابة إلى المشاركة في المعارض الفاخرة إلى الاستفادة من قاعدة عملائها الواسعة، يُترجم دور بوزانا النشط في المجتمع إلى نجاح لا لبس فيه لكل شخص تتعامل معه.\r\n\r\nتستمتع بوزانا في أوقات فراغها بالسفر حول العالم والانغماس في ثقافات مختلفة والتعرف على أشخاص جدد. لقد انخرطت في الفنون وكان لها دور فعال في تطوير المناطق الثقافية البارزة، حيث تمتلك أيضًا فندق لاندمارك وبارًا خاصًا ومطعمًا مزدهرًا. إنها تتبع نهجًا لا معنى له في الحياة والعمل، وتقدر الصدق والنزاهة قبل كل شيء.\r\n\r\nيمكنك الوثوق في لتظل شفافة وملتزمة ببيع الممتلكات الخاصة بك بأعلى قيمة أو العثور على منزل أحلامك بالسعر المناسب. مع عقود من الخبرة والخبرة التي لا مثيل لها في مجال العقارات السكنية والتجارية، يعد هو المدافع المبني على الحلول الذي تريده إلى جانبك.', NULL, '2024-06-12 06:39:11', '2024-06-13 10:33:25'),
(36, 22, 20, 'Brayden', 'Isaacson', 'USA', 'Texas', 'San Antonio', '123 Alamo Plaza San Antonio, TX 78205', 'Brayden Isaacson was born in Colombia and moved to the United States in 2001 at the age of 20, in pursuit of a better future. He initially took a job working at a cafeteria in a Miami hotel. Noticing construction taking off in 2002 he looked for a way into the real estate industry and found work with investors who were purchasing, remodeling, and selling single family homes in the Tampa Bay area.\r\n\r\nMiguel immediately fell in love with the business, and quickly learned from the investors who became mentors to him. They saw his potential and within a short time he was managing over 150 properties in Tampa Bay, Orlando, and Jacksonville, Florida while becoming a Residential Real Estate Appraiser until opening his own practice.\r\n\r\nSoon after became very interested in helping families achieve their home dreams and goals for what he became a Sales Associate and then a Top Producer Broker achieving the highest sales award over four consecutive years during his time at Weichert, Realtors - Best Beach. He is now ranked the #1 agent in sales for Century 21 KoRes and a member of Masters Emerald an elite group of high producing professionals for Century 21 in the country.\r\n\r\nMiguel’s top skills include Spanish/English fluent, quality negotiation skills MCNE (Master Certified Negotiation Expert) finding value in complex properties and hands on team ready to resolve and cater the most complex transaction or client’s need.\r\n\r\nIn his free time Miguel enjoys spending time with his family, traveling, little league, practicing CrossFit, soccer and triathlons.', NULL, '2024-06-12 06:41:39', '2024-06-13 12:15:59'),
(37, 22, 25, 'Brayden', 'Isaacson', 'الولايات المتحدة الأمريكية', 'تكساس', 'سان أنطونيو', '123 ألامو بلازا، سان أنطونيو، تكساس 78205', 'ولد أوسكار إيدي في كولومبيا وانتقل إلى الولايات المتحدة في عام 2001 عن عمر 20 عامًا، سعيًا وراء مستقبل أفضل. تولى في البداية وظيفة العمل في كافتيريا في أحد فنادق ميامي. لاحظ انطلاق أعمال البناء في عام 2002، فبحث عن طريقة للدخول في صناعة العقارات ووجد عملاً مع المستثمرين الذين كانوا يشترون ويعيدون تصميم وبيع منازل الأسرة الواحدة في منطقة خليج تامبا.\r\n\r\nوقع ميغيل على الفور في حب هذا العمل، وسرعان ما تعلم من المستثمرين الذين أصبحوا مرشدين له. لقد رأوا إمكاناته وفي غضون وقت قصير كان يدير أكثر من 150 عقارًا في خليج تامبا وأورلاندو وجاكسونفيل بولاية فلوريدا بينما أصبح مثمنًا للعقارات السكنية حتى افتتاح عيادته الخاصة.\r\n\r\nوبعد فترة وجيزة أصبح مهتمًا جدًا بمساعدة العائلات على تحقيق أحلامهم وأهدافهم المنزلية حيث أصبح مساعد مبيعات ثم وسيطًا من أفضل المنتجين محققًا أعلى جائزة مبيعات على مدار أربع سنوات متتالية خلال فترة وجوده.\r\n\r\nتشمل مهارات ميغيل العليا التحدث باللغة الإسبانية/الإنجليزية بطلاقة، ومهارات تفاوض عالية الجودة، وخبير تفاوض معتمد رئيسي يجد القيمة في العقارات المعقدة وفريق عمل جاهز لحل وتلبية المعاملات الأكثر تعقيدًا أو احتياجات العميل.\r\n\r\nفي أوقات فراغه، يستمتع ميغيل بقضاء الوقت مع عائلته، والسفر، وممارسة الدوري الصغير، وممارسة رياضة الكروس فيت، وكرة القدم، والسباقات الثلاثية.', NULL, '2024-06-12 06:41:39', '2024-06-13 12:15:59'),
(38, 23, 20, 'Blake', 'Nerli', 'USA', 'Texas', 'San Antonio', '123 Alamo Plaza San Antonio, TX 78205', 'Blake was born in Colombia and moved to the United States in 2001 at the age of 20, in pursuit of a better future. He initially took a job working at a cafeteria in a Miami hotel. Noticing construction taking off in 2002 he looked for a way into the real estate industry and found work with investors who were purchasing, remodeling, and selling single family homes in the Tampa Bay area.\r\n\r\nMiguel immediately fell in love with the business, and quickly learned from the investors who became mentors to him. They saw his potential and within a short time he was managing over 150 properties in Tampa Bay, Orlando, and Jacksonville, Florida while becoming a Residential Real Estate Appraiser until opening his own practice.\r\n\r\nSoon after became very interested in helping families achieve their home dreams and goals for what he became a Sales Associate and then a Top Producer Broker achieving the highest sales award over four consecutive years during his time at Weichert, Realtors - Best Beach. He is now ranked the #1 agent in sales for Century 21 KoRes and a member of Masters Emerald an elite group of high producing professionals for Century 21 in the country.\r\n\r\nMiguel’s top skills include Spanish/English fluent, quality negotiation skills MCNE (Master Certified Negotiation Expert) finding value in complex properties and hands on team ready to resolve and cater the most complex transaction or client’s need.\r\n\r\nIn his free time Miguel enjoys spending time with his family, traveling, little league, practicing CrossFit, soccer and triathlons.', NULL, '2024-06-12 06:45:32', '2024-06-13 11:59:37'),
(39, 23, 25, 'Blake', 'Nerli', 'الولايات المتحدة الأمريكية', 'تكساس', 'سان أنطونيو', '123 ألامو بلازا\r\nسان أنطونيو، تكساس 78205', 'ولد أوسكار إيدي في كولومبيا وانتقل إلى الولايات المتحدة في عام 2001 عن عمر 20 عامًا، سعيًا وراء مستقبل أفضل. تولى في البداية وظيفة العمل في كافتيريا في أحد فنادق ميامي. لاحظ انطلاق أعمال البناء في عام 2002، فبحث عن طريقة للدخول في صناعة العقارات ووجد عملاً مع المستثمرين الذين كانوا يشترون ويعيدون تصميم وبيع منازل الأسرة الواحدة في منطقة خليج تامبا.\r\n\r\nوقع ميغيل على الفور في حب هذا العمل، وسرعان ما تعلم من المستثمرين الذين أصبحوا مرشدين له. لقد رأوا إمكاناته وفي غضون وقت قصير كان يدير أكثر من 150 عقارًا في خليج تامبا وأورلاندو وجاكسونفيل بولاية فلوريدا بينما أصبح مثمنًا للعقارات السكنية حتى افتتاح عيادته الخاصة.\r\n\r\nوبعد فترة وجيزة أصبح مهتمًا جدًا بمساعدة العائلات على تحقيق أحلامهم وأهدافهم المنزلية حيث أصبح مساعد مبيعات ثم وسيطًا من أفضل المنتجين محققًا أعلى جائزة مبيعات على مدار أربع سنوات متتالية خلال فترة وجوده.\r\n\r\nتشمل مهارات ميغيل العليا التحدث باللغة الإسبانية/الإنجليزية بطلاقة، ومهارات تفاوض عالية الجودة، وخبير تفاوض معتمد رئيسي يجد القيمة في العقارات المعقدة وفريق عمل جاهز لحل وتلبية المعاملات الأكثر تعقيدًا أو احتياجات العميل.\r\n\r\nفي أوقات فراغه، يستمتع ميغيل بقضاء الوقت مع عائلته، والسفر، وممارسة الدوري الصغير، وممارسة رياضة الكروس فيت، وكرة القدم، والسباقات الثلاثية.', NULL, '2024-06-12 06:45:32', '2024-06-13 11:59:37'),
(40, 24, 20, 'Cameron', 'Schmella', 'USA', 'Miami', 'Homestead', 'Key Biscayne, FL', 'Meet Schmella , one of the most accomplished Realtors affiliated with Douglas Elliman, a dominant force in the global real estate market, and the number one firm in the Miami area. With an impressive 30-year track record in South Florida real estate, Teddy proudly holds a position as one of the top commercial agents, and is among the top 8% of the 7,000+ Douglas Elliman agents as of 2022.\r\n\r\nAs a Miami native, Teddy brings an intimate understanding of the local market. Over the past three decades, Teddy has established a robust network of clients that includes buyers, sellers, investors, and many high-net-worth individuals, making him a trusted figure in the ever-evolving South Florida real estate landscape.\r\n\r\nTeddy\'s expertise extends to facilitating successful transactions with hundreds of families, successful investors, and top business professionals in the lively Miami Beach area. His commitment to excellence and wealth of experience ensures a seamless process for every client, no matter what the needs.\r\n\r\nWhether you\'re contemplating a purchase, sale, or investment, Teddy invites you to explore the difference the right representation can make.\r\n\r\nReach out today and let Teddy Fernandez guide you in transforming your real estate aspirations into reality.', NULL, '2024-06-12 06:56:44', '2024-06-13 11:48:31'),
(41, 24, 25, 'Cameron', 'Schmella', 'الولايات المتحدة الأمريكية', 'ميامي', 'هومستيد', 'كي بيسكين، فلوريدا', 'تعرف على Schmella، أحد أفضل السماسرة التابعين لـ Douglas Elliman، القوة المهيمنة في سوق العقارات العالمية، والشركة الأولى في منطقة ميامي. بفضل سجل حافل يمتد على مدار 30 عامًا في العقارات في جنوب فلوريدا، يفخر تيدي بمكانته كواحد من أفضل الوكلاء التجاريين، وهو من بين أفضل 8% من وكلاء دوجلاس إليمان الذين يزيد عددهم عن 7000 وكيل اعتبارًا من عام 2022.\r\n\r\nبصفته أحد مواطني ميامي، يتمتع تيدي بفهم عميق للسوق المحلية. على مدى العقود الثلاثة الماضية، أنشأ تيدي شبكة قوية من العملاء تشمل المشترين والبائعين والمستثمرين والعديد من الأفراد ذوي الثروات العالية، مما جعله شخصية موثوقة في المشهد العقاري المتطور باستمرار في جنوب فلوريدا.\r\n\r\nتمتد خبرة تيدي إلى تسهيل المعاملات الناجحة مع مئات العائلات والمستثمرين الناجحين وكبار محترفي الأعمال في منطقة ميامي بيتش النابضة بالحياة. ويضمن التزامه بالتميز وخبرته الوفيرة عملية سلسة لكل عميل، بغض النظر عن احتياجاته.\r\n\r\nسواء كنت تفكر في الشراء أو البيع أو الاستثمار، يدعوك تيدي لاستكشاف الفرق الذي يمكن أن يحدثه التمثيل الصحيح.\r\n\r\nتواصل معنا اليوم ودع تيدي فرنانديز يرشدك في تحويل تطلعاتك العقارية إلى واقع.', NULL, '2024-06-12 06:56:44', '2024-06-13 11:48:31'),
(42, 25, 20, 'Jamie', 'Boag', 'USA', 'Texas', 'San Antonio', '123 Alamo Plaza\r\nSan Antonio, TX 78205', 'Jamie Boag was born in Colombia and moved to the United States in 2001 at the age of 20, in pursuit of a better future. He initially took a job working at a cafeteria in a Miami hotel. Noticing construction taking off in 2002 he looked for a way into the real estate industry and found work with investors who were purchasing, remodeling, and selling single family homes in the Tampa Bay area.\r\n\r\nMiguel immediately fell in love with the business, and quickly learned from the investors who became mentors to him. They saw his potential and within a short time he was managing over 150 properties in Tampa Bay, Orlando, and Jacksonville, Florida while becoming a Residential Real Estate Appraiser until opening his own practice.\r\n\r\nSoon after became very interested in helping families achieve their home dreams and goals for what he became a Sales Associate and then a Top Producer Broker achieving the highest sales award over four consecutive years during his time at Weichert, Realtors - Best Beach. He is now ranked the #1 agent in sales for Century 21 KoRes and a member of Masters Emerald an elite group of high producing professionals for Century 21 in the country.\r\n\r\nMiguel’s top skills include Spanish/English fluent, quality negotiation skills MCNE (Master Certified Negotiation Expert) finding value in complex properties and hands on team ready to resolve and cater the most complex transaction or client’s need.\r\n\r\nIn his free time Miguel enjoys spending time with his family, traveling, little league, practicing CrossFit, soccer and triathlons.', NULL, '2024-06-12 07:16:06', '2024-06-13 12:09:05'),
(43, 25, 25, 'Jamie', 'Boag', 'الولايات المتحدة الأمريكية', 'تكساس', 'تكساس', '123 ألامو بلازا\r\nسان أنطونيو، تكساس 78205', 'ولد أوسكار إيدي في كولومبيا وانتقل إلى الولايات المتحدة في عام 2001 عن عمر 20 عامًا، سعيًا وراء مستقبل أفضل. تولى في البداية وظيفة العمل في كافتيريا في أحد فنادق ميامي. لاحظ انطلاق أعمال البناء في عام 2002، فبحث عن طريقة للدخول في صناعة العقارات ووجد عملاً مع المستثمرين الذين كانوا يشترون ويعيدون تصميم وبيع منازل الأسرة الواحدة في منطقة خليج تامبا.\r\n\r\nوقع ميغيل على الفور في حب هذا العمل، وسرعان ما تعلم من المستثمرين الذين أصبحوا مرشدين له. لقد رأوا إمكاناته وفي غضون وقت قصير كان يدير أكثر من 150 عقارًا في خليج تامبا وأورلاندو وجاكسونفيل بولاية فلوريدا بينما أصبح مثمنًا للعقارات السكنية حتى افتتاح عيادته الخاصة.\r\n\r\nبعد فترة وجيزة أصبح مهتمًا جدًا بمساعدة العائلات على تحقيق أحلامهم وأهدافهم المنزلية حيث أصبح مساعد مبيعات ثم وسيطًا من أفضل المنتجين محققًا أعلى جائزة مبيعات على مدار أربع سنوات متتالية خلال فترة وجوده في Weichert، Realtors - Best Beach. لقد تم تصنيفه الآن كوكيل رقم 1 في المبيعات لشركة Century 21 KoRes وعضو في Masters Emerald، وهي مجموعة نخبة من المحترفين ذوي الإنتاج العالي لشركة Century 21 في البلاد.\r\n\r\nتشمل مهارات ميغيل العليا إتقان اللغة الإسبانية/الإنجليزية ومهارات التفاوض عالية الجودة MCNE (خبير تفاوض رئيسي معتمد) حيث يجد القيمة في العقارات المعقدة ويعمل على فريق جاهز لحل وتلبية المعاملات الأكثر تعقيدًا أو احتياجات العميل.\r\n\r\nفي أوقات فراغه، يستمتع ميغيل بقضاء الوقت مع عائلته، والسفر، وممارسة الدوري الصغير، وممارسة رياضة الكروس فيت، وكرة القدم، والسباقات الثلاثية.', NULL, '2024-06-12 07:16:06', '2024-06-13 12:09:05'),
(44, 26, 20, 'Jaxon', 'Stieglitz', 'Canada', NULL, NULL, 'Plantation, FL', 'Stieglitz is a South Florida real estate agent, Host of the American Dream TV show which also aires on HGTV, multilingual public speaker and a former regional property manager support who managed 22 million dollars in real estate assets from 2010-2019. As a real estate consultant with an outstanding expertise, in depth training and knowledge about all aspects in fields such as property management, real estate investing, rehabilitation of properties, buying, flipping and selling; with assertive real estate sales skills enhanced by top of the line marketing abilities, and fluency in 3 different languages (English, Spanish and Portuguese), Mia’s excellent negotiation skills guide every buyer and seller through Real Estate obstacles leading them happily to the closing table.\r\n\r\nSELLERS\r\n\r\nWhen working with Mia, you can expect her and her team to negotiate top dollar for your property to help you achieve your goals and objectives while selling your home in the least amount of time due to the exceptional service, a world-class marketing plan and the cutting edge technology that are provided to you and your family. Each member of our listing staff is trained to make the process easy from start to finish. Once you meet with Mia, you will feel confident that you are pricing your property at a competitive price and that you will be updated throughout the entire transaction. Our goal is for you to feel comfortable that we are on your team and that it is a WIN-WIN situation for all parties involved.', NULL, '2024-06-13 09:58:59', '2024-06-13 10:31:18'),
(45, 26, 25, 'Jaxon', 'Stieglitz', 'كندا', NULL, NULL, 'بلانتيشن، فلوريدا', 'Stieglitz هو وكيل عقارات في جنوب فلوريدا، ومضيف برنامج American Dream TV والذي يتم بثه أيضًا على HGTV، ومتحدث عام متعدد اللغات ومدير عقارات إقليمي سابق أدار 22 مليون دولار من الأصول العقارية من 2010-2019. كمستشار عقاري يتمتع بخبرة متميزة وتدريب متعمق ومعرفة بجميع الجوانب في مجالات مثل إدارة الممتلكات والاستثمار العقاري وإعادة تأهيل العقارات والشراء والتقليب والبيع؛ بفضل مهارات مبيعات العقارات الحازمة المعززة بقدرات تسويقية عالية المستوى، والطلاقة في 3 لغات مختلفة (الإنجليزية والإسبانية والبرتغالية)، فإن مهارات التفاوض الممتازة التي تتمتع بها ميا ترشد كل مشتري وبائع عبر العقبات العقارية التي تقودهم بسعادة إلى طاولة الإغلاق.\r\n\r\nالبائعين\r\n\r\nعند العمل مع Mia، يمكنك أن تتوقع منها وفريقها التفاوض على أعلى سعر لعقارك لمساعدتك في تحقيق أهدافك وغاياتك أثناء بيع منزلك في أقل قدر من الوقت بفضل الخدمة الاستثنائية وخطة تسويق عالمية المستوى و التكنولوجيا المتطورة التي يتم توفيرها لك ولعائلتك. يتم تدريب كل عضو في طاقم القائمة لدينا لجعل العملية سهلة من البداية إلى النهاية. بمجرد مقابلتك مع Mia، ستشعر بالثقة أنك تقوم بتسعير الممتلكات الخاصة بك بسعر تنافسي وسيتم تحديثك طوال المعاملة بأكملها. هدفنا هو أن تشعر بالراحة لوجودنا في فريقك وأن هذا وضع مربح للجانبين لجميع الأطراف المعنية.', NULL, '2024-06-13 09:58:59', '2024-06-13 10:31:18'),
(46, 27, 20, 'Morten M.', 'Nørgaard', 'USA', NULL, NULL, 'Miami, FL', 'Morten M. Nørgaard is an expert on the culture, lifestyle, and overall market in Southeast Florida. She represents buyers, sellers, and investors in residential real estate throughout Miami-Dade and Broward Counties, with a focus on luxury homes and condominiums in Miami, Brickell, Miami Springs, Miami Beach, North Miami Beach, and Coral Gables.\r\nArelis’s foundation as an agent is centered on human connection and hard work. She takes the time to get to know her clients, understand their goals, and guide them through the process with as little friction as possible. Real estate has been her passion for the last 16 years, and she is proud to share her vetted network of resources and services to elevate the buying and selling experience as a full-service concierge. Matched with her warm energy and extroverted personality, Arelis has developed friendships with clients that have lasted a lifetime; it’s her promise to be a support post-transaction for everyone she has the pleasure of working with.\r\nAlong with the Compass technology and service offering, including data and analytics software, Compass Concierge, and the Compass Bridge Loan Service, Arelis is backed by industry-leading tools and services that widen the scope of what an agent can typically accomplish for clients, further enhancing the experience of working with her. She utilizes Compass’s contemporary, high-tech marketing tools and materials to generate more awareness, better price points, and faster transactions than ever before, with a single-platform interface that centralizes every aspect of the real estate journey. It’s a win-win.\r\nOriginally from Puerto Rico, Arelis moved to the Sunshine State in 2000 and has called Miami home ever since. Fluent in both English and Spanish, she is hyper-connected with the vibrant culture of the city and looks forward to sharing it with prospective clients. She graduated in 2012 from Miami-Dade College with an Associate’s Degree in Arts with a major in Dietetics. She also completed one year of MDC Culinary School. In her free time, she enjoys cooking, working out, traveling, and laying out at the beach.', NULL, '2024-06-13 10:00:51', '2024-06-13 10:52:16'),
(47, 27, 25, 'مورتن م.', 'نورجارد', 'الولايات المتحدة الأمريكية', NULL, NULL, 'ميامي،', 'نورجارد هو خبير في الثقافة وأسلوب الحياة والسوق بشكل عام في جنوب شرق فلوريدا. وهي تمثل المشترين والبائعين والمستثمرين في العقارات السكنية في جميع أنحاء مقاطعتي ميامي ديد وبروارد، مع التركيز على المنازل والوحدات السكنية الفاخرة في ميامي، وبريكل، وميامي سبرينغز، وميامي بيتش، وشمال ميامي بيتش، وكورال جابلز.\r\nيتمحور أساس Arelis كوكيل حول التواصل البشري والعمل الجاد. إنها تأخذ الوقت الكافي للتعرف على عملائها وفهم أهدافهم وتوجيههم خلال العملية بأقل قدر ممكن من الاحتكاك. لقد كانت العقارات شغفها على مدار الستة عشر عامًا الماضية، وهي فخورة بمشاركة شبكتها من الموارد والخدمات التي تم فحصها للارتقاء بتجربة البيع والشراء باعتبارها خدمة كونسيرج متكاملة الخدمات. نظرًا لطاقتها الدافئة وشخصيتها المنفتحة، طورت Arelis صداقات مع العملاء استمرت مدى الحياة؛ إنه وعدها بأن تكون بمثابة دعم ما بعد المعاملة لكل شخص تسعد بالعمل معه.\r\nإلى جانب عرض التكنولوجيا والخدمات من Compass، بما في ذلك برامج البيانات والتحليلات، و، وخدمة ، فإن مدعومة بأدوات وخدمات رائدة في الصناعة تعمل على توسيع نطاق ما يمكن للوكيل تحقيقه عادةً للعملاء، بالإضافة إلى ذلك تعزيز تجربة العمل معها. إنها تستخدم أدوات ومواد تسويقية معاصرة وعالية التقنية من لتوليد المزيد من الوعي ونقاط أسعار أفضل ومعاملات أسرع من أي وقت مضى، من خلال واجهة منصة واحدة تركز كل جانب من جوانب الرحلة العقارية. إنه فوز مربح للجانبين.\r\nانتقل أريليس، في الأصل من بورتوريكو، إلى ولاية صن شاين في عام 2000 واتخذ من ميامي موطنًا له منذ ذلك الحين. وهي تتحدث اللغتين الإنجليزية والإسبانية بطلاقة، وهي على اتصال وثيق بثقافة المدينة النابضة بالحياة وتتطلع إلى مشاركتها مع العملاء المحتملين. تخرجت في عام 2012 من كلية ميامي ديد بدرجة الزمالة في الآداب مع تخصص في علم التغذية. أكملت أيضًا عامًا واحدًا في مدرسة MDC للطهي. تستمتع في أوقات فراغها بالطهي وممارسة التمارين والسفر والاستلقاء على الشاطئ.', NULL, '2024-06-13 10:00:51', '2024-06-13 10:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL,
  `serial_number` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `icon`, `status`, `serial_number`, `created_at`, `updated_at`) VALUES
(10, 'fas fa-parking', 1, 1, '2024-03-23 23:12:16', '2024-03-23 23:12:16'),
(11, 'fas fa-swimming-pool', 1, 2, '2024-06-10 06:21:30', '2024-06-10 06:21:30'),
(12, 'fas fa-dumbbell', 1, 3, '2024-06-10 06:22:06', '2024-06-10 06:22:06'),
(13, 'fas fa-shield-alt', 1, 4, '2024-06-10 06:22:57', '2024-06-10 06:22:57'),
(14, 'fas fa-wind', 1, 5, '2024-06-10 06:25:16', '2024-06-10 06:25:16'),
(15, 'fas fa-bolt', 1, 6, '2024-06-10 06:27:42', '2024-06-10 06:27:42'),
(16, 'fas fa-mosque', 1, 7, '2024-06-10 10:32:05', '2024-06-10 10:32:05');

-- --------------------------------------------------------

--
-- Table structure for table `amenity_contents`
--

CREATE TABLE `amenity_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `amenity_id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenity_contents`
--

INSERT INTO `amenity_contents` (`id`, `amenity_id`, `language_id`, `name`, `created_at`, `updated_at`) VALUES
(20, 10, 20, 'Parking', '2024-03-23 23:12:16', '2024-03-23 23:12:16'),
(22, 11, 20, 'Swimming pool', '2024-06-10 06:21:30', '2024-06-10 06:21:30'),
(23, 11, 25, 'حمام السباحة', '2024-06-10 06:21:30', '2024-06-10 06:21:30'),
(24, 12, 20, 'Gym', '2024-06-10 06:22:06', '2024-06-10 06:22:06'),
(25, 12, 25, 'نادي رياضي', '2024-06-10 06:22:06', '2024-06-10 06:22:06'),
(26, 13, 20, 'Security', '2024-06-10 06:22:57', '2024-06-10 06:22:57'),
(27, 13, 25, 'حماية', '2024-06-10 06:22:57', '2024-06-10 06:22:57'),
(28, 14, 20, 'Air conditioning', '2024-06-10 06:25:16', '2024-06-10 06:25:16'),
(29, 14, 25, 'تكيف', '2024-06-10 06:25:16', '2024-06-10 06:25:16'),
(30, 15, 20, 'Backup Electricity', '2024-06-10 06:27:42', '2024-06-10 06:27:42'),
(31, 15, 25, 'الكهرباء الاحتياطية', '2024-06-10 06:27:42', '2024-06-10 06:27:42'),
(32, 16, 20, 'Mosque', '2024-06-10 10:32:05', '2024-06-10 10:32:05'),
(33, 16, 25, 'مسجد', '2024-06-10 10:32:05', '2024-06-10 10:32:05');

-- --------------------------------------------------------

--
-- Table structure for table `basic_settings`
--

CREATE TABLE `basic_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `uniqid` int UNSIGNED NOT NULL DEFAULT '12345',
  `favicon` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `logo_two` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `website_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `theme_version` smallint UNSIGNED NOT NULL,
  `base_currency_symbol` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `base_currency_symbol_position` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `base_currency_text` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `base_currency_text_position` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `base_currency_rate` decimal(8,2) DEFAULT NULL,
  `primary_color` varchar(30) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `smtp_status` tinyint DEFAULT NULL,
  `smtp_host` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `smtp_port` int DEFAULT NULL,
  `encryption` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `smtp_username` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `from_mail` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `to_mail` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `breadcrumb` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `disqus_status` tinyint UNSIGNED DEFAULT NULL,
  `disqus_short_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `google_recaptcha_status` tinyint DEFAULT NULL,
  `google_recaptcha_site_key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `google_recaptcha_secret_key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `whatsapp_status` tinyint UNSIGNED DEFAULT NULL,
  `whatsapp_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `whatsapp_header_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `whatsapp_popup_status` tinyint UNSIGNED DEFAULT NULL,
  `whatsapp_popup_message` text COLLATE utf8mb3_unicode_ci,
  `maintenance_img` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `maintenance_status` tinyint DEFAULT NULL,
  `maintenance_msg` text COLLATE utf8mb3_unicode_ci,
  `bypass_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `footer_background_image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admin_theme_version` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'light',
  `notification_image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `counter_section_image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `call_to_action_section_image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `testimonial_section_image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `category_section_background` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `google_adsense_publisher_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `property_country_status` tinyint UNSIGNED DEFAULT '1',
  `property_state_status` tinyint UNSIGNED DEFAULT '1',
  `guest_checkout_status` tinyint UNSIGNED NOT NULL,
  `facebook_login_status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 -> enable, 0 -> disable',
  `facebook_app_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `facebook_app_secret` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `google_login_status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 -> enable, 0 -> disable',
  `google_client_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `google_client_secret` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tawkto_status` tinyint UNSIGNED NOT NULL COMMENT '1 -> enable, 0 -> disable',
  `tawkto_direct_chat_link` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `vendor_admin_approval` int NOT NULL DEFAULT '0' COMMENT '1 active, 2 deactive',
  `vendor_email_verification` int NOT NULL DEFAULT '0' COMMENT '1 active, 2 deactive',
  `admin_approval_notice` text COLLATE utf8mb3_unicode_ci,
  `expiration_reminder` int DEFAULT '3',
  `timezone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hero_section_video_url` text COLLATE utf8mb3_unicode_ci,
  `hero_static_img` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_subtile` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_details` longtext COLLATE utf8mb3_unicode_ci,
  `latitude` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `preloader_status` int DEFAULT '1',
  `preloader` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `about_section_video_link` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `about_section_image1` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `about_section_image2` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `why_choose_us_section_img1` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `why_choose_us_section_img2` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `why_choose_us_section_video_link` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subscribe_section_img` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `property_approval_status` int NOT NULL DEFAULT '1' COMMENT '1= need admin approval then show in frontend',
  `project_approval_status` int NOT NULL DEFAULT '1' COMMENT '1= need admin approval then show in frontend'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `basic_settings`
--

INSERT INTO `basic_settings` (`id`, `uniqid`, `favicon`, `logo`, `logo_two`, `website_title`, `email_address`, `contact_number`, `address`, `theme_version`, `base_currency_symbol`, `base_currency_symbol_position`, `base_currency_text`, `base_currency_text_position`, `base_currency_rate`, `primary_color`, `secondary_color`, `smtp_status`, `smtp_host`, `smtp_port`, `encryption`, `smtp_username`, `smtp_password`, `from_mail`, `from_name`, `to_mail`, `breadcrumb`, `disqus_status`, `disqus_short_name`, `google_recaptcha_status`, `google_recaptcha_site_key`, `google_recaptcha_secret_key`, `whatsapp_status`, `whatsapp_number`, `whatsapp_header_title`, `whatsapp_popup_status`, `whatsapp_popup_message`, `maintenance_img`, `maintenance_status`, `maintenance_msg`, `bypass_token`, `footer_logo`, `footer_background_image`, `admin_theme_version`, `notification_image`, `counter_section_image`, `call_to_action_section_image`, `testimonial_section_image`, `category_section_background`, `google_adsense_publisher_id`, `property_country_status`, `property_state_status`, `guest_checkout_status`, `facebook_login_status`, `facebook_app_id`, `facebook_app_secret`, `google_login_status`, `google_client_id`, `google_client_secret`, `tawkto_status`, `tawkto_direct_chat_link`, `vendor_admin_approval`, `vendor_email_verification`, `admin_approval_notice`, `expiration_reminder`, `timezone`, `hero_section_video_url`, `hero_static_img`, `contact_title`, `contact_subtile`, `contact_details`, `latitude`, `longitude`, `preloader_status`, `preloader`, `about_section_video_link`, `about_section_image1`, `about_section_image2`, `why_choose_us_section_img1`, `why_choose_us_section_img2`, `why_choose_us_section_video_link`, `subscribe_section_img`, `updated_at`, `property_approval_status`, `project_approval_status`) VALUES
(2, 12345, '65127f2a23da3.png', '66669210543fd.png', '64ed7071b1844.png', 'Estaty', 'estaty@example.com', '+88065879521', '13th Street 47 W ,New York, USA', 1, '$', 'left', 'USD', 'left', 1.00, 'F57F4B', '255056', 1, 'smtp.gmail.com', 587, 'TLS', 'shohag.fci63@gmail.com', 'fuzp qnws wxzn gdst', 'shohag.fci63@gmail.com', 'Estaty', 'admin@example.com', '6511175715121.jpg', 0, NULL, 0, 'dfzgasdfg', 'asdfgavsdfgvsd', 0, '01868362878', 'Hi, there!', 1, 'If you have any issues, let us know.', '1632725312.png', 0, 'We are upgrading our site. We will come back soon. \r\nPlease stay with us.\r\nThank you.', NULL, '66668fd8afd03.png', '6572f1d3ead31.png', 'light', '619b7d5e5e9df.png', '64e46e661cff4.png', '6576af4f8ac2d.jpg', '6572e7c01c264.png', '63c92601cb853.jpg', NULL, 1, 1, 0, 1, '377957354064048', 'c7ea8a036916500375fbd9a799b95c50', 1, '951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com', '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_zM', 0, 'https://tawk.to/chat/623891851ffac05b1d7fac3b/1fumfgsmj', 1, 1, 'Your account is deactive or pending now please contact with admin.', 3, 'Asia/Dhaka', 'https://www.youtube.com/watch?v=9l6RywtDlKA', '6574372e0ad77.jpg', 'Get Connected', 'How Can We Help You?', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\r\n\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.', '23.8763296233045', '90.47600702834376', 1, '666a7cc7647d0.png', 'https://www.youtube.com/watch?v=F26FINYrof0', '657557b3c229e.jpg', '657557b3c2a25.jpg', '65757ae71b9f0.jpg', '65757ae71c078.jpg', 'https://www.youtube.com/watch?v=mrpiPK8_up0', '6577e0ff3ab05.jpg', '2024-05-19 07:07:40', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `serial_number` mediumint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `image`, `serial_number`, `created_at`, `updated_at`, `status`) VALUES
(21, '666aa4324c1ff.png', 1, '2023-08-19 00:54:31', '2024-06-13 07:48:02', 1),
(22, '666aa43ee1a5e.png', 2, '2023-08-19 00:58:19', '2024-06-13 07:48:14', 1),
(23, '666aa420dd756.png', 3, '2023-08-19 01:03:34', '2024-06-13 07:47:44', 1),
(24, '666aa411815d3.png', 4, '2023-08-19 01:05:56', '2024-06-13 07:47:29', 1),
(25, '666aa3ff8caec.png', 5, '2023-08-19 01:11:12', '2024-06-13 07:47:11', 1),
(26, '666aa3e7f1d36.png', 6, '2023-08-19 01:17:26', '2024-06-13 07:46:47', 1),
(28, '666aa4d0b281d.png', 7, '2024-06-13 07:50:40', '2024-06-13 07:51:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `serial_number` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `language_id`, `name`, `slug`, `status`, `serial_number`, `created_at`, `updated_at`) VALUES
(42, 20, 'Buying Guides', 'buying-guides', 1, 1, '2023-08-19 00:45:17', '2023-08-19 00:45:17'),
(43, 20, 'Legal and Financial Advice', 'legal-and-financial-advice', 1, 2, '2023-08-19 00:45:38', '2024-06-13 06:48:28'),
(44, 20, 'Renting and Leasing', 'renting-and-leasing', 1, 3, '2023-08-19 00:45:51', '2024-06-13 06:48:04'),
(45, 20, 'Market Trends and Analysis', 'market-trends-and-analysis', 1, 4, '2023-08-19 00:46:06', '2024-06-13 06:47:27'),
(52, 25, 'اتجاهات السوق والتحليل', 'اتجاهات-السوق-والتحليل', 1, 4, '2024-06-14 09:16:56', '2024-06-14 09:16:56'),
(53, 25, 'التأجير والتأجير', 'التأجير-والتأجير', 1, 3, '2024-06-14 09:17:24', '2024-06-14 09:17:24'),
(54, 25, 'المشورة القانونية والمالية', 'المشورة-القانونية-والمالية', 1, 2, '2024-06-14 09:17:53', '2024-06-14 09:17:53'),
(55, 25, 'أدلة الشراء', 'أدلة-الشراء', 1, 1, '2024-06-14 09:18:19', '2024-06-14 09:18:19');

-- --------------------------------------------------------

--
-- Table structure for table `blog_informations`
--

CREATE TABLE `blog_informations` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `blog_category_id` bigint UNSIGNED NOT NULL,
  `blog_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` blob NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `blog_informations`
--

INSERT INTO `blog_informations` (`id`, `language_id`, `blog_category_id`, `blog_id`, `title`, `slug`, `author`, `content`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(37, 20, 42, 21, 'Navigating Mortgage Options: Fixed vs. Adjustable Rates Explained', 'navigating-mortgage-options:-fixed-vs-adjustable-rates-explained', 'John Due', 0x3c703e41726520796f7520696e20746865206d61726b657420666f722061206e657720736574206f6620776865656c73206275742077616e7420746f2067657420746865206d6f73742076616c756520666f7220796f7572206d6f6e65793f205768657468657220796f75277265206120736561736f6e656420636172206275796572206f7220612066697273742d74696d652073686f707065722c207468652070726f63657373206f6620627579696e6720612075736564206361722063616e20626520626f7468206578636974696e6720616e64206461756e74696e672e20466f7274756e6174656c792c206f757220636f6d70726568656e73697665206775696465206973206865726520746f2077616c6b20796f75207468726f7567682065766572792073746570206f6620746865206a6f75726e65792c2068656c70696e6720796f75206d616b6520616e20696e666f726d656420616e6420636f6e666964656e74206465636973696f6e207468617420616c69676e7320706572666563746c79207769746820796f7572206e6565647320616e64206275646765742e3c2f703e0d0a3c703e3c7374726f6e673e53657474696e6720596f7572204275646765743a3c2f7374726f6e673e2054686520666972737420616e64207065726861707320746865206d6f737420637269746963616c207374657020696e20627579696e6720612075736564206361722069732065737461626c697368696e67206120636c656172206275646765742e204e6f74206f6e6c7920646f657320746869732068656c7020796f75206e6172726f7720646f776e20796f7572206f7074696f6e732c2062757420697420616c736f2070726576656e747320796f752066726f6d206f7665727370656e64696e67206f72206d616b696e672066696e616e6369616c20636f6d6d69746d656e747320796f752063616e277420636f6d666f727461626c79206d616e6167652e204f75722067756964652077696c6c2070726f7669646520796f7520776974682070726163746963616c2074697073206f6e20617373657373696e6720796f75722066696e616e63657320616e642064657465726d696e696e6720746865206d6178696d756d20616d6f756e7420796f752063616e20616c6c6f6361746520746f20796f7572206e65772076656869636c652e3c2f703e0d0a3c703e3c7374726f6e673e446566696e696e6720596f7572204e656564733a3c2f7374726f6e673e205769746820636f756e746c657373206d616b657320616e64206d6f64656c7320617661696c61626c652c2069742773206561737920746f20676574206f7665727768656c6d65642e2054686174277320776879207765276c6c20677569646520796f75207468726f756768207468652070726f63657373206f6620646566696e696e6720796f7572206e6565647320616e6420707265666572656e6365732e2041726520796f75206c6f6f6b696e6720666f722061206675656c2d656666696369656e7420636f6d706163742063617220666f7220796f7572206461696c7920636f6d6d7574652c20612073706163696f75732053555620746f206163636f6d6d6f6461746520796f75722066616d696c79277320616476656e74757265732c206f7220612073706f72747920636f75706520666f722074686f7365207765656b656e642067657461776179733f205765276c6c2068656c7020796f7520636f6e736964657220666163746f727320737563682061732073697a652c2066656174757265732c20616e64206c6966657374796c6520746f2070696e706f696e742074686520696465616c2076656869636c65207479706520666f7220796f752e3c2f703e0d0a3c703e3c7374726f6e673e5265736561726368696e672052656c696162696c6974793a3c2f7374726f6e673e204e6f626f64792077616e747320746f20656e6420757020776974682061206c656d6f6e2e20546861742773207768792074686f726f75676820726573656172636820697320657373656e7469616c2e204f75722067756964652077696c6c2073686f7720796f7520686f7720746f20757365207265736f7572636573206c696b6520636f6e73756d657220726576696577732c2072656c696162696c69747920726174696e67732c20616e6420657870657274206f70696e696f6e7320746f20656e7375726520796f7527726520636f6e7369646572696e67206d6f64656c73206b6e6f776e20666f72207468656972206475726162696c69747920616e64206c6f6e672d7465726d20706572666f726d616e63652e205765276c6c20616c736f206469736375737320686f7720746f206964656e746966792072656420666c61677320616e6420636f6d6d6f6e2069737375657320746f207761746368206f757420666f72207768656e20617373657373696e67207573656420636172732e3c2f703e0d0a3c703e3c7374726f6e673e436865636b696e672056656869636c6520486973746f72793a3c2f7374726f6e673e2049742773206c696b652067657474696e67206120736e65616b207065656b20696e746f206120636172277320706173742e204120636f6d70726568656e736976652076656869636c6520686973746f7279207265706f72742063616e2070726f7669646520696e76616c7561626c6520696e73696768747320696e746f207468652076656869636c652773206163636964656e7420686973746f72792c207469746c65207374617475732c20616e64206d61696e74656e616e6365207265636f7264732e205765276c6c20677569646520796f75207468726f756768207468652070726f63657373206f66206f627461696e696e6720616e6420696e74657270726574696e67207468657365207265706f7274732c20656e737572696e6720796f752772652077656c6c2d696e666f726d65642061626f757420746865206361722773206261636b67726f756e64206265666f7265206d616b696e672061206465636973696f6e2e3c2f703e0d0a3c703e3c7374726f6e673e496e7370656374696e6720616e6420546573742044726976696e673a3c2f7374726f6e673e205468652068616e64732d6f6e2070617274206f66207468652070726f636573732e204f75722067756964652077696c6c20746561636820796f75207768617420746f206c6f6f6b20666f72207768656e20696e7370656374696e67206120757365642063617220696e20706572736f6e2e2046726f6d20746865206578746572696f7220636f6e646974696f6e20746f2074686520656e67696e652062617920616e642074686520696e746572696f722c207765276c6c20636f76657220746865206b657920617265617320746f20636865636b20666f72207369676e73206f6620776561722c2064616d6167652c20616e64206d61696e74656e616e6365206973737565732e204164646974696f6e616c6c792c207765276c6c206f666665722074697073206f6e20636f6e64756374696e672061206d65616e696e6766756c207465737420647269766520746f206576616c75617465207468652063617227732068616e646c696e672c20636f6d666f72742c20616e6420706572666f726d616e63652e3c2f703e0d0a3c703e3c7374726f6e673e4e65676f74696174696e6720576973656c793a3c2f7374726f6e673e20526561647920746f206d616b6520616e206f666665723f204e65676f74696174696f6e20697320616e206172742c20616e64207765276c6c20657175697020796f75207769746820746865207374726174656769657320616e64207469707320746f206e65676f7469617465206566666563746976656c792e205768657468657220796f752772652070757263686173696e672066726f6d2061206465616c657273686970206f72206120707269766174652073656c6c65722c207765276c6c2068656c7020796f75206e61766967617465207468697320737461676520636f6e666964656e746c7920616e6420776f726b20746f7761726473206120666169722070726963652074686174207265666c656374732074686520636172277320636f6e646974696f6e20616e64206d61726b65742076616c75652e3c2f703e0d0a3c703e3c7374726f6e673e46696e616c697a696e67207468652050757263686173653a3c2f7374726f6e673e205769746820746865207072696365206167726565642075706f6e2c20697427732074696d6520746f2066696e616c697a6520746865207061706572776f726b2e205765276c6c206f75746c696e652074686520657373656e7469616c20646f63756d656e747320796f75206e6565642c2073756368206173207468652062696c6c206f662073616c6520616e64207469746c65207472616e7366657220666f726d732e204d6f72656f7665722c207765276c6c206f666665722067756964616e6365206f6e2061766f6964696e6720636f6d6d6f6e2070697466616c6c7320616e64207363616d7320746861742063616e20736f6d6574696d6573206f6363757220647572696e672074686973207068617365206f66207468652070726f636573732e3c2f703e0d0a3c703e3c7374726f6e673e47657474696e6720496e737572616e63653a3c2f7374726f6e673e204265666f726520796f75206869742074686520726f61642c20796f75276c6c206e6565642070726f70657220696e737572616e636520636f76657261676520666f7220796f7572206e657720726964652e204f75722067756964652077696c6c206578706c61696e20746865207479706573206f6620636f76657261676520617661696c61626c6520616e642068656c7020796f75206e61766967617465207468652070726f63657373206f66206f627461696e696e6720696e737572616e63652071756f7465732c20656e737572696e6720796f752772652070726f7465637465642066726f6d20646179206f6e652e3c2f703e0d0a3c703e3c7374726f6e673e44726976696e672041776179207769746820436f6e666964656e63653a3c2f7374726f6e673e20436f6e67726174756c6174696f6e732120596f75277665207375636365737366756c6c79206e61766967617465642074686520757365642063617220627579696e672070726f6365737320616e6420617265206e6f77207468652070726f7564206f776e6572206f662061207175616c6974792076656869636c652e204f75722067756964652077726170732075702062792072656d696e64696e6720796f75206f662074686520696d706f7274616e6365206f6620726567756c6172206d61696e74656e616e636520616e6420726573706f6e7369626c652064726976696e6720746f20656e7375726520796f7572206361722073657276657320796f752077656c6c20666f7220796561727320746f20636f6d652e3c2f703e0d0a3c703e496e207468697320636f6d70726568656e736976652067756964652c2077652776652064697374696c6c6564207965617273206f6620657870657269656e636520616e642065787065727469736520746f2068656c7020796f7520636f6e666964656e746c79206e617669676174652074686520776f726c64206f6620757365642063617220627579696e672e205768657468657220796f75277265206c6f6f6b696e6720666f722061206275646765742d667269656e646c7920636f6d6d75746572206f7220612072656c6961626c652066616d696c792076656869636c652c206f75722067756964652077696c6c20656d706f77657220796f75207769746820746865206b6e6f776c6564676520616e6420696e736967687473206e656564656420746f206d616b65206120707572636861736520796f75276c6c206265206861707079207769746820666f7220746865206c6f6e67206861756c2e2047657420726561647920746f20647269766520617761792077697468206120736d696c652c206b6e6f77696e6720796f75277665206d61646520612077656c6c2d696e666f726d6564206465636973696f6e2e3c2f703e, NULL, NULL, '2023-08-19 00:54:31', '2024-06-13 06:51:25'),
(39, 20, 42, 22, 'First-Time Homebuyers’ Guide: 10 Essential Tips for Success', 'first-time-homebuyers’-guide:-10-essential-tips-for-success', 'John Due', 0x3c703e5468696e6b696e672061626f757420646976696e6720696e746f2074686520776f726c64206f662075736564206361722073686f7070696e673f204c6f6f6b206e6f20667572746865722e204f7572206c617465737420626c6f6720706f73742069732064657369676e656420746f20626520796f757220636f6d70617373207468726f75676820746865207573656420636172206d61726b65742c2067756964696e6720796f7520746f77617264732061207375636365737366756c20616e642073617469736679696e672070757263686173652e205769746820746865736520657870657274207469707320616e6420696e7369676874732c20796f75276c6c20626520657175697070656420746f20636f6e666964656e746c79206578706c6f7265206c697374696e67732c206576616c75617465206f7074696f6e732c20616e642064726976652061776179207769746820612075736564206361722074686174206d6565747320796f7572206e6565647320616e64206578636565647320796f7572206578706563746174696f6e732e3c2f703e0d0a3c703e3c7374726f6e673e556e6465727374616e64696e67204d61726b6574205472656e64733a3c2f7374726f6e673e20546865207573656420636172206d61726b65742069732064796e616d69632c20616e64207072696365732063616e207661727920776964656c79206261736564206f6e20666163746f727320737563682061732064656d616e642c20736561736f6e616c6974792c20616e64206c6f636174696f6e2e204f75722067756964652077696c6c2068656c7020796f752067726173702063757272656e74206d61726b6574207472656e64732c20656e61626c696e6720796f7520746f206d616b6520696e666f726d6564206465636973696f6e732061626f7574207768656e20746f2062757920616e64207768696368206d6f64656c73206d69676874206f66666572206265747465722076616c75652e3c2f703e0d0a3c703e3c7374726f6e673e5265736561726368206973204b65793a3c2f7374726f6e673e204e6576657220756e646572657374696d6174652074686520706f776572206f662072657365617263682e204f757220706f73742077696c6c20686967686c696768742074686520696d706f7274616e6365206f66207265736561726368696e67207370656369666963206d616b657320616e64206d6f64656c7320796f7527726520696e746572657374656420696e2e20596f75276c6c206c6561726e20686f7720746f20756e636f76657220696e666f726d6174696f6e2061626f757420636f6d6d6f6e206973737565732c2072657061697220636f7374732c20616e642074686520617661696c6162696c697479206f66207265706c6163656d656e742070617274732e2041726d656420776974682074686973206b6e6f776c656467652c20796f752063616e20636f6e666964656e746c79206964656e74696679207468652072696768742076656869636c6520666f7220796f7572206e656564732e3c2f703e0d0a3c703e3c7374726f6e673e53657474696e67205265616c6973746963204578706563746174696f6e733a3c2f7374726f6e673e205768696c6520776520616c6c20647265616d206f66207468652070657266656374206361722c206974277320696d706f7274616e7420746f206d616e61676520796f7572206578706563746174696f6e73207768656e20627579696e6720757365642e205765276c6c2070726f766964652074697073206f6e2077686174207765617220616e64207465617220746f206578706563742066726f6d206120757365642076656869636c6520616e6420686f7720746f20646966666572656e7469617465206265747765656e2061636365707461626c65207369676e73206f662075736520616e6420706f74656e7469616c2072656420666c6167732e3c2f703e0d0a3c703e3c7374726f6e673e436f6e7369646572696e6720436572746966696564205072652d4f776e6564202843504f292056656869636c65733a3c2f7374726f6e673e20436572746966696564207072652d6f776e65642076656869636c6573206f6666657220616e2061747472616374697665206d6964646c652067726f756e64206265747765656e206e657720616e6420747261646974696f6e616c207573656420636172732e204f75722067756964652077696c6c206578706c61696e207768617420612043504f2076656869636c652069732c207468652062656e6566697473206f6620627579696e67206f6e652c20616e6420686f7720746f206576616c756174652074686520637265646962696c697479206f662061206d616e75666163747572657227732063657274696669636174696f6e2070726f6772616d2e3c2f703e0d0a3c703e3c7374726f6e673e54686520496d706f7274616e6365206f662061205072652d507572636861736520496e7370656374696f6e3a3c2f7374726f6e673e20446f6e277420736b6970207468697320737465702e204f757220706f73742077696c6c20656d70686173697a6520746865207369676e69666963616e6365206f6620686176696e6720612074727573746564206d656368616e696320696e73706563742061207573656420636172206265666f72652066696e616c697a696e67207468652070757263686173652e205765276c6c206469736375737320746865207479706573206f6620636865636b732074686579276c6c20706572666f726d20616e6420686f7720746865697220696e7369676874732063616e2068656c7020796f75206d616b652061206d6f726520636f6e666964656e74206465636973696f6e2e3c2f703e0d0a3c703e3c7374726f6e673e4578706c6f72696e67204f6e6c696e65204c697374696e67733a3c2f7374726f6e673e2054686520696e7465726e657420686173207265766f6c7574696f6e697a656420746865207761792077652073686f7020666f72207573656420636172732e205765276c6c20677569646520796f75207468726f756768207468652070726f63657373206f6620736561726368696e6720616e642066696c746572696e67206f6e6c696e65206c697374696e6773206566666563746976656c792e20596f75276c6c20616c736f2066696e642074697073206f6e206465636f64696e67206c697374696e672064657461696c732c20696e74657270726574696e672070686f746f732c20616e6420636f6e74616374696e672073656c6c65727320746f20676174686572206d6f726520696e666f726d6174696f6e2e3c2f703e0d0a3c703e3c7374726f6e673e5465737420447269766520546563686e69717565733a3c2f7374726f6e673e2041207465737420647269766520697320796f7572206f70706f7274756e69747920746f20657870657269656e6365207468652076656869636c6520666972737468616e642e205765276c6c2064656c766520696e746f20746865206e75616e636573206f662061207375636365737366756c20746573742064726976652c20696e636c7564696e67207768617420746f2070617920617474656e74696f6e20746f2c20686f7720746f2061737365737320636f6d666f727420616e642068616e646c696e672c20616e642077686174207175657374696f6e7320746f2061736b207468652073656c6c6572206265666f726520616e64206166746572207468652064726976652e3c2f703e0d0a3c703e3c7374726f6e673e4e65676f74696174696f6e20537472617465676965733a3c2f7374726f6e673e204e65676f74696174696e6720746865207072696365206f6620612075736564206361722063616e20626520696e74696d69646174696e672c2062757420697427732061206372756369616c20736b696c6c20746f206d61737465722e204f75722067756964652077696c6c2070726f7669646520796f752077697468206e65676f74696174696f6e207461637469637320616e64207363726970747320746f20636f6e666964656e746c79206e6176696761746520746869732070686173652c20656e737572696e6720796f752067657420746865206265737420706f737369626c65206465616c20776974686f7574207361637269666963696e6720796f7572206275646765742e3c2f703e0d0a3c703e3c7374726f6e673e436f6e7369646572696e672046696e616e63696e67204f7074696f6e733a3c2f7374726f6e673e20496620796f75277265206e6f7420706179696e6720696e20636173682c206f75722067756964652077696c6c2077616c6b20796f75207468726f7567682066696e616e63696e67206f7074696f6e732e2046726f6d20747261646974696f6e616c2062616e6b206c6f616e7320746f206465616c6572736869702066696e616e63696e672c20796f75276c6c206c6561726e20686f7720746f207365637572652061206c6f616e2077697468206661766f7261626c65207465726d73207468617420616c69676e207769746820796f75722066696e616e6369616c20736974756174696f6e2e3c2f703e0d0a3c703e3c7374726f6e673e446f63756d656e74696e6720746865204465616c3a3c2f7374726f6e673e20417320746865206465616c20636f6d657320746f6765746865722c206974277320766974616c20746f20686176652070726f70657220646f63756d656e746174696f6e20696e20706c6163652e204f757220706f73742077696c6c206f75746c696e652074686520657373656e7469616c207061706572776f726b20796f75206e6565642c2073756368206173207468652062696c6c206f662073616c6520616e64207469746c65207472616e7366657220666f726d732c20746f20656e73757265206120736d6f6f746820616e64206c6567616c207472616e73616374696f6e2e3c2f703e0d0a3c703e41726d6564207769746820746865736520696e76616c7561626c6520746970732c20796f75276c6c20626520726561647920746f206e617669676174652074686520696e74726963617465206c616e647363617065206f6620746865207573656420636172206d61726b65742e204f757220676f616c20697320746f20656d706f77657220796f75207769746820746865206b6e6f776c6564676520616e6420636f6e666964656e636520746f2066696e6420612076656869636c652074686174206d6565747320796f7572206e656564732c206669747320796f7572206275646765742c20616e64206272696e6773206120736d696c6520746f20796f757220666163652065766572792074696d6520796f75206869742074686520726f61642e2047657420726561647920746f20656d6261726b206f6e2061207375636365737366756c20757365642063617220627579696e67206a6f75726e6579213c2f703e, NULL, NULL, '2023-08-19 00:58:19', '2024-06-13 06:50:32'),
(41, 20, 43, 23, 'Legal Pitfalls to Avoid in Real Estate Transactions', 'legal-pitfalls-to-avoid-in-real-estate-transactions', 'Alexandra', 0x3c703e4d61696e7461696e696e6720796f75722076656869636c6520697320657373656e7469616c20666f7220656e737572696e6720697473206c6f6e6765766974792c20706572666f726d616e63652c20616e64207361666574792e205768657468657220796f7527726520612063617220656e7468757369617374206f722061206461696c7920636f6d6d757465722c206f757220636f6d70726568656e7369766520636172206d61696e74656e616e636520636865636b6c6973742069732064657369676e656420746f20626520796f757220676f2d746f207265736f7572636520666f72206b656570696e6720796f75722076656869636c6520696e207065616b20636f6e646974696f6e2e2046726f6d20726f7574696e65207461736b7320746861742073686f756c6420626520706572666f726d656420726567756c61726c7920746f206f63636173696f6e616c20636865636b7320746861742063616e2070726576656e74206d616a6f72206973737565732c207468697320636865636b6c69737420636f7665727320657665727920617370656374206f662063617220636172652e3c2f703e0d0a3c703e3c7374726f6e673e526567756c6172204d61696e74656e616e63653a3c2f7374726f6e673e3c2f703e0d0a3c703e3c656d3e4f696c204368616e67653a3c2f656d3e20526567756c6172206f696c206368616e67657320617265206372756369616c20746f206b65657020796f757220656e67696e652072756e6e696e6720736d6f6f74686c792e204f757220636865636b6c6973742077696c6c20677569646520796f75206f6e207768656e20616e6420686f7720746f206368616e676520796f7572206f696c2c20696e636c7564696e672073656c656374696e6720746865207269676874206f696c207479706520616e642066696c7465722e3c2f703e0d0a3c703e3c656d3e5469726520436172653a3c2f656d3e2050726f7065722074697265206d61696e74656e616e636520656e68616e6365732073616665747920616e64206675656c20656666696369656e63792e204c6561726e20686f7720746f20636865636b20746972652070726573737572652c20726f746174652074697265732c20616e6420656e7375726520796f7572207469726573206861766520656e6f75676820747265616420666f72206f7074696d616c207472616374696f6e2e3c2f703e0d0a3c703e3c656d3e466c75696420436865636b733a3c2f656d3e2046726f6d20636f6f6c616e7420746f206272616b6520666c7569642c206f757220636865636b6c6973742077696c6c2068656c7020796f75206d6f6e69746f7220616e64206d61696e7461696e2074686520766172696f757320666c7569647320696e20796f75722076656869636c6520746f2070726576656e74206f76657268656174696e672c20636f72726f73696f6e2c20616e64206272616b696e67206973737565732e3c2f703e0d0a3c703e3c7374726f6e673e456e67696e65204865616c74683a3c2f7374726f6e673e3c2f703e0d0a3c703e3c656d3e4169722046696c746572205265706c6163656d656e743a3c2f656d3e204120636c65616e206169722066696c74657220656e73757265732070726f7065722061697220696e74616b6520616e64206675656c20656666696369656e63792e204f757220636865636b6c697374206578706c61696e7320686f7720616e64207768656e20746f207265706c61636520796f7572206169722066696c7465722e3c2f703e0d0a3c703e3c656d3e537061726b20506c7567204d61696e74656e616e63653a3c2f656d3e204c6561726e2074686520696d706f7274616e6365206f6620737061726b20706c7567206865616c746820616e64207768656e20746f207265706c616365207468656d20746f2061766f696420656e67696e65206d6973666972657320616e6420706f6f7220706572666f726d616e63652e3c2f703e0d0a3c703e3c7374726f6e673e556e6465722074686520486f6f643a3c2f7374726f6e673e3c2f703e0d0a3c703e3c656d3e4261747465727920436172653a3c2f656d3e20446f6e27742067657420737472616e64656420776974682061206465616420626174746572792e204f757220636865636b6c69737420636f7665727320686f7720746f207465737420796f757220626174746572792773206865616c74682c20636c65616e207465726d696e616c732c20616e6420656e737572652072656c6961626c65207374617274732e3c2f703e0d0a3c703e3c656d3e42656c747320616e6420486f7365733a3c2f656d3e204b656570696e6720616e20657965206f6e2062656c747320616e6420686f7365732063616e2070726576656e7420627265616b646f776e7320616e64206f76657268656174696e672e204c6561726e20686f7720746f20696e7370656374207468656d20666f72207765617220616e6420637261636b732e3c2f703e0d0a3c703e3c7374726f6e673e53616665747920616e64205669736962696c6974793a3c2f7374726f6e673e3c2f703e0d0a3c703e3c656d3e4272616b6520496e7370656374696f6e3a3c2f656d3e20526567756c6172206272616b6520636865636b732061726520657373656e7469616c20666f7220796f7572207361666574792e204f757220636865636b6c6973742064657461696c7320686f7720746f20696e7370656374206272616b6520706164732c20726f746f72732c20616e64206272616b6520666c756964206c6576656c732e3c2f703e0d0a3c703e3c656d3e576970657220426c616465205265706c6163656d656e743a3c2f656d3e20436c656172207669736962696c697479206973206372756369616c20666f7220736166652064726976696e672e2046696e64206f7574207768656e20746f207265706c61636520796f757220776970657220626c6164657320746f206d61696e7461696e20636c6561722077696e64736869656c647320647572696e67207261696e20616e6420736e6f772e3c2f703e0d0a3c703e3c7374726f6e673e496e746572696f7220616e64204578746572696f7220436172653a3c2f7374726f6e673e3c2f703e0d0a3c703e3c656d3e496e746572696f7220436c65616e696e673a3c2f656d3e204120636c65616e20696e746572696f7220656e68616e63657320636f6d666f727420616e642076616c75652e20446973636f766572207469707320666f7220636c65616e696e6720616e64206d61696e7461696e696e6720796f75722076656869636c652773207570686f6c73746572792c2064617368626f6172642c20616e6420636172706574732e3c2f703e0d0a3c703e3c656d3e4578746572696f7220436172653a3c2f656d3e20507265736572766520796f75722076656869636c6527732066696e69736820776974682070726f7065722077617368696e672c20776178696e672c20616e642064657461696c696e6720746563686e69717565732e204f757220636865636b6c69737420636f7665727320686f7720746f2070726f7465637420796f7572206361722773207061696e742066726f6d2074686520656c656d656e74732e3c2f703e0d0a3c703e427920666f6c6c6f77696e67206f757220636f6d70726568656e7369766520636172206d61696e74656e616e636520636865636b6c6973742c20796f75276c6c20656e7375726520796f75722076656869636c652072656d61696e732072656c6961626c652c20656666696369656e742c20616e6420736166652e20526567756c6172206d61696e74656e616e6365206e6f74206f6e6c7920736176657320796f75206d6f6e6579206f6e20706f74656e7469616c20726570616972732062757420616c736f2068656c707320796f7520656e6a6f79206120736d6f6f7468657220616e64206d6f726520656e6a6f7961626c652064726976696e6720657870657269656e63652e204d616b65207468697320636865636b6c69737420796f7572207472757374656420636f6d70616e696f6e20616e64206769766520796f75722076656869636c652074686520636172652069742064657365727665732e3c2f703e, NULL, NULL, '2023-08-19 01:03:34', '2024-06-13 06:53:20'),
(43, 20, 43, 24, 'How to Choose the Right Homeowners Insurance Policy', 'how-to-choose-the-right-homeowners-insurance-policy', 'Alison', 0x3c703e57696e74657227732069637920677269702063616e2070726573656e74206e756d65726f7573206368616c6c656e67657320666f7220796f75722076656869636c652e20436f6c642074656d7065726174757265732c20726f61642073616c742c20616e64206368616c6c656e67696e672064726976696e6720636f6e646974696f6e732063616e2074616b65206120746f6c6c206f6e20796f757220636172277320706572666f726d616e636520616e6420617070656172616e63652e204f75722077696e746572206361722063617265206775696465206973206865726520746f2068656c7020796f75207072657061726520796f75722076656869636c6520666f7220746865206861727368206d6f6e7468732061686561642e2046726f6d20656e737572696e672070726f706572207472616374696f6e20746f20736166656775617264696e6720796f757220656e67696e6520616761696e737420667265657a696e672074656d7065726174757265732c20746865736520657373656e7469616c20746970732077696c6c206b65657020796f7520616e6420796f75722076656869636c65207361666520647572696e672077696e7465722773206368696c6c2e3c2f703e0d0a3c703e3c7374726f6e673e5469726520507265703a3c2f7374726f6e673e3c2f703e0d0a3c703e3c656d3e57696e7465722054697265733a3c2f656d3e204c6561726e207768792077696e74657220746972657320617265206372756369616c20666f72206e617669676174696e672069637920726f61647320616e6420646973636f766572207768656e20616e6420686f7720746f2073776974636820746f207468656d2e3c2f703e0d0a3c703e3c656d3e546972652050726573737572653a3c2f656d3e20436f6c642077656174686572206166666563747320746972652070726573737572652e204f7572206775696465206578706c61696e7320686f7720746f206d61696e7461696e2074686520636f7272656374207469726520707265737375726520666f72206f7074696d616c207472616374696f6e20616e64206675656c20656666696369656e63792e3c2f703e0d0a3c703e3c7374726f6e673e456e67696e652050726f74656374696f6e3a3c2f7374726f6e673e3c2f703e0d0a3c703e3c656d3e416e7469667265657a65204d61696e74656e616e63653a3c2f656d3e2050726f70657220616e7469667265657a65206c6576656c732070726576656e7420667265657a696e6720616e64206f76657268656174696e672e2046696e64206f757420686f7720746f20636865636b20616e6420746f70206f666620796f757220616e7469667265657a652e3c2f703e0d0a3c703e3c656d3e42617474657279204865616c74683a3c2f656d3e20436f6c6420776561746865722063616e2073747261696e20796f757220626174746572792e204f757220677569646520636f7665727320686f7720746f207465737420616e64206d61696e7461696e20796f7572206261747465727920746f2070726576656e74207374617274696e67206973737565732e3c2f703e0d0a3c703e3c7374726f6e673e5669736962696c69747920616e64205361666574793a3c2f7374726f6e673e3c2f703e0d0a3c703e3c656d3e436c6561722057696e64736869656c64733a3c2f656d3e204c6561726e20686f7720746f20646566726f737420796f75722077696e64736869656c64206566666563746976656c7920616e6420656e7375726520636c656172207669736962696c6974792c206576656e20696e2074686520636f6c6465737420776561746865722e3c2f703e0d0a3c703e3c656d3e456d657267656e6379204b69743a3c2f656d3e205072657061726520666f7220756e65787065637465642077696e746572206368616c6c656e676573207769746820616e20656d657267656e6379206b69742e204f7572206775696465206c6973747320657373656e7469616c206974656d7320746f20696e636c75646520666f7220796f7572207361666574792e3c2f703e0d0a3c703e3c7374726f6e673e4578746572696f7220436172653a3c2f7374726f6e673e3c2f703e0d0a3c703e3c656d3e53616c7420616e6420527573742050726f74656374696f6e3a3c2f656d3e20526f61642073616c742063616e206c65616420746f20727573742e20446973636f76657220686f7720746f2070726f7465637420796f75722076656869636c65277320756e646572636172726961676520616e64206578746572696f722066726f6d2073616c742064616d6167652e3c2f703e0d0a3c703e3c656d3e57617368696e6720616e6420576178696e673a3c2f656d3e20526567756c61726c792077617368696e6720616e6420776178696e6720796f75722063617220647572696e672077696e7465722070726576656e747320636f72726f73697665206275696c64757020616e642070726f746563747320746865207061696e742e3c2f703e0d0a3c703e3c7374726f6e673e44726976696e6720546563686e69717565733a3c2f7374726f6e673e3c2f703e0d0a3c703e3c656d3e536166652057696e7465722044726976696e673a3c2f656d3e204272757368207570206f6e20736166652064726976696e672070726163746963657320666f722077696e74657220636f6e646974696f6e732c20696e636c7564696e67206272616b696e67206f6e206963652c206d61696e7461696e696e672061207361666520666f6c6c6f77696e672064697374616e63652c20616e64206d6f72652e3c2f703e0d0a3c703e3c656d3e41766f6964204f7665726578657274696f6e3a3c2f656d3e204578636573736976652073747261696e206f6e20796f757220656e67696e6520696e20636f6c6420776561746865722063616e2063617573652064616d6167652e204f7572206775696465206164766973657320796f75206f6e20686f7720746f2061766f696420756e6e6563657373617279207374726573732e3c2f703e0d0a3c703e427920666f6c6c6f77696e67206f75722077696e74657220636172206361726520746970732c20796f75276c6c2062652077656c6c2d707265706172656420746f207461636b6c6520746865206368616c6c656e676573206f662074686520636f6c6420736561736f6e2e205769746820612077656c6c2d6d61696e7461696e65642076656869636c652c20796f75276c6c2068617665207065616365206f66206d696e6420616e6420636f6e666964656e636520617320796f75206e617669676174652077696e74657220726f6164732c20656e737572696e6720796f752061727269766520736166656c7920617420796f75722064657374696e6174696f6e206e6f206d61747465722074686520776561746865722e3c2f703e, NULL, NULL, '2023-08-19 01:05:56', '2024-06-13 06:52:31'),
(45, 20, 44, 25, 'How to Handle Tenant Issues: A Guide for Landlords', 'how-to-handle-tenant-issues:-a-guide-for-landlords', 'Andrea', 0x3c703e417320746865206175746f6d6f7469766520696e6475737472792065766f6c7665732c20736f20646f2074686520746563686e6f6c6f676965732074686174206b656570207573207361666520616e6420656e68616e6365206f75722064726976696e6720657870657269656e63652e204f7572206c617465737420626c6f6720706f73742064656c76657320696e746f20746865206578636974696e6720776f726c64206f66206361722073616665747920616e6420746563686e6f6c6f677920696e6e6f766174696f6e732c20676976696e6720796f7520612066726f6e742d726f77207365617420746f2074686520667574757265206f662064726976696e672e2046726f6d20616476616e6365642064726976657220617373697374616e63652073797374656d732028414441532920746f2063757474696e672d6564676520636f6e6e65637469766974792066656174757265732c207765276c6c206578706c6f726520686f7720746865736520746563686e6f6c6f67696573206172652073686170696e67207468652077617920776520647269766520616e642074686520696d7061637420746865792068617665206f6e206f75722073616665747920616e6420636f6e76656e69656e63652e3c2f703e0d0a3c703e3c7374726f6e673e5468652052697365206f6620416476616e6365642044726976657220417373697374616e63652053797374656d73202841444153293a3c2f7374726f6e673e3c2f703e0d0a3c703e446973636f76657220686f77204144415320746563686e6f6c6f676965732073756368206173206c616e6520646570617274757265207761726e696e672c2061646170746976652063727569736520636f6e74726f6c2c20616e64206175746f6d6174696320656d657267656e6379206272616b696e6720617265207265766f6c7574696f6e697a696e67207468652077617920776520696e7465726163742077697468206f75722076656869636c65732e204f757220626c6f6720706f7374206578706c61696e73207468652066756e6374696f6e73206f6620656163682073797374656d2c2074686569722062656e656669747320696e2070726576656e74696e67206163636964656e74732c20616e6420686f77207468657920776f726b20746f67657468657220746f2063726561746520612073616665722064726976696e6720656e7669726f6e6d656e742e3c2f703e0d0a3c703e3c7374726f6e673e436f6e6e656374697669747920616e6420496e666f7461696e6d656e743a3c2f7374726f6e673e3c2f703e0d0a3c703e457870657269656e63652074686520636f6e76657267656e6365206f6620746563686e6f6c6f677920616e6420656e7465727461696e6d656e74207769746820746865206c617465737420636f6e6e65637469766974792066656174757265732e204c6561726e20686f77206d6f6465726e2076656869636c65732063616e20696e74656772617465207365616d6c6573736c792077697468206f757220736d61727470686f6e65732c2070726f766964696e672075732077697468207265616c2d74696d65206e617669676174696f6e2c2068616e64732d6672656520636f6d6d756e69636174696f6e2c20616e642061636365737320746f206d7573696320616e6420617070732e205765276c6c206578706c6f72652074686520757365722d667269656e646c7920696e74657266616365732074686174206d616b652064726976696e67206d6f726520636f6e76656e69656e7420616e6420656e6a6f7961626c652e3c2f703e0d0a3c703e3c7374726f6e673e436f6c6c6973696f6e2041766f6964616e636520546563686e6f6c6f676965733a3c2f7374726f6e673e3c2f703e0d0a3c703e496e2d6465707468206578706c6f726174696f6e206f6620636f6c6c6973696f6e2061766f6964616e636520746563686e6f6c6f676965732c20696e636c7564696e6720686f772073656e736f727320616e642063616d657261732064657465637420706f74656e7469616c20636f6c6c6973696f6e7320616e6420616c657274206472697665727320696e207265616c2074696d652e204f757220626c6f6720706f737420636f766572732073797374656d73206c696b6520626c696e642d73706f74206d6f6e69746f72696e672c20726561722063726f73732d7472616666696320616c6572742c20616e64207065646573747269616e20646574656374696f6e2c20616c6c2064657369676e656420746f20726564756365206163636964656e747320616e6420696d70726f7665207065646573747269616e207361666574792e3c2f703e0d0a3c703e3c7374726f6e673e5061726b696e6720417373697374616e636520616e64204175746f6e6f6d6f7573205061726b696e673a3c2f7374726f6e673e3c2f703e0d0a3c703e506172616c6c656c207061726b696e6720616e78696574792069732061207468696e67206f662074686520706173742077697468206175746f6e6f6d6f7573207061726b696e6720746563686e6f6c6f67792e20446973636f76657220686f772076656869636c65732065717569707065642077697468207468697320666561747572652063616e207363616e20616e64206e61766967617465207061726b696e672073706f74732c206d616b696e67207061726b696e6720696e20746967687420737061636573206120627265657a652e205765276c6c20616c736f20646973637573732074686520616476616e63656d656e747320696e206175746f6e6f6d6f75732064726976696e6720616e642074686520706f74656e7469616c207468657920686f6c6420666f722074686520667574757265206f66207472616e73706f72746174696f6e2e3c2f703e0d0a3c703e3c7374726f6e673e4e6967687420566973696f6e20616e6420456e68616e636564204c69676874696e673a3c2f7374726f6e673e3c2f703e0d0a3c703e44726976696e67206174206e696768742063616e206265206368616c6c656e67696e672c206275742077697468206e6967687420766973696f6e20746563686e6f6c6f67792c20796f752063616e20736565206265796f6e6420746865206c696d697473206f6620796f757220686561646c69676874732e204c6561726e2061626f757420696e6672617265642063616d6572617320616e6420686f7720746865792063616e20646574656374207065646573747269616e7320616e64206f62737461636c657320696e206c6f772d6c6967687420636f6e646974696f6e732e204f757220626c6f6720706f737420616c736f206578706c6f726573206164617074697665206c69676874696e672073797374656d7320746861742061646a75737420746f20726f616420636f6e646974696f6e7320616e6420696d70726f7665207669736962696c6974792e3c2f703e0d0a3c703e3c7374726f6e673e5468652050726f6d697365206f66204175746f6e6f6d6f75732056656869636c65733a3c2f7374726f6e673e3c2f703e0d0a3c703e5768696c652066756c6c79206175746f6e6f6d6f75732076656869636c657320617265207374696c6c20696e20646576656c6f706d656e742c206f757220626c6f6720706f73742070726f766964657320696e73696768747320696e746f207468652070726f6772657373206265696e67206d61646520616e642074686520706f74656e7469616c2062656e6566697473206f662073656c662d64726976696e6720636172732e205765276c6c20646973637573732074686520646966666572656e74206c6576656c73206f66206175746f6d6174696f6e2c20746865206368616c6c656e676573206661636564206279206175746f6e6f6d6f75732076656869636c6520646576656c6f706572732c20616e642074686520776179732074686573652076656869636c657320636f756c6420726573686170652074686520667574757265206f66207472616e73706f72746174696f6e2e3c2f703e0d0a3c703e3c7374726f6e673e4379626572736563757269747920616e64204461746120507269766163793a3c2f7374726f6e673e3c2f703e0d0a3c703e41732063617273206265636f6d65206d6f726520636f6e6e65637465642c2063796265727365637572697479206265636f6d6573206120637269746963616c20636f6e73696465726174696f6e2e204f757220626c6f6720706f7374206164647265737365732074686520696d706f7274616e6365206f662070726f74656374696e672076656869636c6520646174612066726f6d206379626572207468726561747320616e642064697363757373657320686f7720636172206d616e756661637475726572732061726520696d706c656d656e74696e67206d6561737572657320746f20736166656775617264206f7572207072697661637920616e642073656375726974792e3c2f703e0d0a3c703e456d62726163652074686520667574757265206f662064726976696e672077697468206f7572206578706c6f726174696f6e206f66206361722073616665747920616e6420746563686e6f6c6f677920696e6e6f766174696f6e732e2046726f6d20616476616e6365642064726976657220617373697374616e63652073797374656d732074686174206163742061732061207365636f6e642070616972206f66206579657320746f20636f6e6e65637469766974792066656174757265732074686174206b65657020796f7520656e7465727461696e656420616e6420636f6e6e6563746564206f6e2074686520676f2c20746865736520616476616e63656d656e747320617265206e6f74206f6e6c79206368616e67696e6720746865207761792077652064726976652062757420616c736f20656e68616e63696e67207468652073616665747920616e6420636f6e76656e69656e6365206f66206f7572206a6f75726e6579732e204a6f696e2075732061732077652074616b6520612064656570206469766520696e746f207468652063757474696e672d6564676520746563686e6f6c6f6769657320746861742061726520726573686170696e6720746865206175746f6d6f74697665206c616e6473636170652e3c2f703e, NULL, NULL, '2023-08-19 01:11:12', '2024-06-13 06:54:22'),
(47, 20, 45, 26, 'How Economic Changes Are Impacting the Housing Market', 'how-economic-changes-are-impacting-the-housing-market', 'Kylie', 0x3c703e48697420746865206f70656e20726f616420616e64206c6561766520796f757220776f727269657320626568696e64206173207765206469766520696e746f2074686520657868696c61726174696e6720776f726c64206f6620726f6164207472697020616476656e74757265732e204f7572206c617465737420626c6f6720706f737420697320796f757220756c74696d61746520677569646520746f20706c616e6e696e672c20657870657269656e63696e672c20616e642072656c697368696e672074686520746872696c6c206f662074686520677265617420416d65726963616e20726f616420747269702e205768657468657220796f75277265207365656b696e672062726561746874616b696e67206c616e647363617065732c2068696464656e2067656d732c206f7220756e666f726765747461626c6520657870657269656e6365732c20746869732067756964652077696c6c20657175697020796f7520776974682065766572797468696e6720796f75206e65656420746f206b6e6f7720746f20637265617465206d656d6f7269657320746861742077696c6c206c6173742061206c69666574696d652e3c2f703e0d0a3c703e3c7374726f6e673e4d617070696e6720596f757220526f7574653a3c2f7374726f6e673e3c2f703e0d0a3c703e446973636f7665722074686520617274206f6620726f75746520706c616e6e696e6720616e64206578706c6f7265207469707320666f72206372616674696e6720746865207065726665637420726f61642074726970206974696e65726172792e204f757220626c6f6720706f73742077696c6c20677569646520796f75207468726f7567682063686f6f73696e6720796f75722064657374696e6174696f6e732c20657374696d6174696e672074726176656c2074696d65732c20616e642066696e64696e67207363656e696320726f7574657320746861742074616b6520796f75206f6666207468652062656174656e20706174682e3c2f703e0d0a3c703e3c7374726f6e673e5061636b696e6720457373656e7469616c733a3c2f7374726f6e673e3c2f703e0d0a3c703e5061636b206c696b6520612070726f2077697468206f757220636f6d70726568656e73697665207061636b696e67206c6973742e204c6561726e207768617420636c6f7468696e672c20676561722c20616e6420657373656e7469616c7320746f206272696e6720616c6f6e6720746f20656e7375726520796f7527726520707265706172656420666f7220616e7920736974756174696f6e2c2066726f6d206368616e67696e67207765617468657220746f2073706f6e74616e656f7573206465746f7572732e3c2f703e0d0a3c703e3c7374726f6e673e43756c696e6172792044656c6967687473206f6e2074686520526f61643a3c2f7374726f6e673e3c2f703e0d0a3c703e44656c766520696e746f2074686520776f726c64206f6620726f616420747269702063756973696e652c2066726f6d20746865206a6f79206f6620646973636f766572696e67206c6f63616c2064696e65727320746f207061636b696e6720796f7572206f776e207069636e696320737072656164732e204f75722067756964652077696c6c206f6666657220696e73696768747320696e746f2066696e64696e672067726561742064696e696e672073706f74732c20636f6f6b696e67206f6e2074686520676f2c20616e6420696e64756c67696e6720696e20726567696f6e616c2064656c696361636965732e3c2f703e0d0a3c703e3c7374726f6e673e436170747572696e67204d656d6f726965733a3c2f7374726f6e673e3c2f703e0d0a3c703e446f6e2774206d697373206f7574206f6e20636170747572696e672074686520626561757479206f6620796f7572206a6f75726e65792e204f757220626c6f6720706f73742077696c6c20646973637573732070686f746f677261706879207469707320666f7220646f63756d656e74696e6720796f757220726f616420747269702c20696e636c7564696e6720686f7720746f2063617074757265207374756e6e696e67206c616e647363617065732c2063616e646964206d6f6d656e74732c20616e642073656c66696573207468617420656e63617073756c6174652074686520737069726974206f6620616476656e747572652e3c2f703e0d0a3c703e3c7374726f6e673e46696e64696e67204163636f6d6d6f646174696f6e3a3c2f7374726f6e673e3c2f703e0d0a3c703e4c6561726e2061626f7574207468652076617269657479206f66206163636f6d6d6f646174696f6e206f7074696f6e7320617661696c61626c6520746f20726f61642074726970706572732c2066726f6d20747261646974696f6e616c20686f74656c7320746f2063616d70696e6720616e64205256696e672e205765276c6c20677569646520796f75207468726f756768207468652070726f63657373206f6620626f6f6b696e6720616e642073746179696e6720696e20756e69717565206163636f6d6d6f646174696f6e732074686174206164642061207370656369616c20746f75636820746f20796f7572206a6f75726e65792e3c2f703e0d0a3c703e3c7374726f6e673e456d62726163696e672053706f6e74616e656974793a3c2f7374726f6e673e3c2f703e0d0a3c703e5768696c6520706c616e6e696e6720697320696d706f7274616e742c20736f6d65206f6620746865206265737420726f61642074726970206d656d6f72696573206172652063726561746564206f6e207468652073707572206f6620746865206d6f6d656e742e204f757220626c6f6720706f73742077696c6c20656e636f757261676520796f7520746f20656d62726163652073706f6e74616e656974792c206f66666572696e672074697073206f6e207265636f676e697a696e67206f70706f7274756e697469657320666f72206465746f7572732c20756e657870656374656420616476656e74757265732c20616e64206d656d6f7261626c6520656e636f756e746572732e3c2f703e0d0a3c703e3c7374726f6e673e53746179696e67205361666520616e642050726570617265643a3c2f7374726f6e673e3c2f703e0d0a3c703e53616665747920697320706172616d6f756e7420647572696e6720796f757220726f6164207472697020616476656e747572652e204f75722067756964652077696c6c20636f76657220657373656e7469616c2073616665747920746970732c20696e636c7564696e672076656869636c65206d61696e74656e616e63652c20656d657267656e6379206b6974732c20616e642073746179696e6720636f6e6e65637465642077697468206c6f766564206f6e65732e3c2f703e0d0a3c703e3c7374726f6e673e427564676574696e6720666f7220746865204a6f75726e65793a3c2f7374726f6e673e3c2f703e0d0a3c703e456d6261726b696e67206f6e206120726f6164207472697020646f65736e2774206861766520746f20627265616b207468652062616e6b2e204f757220626c6f6720706f73742077696c6c2070726f766964652070726163746963616c20616476696365206f6e20627564676574696e6720666f7220796f757220616476656e747572652c20696e636c7564696e67207469707320666f7220736176696e67206f6e206761732c206163636f6d6d6f646174696f6e732c20616e6420616374697669746965732e3c2f703e0d0a3c703e3c7374726f6e673e456d6f74696f6e616c204a6f75726e6579733a3c2f7374726f6e673e3c2f703e0d0a3c703e4265796f6e642074686520706879736963616c206a6f75726e65792c206120726f616420747269702063616e20626520616e20656d6f74696f6e616c206f6e652061732077656c6c2e204f75722067756964652077696c6c206578706c6f72652074686520706572736f6e616c2067726f7774682c20626f6e64696e67206d6f6d656e74732c20616e64207265666c656374696f6e732074686174206f6674656e20636f6d65207769746820746865207465727269746f7279206f66206c6f6e672064726976657320616e64206e657720657870657269656e6365732e3c2f703e0d0a3c703e3c7374726f6e673e5361766f72696e6720746865204a6f75726e65793a3c2f7374726f6e673e3c2f703e0d0a3c703e496e2074686520656e642c206120726f61642074726970206973206173206d7563682061626f757420746865206a6f75726e65792061732069742069732061626f7574207468652064657374696e6174696f6e732e204f757220626c6f6720706f73742077696c6c20656e636f757261676520796f7520746f207361766f7220746865206d6f6d656e74732c2066726f6d20746865206665656c696e67206f662066726565646f6d206f6e20746865206f70656e20726f616420746f20746865206a6f79206f6620646973636f766572696e672074686520756e65787065637465642e3c2f703e0d0a3c703e4a6f696e207573206173207765206869742074686520726f61642c206578706c6f72696e6720746865206865617274206f6620726f6164207472697020616476656e74757265732e205768657468657220796f75277265206120736561736f6e65642074726176656c6572206f7220612066697273742d74696d6520726f616420747269707065722c206f75722067756964652069732064657369676e656420746f20696e73706972652c20696e666f726d2c20616e6420656d706f77657220796f7520746f2063726561746520796f7572206f776e20756e666f726765747461626c65206a6f75726e65792c20636f6d706c6574652077697468207374756e6e696e67206c616e647363617065732c2073706f6e74616e656f7573206465746f7572732c20616e64206d656d6f7269657320746861742077696c6c2073746179207769746820796f7520666f72657665722e3c2f703e, 'Blog', NULL, '2023-08-19 01:17:26', '2024-06-13 07:41:47');
INSERT INTO `blog_informations` (`id`, `language_id`, `blog_category_id`, `blog_id`, `title`, `slug`, `author`, `content`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(49, 25, 52, 26, 'كيف تؤثر التغيرات الاقتصادية على سوق الإسكان', 'كيف-تؤثر-التغيرات-الاقتصادية-على-سوق-الإسكان', 'كايلي', 0x3c703ed8a7d986d8b7d984d98220d8a5d984d98920d8a7d984d8b7d8b1d98ad98220d8a7d984d985d981d8aad988d8ad20d988d8a7d8aad8b1d98320d987d985d988d985d98320d8aed984d981d98320d8a8d98ad986d985d8a720d986d8bad988d8b520d981d98a20d8b9d8a7d984d98520d985d8a8d987d8ac20d985d98620d985d8bad8a7d985d8b1d8a7d8aa20d8a7d984d8b1d8add984d8a7d8aa20d8a7d984d8a8d8b1d98ad8a92e20d8a3d8add8afd8ab20d985d986d8b4d988d8b120d8b9d984d98920d985d8afd988d986d8aad986d8a720d987d98820d8afd984d98ad984d98320d8a7d984d986d987d8a7d8a6d98a20d984d984d8aad8aed8b7d98ad8b720d988d8a7d984d8aad8acd8b1d8a8d8a920d988d8a7d984d8a7d8b3d8aad985d8aad8a7d8b920d8a8d8a5d8abd8a7d8b1d8a920d8a7d984d8b1d8add984d8a920d8a7d984d8a8d8b1d98ad8a920d8a7d984d8a3d985d8b1d98ad983d98ad8a920d8a7d984d8b9d8b8d98ad985d8a92e20d8b3d988d8a7d8a120d983d986d8aa20d8aad8a8d8add8ab20d8b9d98620d985d986d8a7d8b8d8b120d8b7d8a8d98ad8b9d98ad8a920d8aed984d8a7d8a8d8a9d88c20d8a3d98820d8acd988d8a7d987d8b120d985d8aed981d98ad8a9d88c20d8a3d98820d8aad8acd8a7d8b1d8a820d984d8a720d8aad98fd986d8b3d989d88c20d981d8a5d98620d987d8b0d8a720d8a7d984d8afd984d98ad98420d8b3d98ad8b2d988d8afd98320d8a8d983d98420d985d8a720d8aad8add8aad8a7d8ac20d8a5d984d98920d985d8b9d8b1d981d8aad98720d984d8a5d986d8b4d8a7d8a120d8b0d983d8b1d98ad8a7d8aa20d8aad8afd988d98520d985d8afd98920d8a7d984d8add98ad8a7d8a92e3c2f703e0d0a3c703ed8b1d8b3d98520d8aed8b1d98ad8b7d8a920d984d985d8b3d8a7d8b1d9833a3c2f703e0d0a3c703ed8a7d983d8aad8b4d98120d981d98620d8aad8aed8b7d98ad8b720d8a7d984d8b7d8b1d98ad98220d988d8a7d8b3d8aad983d8b4d98120d8a7d984d986d8b5d8a7d8a6d8ad20d984d8b5d98ad8a7d8bad8a920d8aed8b720d8b3d98ad8b120d8a7d984d8b1d8add984d8a920d8a7d984d985d8abd8a7d984d98a2e20d8b3d988d98120d98ad8b1d8b4d8afd98320d985d986d8b4d988d8b120d985d8afd988d986d8aad986d8a720d8aed984d8a7d98420d8a7d8aed8aad98ad8a7d8b120d988d8acd987d8a7d8aad983d88c20d988d8aad982d8afd98ad8b120d8a3d988d982d8a7d8aa20d8a7d984d8b3d981d8b1d88c20d988d8a5d98ad8acd8a7d8af20d8a7d984d8b7d8b1d98220d8b0d8a7d8aa20d8a7d984d985d986d8a7d8b8d8b120d8a7d984d8aed984d8a7d8a8d8a920d8a7d984d8aad98a20d8aad8a8d8b9d8afd98320d8b9d98620d8a7d984d8b7d8b1d98220d8a7d984d985d8a3d984d988d981d8a92e3c2f703e0d0a3c703ed8a3d8b3d8a7d8b3d98ad8a7d8aa20d8a7d984d8aad8b9d8a8d8a6d8a93a3c2f703e0d0a3c703ed982d98520d8a8d8a7d984d8aad8b9d8a8d8a6d8a920d985d8abd98420d8a7d984d985d8add8aad8b1d981d98ad98620d985d98620d8aed984d8a7d98420d982d8a7d8a6d985d8a920d8a7d984d8aad8b9d8a8d8a6d8a920d8a7d984d8b4d8a7d985d984d8a920d8a7d984d8aed8a7d8b5d8a920d8a8d986d8a72e20d8aad8b9d8b1d98120d8b9d984d98920d8a7d984d985d984d8a7d8a8d8b320d988d8a7d984d8b9d8aad8a7d8af20d988d8a7d984d8a3d8b3d8a7d8b3d98ad8a7d8aa20d8a7d984d8aad98a20d98ad8acd8a820d8b9d984d98ad98320d8a5d8add8b6d8a7d8b1d987d8a720d985d8b9d98320d984d984d8aad8a3d983d8af20d985d98620d8a3d986d98320d985d8b3d8aad8b9d8af20d984d8a3d98a20d985d988d982d981d88c20d8a8d8afd8a1d98bd8a720d985d98620d8a7d984d8b7d982d8b320d8a7d984d985d8aad8bad98ad8b120d988d8add8aad98920d8a7d984d8a7d986d8b9d8b7d8a7d981d8a7d8aa20d8a7d984d8b9d981d988d98ad8a92e3c2f703e0d0a3c703ed8a7d984d985d8b3d8b1d8a7d8aa20d8a7d984d8b7d987d98a20d8b9d984d98920d8a7d984d8b7d8b1d98ad9823a3c2f703e0d0a3c703ed8a7d986d8bad985d8b320d981d98a20d8b9d8a7d984d98520d8a7d984d985d8a3d983d988d984d8a7d8aa20d8a7d984d8aed8a7d8b5d8a920d8a8d8b1d8add984d8a7d8aa20d8a7d984d8b7d8b1d98ad982d88c20d8a8d8afd8a1d98bd8a720d985d98620d985d8aad8b9d8a920d8a7d983d8aad8b4d8a7d98120d8a7d984d985d8b7d8a7d8b9d98520d8a7d984d985d8add984d98ad8a920d988d8add8aad98920d8aad8acd987d98ad8b220d8a3d8b7d8b9d985d8a920d8a7d984d986d8b2d987d8a920d8a7d984d8aed8a7d8b5d8a920d8a8d9832e20d8b3d98ad982d8afd98520d8afd984d98ad984d986d8a720d8b1d8a4d98920d8add988d98420d8a7d984d8b9d8abd988d8b120d8b9d984d98920d8a3d985d8a7d983d98620d8b1d8a7d8a6d8b9d8a920d984d8aad986d8a7d988d98420d8a7d984d8b7d8b9d8a7d985d88c20d988d8a7d984d8b7d987d98a20d8a3d8abd986d8a7d8a120d8a7d984d8aad986d982d984d88c20d988d8a7d984d8a7d8b3d8aad985d8aad8a7d8b920d8a8d8a7d984d8a3d8b7d8a8d8a7d98220d8a7d984d8a5d982d984d98ad985d98ad8a920d8a7d984d8b4d987d98ad8a92e3c2f703e0d0a3c703ed8a7d984d8aad982d8a7d8b720d8a7d984d8b0d983d8b1d98ad8a7d8aa3a3c2f703e0d0a3c703ed984d8a720d8aad981d988d8aa20d981d8b1d8b5d8a920d8a7d984d8aad982d8a7d8b720d8acd985d8a7d98420d8b1d8add984d8aad9832e20d8b3d8aad986d8a7d982d8b420d985d986d8b4d988d8b120d985d8afd988d986d8aad986d8a720d986d8b5d8a7d8a6d8ad20d8a7d984d8aad8b5d988d98ad8b120d8a7d984d981d988d8aad988d8bad8b1d8a7d981d98a20d984d8aad988d8abd98ad98220d8b1d8add984d8aad98320d8a7d984d8a8d8b1d98ad8a9d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d983d98ad981d98ad8a920d8a7d984d8aad982d8a7d8b720d8a7d984d985d986d8a7d8b8d8b120d8a7d984d8b7d8a8d98ad8b9d98ad8a920d8a7d984d985d8b0d987d984d8a920d988d8a7d984d984d8add8b8d8a7d8aa20d8a7d984d8b5d8b1d98ad8add8a920d988d8b5d988d8b120d8a7d984d8b3d98ad984d981d98a20d8a7d984d8aad98a20d8aad984d8aed8b520d8b1d988d8ad20d8a7d984d985d8bad8a7d985d8b1d8a92e3c2f703e0d0a3c703ed8a5d98ad8acd8a7d8af20d8a7d984d8b3d983d9863a3c2f703e0d0a3c703ed8aad8b9d8b1d98120d8b9d984d98920d985d8acd985d988d8b9d8a920d985d8aad986d988d8b9d8a920d985d98620d8aed98ad8a7d8b1d8a7d8aa20d8a7d984d8a5d982d8a7d985d8a920d8a7d984d985d8aad8a7d8add8a920d984d985d8b3d8a7d981d8b1d98a20d8a7d984d8b7d8b1d982d88c20d8a8d8afd8a1d98bd8a720d985d98620d8a7d984d981d986d8a7d8afd98220d8a7d984d8aad982d984d98ad8afd98ad8a920d988d988d8b5d988d984d8a7d98b20d8a5d984d98920d8a3d985d8a7d983d98620d8a7d984d8aad8aed98ad98ad98520d988d8a7d984d985d8b1d983d8a8d8a7d8aa20d8a7d984d8aad8b1d981d98ad987d98ad8a92e20d8b3d986d8b1d8b4d8afd98320d8aed984d8a7d98420d8b9d985d984d98ad8a920d8a7d984d8add8acd8b220d988d8a7d984d8a5d982d8a7d985d8a920d981d98a20d8a3d985d8a7d983d98620d8a5d982d8a7d985d8a920d981d8b1d98ad8afd8a920d8aad8b6d98ad98120d984d985d8b3d8a920d8aed8a7d8b5d8a920d8a5d984d98920d8b1d8add984d8aad9832e3c2f703e0d0a3c703ed982d8a8d988d98420d8a7d984d8b9d981d988d98ad8a93a3c2f703e0d0a3c703ed8b9d984d98920d8a7d984d8b1d8bad98520d985d98620d8a3d987d985d98ad8a920d8a7d984d8aad8aed8b7d98ad8b7d88c20d8a5d984d8a720d8a3d98620d8a8d8b9d8b6d98bd8a720d985d98620d8a3d981d8b6d98420d8b0d983d8b1d98ad8a7d8aa20d8a7d984d8b1d8add984d8a7d8aa20d8a7d984d8a8d8b1d98ad8a920d98ad8aad98520d8a5d986d8b4d8a7d8a4d987d8a720d981d98a20d984d8add8b8d8a92e20d8b3d988d98120d98ad8b4d8acd8b9d98320d985d986d8b4d988d8b120d985d8afd988d986d8aad986d8a720d8b9d984d98920d8aad8a8d986d98a20d8a7d984d8b9d981d988d98ad8a9d88c20d988d98ad982d8afd98520d986d8b5d8a7d8a6d8ad20d8add988d98420d8a7d984d8aad8b9d8b1d98120d8b9d984d98920d981d8b1d8b520d8a7d984d8a7d986d8b9d8b7d8a7d981d8a7d8aad88c20d988d8a7d984d985d8bad8a7d985d8b1d8a7d8aa20d8bad98ad8b120d8a7d984d985d8aad988d982d8b9d8a9d88c20d988d8a7d984d984d982d8a7d8a1d8a7d8aa20d8a7d984d8aad98a20d984d8a720d8aad986d8b3d9892e3c2f703e0d0a3c703ed8a7d984d8a8d982d8a7d8a120d8a2d985d986d98bd8a720d988d985d8b3d8aad8b9d8afd98bd8a73a3c2f703e0d0a3c703ed8aad8b9d8aad8a8d8b120d8a7d984d8b3d984d8a7d985d8a920d8a3d985d8b1d98bd8a720d8a8d8a7d984d8ba20d8a7d984d8a3d987d985d98ad8a920d8a3d8abd986d8a7d8a120d985d8bad8a7d985d8b1d8a920d8b1d8add984d8aad98320d8b9d984d98920d8a7d984d8b7d8b1d98ad9822e20d8b3d98ad8bad8b7d98a20d8afd984d98ad984d986d8a720d986d8b5d8a7d8a6d8ad20d8a7d984d8b3d984d8a7d985d8a920d8a7d984d8a3d8b3d8a7d8b3d98ad8a9d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d8b5d98ad8a7d986d8a920d8a7d984d985d8b1d983d8a8d8a7d8aa20d988d985d8b9d8afd8a7d8aa20d8a7d984d8b7d988d8a7d8b1d8a620d988d8a7d984d8a8d982d8a7d8a120d8b9d984d98920d8a7d8aad8b5d8a7d98420d985d8b920d8a3d8add8a8d8a7d8a6d9832e3c2f703e0d0a3c703ed985d98ad8b2d8a7d986d98ad8a920d8a7d984d8b1d8add984d8a93a3c2f703e0d0a3c703ed8a7d984d8b4d8b1d988d8b920d981d98a20d8b1d8add984d8a920d8a8d8b1d98ad8a920d984d8a720d98ad8aad8b7d984d8a820d983d8b3d8b120d8a7d984d8a8d986d9832e20d8b3d98ad982d8afd98520d985d986d8b4d988d8b120d985d8afd988d986d8aad986d8a720d986d8b5d8a7d8a6d8ad20d8b9d985d984d98ad8a920d8add988d98420d988d8b6d8b920d985d98ad8b2d8a7d986d98ad8a920d984d985d8bad8a7d985d8b1d8aad983d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d986d8b5d8a7d8a6d8ad20d984d8aad988d981d98ad8b120d8a7d984d988d982d988d8af20d988d8a7d984d8a5d982d8a7d985d8a920d988d8a7d984d8a3d986d8b4d8b7d8a92e3c2f703e0d0a3c703ed8a7d984d8b1d8add984d8a7d8aa20d8a7d984d8b9d8a7d8b7d981d98ad8a93a3c2f703e0d0a3c703ed8a8d8b9d98ad8afd98bd8a720d8b9d98620d8a7d984d8b1d8add984d8a920d8a7d984d8acd8b3d8afd98ad8a9d88c20d98ad985d983d98620d8a3d98620d8aad983d988d98620d8a7d984d8b1d8add984d8a920d8a7d984d8a8d8b1d98ad8a920d8b1d8add984d8a920d8b9d8a7d8b7d981d98ad8a920d8a3d98ad8b6d98bd8a72e20d8b3d988d98120d98ad8b3d8aad983d8b4d98120d8afd984d98ad984d986d8a720d8a7d984d986d985d98820d8a7d984d8b4d8aed8b5d98a20d988d984d8add8b8d8a7d8aa20d8a7d984d8aad8b1d8a7d8a8d8b720d988d8a7d984d8aad8a3d985d984d8a7d8aa20d8a7d984d8aad98a20d8bad8a7d984d8a8d98bd8a720d985d8a720d8aad8a3d8aad98a20d985d8b920d985d986d8b7d982d8a920d8a7d984d8b1d8add984d8a7d8aa20d8a7d984d8b7d988d98ad984d8a920d988d8a7d984d8aad8acd8a7d8b1d8a820d8a7d984d8acd8afd98ad8afd8a92e3c2f703e0d0a3c703ed8aad8b0d988d98220d8a7d984d8b1d8add984d8a93a3c2f703e0d0a3c703ed981d98a20d8a7d984d986d987d8a7d98ad8a9d88c20d8a7d984d8b1d8add984d8a920d8a7d984d8a8d8b1d98ad8a920d8aad8aad8b9d984d98220d8a8d8a7d984d8b1d8add984d8a920d8a8d982d8afd8b120d985d8a720d8aad8aad8b9d984d98220d8a8d8a7d984d988d8acd987d8a92e20d8b3d988d98120d98ad8b4d8acd8b9d98320d985d986d8b4d988d8b120d985d8afd988d986d8aad986d8a720d8b9d984d98920d8a7d984d8a7d8b3d8aad985d8aad8a7d8b920d8a8d8a7d984d984d8add8b8d8a7d8aad88c20d8a8d8afd8a1d98bd8a720d985d98620d8a7d984d8b4d8b9d988d8b120d8a8d8a7d984d8add8b1d98ad8a920d8b9d984d98920d8a7d984d8b7d8b1d98ad98220d8a7d984d985d981d8aad988d8ad20d988d8add8aad98920d985d8aad8b9d8a920d8a7d983d8aad8b4d8a7d98120d985d8a720d987d98820d8bad98ad8b120d985d8aad988d982d8b92e3c2f703e0d0a3c703ed8a7d986d8b6d98520d8a5d984d98ad986d8a720d988d986d8add98620d986d8b3d98ad8b120d8b9d984d98920d8a7d984d8b7d8b1d98ad982d88c20d988d986d8b3d8aad983d8b4d98120d982d984d8a820d985d8bad8a7d985d8b1d8a7d8aa20d8a7d984d8b1d8add984d8a7d8aa20d8a7d984d8a8d8b1d98ad8a92e20d8b3d988d8a7d8a120d983d986d8aa20d985d8b3d8a7d981d8b1d98bd8a720d985d8aad985d8b1d8b3d98bd8a720d8a3d98820d985d8b3d8a7d981d8b1d98bd8a720d8b9d984d98920d8a7d984d8b7d8b1d98ad98220d984d8a3d988d98420d985d8b1d8a9d88c20d981d982d8af20d8aad98520d8aad8b5d985d98ad98520d8afd984d98ad984d986d8a720d984d8a5d984d987d8a7d985d98320d988d8a5d8b9d984d8a7d985d98320d988d8aad985d983d98ad986d98320d985d98620d8a5d986d8b4d8a7d8a120d8b1d8add984d8aad98320d8a7d984d8aad98a20d984d8a720d8aad98fd986d8b3d989d88c20d988d8a7d984d8aad98a20d8aad983d8aad985d98420d8a8d8a7d984d985d986d8a7d8b8d8b120d8a7d984d8b7d8a8d98ad8b9d98ad8a920d8a7d984d8aed984d8a7d8a8d8a920d988d8a7d984d8aad8add988d98ad984d8a7d8aa20d8a7d984d8b9d981d988d98ad8a920d988d8a7d984d8b0d983d8b1d98ad8a7d8aa20d8a7d984d8aad98a20d8b3d8aad8a8d982d98920d985d8b9d98320d8a5d984d98920d8a7d984d8a3d8a8d8af2e202e3c2f703e, NULL, NULL, '2024-05-08 04:45:37', '2024-06-14 09:19:47'),
(52, 25, 55, 22, '\"دليل مشتري المنازل لأول مرة: 10 نصائح أساسية للنجاح', 'دليل-مشتري-المنازل-لأول-مرة:-10-نصائح-أساسية-للنجاح', 'جون ديو', 0x3c703ed987d98420d8aad981d983d8b120d981d98a20d8a7d984d8bad988d8b520d981d98a20d8b9d8a7d984d98520d8aad8b3d988d98220d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a9d89f20d984d8a720d985d8b2d98ad8af20d985d98620d8a7d984d8a8d8add8ab2e20d8aad98520d8aad8b5d985d98ad98520d8a3d8add8afd8ab20d985d986d8b4d988d8b1d8a7d8aad986d8a720d8b9d984d98920d8a7d984d985d8afd988d986d8a920d984d8aad983d988d98620d8a8d988d8b5d984d8aad98320d8b9d8a8d8b120d8b3d988d98220d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a9d88c20d8add98ad8ab20d8aad988d8acd987d98320d986d8add98820d8b9d985d984d98ad8a920d8b4d8b1d8a7d8a120d986d8a7d8acd8add8a920d988d985d8b1d8b6d98ad8a92e20d8a8d981d8b6d98420d986d8b5d8a7d8a6d8ad20d988d8b1d8a4d98920d8a7d984d8aed8a8d8b1d8a7d8a120d987d8b0d987d88c20d8b3d8aad983d988d98620d985d8acd987d8b2d98bd8a720d984d8a7d8b3d8aad983d8b4d8a7d98120d982d988d8a7d8a6d98520d8a7d984d8a8d98ad8a7d986d8a7d8aa20d988d8aad982d98ad98ad98520d8a7d984d8aed98ad8a7d8b1d8a7d8aa20d8a8d8abd982d8a920d988d8a7d984d8a7d986d8b7d984d8a7d98220d8a8d8b3d98ad8a7d8b1d8a920d985d8b3d8aad8b9d985d984d8a920d8aad984d8a8d98a20d8a7d8add8aad98ad8a7d8acd8a7d8aad98320d988d8aad8aad8acd8a7d988d8b220d8aad988d982d8b9d8a7d8aad9832e3c2f703e0d0a3c703ed981d987d98520d8a7d8aad8acd8a7d987d8a7d8aa20d8a7d984d8b3d988d9823a20d8b3d988d98220d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a920d8afd98ad986d8a7d985d98ad983d98ad88c20d988d98ad985d983d98620d8a3d98620d8aad8aed8aad984d98120d8a7d984d8a3d8b3d8b9d8a7d8b120d8a8d8b4d983d98420d983d8a8d98ad8b120d8a8d986d8a7d8a1d98b20d8b9d984d98920d8b9d988d8a7d985d98420d985d8abd98420d8a7d984d8b7d984d8a820d988d8a7d984d985d988d8b3d985d98ad8a920d988d8a7d984d985d988d982d8b92e20d8b3d98ad8b3d8a7d8b9d8afd98320d8afd984d98ad984d986d8a720d8b9d984d98920d981d987d98520d8a7d8aad8acd8a7d987d8a7d8aa20d8a7d984d8b3d988d98220d8a7d984d8add8a7d984d98ad8a9d88c20d985d985d8a720d98ad8aad98ad8ad20d984d98320d8a7d8aad8aed8a7d8b020d982d8b1d8a7d8b1d8a7d8aa20d985d8b3d8aad986d98ad8b1d8a920d8a8d8b4d8a3d98620d985d988d8b9d8af20d8a7d984d8b4d8b1d8a7d8a120d988d8a7d984d986d985d8a7d8b0d8ac20d8a7d984d8aad98a20d982d8af20d8aad982d8afd98520d982d98ad985d8a920d8a3d981d8b6d9842e3c2f703e0d0a3c703ed8a7d984d8a8d8add8ab20d987d98820d8a7d984d985d981d8aad8a7d8ad3a20d984d8a720d8aad982d984d98420d8a3d8a8d8afd98bd8a720d985d98620d982d988d8a920d8a7d984d8a8d8add8ab2e20d8b3d988d98120d98ad8b3d984d8b720d985d986d8b4d988d8b1d986d8a720d8a7d984d8b6d988d8a120d8b9d984d98920d8a3d987d985d98ad8a920d8a7d984d8a8d8add8ab20d8b9d98620d985d8a7d8b1d983d8a7d8aa20d988d986d985d8a7d8b0d8ac20d985d8add8afd8afd8a920d8aad987d985d9832e20d988d8b3d8aad8aad8b9d984d98520d983d98ad981d98ad8a920d8a7d984d983d8b4d98120d8b9d98620d985d8b9d984d988d985d8a7d8aa20d8add988d98420d8a7d984d985d8b4d983d984d8a7d8aa20d8a7d984d8b4d8a7d8a6d8b9d8a920d988d8aad983d8a7d984d98ad98120d8a7d984d8a5d8b5d984d8a7d8ad20d988d985d8afd98920d8aad988d981d8b120d982d8b7d8b920d8a7d984d8bad98ad8a7d8b12e20d988d985d98620d8aed984d8a7d98420d987d8b0d98720d8a7d984d985d8b9d8b1d981d8a9d88c20d98ad985d983d986d98320d8a8d983d98420d8abd982d8a920d8aad8add8afd98ad8af20d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d986d8a7d8b3d8a8d8a920d984d8a7d8add8aad98ad8a7d8acd8a7d8aad9832e3c2f703e0d0a3c703ed8aad8add8afd98ad8af20d8aad988d982d8b9d8a7d8aa20d988d8a7d982d8b9d98ad8a93a20d8a8d98ad986d985d8a720d986d8add984d98520d8acd985d98ad8b9d98bd8a720d8a8d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d8abd8a7d984d98ad8a9d88c20d981d985d98620d8a7d984d985d987d98520d8a5d8afd8a7d8b1d8a920d8aad988d982d8b9d8a7d8aad98320d8b9d986d8af20d8b4d8b1d8a7d8a120d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d8b3d8aad8b9d985d984d8a92e20d8b3d986d982d8afd98520d986d8b5d8a7d8a6d8ad20d8add988d98420d985d8a720d98ad985d983d98620d8aad988d982d8b9d98720d985d98620d8a7d984d8aad8a2d983d98420d988d8a7d984d8aad984d98120d985d98620d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d8b3d8aad8b9d985d984d8a920d988d983d98ad981d98ad8a920d8a7d984d8aad985d98ad98ad8b220d8a8d98ad98620d8b9d984d8a7d985d8a7d8aa20d8a7d984d8a7d8b3d8aad8aed8afd8a7d98520d8a7d984d985d982d8a8d988d984d8a920d988d8a7d984d8a3d8b9d984d8a7d98520d8a7d984d8add985d8b1d8a7d8a120d8a7d984d985d8add8aad985d984d8a92e3c2f703e0d0a3c703ed8a7d984d986d8b8d8b120d981d98a20d8a7d984d985d8b1d983d8a8d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a920d8a7d984d985d8b9d8aad985d8afd8a9202843504f293a20d8aad988d981d8b120d8a7d984d985d8b1d983d8a8d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a920d8a7d984d985d8b9d8aad985d8afd8a920d8add984d8a7d98b20d988d8b3d8b7d8a7d98b20d8acd8b0d8a7d8a8d8a7d98b20d8a8d98ad98620d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a920d8a7d984d8acd8afd98ad8afd8a920d988d8a7d984d8aad982d984d98ad8afd98ad8a92e20d8b3d98ad8b4d8b1d8ad20d8afd984d98ad984d986d8a720d985d8a7d987d98ad8a920d985d8b1d983d8a8d8a92043504fd88c20d988d981d988d8a7d8a6d8af20d8b4d8b1d8a7d8a6d987d8a7d88c20d988d983d98ad981d98ad8a920d8aad982d98ad98ad98520d985d8b5d8afd8a7d982d98ad8a920d8a8d8b1d986d8a7d985d8ac20d8a7d8b9d8aad985d8a7d8af20d8a7d984d8b4d8b1d983d8a920d8a7d984d985d8b5d986d8b9d8a92e3c2f703e0d0a3c703ed8a3d987d985d98ad8a920d981d8add8b520d985d8a720d982d8a8d98420d8a7d984d8b4d8b1d8a7d8a13a20d984d8a720d8aad8aed8b7d98a20d987d8b0d98720d8a7d984d8aed8b7d988d8a92e20d8b3d988d98120d98ad8a4d983d8af20d985d986d8b4d988d8b1d986d8a720d8b9d984d98920d8a3d987d985d98ad8a920d988d8acd988d8af20d985d98ad983d8a7d986d98ad983d98a20d985d988d8abd988d98220d8a8d98720d984d981d8add8b520d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d8b3d8aad8b9d985d984d8a920d982d8a8d98420d8a5d8aad985d8a7d98520d8b9d985d984d98ad8a920d8a7d984d8b4d8b1d8a7d8a12e20d8b3d986d986d8a7d982d8b420d8a3d986d988d8a7d8b920d8a7d984d981d8add988d8b5d8a7d8aa20d8a7d984d8aad98a20d8b3d98ad982d988d985d988d98620d8a8d8a5d8acd8b1d8a7d8a6d987d8a720d988d983d98ad98120d98ad985d983d98620d8a3d98620d8aad8b3d8a7d8b9d8afd98320d8b1d8a4d8a7d987d98520d981d98a20d8a7d8aad8aed8a7d8b020d982d8b1d8a7d8b120d8a3d983d8abd8b120d8abd982d8a92e3c2f703e0d0a3c703ed8a7d8b3d8aad983d8b4d8a7d98120d8a7d984d982d988d8a7d8a6d98520d8b9d8a8d8b120d8a7d984d8a5d986d8aad8b1d986d8aa3a20d8a3d8add8afd8ab20d8a7d984d8a5d986d8aad8b1d986d8aa20d8abd988d8b1d8a920d981d98a20d8a7d984d8b7d8b1d98ad982d8a920d8a7d984d8aad98a20d986d8aad8b3d988d98220d8a8d987d8a720d984d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a92e20d8b3d986d8b1d8b4d8afd98320d8aed984d8a7d98420d8b9d985d984d98ad8a920d8a7d984d8a8d8add8ab20d8b9d98620d8a7d984d982d988d8a7d8a6d98520d8b9d8a8d8b120d8a7d984d8a5d986d8aad8b1d986d8aa20d988d8aad8b5d981d98ad8aad987d8a720d8a8d8b4d983d98420d981d8b9d8a7d9842e20d8b3d8aad8acd8af20d8a3d98ad8b6d98bd8a720d986d8b5d8a7d8a6d8ad20d8add988d98420d981d98320d8aad8b4d981d98ad8b120d8aad981d8a7d8b5d98ad98420d8a7d984d982d8a7d8a6d985d8a920d988d8aad981d8b3d98ad8b120d8a7d984d8b5d988d8b120d988d8a7d984d8a7d8aad8b5d8a7d98420d8a8d8a7d984d8a8d8a7d8a6d8b9d98ad98620d984d8acd985d8b920d8a7d984d985d8b2d98ad8af20d985d98620d8a7d984d985d8b9d984d988d985d8a7d8aa2e3c2f703e0d0a3c703ed8aad982d986d98ad8a7d8aa20d8a7d8aed8aad8a8d8a7d8b120d8a7d984d982d98ad8a7d8afd8a93a20d8a7d8aed8aad8a8d8a7d8b120d8a7d984d982d98ad8a7d8afd8a920d987d98820d981d8b1d8b5d8aad98320d984d8aad8acd8b1d8a8d8a920d8a7d984d8b3d98ad8a7d8b1d8a920d8a8d8b4d983d98420d985d8a8d8a7d8b4d8b12e20d8b3d986d8aad8b9d985d98220d981d98a20d8a7d984d981d8b1d988d98220d8a7d984d8afd982d98ad982d8a920d981d98a20d8aad8acd8b1d8a8d8a920d8a7d984d982d98ad8a7d8afd8a920d8a7d984d986d8a7d8acd8add8a9d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d985d8a720d98ad8acd8a820d8a7d984d8a7d986d8aad8a8d8a7d98720d8a5d984d98ad987d88c20d988d983d98ad981d98ad8a920d8aad982d98ad98ad98520d8a7d984d8b1d8a7d8add8a920d988d8a7d984d8aad8b9d8a7d985d984d88c20d988d8a7d984d8a3d8b3d8a6d984d8a920d8a7d984d8aad98a20d98ad8acd8a820d8b7d8b1d8add987d8a720d8b9d984d98920d8a7d984d8a8d8a7d8a6d8b920d982d8a8d98420d8a7d984d982d98ad8a7d8afd8a920d988d8a8d8b9d8afd987d8a72e3c2f703e0d0a3c703ed8a7d8b3d8aad8b1d8a7d8aad98ad8acd98ad8a7d8aa20d8a7d984d8aad981d8a7d988d8b63a20d982d8af20d98ad983d988d98620d8a7d984d8aad981d8a7d988d8b620d8b9d984d98920d8b3d8b9d8b120d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d8b3d8aad8b9d985d984d8a920d8a3d985d8b1d8a7d98b20d985d8aed98ad981d8a7d98bd88c20d988d984d983d986d987d8a720d985d987d8a7d8b1d8a920d8a8d8a7d984d8bad8a920d8a7d984d8a3d987d985d98ad8a920d98ad8acd8a820d8a5d8aad982d8a7d986d987d8a72e20d8b3d98ad8b2d988d8afd98320d8afd984d98ad984d986d8a720d8a8d8aad983d8aad98ad983d8a7d8aa20d8a7d984d8aad981d8a7d988d8b620d988d8a7d984d986d8b5d988d8b520d8a7d984d984d8a7d8b2d985d8a920d984d984d8aad986d982d98420d8a8d8abd982d8a920d981d98a20d987d8b0d98720d8a7d984d985d8b1d8add984d8a9d88c20d985d985d8a720d98ad8b6d985d98620d8add8b5d988d984d98320d8b9d984d98920d8a3d981d8b6d98420d8b5d981d982d8a920d985d985d983d986d8a920d8afd988d98620d8a7d984d8aad8b6d8add98ad8a920d8a8d985d98ad8b2d8a7d986d98ad8aad9832e3c2f703e0d0a3c703ed8a7d984d986d8b8d8b120d981d98a20d8aed98ad8a7d8b1d8a7d8aa20d8a7d984d8aad985d988d98ad9843a20d8a5d8b0d8a720d983d986d8aa20d984d8a720d8aad8afd981d8b920d986d982d8afd98bd8a7d88c20d981d8b3d988d98120d98ad8b1d8b4d8afd98320d8afd984d98ad984d986d8a720d8aed984d8a7d98420d8aed98ad8a7d8b1d8a7d8aa20d8a7d984d8aad985d988d98ad9842e20d8a8d8afd8a1d98bd8a720d985d98620d8a7d984d982d8b1d988d8b620d8a7d984d985d8b5d8b1d981d98ad8a920d8a7d984d8aad982d984d98ad8afd98ad8a920d988d8add8aad98920d8aad985d988d98ad98420d8a7d984d988d983d8a7d984d8a9d88c20d8b3d8aad8aad8b9d984d98520d983d98ad981d98ad8a920d8a7d984d8add8b5d988d98420d8b9d984d98920d982d8b1d8b620d8a8d8b4d8b1d988d8b720d985d986d8a7d8b3d8a8d8a920d8aad8aad988d8a7d981d98220d985d8b920d988d8b6d8b9d98320d8a7d984d985d8a7d984d98a2e3c2f703e0d0a3c703ed8aad988d8abd98ad98220d8a7d984d8b5d981d982d8a93a20d8b9d986d8afd985d8a720d98ad8aad98520d8a7d984d8aad988d8b5d98420d8a5d984d98920d8a7d984d8b5d981d982d8a9d88c20d985d98620d8a7d984d985d987d98520d8a3d98620d98ad983d988d98620d984d8afd98ad98320d988d8abd8a7d8a6d98220d985d986d8a7d8b3d8a8d8a92e20d8b3d98ad988d8b6d8ad20d985d986d8b4d988d8b1d986d8a720d8a7d984d8a3d988d8b1d8a7d98220d8a7d984d8a3d8b3d8a7d8b3d98ad8a920d8a7d984d8aad98a20d8aad8add8aad8a7d8acd987d8a7d88c20d985d8abd98420d981d8a7d8aad988d8b1d8a920d8a7d984d8a8d98ad8b920d988d986d985d8a7d8b0d8ac20d986d982d98420d8a7d984d985d984d983d98ad8a9d88c20d984d8b6d985d8a7d98620d985d8b9d8a7d985d984d8a920d8b3d984d8b3d8a920d988d982d8a7d986d988d986d98ad8a92e3c2f703e0d0a3c703ed985d8b3d984d8add98bd8a720d8a8d987d8b0d98720d8a7d984d986d8b5d8a7d8a6d8ad20d8a7d984d8aad98a20d984d8a720d8aad982d8afd8b120d8a8d8abd985d986d88c20d8b3d8aad983d988d98620d8acd8a7d987d8b2d98bd8a720d984d984d8aad986d982d98420d981d98a20d8a7d984d985d8b4d987d8af20d8a7d984d985d8b9d982d8af20d984d8b3d988d98220d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a92e20d987d8afd981d986d8a720d987d98820d8aad8b2d988d98ad8afd98320d8a8d8a7d984d985d8b9d8b1d981d8a920d988d8a7d984d8abd982d8a920d984d984d8b9d8abd988d8b120d8b9d984d98920d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d8aad98a20d8aad984d8a8d98a20d8a7d8add8aad98ad8a7d8acd8a7d8aad983d88c20d988d8aad986d8a7d8b3d8a820d985d98ad8b2d8a7d986d98ad8aad983d88c20d988d8aad8acd984d8a820d8a7d984d8a7d8a8d8aad8b3d8a7d985d8a920d8b9d984d98920d988d8acd987d98320d981d98a20d983d98420d985d8b1d8a920d8aad986d8b7d984d98220d981d98ad987d8a720d8b9d984d98920d8a7d984d8b7d8b1d98ad9822e20d8a7d8b3d8aad8b9d8af20d984d984d8b4d8b1d988d8b920d981d98a20d8b1d8add984d8a920d8b4d8b1d8a7d8a120d8b3d98ad8a7d8b1d8a920d985d8b3d8aad8b9d985d984d8a920d986d8a7d8acd8add8a9213c2f703e, NULL, NULL, '2024-06-13 06:50:32', '2024-06-14 09:25:53'),
(53, 25, 55, 21, '\"التنقل بين خيارات الرهن العقاري: شرح الأسعار الثابتة مقابل المعدلات القابلة للتعديل', 'التنقل-بين-خيارات-الرهن-العقاري:-شرح-الأسعار-الثابتة-مقابل-المعدلات-القابلة-للتعديل', 'جون ديو', 0x3c703ed987d98420d8aad981d983d8b120d981d98a20d8a7d984d8bad988d8b520d981d98a20d8b9d8a7d984d98520d8aad8b3d988d98220d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a9d89f20d984d8a720d985d8b2d98ad8af20d985d98620d8a7d984d8a8d8add8ab2e20d8aad98520d8aad8b5d985d98ad98520d8a3d8add8afd8ab20d985d986d8b4d988d8b1d8a7d8aad986d8a720d8b9d984d98920d8a7d984d985d8afd988d986d8a920d984d8aad983d988d98620d8a8d988d8b5d984d8aad98320d8b9d8a8d8b120d8b3d988d98220d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a9d88c20d8add98ad8ab20d8aad988d8acd987d98320d986d8add98820d8b9d985d984d98ad8a920d8b4d8b1d8a7d8a120d986d8a7d8acd8add8a920d988d985d8b1d8b6d98ad8a92e20d8a8d981d8b6d98420d986d8b5d8a7d8a6d8ad20d988d8b1d8a4d98920d8a7d984d8aed8a8d8b1d8a7d8a120d987d8b0d987d88c20d8b3d8aad983d988d98620d985d8acd987d8b2d98bd8a720d984d8a7d8b3d8aad983d8b4d8a7d98120d982d988d8a7d8a6d98520d8a7d984d8a8d98ad8a7d986d8a7d8aa20d988d8aad982d98ad98ad98520d8a7d984d8aed98ad8a7d8b1d8a7d8aa20d8a8d8abd982d8a920d988d8a7d984d8a7d986d8b7d984d8a7d98220d8a8d8b3d98ad8a7d8b1d8a920d985d8b3d8aad8b9d985d984d8a920d8aad984d8a8d98a20d8a7d8add8aad98ad8a7d8acd8a7d8aad98320d988d8aad8aad8acd8a7d988d8b220d8aad988d982d8b9d8a7d8aad9832e3c2f703e0d0a3c703ed981d987d98520d8a7d8aad8acd8a7d987d8a7d8aa20d8a7d984d8b3d988d9823a20d8b3d988d98220d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a920d8afd98ad986d8a7d985d98ad983d98ad88c20d988d98ad985d983d98620d8a3d98620d8aad8aed8aad984d98120d8a7d984d8a3d8b3d8b9d8a7d8b120d8a8d8b4d983d98420d983d8a8d98ad8b120d8a8d986d8a7d8a1d98b20d8b9d984d98920d8b9d988d8a7d985d98420d985d8abd98420d8a7d984d8b7d984d8a820d988d8a7d984d985d988d8b3d985d98ad8a920d988d8a7d984d985d988d982d8b92e20d8b3d98ad8b3d8a7d8b9d8afd98320d8afd984d98ad984d986d8a720d8b9d984d98920d981d987d98520d8a7d8aad8acd8a7d987d8a7d8aa20d8a7d984d8b3d988d98220d8a7d984d8add8a7d984d98ad8a9d88c20d985d985d8a720d98ad8aad98ad8ad20d984d98320d8a7d8aad8aed8a7d8b020d982d8b1d8a7d8b1d8a7d8aa20d985d8b3d8aad986d98ad8b1d8a920d8a8d8b4d8a3d98620d985d988d8b9d8af20d8a7d984d8b4d8b1d8a7d8a120d988d8a7d984d986d985d8a7d8b0d8ac20d8a7d984d8aad98a20d982d8af20d8aad982d8afd98520d982d98ad985d8a920d8a3d981d8b6d9842e3c2f703e0d0a3c703ed8a7d984d8a8d8add8ab20d987d98820d8a7d984d985d981d8aad8a7d8ad3a20d984d8a720d8aad982d984d98420d8a3d8a8d8afd98bd8a720d985d98620d982d988d8a920d8a7d984d8a8d8add8ab2e20d8b3d988d98120d98ad8b3d984d8b720d985d986d8b4d988d8b1d986d8a720d8a7d984d8b6d988d8a120d8b9d984d98920d8a3d987d985d98ad8a920d8a7d984d8a8d8add8ab20d8b9d98620d985d8a7d8b1d983d8a7d8aa20d988d986d985d8a7d8b0d8ac20d985d8add8afd8afd8a920d8aad987d985d9832e20d988d8b3d8aad8aad8b9d984d98520d983d98ad981d98ad8a920d8a7d984d983d8b4d98120d8b9d98620d985d8b9d984d988d985d8a7d8aa20d8add988d98420d8a7d984d985d8b4d983d984d8a7d8aa20d8a7d984d8b4d8a7d8a6d8b9d8a920d988d8aad983d8a7d984d98ad98120d8a7d984d8a5d8b5d984d8a7d8ad20d988d985d8afd98920d8aad988d981d8b120d982d8b7d8b920d8a7d984d8bad98ad8a7d8b12e20d988d985d98620d8aed984d8a7d98420d987d8b0d98720d8a7d984d985d8b9d8b1d981d8a9d88c20d98ad985d983d986d98320d8a8d983d98420d8abd982d8a920d8aad8add8afd98ad8af20d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d986d8a7d8b3d8a8d8a920d984d8a7d8add8aad98ad8a7d8acd8a7d8aad9832e3c2f703e0d0a3c703ed8aad8add8afd98ad8af20d8aad988d982d8b9d8a7d8aa20d988d8a7d982d8b9d98ad8a93a20d8a8d98ad986d985d8a720d986d8add984d98520d8acd985d98ad8b9d98bd8a720d8a8d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d8abd8a7d984d98ad8a9d88c20d981d985d98620d8a7d984d985d987d98520d8a5d8afd8a7d8b1d8a920d8aad988d982d8b9d8a7d8aad98320d8b9d986d8af20d8b4d8b1d8a7d8a120d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d8b3d8aad8b9d985d984d8a92e20d8b3d986d982d8afd98520d986d8b5d8a7d8a6d8ad20d8add988d98420d985d8a720d98ad985d983d98620d8aad988d982d8b9d98720d985d98620d8a7d984d8aad8a2d983d98420d988d8a7d984d8aad984d98120d985d98620d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d8b3d8aad8b9d985d984d8a920d988d983d98ad981d98ad8a920d8a7d984d8aad985d98ad98ad8b220d8a8d98ad98620d8b9d984d8a7d985d8a7d8aa20d8a7d984d8a7d8b3d8aad8aed8afd8a7d98520d8a7d984d985d982d8a8d988d984d8a920d988d8a7d984d8a3d8b9d984d8a7d98520d8a7d984d8add985d8b1d8a7d8a120d8a7d984d985d8add8aad985d984d8a92e3c2f703e0d0a3c703ed8a7d984d986d8b8d8b120d981d98a20d8a7d984d985d8b1d983d8a8d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a920d8a7d984d985d8b9d8aad985d8afd8a9202843504f293a20d8aad988d981d8b120d8a7d984d985d8b1d983d8a8d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a920d8a7d984d985d8b9d8aad985d8afd8a920d8add984d8a7d98b20d988d8b3d8b7d8a7d98b20d8acd8b0d8a7d8a8d8a7d98b20d8a8d98ad98620d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a920d8a7d984d8acd8afd98ad8afd8a920d988d8a7d984d8aad982d984d98ad8afd98ad8a92e20d8b3d98ad8b4d8b1d8ad20d8afd984d98ad984d986d8a720d985d8a7d987d98ad8a920d985d8b1d983d8a8d8a92043504fd88c20d988d981d988d8a7d8a6d8af20d8b4d8b1d8a7d8a6d987d8a7d88c20d988d983d98ad981d98ad8a920d8aad982d98ad98ad98520d985d8b5d8afd8a7d982d98ad8a920d8a8d8b1d986d8a7d985d8ac20d8a7d8b9d8aad985d8a7d8af20d8a7d984d8b4d8b1d983d8a920d8a7d984d985d8b5d986d8b9d8a92e3c2f703e0d0a3c703ed8a3d987d985d98ad8a920d981d8add8b520d985d8a720d982d8a8d98420d8a7d984d8b4d8b1d8a7d8a13a20d984d8a720d8aad8aed8b7d98a20d987d8b0d98720d8a7d984d8aed8b7d988d8a92e20d8b3d988d98120d98ad8a4d983d8af20d985d986d8b4d988d8b1d986d8a720d8b9d984d98920d8a3d987d985d98ad8a920d988d8acd988d8af20d985d98ad983d8a7d986d98ad983d98a20d985d988d8abd988d98220d8a8d98720d984d981d8add8b520d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d8b3d8aad8b9d985d984d8a920d982d8a8d98420d8a5d8aad985d8a7d98520d8b9d985d984d98ad8a920d8a7d984d8b4d8b1d8a7d8a12e20d8b3d986d986d8a7d982d8b420d8a3d986d988d8a7d8b920d8a7d984d981d8add988d8b5d8a7d8aa20d8a7d984d8aad98a20d8b3d98ad982d988d985d988d98620d8a8d8a5d8acd8b1d8a7d8a6d987d8a720d988d983d98ad98120d98ad985d983d98620d8a3d98620d8aad8b3d8a7d8b9d8afd98320d8b1d8a4d8a7d987d98520d981d98a20d8a7d8aad8aed8a7d8b020d982d8b1d8a7d8b120d8a3d983d8abd8b120d8abd982d8a92e3c2f703e0d0a3c703ed8a7d8b3d8aad983d8b4d8a7d98120d8a7d984d982d988d8a7d8a6d98520d8b9d8a8d8b120d8a7d984d8a5d986d8aad8b1d986d8aa3a20d8a3d8add8afd8ab20d8a7d984d8a5d986d8aad8b1d986d8aa20d8abd988d8b1d8a920d981d98a20d8a7d984d8b7d8b1d98ad982d8a920d8a7d984d8aad98a20d986d8aad8b3d988d98220d8a8d987d8a720d984d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a92e20d8b3d986d8b1d8b4d8afd98320d8aed984d8a7d98420d8b9d985d984d98ad8a920d8a7d984d8a8d8add8ab20d8b9d98620d8a7d984d982d988d8a7d8a6d98520d8b9d8a8d8b120d8a7d984d8a5d986d8aad8b1d986d8aa20d988d8aad8b5d981d98ad8aad987d8a720d8a8d8b4d983d98420d981d8b9d8a7d9842e20d8b3d8aad8acd8af20d8a3d98ad8b6d98bd8a720d986d8b5d8a7d8a6d8ad20d8add988d98420d981d98320d8aad8b4d981d98ad8b120d8aad981d8a7d8b5d98ad98420d8a7d984d982d8a7d8a6d985d8a920d988d8aad981d8b3d98ad8b120d8a7d984d8b5d988d8b120d988d8a7d984d8a7d8aad8b5d8a7d98420d8a8d8a7d984d8a8d8a7d8a6d8b9d98ad98620d984d8acd985d8b920d8a7d984d985d8b2d98ad8af20d985d98620d8a7d984d985d8b9d984d988d985d8a7d8aa2e3c2f703e0d0a3c703ed8aad982d986d98ad8a7d8aa20d8a7d8aed8aad8a8d8a7d8b120d8a7d984d982d98ad8a7d8afd8a93a20d8a7d8aed8aad8a8d8a7d8b120d8a7d984d982d98ad8a7d8afd8a920d987d98820d981d8b1d8b5d8aad98320d984d8aad8acd8b1d8a8d8a920d8a7d984d8b3d98ad8a7d8b1d8a920d8a8d8b4d983d98420d985d8a8d8a7d8b4d8b12e20d8b3d986d8aad8b9d985d98220d981d98a20d8a7d984d981d8b1d988d98220d8a7d984d8afd982d98ad982d8a920d981d98a20d8aad8acd8b1d8a8d8a920d8a7d984d982d98ad8a7d8afd8a920d8a7d984d986d8a7d8acd8add8a9d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d985d8a720d98ad8acd8a820d8a7d984d8a7d986d8aad8a8d8a7d98720d8a5d984d98ad987d88c20d988d983d98ad981d98ad8a920d8aad982d98ad98ad98520d8a7d984d8b1d8a7d8add8a920d988d8a7d984d8aad8b9d8a7d985d984d88c20d988d8a7d984d8a3d8b3d8a6d984d8a920d8a7d984d8aad98a20d98ad8acd8a820d8b7d8b1d8add987d8a720d8b9d984d98920d8a7d984d8a8d8a7d8a6d8b920d982d8a8d98420d8a7d984d982d98ad8a7d8afd8a920d988d8a8d8b9d8afd987d8a72e3c2f703e0d0a3c703ed8a7d8b3d8aad8b1d8a7d8aad98ad8acd98ad8a7d8aa20d8a7d984d8aad981d8a7d988d8b63a20d982d8af20d98ad983d988d98620d8a7d984d8aad981d8a7d988d8b620d8b9d984d98920d8b3d8b9d8b120d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d985d8b3d8aad8b9d985d984d8a920d8a3d985d8b1d8a7d98b20d985d8aed98ad981d8a7d98bd88c20d988d984d983d986d987d8a720d985d987d8a7d8b1d8a920d8a8d8a7d984d8bad8a920d8a7d984d8a3d987d985d98ad8a920d98ad8acd8a820d8a5d8aad982d8a7d986d987d8a72e20d8b3d98ad8b2d988d8afd98320d8afd984d98ad984d986d8a720d8a8d8aad983d8aad98ad983d8a7d8aa20d8a7d984d8aad981d8a7d988d8b620d988d8a7d984d986d8b5d988d8b520d8a7d984d984d8a7d8b2d985d8a920d984d984d8aad986d982d98420d8a8d8abd982d8a920d981d98a20d987d8b0d98720d8a7d984d985d8b1d8add984d8a9d88c20d985d985d8a720d98ad8b6d985d98620d8add8b5d988d984d98320d8b9d984d98920d8a3d981d8b6d98420d8b5d981d982d8a920d985d985d983d986d8a920d8afd988d98620d8a7d984d8aad8b6d8add98ad8a920d8a8d985d98ad8b2d8a7d986d98ad8aad9832e3c2f703e0d0a3c703ed8a7d984d986d8b8d8b120d981d98a20d8aed98ad8a7d8b1d8a7d8aa20d8a7d984d8aad985d988d98ad9843a20d8a5d8b0d8a720d983d986d8aa20d984d8a720d8aad8afd981d8b920d986d982d8afd98bd8a7d88c20d981d8b3d988d98120d98ad8b1d8b4d8afd98320d8afd984d98ad984d986d8a720d8aed984d8a7d98420d8aed98ad8a7d8b1d8a7d8aa20d8a7d984d8aad985d988d98ad9842e20d8a8d8afd8a1d98bd8a720d985d98620d8a7d984d982d8b1d988d8b620d8a7d984d985d8b5d8b1d981d98ad8a920d8a7d984d8aad982d984d98ad8afd98ad8a920d988d8add8aad98920d8aad985d988d98ad98420d8a7d984d988d983d8a7d984d8a9d88c20d8b3d8aad8aad8b9d984d98520d983d98ad981d98ad8a920d8a7d984d8add8b5d988d98420d8b9d984d98920d982d8b1d8b620d8a8d8b4d8b1d988d8b720d985d986d8a7d8b3d8a8d8a920d8aad8aad988d8a7d981d98220d985d8b920d988d8b6d8b9d98320d8a7d984d985d8a7d984d98a2e3c2f703e0d0a3c703ed8aad988d8abd98ad98220d8a7d984d8b5d981d982d8a93a20d8b9d986d8afd985d8a720d98ad8aad98520d8a7d984d8aad988d8b5d98420d8a5d984d98920d8a7d984d8b5d981d982d8a9d88c20d985d98620d8a7d984d985d987d98520d8a3d98620d98ad983d988d98620d984d8afd98ad98320d988d8abd8a7d8a6d98220d985d986d8a7d8b3d8a8d8a92e20d8b3d98ad988d8b6d8ad20d985d986d8b4d988d8b1d986d8a720d8a7d984d8a3d988d8b1d8a7d98220d8a7d984d8a3d8b3d8a7d8b3d98ad8a920d8a7d984d8aad98a20d8aad8add8aad8a7d8acd987d8a7d88c20d985d8abd98420d981d8a7d8aad988d8b1d8a920d8a7d984d8a8d98ad8b920d988d986d985d8a7d8b0d8ac20d986d982d98420d8a7d984d985d984d983d98ad8a9d88c20d984d8b6d985d8a7d98620d985d8b9d8a7d985d984d8a920d8b3d984d8b3d8a920d988d982d8a7d986d988d986d98ad8a92e3c2f703e0d0a3c703ed985d8b3d984d8add98bd8a720d8a8d987d8b0d98720d8a7d984d986d8b5d8a7d8a6d8ad20d8a7d984d8aad98a20d984d8a720d8aad982d8afd8b120d8a8d8abd985d986d88c20d8b3d8aad983d988d98620d8acd8a7d987d8b2d98bd8a720d984d984d8aad986d982d98420d981d98a20d8a7d984d985d8b4d987d8af20d8a7d984d985d8b9d982d8af20d984d8b3d988d98220d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad8b9d985d984d8a92e20d987d8afd981d986d8a720d987d98820d8aad8b2d988d98ad8afd98320d8a8d8a7d984d985d8b9d8b1d981d8a920d988d8a7d984d8abd982d8a920d984d984d8b9d8abd988d8b120d8b9d984d98920d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d8aad98a20d8aad984d8a8d98a20d8a7d8add8aad98ad8a7d8acd8a7d8aad983d88c20d988d8aad986d8a7d8b3d8a820d985d98ad8b2d8a7d986d98ad8aad983d88c20d988d8aad8acd984d8a820d8a7d984d8a7d8a8d8aad8b3d8a7d985d8a920d8b9d984d98920d988d8acd987d98320d981d98a20d983d98420d985d8b1d8a920d8aad986d8b7d984d98220d981d98ad987d8a720d8b9d984d98920d8a7d984d8b7d8b1d98ad9822e20d8a7d8b3d8aad8b9d8af20d984d984d8b4d8b1d988d8b920d981d98a20d8b1d8add984d8a920d8b4d8b1d8a7d8a120d8b3d98ad8a7d8b1d8a920d985d8b3d8aad8b9d985d984d8a920d986d8a7d8acd8add8a9213c2f703e, NULL, NULL, '2024-06-13 06:51:25', '2024-06-14 09:29:32'),
(54, 25, 54, 24, 'كيفية اختيار بوليصة التأمين المناسبة لأصحاب المنازل', 'كيفية-اختيار-بوليصة-التأمين-المناسبة-لأصحاب-المنازل', 'أليسون', 0x3c703ed982d8a8d8b6d8a920d8a7d984d8b4d8aad8a7d8a120d8a7d984d8acd984d98ad8afd98ad8a920d98ad985d983d98620d8a3d98620d8aad8b4d983d98420d8aad8add8afd98ad8a7d8aa20d8b9d8afd98ad8afd8a920d984d8b3d98ad8a7d8b1d8aad9832e20d98ad985d983d98620d8a3d98620d8aad8a4d8abd8b120d8afd8b1d8acd8a7d8aa20d8a7d984d8add8b1d8a7d8b1d8a920d8a7d984d8a8d8a7d8b1d8afd8a920d988d8a3d985d984d8a7d8ad20d8a7d984d8b7d8b1d98ad98220d988d8b8d8b1d988d98120d8a7d984d982d98ad8a7d8afd8a920d8a7d984d8b5d8b9d8a8d8a920d8b9d984d98920d8a3d8afd8a7d8a120d8b3d98ad8a7d8b1d8aad98320d988d985d8b8d987d8b1d987d8a72e20d8afd984d98ad984d986d8a720d984d984d8b9d986d8a7d98ad8a920d8a8d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d981d98a20d981d8b5d98420d8a7d984d8b4d8aad8a7d8a120d985d988d8acd988d8af20d987d986d8a720d984d985d8b3d8a7d8b9d8afd8aad98320d981d98a20d8a5d8b9d8afd8a7d8af20d8b3d98ad8a7d8b1d8aad98320d984d984d8a3d8b4d987d8b120d8a7d984d982d8a7d8b3d98ad8a920d8a7d984d985d982d8a8d984d8a92e20d8a8d8afd8a1d98bd8a720d985d98620d8b6d985d8a7d98620d8a7d984d8acd8b120d8a7d984d985d986d8a7d8b3d8a820d988d8add8aad98920d8add985d8a7d98ad8a920d8a7d984d985d8add8b1d98320d985d98620d8afd8b1d8acd8a7d8aa20d8a7d984d8add8b1d8a7d8b1d8a920d8a7d984d985d8aad8acd985d8afd8a9d88c20d8b3d8aad8add8a7d981d8b820d987d8b0d98720d8a7d984d986d8b5d8a7d8a6d8ad20d8a7d984d8a3d8b3d8a7d8b3d98ad8a920d8b9d984d98920d8b3d984d8a7d985d8aad98320d988d8b3d984d8a7d985d8a920d8b3d98ad8a7d8b1d8aad98320d8a3d8abd986d8a7d8a120d8a8d8b1d8af20d8a7d984d8b4d8aad8a7d8a12e3c2f703e0d0a3c703ed8a5d8b9d8afd8a7d8af20d8a7d984d8a5d8b7d8a7d8b1d8a7d8aa3a3c2f703e0d0a3c703ed8a5d8b7d8a7d8b1d8a7d8aa20d8a7d984d8b4d8aad8a7d8a13a20d8aad8b9d8b1d98120d8b9d984d98920d8a3d987d985d98ad8a920d8a5d8b7d8a7d8b1d8a7d8aa20d8a7d984d8b4d8aad8a7d8a120d984d984d8aad986d982d98420d8b9d984d98920d8a7d984d8b7d8b1d98220d8a7d984d8acd984d98ad8afd98ad8a920d988d8a7d983d8aad8b4d98120d985d8aad98920d988d983d98ad98120d98ad985d983d986d98320d8a7d984d8aad8a8d8afd98ad98420d8a5d984d98ad987d8a72e3c2f703e0d0a3c703ed8b6d8bad8b720d8a7d984d8a5d8b7d8a7d8b1d8a7d8aa3a20d98ad8a4d8abd8b120d8a7d984d8b7d982d8b320d8a7d984d8a8d8a7d8b1d8af20d8b9d984d98920d8b6d8bad8b720d8a7d984d8a5d8b7d8a7d8b1d8a7d8aa2e20d98ad8b4d8b1d8ad20d8afd984d98ad984d986d8a720d983d98ad981d98ad8a920d8a7d984d8add981d8a7d8b820d8b9d984d98920d8b6d8bad8b720d8a7d984d8a5d8b7d8a7d8b1d8a7d8aa20d8a7d984d8b5d8add98ad8ad20d984d8aad8add982d98ad98220d8a7d984d8acd8b120d8a7d984d8a3d985d8abd98420d988d983d981d8a7d8a1d8a920d8a7d8b3d8aad987d984d8a7d98320d8a7d984d988d982d988d8af2e3c2f703e0d0a3c703ed8add985d8a7d98ad8a920d8a7d984d985d8add8b1d9833a3c2f703e0d0a3c703ed8b5d98ad8a7d986d8a920d985d8b6d8a7d8af20d8a7d984d8aad8acd985d8af3a20d985d8b3d8aad988d98ad8a7d8aa20d985d8a7d986d8b920d8a7d984d8aad8acd985d8af20d8a7d984d985d986d8a7d8b3d8a8d8a920d8aad985d986d8b920d8a7d984d8aad8acd985d8af20d988d8a7d984d8b3d8aed988d986d8a920d8a7d984d8b2d8a7d8a6d8afd8a92e20d8aad8b9d8b1d98120d8b9d984d98920d983d98ad981d98ad8a920d981d8add8b520d985d8b6d8a7d8af20d8a7d984d8aad8acd985d8af20d984d8afd98ad98320d988d985d984d8a6d9872e3c2f703e0d0a3c703ed8b5d8add8a920d8a7d984d8a8d8b7d8a7d8b1d98ad8a93a20d982d8af20d98ad8a4d8afd98a20d8a7d984d8b7d982d8b320d8a7d984d8a8d8a7d8b1d8af20d8a5d984d98920d8a5d8acd987d8a7d8af20d8a7d984d8a8d8b7d8a7d8b1d98ad8a92e20d98ad8bad8b7d98a20d8afd984d98ad984d986d8a720d983d98ad981d98ad8a920d8a7d8aed8aad8a8d8a7d8b120d8a7d984d8a8d8b7d8a7d8b1d98ad8a920d988d8b5d98ad8a7d986d8aad987d8a720d984d985d986d8b920d8add8afd988d8ab20d985d8b4d983d984d8a7d8aa20d981d98a20d8a8d8afd8a120d8a7d984d8aad8b4d8bad98ad9842e3c2f703e0d0a3c703ed8a7d984d8b1d8a4d98ad8a920d988d8a7d984d8b3d984d8a7d985d8a93a3c2f703e0d0a3c703ed8a5d8b2d8a7d984d8a920d8a7d984d8acd984d98ad8af20d8b9d98620d8a7d984d8b2d8acd8a7d8ac20d8a7d984d8a3d985d8a7d985d98a3a20d8aad8b9d8b1d991d98120d8b9d984d98920d983d98ad981d98ad8a920d8a5d8b2d8a7d984d8a920d8a7d984d8acd984d98ad8af20d8b9d98620d8a7d984d8b2d8acd8a7d8ac20d8a7d984d8a3d985d8a7d985d98a20d8a8d8b4d983d98420d981d8b9d8a7d98420d988d8b6d985d8a7d98620d8b1d8a4d98ad8a920d988d8a7d8b6d8add8a9d88c20d8add8aad98920d981d98a20d8a3d8a8d8b1d8af20d8a7d984d8b7d982d8b32e3c2f703e0d0a3c703ed985d8acd985d988d8b9d8a920d8a3d8afd988d8a7d8aa20d8a7d984d8b7d988d8a7d8b1d8a63a20d8a7d8b3d8aad8b9d8af20d984d8aad8add8afd98ad8a7d8aa20d8a7d984d8b4d8aad8a7d8a120d8bad98ad8b120d8a7d984d985d8aad988d982d8b9d8a920d8a8d8a7d8b3d8aad8aed8afd8a7d98520d985d8acd985d988d8b9d8a920d8a3d8afd988d8a7d8aa20d8a7d984d8b7d988d8a7d8b1d8a62e20d98ad8b3d8b1d8af20d8afd984d98ad984d986d8a720d8a7d984d8b9d986d8a7d8b5d8b120d8a7d984d8a3d8b3d8a7d8b3d98ad8a920d8a7d984d8aad98a20d98ad8acd8a820d8aad8b6d985d98ad986d987d8a720d985d98620d8a3d8acd98420d8b3d984d8a7d985d8aad9832e3c2f703e0d0a3c703ed8a7d984d8b9d986d8a7d98ad8a920d8a7d984d8aed8a7d8b1d8acd98ad8a93a3c2f703e0d0a3c703ed8a7d984d8add985d8a7d98ad8a920d985d98620d8a7d984d985d984d8ad20d988d8a7d984d8b5d8afd8a33a20d98ad985d983d98620d8a3d98620d98ad8a4d8afd98a20d985d984d8ad20d8a7d984d8b7d8b1d98ad98220d8a5d984d98920d8a7d984d8b5d8afd8a32e20d8a7d983d8aad8b4d98120d983d98ad981d98ad8a920d8add985d8a7d98ad8a920d8a7d984d987d98ad983d98420d8a7d984d8b3d981d984d98a20d988d8a7d984d8acd8b2d8a120d8a7d984d8aed8a7d8b1d8acd98a20d984d8b3d98ad8a7d8b1d8aad98320d985d98620d8a3d8b6d8b1d8a7d8b120d8a7d984d985d984d8ad2e3c2f703e0d0a3c703ed8a7d984d8bad8b3d98ad98420d988d8a7d984d8aad8b4d985d98ad8b93a20d8a5d98620d8bad8b3d98420d988d8aad8b4d985d98ad8b920d8b3d98ad8a7d8b1d8aad98320d8a8d8a7d986d8aad8b8d8a7d98520d8aed984d8a7d98420d981d8b5d98420d8a7d984d8b4d8aad8a7d8a120d98ad985d986d8b920d8aad8b1d8a7d983d98520d8a7d984d8aad8a2d983d98420d988d98ad8add985d98a20d8a7d984d8b7d984d8a7d8a12e3c2f703e0d0a3c703ed8aad982d986d98ad8a7d8aa20d8a7d984d982d98ad8a7d8afd8a93a3c2f703e0d0a3c703ed8a7d984d982d98ad8a7d8afd8a920d8a7d984d8a2d985d986d8a920d981d98a20d8a7d984d8b4d8aad8a7d8a13a20d8b5d982d98420d985d985d8a7d8b1d8b3d8a7d8aa20d8a7d984d982d98ad8a7d8afd8a920d8a7d984d8a2d985d986d8a920d984d8b8d8b1d988d98120d8a7d984d8b4d8aad8a7d8a1d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d8a7d984d983d8a8d8ad20d8b9d984d98920d8a7d984d8acd984d98ad8afd88c20d988d8a7d984d8add981d8a7d8b820d8b9d984d98920d985d8b3d8a7d981d8a920d985d8aad8a7d8a8d8b9d8a920d8a2d985d986d8a9d88c20d988d8a7d984d985d8b2d98ad8af2e3c2f703e0d0a3c703ed8aad8acd986d8a820d8a7d984d8a5d8b1d987d8a7d9823a20d8a7d984d8b6d8bad8b720d8a7d984d8b2d8a7d8a6d8af20d8b9d984d98920d985d8add8b1d98320d8b3d98ad8a7d8b1d8aad98320d981d98a20d8a7d984d8b7d982d8b320d8a7d984d8a8d8a7d8b1d8af20d98ad985d983d98620d8a3d98620d98ad8b3d8a8d8a820d8a7d984d8b6d8b1d8b12e20d98ad986d8b5d8add98320d8afd984d98ad984d986d8a720d8a8d983d98ad981d98ad8a920d8aad8acd986d8a820d8a7d984d8aad988d8aad8b120d8bad98ad8b120d8a7d984d8b6d8b1d988d8b1d98a2e3c2f703e0d0a3c703ed8a8d8a7d8aad8a8d8a7d8b920d986d8b5d8a7d8a6d8add986d8a720d984d984d8b9d986d8a7d98ad8a920d8a8d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d981d98a20d981d8b5d98420d8a7d984d8b4d8aad8a7d8a1d88c20d8b3d8aad983d988d98620d985d8b3d8aad8b9d8afd98bd8a720d8acd98ad8afd98bd8a720d984d985d988d8a7d8acd987d8a920d8aad8add8afd98ad8a7d8aa20d8a7d984d985d988d8b3d98520d8a7d984d8a8d8a7d8b1d8af2e20d985d8b920d8a7d984d8b3d98ad8a7d8b1d8a920d8a7d984d8aad98a20d8aad8aad98520d8b5d98ad8a7d986d8aad987d8a720d8acd98ad8afd98bd8a7d88c20d8b3d8aad8aad985d8aad8b920d8a8d8b1d8a7d8add8a920d8a7d984d8a8d8a7d98420d988d8a7d984d8abd982d8a920d8a3d8abd986d8a7d8a120d8a7d984d8aad986d982d98420d8b9d984d98920d8a7d984d8b7d8b1d98220d8a7d984d8b4d8aad988d98ad8a9d88c20d985d985d8a720d98ad8b6d985d98620d988d8b5d988d984d98320d8a8d8a3d985d8a7d98620d8a5d984d98920d988d8acd987d8aad98320d8a8d8bad8b620d8a7d984d986d8b8d8b120d8b9d98620d8a7d984d8b7d982d8b32e3c2f703e, NULL, NULL, '2024-06-13 06:52:31', '2024-06-14 09:22:51');
INSERT INTO `blog_informations` (`id`, `language_id`, `blog_category_id`, `blog_id`, `title`, `slug`, `author`, `content`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(55, 25, 54, 23, 'المخاطر القانونية التي يجب تجنبها في المعاملات العقارية', 'المخاطر-القانونية-التي-يجب-تجنبها-في-المعاملات-العقارية', 'الكسندرا', 0x3c703ed8aad8b9d8af20d8b5d98ad8a7d986d8a920d8b3d98ad8a7d8b1d8aad98320d8a3d985d8b1d98bd8a720d8b6d8b1d988d8b1d98ad98bd8a720d984d8b6d985d8a7d98620d8b7d988d98420d8b9d985d8b1d987d8a720d988d8a3d8afd8a7d8a6d987d8a720d988d8b3d984d8a7d985d8aad987d8a72e20d8b3d988d8a7d8a120d983d986d8aa20d985d98620d8b9d8b4d8a7d98220d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a3d98820d985d8b3d8a7d981d8b1d98bd8a720d98ad988d985d98ad98bd8a7d88c20d981d982d8af20d8aad98520d8aad8b5d985d98ad98520d982d8a7d8a6d985d8a920d8a7d984d985d8b1d8a7d8acd8b9d8a920d8a7d984d8b4d8a7d985d984d8a920d984d8b5d98ad8a7d986d8a920d8a7d984d8b3d98ad8a7d8b1d8a920d984d8aad983d988d98620d985d8b5d8afd8b1d98320d8a7d984d985d981d8b6d98420d984d984d8add981d8a7d8b820d8b9d984d98920d8b3d98ad8a7d8b1d8aad98320d981d98a20d8a3d981d8b6d98420d8add8a7d984d8a92e20d8a8d8afd8a1d98bd8a720d985d98620d8a7d984d985d987d8a7d98520d8a7d984d8b1d988d8aad98ad986d98ad8a920d8a7d984d8aad98a20d98ad8acd8a820d8a5d8acd8b1d8a7d8a4d987d8a720d8a8d8a7d986d8aad8b8d8a7d98520d988d8add8aad98920d8a7d984d981d8add988d8b5d8a7d8aa20d8a7d984d8b9d8b1d8b6d98ad8a920d8a7d984d8aad98a20d98ad985d983d98620d8a3d98620d8aad985d986d8b920d8add8afd988d8ab20d985d8b4d983d984d8a7d8aa20d983d8a8d98ad8b1d8a9d88c20d8aad8bad8b7d98a20d982d8a7d8a6d985d8a920d8a7d984d985d8b1d8a7d8acd8b9d8a920d987d8b0d98720d983d98420d8acd8a7d986d8a820d985d98620d8acd988d8a7d986d8a820d8a7d984d8b9d986d8a7d98ad8a920d8a8d8a7d984d8b3d98ad8a7d8b1d8a92e3c2f703e0d0a3c703ed8b5d98ad8a7d986d8a920d8afd988d8b1d98ad8a93a3c2f703e0d0a3c703ed8aad8bad98ad98ad8b120d8a7d984d8b2d98ad8aa3a20d98ad8b9d8af20d8aad8bad98ad98ad8b120d8a7d984d8b2d98ad8aa20d8a8d8a7d986d8aad8b8d8a7d98520d8a3d985d8b1d98bd8a720d8b6d8b1d988d8b1d98ad98bd8a720d984d984d8add981d8a7d8b820d8b9d984d98920d8aad8b4d8bad98ad98420d8a7d984d985d8add8b1d98320d8a8d8b3d984d8a7d8b3d8a92e20d8b3d988d98120d8aad8b1d8b4d8afd98320d982d8a7d8a6d985d8a920d8a7d984d985d8b1d8a7d8acd8b9d8a920d8a7d984d8aed8a7d8b5d8a920d8a8d986d8a720d8a5d984d98920d985d8aad98920d988d983d98ad98120d8aad982d988d98520d8a8d8aad8bad98ad98ad8b120d8a7d984d8b2d98ad8aad88c20d8a8d985d8a720d981d98a20d8b0d984d98320d8a7d8aed8aad98ad8a7d8b120d986d988d8b920d8a7d984d8b2d98ad8aa20d988d8a7d984d981d984d8aad8b120d8a7d984d985d986d8a7d8b3d8a8d98ad9862e3c2f703e0d0a3c703ed8a7d984d8b9d986d8a7d98ad8a920d8a8d8a7d984d8a5d8b7d8a7d8b1d8a7d8aa3a20d8a7d984d8b5d98ad8a7d986d8a920d8a7d984d985d986d8a7d8b3d8a8d8a920d984d984d8a5d8b7d8a7d8b1d8a7d8aa20d8aad8b9d8b2d8b220d8a7d984d8b3d984d8a7d985d8a920d988d983d981d8a7d8a1d8a920d8a7d8b3d8aad987d984d8a7d98320d8a7d984d988d982d988d8af2e20d8aad8b9d8b1d98120d8b9d984d98920d983d98ad981d98ad8a920d981d8add8b520d8b6d8bad8b720d8a7d984d8a5d8b7d8a7d8b1d8a7d8aad88c20d988d8aad8afd988d98ad8b120d8a7d984d8a5d8b7d8a7d8b1d8a7d8aad88c20d988d8a7d984d8aad8a3d983d8af20d985d98620d8a3d98620d8a5d8b7d8a7d8b1d8a7d8aad98320d8a8d987d8a720d985d8afd8a7d8b320d983d8a7d981d98d20d984d8aad8add982d98ad98220d8a7d984d8acd8b120d8a7d984d8a3d985d8abd9842e3c2f703e0d0a3c703ed981d8add8b520d8a7d984d8b3d988d8a7d8a6d9843a20d985d98620d8b3d8a7d8a6d98420d8a7d984d8aad8a8d8b1d98ad8af20d8a5d984d98920d8b3d8a7d8a6d98420d8a7d984d981d8b1d8a7d985d984d88c20d8b3d8aad8b3d8a7d8b9d8afd98320d982d8a7d8a6d985d8a920d8a7d984d985d8b1d8a7d8acd8b9d8a920d8a7d984d8aed8a7d8b5d8a920d8a8d986d8a720d8b9d984d98920d985d8b1d8a7d982d8a8d8a920d8a7d984d8b3d988d8a7d8a6d98420d8a7d984d985d8aed8aad984d981d8a920d981d98a20d8b3d98ad8a7d8b1d8aad98320d988d8a7d984d8add981d8a7d8b820d8b9d984d98ad987d8a720d984d985d986d8b920d8a7d8b1d8aad981d8a7d8b920d8afd8b1d8acd8a920d8a7d984d8add8b1d8a7d8b1d8a920d988d8a7d984d8aad8a2d983d98420d988d985d8b4d983d984d8a7d8aa20d8a7d984d981d8b1d8a7d985d9842e3c2f703e0d0a3c703ed8b5d8add8a920d8a7d984d985d8add8b1d9833a3c2f703e0d0a3c703ed8a7d8b3d8aad8a8d8afd8a7d98420d981d984d8aad8b120d8a7d984d987d988d8a7d8a13a20d98ad8b6d985d98620d981d984d8aad8b120d8a7d984d987d988d8a7d8a120d8a7d984d986d8b8d98ad98120d8afd8aed988d98420d8a7d984d987d988d8a7d8a120d8a8d8b4d983d98420d985d986d8a7d8b3d8a820d988d983d981d8a7d8a1d8a920d981d98a20d8a7d8b3d8aad987d984d8a7d98320d8a7d984d988d982d988d8af2e20d8aad8b4d8b1d8ad20d982d8a7d8a6d985d8aad986d8a720d8a7d984d985d8b1d8acd8b9d98ad8a920d983d98ad98120d988d985d8aad98920d98ad8aad98520d8a7d8b3d8aad8a8d8afd8a7d98420d981d984d8aad8b120d8a7d984d987d988d8a7d8a120d8a7d984d8aed8a7d8b520d8a8d9832e3c2f703e0d0a3c703ed8b5d98ad8a7d986d8a920d8b4d985d8b9d8a7d8aa20d8a7d984d8a5d8b4d8b9d8a7d9843a20d8aad8b9d8b1d98120d8b9d984d98920d8a3d987d985d98ad8a920d8b3d984d8a7d985d8a920d8b4d985d8b9d8a7d8aa20d8a7d984d8a5d8b4d8b9d8a7d98420d988d985d8aad98920d98ad8aad98520d8a7d8b3d8aad8a8d8afd8a7d984d987d8a720d984d8aad8acd986d8a820d8aed984d98420d8a7d984d985d8add8b1d98320d988d8b6d8b9d98120d8a7d984d8a3d8afd8a7d8a12e3c2f703e0d0a3c703ed8aad8add8aa20d8a7d984d8bad8b7d8a7d8a13a3c2f703e0d0a3c703ed8a7d984d8b9d986d8a7d98ad8a920d8a8d8a7d984d8a8d8b7d8a7d8b1d98ad8a93a20d984d8a720d8aad8aad8b9d8abd8b120d985d8b920d8a8d8b7d8a7d8b1d98ad8a920d981d8a7d8b1d8bad8a92e20d8aad8bad8b7d98a20d982d8a7d8a6d985d8a920d8a7d984d985d8b1d8a7d8acd8b9d8a920d8a7d984d8aed8a7d8b5d8a920d8a8d986d8a720d983d98ad981d98ad8a920d8a7d8aed8aad8a8d8a7d8b120d8b5d8add8a920d8a7d984d8a8d8b7d8a7d8b1d98ad8a9d88c20d988d8aad986d8b8d98ad98120d8a3d8b7d8b1d8a7d981d987d8a7d88c20d988d8b6d985d8a7d98620d8a8d8afd8a120d8aad8b4d8bad98ad98420d985d988d8abd988d9822e3c2f703e0d0a3c703ed8a7d984d8a3d8add8b2d985d8a920d988d8a7d984d8aed8b1d8a7d8b7d98ad9853a20d985d8b1d8a7d982d8a8d8a920d8a7d984d8a3d8add8b2d985d8a920d988d8a7d984d8aed8b1d8a7d8b7d98ad98520d98ad985d983d98620d8a3d98620d8aad985d986d8b920d8a7d984d8a3d8b9d8b7d8a7d98420d988d8a7d8b1d8aad981d8a7d8b920d8afd8b1d8acd8a920d8a7d984d8add8b1d8a7d8b1d8a92e20d8aad8b9d984d98520d983d98ad981d98ad8a920d981d8add8b5d987d8a720d8a8d8add8abd98bd8a720d8b9d98620d8a7d984d8aad8a2d983d98420d988d8a7d984d8b4d982d988d9822e3c2f703e0d0a3c703ed8a7d984d8b3d984d8a7d985d8a920d988d8a7d984d8b1d8a4d98ad8a93a3c2f703e0d0a3c703ed981d8add8b520d8a7d984d981d8b1d8a7d985d9843a20d8aad8b9d8af20d981d8add988d8b5d8a7d8aa20d8a7d984d981d8b1d8a7d985d98420d8a7d984d985d986d8aad8b8d985d8a920d8b6d8b1d988d8b1d98ad8a920d984d8b3d984d8a7d985d8aad9832e20d8aad988d8b6d8ad20d982d8a7d8a6d985d8a920d8a7d984d985d8b1d8a7d8acd8b9d8a920d8a7d984d8aed8a7d8b5d8a920d8a8d986d8a720d983d98ad981d98ad8a920d981d8add8b520d988d8b3d8a7d8afd8a7d8aa20d8a7d984d981d8b1d8a7d985d98420d988d8a7d984d8afd988d8a7d8b1d8a7d8aa20d988d985d8b3d8aad988d98ad8a7d8aa20d8b3d8a7d8a6d98420d8a7d984d981d8b1d8a7d985d9842e3c2f703e0d0a3c703ed8a7d8b3d8aad8a8d8afd8a7d98420d8b4d981d8b1d8a920d8a7d984d985d8b3d8a7d8add8a7d8aa3a20d8a7d984d8b1d8a4d98ad8a920d8a7d984d988d8a7d8b6d8add8a920d8a3d985d8b120d8a8d8a7d984d8ba20d8a7d984d8a3d987d985d98ad8a920d984d984d982d98ad8a7d8afd8a920d8a7d984d8a2d985d986d8a92e20d8aad8b9d8b1d98120d8b9d984d98920d8a7d984d988d982d8aa20d8a7d984d985d986d8a7d8b3d8a820d984d8a7d8b3d8aad8a8d8afd8a7d98420d8b4d981d8b1d8a7d8aa20d8a7d984d985d8b3d8a7d8add8a7d8aa20d984d984d8add981d8a7d8b820d8b9d984d98920d8a7d984d8b2d8acd8a7d8ac20d8a7d984d8a3d985d8a7d985d98a20d986d8b8d98ad981d98bd8a720d8a3d8abd986d8a7d8a120d987d8b7d988d98420d8a7d984d8a3d985d8b7d8a7d8b120d988d8a7d984d8abd984d988d8ac2e3c2f703e0d0a3c703ed8a7d984d8b9d986d8a7d98ad8a920d8a7d984d8afd8a7d8aed984d98ad8a920d988d8a7d984d8aed8a7d8b1d8acd98ad8a93a3c2f703e0d0a3c703ed8a7d984d8aad986d8b8d98ad98120d8a7d984d8afd8a7d8aed984d98a3a20d8a7d984d8aad8b5d985d98ad98520d8a7d984d8afd8a7d8aed984d98a20d8a7d984d986d8b8d98ad98120d98ad8b9d8b2d8b220d8a7d984d8b1d8a7d8add8a920d988d8a7d984d982d98ad985d8a92e20d8a7d983d8aad8b4d98120d986d8b5d8a7d8a6d8ad20d984d8aad986d8b8d98ad98120d988d8b5d98ad8a7d986d8a920d985d981d8b1d988d8b4d8a7d8aa20d8b3d98ad8a7d8b1d8aad98320d988d984d988d8add8a920d8a7d984d982d98ad8a7d8afd8a920d988d8a7d984d8b3d8acd8a7d8af2e3c2f703e0d0a3c703ed8a7d984d8b9d986d8a7d98ad8a920d8a7d984d8aed8a7d8b1d8acd98ad8a93a20d8add8a7d981d8b820d8b9d984d98920d8aad8b4d8b7d98ad8a820d8b3d98ad8a7d8b1d8aad98320d985d98620d8aed984d8a7d98420d8aad982d986d98ad8a7d8aa20d8a7d984d8bad8b3d98ad98420d988d8a7d984d8aad8b4d985d98ad8b920d988d8a7d984d8aad981d8b5d98ad98420d8a7d984d985d986d8a7d8b3d8a8d8a92e20d8aad8bad8b7d98a20d982d8a7d8a6d985d8aad986d8a720d8a7d984d985d8b1d8acd8b9d98ad8a920d983d98ad981d98ad8a920d8add985d8a7d98ad8a920d8b7d984d8a7d8a120d8b3d98ad8a7d8b1d8aad98320d985d98620d8a7d984d8b9d986d8a7d8b5d8b12e3c2f703e0d0a3c703ed985d98620d8aed984d8a7d98420d8a7d8aad8a8d8a7d8b920d982d8a7d8a6d985d8a920d8a7d984d985d8b1d8a7d8acd8b9d8a920d8a7d984d8b4d8a7d985d984d8a920d984d8b5d98ad8a7d986d8a920d8a7d984d8b3d98ad8a7d8b1d8a9d88c20d8b3d8aad8b6d985d98620d8a3d98620d8aad8b8d98420d8b3d98ad8a7d8b1d8aad98320d985d988d8abd988d982d8a920d988d981d8b9d8a7d984d8a920d988d8a2d985d986d8a92e20d984d8a720d8aad988d981d8b120d984d98320d8a7d984d8b5d98ad8a7d986d8a920d8a7d984d8afd988d8b1d98ad8a920d8a7d984d985d8a7d98420d8a7d984d8b0d98a20d8aad986d981d982d98720d8b9d984d98920d8a7d984d8a5d8b5d984d8a7d8add8a7d8aa20d8a7d984d985d8add8aad985d984d8a920d981d8add8b3d8a8d88c20d8a8d98420d8aad8b3d8a7d8b9d8afd98320d8a3d98ad8b6d98bd8a720d8b9d984d98920d8a7d984d8a7d8b3d8aad985d8aad8a7d8b920d8a8d8aad8acd8b1d8a8d8a920d982d98ad8a7d8afd8a920d8a3d983d8abd8b120d8b3d984d8a7d8b3d8a920d988d985d8aad8b9d8a92e20d8a7d8acd8b9d98420d982d8a7d8a6d985d8a920d8a7d984d985d8b1d8a7d8acd8b9d8a920d987d8b0d98720d8b1d981d98ad982d98320d8a7d984d985d988d8abd988d98220d8a8d98720d988d8a7d985d986d8ad20d8b3d98ad8a7d8b1d8aad98320d8a7d984d8b1d8b9d8a7d98ad8a920d8a7d984d8aad98a20d8aad8b3d8aad8add982d987d8a72e3c2f703e, NULL, NULL, '2024-06-13 06:53:20', '2024-06-14 09:24:08'),
(56, 25, 53, 25, 'كيفية التعامل مع قضايا المستأجر: دليل لأصحاب العقارات', 'كيفية-التعامل-مع-قضايا-المستأجر:-دليل-لأصحاب-العقارات', 'أندريا', 0x3c703ed985d8b920d8aad8b7d988d8b120d8b5d986d8a7d8b9d8a920d8a7d984d8b3d98ad8a7d8b1d8a7d8aad88c20d8aad8aad8b7d988d8b120d8a3d98ad8b6d98bd8a720d8a7d984d8aad982d986d98ad8a7d8aa20d8a7d984d8aad98a20d8aad8add8a7d981d8b820d8b9d984d98920d8b3d984d8a7d985d8aad986d8a720d988d8aad8b9d8b2d8b220d8aad8acd8b1d8a8d8a920d8a7d984d982d98ad8a7d8afd8a920d984d8afd98ad986d8a72e20d8aad8aad8b9d985d98220d8a3d8add8afd8ab20d985d986d8b4d988d8b1d8a7d8aad986d8a720d8b9d984d98920d8a7d984d985d8afd988d986d8a920d981d98a20d8a7d984d8b9d8a7d984d98520d8a7d984d985d8abd98ad8b120d984d8b3d984d8a7d985d8a920d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d988d8a7d984d8a7d8a8d8aad983d8a7d8b1d8a7d8aa20d8a7d984d8aad983d986d988d984d988d8acd98ad8a9d88c20d985d985d8a720d98ad985d986d8add98320d985d982d8b9d8afd98bd8a720d981d98a20d8a7d984d8b5d98120d8a7d984d8a3d985d8a7d985d98a20d984d985d8b3d8aad982d8a8d98420d8a7d984d982d98ad8a7d8afd8a92e20d8a8d8afd8a1d98bd8a720d985d98620d8a3d986d8b8d985d8a920d985d8b3d8a7d8b9d8afd8a920d8a7d984d8b3d8a7d8a6d98220d8a7d984d985d8aad982d8afd985d8a92028414441532920d988d988d8b5d988d984d8a7d98b20d8a5d984d98920d985d98ad8b2d8a7d8aa20d8a7d984d8a7d8aad8b5d8a7d98420d8a7d984d985d8aad8b7d988d8b1d8a9d88c20d8b3d986d8b3d8aad983d8b4d98120d983d98ad98120d8aad8b4d983d98420d987d8b0d98720d8a7d984d8aad982d986d98ad8a7d8aa20d8a7d984d8b7d8b1d98ad982d8a920d8a7d984d8aad98a20d986d982d988d8af20d8a8d987d8a720d988d8aad8a3d8abd98ad8b1d987d8a720d8b9d984d98920d8b3d984d8a7d985d8aad986d8a720d988d8b1d8a7d8add8aad986d8a72e3c2f703e0d0a3c703ed8b8d987d988d8b120d8a3d986d8b8d985d8a920d985d8b3d8a7d8b9d8afd8a920d8a7d984d8b3d8a7d8a6d98220d8a7d984d985d8aad982d8afd985d8a9202841444153293a3c2f703e0d0a3c703ed8a7d983d8aad8b4d98120d983d98ad98120d8aad98fd8add8afd8ab20d8aad982d986d98ad8a7d8aa2041444153d88c20d985d8abd98420d8a7d984d8aad8add8b0d98ad8b120d985d98620d985d8bad8a7d8afd8b1d8a920d8a7d984d985d8b3d8a7d8b1d88c20d988d986d8b8d8a7d98520d8aad8abd8a8d98ad8aa20d8a7d984d8b3d8b1d8b9d8a920d8a7d984d8aad983d98ad981d98ad88c20d988d981d8b1d8a7d985d98420d8a7d984d8b7d988d8a7d8b1d8a620d8a7d984d8aad984d982d8a7d8a6d98ad8a9d88c20d8abd988d8b1d8a920d981d98a20d8a7d984d8b7d8b1d98ad982d8a920d8a7d984d8aad98a20d986d8aad981d8a7d8b9d98420d8a8d987d8a720d985d8b920d8b3d98ad8a7d8b1d8a7d8aad986d8a72e20d98ad8b4d8b1d8ad20d985d986d8b4d988d8b120d985d8afd988d986d8aad986d8a720d988d8b8d8a7d8a6d98120d983d98420d986d8b8d8a7d985d88c20d988d981d988d8a7d8a6d8afd98720d981d98a20d985d986d8b920d8a7d984d8add988d8a7d8afd8abd88c20d988d983d98ad981d98ad8a920d8b9d985d984d987d98520d985d8b9d98bd8a720d984d8aed984d98220d8a8d98ad8a6d8a920d982d98ad8a7d8afd8a920d8a3d983d8abd8b120d8a3d985d8a7d986d98bd8a72e3c2f703e0d0a3c703ed8a7d984d8a7d8aad8b5d8a7d98420d988d8a7d984d985d8b9d984d988d985d8a7d8aa20d988d8a7d984d8aad8b1d981d98ad9873a3c2f703e0d0a3c703ed8a7d8b3d8aad985d8aad8b920d8a8d8aad8acd8b1d8a8d8a920d8a7d984d8aad982d8a7d8b1d8a820d8a8d98ad98620d8a7d984d8aad983d986d988d984d988d8acd98ad8a720d988d8a7d984d8aad8b1d981d98ad98720d985d8b920d8a3d8add8afd8ab20d985d98ad8b2d8a7d8aa20d8a7d984d8a7d8aad8b5d8a7d9842e20d8a7d983d8aad8b4d98120d983d98ad98120d98ad985d983d98620d984d984d985d8b1d983d8a8d8a7d8aa20d8a7d984d8add8afd98ad8abd8a920d8a3d98620d8aad8aad983d8a7d985d98420d8a8d8b3d984d8a7d8b3d8a920d985d8b920d987d988d8a7d8aad981d986d8a720d8a7d984d8b0d983d98ad8a9d88c20d985d985d8a720d98ad988d981d8b120d984d986d8a720d8a5d985d983d8a7d986d98ad8a920d8a7d984d8aad986d982d98420d981d98a20d8a7d984d988d982d8aa20d8a7d984d981d8b9d984d98ad88c20d988d8a7d984d8aad988d8a7d8b5d98420d8a8d8afd988d98620d8a7d8b3d8aad8aed8afd8a7d98520d8a7d984d98ad8afd98ad986d88c20d988d8a7d984d988d8b5d988d98420d8a5d984d98920d8a7d984d985d988d8b3d98ad982d98920d988d8a7d984d8aad8b7d8a8d98ad982d8a7d8aa2e20d8b3d986d8b3d8aad983d8b4d98120d8a7d984d988d8a7d8acd987d8a7d8aa20d8b3d987d984d8a920d8a7d984d8a7d8b3d8aad8aed8afd8a7d98520d8a7d984d8aad98a20d8aad8acd8b9d98420d8a7d984d982d98ad8a7d8afd8a920d8a3d983d8abd8b120d8b1d8a7d8add8a920d988d985d8aad8b9d8a92e3c2f703e0d0a3c703ed8aad982d986d98ad8a7d8aa20d8aad8acd986d8a820d8a7d984d8a7d8b5d8b7d8afd8a7d9853a3c2f703e0d0a3c703ed8a7d8b3d8aad983d8b4d8a7d98120d985d8aad8b9d985d98220d984d8aad982d986d98ad8a7d8aa20d8aad8acd986d8a820d8a7d984d8a7d8b5d8b7d8afd8a7d985d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d983d98ad981d98ad8a920d8a7d983d8aad8b4d8a7d98120d8a3d8acd987d8b2d8a920d8a7d984d8a7d8b3d8aad8b4d8b9d8a7d8b120d988d8a7d984d983d8a7d985d98ad8b1d8a7d8aa20d984d984d8a7d8b5d8b7d8afd8a7d985d8a7d8aa20d8a7d984d985d8add8aad985d984d8a920d988d8aad986d8a8d98ad98720d8a7d984d8b3d8a7d8a6d982d98ad98620d981d98a20d8a7d984d988d982d8aa20d8a7d984d981d8b9d984d98a2e20d98ad8bad8b7d98a20d985d986d8b4d988d8b120d985d8afd988d986d8aad986d8a720d8a3d986d8b8d985d8a920d985d8abd98420d985d8b1d8a7d982d8a8d8a920d8a7d984d986d982d8a7d8b720d8a7d984d8b9d985d98ad8a7d8a1d88c20d988d8a7d984d8aad986d8a8d98ad98720d985d98620d8add8b1d983d8a920d8a7d984d985d8b1d988d8b120d8a7d984d8aed984d981d98ad8a9d88c20d988d8a7d983d8aad8b4d8a7d98120d8a7d984d985d8b4d8a7d8a9d88c20d988d983d984d987d8a720d985d8b5d985d985d8a920d984d8aad982d984d98ad98420d8a7d984d8add988d8a7d8afd8ab20d988d8aad8add8b3d98ad98620d8b3d984d8a7d985d8a920d8a7d984d985d8b4d8a7d8a92e3c2f703e0d0a3c703ed8a7d984d985d8b3d8a7d8b9d8afd8a920d981d98a20d8b1d983d98620d8a7d984d8b3d98ad8a7d8b1d8a920d988d985d988d8a7d982d98120d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad982d984d8a93a3c2f703e0d0a3c703ed8a3d8b5d8a8d8ad20d8a7d984d982d984d98220d985d98620d985d988d8a7d982d98120d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d988d8a7d8b2d98ad8a920d8b4d98ad8a6d8a7d98b20d985d98620d8a7d984d985d8a7d8b6d98a20d985d8b920d8aad983d986d988d984d988d8acd98ad8a720d985d988d8a7d982d98120d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a7d984d985d8b3d8aad982d984d8a92e20d8a7d983d8aad8b4d98120d983d98ad98120d98ad985d983d98620d984d984d985d8b1d983d8a8d8a7d8aa20d8a7d984d985d8acd987d8b2d8a920d8a8d987d8b0d98720d8a7d984d985d98ad8b2d8a920d985d8b3d8ad20d8a3d985d8a7d983d98620d988d982d988d98120d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d988d8a7d984d8aad986d982d98420d981d98ad987d8a7d88c20d985d985d8a720d98ad8acd8b9d98420d8b1d983d98620d8a7d984d8b3d98ad8a7d8b1d8a920d981d98a20d8a7d984d8a3d985d8a7d983d98620d8a7d984d8b6d98ad982d8a920d8a3d985d8b1d98bd8a720d8b3d987d984d8a7d98b2e20d8b3d986d986d8a7d982d8b420d8a3d98ad8b6d98bd8a720d8a7d984d8aad8b7d988d8b1d8a7d8aa20d981d98a20d8a7d984d982d98ad8a7d8afd8a920d8a7d984d8b0d8a7d8aad98ad8a920d988d8a7d984d8a5d985d983d8a7d986d8a7d8aa20d8a7d984d8aad98a20d8aad8add985d984d987d8a720d984d985d8b3d8aad982d8a8d98420d8a7d984d986d982d9842e3c2f703e0d0a3c703ed8a7d984d8b1d8a4d98ad8a920d8a7d984d984d98ad984d98ad8a920d988d8a7d984d8a5d8b6d8a7d8a1d8a920d8a7d984d985d8add8b3d986d8a93a3c2f703e0d0a3c703ed982d8af20d8aad983d988d98620d8a7d984d982d98ad8a7d8afd8a920d984d98ad984d8a7d98b20d8b5d8b9d8a8d8a9d88c20d988d984d983d98620d985d8b920d8aad982d986d98ad8a920d8a7d984d8b1d8a4d98ad8a920d8a7d984d984d98ad984d98ad8a9d88c20d98ad985d983d986d98320d8b1d8a4d98ad8a920d985d8a720d987d98820d8a3d8a8d8b9d8af20d985d98620d8add8afd988d8af20d8a7d984d985d8b5d8a7d8a8d98ad8ad20d8a7d984d8a3d985d8a7d985d98ad8a92e20d8aad8b9d8b1d98120d8b9d984d98920d983d8a7d985d98ad8b1d8a7d8aa20d8a7d984d8a3d8b4d8b9d8a920d8aad8add8aa20d8a7d984d8add985d8b1d8a7d8a120d988d983d98ad98120d98ad985d983d986d987d8a720d8a7d983d8aad8b4d8a7d98120d8a7d984d985d8b4d8a7d8a920d988d8a7d984d8b9d988d8a7d8a6d98220d981d98a20d8b8d8b1d988d98120d8a7d984d8a5d8b6d8a7d8a1d8a920d8a7d984d985d986d8aed981d8b6d8a92e20d98ad8b3d8aad983d8b4d98120d985d986d8b4d988d8b120d985d8afd988d986d8aad986d8a720d8a3d98ad8b6d98bd8a720d8a3d986d8b8d985d8a920d8a7d984d8a5d8b6d8a7d8a1d8a920d8a7d984d8aad983d98ad981d98ad8a920d8a7d984d8aad98a20d8aad8aad983d98ad98120d985d8b920d8b8d8b1d988d98120d8a7d984d8b7d8b1d98ad98220d988d8aad8add8b3d98620d8a7d984d8b1d8a4d98ad8a92e3c2f703e0d0a3c703ed988d8b9d8af20d8a7d984d985d8b1d983d8a8d8a7d8aa20d8b0d8a7d8aad98ad8a920d8a7d984d982d98ad8a7d8afd8a93a3c2f703e0d0a3c703ed981d98a20d8add98ad98620d8a3d98620d8a7d984d985d8b1d983d8a8d8a7d8aa20d8b0d8a7d8aad98ad8a920d8a7d984d982d98ad8a7d8afd8a920d8a8d8a7d984d983d8a7d985d98420d984d8a720d8aad8b2d8a7d98420d982d98ad8af20d8a7d984d8aad8b7d988d98ad8b1d88c20d981d8a5d98620d985d986d8b4d988d8b120d985d8afd988d986d8aad986d8a720d98ad982d8afd98520d986d8b8d8b1d8a920d8abd8a7d982d8a8d8a920d8add988d98420d8a7d984d8aad982d8afd98520d8a7d984d985d8add8b1d8b220d988d8a7d984d981d988d8a7d8a6d8af20d8a7d984d985d8add8aad985d984d8a920d984d984d8b3d98ad8a7d8b1d8a7d8aa20d8b0d8a7d8aad98ad8a920d8a7d984d982d98ad8a7d8afd8a92e20d8b3d986d986d8a7d982d8b420d8a7d984d985d8b3d8aad988d98ad8a7d8aa20d8a7d984d985d8aed8aad984d981d8a920d984d984d8a3d8aad985d8aad8a9d88c20d988d8a7d984d8aad8add8afd98ad8a7d8aa20d8a7d984d8aad98a20d98ad988d8a7d8acd987d987d8a720d985d8b7d988d8b1d98820d8a7d984d985d8b1d983d8a8d8a7d8aa20d8b0d8a7d8aad98ad8a920d8a7d984d982d98ad8a7d8afd8a9d88c20d988d8a7d984d8b7d8b1d98220d8a7d984d8aad98a20d98ad985d983d98620d984d987d8b0d98720d8a7d984d985d8b1d983d8a8d8a7d8aa20d985d98620d8aed984d8a7d984d987d8a720d8a5d8b9d8a7d8afd8a920d8aad8b4d983d98ad98420d985d8b3d8aad982d8a8d98420d8a7d984d986d982d9842e3c2f703e0d0a3c703ed8a7d984d8a3d985d98620d8a7d984d8b3d98ad8a8d8b1d8a7d986d98a20d988d8aed8b5d988d8b5d98ad8a920d8a7d984d8a8d98ad8a7d986d8a7d8aa3a3c2f703e0d0a3c703ed985d8b920d8b2d98ad8a7d8afd8a920d8a7d8aad8b5d8a7d98420d8a7d984d8b3d98ad8a7d8b1d8a7d8aad88c20d98ad8b5d8a8d8ad20d8a7d984d8a3d985d98620d8a7d984d8b3d98ad8a8d8b1d8a7d986d98a20d8a3d8add8af20d8a7d984d8a7d8b9d8aad8a8d8a7d8b1d8a7d8aa20d8a7d984d8add8a7d8b3d985d8a92e20d98ad8aad986d8a7d988d98420d985d986d8b4d988d8b120d985d8afd988d986d8aad986d8a720d8a3d987d985d98ad8a920d8add985d8a7d98ad8a920d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8b3d98ad8a7d8b1d8a920d985d98620d8a7d984d8aad987d8afd98ad8afd8a7d8aa20d8a7d984d8b3d98ad8a8d8b1d8a7d986d98ad8a920d988d98ad986d8a7d982d8b420d983d98ad981d98ad8a920d982d98ad8a7d98520d8b4d8b1d983d8a7d8aa20d8aad8b5d986d98ad8b920d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d8a8d8aad986d981d98ad8b020d8aad8afd8a7d8a8d98ad8b120d984d8add985d8a7d98ad8a920d8aed8b5d988d8b5d98ad8aad986d8a720d988d8a3d985d986d986d8a72e3c2f703e0d0a3c703ed8a7d8add8aad8b6d98620d985d8b3d8aad982d8a8d98420d8a7d984d982d98ad8a7d8afd8a920d985d98620d8aed984d8a7d98420d8a7d8b3d8aad983d8b4d8a7d981d986d8a720d984d8b3d984d8a7d985d8a920d8a7d984d8b3d98ad8a7d8b1d8a7d8aa20d988d8a7d984d8a7d8a8d8aad983d8a7d8b1d8a7d8aa20d8a7d984d8aad983d986d988d984d988d8acd98ad8a92e20d8a8d8afd8a1d98bd8a720d985d98620d8a3d986d8b8d985d8a920d985d8b3d8a7d8b9d8afd8a920d8a7d984d8b3d8a7d8a6d98220d8a7d984d985d8aad982d8afd985d8a920d8a7d984d8aad98a20d8aad8b9d985d98420d983d8b9d98ad98620d8abd8a7d986d98ad8a920d988d988d8b5d988d984d8a7d98b20d8a5d984d98920d985d98ad8b2d8a7d8aa20d8a7d984d8a7d8aad8b5d8a7d98420d8a7d984d8aad98a20d8aad8a8d982d98ad98320d985d8b3d8aad985d8aad8b9d98bd8a720d988d985d8aad8b5d984d8a7d98b20d8a3d8abd986d8a7d8a120d8a7d984d8aad986d982d984d88c20d981d8a5d98620d987d8b0d98720d8a7d984d8aad8b7d988d8b1d8a7d8aa20d984d8a720d8aad8bad98ad8b120d8a7d984d8b7d8b1d98ad982d8a920d8a7d984d8aad98a20d986d982d988d8af20d8a8d987d8a720d981d8add8b3d8a8d88c20d8a8d98420d8aad8b9d985d98420d8a3d98ad8b6d98bd8a720d8b9d984d98920d8aad8b9d8b2d98ad8b220d8a7d984d8b3d984d8a7d985d8a920d988d8a7d984d8b1d8a7d8add8a920d981d98a20d8b1d8add984d8a7d8aad986d8a72e20d8a7d986d8b6d98520d8a5d984d98ad986d8a720d988d986d8add98620d986d8aad8b9d985d98220d981d98a20d8a7d984d8aad982d986d98ad8a7d8aa20d8a7d984d985d8aad8b7d988d8b1d8a920d8a7d984d8aad98a20d8aad8b9d98ad8af20d8aad8b4d983d98ad98420d985d8b4d987d8af20d8a7d984d8b3d98ad8a7d8b1d8a7d8aa2e3c2f703e, NULL, NULL, '2024-06-13 06:54:22', '2024-06-14 09:22:07'),
(57, 20, 44, 28, 'Understanding Lease Agreements: What Every Tenant Should Know', 'understanding-lease-agreements:-what-every-tenant-should-know', 'Farhan', 0x3c703e5768656e2072656e74696e6720612070726f70657274792c20746865206c656173652061677265656d656e74206973206f6e65206f6620746865206d6f7374206372756369616c20646f63756d656e747320796f75276c6c20656e636f756e7465722e204974206f75746c696e657320746865207465726d7320616e6420636f6e646974696f6e73206f6620796f75722074656e616e63792c20656e737572696e67207468617420626f746820796f7520616e6420796f7572206c616e646c6f726420756e6465727374616e6420796f75722072696768747320616e6420726573706f6e736962696c69746965732e2048657265e280997320612064657461696c6564206775696465206f6e20776861742065766572792074656e616e742073686f756c64206b6e6f772061626f7574206c656173652061677265656d656e74733a3c2f703e0d0a3c68343e312e203c7374726f6e673e5479706573206f66204c656173652041677265656d656e74733c2f7374726f6e673e3c2f68343e0d0a3c756c3e0d0a3c6c693e3c7374726f6e673e46697865642d5465726d204c656173653c2f7374726f6e673e3a2054686973207479706520686173206120736574206475726174696f6e2c207479706963616c6c79206f6e6520796561722e20546865207465726d732061726520666978656420616e642063616e6e6f74206265206368616e67656420756e74696c20746865206c6561736520656e647320756e6c65737320626f746820706172746965732061677265652e3c2f6c693e0d0a3c6c693e3c7374726f6e673e4d6f6e74682d746f2d4d6f6e7468204c656173653c2f7374726f6e673e3a2054686973206c656173652072656e657773206d6f6e74686c7920616e642063616e206265207465726d696e61746564206f7220616c746572656420776974682070726f706572206e6f746963652028757375616c6c792033302064617973292e3c2f6c693e0d0a3c6c693e3c7374726f6e673e5375626c656173652041677265656d656e743c2f7374726f6e673e3a2054686973206f6363757273207768656e20616e206578697374696e672074656e616e742072656e7473206f7574207468652070726f706572747920746f20612074686972642070617274792c207769746820746865206c616e646c6f7264e2809973207065726d697373696f6e2e3c2f6c693e0d0a3c2f756c3e0d0a3c68343e322e203c7374726f6e673e4b657920436f6d706f6e656e7473206f662061204c656173652041677265656d656e743c2f7374726f6e673e3c2f68343e0d0a3c756c3e0d0a3c6c693e3c7374726f6e673e4e616d6573206f6620506172746965733c2f7374726f6e673e3a20546865206c656173652073686f756c6420636c6561726c7920737461746520746865206e616d6573206f6620746865206c616e646c6f72642c2074656e616e742c20616e6420616e79206f74686572206f63637570616e74732e3c2f6c693e0d0a3c6c693e3c7374726f6e673e50726f7065727479204465736372697074696f6e3c2f7374726f6e673e3a2044657461696c73206f66207468652072656e74616c2070726f70657274792c20696e636c7564696e67206164647265737320616e6420756e6974206e756d6265722e3c2f6c693e0d0a3c6c693e3c7374726f6e673e4c65617365205465726d3c2f7374726f6e673e3a2054686520737461727420616e6420656e642064617465206f6620746865206c656173652e3c2f6c693e0d0a3c6c693e3c7374726f6e673e52656e742044657461696c733c2f7374726f6e673e3a2054686520616d6f756e74206f662072656e742c2064756520646174652c2061636365707461626c65207061796d656e74206d6574686f64732c20616e64206c61746520666565732e3c2f6c693e0d0a3c6c693e3c7374726f6e673e5365637572697479204465706f7369743c2f7374726f6e673e3a2054686520616d6f756e742c207465726d7320666f72206974732072657475726e2c20616e6420636f6e646974696f6e7320756e6465722077686963682069742063616e206265207769746868656c642e3c2f6c693e0d0a3c6c693e3c7374726f6e673e5574696c69746965733c2f7374726f6e673e3a20496e666f726d6174696f6e206f6e207768696368207574696c69746965732061726520696e636c7564656420696e207468652072656e7420616e64207768696368206f6e6573207468652074656e616e7420697320726573706f6e7369626c6520666f722e3c2f6c693e0d0a3c6c693e3c7374726f6e673e4d61696e74656e616e636520616e6420526570616972733c2f7374726f6e673e3a20526573706f6e736962696c697469657320666f72206d61696e74656e616e636520616e6420726570616972732c20616e642070726f6365647572657320666f72207265706f7274696e6720616e642068616e646c696e67206973737565732e3c2f6c693e0d0a3c6c693e3c7374726f6e673e4f63637570616e6379204c696d6974733c2f7374726f6e673e3a204e756d626572206f662070656f706c6520616c6c6f77656420746f206c69766520696e2074686520756e69742e3c2f6c693e0d0a3c6c693e3c7374726f6e673e50657420506f6c69636965733c2f7374726f6e673e3a2052756c657320726567617264696e6720706574732c20696e636c7564696e67206465706f7369747320616e64207265737472696374696f6e732e3c2f6c693e0d0a3c6c693e3c7374726f6e673e52656e6577616c205465726d733c2f7374726f6e673e3a20436f6e646974696f6e7320756e64657220776869636820746865206c656173652063616e2062652072656e65776564206f72207465726d696e617465642e3c2f6c693e0d0a3c2f756c3e0d0a3c68343e332e203c7374726f6e673e496d706f7274616e7420436c617573657320746f20556e6465727374616e643c2f7374726f6e673e3c2f68343e0d0a3c756c3e0d0a3c6c693e3c7374726f6e673e5269676874206f6620456e7472793c2f7374726f6e673e3a20436f6e646974696f6e7320756e64657220776869636820746865206c616e646c6f72642063616e20656e746572207468652070726f70657274792c20757375616c6c7920666f7220696e7370656374696f6e732c20726570616972732c206f7220656d657267656e636965732e3c2f6c693e0d0a3c6c693e3c7374726f6e673e5375626c657474696e673c2f7374726f6e673e3a2057686574686572207375626c657474696e6720697320616c6c6f77656420616e6420756e646572207768617420636f6e646974696f6e732e3c2f6c693e0d0a3c6c693e3c7374726f6e673e416c7465726174696f6e7320616e6420496d70726f76656d656e74733c2f7374726f6e673e3a2052756c65732061626f7574206d616b696e67206368616e67657320746f207468652070726f70657274792c2073756368206173207061696e74696e67206f7220696e7374616c6c696e672066697874757265732e3c2f6c693e0d0a3c2f756c3e, NULL, NULL, '2024-06-13 07:50:40', '2024-06-13 07:50:40'),
(58, 25, 53, 28, 'فهم اتفاقيات الإيجار: ما يجب أن يعرفه كل مستأجر', 'فهم-اتفاقيات-الإيجار:-ما-يجب-أن-يعرفه-كل-مستأجر', 'فرحان', 0x3c703ed8b9d986d8af20d8a7d8b3d8aad8a6d8acd8a7d8b120d8b9d982d8a7d8b1d88c20d98ad8b9d8af20d8b9d982d8af20d8a7d984d8a5d98ad8acd8a7d8b120d8a3d8add8af20d8a3d987d98520d8a7d984d985d8b3d8aad986d8afd8a7d8aa20d8a7d984d8aad98a20d8b3d8aad988d8a7d8acd987d987d8a72e20d981d987d98820d98ad988d8b6d8ad20d8b4d8b1d988d8b720d988d8a3d8add983d8a7d98520d8b9d982d8af20d8a7d984d8a5d98ad8acd8a7d8b120d8a7d984d8aed8a7d8b520d8a8d983d88c20d985d985d8a720d98ad8b6d985d98620d981d987d985d98320d8a3d986d8aa20d988d985d8a7d984d98320d8a7d984d8b9d982d8a7d8b120d984d8add982d988d982d98320d988d985d8b3d8a4d988d984d98ad8a7d8aad9832e20d981d98ad985d8a720d98ad984d98a20d8afd984d98ad98420d8aad981d8b5d98ad984d98a20d8add988d98420d985d8a720d98ad8acd8a820d8a3d98620d98ad8b9d8b1d981d98720d983d98420d985d8b3d8aad8a3d8acd8b120d8add988d98420d8a7d8aad981d8a7d982d98ad8a7d8aa20d8a7d984d8a5d98ad8acd8a7d8b13a3c2f703e0d0a3c703e312e20d8a3d986d988d8a7d8b920d8b9d982d988d8af20d8a7d984d8a5d98ad8acd8a7d8b13c6272202f3ed8a7d984d8a5d98ad8acd8a7d8b120d985d8add8afd8af20d8a7d984d985d8afd8a93a20d987d8b0d8a720d8a7d984d986d988d8b920d984d98720d985d8afd8a920d985d8add8afd8afd8a9d88c20d8b9d8a7d8afd8a920d8b3d986d8a920d988d8a7d8add8afd8a92e20d8a7d984d8b4d8b1d988d8b720d8abd8a7d8a8d8aad8a920d988d984d8a720d98ad985d983d98620d8aad8bad98ad98ad8b1d987d8a720d8add8aad98920d8a7d986d8aad987d8a7d8a120d8b9d982d8af20d8a7d984d8a5d98ad8acd8a7d8b120d985d8a720d984d98520d98ad8aad981d98220d8a7d984d8b7d8b1d981d8a7d9862e3c6272202f3ed8a7d984d8a5d98ad8acd8a7d8b120d985d98620d8b4d987d8b120d8a5d984d98920d8b4d987d8b13a20d98ad8aad98520d8aad8acd8afd98ad8af20d8b9d982d8af20d8a7d984d8a5d98ad8acd8a7d8b120d987d8b0d8a720d8b4d987d8b1d98ad98bd8a720d988d98ad985d983d98620d8a5d986d987d8a7d8a4d98720d8a3d98820d8aad8bad98ad98ad8b1d98720d8a8d8a5d8b4d8b9d8a7d8b120d985d986d8a7d8b3d8a82028d8b9d8a7d8afd8a9d98b20333020d98ad988d985d98bd8a7292e3c6272202f3ed8a7d8aad981d8a7d982d98ad8a920d8a7d984d8a5d98ad8acd8a7d8b120d985d98620d8a7d984d8a8d8a7d8b7d9863a20d98ad8add8afd8ab20d987d8b0d8a720d8b9d986d8afd985d8a720d98ad982d988d98520d8a7d984d985d8b3d8aad8a3d8acd8b120d8a7d984d8add8a7d984d98a20d8a8d8aad8a3d8acd98ad8b120d8a7d984d8b9d982d8a7d8b120d984d8b7d8b1d98120d8abd8a7d984d8abd88c20d8a8d8b9d8af20d8a7d984d8add8b5d988d98420d8b9d984d98920d8a5d8b0d98620d8a7d984d985d8a7d984d9832e3c6272202f3e322e20d8a7d984d985d983d988d986d8a7d8aa20d8a7d984d8b1d8a6d98ad8b3d98ad8a920d984d8b9d982d8af20d8a7d984d8a5d98ad8acd8a7d8b13c6272202f3ed8a3d8b3d985d8a7d8a120d8a7d984d8a3d8b7d8b1d8a7d9813a20d98ad8acd8a820d8a3d98620d98ad986d8b520d8b9d982d8af20d8a7d984d8a5d98ad8acd8a7d8b120d8a8d988d8b6d988d8ad20d8b9d984d98920d8a3d8b3d985d8a7d8a120d8a7d984d985d8a7d984d98320d988d8a7d984d985d8b3d8aad8a3d8acd8b120d988d8a3d98a20d8b4d8a7d8bad984d98ad98620d8a2d8aed8b1d98ad9862e3c6272202f3ed988d8b5d98120d8a7d984d8b9d982d8a7d8b13a20d8aad981d8a7d8b5d98ad98420d8a7d984d8b9d982d8a7d8b120d8a7d984d985d8b3d8aad8a3d8acd8b1d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d8a7d984d8b9d986d988d8a7d98620d988d8b1d982d98520d8a7d984d988d8add8afd8a92e3c6272202f3ed985d8afd8a920d8a7d984d8a5d98ad8acd8a7d8b13a20d8aad8a7d8b1d98ad8ae20d8a8d8afd8a7d98ad8a920d988d986d987d8a7d98ad8a920d8b9d982d8af20d8a7d984d8a5d98ad8acd8a7d8b12e3c6272202f3ed8aad981d8a7d8b5d98ad98420d8a7d984d8a5d98ad8acd8a7d8b13a20d985d8a8d984d8ba20d8a7d984d8a5d98ad8acd8a7d8b120d988d8aad8a7d8b1d98ad8ae20d8a7d984d8a7d8b3d8aad8add982d8a7d98220d988d8b7d8b1d98220d8a7d984d8afd981d8b920d8a7d984d985d982d8a8d988d984d8a920d988d8b1d8b3d988d98520d8a7d984d8aad8a3d8aed98ad8b12e3c6272202f3ed988d8afd98ad8b9d8a920d8a7d984d8b6d985d8a7d9863a20d8a7d984d985d8a8d984d8ba20d988d8b4d8b1d988d8b720d8b1d8afd98720d988d8a7d984d8a3d988d8b6d8a7d8b920d8a7d984d8aad98a20d98ad8acd988d8b220d8a7d984d8add8acd8b220d8a8d985d988d8acd8a8d987d8a72e3c6272202f3ed8a7d984d985d8b1d8a7d981d9823a20d985d8b9d984d988d985d8a7d8aa20d8b9d98620d8a7d984d985d8b1d8a7d981d98220d8a7d984d985d8b4d985d988d984d8a920d981d98a20d8a7d984d8a5d98ad8acd8a7d8b120d988d8aad984d98320d8a7d984d8aad98a20d98ad8aad8add985d98420d8a7d984d985d8b3d8aad8a3d8acd8b120d985d8b3d8a4d988d984d98ad8aad987d8a72e3c6272202f3ed8a7d984d8b5d98ad8a7d986d8a920d988d8a7d984d8a5d8b5d984d8a7d8add8a7d8aa3a20d985d8b3d8a4d988d984d98ad8a7d8aa20d8a7d984d8b5d98ad8a7d986d8a920d988d8a7d984d8a5d8b5d984d8a7d8add8a7d8aad88c20d988d8a5d8acd8b1d8a7d8a1d8a7d8aa20d8a7d984d8a5d8a8d984d8a7d8ba20d8b9d98620d8a7d984d985d8b4d983d984d8a7d8aa20d988d985d8b9d8a7d984d8acd8aad987d8a72e3c6272202f3ed8add8afd988d8af20d8a7d984d8a5d8b4d8bad8a7d9843a20d8b9d8afd8af20d8a7d984d8a3d8b4d8aed8a7d8b520d8a7d984d985d8b3d985d988d8ad20d984d987d98520d8a8d8a7d984d8b9d98ad8b420d981d98a20d8a7d984d988d8add8afd8a92e3c6272202f3ed8b3d98ad8a7d8b3d8a7d8aa20d8a7d984d8add98ad988d8a7d986d8a7d8aa20d8a7d984d8a3d984d98ad981d8a93a20d8a7d984d982d988d8a7d8b9d8af20d8a7d984d985d8aad8b9d984d982d8a920d8a8d8a7d984d8add98ad988d8a7d986d8a7d8aa20d8a7d984d8a3d984d98ad981d8a9d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d8a7d984d988d8afd8a7d8a6d8b920d988d8a7d984d982d98ad988d8af2e3c6272202f3ed8b4d8b1d988d8b720d8a7d984d8aad8acd8afd98ad8af3a20d8a7d984d8b4d8b1d988d8b720d8a7d984d8aad98a20d98ad985d983d98620d8a8d985d988d8acd8a8d987d8a720d8aad8acd8afd98ad8af20d8b9d982d8af20d8a7d984d8a5d98ad8acd8a7d8b120d8a3d98820d8a5d986d987d8a7d8a6d9872e3c6272202f3e332e20d8a8d986d988d8af20d985d987d985d8a920d98ad8acd8a820d981d987d985d987d8a73c6272202f3ed8add98220d8a7d984d8afd8aed988d9843a20d8a7d984d8b4d8b1d988d8b720d8a7d984d8aad98a20d8a8d985d988d8acd8a8d987d8a720d98ad985d983d98620d984d984d985d8a7d984d98320d8afd8aed988d98420d8a7d984d8b9d982d8a7d8b1d88c20d8b9d8a7d8afd8a920d984d8a5d8acd8b1d8a7d8a120d8b9d985d984d98ad8a7d8aa20d8a7d984d8aad981d8aad98ad8b420d8a3d98820d8a7d984d8a5d8b5d984d8a7d8add8a7d8aa20d8a3d98820d8add8a7d984d8a7d8aa20d8a7d984d8b7d988d8a7d8b1d8a62e3c6272202f3ed8a7d984d8aad8a3d8acd98ad8b120d985d98620d8a7d984d8a8d8a7d8b7d9863a20d985d8a720d8a5d8b0d8a720d983d8a7d98620d8a7d984d8aad8a3d8acd98ad8b120d985d98620d8a7d984d8a8d8a7d8b7d98620d985d8b3d985d988d8add98bd8a720d8a8d98720d988d8aad8add8aa20d8a3d98a20d8b4d8b1d988d8b72e3c6272202f3ed8a7d984d8aad8b9d8afd98ad984d8a7d8aa20d988d8a7d984d8aad8add8b3d98ad986d8a7d8aa3a20d8a7d984d982d988d8a7d8b9d8af20d8a7d984d985d8aad8b9d984d982d8a920d8a8d8a5d8acd8b1d8a7d8a120d8aad8bad98ad98ad8b1d8a7d8aa20d8b9d984d98920d8a7d984d8b9d982d8a7d8b1d88c20d985d8abd98420d8a7d984d8b7d984d8a7d8a120d8a3d98820d8aad8b1d983d98ad8a820d8a7d984d8aad8b1d983d98ad8a8d8a7d8aa2e3c2f703e, NULL, NULL, '2024-06-13 07:50:40', '2024-06-14 09:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `blog_sections`
--

CREATE TABLE `blog_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `blog_sections`
--

INSERT INTO `blog_sections` (`id`, `language_id`, `subtitle`, `title`, `created_at`, `updated_at`) VALUES
(5, 20, 'Blogs', 'Read our latest blogs', '2023-08-19 00:44:01', '2023-08-28 03:06:18'),
(6, 21, 'المدونات', 'اقرأ أحدث مدوناتنا', '2023-08-28 03:06:59', '2023-08-28 03:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `brand_sections`
--

CREATE TABLE `brand_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_sections`
--

INSERT INTO `brand_sections` (`id`, `image`, `created_at`, `updated_at`, `url`) VALUES
(2, '6575a47ad5188.png', '2023-12-10 05:43:54', '2024-06-14 07:36:38', 'http://example.com'),
(3, '6575a486ddd3a.png', '2023-12-10 05:44:06', '2024-06-14 07:36:35', 'http://example.com'),
(4, '6575a49213aca.png', '2023-12-10 05:44:18', '2024-06-14 07:36:26', 'http://example.com'),
(5, '6575a4991197a.png', '2023-12-10 05:44:25', '2024-06-14 07:36:32', 'http://example.com');

-- --------------------------------------------------------

--
-- Table structure for table `call_to_action_sections`
--

CREATE TABLE `call_to_action_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb3_unicode_ci,
  `video_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `call_to_action_sections`
--

INSERT INTO `call_to_action_sections` (`id`, `language_id`, `subtitle`, `title`, `text`, `video_url`, `created_at`, `updated_at`) VALUES
(4, 20, 'How To Submit Your Property Request', 'Video Tutorial', 'Curabitur non nulla sit amet nisl tempus convallis lectus. Nulla porttitor accumsan tincidunt.', 'https://www.youtube.com/watch?v=mrpiPK8_up0', '2023-08-28 02:47:29', '2024-06-14 08:09:22'),
(6, 25, 'كيفية تقديم طلب الممتلكات الخاصة بك', 'فيديو تعليمي', 'في الحب ونيل المنال ويتلذذ بالآلام، الألم هو الألم ولكن نتيجة لظروف ما قد تكمن السعاده فيما نتحمله من كد وأسي', 'https://www.youtube.com/watch?v=mrpiPK8_up0', '2024-06-14 08:09:49', '2024-06-14 08:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `category_sections`
--

CREATE TABLE `category_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `category_sections`
--

INSERT INTO `category_sections` (`id`, `language_id`, `title`, `subtitle`, `created_at`, `updated_at`) VALUES
(3, '20', 'Categories', 'Explore Categories', '2023-08-19 00:11:48', '2024-06-12 11:31:05'),
(5, '25', 'فئات', 'استكشاف الفئات', '2024-03-27 00:10:33', '2024-06-14 07:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `city_sections`
--

CREATE TABLE `city_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city_sections`
--

INSERT INTO `city_sections` (`id`, `language_id`, `title`, `subtitle`, `created_at`, `updated_at`) VALUES
(1, 20, 'Our Cities', 'Explore The City', '2023-12-11 06:00:02', '2024-05-14 03:57:39'),
(2, 25, 'مدننا', 'استكشاف المدينة', '2024-06-14 07:35:12', '2024-06-14 07:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `type` tinyint DEFAULT NULL COMMENT '1=user, 2=admin, 3=vendor',
  `support_ticket_id` int DEFAULT NULL,
  `reply` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cookie_alerts`
--

CREATE TABLE `cookie_alerts` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `cookie_alert_status` tinyint UNSIGNED NOT NULL,
  `cookie_alert_btn_text` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `cookie_alert_text` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `cookie_alerts`
--

INSERT INTO `cookie_alerts` (`id`, `language_id`, `cookie_alert_status`, `cookie_alert_btn_text`, `cookie_alert_text`, `created_at`, `updated_at`) VALUES
(3, 20, 1, 'I Agree', 'We use cookies to give you the best online experience.\r\nBy continuing to browse the site you are agreeing to our use of cookies.', '2023-08-29 02:35:44', '2023-08-29 02:37:13');

-- --------------------------------------------------------

--
-- Table structure for table `counter_informations`
--

CREATE TABLE `counter_informations` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `counter_informations`
--

INSERT INTO `counter_informations` (`id`, `language_id`, `icon`, `amount`, `title`, `created_at`, `updated_at`) VALUES
(7, 20, 'fal fa-users', 100, 'There are many variations of Lorem Ipsum available, but the majority.', '2023-08-19 00:40:34', '2023-12-08 23:24:27'),
(8, 20, 'fal fa-handshake', 250, 'There are many variations of Lorem Ipsum available, but the majority.', '2023-08-19 00:41:05', '2023-12-08 23:24:19'),
(9, 20, 'fal fa-city', 30, 'There are many variations of Lorem Ipsum available, but the majority.', '2023-08-19 00:41:28', '2023-12-08 23:24:13'),
(10, 20, 'fal fa-hand-holding-usd', 14, 'There are many variations of Lorem Ipsum available, but the majority.', '2023-08-19 00:41:52', '2023-12-08 23:23:43'),
(15, 25, 'fal fa-hand-holding-usd', 14, 'هناك العديد من الأشكال المتوفرة لنص لوريم إيبسوم، لكن الأغلبية هي.', '2024-06-14 07:22:20', '2024-06-14 07:22:20'),
(16, 25, 'fal fa-city', 30, 'هناك العديد من الأشكال المتوفرة لنص لوريم إيبسوم، لكن الأغلبية هي.', '2024-06-14 07:22:57', '2024-06-14 07:22:57'),
(17, 25, 'fal fa-handshake', 250, 'هناك العديد من الأشكال المتوفرة لنص لوريم إيبسوم، لكن الأغلبية هي.', '2024-06-14 07:23:15', '2024-06-14 07:23:15'),
(18, 25, 'fal fa-users', 100, 'هناك العديد من الأشكال المتوفرة لنص لوريم إيبسوم، لكن الأغلبية هي.', '2024-06-14 07:23:31', '2024-06-14 07:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `counter_sections`
--

CREATE TABLE `counter_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `counter_sections`
--

INSERT INTO `counter_sections` (`id`, `language_id`, `title`, `subtitle`, `created_at`, `updated_at`) VALUES
(3, 20, 'Why Did You Choose Our Property Listing Services?', 'If you’re in the market for a new Property, you have probably done your fair share of research to Property services. You know what kind of Property you want, what features you need? We are here to help you at any time.', '2023-08-19 00:38:24', '2023-08-19 03:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `serial_number` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `language_id`, `question`, `answer`, `serial_number`, `created_at`, `updated_at`) VALUES
(16, 20, 'How do I list my property on your website?', 'To list your property, simply create an account on our website, provide accurate vehicle information, upload high-quality photos, and set an appropriate price.', 1, '2023-08-19 02:29:36', '2024-06-14 06:29:46'),
(17, 20, 'Can I list multiple properties under one account?', 'Yes, you can list multiple properties and projects using a single account. Just follow the same listing process for each property and project.', 2, '2023-08-19 02:29:51', '2024-06-14 06:32:40'),
(18, 20, 'Is there a fee for listing my property on your platform?', 'We offer both free and premium listing options. Basic listings are free, while premium options may include enhanced visibility and additional features for a fee.', 3, '2023-08-19 02:30:06', '2024-06-14 06:33:13'),
(19, 20, 'What type of information should I include in my property listing?', 'It\'s important to provide detailed information such as the amenities, features, facilities, price, and area in sqft. The more details you provide, the better your chances of attracting potential buyers.', 4, '2023-08-19 02:30:22', '2024-06-14 06:35:28'),
(20, 20, 'How long will my property listing be active?', 'The duration of your property listing depends on the type of listing you choose. Free listings usually have a standard duration, while premium listings may have extended visibility periods.', 5, '2023-08-19 02:30:37', '2024-06-14 06:36:44'),
(21, 20, 'Can I edit my listing after it\'s live?', 'Yes, you can edit your listing at any time. Log in to your account, access your listing, and make the necessary changes to the details, price, or images.', 6, '2023-08-19 02:30:55', '2023-08-19 02:30:55'),
(22, 20, 'How do I communicate with potential buyers?', 'Interested buyers can contact you through the contact information you provide in your listing. We recommend using our secure messaging system to maintain privacy and security during negotiations.', 7, '2023-08-19 02:31:11', '2023-08-19 02:31:11'),
(23, 20, 'What happens if my property sells or rents through another platform?', 'If your property sells or rents through another platform, it\'s important to promptly remove or mark your listing as sold on our website to avoid any confusion for potential buyers.', 8, '2023-08-19 02:31:29', '2024-06-14 06:39:40'),
(24, 20, 'Are there any tips for taking appealing Property photos?', 'Absolutely! Clear, well-lit photos taken from various angles can significantly enhance your listing. Include shots of the interior, exterior, engine, and any special features.', 9, '2023-08-19 02:31:45', '2023-08-19 02:31:45'),
(25, 20, 'What safety measures are in place to prevent fraud?', 'We take fraud prevention seriously. We use various security measures and recommend dealing locally, verifying buyer information, and being cautious of unusual payment requestss.', 10, '2023-08-19 02:32:01', '2024-06-08 11:45:42'),
(37, 25, 'كيف أقوم بإدراج الممتلكات الخاصة بي على موقع الويب الخاص بك؟', 'لإدراج الممتلكات الخاصة بك، ما عليك سوى إنشاء حساب على موقعنا الإلكتروني، وتقديم معلومات دقيقة عن السيارة، وتحميل صور عالية الجودة، وتحديد السعر المناسب.', 1, '2024-06-14 06:30:39', '2024-06-14 06:30:39'),
(38, 25, 'هل يمكنني إدراج عقارات متعددة تحت حساب واحد؟', 'نعم، يمكنك إدراج عقارات ومشاريع متعددة باستخدام حساب واحد. ما عليك سوى اتباع نفس عملية الإدراج لكل عقار ومشروع.', 2, '2024-06-14 06:32:14', '2024-06-14 06:32:14'),
(39, 25, 'هل هناك رسوم لإدراج عقاري على منصتكم؟', 'نحن نقدم خيارات الإدراج المجانية والمميزة. القوائم الأساسية مجانية، بينما قد تتضمن الخيارات المميزة رؤية محسنة وميزات إضافية مقابل رسوم.', 3, '2024-06-14 06:33:28', '2024-06-14 06:33:28'),
(40, 25, 'ما نوع المعلومات التي يجب أن أدرجها في قائمة الممتلكات الخاصة بي؟', 'من المهم تقديم معلومات مفصلة مثل وسائل الراحة والميزات والمرافق والسعر والمساحة بالقدم المربع. كلما زادت التفاصيل التي تقدمها، زادت فرصك في جذب المشترين المحتملين.', 4, '2024-06-14 06:35:49', '2024-06-14 06:35:49'),
(41, 25, 'إلى متى ستكون قائمة الممتلكات الخاصة بي نشطة؟', 'تعتمد مدة قائمة الممتلكات الخاصة بك على نوع القائمة التي تختارها. عادةً ما تكون للبيانات المجانية مدة قياسية، في حين أن القوائم المميزة قد تكون لها فترات ظهور ممتدة.', 5, '2024-06-14 06:37:04', '2024-06-14 06:37:04'),
(42, 25, 'هل يمكنني تعديل قائمتي بعد نشرها؟', 'نعم، يمكنك تعديل قائمتك في أي وقت. قم بتسجيل الدخول إلى حسابك، والوصول إلى قائمتك، وإجراء التغييرات اللازمة على التفاصيل أو السعر أو الصور.', 6, '2024-06-14 06:37:57', '2024-06-14 06:37:57'),
(43, 25, 'كيف أتواصل مع المشترين المحتملين؟', 'يمكن للمشترين المهتمين الاتصال بك من خلال معلومات الاتصال التي تقدمها في قائمتك. نوصي باستخدام نظام المراسلة الآمن الخاص بنا للحفاظ على الخصوصية والأمان أثناء المفاوضات.', 7, '2024-06-14 06:38:48', '2024-06-14 06:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `featured_pricings`
--

CREATE TABLE `featured_pricings` (
  `id` bigint UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `number_of_days` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `featured_pricings`
--

INSERT INTO `featured_pricings` (`id`, `price`, `number_of_days`, `status`, `created_at`, `updated_at`) VALUES
(4, 50.00, 10, 1, '2024-03-25 02:21:14', '2024-06-11 05:48:33'),
(5, 80.00, 20, 1, '2024-06-11 05:48:02', '2024-06-11 05:48:02'),
(6, 100.00, 25, 1, '2024-06-11 05:48:16', '2024-06-11 05:48:16'),
(7, 120.00, 30, 1, '2024-06-11 05:48:50', '2024-06-11 05:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `featured_properties`
--

CREATE TABLE `featured_properties` (
  `id` bigint UNSIGNED NOT NULL,
  `featured_pricing_id` bigint UNSIGNED NOT NULL,
  `property_id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_details` text COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_days` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 = pending, 1 = approved, 2= rejected',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `featured_properties`
--

INSERT INTO `featured_properties` (`id`, `featured_pricing_id`, `property_id`, `vendor_id`, `transaction_id`, `transaction_details`, `payment_method`, `gateway_type`, `payment_status`, `attachment`, `number_of_days`, `amount`, `status`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(115, 4, 73, 0, 'a8904417', 'from admin', 'from admin', 'paypal', 'complete', NULL, 565, 50.00, 1, '2024-06-11 11:49:38', '2025-12-28 11:49:38', '2024-06-11 05:49:38', '2025-11-01 08:50:37'),
(116, 6, 74, 0, '7366c1a4', 'from admin', 'from admin', 'instamojo', 'complete', NULL, 420, 100.00, 1, '2024-06-11 11:49:52', '2025-08-05 11:49:52', '2024-06-11 05:49:52', '2024-06-11 05:49:52'),
(117, 6, 78, 0, 'aa36bc85', 'from admin', 'from admin', 'Citibank', 'complete', NULL, 500, 100.00, 1, '2024-06-11 11:55:31', '2025-08-24 11:55:31', '2024-06-11 05:55:31', '2024-06-11 05:55:31'),
(118, 6, 76, 0, '233951a4', 'from admin', 'from admin', 'instamojo', 'complete', NULL, 650, 100.00, 1, '2024-06-11 11:56:05', '2026-03-23 11:56:05', '2024-06-11 05:56:05', '2024-06-11 05:56:05'),
(119, 7, 68, 0, 'f5ec1abf', 'from admin', 'from admin', 'Bank of America', 'complete', NULL, 485, 120.00, 1, '2024-06-11 11:56:14', '2025-10-09 11:56:14', '2024-06-11 05:56:14', '2024-06-11 05:56:14'),
(120, 5, 74, 36, '57514d99', 'from admin', 'from admin', 'midtrans', 'complete', NULL, 20, 80.00, 1, '2025-11-01 14:47:33', '2025-11-21 14:47:33', '2025-11-01 08:47:33', '2025-11-01 08:47:33'),
(121, 7, 80, 0, '5592b6a5', 'from admin', 'from admin', 'midtrans', 'complete', NULL, 30, 120.00, 1, '2025-11-01 19:04:23', '2025-12-01 19:04:23', '2025-11-01 13:04:23', '2025-11-01 13:04:23'),
(122, 7, 79, 36, '0237c9a2', 'from admin', 'from admin', 'iyzico', 'complete', NULL, 30, 120.00, 1, '2025-11-01 19:05:12', '2025-12-01 19:05:12', '2025-11-01 13:05:12', '2025-11-01 13:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `feature_sections`
--

CREATE TABLE `feature_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feature_sections`
--

INSERT INTO `feature_sections` (`id`, `language_id`, `title`, `created_at`, `updated_at`) VALUES
(3, 20, 'Featured Properties', '2023-08-19 03:00:57', '2024-06-12 12:07:30'),
(5, 25, 'خصائص مميزة', '2024-06-14 07:35:34', '2024-06-14 07:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `footer_contents`
--

CREATE TABLE `footer_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `about_company` text COLLATE utf8mb3_unicode_ci,
  `copyright_text` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `footer_contents`
--

INSERT INTO `footer_contents` (`id`, `language_id`, `about_company`, `copyright_text`, `created_at`, `updated_at`) VALUES
(5, 20, 'Estaty is a dynamic and forward-thinking real estate company dedicated to providing exceptional real estate services across residential, commercial, and investment properties.', '<p>Copyright ©2023. All Rights Reserved.</p>', '2023-08-19 23:40:53', '2024-06-12 08:57:08'),
(7, 25, 'في Estaty نقدم مجموعة واسعة من السيارات المستعملة عالية الجودة لتلبية احتياجات القيادة الخاصة بك وميزانيتك. مع سنوات من الخبرة في صناعة السيارات.', '<p>حقوق الطبع والنشر ©٢٠٢٣. كل الحقوق محفوظة.</p>', '2024-03-26 23:12:42', '2024-03-26 23:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` bigint UNSIGNED NOT NULL,
  `endpoint` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hero_statics`
--

CREATE TABLE `hero_statics` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hero_statics`
--

INSERT INTO `hero_statics` (`id`, `language_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(1, 20, 'We’re Best Real Estate Agency', 'We are a leargest real estate agency for buying and selling your property with 100% confidently.', '2023-12-09 03:31:58', '2023-12-09 03:31:58'),
(2, 21, 'asdf', 'asdf', '2023-12-09 03:32:34', '2023-12-09 03:32:34'),
(3, 25, 'نحن أفضل وكالة عقارية', 'نحن أكبر وكالة عقارية لبيع وشراء الممتلكات الخاصة بك بثقة 100٪.', '2024-03-27 00:09:42', '2024-03-27 00:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` char(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `direction` tinyint NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `direction`, `is_default`, `created_at`, `updated_at`) VALUES
(20, 'English', 'en', 0, 1, '2023-08-17 03:19:12', '2023-08-17 03:19:17'),
(25, 'عربي', 'ar', 1, 0, '2024-03-26 02:23:59', '2024-03-26 02:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `charge` decimal(8,2) UNSIGNED DEFAULT '0.00',
  `serial_number` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `language_id`, `vendor_id`, `name`, `charge`, `serial_number`, `created_at`, `updated_at`) VALUES
(8, 8, NULL, 'Washington, California', 100.00, 1, '2022-01-31 03:06:15', '2022-01-31 03:06:15'),
(9, 8, NULL, 'Washington, D.C.', 150.00, 2, '2022-01-31 03:06:56', '2022-01-31 03:06:56'),
(10, 8, NULL, 'Georgetown, California', 200.00, 3, '2022-01-31 03:07:46', '2022-01-31 03:07:46'),
(11, 9, NULL, 'واشنطن ، كاليفورنيا', 100.00, 1, '2022-03-06 00:48:03', '2022-03-06 00:48:03'),
(12, 9, NULL, 'واشنطن العاصمة.', 150.00, 2, '2022-03-06 00:48:41', '2022-03-06 00:48:41'),
(13, 9, NULL, 'جورج تاون ، كاليفورنيا', 200.00, 3, '2022-03-06 00:49:02', '2022-03-06 00:49:25'),
(19, 8, 7, 'Shah Amanat International Airport', 11.00, 1, '2022-10-19 04:15:19', '2022-10-19 04:15:19'),
(21, 8, 7, 'Perfect Money', 0.00, 1, '2022-10-30 00:33:19', '2022-10-30 00:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` int NOT NULL,
  `mail_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `mail_subject` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `mail_body` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `mail_type`, `mail_subject`, `mail_body`) VALUES
(1, 'verify_email', 'Verify Your Email Address', 0x3c703e44656172203c7374726f6e673e7b757365726e616d657d3c2f7374726f6e673e2c3c2f703e0d0a3c703e5765206a757374206e65656420746f2076657269667920796f757220656d61696c2061646472657373206265666f726520796f752063616e2061636365737320746f20796f75722064617368626f6172642e3c2f703e0d0a3c703e56657269667920796f757220656d61696c20616464726573732c207b766572696669636174696f6e5f6c696e6b7d2e3c2f703e0d0a3c703e5468616e6b20796f752e3c62723e7b776562736974655f7469746c657d3c2f703e),
(2, 'reset_password', 'Recover Password of Your Account', 0x3c703e4869207b637573746f6d65725f6e616d657d2c3c2f703e3c703e576520686176652072656365697665642061207265717565737420746f20726573657420796f75722070617373776f72642e20496620796f7520646964206e6f74206d616b652074686520726571756573742c2069676e6f7265207468697320656d61696c2e204f74686572776973652c20796f752063616e20726573657420796f75722070617373776f7264207573696e67207468652062656c6f77206c696e6b2e3c2f703e3c703e7b70617373776f72645f72657365745f6c696e6b7d3c2f703e3c703e5468616e6b732c3c6272202f3e7b776562736974655f7469746c657d3c2f703e),
(5, 'package_purchase', 'You have purchased a package successfully', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e54686973206973206120636f6e6669726d6174696f6e206d61696c2066726f6d2075733c2f703e0d0a3c703e3c7374726f6e673e3c7370616e207374796c653d22666f6e742d73697a653a313870783b223e4d656d6265727368697020496e666f726d6174696f6e3a3c2f7370616e3e3c2f7374726f6e673e3c6272202f3e3c7374726f6e673e5061636b616765205469746c653a3c2f7374726f6e673e207b7061636b6167655f7469746c657d3c6272202f3e3c7374726f6e673e5061636b6167652050726963653a3c2f7374726f6e673e207b7061636b6167655f70726963657d3c2f703e0d0a3c703e3c7374726f6e673e446973636f756e743a3c2f7374726f6e673e207b646973636f756e747d3c2f703e0d0a3c703e3c7370616e207374796c653d22666f6e742d7765696768743a3630303b223e546f74616c3a3c2f7370616e3ec2a07b746f74616c7d3c6272202f3e3c7374726f6e673e41637469766174696f6e20446174653a3c2f7374726f6e673e207b61637469766174696f6e5f646174657d3c6272202f3e3c7374726f6e673e45787069726520446174653a3c2f7374726f6e673e207b6578706972655f646174657d3c2f703e0d0a3c703ec2a03c2f703e0d0a3c703e5765206861766520617474616368656420616e20696e766f69636520776974682074686973206d61696c2e3c6272202f3e5468616e6b20796f7520666f7220796f75722070757263686173652e3c2f703e0d0a3c703e3c6272202f3e4265737420526567617264732c3c6272202f3e7b776562736974655f7469746c657d2e3c2f703e),
(8, 'membership_expiry_reminder', 'Your membership will be expired soon', 0x4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e0d0a0d0a596f7572206d656d626572736869702077696c6c206265206578706972656420736f6f6e2e3c6272202f3e0d0a596f7572206d656d626572736869702069732076616c69642074696c6c203c7374726f6e673e7b6c6173745f6461795f6f665f6d656d626572736869707d3c2f7374726f6e673e3c6272202f3e0d0a506c6561736520636c69636b2068657265202d207b6c6f67696e5f6c696e6b7d20746f206c6f6720696e746f207468652064617368626f61726420746f2070757263686173652061206e6577207061636b616765202f20657874656e64207468652063757272656e74207061636b61676520746f20657874656e6420796f7572206d656d626572736869702e3c6272202f3e3c6272202f3e0d0a0d0a4265737420526567617264732c3c6272202f3e0d0a7b776562736974655f7469746c657d2e),
(9, 'membership_expired', 'Your membership is expired', 0x4869207b757365726e616d657d2c3c62723e3c62723e0d0a0d0a596f7572206d656d6265727368697020697320657870697265642e3c62723e0d0a506c6561736520636c69636b2068657265202d207b6c6f67696e5f6c696e6b7d20746f206c6f6720696e746f207468652064617368626f61726420746f2070757263686173652061206e6577207061636b616765202f20657874656e64207468652063757272656e74207061636b61676520746f20636f6e74696e756520746865206d656d626572736869702e3c62723e3c62723e0d0a0d0a4265737420526567617264732c3c62723e0d0a7b776562736974655f7469746c657d2e),
(10, 'package_purchase_membership_accepted', 'Your payment for purchase a package is accepted', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e54686973206973206120636f6e6669726d6174696f6e206d61696c2066726f6d2075732e3c6272202f3e596f7572207061796d656e7420686173206265656e2061636365707465642e3c6272202f3e3c7374726f6e673e5061636b616765205469746c653a3c2f7374726f6e673e207b7061636b6167655f7469746c657d3c6272202f3e3c7374726f6e673e5061636b6167652050726963653a3c2f7374726f6e673e207b7061636b6167655f70726963657d3c6272202f3e3c7374726f6e673e41637469766174696f6e20446174653a3c2f7374726f6e673e207b61637469766174696f6e5f646174657d3c6272202f3e3c7374726f6e673e45787069726520446174653a3c2f7374726f6e673e207b6578706972655f646174657d3c2f703e0d0a3c703e4265737420526567617264732c3c6272202f3e7b776562736974655f7469746c657d2e3c2f703e),
(12, 'package_purchase_membership_rejected', 'Your payment for purchase a package is rejected', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e57652061726520736f72727920746f20696e666f726d20796f75207468617420796f7572207061796d656e7420686173206265656e2072656a65637465643c6272202f3e3c7374726f6e673e5061636b616765205469746c653a3c2f7374726f6e673e207b7061636b6167655f7469746c657d3c6272202f3e3c7374726f6e673e5061636b6167652050726963653a3c2f7374726f6e673e207b7061636b6167655f70726963657d3c6272202f3e4265737420526567617264732c3c6272202f3e7b776562736974655f7469746c657d2e3c2f703e),
(14, 'admin_changed_current_package', 'Admin has changed your current package', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e0d0a0d0a41646d696e20686173206368616e67656420796f75722063757272656e74207061636b616765203c623e287b7265706c616365645f7061636b6167657d293c2f623e3c2f703e0d0a3c703e3c623e4e6577205061636b61676520496e666f726d6174696f6e3a3c2f623e3c2f703e0d0a3c703e0d0a3c7374726f6e673e5061636b6167653a3c2f7374726f6e673e207b7061636b6167655f7469746c657d3c6272202f3e0d0a3c7374726f6e673e5061636b6167652050726963653a3c2f7374726f6e673e207b7061636b6167655f70726963657d3c6272202f3e0d0a3c7374726f6e673e41637469766174696f6e20446174653a3c2f7374726f6e673e207b61637469766174696f6e5f646174657d3c6272202f3e0d0a3c7374726f6e673e45787069726520446174653a3c2f7374726f6e673e207b6578706972655f646174657d3c2f703e3c703e3c6272202f3e3c2f703e3c703e5765206861766520617474616368656420616e20696e766f69636520776974682074686973206d61696c2e3c6272202f3e0d0a5468616e6b20796f7520666f7220796f75722070757263686173652e3c2f703e3c703e3c6272202f3e0d0a0d0a4265737420526567617264732c3c6272202f3e0d0a7b776562736974655f7469746c657d2e3c6272202f3e3c2f703e),
(15, 'admin_added_current_package', 'Admin has added current package for you', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e0d0a0d0a41646d696e206861732061646465642063757272656e74207061636b61676520666f7220796f753c2f703e3c703e3c623e3c7370616e207374796c653d22666f6e742d73697a653a313870783b223e43757272656e74204d656d6265727368697020496e666f726d6174696f6e3a3c2f7370616e3e3c2f623e3c6272202f3e0d0a3c7374726f6e673e5061636b616765205469746c653a3c2f7374726f6e673e207b7061636b6167655f7469746c657d3c6272202f3e0d0a3c7374726f6e673e5061636b6167652050726963653a3c2f7374726f6e673e207b7061636b6167655f70726963657d3c6272202f3e0d0a3c7374726f6e673e41637469766174696f6e20446174653a3c2f7374726f6e673e207b61637469766174696f6e5f646174657d3c6272202f3e0d0a3c7374726f6e673e45787069726520446174653a3c2f7374726f6e673e207b6578706972655f646174657d3c2f703e3c703e3c6272202f3e3c2f703e3c703e5765206861766520617474616368656420616e20696e766f69636520776974682074686973206d61696c2e3c6272202f3e0d0a5468616e6b20796f7520666f7220796f75722070757263686173652e3c2f703e3c703e3c6272202f3e0d0a0d0a4265737420526567617264732c3c6272202f3e0d0a7b776562736974655f7469746c657d2e3c6272202f3e3c2f703e),
(16, 'admin_changed_next_package', 'Admin has changed your next package', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e0d0a0d0a41646d696e20686173206368616e67656420796f7572206e657874207061636b616765203c623e287b7265706c616365645f7061636b6167657d293c2f623e3c2f703e3c703e3c623e3c7370616e207374796c653d22666f6e742d73697a653a313870783b223e4e657874204d656d6265727368697020496e666f726d6174696f6e3a3c2f7370616e3e3c2f623e3c6272202f3e0d0a3c7374726f6e673e5061636b616765205469746c653a3c2f7374726f6e673e207b7061636b6167655f7469746c657d3c6272202f3e0d0a3c7374726f6e673e5061636b6167652050726963653a3c2f7374726f6e673e207b7061636b6167655f70726963657d3c6272202f3e0d0a3c7374726f6e673e41637469766174696f6e20446174653a3c2f7374726f6e673e207b61637469766174696f6e5f646174657d3c6272202f3e0d0a3c7374726f6e673e45787069726520446174653a3c2f7374726f6e673e207b6578706972655f646174657d3c2f703e3c703e3c6272202f3e3c2f703e3c703e5765206861766520617474616368656420616e20696e766f69636520776974682074686973206d61696c2e3c6272202f3e0d0a5468616e6b20796f7520666f7220796f75722070757263686173652e3c2f703e3c703e3c6272202f3e0d0a0d0a4265737420526567617264732c3c6272202f3e0d0a7b776562736974655f7469746c657d2e3c6272202f3e3c2f703e),
(17, 'admin_added_next_package', 'Admin has added next package for you', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e0d0a0d0a41646d696e20686173206164646564206e657874207061636b61676520666f7220796f753c2f703e3c703e3c623e3c7370616e207374796c653d22666f6e742d73697a653a313870783b223e4e657874204d656d6265727368697020496e666f726d6174696f6e3a3c2f7370616e3e3c2f623e3c6272202f3e0d0a3c7374726f6e673e5061636b616765205469746c653a3c2f7374726f6e673e207b7061636b6167655f7469746c657d3c6272202f3e0d0a3c7374726f6e673e5061636b6167652050726963653a3c2f7374726f6e673e207b7061636b6167655f70726963657d3c6272202f3e0d0a3c7374726f6e673e41637469766174696f6e20446174653a3c2f7374726f6e673e207b61637469766174696f6e5f646174657d3c6272202f3e0d0a3c7374726f6e673e45787069726520446174653a3c2f7374726f6e673e207b6578706972655f646174657d3c2f703e3c703e3c6272202f3e3c2f703e3c703e5765206861766520617474616368656420616e20696e766f69636520776974682074686973206d61696c2e3c6272202f3e0d0a5468616e6b20796f7520666f7220796f75722070757263686173652e3c2f703e3c703e3c6272202f3e0d0a0d0a4265737420526567617264732c3c6272202f3e0d0a7b776562736974655f7469746c657d2e3c6272202f3e3c2f703e),
(18, 'admin_removed_current_package', 'Admin has removed current package for you', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e0d0a0d0a41646d696e206861732072656d6f7665642063757272656e74207061636b616765202d203c7374726f6e673e7b72656d6f7665645f7061636b6167655f7469746c657d3c2f7374726f6e673e3c62723e0d0a0d0a4265737420526567617264732c3c6272202f3e0d0a7b776562736974655f7469746c657d2e3c6272202f3e),
(19, 'admin_removed_next_package', 'Admin has removed next package for you', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e0d0a0d0a41646d696e206861732072656d6f766564206e657874207061636b616765202d203c7374726f6e673e7b72656d6f7665645f7061636b6167655f7469746c657d3c2f7374726f6e673e3c62723e0d0a0d0a4265737420526567617264732c3c6272202f3e0d0a7b776562736974655f7469746c657d2e3c6272202f3e),
(26, 'featured_property', 'Your Property is now featured', 0x3c64697620636c6173733d22223e0d0a3c64697620636c6173733d226969206774223e0d0a3c64697620636c6173733d226133732061694c223e0d0a3c703ec2a03c2f703e0d0a3c646976207374796c653d226d617267696e3a20303b20626f782d73697a696e673a20626f726465722d626f783b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b206d696e2d77696474683a20313030253b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b2077696474683a203130302521696d706f7274616e743b223e0d0a3c7461626c65207374796c653d226d617267696e3a20303b206261636b67726f756e643a20236633663566383b20626f726465722d636f6c6c617073653a20636f6c6c617073653b20626f726465722d73706163696e673a20303b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206865696768743a20313030253b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b2077696474683a20313030253b223e0d0a3c74626f64793e0d0a3c7472207374796c653d2270616464696e673a303b746578742d616c69676e3a6c6566743b223e0d0a3c7464207374796c653d226d617267696e3a20303b20626f726465722d636f6c6c617073653a20636f6c6c6170736521696d706f7274616e743b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b20776f72642d777261703a20627265616b2d776f72643b223e0d0a3c646976207374796c653d2270616464696e672d6c6566743a203136707821696d706f7274616e743b2070616464696e672d72696768743a203136707821696d706f7274616e743b223e3c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a0c2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a00d0a3c7461626c65207374796c653d226d617267696e3a2030206175746f3b206261636b67726f756e643a20236635663566663b20626f726465723a2031707820736f6c696420236434646365323b20626f726465722d636f6c6c617073653a20636f6c6c617073653b20626f726465722d73706163696e673a20303b206d696e2d77696474683a2035303070783b2070616464696e673a20303b20746578742d616c69676e3a20696e68657269743b20766572746963616c2d616c69676e3a20746f703b2077696474683a2035383070783b223e0d0a3c74626f64793e0d0a3c7472207374796c653d2270616464696e673a303b746578742d616c69676e3a6c6566743b223e0d0a3c7464207374796c653d226d617267696e3a20303b20626f726465722d636f6c6c617073653a20636f6c6c6170736521696d706f7274616e743b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b20776f72642d777261703a20627265616b2d776f72643b223e3c6272202f3e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e44656172207b757365726e616d657d2c3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e596f75206861766520726571756573746564207468652061646d696e20746f2073686f7720796f75722070726f706572747920696e207468652066656174757265642073656374696f6e2e2041646d696e2068617320617070726f76656420796f757220726571756573742e20596f75722070726f7065727479206973206e6f7720666561747572656420666f7220746865206e657874207b6e756d6265725f6f665f646179737d20646179732e3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223ec2a03c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e50726f7065727479204c696e6b3a207b70726f70657274795f6c696e6b7d3c6272202f3e416d6f756e74203a207b66656174757265645f70726963657d3c6272202f3e537461727420446174653a207b73746172745f646174657d3c6272202f3e456e6420446174653a207b656e645f646174657d3c6272202f3e3c6272202f3e3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223ec2a03c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e4265737420526567617264732e3c6272202f3e7b776562736974655f7469746c657d3c2f703e0d0ac2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a020c2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a03c2f74643e0d0a3c2f74723e0d0a3c2f74626f64793e0d0a3c2f7461626c653e0d0ac2a03c2f6469763e0d0ac2a020c2a020c2a020c2a03c2f74643e0d0a3c2f74723e0d0a3c2f74626f64793e0d0a3c2f7461626c653e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c703ec2a03c2f703e),
(27, 'payment_accepted_for_featured_property_offline_gateway', 'Your payment for featured property is accepted', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e54686973206973206120636f6e6669726d6174696f6e206d61696c2066726f6d2075732e3c6272202f3e596f7572207061796d656e7420686173206265656e2061636365707465642026616d703b207768656e20796f75722070726f70657274792069732066656174757265642c2077652077696c6c206e6f7469667920796f752e3c2f703e0d0a3c703e3c6272202f3e3c7374726f6e673e50726f7065727479205469746c653a3c2f7374726f6e673e207b70726f70657274795f7469746c657d3c6272202f3e3c7374726f6e673e46656174757265642050726963653a3c2f7374726f6e673e207b66656174757265645f70726963657d3c6272202f3e3c7374726f6e673e4e756d626572204f6620466561747572656420446179733a3c2f7374726f6e673e207b6e756d6265725f6f665f646179737d3c2f703e0d0a3c703e3c7374726f6e673e5061796d656e74204d6574686f643a3c2f7374726f6e673e207b7061796d656e745f6d6574686f647d3c2f703e0d0a3c703e4265737420526567617264732c3c6272202f3e7b776562736974655f7469746c657d2e3c2f703e),
(28, 'payment_rejected_for_feature_property_offline_gateway', 'Your payment for featured property is rejected', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e57652061726520736f72727920746f20696e666f726d20796f75207468617420796f7572207061796d656e7420686173206265656e2072656a65637465642e3c2f703e0d0a3c703e3c7374726f6e673e50726f7065727479205469746c653a3c2f7374726f6e673e207b70726f70657274795f7469746c657d3c6272202f3e3c7374726f6e673e46656174757265642050726963653a3c2f7374726f6e673e207b66656174757265645f70726963657d3c2f703e0d0a3c703e3c7374726f6e673e4e756d626572204f6620466561747572656420446179733a3c2f7374726f6e673e207b6e756d6265725f6f665f646179737d3c2f703e0d0a3c703e3c7374726f6e673e5061796d656e74204d6574686f643a3c2f7374726f6e673e207b7061796d656e745f6d6574686f647d3c2f703e0d0a3c703ec2a03c2f703e0d0a3c703e3c6272202f3e4265737420526567617264732c3c6272202f3e7b776562736974655f7469746c657d2e3c2f703e),
(29, 'registered_agent', 'An agent account is registered', 0x3c703e4869207b757365726e616d657d2c3c6272202f3e3c6272202f3e54686973206973206120636f6e6669726d6174696f6e206d61696c2066726f6d2075732e3c6272202f3e5375636365737366756c6c79206372656174656420616e206167656e74206163636f756e7420666f7220796f753c6272202f3e706c6561736520766973697420746865207765627369746520616e64206c6f6720696e20746f20796f7572206163636f756e742e3c2f703e0d0a3c703e3c7374726f6e673e4c6f67696e2055726c3a203c2f7374726f6e673e7b6c6f67696e5f75726c7d3c6272202f3e3c7374726f6e673e557365726e616d653a3c2f7374726f6e673e207b757365726e616d657d3c6272202f3e3c7374726f6e673e50617373776f72643a3c2f7374726f6e673e207b70617373776f72647d3c6272202f3e3c6272202f3e3c2f703e0d0a3c703e4265737420526567617264732c3c6272202f3e7b776562736974655f7469746c657d2e3c2f703e),
(30, 'property_featured_request_rejected', 'Your Property featured request has been rejected', 0x3c64697620636c6173733d22223e0d0a3c64697620636c6173733d226969206774223e0d0a3c64697620636c6173733d226133732061694c223e0d0a3c703ec2a03c2f703e0d0a3c646976207374796c653d226d617267696e3a20303b20626f782d73697a696e673a20626f726465722d626f783b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b206d696e2d77696474683a20313030253b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b2077696474683a203130302521696d706f7274616e743b223e0d0a3c7461626c65207374796c653d226d617267696e3a20303b206261636b67726f756e643a20236633663566383b20626f726465722d636f6c6c617073653a20636f6c6c617073653b20626f726465722d73706163696e673a20303b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206865696768743a20313030253b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b2077696474683a20313030253b223e0d0a3c74626f64793e0d0a3c7472207374796c653d2270616464696e673a303b746578742d616c69676e3a6c6566743b223e0d0a3c7464207374796c653d226d617267696e3a20303b20626f726465722d636f6c6c617073653a20636f6c6c6170736521696d706f7274616e743b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b20776f72642d777261703a20627265616b2d776f72643b223e0d0a3c646976207374796c653d2270616464696e672d6c6566743a203136707821696d706f7274616e743b2070616464696e672d72696768743a203136707821696d706f7274616e743b223e3c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a0c2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a00d0a3c7461626c65207374796c653d226d617267696e3a2030206175746f3b206261636b67726f756e643a20236635663566663b20626f726465723a2031707820736f6c696420236434646365323b20626f726465722d636f6c6c617073653a20636f6c6c617073653b20626f726465722d73706163696e673a20303b206d696e2d77696474683a2035303070783b2070616464696e673a20303b20746578742d616c69676e3a20696e68657269743b20766572746963616c2d616c69676e3a20746f703b2077696474683a2035383070783b223e0d0a3c74626f64793e0d0a3c7472207374796c653d2270616464696e673a303b746578742d616c69676e3a6c6566743b223e0d0a3c7464207374796c653d226d617267696e3a20303b20626f726465722d636f6c6c617073653a20636f6c6c6170736521696d706f7274616e743b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b20776f72642d777261703a20627265616b2d776f72643b223e3c6272202f3e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e44656172207b757365726e616d657d2c3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e596f75206861766520726571756573746564207468652061646d696e20746f2073686f7720796f75722070726f706572747920696e207468652066656174757265642073656374696f6e2e2041646d696e206861732072656a656374656420796f757220726571756573742e3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223ec2a03c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e50726f7065727479204c696e6b3a207b70726f70657274795f6c696e6b7d3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223ec2a03c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e4265737420526567617264732e3c6272202f3e7b776562736974655f7469746c657d3c2f703e0d0ac2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a020c2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a03c2f74643e0d0a3c2f74723e0d0a3c2f74626f64793e0d0a3c2f7461626c653e0d0ac2a03c2f6469763e0d0ac2a020c2a020c2a020c2a03c2f74643e0d0a3c2f74723e0d0a3c2f74626f64793e0d0a3c2f7461626c653e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c703ec2a03c2f703e);

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` bigint UNSIGNED NOT NULL,
  `price` double DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `is_trial` tinyint NOT NULL DEFAULT '0',
  `trial_days` int NOT NULL DEFAULT '0',
  `receipt` longtext COLLATE utf8mb3_unicode_ci,
  `transaction_details` longtext COLLATE utf8mb3_unicode_ci,
  `settings` longtext COLLATE utf8mb3_unicode_ci,
  `package_id` bigint DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `modified` tinyint DEFAULT NULL COMMENT '1 - modified by Admin, 0 - not modified by Admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `conversation_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nowpayment_invoice_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nowpayment_request_data` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `price`, `currency`, `currency_symbol`, `payment_method`, `transaction_id`, `status`, `is_trial`, `trial_days`, `receipt`, `transaction_details`, `settings`, `package_id`, `vendor_id`, `start_date`, `expire_date`, `modified`, `created_at`, `updated_at`, `conversation_id`, `nowpayment_invoice_id`, `nowpayment_request_data`) VALUES
(27, 399.99, 'USD', '$', 'PayPal', 'cba679ff', 1, 0, 0, NULL, '{\n    \"id\": \"PAYID-MZUSMZI6CX16053R12502630\",\n    \"intent\": \"sale\",\n    \"state\": \"approved\",\n    \"cart\": \"1PS17182931761911\",\n    \"payer\": {\n        \"payment_method\": \"paypal\",\n        \"status\": \"VERIFIED\",\n        \"payer_info\": {\n            \"email\": \"megasoft.envato@example.com\",\n            \"first_name\": \"Samiul Alim\",\n            \"last_name\": \"Pratik\",\n            \"payer_id\": \"8C5NYJ7EZ7QSS\",\n            \"shipping_address\": {\n                \"recipient_name\": \"Samiul Alim Pratik\",\n                \"line1\": \"1 Main St\",\n                \"city\": \"San Jose\",\n                \"state\": \"CA\",\n                \"postal_code\": \"95131\",\n                \"country_code\": \"US\"\n            },\n            \"country_code\": \"US\"\n        }\n    },\n    \"transactions\": [\n        {\n            \"amount\": {\n                \"total\": \"399.99\",\n                \"currency\": \"USD\",\n                \"details\": {\n                    \"subtotal\": \"399.99\",\n                    \"shipping\": \"0.00\",\n                    \"insurance\": \"0.00\",\n                    \"handling_fee\": \"0.00\",\n                    \"shipping_discount\": \"0.00\",\n                    \"discount\": \"0.00\"\n                }\n            },\n            \"payee\": {\n                \"merchant_id\": \"BKNWZYE3MAUNU\",\n                \"email\": \"megasoft.envato-facilitator@example.com\"\n            },\n            \"description\": \"You are purchasing a package Via Paypal\",\n            \"item_list\": {\n                \"items\": [\n                    {\n                        \"name\": \"You are purchasing a package\",\n                        \"price\": \"399.99\",\n                        \"currency\": \"USD\",\n                        \"tax\": \"0.00\",\n                        \"quantity\": 1,\n                        \"image_url\": \"\"\n                    }\n                ],\n                \"shipping_address\": {\n                    \"recipient_name\": \"Samiul Alim Pratik\",\n                    \"line1\": \"1 Main St\",\n                    \"city\": \"San Jose\",\n                    \"state\": \"CA\",\n                    \"postal_code\": \"95131\",\n                    \"country_code\": \"US\"\n                }\n            },\n            \"related_resources\": [\n                {\n                    \"sale\": {\n                        \"id\": \"2W098769V69880940\",\n                        \"state\": \"completed\",\n                        \"amount\": {\n                            \"total\": \"399.99\",\n                            \"currency\": \"USD\",\n                            \"details\": {\n                                \"subtotal\": \"399.99\",\n                                \"shipping\": \"0.00\",\n                                \"insurance\": \"0.00\",\n                                \"handling_fee\": \"0.00\",\n                                \"shipping_discount\": \"0.00\",\n                                \"discount\": \"0.00\"\n                            }\n                        },\n                        \"payment_mode\": \"INSTANT_TRANSFER\",\n                        \"protection_eligibility\": \"ELIGIBLE\",\n                        \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\n                        \"transaction_fee\": {\n                            \"value\": \"14.45\",\n                            \"currency\": \"USD\"\n                        },\n                        \"parent_payment\": \"PAYID-MZUSMZI6CX16053R12502630\",\n                        \"create_time\": \"2024-06-12T04:39:23Z\",\n                        \"update_time\": \"2024-06-12T04:39:23Z\",\n                        \"links\": [\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/2W098769V69880940\",\n                                \"rel\": \"self\",\n                                \"method\": \"GET\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/2W098769V69880940/refund\",\n                                \"rel\": \"refund\",\n                                \"method\": \"POST\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MZUSMZI6CX16053R12502630\",\n                                \"rel\": \"parent_payment\",\n                                \"method\": \"GET\"\n                            }\n                        ]\n                    }\n                }\n            ]\n        }\n    ],\n    \"redirect_urls\": {\n        \"return_url\": \"http://realstate.test/vendor/membership/paypal/success?paymentId=PAYID-MZUSMZI6CX16053R12502630\",\n        \"cancel_url\": \"http://realstate.test/vendor/membership/paypal/cancel\"\n    },\n    \"create_time\": \"2024-06-12T04:39:00Z\",\n    \"update_time\": \"2024-06-12T04:39:23Z\",\n    \"links\": [\n        {\n            \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MZUSMZI6CX16053R12502630\",\n            \"rel\": \"self\",\n            \"method\": \"GET\"\n        }\n    ],\n    \"failed_transactions\": []\n}', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Real Estate\",\"email_address\":\"realestate@example.com\",\"contact_number\":\"+8801865879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":2,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"ranaahmed269205@example.com\",\"smtp_password\":\"uvan rtvs rzmk zqnp\",\"from_mail\":\"ranaahmed269205@example.com\",\"from_name\":\"Binary Brain\",\"to_mail\":\"estay@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666170d789a3c.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=ITUG13kdkQI\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 24, 35, '2024-06-12', '9999-12-31', NULL, '2024-06-12 04:39:24', '2024-06-12 04:39:24', NULL, NULL, NULL),
(28, 399.99, 'USD', '$', 'PayPal', 'f359072f', 1, 0, 0, NULL, '{\n    \"id\": \"PAYID-MZUSW2Q8H470962M79893516\",\n    \"intent\": \"sale\",\n    \"state\": \"approved\",\n    \"cart\": \"0PU64647K75579407\",\n    \"payer\": {\n        \"payment_method\": \"paypal\",\n        \"status\": \"VERIFIED\",\n        \"payer_info\": {\n            \"email\": \"megasoft.envato@example.com\",\n            \"first_name\": \"Samiul Alim\",\n            \"last_name\": \"Pratik\",\n            \"payer_id\": \"8C5NYJ7EZ7QSS\",\n            \"shipping_address\": {\n                \"recipient_name\": \"Samiul Alim Pratik\",\n                \"line1\": \"1 Main St\",\n                \"city\": \"San Jose\",\n                \"state\": \"CA\",\n                \"postal_code\": \"95131\",\n                \"country_code\": \"US\"\n            },\n            \"country_code\": \"US\"\n        }\n    },\n    \"transactions\": [\n        {\n            \"amount\": {\n                \"total\": \"399.99\",\n                \"currency\": \"USD\",\n                \"details\": {\n                    \"subtotal\": \"399.99\",\n                    \"shipping\": \"0.00\",\n                    \"insurance\": \"0.00\",\n                    \"handling_fee\": \"0.00\",\n                    \"shipping_discount\": \"0.00\",\n                    \"discount\": \"0.00\"\n                }\n            },\n            \"payee\": {\n                \"merchant_id\": \"BKNWZYE3MAUNU\",\n                \"email\": \"megasoft.envato-facilitator@example.com\"\n            },\n            \"description\": \"You are purchasing a package Via Paypal\",\n            \"item_list\": {\n                \"items\": [\n                    {\n                        \"name\": \"You are purchasing a package\",\n                        \"price\": \"399.99\",\n                        \"currency\": \"USD\",\n                        \"tax\": \"0.00\",\n                        \"quantity\": 1,\n                        \"image_url\": \"\"\n                    }\n                ],\n                \"shipping_address\": {\n                    \"recipient_name\": \"Samiul Alim Pratik\",\n                    \"line1\": \"1 Main St\",\n                    \"city\": \"San Jose\",\n                    \"state\": \"CA\",\n                    \"postal_code\": \"95131\",\n                    \"country_code\": \"US\"\n                }\n            },\n            \"related_resources\": [\n                {\n                    \"sale\": {\n                        \"id\": \"0BN13476U9576604C\",\n                        \"state\": \"completed\",\n                        \"amount\": {\n                            \"total\": \"399.99\",\n                            \"currency\": \"USD\",\n                            \"details\": {\n                                \"subtotal\": \"399.99\",\n                                \"shipping\": \"0.00\",\n                                \"insurance\": \"0.00\",\n                                \"handling_fee\": \"0.00\",\n                                \"shipping_discount\": \"0.00\",\n                                \"discount\": \"0.00\"\n                            }\n                        },\n                        \"payment_mode\": \"INSTANT_TRANSFER\",\n                        \"protection_eligibility\": \"ELIGIBLE\",\n                        \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\n                        \"transaction_fee\": {\n                            \"value\": \"14.45\",\n                            \"currency\": \"USD\"\n                        },\n                        \"parent_payment\": \"PAYID-MZUSW2Q8H470962M79893516\",\n                        \"create_time\": \"2024-06-12T05:00:46Z\",\n                        \"update_time\": \"2024-06-12T05:00:46Z\",\n                        \"links\": [\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/0BN13476U9576604C\",\n                                \"rel\": \"self\",\n                                \"method\": \"GET\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/0BN13476U9576604C/refund\",\n                                \"rel\": \"refund\",\n                                \"method\": \"POST\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MZUSW2Q8H470962M79893516\",\n                                \"rel\": \"parent_payment\",\n                                \"method\": \"GET\"\n                            }\n                        ]\n                    }\n                }\n            ]\n        }\n    ],\n    \"redirect_urls\": {\n        \"return_url\": \"http://realstate.test/vendor/membership/paypal/success?paymentId=PAYID-MZUSW2Q8H470962M79893516\",\n        \"cancel_url\": \"http://realstate.test/vendor/membership/paypal/cancel\"\n    },\n    \"create_time\": \"2024-06-12T05:00:26Z\",\n    \"update_time\": \"2024-06-12T05:00:46Z\",\n    \"links\": [\n        {\n            \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MZUSW2Q8H470962M79893516\",\n            \"rel\": \"self\",\n            \"method\": \"GET\"\n        }\n    ],\n    \"failed_transactions\": []\n}', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Real Estate\",\"email_address\":\"realestate@example.com\",\"contact_number\":\"+8801865879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":2,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"ranaahmed269205@example.com\",\"smtp_password\":\"uvan rtvs rzmk zqnp\",\"from_mail\":\"ranaahmed@example.com\",\"from_name\":\"Binary Brain\",\"to_mail\":\"formmail@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666170d789a3c.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=ITUG13kdkQI\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 24, 36, '2024-06-12', '9999-12-31', NULL, '2024-06-12 05:00:47', '2024-06-12 05:00:47', NULL, NULL, NULL),
(29, 399.99, 'USD', '$', 'PayPal', '56a78860', 1, 0, 0, NULL, '{\n    \"id\": \"PAYID-MZUSYGY6F992891B6669073T\",\n    \"intent\": \"sale\",\n    \"state\": \"approved\",\n    \"cart\": \"23S97572S3181814S\",\n    \"payer\": {\n        \"payment_method\": \"paypal\",\n        \"status\": \"VERIFIED\",\n        \"payer_info\": {\n            \"email\": \"megasoft.envato@example.com\",\n            \"first_name\": \"Samiul Alim\",\n            \"last_name\": \"Pratik\",\n            \"payer_id\": \"8C5NYJ7EZ7QSS\",\n            \"shipping_address\": {\n                \"recipient_name\": \"Samiul Alim Pratik\",\n                \"line1\": \"1 Main St\",\n                \"city\": \"San Jose\",\n                \"state\": \"CA\",\n                \"postal_code\": \"95131\",\n                \"country_code\": \"US\"\n            },\n            \"country_code\": \"US\"\n        }\n    },\n    \"transactions\": [\n        {\n            \"amount\": {\n                \"total\": \"399.99\",\n                \"currency\": \"USD\",\n                \"details\": {\n                    \"subtotal\": \"399.99\",\n                    \"shipping\": \"0.00\",\n                    \"insurance\": \"0.00\",\n                    \"handling_fee\": \"0.00\",\n                    \"shipping_discount\": \"0.00\",\n                    \"discount\": \"0.00\"\n                }\n            },\n            \"payee\": {\n                \"merchant_id\": \"BKNWZYE3MAUNU\",\n                \"email\": \"megasoft.envato-facilitator@example.com\"\n            },\n            \"description\": \"You are purchasing a package Via Paypal\",\n            \"item_list\": {\n                \"items\": [\n                    {\n                        \"name\": \"You are purchasing a package\",\n                        \"price\": \"399.99\",\n                        \"currency\": \"USD\",\n                        \"tax\": \"0.00\",\n                        \"quantity\": 1,\n                        \"image_url\": \"\"\n                    }\n                ],\n                \"shipping_address\": {\n                    \"recipient_name\": \"Samiul Alim Pratik\",\n                    \"line1\": \"1 Main St\",\n                    \"city\": \"San Jose\",\n                    \"state\": \"CA\",\n                    \"postal_code\": \"95131\",\n                    \"country_code\": \"US\"\n                }\n            },\n            \"related_resources\": [\n                {\n                    \"sale\": {\n                        \"id\": \"38M96968D5697045A\",\n                        \"state\": \"completed\",\n                        \"amount\": {\n                            \"total\": \"399.99\",\n                            \"currency\": \"USD\",\n                            \"details\": {\n                                \"subtotal\": \"399.99\",\n                                \"shipping\": \"0.00\",\n                                \"insurance\": \"0.00\",\n                                \"handling_fee\": \"0.00\",\n                                \"shipping_discount\": \"0.00\",\n                                \"discount\": \"0.00\"\n                            }\n                        },\n                        \"payment_mode\": \"INSTANT_TRANSFER\",\n                        \"protection_eligibility\": \"ELIGIBLE\",\n                        \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\n                        \"transaction_fee\": {\n                            \"value\": \"14.45\",\n                            \"currency\": \"USD\"\n                        },\n                        \"parent_payment\": \"PAYID-MZUSYGY6F992891B6669073T\",\n                        \"create_time\": \"2024-06-12T05:03:34Z\",\n                        \"update_time\": \"2024-06-12T05:03:34Z\",\n                        \"links\": [\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/38M96968D5697045A\",\n                                \"rel\": \"self\",\n                                \"method\": \"GET\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/38M96968D5697045A/refund\",\n                                \"rel\": \"refund\",\n                                \"method\": \"POST\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MZUSYGY6F992891B6669073T\",\n                                \"rel\": \"parent_payment\",\n                                \"method\": \"GET\"\n                            }\n                        ]\n                    }\n                }\n            ]\n        }\n    ],\n    \"redirect_urls\": {\n        \"return_url\": \"http://realstate.test/vendor/membership/paypal/success?paymentId=PAYID-MZUSYGY6F992891B6669073T\",\n        \"cancel_url\": \"http://realstate.test/vendor/membership/paypal/cancel\"\n    },\n    \"create_time\": \"2024-06-12T05:03:23Z\",\n    \"update_time\": \"2024-06-12T05:03:34Z\",\n    \"links\": [\n        {\n            \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MZUSYGY6F992891B6669073T\",\n            \"rel\": \"self\",\n            \"method\": \"GET\"\n        }\n    ],\n    \"failed_transactions\": []\n}', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Real Estate\",\"email_address\":\"realestate@example.com\",\"contact_number\":\"+8801865879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":2,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"ranaahmed269205@example.com\",\"smtp_password\":\"uvan rtvs rzmk zqnp\",\"from_mail\":\"ranaahmed269205@example.com\",\"from_name\":\"Binary Brain\",\"to_mail\":\"example@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666170d789a3c.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=ITUG13kdkQI\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 24, 37, '2024-06-12', '9999-12-31', NULL, '2024-06-12 05:03:35', '2024-06-12 05:03:35', NULL, NULL, NULL),
(30, 399.99, 'USD', '$', 'PayPal', 'da1cbff7', 1, 0, 0, NULL, '{\n    \"id\": \"PAYID-MZUSZGY9GX91766XW367611W\",\n    \"intent\": \"sale\",\n    \"state\": \"approved\",\n    \"cart\": \"8M61108263672300S\",\n    \"payer\": {\n        \"payment_method\": \"paypal\",\n        \"status\": \"VERIFIED\",\n        \"payer_info\": {\n            \"email\": \"megasoft.envato@example.com\",\n            \"first_name\": \"Samiul Alim\",\n            \"last_name\": \"Pratik\",\n            \"payer_id\": \"8C5NYJ7EZ7QSS\",\n            \"shipping_address\": {\n                \"recipient_name\": \"Samiul Alim Pratik\",\n                \"line1\": \"1 Main St\",\n                \"city\": \"San Jose\",\n                \"state\": \"CA\",\n                \"postal_code\": \"95131\",\n                \"country_code\": \"US\"\n            },\n            \"country_code\": \"US\"\n        }\n    },\n    \"transactions\": [\n        {\n            \"amount\": {\n                \"total\": \"399.99\",\n                \"currency\": \"USD\",\n                \"details\": {\n                    \"subtotal\": \"399.99\",\n                    \"shipping\": \"0.00\",\n                    \"insurance\": \"0.00\",\n                    \"handling_fee\": \"0.00\",\n                    \"shipping_discount\": \"0.00\",\n                    \"discount\": \"0.00\"\n                }\n            },\n            \"payee\": {\n                \"merchant_id\": \"BKNWZYE3MAUNU\",\n                \"email\": \"megasoft.envato-facilitator@example.com\"\n            },\n            \"description\": \"You are purchasing a package Via Paypal\",\n            \"item_list\": {\n                \"items\": [\n                    {\n                        \"name\": \"You are purchasing a package\",\n                        \"price\": \"399.99\",\n                        \"currency\": \"USD\",\n                        \"tax\": \"0.00\",\n                        \"quantity\": 1,\n                        \"image_url\": \"\"\n                    }\n                ],\n                \"shipping_address\": {\n                    \"recipient_name\": \"Samiul Alim Pratik\",\n                    \"line1\": \"1 Main St\",\n                    \"city\": \"San Jose\",\n                    \"state\": \"CA\",\n                    \"postal_code\": \"95131\",\n                    \"country_code\": \"US\"\n                }\n            },\n            \"related_resources\": [\n                {\n                    \"sale\": {\n                        \"id\": \"0DL021456Y440794B\",\n                        \"state\": \"completed\",\n                        \"amount\": {\n                            \"total\": \"399.99\",\n                            \"currency\": \"USD\",\n                            \"details\": {\n                                \"subtotal\": \"399.99\",\n                                \"shipping\": \"0.00\",\n                                \"insurance\": \"0.00\",\n                                \"handling_fee\": \"0.00\",\n                                \"shipping_discount\": \"0.00\",\n                                \"discount\": \"0.00\"\n                            }\n                        },\n                        \"payment_mode\": \"INSTANT_TRANSFER\",\n                        \"protection_eligibility\": \"ELIGIBLE\",\n                        \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\n                        \"transaction_fee\": {\n                            \"value\": \"14.45\",\n                            \"currency\": \"USD\"\n                        },\n                        \"parent_payment\": \"PAYID-MZUSZGY9GX91766XW367611W\",\n                        \"create_time\": \"2024-06-12T05:05:44Z\",\n                        \"update_time\": \"2024-06-12T05:05:44Z\",\n                        \"links\": [\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/0DL021456Y440794B\",\n                                \"rel\": \"self\",\n                                \"method\": \"GET\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/0DL021456Y440794B/refund\",\n                                \"rel\": \"refund\",\n                                \"method\": \"POST\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MZUSZGY9GX91766XW367611W\",\n                                \"rel\": \"parent_payment\",\n                                \"method\": \"GET\"\n                            }\n                        ]\n                    }\n                }\n            ]\n        }\n    ],\n    \"redirect_urls\": {\n        \"return_url\": \"http://realstate.test/vendor/membership/paypal/success?paymentId=PAYID-MZUSZGY9GX91766XW367611W\",\n        \"cancel_url\": \"http://realstate.test/vendor/membership/paypal/cancel\"\n    },\n    \"create_time\": \"2024-06-12T05:05:31Z\",\n    \"update_time\": \"2024-06-12T05:05:44Z\",\n    \"links\": [\n        {\n            \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MZUSZGY9GX91766XW367611W\",\n            \"rel\": \"self\",\n            \"method\": \"GET\"\n        }\n    ],\n    \"failed_transactions\": []\n}', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Real Estate\",\"email_address\":\"realestate@example.com\",\"contact_number\":\"+8801865879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":2,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"ranaahmed269205@example.com\",\"smtp_password\":\"uvan rtvs rzmk zqnp\",\"from_mail\":\"ranaahmed269205@example.com\",\"from_name\":\"Binary Brain\",\"to_mail\":\"example@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666170d789a3c.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=ITUG13kdkQI\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 24, 38, '2024-06-12', '9999-12-31', NULL, '2024-06-12 05:05:44', '2024-06-12 05:05:44', NULL, NULL, NULL),
(31, 399.99, 'USD', '$', 'PayPal', '72371457', 1, 0, 0, NULL, '{\n    \"id\": \"PAYID-MZUS6XQ8BM09050X2485602H\",\n    \"intent\": \"sale\",\n    \"state\": \"approved\",\n    \"cart\": \"0BJ12255SD818110E\",\n    \"payer\": {\n        \"payment_method\": \"paypal\",\n        \"status\": \"VERIFIED\",\n        \"payer_info\": {\n            \"email\": \"megasoft.envato@example.com\",\n            \"first_name\": \"Samiul Alim\",\n            \"last_name\": \"Pratik\",\n            \"payer_id\": \"8C5NYJ7EZ7QSS\",\n            \"shipping_address\": {\n                \"recipient_name\": \"Samiul Alim Pratik\",\n                \"line1\": \"1 Main St\",\n                \"city\": \"San Jose\",\n                \"state\": \"CA\",\n                \"postal_code\": \"95131\",\n                \"country_code\": \"US\"\n            },\n            \"country_code\": \"US\"\n        }\n    },\n    \"transactions\": [\n        {\n            \"amount\": {\n                \"total\": \"399.99\",\n                \"currency\": \"USD\",\n                \"details\": {\n                    \"subtotal\": \"399.99\",\n                    \"shipping\": \"0.00\",\n                    \"insurance\": \"0.00\",\n                    \"handling_fee\": \"0.00\",\n                    \"shipping_discount\": \"0.00\",\n                    \"discount\": \"0.00\"\n                }\n            },\n            \"payee\": {\n                \"merchant_id\": \"BKNWZYE3MAUNU\",\n                \"email\": \"megasoft.envato-facilitator@example.com\"\n            },\n            \"description\": \"You are purchasing a package Via Paypal\",\n            \"item_list\": {\n                \"items\": [\n                    {\n                        \"name\": \"You are purchasing a package\",\n                        \"price\": \"399.99\",\n                        \"currency\": \"USD\",\n                        \"tax\": \"0.00\",\n                        \"quantity\": 1,\n                        \"image_url\": \"\"\n                    }\n                ],\n                \"shipping_address\": {\n                    \"recipient_name\": \"Samiul Alim Pratik\",\n                    \"line1\": \"1 Main St\",\n                    \"city\": \"San Jose\",\n                    \"state\": \"CA\",\n                    \"postal_code\": \"95131\",\n                    \"country_code\": \"US\"\n                }\n            },\n            \"related_resources\": [\n                {\n                    \"sale\": {\n                        \"id\": \"3976913638690504F\",\n                        \"state\": \"completed\",\n                        \"amount\": {\n                            \"total\": \"399.99\",\n                            \"currency\": \"USD\",\n                            \"details\": {\n                                \"subtotal\": \"399.99\",\n                                \"shipping\": \"0.00\",\n                                \"insurance\": \"0.00\",\n                                \"handling_fee\": \"0.00\",\n                                \"shipping_discount\": \"0.00\",\n                                \"discount\": \"0.00\"\n                            }\n                        },\n                        \"payment_mode\": \"INSTANT_TRANSFER\",\n                        \"protection_eligibility\": \"ELIGIBLE\",\n                        \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\n                        \"transaction_fee\": {\n                            \"value\": \"14.45\",\n                            \"currency\": \"USD\"\n                        },\n                        \"parent_payment\": \"PAYID-MZUS6XQ8BM09050X2485602H\",\n                        \"create_time\": \"2024-06-12T05:17:28Z\",\n                        \"update_time\": \"2024-06-12T05:17:28Z\",\n                        \"links\": [\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/3976913638690504F\",\n                                \"rel\": \"self\",\n                                \"method\": \"GET\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/3976913638690504F/refund\",\n                                \"rel\": \"refund\",\n                                \"method\": \"POST\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MZUS6XQ8BM09050X2485602H\",\n                                \"rel\": \"parent_payment\",\n                                \"method\": \"GET\"\n                            }\n                        ]\n                    }\n                }\n            ]\n        }\n    ],\n    \"redirect_urls\": {\n        \"return_url\": \"http://realstate.test/vendor/membership/paypal/success?paymentId=PAYID-MZUS6XQ8BM09050X2485602H\",\n        \"cancel_url\": \"http://realstate.test/vendor/membership/paypal/cancel\"\n    },\n    \"create_time\": \"2024-06-12T05:17:18Z\",\n    \"update_time\": \"2024-06-12T05:17:28Z\",\n    \"links\": [\n        {\n            \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MZUS6XQ8BM09050X2485602H\",\n            \"rel\": \"self\",\n            \"method\": \"GET\"\n        }\n    ],\n    \"failed_transactions\": []\n}', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Real Estate\",\"email_address\":\"realestate@example.com\",\"contact_number\":\"+8801865879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":2,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"ranaahmed269205@example.com\",\"smtp_password\":\"uvan rtvs rzmk zqnp\",\"from_mail\":\"ranaahmed269205@example.com\",\"from_name\":\"Binary Brain\",\"to_mail\":\"example@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666170d789a3c.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=ITUG13kdkQI\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 24, 39, '2024-06-12', '9999-12-31', NULL, '2024-06-12 05:17:28', '2024-06-12 05:17:28', NULL, NULL, NULL);
INSERT INTO `memberships` (`id`, `price`, `currency`, `currency_symbol`, `payment_method`, `transaction_id`, `status`, `is_trial`, `trial_days`, `receipt`, `transaction_details`, `settings`, `package_id`, `vendor_id`, `start_date`, `expire_date`, `modified`, `created_at`, `updated_at`, `conversation_id`, `nowpayment_invoice_id`, `nowpayment_request_data`) VALUES
(42, 15.99, 'TRY', '$', 'Iyzico', '394f188d', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"TRY\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-10-26', '2025-10-25', 1, '2025-10-26 12:14:13', '2025-10-26 13:00:03', NULL, NULL, NULL),
(43, 9.99, 'TRY', '$', 'Iyzico', '6ac68298', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"TRY\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 16, 43, '2025-10-26', '2025-10-25', 1, '2025-10-26 12:58:43', '2025-10-26 13:00:11', NULL, NULL, NULL),
(44, 15.99, 'USD', '$', 'Paytabs', 'ce02483d', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-10-26', '2025-10-26', 1, '2025-10-26 16:48:15', '2025-10-26 18:19:27', NULL, NULL, NULL),
(45, 299.99, 'USD', '$', 'Paytabs', 'b4150645', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 21, 43, '2025-10-27', '2025-10-26', 1, '2025-10-26 16:49:51', '2025-10-26 18:19:36', NULL, NULL, NULL),
(46, 15.99, 'RM', '$', 'Toyyibpay', 'c74a8c4f', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"RM\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-10-27', '2025-10-26', 1, '2025-10-26 18:44:41', '2025-10-26 18:47:36', NULL, NULL, NULL),
(47, 29.99, 'RM', '$', 'Toyyibpay', '53067a3b', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"RM\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-10-27', '2025-10-26', 1, '2025-10-26 18:46:06', '2025-10-26 18:47:43', NULL, NULL, NULL),
(48, 15.99, 'RM', '$', 'Toyyibpay', '517f35ee', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"RM\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-10-27', '2025-10-26', 1, '2025-10-27 16:47:49', '2025-10-27 16:48:13', NULL, NULL, NULL),
(49, 29.99, 'INR', '$', 'Phonepe', '7492afe4', 1, 0, 0, NULL, '{\"payment_gateway\":\"PhonePe\",\"merchant_order_id\":\"68ffa55383a09\",\"gateway_response\":{\"success\":true,\"state\":\"COMPLETED\",\"amount\":2999,\"data\":{\"orderId\":\"OMO2510272231063102392611\",\"state\":\"COMPLETED\",\"amount\":2999,\"expireAt\":1761757327625,\"paymentDetails\":[{\"paymentMode\":\"NET_BANKING\",\"transactionId\":\"OM2510272231063102392536\",\"timestamp\":1761584527625,\"amount\":2999,\"state\":\"COMPLETED\",\"splitInstruments\":[{\"amount\":2999,\"rail\":{\"type\":\"PG\",\"authorizationCode\":\"<authorizationCode>\"},\"instrument\":{\"type\":\"NET_BANKING\",\"bankId\":\"ICIC\",\"arn\":\"<arn>\",\"brn\":\"<brn>\"}}]}]}},\"request_data\":{\"_token\":\"Pf31H0UYNqCstXXA254Zak0Ou3pEgRxKGwU7tTJi\",\"package_id\":\"18\",\"vendor_id\":\"43\",\"payment_method\":\"Phonepe\",\"start_date\":\"27-10-2025\",\"expire_date\":\"27-11-2025\",\"price\":\"29.99\",\"is_receipt\":\"0\",\"status\":\"1\",\"receipt_name\":null,\"email\":\"faltusone@gmail.com\"}}', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"INR\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-10-27', '2025-10-26', 1, '2025-10-27 17:02:09', '2025-10-27 17:08:10', NULL, NULL, NULL),
(50, 15.99, 'ZAR', '$', 'Yoco', '9f32e0d1', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"ZAR\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-10-28', '2025-10-27', 1, '2025-10-28 08:14:38', '2025-10-28 09:33:51', NULL, NULL, NULL),
(51, 29.99, 'ZAR', '$', 'Yoco', 'a7c5e8b5', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"ZAR\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-10-28', '2025-10-27', 1, '2025-10-28 09:32:58', '2025-10-28 09:33:59', NULL, NULL, NULL),
(52, 29.99, 'PHP', '$', 'Xendit', '73395679', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"PHP\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-10-28', '2025-10-27', 1, '2025-10-28 16:25:40', '2025-10-28 16:28:18', NULL, NULL, NULL),
(53, 15.99, 'SAR', '$', 'Myfatoorah', 'eed0c3c9', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"SAR\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-10-29', '2025-10-28', 1, '2025-10-29 14:33:20', '2025-10-29 16:30:20', NULL, NULL, NULL);
INSERT INTO `memberships` (`id`, `price`, `currency`, `currency_symbol`, `payment_method`, `transaction_id`, `status`, `is_trial`, `trial_days`, `receipt`, `transaction_details`, `settings`, `package_id`, `vendor_id`, `start_date`, `expire_date`, `modified`, `created_at`, `updated_at`, `conversation_id`, `nowpayment_invoice_id`, `nowpayment_request_data`) VALUES
(54, 15.99, 'TRY', '$', 'Iyzico', 'aa9fe3cd', 2, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"TRY\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-10-29', '2025-10-28', 1, '2025-10-29 16:28:18', '2025-10-29 16:30:28', NULL, NULL, NULL),
(55, 15.99, 'IDR', '$', 'Midtrans', '82ce7ef5', 1, 0, 0, NULL, '\"69024165e2267\"', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"IDR\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-10-29', '2025-10-28', 1, '2025-10-29 16:32:30', '2025-10-29 16:34:43', NULL, NULL, NULL),
(56, 29.99, 'TRY', '$', 'Iyzico', 'a7758974', 2, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"TRY\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-10-29', '2025-10-28', 1, '2025-10-29 16:34:25', '2025-10-29 16:34:51', NULL, NULL, NULL),
(57, 29.99, 'USD', '$', 'Paytabs', 'ad0a8f8d', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-10-29', '2025-10-28', 1, '2025-10-29 16:38:49', '2025-10-29 16:39:24', NULL, NULL, NULL),
(58, 15.99, 'RM', '$', 'Toyyibpay', '050b4d87', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"RM\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-10-29', '2025-10-28', 1, '2025-10-29 16:40:14', '2025-10-29 16:50:50', NULL, NULL, NULL),
(59, 15.99, 'INR', '$', 'Phonepe', 'cb1883f4', 1, 0, 0, NULL, '{\"payment_gateway\":\"PhonePe\",\"merchant_order_id\":\"6902460a9a509\",\"gateway_response\":{\"success\":true,\"state\":\"COMPLETED\",\"amount\":1599,\"data\":{\"orderId\":\"OMO2510292221234146805992\",\"state\":\"COMPLETED\",\"amount\":1599,\"expireAt\":1761929515965,\"paymentDetails\":[{\"paymentMode\":\"NET_BANKING\",\"transactionId\":\"OM2510292221234146805391\",\"timestamp\":1761756715965,\"amount\":1599,\"state\":\"COMPLETED\",\"splitInstruments\":[{\"amount\":1599,\"rail\":{\"type\":\"PG\",\"authorizationCode\":\"<authorizationCode>\"},\"instrument\":{\"type\":\"NET_BANKING\",\"bankId\":\"ICIC\",\"arn\":\"<arn>\",\"brn\":\"<brn>\"}}]}]}},\"request_data\":{\"_token\":\"0Ppt3VFEgNQiV0KuxSdQKGQLSsvm3f8rlKZedTRR\",\"package_id\":\"17\",\"vendor_id\":\"43\",\"payment_method\":\"Phonepe\",\"start_date\":\"29-10-2025\",\"expire_date\":\"29-11-2025\",\"price\":\"15.99\",\"is_receipt\":\"0\",\"status\":\"1\",\"receipt_name\":null,\"email\":\"faltusone@gmail.com\"}}', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"INR\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-10-29', '2025-10-28', 1, '2025-10-29 16:51:56', '2025-10-29 16:55:08', NULL, NULL, NULL),
(60, 29.99, 'ZAR', '$', 'Yoco', '5f899a47', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"ZAR\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-10-29', '2025-10-28', 1, '2025-10-29 16:54:44', '2025-10-29 16:55:16', NULL, NULL, NULL),
(61, 29.99, 'SAR', '$', 'Myfatoorah', 'aa5ee957', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"SAR\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-10-29', '2025-10-28', 1, '2025-10-29 16:57:23', '2025-10-29 16:57:53', NULL, NULL, NULL),
(62, 29.99, 'PHP', '$', 'Xendit', '4f91f8e4', 1, 0, 0, NULL, 'null', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"PHP\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-10-29', '2025-11-01', 1, '2025-10-29 16:59:23', '2025-11-02 15:24:00', NULL, NULL, NULL),
(63, 29.99, 'USD', '$', 'NOWPayments', '5806818100', 2, 0, 0, NULL, '', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-11-02', '2025-11-01', 1, '2025-11-02 09:43:14', '2025-11-02 15:24:12', NULL, NULL, NULL),
(64, 15.99, 'INR', '$', 'Razorpay', '52fc53a3', 1, 0, 0, NULL, '{\"attributes\":{},\"request\":{},\"query\":{},\"server\":{},\"files\":{},\"cookies\":{},\"headers\":{}}', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"INR\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-11-02', '2025-11-02', 1, '2025-11-02 15:28:55', '2025-11-03 10:58:06', NULL, NULL, NULL);
INSERT INTO `memberships` (`id`, `price`, `currency`, `currency_symbol`, `payment_method`, `transaction_id`, `status`, `is_trial`, `trial_days`, `receipt`, `transaction_details`, `settings`, `package_id`, `vendor_id`, `start_date`, `expire_date`, `modified`, `created_at`, `updated_at`, `conversation_id`, `nowpayment_invoice_id`, `nowpayment_request_data`) VALUES
(65, 29.99, 'INR', '$', 'Razorpay', '7122201b', 1, 0, 0, NULL, '{\"attributes\":{},\"request\":{},\"query\":{},\"server\":{},\"files\":{},\"cookies\":{},\"headers\":{}}', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"INR\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 18, 43, '2025-11-03', '2025-11-02', 1, '2025-11-02 15:31:34', '2025-11-03 10:58:17', NULL, NULL, NULL),
(66, 15.99, 'USD', '$', 'NOWPayments', '5217814026', 2, 0, 0, NULL, '', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-11-03', '2025-11-03', 1, '2025-11-03 11:00:16', '2025-11-04 06:42:06', NULL, NULL, NULL),
(67, 15.99, 'USD', '$', 'NOWPayments', '4803723067', 0, 0, 0, NULL, '', '{\"id\":2,\"uniqid\":12345,\"favicon\":\"65127f2a23da3.png\",\"logo\":\"66669210543fd.png\",\"logo_two\":\"64ed7071b1844.png\",\"website_title\":\"Estaty\",\"email_address\":\"estaty@example.com\",\"contact_number\":\"+88065879521\",\"address\":\"13th Street 47 W ,New York, USA\",\"theme_version\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"left\",\"base_currency_rate\":\"1.00\",\"primary_color\":\"F57F4B\",\"secondary_color\":\"255056\",\"smtp_status\":1,\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":587,\"encryption\":\"TLS\",\"smtp_username\":\"shohag.fci63@gmail.com\",\"smtp_password\":\"fuzp qnws wxzn gdst\",\"from_mail\":\"shohag.fci63@gmail.com\",\"from_name\":\"Estaty\",\"to_mail\":\"admin@example.com\",\"breadcrumb\":\"6511175715121.jpg\",\"disqus_status\":0,\"disqus_short_name\":null,\"google_recaptcha_status\":0,\"google_recaptcha_site_key\":\"dfzgasdfg\",\"google_recaptcha_secret_key\":\"asdfgavsdfgvsd\",\"whatsapp_status\":0,\"whatsapp_number\":\"01868362878\",\"whatsapp_header_title\":\"Hi, there!\",\"whatsapp_popup_status\":1,\"whatsapp_popup_message\":\"If you have any issues, let us know.\",\"maintenance_img\":\"1632725312.png\",\"maintenance_status\":0,\"maintenance_msg\":\"We are upgrading our site. We will come back soon. \\r\\nPlease stay with us.\\r\\nThank you.\",\"bypass_token\":null,\"footer_logo\":\"66668fd8afd03.png\",\"footer_background_image\":\"6572f1d3ead31.png\",\"admin_theme_version\":\"light\",\"notification_image\":\"619b7d5e5e9df.png\",\"counter_section_image\":\"64e46e661cff4.png\",\"call_to_action_section_image\":\"6576af4f8ac2d.jpg\",\"testimonial_section_image\":\"6572e7c01c264.png\",\"category_section_background\":\"63c92601cb853.jpg\",\"google_adsense_publisher_id\":null,\"property_country_status\":1,\"property_state_status\":1,\"guest_checkout_status\":0,\"facebook_login_status\":1,\"facebook_app_id\":\"377957354064048\",\"facebook_app_secret\":\"c7ea8a036916500375fbd9a799b95c50\",\"google_login_status\":1,\"google_client_id\":\"951854288029-q77ihbshmmsm875po2na1ljvlejm7aji08.apps.googleusercontent.com\",\"google_client_secret\":\"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_zM\",\"tawkto_status\":0,\"tawkto_direct_chat_link\":\"https:\\/\\/tawk.to\\/chat\\/623891851ffac05b1d7fac3b\\/1fumfgsmj\",\"vendor_admin_approval\":1,\"vendor_email_verification\":1,\"admin_approval_notice\":\"Your account is deactive or pending now please contact with admin.\",\"expiration_reminder\":3,\"timezone\":\"Asia\\/Dhaka\",\"hero_section_video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=9l6RywtDlKA\",\"hero_static_img\":\"6574372e0ad77.jpg\",\"contact_title\":\"Get Connected\",\"contact_subtile\":\"How Can We Help You?\",\"contact_details\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores pariatur a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat veritatis architecto. Aliquid doloremque nesciunt nobis, debitis, quas veniam.\\r\\n\\r\\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores a ea similique quod dicta ipsa vel quidem repellendus, beatae nulla veniam, quaerat.\",\"latitude\":\"23.8763296233045\",\"longitude\":\"90.47600702834376\",\"preloader_status\":1,\"preloader\":\"666a7cc7647d0.png\",\"about_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=F26FINYrof0\",\"about_section_image1\":\"657557b3c229e.jpg\",\"about_section_image2\":\"657557b3c2a25.jpg\",\"why_choose_us_section_img1\":\"65757ae71b9f0.jpg\",\"why_choose_us_section_img2\":\"65757ae71c078.jpg\",\"why_choose_us_section_video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=mrpiPK8_up0\",\"subscribe_section_img\":\"6577e0ff3ab05.jpg\",\"updated_at\":\"2024-05-19T07:07:40.000000Z\",\"property_approval_status\":1,\"project_approval_status\":1}', 17, 43, '2025-11-04', '2025-12-04', NULL, '2025-11-04 09:19:58', '2025-11-04 09:19:58', NULL, '4803723067', '{\"package_id\":\"17\",\"vendor_id\":\"43\",\"payment_method\":\"NOWPayments\",\"start_date\":\"04-11-2025\",\"expire_date\":\"04-12-2025\",\"price\":\"15.99\",\"is_receipt\":\"0\",\"status\":0,\"receipt_name\":null,\"email\":\"faltusone@gmail.com\",\"title\":\"You are purchasing a package\",\"order_id\":\"45338b6e\"}');

-- --------------------------------------------------------

--
-- Table structure for table `menu_builders`
--

CREATE TABLE `menu_builders` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `menus` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `menu_builders`
--

INSERT INTO `menu_builders` (`id`, `language_id`, `menus`, `created_at`, `updated_at`) VALUES
(7, 20, '[{\"text\":\"Home\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_top\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"Home One\",\"href\":\"\\\\?theme=one\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"type\":\"custom\",\"text\":\"Home Two\",\"href\":\"\\\\?theme=two\",\"target\":\"_self\"},{\"type\":\"custom\",\"text\":\"Home Three\",\"href\":\"\\\\?theme=three\",\"target\":\"_self\"}]},{\"text\":\"Properties\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"properties\"},{\"text\":\"Projects\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"projects\"},{\"text\":\"Pricing\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"pricing\"},{\"text\":\"Pages\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"About Us\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"about-us\"},{\"text\":\"Vendors\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"vendors\"},{\"text\":\"Terms & Condition\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"terms-&-condition\"},{\"text\":\"Privacy Policy\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"privacy-policy\"},{\"text\":\"Blog\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"blog\"},{\"text\":\"FAQ\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"faq\"}]},{\"text\":\"Contact\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"contact\"}]', '2023-08-17 03:19:12', '2024-06-14 06:21:33'),
(12, 25, '[{\"text\":\"بيت\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_blank\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"المنزل واحد\",\"href\":\"\\?theme=one\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"المنزل اثنين\",\"href\":\"\\?theme=two\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"المنزل ثلاثة\",\"href\":\"\\?theme=three\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]},{\"text\":\"ملكيات\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"properties\"},{\"text\":\"المشاريع\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"projects\"},{\"text\":\"التسعير\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"pricing\"},{\"text\":\"الصفحات\",\"href\":\"#\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"معلومات عنا\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"about-us\"},{\"text\":\"الباعة\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"vendors\"},{\"text\":\"سياسة الخصوصية\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"سياسة-الخصوصية\"},{\"text\":\"الشروط والأحكام\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"الشروط-والأحكام\"},{\"text\":\"مدونة\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"blog\"},{\"text\":\"التعليمات\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"faq\"}]},{\"text\":\"اتصال\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"contact\"}]', '2024-03-26 02:23:59', '2024-06-14 06:21:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(89, '2024_02_05_072327_create_admin_infos_table', 1),
(90, '2024_04_30_102738_add_column_in_properties_table', 2),
(91, '2024_04_30_102956_add_column_in_projects_table', 2),
(92, '2024_04_30_103150_add_column_in_basic_settings_table', 3),
(93, '2024_05_05_120737_add_column_in_brand_sections', 4),
(94, '2024_05_06_115537_add_column_in_packages_table', 5),
(95, '2024_05_07_165109_add_column_in_blogs_table', 6),
(96, '2024_05_12_153537_modify_column_in_properties_table', 7),
(97, '2024_05_12_154228_modify_column_in_properties_table', 8),
(100, '2021_02_01_030511_create_payment_invoices_table', 9),
(101, '2024_05_12_154739_modify_column_in_project_type_contents_table', 9),
(102, '2025_10_26_170053_add_column_to_memberships', 9);

-- --------------------------------------------------------

--
-- Table structure for table `offline_gateways`
--

CREATE TABLE `offline_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb3_unicode_ci,
  `instructions` longtext COLLATE utf8mb3_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 -> gateway is deactive, 1 -> gateway is active.',
  `has_attachment` tinyint(1) NOT NULL COMMENT '0 -> do not need attachment, 1 -> need attachment.',
  `serial_number` mediumint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `offline_gateways`
--

INSERT INTO `offline_gateways` (`id`, `name`, `short_description`, `instructions`, `status`, `has_attachment`, `serial_number`, `created_at`, `updated_at`) VALUES
(12, 'Citibank', 'A pioneer of both the credit card industry and automated teller machines, Citibank – formerly the City Bank of New York.', '<p><span style=\"font-family:\'proxima-nova\', sans-serif;font-size:16px;\">A pioneer of both the credit card industry and automated teller machines, </span><a href=\"https://smartasset.com/checking-account/Citibank-banking-review\">Citibank</a><span style=\"font-family:\'proxima-nova\', sans-serif;font-size:16px;\"> – formerly the City Bank of New York – was regarded as an East Coast equivalent to Wells Fargo during the 19th century.</span></p>', 1, 0, 1, '2021-07-16 22:41:59', '2023-08-26 22:02:23'),
(13, 'Bank of America', 'Bank of America has 4,265 branches in the country, only about 700 fewer than Chase. It started as a small institution serving immigrants in San Francisco.', '<p><span style=\"font-family:\'proxima-nova\', sans-serif;font-size:16px;\">With $1.8 trillion in consolidated assets, </span><a href=\"https://smartasset.com/checking-account/bank-of-america-review\">Bank of America</a><span style=\"font-family:\'proxima-nova\', sans-serif;font-size:16px;\"> is second on the list. Its headquarters in Charlotte, North Carolina, singlehandedly makes that city one of the biggest financial centers in the country.</span></p>', 1, 1, 2, '2021-07-16 22:43:19', '2023-08-13 04:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `online_gateways`
--

CREATE TABLE `online_gateways` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `information` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `online_gateways`
--

INSERT INTO `online_gateways` (`id`, `name`, `keyword`, `information`, `status`) VALUES
(1, 'PayPal', 'paypal', '{\"sandbox_status\":\"0\",\"client_id\":\"\",\"client_secret\":\"\"}', 0),
(2, 'Instamojo', 'instamojo', '{\"sandbox_status\":\"0\",\"key\":\"\",\"token\":\"\"}', 0),
(3, 'Paystack', 'paystack', '{\"key\":\"\"}', 0),
(4, 'Flutterwave', 'flutterwave', '{\"public_key\":\"\",\"secret_key\":\"\"}', 0),
(5, 'Razorpay', 'razorpay', '{\"key\":\"rzp_test_fV9dM9URYbqjm7\",\"secret\":\"nickxZ1du2ojPYVVRTDif2Xr\"}', 1),
(6, 'MercadoPago', 'mercadopago', '{\"sandbox_status\":\"0\",\"token\":\"\"}', 0),
(7, 'Mollie', 'mollie', '{\"key\":\"\"}', 0),
(10, 'Stripe', 'stripe', '{\"key\":\"\",\"secret\":\"\"}', 0),
(11, 'Paytm', 'paytm', '{\"environment\":\"local\",\"merchant_key\":\"\",\"merchant_mid\":\"\",\"merchant_website\":\"WEBSTAGING\",\"industry_type\":\"Retail\"}', 0),
(21, 'Authorize.net', 'authorize.net', '{\"login_id\":\"\",\"transaction_key\":\"\",\"public_key\":\"\",\"sandbox_check\":\"0\",\"text\":\"Pay via your Authorize.net account.\"}', 0),
(22, 'Midtrans', 'midtrans', '{\"server_key\":\"SB-Mid-server-w4Ihfmt0iPijcKkEfa8X2e-9\",\"midtrans_mode\":\"1\"}', 1),
(23, 'Iyzico', 'iyzico', '{\"api_key\":\"sandbox-nhwvNYFN8EdyUm0MXVon9u9wNt6HTKrl\",\"secret_key\":\"sandbox-nZ69wQYaUbxqKbOoHJmc9CjQZtgcSloC\",\"sandbox_status\":null,\"iyzico_mode\":\"1\"}', 1),
(24, 'Paytabs', 'paytabs', '{\"server_key\":\"SKJ9LL6R92-J6NRR9LDNM-J9JHHMDHMR\",\"profile_id\":\"125178\",\"country\":\"global\",\"api_endpoint\":\"https:\\/\\/secure-global.paytabs.com\\/payment\\/request\"}', 1),
(25, 'Toyyibpay', 'toyyibpay', '{\"sandbox_status\":\"1\",\"secret_key\":\"5zcr9cl4-3aak-8vzl-5ahm-6f1k6z1lvjw3\",\"category_code\":\"m1plpg99\"}', 1),
(26, 'Phonepe', 'phonepe', '{\"merchant_id\":\"TEST-M233GKUAA3G5C_25070\",\"sandbox_status\":\"1\",\"salt_key\":\"NDNkY2VkMTItZDI4YS00MTk4LThmZmMtMjZkNjQ2MTE3OTAw\",\"salt_index\":\"1\"}', 1),
(27, 'Yoco', 'yoco', '{\"secret_key\":\"sk_test_960bfde0VBrLlpK098e4ffeb53e1\"}', 1),
(28, 'Myfatoorah', 'myfatoorah', '{\"token\":\"rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL\",\"sandbox_status\":\"1\"}', 1),
(29, 'Xendit', 'xendit', '{\"secret_key\":\"xnd_development_xJnvoJSaiPLhSzwB23Xmzu6Fcayjou9e8qpaoExzfj3UWfmM4GvaY1eBgzcABxyr\"}', 1),
(30, 'Perfect Money', 'perfect_money', '{\"perfect_money_wallet_id\":\"U1234567\"}', 1),
(32, 'NOWPayments', 'now_payment', '{\"api_key\":\"QH0DSQQ-F604B8N-J0SS8P3-G9K76V4\",\"public_key\":\"7fb5d7ed-afaf-4340-bdbb-9a43d1ab2927\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `term` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `number_of_agent` int DEFAULT NULL,
  `number_of_property` int DEFAULT NULL,
  `number_of_property_gallery_images` int DEFAULT NULL,
  `number_of_property_adittionl_specifications` int DEFAULT NULL,
  `number_of_projects` int DEFAULT NULL,
  `number_of_project_types` int DEFAULT NULL,
  `number_of_project_gallery_images` int DEFAULT NULL,
  `number_of_project_additionl_specifications` int DEFAULT NULL,
  `is_trial` int DEFAULT NULL,
  `trial_days` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `icon`, `title`, `price`, `term`, `number_of_agent`, `number_of_property`, `number_of_property_gallery_images`, `number_of_property_adittionl_specifications`, `number_of_projects`, `number_of_project_types`, `number_of_project_gallery_images`, `number_of_project_additionl_specifications`, `is_trial`, `trial_days`, `status`, `created_at`, `updated_at`, `is_featured`) VALUES
(16, 'fas fa-layer-group iconpicker-component', 'Startup', 9.99, 'monthly', 0, 10, 3, 4, 10, 3, 3, 4, 0, 0, 1, '2024-03-24 21:16:20', '2024-06-11 06:31:53', 1),
(17, 'far fa-check-circle iconpicker-component', 'Growth', 15.99, 'monthly', 3, 15, 4, 5, 15, 3, 4, 5, 0, 0, 1, '2024-05-06 06:15:33', '2024-06-11 06:15:38', 1),
(18, 'fas fa-box iconpicker-component', 'Maturity', 29.99, 'monthly', 5, 20, 10, 12, 20, 9, 10, 12, 0, 0, 1, '2024-06-11 06:17:58', '2024-06-12 07:23:42', 1),
(19, 'fas fa-layer-group iconpicker-component', 'Startup', 99.99, 'yearly', 0, 10, 3, 4, 10, 3, 3, 4, 0, 0, 1, '2024-06-11 06:25:15', '2024-06-12 07:19:40', 1),
(20, 'far fa-check-circle iconpicker-component', 'Growth', 169.99, 'yearly', 5, 15, 4, 6, 15, 3, 4, 6, 0, 0, 1, '2024-06-11 06:26:38', '2024-06-12 07:22:10', 1),
(21, 'fas fa-box-open iconpicker-component', 'Maturity', 299.99, 'yearly', 5, 20, 10, 12, 20, 9, 10, 12, 0, 0, 1, '2024-06-11 06:28:02', '2024-06-12 07:23:48', 1),
(22, 'fas fa-layer-group', 'Free', 0, 'lifetime', 0, 1, 3, 2, 1, 3, 3, 2, NULL, NULL, 1, '2024-06-11 06:35:45', '2024-06-11 06:35:45', 1),
(23, 'far fa-check-circle', 'Golden', 199.99, 'lifetime', 5, 30, 10, 12, 30, 12, 10, 12, NULL, NULL, 1, '2024-06-11 06:38:11', '2024-06-11 06:38:11', 1),
(24, 'fas fa-box-open iconpicker-component', 'Plutinum', 399.99, 'lifetime', 10, 50, 99, 99, 50, 99, 99, 99, 0, 0, 1, '2024-06-11 06:39:19', '2024-06-12 07:25:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `status`, `created_at`, `updated_at`) VALUES
(21, 1, '2023-08-19 23:52:10', '2023-08-19 23:52:10'),
(22, 1, '2023-08-19 23:56:10', '2024-05-12 05:59:44');

-- --------------------------------------------------------

--
-- Table structure for table `page_contents`
--

CREATE TABLE `page_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `page_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` blob NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `page_contents`
--

INSERT INTO `page_contents` (`id`, `language_id`, `page_id`, `title`, `slug`, `content`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(45, 20, 21, 'Terms & Condition', 'terms-&-condition', 0x3c703e57656c636f6d6520746f203c7374726f6e673e4573746174793c2f7374726f6e673e2e205468657365207465726d7320616e6420636f6e646974696f6e73206f75746c696e65207468652072756c657320616e6420726567756c6174696f6e7320666f722074686520757365206f66206f757220776562736974652e3c2f703e0d0a3c68333e312e20416363657074616e6365206f66205465726d733c2f68333e0d0a3c703e427920616363657373696e6720616e64207573696e67206f757220776562736974652c20796f7520616772656520746f20626520626f756e64206279207468657365207465726d7320616e6420636f6e646974696f6e732e20496620796f7520646f206e6f7420616772656520746f207468657365207465726d7320616e6420636f6e646974696f6e732c20796f752073686f756c64206e6f7420757365206f757220776562736974652e3c2f703e0d0a3c68333e322e20496e74656c6c65637475616c2050726f70657274793c2f68333e0d0a3c703e416c6c20696e74656c6c65637475616c2070726f70657274792072696768747320696e20746865207765627369746520616e642074686520636f6e74656e74207075626c6973686564206f6e2069742c20696e636c7564696e6720627574206e6f74206c696d6974656420746f20636f7079726967687420616e642074726164656d61726b732c20617265206f776e6564206279207573206f72206f7572206c6963656e736f72732e20596f75206d6179206e6f742075736520616e79206f66206f757220696e74656c6c65637475616c2070726f706572747920776974686f7574206f7572207072696f72207772697474656e20636f6e73656e742e3c2f703e0d0a3c68333e332e205573657220436f6e74656e743c2f68333e0d0a3c703e4279207375626d697474696e6720616e7920636f6e74656e7420746f206f757220776562736974652c20796f75206772616e74207573206120776f726c64776964652c206e6f6e2d6578636c75736976652c20726f79616c74792d66726565206c6963656e736520746f207573652c20726570726f647563652c20646973747269627574652c20616e6420646973706c6179207375636820636f6e74656e7420696e20616e79206d6564696120666f726d617420616e64207468726f75676820616e79206d65646961206368616e6e656c732e3c2f703e0d0a3c68333e342e20446973636c61696d6572206f662057617272616e746965733c2f68333e0d0a3c703e4f7572207765627369746520616e642074686520636f6e74656e74207075626c6973686564206f6e206974206172652070726f7669646564206f6e20616e202261732069732220616e642022617320617661696c61626c65222062617369732e20576520646f206e6f74206d616b6520616e792077617272616e746965732c2065787072657373206f7220696d706c6965642c20726567617264696e672074686520776562736974652c20696e636c7564696e6720627574206e6f74206c696d6974656420746f207468652061636375726163792c2072656c696162696c6974792c206f7220737569746162696c697479206f662074686520636f6e74656e7420666f7220616e7920706172746963756c617220707572706f73652e3c2f703e0d0a3c68333e352e204c696d69746174696f6e206f66204c696162696c6974793c2f68333e0d0a3c703e5765207368616c6c206e6f74206265206c6961626c6520666f7220616e792064616d616765732c20696e636c7564696e6720627574206e6f74206c696d6974656420746f206469726563742c20696e6469726563742c20696e636964656e74616c2c2070756e69746976652c20616e6420636f6e73657175656e7469616c2064616d616765732c2061726973696e672066726f6d2074686520757365206f7220696e6162696c69747920746f20757365206f75722077656273697465206f722074686520636f6e74656e74207075626c6973686564206f6e2069742e3c2f703e0d0a3c68333e362e204d6f64696669636174696f6e7320746f205465726d7320616e6420436f6e646974696f6e733c2f68333e0d0a3c703e576520726573657276652074686520726967687420746f206d6f64696679207468657365207465726d7320616e6420636f6e646974696f6e7320617420616e792074696d6520776974686f7574207072696f72206e6f746963652e20596f757220636f6e74696e75656420757365206f66206f7572207765627369746520616674657220616e792073756368206d6f64696669636174696f6e7320696e6469636174657320796f757220616363657074616e6365206f6620746865206d6f646966696564207465726d7320616e6420636f6e646974696f6e732e3c2f703e0d0a3c68333e372e20476f7665726e696e67204c617720616e64204a7572697364696374696f6e3c2f68333e0d0a3c703e5468657365207465726d7320616e6420636f6e646974696f6e73207368616c6c20626520676f7665726e656420627920616e6420636f6e73747275656420627920746865206c617773206f6620746865206a7572697364696374696f6e20696e207768696368207765206f7065726174652c20776974686f757420676976696e672065666665637420746f20616e79207072696e6369706c6573206f6620636f6e666c69637473206f66206c61772e20416e79206c6567616c2070726f63656564696e67732061726973696e67206f7574206f66206f7220696e20636f6e6e656374696f6e2077697468207468657365207465726d7320616e6420636f6e646974696f6e73207368616c6c2062652062726f7567687420736f6c656c7920696e2074686520636f75727473206c6f636174656420696e20746865206a7572697364696374696f6e20696e207768696368207765206f7065726174652e3c2f703e0d0a3c68333e382e205465726d696e6174696f6e3c2f68333e0d0a3c703e5765207368616c6c206e6f74206265206c6961626c6520666f7220616e792064616d616765732c20696e636c7564696e6720627574206e6f74206c696d6974656420746f206469726563742c20696e6469726563742c20696e636964656e74616c2c2070756e69746976652c20616e6420636f6e73657175656e7469616c2064616d616765732c2061726973696e672066726f6d2074686520757365206f7220696e6162696c69747920746f20757365206f75722077656273697465206f722074686520636f6e74656e74207075626c6973686564206f6e2069742e3c2f703e0d0a3c68333e392e20436f6e7461637420496e666f726d6174696f6e3c2f68333e0d0a3c703e496620796f75206861766520616e79207175657374696f6e73206f7220636f6d6d656e74732061626f7574207468657365207465726d7320616e6420636f6e646974696f6e732c20706c6561736520636f6e7461637420757320617420696e666f406573746174792e636f6d2e3c2f703e, NULL, NULL, '2023-08-19 23:52:10', '2024-06-08 08:35:49'),
(47, 20, 22, 'Privacy Policy', 'privacy-policy', 0x3c68333e312e20496e666f726d6174696f6e20436f6c6c656374696f6e3c2f68333e0d0a3c703e54686973205072697661637920506f6c69637920646573637269626573204f757220706f6c696369657320616e642070726f63656475726573206f6e2074686520636f6c6c656374696f6e2c2075736520616e6420646973636c6f73757265206f6620596f757220696e666f726d6174696f6e207768656e20596f752075736520746865205365727669636520616e642074656c6c7320596f752061626f757420596f757220707269766163792072696768747320616e6420686f7720746865206c61772070726f746563747320596f752e3c2f703e0d0a3c703e57652075736520596f757220506572736f6e616c206461746120746f2070726f7669646520616e6420696d70726f76652074686520536572766963652e204279207573696e672074686520536572766963652c20596f7520616772656520746f2074686520636f6c6c656374696f6e20616e6420757365206f6620696e666f726d6174696f6e20696e206163636f7264616e636520776974682074686973205072697661637920506f6c6963792ec2a03c2f703e0d0a3c68333e322e20506572736f6e616c20446174613c2f68333e0d0a3c703e5768696c65207573696e67204f757220536572766963652c205765206d61792061736b20596f7520746f2070726f766964652055732077697468206365727461696e20706572736f6e616c6c79206964656e7469666961626c6520696e666f726d6174696f6e20746861742063616e206265207573656420746f20636f6e74616374206f72206964656e7469667920596f752e20506572736f6e616c6c79206964656e7469666961626c6520696e666f726d6174696f6e206d617920696e636c7564652c20627574206973206e6f74206c696d6974656420746f3a3c2f703e0d0a3c703e456d61696c20616464726573733c2f703e0d0a3c703e4669727374206e616d6520616e64206c617374206e616d653c2f703e0d0a3c703e50686f6e65206e756d6265723c2f703e0d0a3c703e416464726573732c2053746174652c2050726f76696e63652c205a49502f506f7374616c20636f64652c20436974793c2f703e0d0a3c703e557361676520446174613c2f703e0d0a3c703ec2a03c2f703e0d0a3c68333e332e20557361676520446174613c2f68333e0d0a3c703e5573616765204461746120697320636f6c6c6563746564206175746f6d61746963616c6c79207768656e207573696e672074686520536572766963652e3c2f703e0d0a3c703e55736167652044617461206d617920696e636c75646520696e666f726d6174696f6e207375636820617320596f757220446576696365277320496e7465726e65742050726f746f636f6c20616464726573732028652e672e2049502061646472657373292c2062726f7773657220747970652c2062726f777365722076657273696f6e2c20746865207061676573206f66206f75722053657276696365207468617420596f752076697369742c207468652074696d6520616e642064617465206f6620596f75722076697369742c207468652074696d65207370656e74206f6e2074686f73652070616765732c20756e6971756520646576696365206964656e7469666965727320616e64206f7468657220646961676e6f7374696320646174612e3c2f703e0d0a3c703e5768656e20596f7520616363657373207468652053657276696365206279206f72207468726f7567682061206d6f62696c65206465766963652c205765206d617920636f6c6c656374206365727461696e20696e666f726d6174696f6e206175746f6d61746963616c6c792c20696e636c7564696e672c20627574206e6f74206c696d6974656420746f2c207468652074797065206f66206d6f62696c652064657669636520596f75207573652c20596f7572206d6f62696c652064657669636520756e697175652049442c207468652049502061646472657373206f6620596f7572206d6f62696c65206465766963652c20596f7572206d6f62696c65206f7065726174696e672073797374656d2c207468652074797065206f66206d6f62696c6520496e7465726e65742062726f7773657220596f75207573652c20756e6971756520646576696365206964656e7469666965727320616e64206f7468657220646961676e6f7374696320646174612e3c2f703e0d0a3c703e5765206d617920616c736f20636f6c6c65637420696e666f726d6174696f6e207468617420596f75722062726f777365722073656e6473207768656e6576657220596f75207669736974206f75722053657276696365206f72207768656e20596f7520616363657373207468652053657276696365206279206f72207468726f7567682061206d6f62696c65206465766963652e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c68333e342e20526574656e74696f6e206f6620596f757220446174613c2f68333e0d0a3c703e54686520436f6d70616e792077696c6c2072657461696e20596f757220506572736f6e616c2044617461206f6e6c7920666f72206173206c6f6e67206173206973206e656365737361727920666f722074686520707572706f73657320736574206f757420696e2074686973205072697661637920506f6c6963792e2057652077696c6c2072657461696e20616e642075736520596f757220506572736f6e616c204461746120746f2074686520657874656e74206e656365737361727920746f20636f6d706c792077697468206f7572206c6567616c206f626c69676174696f6e732028666f72206578616d706c652c2069662077652061726520726571756972656420746f2072657461696e20796f7572206461746120746f20636f6d706c792077697468206170706c696361626c65206c617773292c207265736f6c76652064697370757465732c20616e6420656e666f726365206f7572206c6567616c2061677265656d656e747320616e6420706f6c69636965732e3c2f703e0d0a3c703e54686520436f6d70616e792077696c6c20616c736f2072657461696e205573616765204461746120666f7220696e7465726e616c20616e616c7973697320707572706f7365732e20557361676520446174612069732067656e6572616c6c792072657461696e656420666f7220612073686f7274657220706572696f64206f662074696d652c20657863657074207768656e20746869732064617461206973207573656420746f20737472656e677468656e20746865207365637572697479206f7220746f20696d70726f7665207468652066756e6374696f6e616c697479206f66204f757220536572766963652c206f7220576520617265206c6567616c6c79206f626c69676174656420746f2072657461696e2074686973206461746120666f72206c6f6e6765722074696d6520706572696f64732e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c68333e362e205472616e73666572206f6620596f757220446174613c2f68333e0d0a3c703e596f757220696e666f726d6174696f6e2c20696e636c7564696e6720506572736f6e616c20446174612c2069732070726f6365737365642061742074686520436f6d70616e792773206f7065726174696e67206f66666963657320616e6420696e20616e79206f7468657220706c6163657320776865726520746865207061727469657320696e766f6c76656420696e207468652070726f63657373696e6720617265206c6f63617465642e204974206d65616e732074686174207468697320696e666f726d6174696f6e206d6179206265207472616e7366657272656420746f20e2809420616e64206d61696e7461696e6564206f6e20e2809420636f6d707574657273206c6f6361746564206f757473696465206f6620596f75722073746174652c2070726f76696e63652c20636f756e747279206f72206f7468657220676f7665726e6d656e74616c206a7572697364696374696f6e2077686572652074686520646174612070726f74656374696f6e206c617773206d617920646966666572207468616e2074686f73652066726f6d20596f7572206a7572697364696374696f6e2e3c2f703e0d0a3c703e596f757220636f6e73656e7420746f2074686973205072697661637920506f6c69637920666f6c6c6f77656420627920596f7572207375626d697373696f6e206f66207375636820696e666f726d6174696f6e20726570726573656e747320596f75722061677265656d656e7420746f2074686174207472616e736665722e3c2f703e0d0a3c703e54686520436f6d70616e792077696c6c2074616b6520616c6c20737465707320726561736f6e61626c79206e656365737361727920746f20656e73757265207468617420596f757220646174612069732074726561746564207365637572656c7920616e6420696e206163636f7264616e636520776974682074686973205072697661637920506f6c69637920616e64206e6f207472616e73666572206f6620596f757220506572736f6e616c20446174612077696c6c2074616b6520706c61636520746f20616e206f7267616e697a6174696f6e206f72206120636f756e74727920756e6c6573732074686572652061726520616465717561746520636f6e74726f6c7320696e20706c61636520696e636c7564696e6720746865207365637572697479206f6620596f7572206461746120616e64206f7468657220706572736f6e616c20696e666f726d6174696f6e2e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c68333e372e2044656c65746520596f757220506572736f6e616c20446174613c2f68333e0d0a3c703e596f7520686176652074686520726967687420746f2064656c657465206f72207265717565737420746861742057652061737369737420696e2064656c6574696e672074686520506572736f6e616c20446174612074686174205765206861766520636f6c6c65637465642061626f757420596f752e3c2f703e0d0a3c703e4f75722053657276696365206d6179206769766520596f7520746865206162696c69747920746f2064656c657465206365727461696e20696e666f726d6174696f6e2061626f757420596f752066726f6d2077697468696e2074686520536572766963652e3c2f703e0d0a3c703e596f75206d6179207570646174652c20616d656e642c206f722064656c65746520596f757220696e666f726d6174696f6e20617420616e792074696d65206279207369676e696e6720696e20746f20596f7572204163636f756e742c20696620796f752068617665206f6e652c20616e64207669736974696e6720746865206163636f756e742073657474696e67732073656374696f6e207468617420616c6c6f777320796f7520746f206d616e61676520596f757220706572736f6e616c20696e666f726d6174696f6e2e20596f75206d617920616c736f20636f6e7461637420557320746f20726571756573742061636365737320746f2c20636f72726563742c206f722064656c65746520616e7920706572736f6e616c20696e666f726d6174696f6e207468617420596f7520686176652070726f766964656420746f2055732e3c2f703e0d0a3c703e506c65617365206e6f74652c20686f77657665722c2074686174205765206d6179206e65656420746f2072657461696e206365727461696e20696e666f726d6174696f6e207768656e20776520686176652061206c6567616c206f626c69676174696f6e206f72206c617766756c20626173697320746f20646f20736f2e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c68333e382e20427573696e657373205472616e73616374696f6e733c2f68333e0d0a3c703e49662074686520436f6d70616e7920697320696e766f6c76656420696e2061206d65726765722c206163717569736974696f6e206f722061737365742073616c652c20596f757220506572736f6e616c2044617461206d6179206265207472616e736665727265642e2057652077696c6c2070726f76696465206e6f74696365206265666f726520596f757220506572736f6e616c2044617461206973207472616e7366657272656420616e64206265636f6d6573207375626a65637420746f206120646966666572656e74205072697661637920506f6c6963792e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c68333e392e205365637572697479206f6620596f757220506572736f6e616c20446174613c2f68333e0d0a3c703e546865207365637572697479206f6620596f757220506572736f6e616c204461746120697320696d706f7274616e7420746f2055732c206275742072656d656d6265722074686174206e6f206d6574686f64206f66207472616e736d697373696f6e206f7665722074686520496e7465726e65742c206f72206d6574686f64206f6620656c656374726f6e69632073746f726167652069732031303025207365637572652e205768696c652057652073747269766520746f2075736520636f6d6d65726369616c6c792061636365707461626c65206d65616e7320746f2070726f7465637420596f757220506572736f6e616c20446174612c2057652063616e6e6f742067756172616e74656520697473206162736f6c7574652073656375726974792e3c2f703e0d0a3c703e4368696c6472656e277320507269766163793c2f703e0d0a3c703e4f7572205365727669636520646f6573206e6f74206164647265737320616e796f6e6520756e6465722074686520616765206f662031332e20576520646f206e6f74206b6e6f77696e676c7920636f6c6c65637420706572736f6e616c6c79206964656e7469666961626c6520696e666f726d6174696f6e2066726f6d20616e796f6e6520756e6465722074686520616765206f662031332e20496620596f7520617265206120706172656e74206f7220677561726469616e20616e6420596f7520617265206177617265207468617420596f7572206368696c64206861732070726f7669646564205573207769746820506572736f6e616c20446174612c20706c6561736520636f6e746163742055732e204966205765206265636f6d652061776172652074686174205765206861766520636f6c6c656374656420506572736f6e616c20446174612066726f6d20616e796f6e6520756e6465722074686520616765206f6620313320776974686f757420766572696669636174696f6e206f6620706172656e74616c20636f6e73656e742c2057652074616b6520737465707320746f2072656d6f7665207468617420696e666f726d6174696f6e2066726f6d204f757220736572766572732e3c2f703e, NULL, NULL, '2023-08-19 23:56:10', '2024-06-08 09:05:59'),
(49, 25, 22, 'سياسة الخصوصية', 'سياسة-الخصوصية', 0x3c703ed9a12e20d8acd985d8b920d8a7d984d985d8b9d984d988d985d8a7d8aa3c2f703e0d0a3c703ed8aad8b5d98120d8b3d98ad8a7d8b3d8a920d8a7d984d8aed8b5d988d8b5d98ad8a920d987d8b0d98720d8b3d98ad8a7d8b3d8a7d8aad986d8a720d988d8a5d8acd8b1d8a7d8a1d8a7d8aad986d8a720d8a8d8b4d8a3d98620d8acd985d8b920d985d8b9d984d988d985d8a7d8aad98320d988d8a7d8b3d8aad8aed8afd8a7d985d987d8a720d988d8a7d984d983d8b4d98120d8b9d986d987d8a720d8b9d986d8af20d8a7d8b3d8aad8aed8afd8a7d98520d8a7d984d8aed8afd985d8a920d988d8aad8aed8a8d8b1d98320d8a8d8add982d988d98220d8a7d984d8aed8b5d988d8b5d98ad8a920d8a7d984d8aed8a7d8b5d8a920d8a8d98320d988d983d98ad98120d98ad8add985d98ad98320d8a7d984d982d8a7d986d988d9862e3c2f703e0d0a3c703ed986d8add98620d986d8b3d8aad8aed8afd98520d8a8d98ad8a7d986d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a920d984d8aad988d981d98ad8b120d8a7d984d8aed8afd985d8a920d988d8aad8add8b3d98ad986d987d8a72e20d8a8d8a7d8b3d8aad8aed8afd8a7d98520d8a7d984d8aed8afd985d8a9d88c20d981d8a5d986d98320d8aad988d8a7d981d98220d8b9d984d98920d8acd985d8b920d988d8a7d8b3d8aad8aed8afd8a7d98520d8a7d984d985d8b9d984d988d985d8a7d8aa20d988d981d982d98bd8a720d984d8b3d98ad8a7d8b3d8a920d8a7d984d8aed8b5d988d8b5d98ad8a920d987d8b0d9872e3c2f703e0d0a3c703ed9a22e20d8a7d984d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8b4d8aed8b5d98ad8a93c2f703e0d0a3c703ed8a3d8abd986d8a7d8a120d8a7d8b3d8aad8aed8afd8a7d98520d8aed8afd985d8aad986d8a7d88c20d982d8af20d986d8b7d984d8a820d985d986d98320d8aad8b2d988d98ad8afd986d8a720d8a8d8a8d8b9d8b620d985d8b9d984d988d985d8a7d8aa20d8a7d984d8aad8b9d8b1d98ad98120d8a7d984d8b4d8aed8b5d98ad8a920d8a7d984d8aad98a20d98ad985d983d98620d8a7d8b3d8aad8aed8afd8a7d985d987d8a720d984d984d8a7d8aad8b5d8a7d98420d8a8d98320d8a3d98820d8a7d984d8aad8b9d8b1d98120d8b9d984d98ad9832e20d982d8af20d8aad8aad8b6d985d98620d985d8b9d984d988d985d8a7d8aa20d8a7d984d8aad8b9d8b1d98ad98120d8a7d984d8b4d8aed8b5d98ad8a9d88c20d8b9d984d98920d8b3d8a8d98ad98420d8a7d984d985d8abd8a7d98420d984d8a720d8a7d984d8add8b5d8b1d88c20d985d8a720d98ad984d98a3a3c2f703e0d0a3c703ed8b9d986d988d8a7d98620d8a7d984d8a8d8b1d98ad8af20d8a7d984d8a5d984d983d8aad8b1d988d986d98a3c2f703e0d0a3c703ed8a7d984d8a7d8b3d98520d8a7d984d8a3d988d98420d988d8a7d8b3d98520d8a7d984d8b9d8a7d8a6d984d8a93c2f703e0d0a3c703ed8b1d982d98520d8a7d984d8aad984d98ad981d988d9863c2f703e0d0a3c703ed8a7d984d8b9d986d988d8a7d986d88c20d8a7d984d988d984d8a7d98ad8a9d88c20d8a7d984d985d982d8a7d8b7d8b9d8a9d88c20d8a7d984d8b1d985d8b220d8a7d984d8a8d8b1d98ad8afd98a2fd8a7d984d8b1d985d8b220d8a7d984d8a8d8b1d98ad8afd98ad88c20d8a7d984d985d8afd98ad986d8a93c2f703e0d0a3c703ed8a8d98ad8a7d986d8a7d8aa20d8a7d984d8a7d8b3d8aad8aed8afd8a7d9853c2f703e0d0a3c703ec2a03c2f703e0d0a3c703ed9a32e20d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8a7d8b3d8aad8aed8afd8a7d9853c2f703e0d0a3c703ed98ad8aad98520d8acd985d8b920d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8a7d8b3d8aad8aed8afd8a7d98520d8aad984d982d8a7d8a6d98ad98bd8a720d8b9d986d8af20d8a7d8b3d8aad8aed8afd8a7d98520d8a7d984d8aed8afd985d8a92e3c2f703e0d0a3c703ed982d8af20d8aad8aad8b6d985d98620d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8a7d8b3d8aad8aed8afd8a7d98520d985d8b9d984d988d985d8a7d8aa20d985d8abd98420d8b9d986d988d8a7d98620d8a8d8b1d988d8aad988d983d988d98420d8a7d984d8a5d986d8aad8b1d986d8aa20d8a7d984d8aed8a7d8b520d8a8d8acd987d8a7d8b2d9832028d985d8abd98420d8b9d986d988d8a7d98620495029d88c20d988d986d988d8b920d8a7d984d985d8aad8b5d981d8add88c20d988d8a5d8b5d8afd8a7d8b120d8a7d984d985d8aad8b5d981d8add88c20d988d8b5d981d8add8a7d8aa20d8aed8afd985d8aad986d8a720d8a7d984d8aad98a20d8aad8b2d988d8b1d987d8a7d88c20d988d988d982d8aa20d988d8aad8a7d8b1d98ad8ae20d8b2d98ad8a7d8b1d8aad983d88c20d988d8a7d984d988d982d8aa20d8a7d984d8b0d98a20d8aad982d8b6d98ad98720d981d98a20d8aad984d98320d8a7d984d8b5d981d8add8a7d8aad88c20d988d8a7d984d8acd987d8a7d8b220d8a7d984d981d8b1d98ad8af20d8a7d984d985d8b9d8b1d981d8a7d8aa20d988d8a7d984d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8aad8b4d8aed98ad8b5d98ad8a920d8a7d984d8a3d8aed8b1d9892e3c2f703e0d0a3c703ed8b9d986d8afd985d8a720d8aad8b5d98420d8a5d984d98920d8a7d984d8aed8afd985d8a920d8b9d98620d8b7d8b1d98ad98220d8a3d98820d985d98620d8aed984d8a7d98420d8acd987d8a7d8b220d985d8add985d988d984d88c20d982d8af20d986d982d988d98520d8a8d8acd985d8b920d985d8b9d984d988d985d8a7d8aa20d985d8b9d98ad986d8a920d8aad984d982d8a7d8a6d98ad98bd8a7d88c20d8a8d985d8a720d981d98a20d8b0d984d983d88c20d8b9d984d98920d8b3d8a8d98ad98420d8a7d984d985d8abd8a7d98420d984d8a720d8a7d984d8add8b5d8b1d88c20d986d988d8b920d8a7d984d8acd987d8a7d8b220d8a7d984d985d8add985d988d98420d8a7d984d8b0d98a20d8aad8b3d8aad8aed8afd985d987d88c20d988d8a7d984d985d8b9d8b1d98120d8a7d984d981d8b1d98ad8af20d984d8acd987d8a7d8b2d98320d8a7d984d985d8add985d988d984d88c20d988d8b9d986d988d8a7d98620495020d8a7d984d8aed8a7d8b520d8a8d8acd987d8a7d8b2d98320d8a7d984d985d8add985d988d984d88c20d988d987d8a7d8aad981d98320d8a7d984d985d8add985d988d9842e20d986d8b8d8a7d98520d8a7d984d8aad8b4d8bad98ad98420d988d986d988d8b920d985d8aad8b5d981d8ad20d8a7d984d8a5d986d8aad8b1d986d8aa20d8b9d8a8d8b120d8a7d984d987d8a7d8aad98120d8a7d984d985d8add985d988d98420d8a7d984d8b0d98a20d8aad8b3d8aad8aed8afd985d98720d988d985d8b9d8b1d981d8a7d8aa20d8a7d984d8acd987d8a7d8b220d8a7d984d981d8b1d98ad8afd8a920d988d8a7d984d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8aad8b4d8aed98ad8b5d98ad8a920d8a7d984d8a3d8aed8b1d9892e3c2f703e0d0a3c703ed98ad8acd988d8b220d984d986d8a720d8a3d98ad8b6d98bd8a720d8acd985d8b920d8a7d984d985d8b9d984d988d985d8a7d8aa20d8a7d984d8aad98a20d98ad8b1d8b3d984d987d8a720d985d8aad8b5d981d8add98320d8b9d986d8afd985d8a720d8aad8b2d988d8b120d8aed8afd985d8aad986d8a720d8a3d98820d8b9d986d8afd985d8a720d8aad8b5d98420d8a5d984d98920d8a7d984d8aed8afd985d8a920d8b9d98620d8b7d8b1d98ad98220d8acd987d8a7d8b220d985d8add985d988d98420d8a3d98820d985d98620d8aed984d8a7d984d9872e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c703ed9a42e20d8a7d984d8a7d8add8aad981d8a7d8b820d8a8d8a8d98ad8a7d986d8a7d8aad9833c2f703e0d0a3c703ed8b3d8aad8add8aad981d8b820d8a7d984d8b4d8b1d983d8a920d8a8d8a8d98ad8a7d986d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a920d981d982d8b720d8b7d8a7d984d985d8a720d983d8a7d98620d8b0d984d98320d8b6d8b1d988d8b1d98ad98bd8a720d984d984d8a3d8bad8b1d8a7d8b620d8a7d984d985d986d8b5d988d8b520d8b9d984d98ad987d8a720d981d98a20d8b3d98ad8a7d8b3d8a920d8a7d984d8aed8b5d988d8b5d98ad8a920d987d8b0d9872e20d8b3d986d8add8aad981d8b820d8a8d8a8d98ad8a7d986d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a920d988d986d8b3d8aad8aed8afd985d987d8a720d8a8d8a7d984d982d8afd8b120d8a7d984d984d8a7d8b2d98520d984d984d8a7d985d8aad8abd8a7d98420d984d8a7d984d8aad8b2d8a7d985d8a7d8aad986d8a720d8a7d984d982d8a7d986d988d986d98ad8a92028d8b9d984d98920d8b3d8a8d98ad98420d8a7d984d985d8abd8a7d984d88c20d8a5d8b0d8a720d8b7d98fd984d8a820d985d986d8a720d8a7d984d8a7d8add8aad981d8a7d8b820d8a8d8a8d98ad8a7d986d8a7d8aad98320d984d984d8a7d985d8aad8abd8a7d98420d984d984d982d988d8a7d986d98ad98620d8a7d984d985d8b9d985d988d98420d8a8d987d8a729d88c20d988d8add98420d8a7d984d986d8b2d8a7d8b9d8a7d8aad88c20d988d8a5d986d981d8a7d8b020d8a7d8aad981d8a7d982d98ad8a7d8aad986d8a720d988d8b3d98ad8a7d8b3d8a7d8aad986d8a720d8a7d984d982d8a7d986d988d986d98ad8a92e3c2f703e0d0a3c703ed8b3d8aad8add8aad981d8b820d8a7d984d8b4d8b1d983d8a920d8a3d98ad8b6d98bd8a720d8a8d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8a7d8b3d8aad8aed8afd8a7d98520d984d8a3d8bad8b1d8a7d8b620d8a7d984d8aad8add984d98ad98420d8a7d984d8afd8a7d8aed984d98a2e20d98ad8aad98520d8a7d984d8a7d8add8aad981d8a7d8b820d8a8d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8a7d8b3d8aad8aed8afd8a7d98520d8b9d985d988d985d98bd8a720d984d981d8aad8b1d8a920d8b2d985d986d98ad8a920d8a3d982d8b5d8b1d88c20d8a5d984d8a720d8b9d986d8afd985d8a720d98ad8aad98520d8a7d8b3d8aad8aed8afd8a7d98520d987d8b0d98720d8a7d984d8a8d98ad8a7d986d8a7d8aa20d984d8aad8b9d8b2d98ad8b220d8a7d984d8a3d985d8a7d98620d8a3d98820d984d8aad8add8b3d98ad98620d988d8b8d8a7d8a6d98120d8aed8afd985d8aad986d8a7d88c20d8a3d98820d8b9d986d8afd985d8a720d986d983d988d98620d985d984d8b2d985d98ad98620d982d8a7d986d988d986d98bd8a720d8a8d8a7d984d8a7d8add8aad981d8a7d8b820d8a8d987d8b0d98720d8a7d984d8a8d98ad8a7d986d8a7d8aa20d984d981d8aad8b1d8a7d8aa20d8b2d985d986d98ad8a920d8a3d8b7d988d9842e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c703ed9a52e20d986d982d98420d8a8d98ad8a7d986d8a7d8aad9833c2f703e0d0a3c703ed8aad8aad98520d985d8b9d8a7d984d8acd8a920d985d8b9d984d988d985d8a7d8aad983d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d8a7d984d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8b4d8aed8b5d98ad8a9d88c20d981d98a20d985d983d8a7d8aad8a820d8aad8b4d8bad98ad98420d8a7d984d8b4d8b1d983d8a920d988d981d98a20d8a3d98a20d8a3d985d8a7d983d98620d8a3d8aed8b1d98920d8aad8aad988d8a7d8acd8af20d981d98ad987d8a720d8a7d984d8a3d8b7d8b1d8a7d98120d8a7d984d985d8b4d8a7d8b1d983d8a920d981d98a20d8a7d984d985d8b9d8a7d984d8acd8a92e20d988d987d8b0d8a720d98ad8b9d986d98a20d8a3d986d98720d982d8af20d98ad8aad98520d986d982d98420d987d8b0d98720d8a7d984d985d8b9d984d988d985d8a7d8aa20d8a5d984d989202d20d988d8a7d984d8a7d8add8aad981d8a7d8b820d8a8d987d8a7202d20d8b9d984d98920d8a3d8acd987d8b2d8a920d8a7d984d983d985d8a8d98ad988d8aad8b120d8a7d984d985d988d8acd988d8afd8a920d8aed8a7d8b1d8ac20d988d984d8a7d98ad8aad98320d8a3d98820d985d982d8a7d8b7d8b9d8aad98320d8a3d98820d8a8d984d8afd98320d8a3d98820d8a3d98a20d988d984d8a7d98ad8a920d982d8b6d8a7d8a6d98ad8a920d8add983d988d985d98ad8a920d8a3d8aed8b1d98920d8add98ad8ab20d982d8af20d8aad8aed8aad984d98120d982d988d8a7d986d98ad98620d8add985d8a7d98ad8a920d8a7d984d8a8d98ad8a7d986d8a7d8aa20d8b9d98620d8aad984d98320d8a7d984d985d988d8acd988d8afd8a920d981d98a20d988d984d8a7d98ad8aad98320d8a7d984d982d8b6d8a7d8a6d98ad8a92e3c2f703e0d0a3c703ed8a5d98620d985d988d8a7d981d982d8aad98320d8b9d984d98920d8b3d98ad8a7d8b3d8a920d8a7d984d8aed8b5d988d8b5d98ad8a920d987d8b0d98720d985d8aad8a8d988d8b9d8a920d8a8d8aad982d8afd98ad985d98320d984d987d8b0d98720d8a7d984d985d8b9d984d988d985d8a7d8aa20d8aad985d8abd98420d985d988d8a7d981d982d8aad98320d8b9d984d98920d987d8b0d8a720d8a7d984d986d982d9842e3c2f703e0d0a3c703ed8b3d8aad8aad8aed8b020d8a7d984d8b4d8b1d983d8a920d8acd985d98ad8b920d8a7d984d8aed8b7d988d8a7d8aa20d8a7d984d8b6d8b1d988d8b1d98ad8a920d8a8d8b4d983d98420d985d8b9d982d988d98420d984d8b6d985d8a7d98620d8a7d984d8aad8b9d8a7d985d98420d985d8b920d8a8d98ad8a7d986d8a7d8aad98320d8a8d8b4d983d98420d8a2d985d98620d988d988d981d982d98bd8a720d984d8b3d98ad8a7d8b3d8a920d8a7d984d8aed8b5d988d8b5d98ad8a920d987d8b0d98720d988d984d98620d98ad8aad98520d986d982d98420d8a8d98ad8a7d986d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a920d8a5d984d98920d985d986d8b8d985d8a920d8a3d98820d8afd988d984d8a920d985d8a720d984d98520d8aad983d98620d987d986d8a7d98320d8b6d988d8a7d8a8d8b720d983d8a7d981d98ad8a920d985d8b7d8a8d982d8a920d8a8d985d8a720d981d98a20d8b0d984d98320d8a3d985d8a7d98620d8a8d98ad8a7d986d8a7d8aad98320d988d8a7d984d985d8b9d984d988d985d8a7d8aa20d8a7d984d8b4d8aed8b5d98ad8a920d8a7d984d8a3d8aed8b1d9892e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c703ed9a62e20d8a7d8add8b0d98120d8a8d98ad8a7d986d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a93c2f703e0d0a3c703ed984d8afd98ad98320d8a7d984d8add98220d981d98a20d8add8b0d98120d8a3d98820d8b7d984d8a820d8a7d984d985d8b3d8a7d8b9d8afd8a920d981d98a20d8add8b0d98120d8a7d984d8a8d98ad8a7d986d8a7d8aa20d8a7d984d8b4d8aed8b5d98ad8a920d8a7d984d8aad98a20d8acd985d8b9d986d8a7d987d8a720d8b9d986d9832e3c2f703e0d0a3c703ed982d8af20d8aad985d986d8add98320d8aed8afd985d8aad986d8a720d8a7d984d982d8afd8b1d8a920d8b9d984d98920d8add8b0d98120d985d8b9d984d988d985d8a7d8aa20d985d8b9d98ad986d8a920d8b9d986d98320d985d98620d8afd8a7d8aed98420d8a7d984d8aed8afd985d8a92e3c2f703e0d0a3c703ed98ad985d983d986d98320d8aad8add8afd98ad8ab20d985d8b9d984d988d985d8a7d8aad98320d8a3d98820d8aad8b9d8afd98ad984d987d8a720d8a3d98820d8add8b0d981d987d8a720d981d98a20d8a3d98a20d988d982d8aa20d8b9d98620d8b7d8b1d98ad98220d8aad8b3d8acd98ad98420d8a7d984d8afd8aed988d98420d8a5d984d98920d8add8b3d8a7d8a8d983d88c20d8a5d8b0d8a720d983d8a7d98620d984d8afd98ad98320d8add8b3d8a7d8a8d88c20d988d8b2d98ad8a7d8b1d8a920d982d8b3d98520d8a5d8b9d8afd8a7d8afd8a7d8aa20d8a7d984d8add8b3d8a7d8a820d8a7d984d8b0d98a20d98ad8b3d985d8ad20d984d98320d8a8d8a5d8afd8a7d8b1d8a920d985d8b9d984d988d985d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a92e20d98ad985d983d986d98320d8a3d98ad8b6d98bd8a720d8a7d984d8a7d8aad8b5d8a7d98420d8a8d986d8a720d984d8b7d984d8a820d8a7d984d988d8b5d988d98420d8a5d984d98920d8a3d98820d8aad8b5d8add98ad8ad20d8a3d98820d8add8b0d98120d8a3d98a20d985d8b9d984d988d985d8a7d8aa20d8b4d8aed8b5d98ad8a920d982d8afd985d8aad987d8a720d984d986d8a72e3c2f703e0d0a3c703ed988d985d8b920d8b0d984d983d88c20d98ad8b1d8acd98920d985d984d8a7d8add8b8d8a920d8a3d986d986d8a720d982d8af20d986d8add8aad8a7d8ac20d8a5d984d98920d8a7d984d8a7d8add8aad981d8a7d8b820d8a8d985d8b9d984d988d985d8a7d8aa20d985d8b9d98ad986d8a920d8b9d986d8afd985d8a720d98ad983d988d98620d984d8afd98ad986d8a720d8a7d984d8aad8b2d8a7d98520d982d8a7d986d988d986d98a20d8a3d98820d8a3d8b3d8a7d8b320d982d8a7d986d988d986d98a20d984d984d982d98ad8a7d98520d8a8d8b0d984d9832e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c703ed9a72e20d8a7d984d985d8b9d8a7d985d984d8a7d8aa20d8a7d984d8aad8acd8a7d8b1d98ad8a93c2f703e0d0a3c703ed8a5d8b0d8a720d983d8a7d986d8aa20d8a7d984d8b4d8b1d983d8a920d985d8aad988d8b1d8b7d8a920d981d98a20d8b9d985d984d98ad8a920d8afd985d8ac20d8a3d98820d8a7d8b3d8aad8add988d8a7d8b020d8a3d98820d8a8d98ad8b920d8a3d8b5d988d984d88c20d981d982d8af20d98ad8aad98520d986d982d98420d8a8d98ad8a7d986d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a92e20d8b3d986d982d8afd98520d8a5d8b4d8b9d8a7d8b1d98bd8a720d982d8a8d98420d986d982d98420d8a8d98ad8a7d986d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a920d988d982d8a8d98420d8a3d98620d8aad8b5d8a8d8ad20d8aed8a7d8b6d8b9d8a920d984d8b3d98ad8a7d8b3d8a920d8aed8b5d988d8b5d98ad8a920d985d8aed8aad984d981d8a92e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c703ed9a82e20d8a3d985d8a7d98620d8a8d98ad8a7d986d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a93c2f703e0d0a3c703ed98ad8b9d8af20d8a3d985d8a7d98620d8a8d98ad8a7d986d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a920d8a3d985d8b1d98bd8a720d985d987d985d98bd8a720d8a8d8a7d984d986d8b3d8a8d8a920d984d986d8a7d88c20d988d984d983d98620d8aad8b0d983d8b120d8a3d986d98720d984d8a720d8aad988d8acd8af20d8b7d8b1d98ad982d8a920d986d982d98420d8b9d8a8d8b120d8a7d984d8a5d986d8aad8b1d986d8aa20d8a3d98820d8b7d8b1d98ad982d8a920d8aad8aed8b2d98ad98620d8a5d984d983d8aad8b1d988d986d98ad8a920d8a2d985d986d8a920d8a8d986d8b3d8a8d8a920313030252e20d8a8d98ad986d985d8a720d986d8b3d8b9d98920d8acd8a7d987d8afd98ad98620d984d8a7d8b3d8aad8aed8afd8a7d98520d988d8b3d8a7d8a6d98420d985d982d8a8d988d984d8a920d8aad8acd8a7d8b1d98ad98bd8a720d984d8add985d8a7d98ad8a920d8a8d98ad8a7d986d8a7d8aad98320d8a7d984d8b4d8aed8b5d98ad8a9d88c20d984d8a720d98ad985d983d986d986d8a720d8b6d985d8a7d98620d8a3d985d8a7d986d987d8a720d8a7d984d985d8b7d984d9822e3c2f703e0d0a3c703ed8aed8b5d988d8b5d98ad8a920d8a7d984d8a3d8b7d981d8a7d9843c2f703e0d0a3c703ed984d8a720d8aad8aad986d8a7d988d98420d8aed8afd985d8aad986d8a720d8a3d98a20d8b4d8aed8b520d98ad982d98420d8b9d985d8b1d98720d8b9d98620313320d8b9d8a7d985d98bd8a72e20d986d8add98620d984d8a720d986d8acd985d8b920d985d8b9d984d988d985d8a7d8aa20d8a7d984d8aad8b9d8b1d98ad98120d8a7d984d8b4d8aed8b5d98ad8a920d8b9d98620d982d8b5d8af20d985d98620d8a3d98a20d8b4d8aed8b520d98ad982d98420d8b9d985d8b1d98720d8b9d98620313320d8b9d8a7d985d98bd8a72e20d8a5d8b0d8a720d983d986d8aa20d8a3d8add8af20d8a7d984d988d8a7d984d8afd98ad98620d8a3d98820d8a7d984d988d8b5d98a20d988d983d986d8aa20d8b9d984d98920d8b9d984d98520d8a8d8a3d98620d8b7d981d984d98320d982d8af20d8b2d988d8afd986d8a720d8a8d8a8d98ad8a7d986d8a7d8aa20d8b4d8aed8b5d98ad8a9d88c20d981d98ad8b1d8acd98920d8a7d8aad8b5d98420d8a8d986d8a72e20d8a5d8b0d8a720d8b9d984d985d986d8a720d8a3d986d986d8a720d982d985d986d8a720d8a8d8acd985d8b920d8a8d98ad8a7d986d8a7d8aa20d8b4d8aed8b5d98ad8a920d985d98620d8a3d98a20d8b4d8aed8b520d98ad982d98420d8b9d985d8b1d98720d8b9d98620313320d8b9d8a7d985d98bd8a720d8afd988d98620d8a7d984d8aad8add982d98220d985d98620d8b0d984d9833c2f703e, NULL, NULL, '2024-05-09 05:45:02', '2024-06-08 09:05:59'),
(50, 25, 21, 'الشروط والأحكام', 'الشروط-والأحكام', 0x3c703ed985d8b1d8add8a8d8a720d8a8d983d98520d981d98a20d8a5d8b3d8aad8a7d8aad98a2e20d8aad8add8afd8af20d987d8b0d98720d8a7d984d8b4d8b1d988d8b720d988d8a7d984d8a3d8add983d8a7d98520d8a7d984d982d988d8a7d8b9d8af20d988d8a7d984d984d988d8a7d8a6d8ad20d8a7d984d8aed8a7d8b5d8a920d8a8d8a7d8b3d8aad8aed8afd8a7d98520d985d988d982d8b9d986d8a72e3c2f703e0d0a3c703e3c7374726f6e673ed9a13c2f7374726f6e673e2e20d982d8a8d988d98420d8a7d984d8b4d8b1d988d8b73c2f703e0d0a3c703ed985d98620d8aed984d8a7d98420d8a7d984d988d8b5d988d98420d8a5d984d98920d985d988d982d8b9d986d8a720d988d8a7d8b3d8aad8aed8afd8a7d985d987d88c20d981d8a5d986d98320d8aad988d8a7d981d98220d8b9d984d98920d8a7d984d8a7d984d8aad8b2d8a7d98520d8a8d987d8b0d98720d8a7d984d8b4d8b1d988d8b720d988d8a7d984d8a3d8add983d8a7d9852e20d8a5d8b0d8a720d983d986d8aa20d984d8a720d8aad988d8a7d981d98220d8b9d984d98920d987d8b0d98720d8a7d984d8b4d8b1d988d8b720d988d8a7d984d8a3d8add983d8a7d985d88c20d981d98ad8acd8a820d8b9d984d98ad98320d8b9d8afd98520d8a7d8b3d8aad8aed8afd8a7d98520d985d988d982d8b9d986d8a72e3c2f703e0d0a3c703ed9a22e20d8a7d984d985d984d983d98ad8a920d8a7d984d981d983d8b1d98ad8a93c2f703e0d0a3c703ed8acd985d98ad8b920d8add982d988d98220d8a7d984d985d984d983d98ad8a920d8a7d984d981d983d8b1d98ad8a920d981d98a20d8a7d984d985d988d982d8b920d988d8a7d984d985d8add8aad988d98920d8a7d984d985d986d8b4d988d8b120d8b9d984d98ad987d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d8b9d984d98920d8b3d8a8d98ad98420d8a7d984d985d8abd8a7d98420d984d8a720d8a7d984d8add8b5d8b120d8add982d988d98220d8a7d984d8b7d8a8d8b920d988d8a7d984d986d8b4d8b120d988d8a7d984d8b9d984d8a7d985d8a7d8aa20d8a7d984d8aad8acd8a7d8b1d98ad8a9d88c20d985d985d984d988d983d8a920d984d986d8a720d8a3d98820d984d985d8b1d8aed8b5d98ad986d8a72e20d984d8a720d98ad8acd988d8b220d984d98320d8a7d8b3d8aad8aed8afd8a7d98520d8a3d98a20d985d98620d985d984d983d98ad8aad986d8a720d8a7d984d981d983d8b1d98ad8a920d8afd988d98620d8a7d984d8add8b5d988d98420d8b9d984d98920d985d988d8a7d981d982d8a920d983d8aad8a7d8a8d98ad8a920d985d8b3d8a8d982d8a920d985d986d8a72e3c2f703e0d0a3c703ed9a32e20d985d8add8aad988d98920d8a7d984d985d8b3d8aad8aed8afd9853c2f703e0d0a3c703ed985d98620d8aed984d8a7d98420d8aad982d8afd98ad98520d8a3d98a20d985d8add8aad988d98920d8a5d984d98920d985d988d982d8b9d986d8a7d88c20d981d8a5d986d98320d8aad985d986d8add986d8a720d8aad8b1d8aed98ad8b5d98bd8a720d8b9d8a7d984d985d98ad98bd8a720d988d8bad98ad8b120d8add8b5d8b1d98a20d988d8aed8a7d984d98a20d985d98620d8add982d988d98220d8a7d984d985d984d983d98ad8a920d984d8a7d8b3d8aad8aed8afd8a7d98520d987d8b0d8a720d8a7d984d985d8add8aad988d98920d988d8a5d8b9d8a7d8afd8a920d8a5d986d8aad8a7d8acd98720d988d8aad988d8b2d98ad8b9d98720d988d8b9d8b1d8b6d98720d8a8d8a3d98a20d8aad986d8b3d98ad98220d988d8b3d8a7d8a6d8b720d988d985d98620d8aed984d8a7d98420d8a3d98a20d982d986d988d8a7d8aa20d8a5d8b9d984d8a7d985d98ad8a92e3c2f703e0d0a3c703ed9a42e20d8a5d8aed984d8a7d8a120d8a7d984d985d8b3d8a4d988d984d98ad8a920d8b9d98620d8a7d984d8b6d985d8a7d986d8a7d8aa3c2f703e0d0a3c703ed98ad8aad98520d8aad988d981d98ad8b120d985d988d982d8b9d986d8a720d8a7d984d8a5d984d983d8aad8b1d988d986d98a20d988d8a7d984d985d8add8aad988d98920d8a7d984d985d986d8b4d988d8b120d8b9d984d98ad9872022d983d985d8a720d987d9882220d98822d983d985d8a720d987d98820d985d8aad8a7d8ad222e20d986d8add98620d984d8a720d986d982d8afd98520d8a3d98a20d8b6d985d8a7d986d8a7d8aad88c20d8b5d8b1d98ad8add8a920d8a3d98820d8b6d985d986d98ad8a9d88c20d981d98ad985d8a720d98ad8aad8b9d984d98220d8a8d8a7d984d985d988d982d8b9d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d8b9d984d98920d8b3d8a8d98ad98420d8a7d984d985d8abd8a7d98420d984d8a720d8a7d984d8add8b5d8b1d88c20d8afd982d8a920d8a7d984d985d8add8aad988d98920d8a3d98820d985d988d8abd988d982d98ad8aad98720d8a3d98820d985d984d8a7d8a1d985d8aad98720d984d8a3d98a20d8bad8b1d8b620d985d8b9d98ad9862e3c2f703e0d0a3c703ed9a52e20d8add8afd988d8af20d8a7d984d985d8b3d8a4d988d984d98ad8a93c2f703e0d0a3c703ed984d98620d986d983d988d98620d985d8b3d8a4d988d984d98ad98620d8b9d98620d8a3d98a20d8a3d8b6d8b1d8a7d8b1d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d8b9d984d98920d8b3d8a8d98ad98420d8a7d984d985d8abd8a7d98420d984d8a720d8a7d984d8add8b5d8b1d88c20d8a7d984d8a3d8b6d8b1d8a7d8b120d8a7d984d985d8a8d8a7d8b4d8b1d8a920d988d8bad98ad8b120d8a7d984d985d8a8d8a7d8b4d8b1d8a920d988d8a7d984d8b9d8b1d8b6d98ad8a920d988d8a7d984d8b9d982d8a7d8a8d98ad8a920d988d8a7d984d8aad8a8d8b9d98ad8a9d88c20d8a7d984d986d8a7d8b4d8a6d8a920d8b9d98620d8a7d8b3d8aad8aed8afd8a7d98520d8a3d98820d8b9d8afd98520d8a7d984d982d8afd8b1d8a920d8b9d984d98920d8a7d8b3d8aad8aed8afd8a7d98520d985d988d982d8b9d986d8a720d8a7d984d8a5d984d983d8aad8b1d988d986d98a20d8a3d98820d8a7d984d985d8add8aad988d98920d8a7d984d985d986d8b4d988d8b120d8b9d984d98ad9872e3c2f703e0d0a3c703ed9a62e20d8aad8b9d8afd98ad984d8a7d8aa20d8b9d984d98920d8a7d984d8b4d8b1d988d8b720d988d8a7d984d8a3d8add983d8a7d9853c2f703e0d0a3c703ed986d8add98620d986d8add8aad981d8b820d8a8d8a7d984d8add98220d981d98a20d8aad8b9d8afd98ad98420d987d8b0d98720d8a7d984d8b4d8b1d988d8b720d988d8a7d984d8a3d8add983d8a7d98520d981d98a20d8a3d98a20d988d982d8aa20d8afd988d98620d8a5d8b4d8b9d8a7d8b120d985d8b3d8a8d9822e20d8a5d98620d8a7d8b3d8aad985d8b1d8a7d8b1d98320d981d98a20d8a7d8b3d8aad8aed8afd8a7d98520d985d988d982d8b9d986d8a720d8a8d8b9d8af20d8a5d8acd8b1d8a7d8a120d8a3d98a20d8aad8b9d8afd98ad984d8a7d8aa20d985d98620d987d8b0d8a720d8a7d984d982d8a8d98ad98420d98ad8b4d98ad8b120d8a5d984d98920d985d988d8a7d981d982d8aad98320d8b9d984d98920d8a7d984d8b4d8b1d988d8b720d988d8a7d984d8a3d8add983d8a7d98520d8a7d984d985d8b9d8afd984d8a92e3c2f703e0d0a3c703ed9a72e20d8a7d984d982d8a7d986d988d98620d8a7d984d8add8a7d983d98520d988d8a7d984d8a7d8aed8aad8b5d8a7d8b520d8a7d984d982d8b6d8a7d8a6d98a3c2f703e0d0a3c703ed8aad8aed8b6d8b920d987d8b0d98720d8a7d984d8b4d8b1d988d8b720d988d8a7d984d8a3d8add983d8a7d98520d988d8aad981d8b3d8b120d988d981d982d98bd8a720d984d982d988d8a7d986d98ad98620d8a7d984d988d984d8a7d98ad8a920d8a7d984d982d8b6d8a7d8a6d98ad8a920d8a7d984d8aad98a20d986d8b9d985d98420d981d98ad987d8a7d88c20d8afd988d98620d8aad981d8b9d98ad98420d8a3d98a20d985d8a8d8a7d8afd8a620d8aad8aad8b9d984d98220d8a8d8aad8b9d8a7d8b1d8b620d8a7d984d982d988d8a7d986d98ad9862e20d98ad8acd8a820d8b1d981d8b920d8a3d98a20d8a5d8acd8b1d8a7d8a1d8a7d8aa20d982d8a7d986d988d986d98ad8a920d986d8a7d8b4d8a6d8a920d8b9d98620d987d8b0d98720d8a7d984d8b4d8b1d988d8b720d988d8a7d984d8a3d8add983d8a7d98520d8a3d98820d981d98ad985d8a720d98ad8aad8b9d984d98220d8a8d987d8a720d981d982d8b720d981d98a20d8a7d984d985d8add8a7d983d98520d8a7d984d988d8a7d982d8b9d8a920d981d98a20d986d8b7d8a7d98220d8a7d984d988d984d8a7d98ad8a920d8a7d984d982d8b6d8a7d8a6d98ad8a920d8a7d984d8aad98a20d986d8b9d985d98420d981d98ad987d8a72e3c2f703e0d0a3c703ed9a82e20d8a7d984d8a5d986d987d8a7d8a13c2f703e0d0a3c703ed984d98620d986d983d988d98620d985d8b3d8a4d988d984d98ad98620d8b9d98620d8a3d98a20d8a3d8b6d8b1d8a7d8b1d88c20d8a8d985d8a720d981d98a20d8b0d984d98320d8b9d984d98920d8b3d8a8d98ad98420d8a7d984d985d8abd8a7d98420d984d8a720d8a7d984d8add8b5d8b1d88c20d8a7d984d8a3d8b6d8b1d8a7d8b120d8a7d984d985d8a8d8a7d8b4d8b1d8a920d988d8bad98ad8b120d8a7d984d985d8a8d8a7d8b4d8b1d8a920d988d8a7d984d8b9d8b1d8b6d98ad8a920d988d8a7d984d8b9d982d8a7d8a8d98ad8a920d988d8a7d984d8aad8a8d8b9d98ad8a9d88c20d8a7d984d986d8a7d8b4d8a6d8a920d8b9d98620d8a7d8b3d8aad8aed8afd8a7d98520d8a3d98820d8b9d8afd98520d8a7d984d982d8afd8b1d8a920d8b9d984d98920d8a7d8b3d8aad8aed8afd8a7d98520d985d988d982d8b9d986d8a720d8a7d984d8a5d984d983d8aad8b1d988d986d98a20d8a3d98820d8a7d984d985d8add8aad988d98920d8a7d984d985d986d8b4d988d8b120d8b9d984d98ad9872e3c2f703e0d0a3c703ed9a92e20d985d8b9d984d988d985d8a7d8aa20d8a7d984d8a7d8aad8b5d8a7d9843c2f703e0d0a3c703ed8a5d8b0d8a720d983d8a7d98620d984d8afd98ad98320d8a3d98a20d8a3d8b3d8a6d984d8a920d8a3d98820d8aad8b9d984d98ad982d8a7d8aa20d8add988d98420d987d8b0d98720d8a7d984d8b4d8b1d988d8b720d988d8a7d984d8a3d8add983d8a7d985d88c20d98ad8b1d8acd98920d8a7d984d8a7d8aad8b5d8a7d98420d8a8d986d8a720d8b9d984d98920696e666f406573746174792e636f6d2e3c2f703e, NULL, NULL, '2024-06-06 04:45:44', '2024-06-08 08:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `page_headings`
--

CREATE TABLE `page_headings` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `property_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `project_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `agent_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `agent_login_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pricing_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `wishlist_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `blog_page_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_page_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `error_page_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `faq_page_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `forget_password_page_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `vendor_forget_password_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `login_page_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `signup_page_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `vendor_login_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `vendor_signup_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `agent_forget_password_page_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `vendor_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `about_us_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dashboard_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `support_ticket_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `support_ticket_create_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `change_password_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `edit_profile_page_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `page_headings`
--

INSERT INTO `page_headings` (`id`, `language_id`, `property_page_title`, `project_page_title`, `agent_page_title`, `agent_login_page_title`, `pricing_page_title`, `wishlist_page_title`, `blog_page_title`, `contact_page_title`, `error_page_title`, `faq_page_title`, `forget_password_page_title`, `vendor_forget_password_page_title`, `login_page_title`, `signup_page_title`, `vendor_login_page_title`, `vendor_signup_page_title`, `agent_forget_password_page_title`, `vendor_page_title`, `about_us_title`, `dashboard_page_title`, `support_ticket_page_title`, `support_ticket_create_page_title`, `change_password_page_title`, `edit_profile_page_title`, `created_at`, `updated_at`) VALUES
(9, 20, 'Properties', 'Projects', 'Agent', 'Agent Login', 'Pricing', 'Wishlist Page', 'Blog', 'Contact', '404', 'FAQ', 'Forget Password', 'Forget Password', 'Login', 'Signup', 'Vendor Login', 'Vendor Signup', 'Cart', 'Vendors', 'About Us', 'Dashboard', 'Support Tickets', 'Create a Support Ticket', 'Change Password', 'Edit Profile', '2023-08-27 01:23:22', '2024-04-22 04:18:31'),
(10, 25, 'صفحة الملكية', 'صفحة المشروع', 'صفحة الوكيل', 'صفحة تسجيل دخول الوكيل', 'صفحة التسعير', NULL, 'مدونة', 'اتصال', '٤۰٤', 'التعليمات', 'صفحة نسيان المستخدم', 'البائع نسيت كلمة المرور', 'صفحة تسجيل دخول المستخدم', 'صفحة تسجيل المستخدم', 'صفحة تسجيل دخول البائع', 'صفحة تسجيل البائع', 'وكيل ننسى الصفحة', 'صفحة البائعين', 'صفحة عنا', 'لوحة القيادة', 'بطاقة الدعم', 'إنشاء تذكرة الدعم', 'تغيير كلمة المرور', 'تعديل الملف الشخصي', '2024-03-26 23:05:05', '2024-03-26 23:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_invoices`
--

CREATE TABLE `payment_invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `InvoiceId` bigint UNSIGNED NOT NULL,
  `InvoiceStatus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InvoiceValue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InvoiceDisplayValue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TransactionId` bigint UNSIGNED NOT NULL,
  `TransactionStatus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentGateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentId` bigint UNSIGNED NOT NULL,
  `CardNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popups`
--

CREATE TABLE `popups` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `type` smallint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `background_color` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `background_color_opacity` decimal(3,2) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb3_unicode_ci,
  `button_text` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `button_color` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `button_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `delay` int UNSIGNED NOT NULL COMMENT 'value will be in milliseconds',
  `serial_number` mediumint UNSIGNED NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '0 => deactive, 1 => active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `popups`
--

INSERT INTO `popups` (`id`, `language_id`, `type`, `image`, `name`, `background_color`, `background_color_opacity`, `title`, `text`, `button_text`, `button_color`, `button_url`, `end_date`, `end_time`, `delay`, `serial_number`, `status`, `created_at`, `updated_at`) VALUES
(20, 20, 1, '65bb7b1c0383b.png', 'Black Friday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1500, 1, 0, '2023-08-20 00:17:21', '2024-06-06 08:14:07'),
(21, 20, 2, '65bb7abf0354e.png', 'Month End Sale', 'EE1243', 0.80, 'ENJOY 10% OFF', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', 'Get Offer', 'EE1243', NULL, NULL, NULL, 2000, 2, 0, '2023-08-20 00:51:51', '2024-06-06 08:14:01'),
(22, 20, 3, '65bb7b08712ef.png', 'Summer Offer', 'EE1243', 0.70, 'Newsletter', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', 'Subscribe', 'EE1243', NULL, NULL, NULL, 2000, 3, 0, '2023-08-20 00:54:50', '2024-06-06 08:14:43'),
(23, 20, 4, '65bb6c2b9c0fa.png', 'Winter Offer', NULL, NULL, 'Get 10% off your sign up', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt', 'Sign up', 'EE1243', NULL, NULL, NULL, 2000, 4, 0, '2023-08-20 00:57:30', '2024-06-06 08:13:58'),
(24, 20, 5, '65bb6bd20536d.png', 'Email Popup', NULL, NULL, 'Get 10% off your first package purchase', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt', 'Subscribe', '3D8774', NULL, NULL, NULL, 2000, 5, 1, '2023-08-20 00:59:22', '2024-06-06 08:14:47'),
(25, 20, 6, '65bb7bfb2c04c.png', 'Countdown Popup', NULL, NULL, 'Hurry, Sale Ends This Friday', 'This is your last chance to save 30%', 'Yes,I Want to Save 30%', 'EE1243', NULL, '2029-12-27', '12:30:00', 2000, 6, 0, '2023-08-20 01:00:55', '2024-06-06 08:13:51'),
(26, 20, 7, '65bb6c1533f65.png', 'Flash Deals', 'EE1243', NULL, 'Hurry, Sale Ends This Friday', 'This is your last chance to save 30%', 'Yes, I Want to Save 30%', 'A50C2E', NULL, '2029-11-29', '01:00:00', 2000, 7, 0, '2023-08-20 01:03:34', '2024-06-08 11:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `pricing_sections`
--

CREATE TABLE `pricing_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricing_sections`
--

INSERT INTO `pricing_sections` (`id`, `language_id`, `title`, `subtitle`, `description`, `created_at`, `updated_at`) VALUES
(1, 20, 'Pricing Plan', 'Choose Best Price', 'Curabitur non nulla sit amet nisl tempus lectus Nulla porttitor accumsan tincidunt.', '2024-01-26 22:11:31', '2024-05-14 05:09:44'),
(2, 25, 'خطة التسعير', 'اختر أفضل الأسعار', 'بصورة أكثر عقلانية ومنطقية فيعرضهم هذا لمواجهة الظروف الأليمة، وأكرر بأنه', '2024-06-14 08:04:40', '2024-06-14 08:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `agent_id` int NOT NULL DEFAULT '0',
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_price` decimal(15,2) DEFAULT NULL,
  `max_price` decimal(15,2) DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` int DEFAULT '0',
  `status` int DEFAULT '0' COMMENT '0= under construction, 1 = complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approve_status` int NOT NULL COMMENT '1== approved,0=pending,2=rejected'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `vendor_id`, `agent_id`, `featured_image`, `min_price`, `max_price`, `latitude`, `longitude`, `featured`, `status`, `created_at`, `updated_at`, `approve_status`) VALUES
(39, 0, 0, '6666e58be1a1d.jpg', 150000.00, 199999.00, '51.45425885634265', '-112.69963862075501', 1, 1, '2024-06-10 11:37:47', '2024-06-10 11:37:47', 1),
(40, 39, 0, '6666e64958d05.jpg', 12000.00, 20000.00, '51.456344835738584', '-112.69518321192706', 0, 0, '2024-06-10 11:40:57', '2024-06-12 11:00:23', 1),
(41, 36, 0, '6667d79b5b213.jpg', 24845.00, 352854.00, '29.388992432210728', '-98.50296980042975', 0, 1, '2024-06-11 04:50:35', '2024-06-12 10:57:50', 1),
(42, 37, 0, '6667d8a700c18.jpg', 26542.00, 64645.00, '29.388736955825376', '-98.50198190900839', 0, 1, '2024-06-11 04:55:03', '2024-06-12 10:57:47', 1),
(43, 36, 0, '6667dbfd93016.jpg', 12542.00, 78524.00, '29.38818276638411', '-98.50151728427598', 0, 1, '2024-06-11 05:09:17', '2024-06-12 10:57:44', 1),
(44, 35, 0, '6667e0ba713b1.jpg', 25648.00, 87612.00, '29.375183691576392', '-98.46315708977001', 1, 0, '2024-06-11 05:29:30', '2024-06-13 07:22:46', 1),
(45, 0, 26, '6667e1c48d848.jpg', 246545.00, 58215.00, '29.36536988651297', '-98.48167485573403', 1, 1, '2024-06-11 05:33:56', '2024-06-13 10:05:10', 1),
(46, 0, 26, '666abe2a61978.png', 2841.00, 325485.00, NULL, NULL, 0, 1, '2024-06-13 09:38:50', '2024-06-13 10:04:41', 1),
(47, 39, 22, '666abf8a016c2.jpg', 28455.00, 658784.00, NULL, NULL, 0, 0, '2024-06-13 09:44:42', '2024-06-13 09:49:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_contents`
--

CREATE TABLE `project_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `project_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `meta_keyword` text COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_contents`
--

INSERT INTO `project_contents` (`id`, `language_id`, `project_id`, `title`, `slug`, `address`, `description`, `meta_keyword`, `meta_description`, `created_at`, `updated_at`) VALUES
(68, 20, 39, 'Sanga City Tower', 'sanga-city-tower', '40123 New work, Duff Avenue South Burlington', '<div class=\"about-this-home\">\r\n<div class=\"ldp-description-text-container truncate-container\">\r\n<p class=\"ldp-description-text\">BY APPOINTMENTS ONLY !! 2-bedroom, 2-bathroom manufactured home in the heart of Sweetwater, FL 33172. Nestled in a central location, this residence offers convenience to nearby shopping plazas, ensuring that daily errands and retail therapy are just moments away. The home itself boasts a cozy and welcoming ambiance, with ample space for relaxation and entertaining. The well-appointed bedrooms provide comfort and privacy, while the bathrooms are modern and stylish. Whether you\'re enjoying the local amenities or unwinding in your own oasis, this manufactured home offers the perfect blend of comfort and convenience in a desirable location.</p>\r\n</div>\r\n</div>\r\n<div class=\"cta-container\"> The home itself boasts a cozy and welcoming ambiance, with ample space for relaxation and entertaining. The well-appointed bedrooms provide comfort and privacy, while the bathrooms are modern and stylish.The main roads give residents immediate access to public transportation, convenient shopping plazas, major entertainment and delectable eateries. So, whether you need to grab groceries from Sedano\'s or Publix, you\'re only minutes away. The same goes for catching the bus or grabbing a bite from a local favorite like Maruchi — a no-frills Cuban joint that serves up everything from Cuban sandwiches to ropa vieja. Due north, historic staple and entertainment mecca Hialeah Park Casino is also moments away. Formerly a greyhound</div>', NULL, NULL, '2024-06-10 11:37:47', '2024-06-13 09:09:54'),
(69, 25, 39, 'برج مدينة سانجا', 'برج-مدينة-سانجا', 'عمل جديد، شارع داف جنوب برلينجتون', '<p>عن طريق المواعيد فقط !! منزل مُصنع مكون من غرفتي نوم وحمامين في قلب سويتواتر، فلوريدا 33172. يقع هذا السكن في موقع مركزي، ويوفر الراحة لساحات التسوق القريبة، مما يضمن أن المهمات اليومية والعلاج بالتجزئة على بعد لحظات فقط. يتميز المنزل نفسه بأجواء مريحة وترحيبية، مع مساحة واسعة للاسترخاء والترفيه. توفر غرف النوم المجهزة تجهيزاً جيداً الراحة والخصوصية، في حين أن الحمامات حديثة وأنيقة. سواء كنت تستمتع بوسائل الراحة المحلية أو تسترخي في واحتك الخاصة، فإن هذا المنزل المصنّع يوفر مزيجًا مثاليًا من الراحة والملاءمة في موقع مرغوب فيه.</p>\r\n<p>يتميز المنزل نفسه بأجواء مريحة وترحيبية، مع مساحة واسعة للاسترخاء والترفيه. توفر غرف النوم المجهزة تجهيزًا جيدًا الراحة والخصوصية، في حين أن الحمامات حديثة وأنيقة. توفر الطرق الرئيسية للمقيمين إمكانية الوصول الفوري إلى وسائل النقل العام وساحات التسوق المريحة ووسائل الترفيه الرئيسية والمطاعم اللذيذة. لذلك، سواء كنت بحاجة إلى شراء البقالة من أو، فأنت على بعد دقائق فقط. وينطبق الشيء نفسه على ركوب الحافلة أو تناول وجبة خفيفة من أحد المأكولات المحلية المفضلة مثل ماروتشي - وهو مطعم كوبي بسيط يقدم كل شيء بدءًا من السندويشات الكوبية وحتى روبا فيجا. باتجاه الشمال، يقع المركز التاريخي والترفيهي mecc أيضًا على بعد لحظات. السلوقي سابقا</p>', NULL, NULL, '2024-06-10 11:37:47', '2024-06-13 09:09:54'),
(70, 20, 40, 'Whispering Pines Village', 'whispering-pines-village', 'Drumheller, AB T0J 0Y5, Canada', '<p>Own a lanai apartment with a delightful 97\' patio, tax roll initially designated it as a 2/2 with 1409 sq ft, but it has been modified to a 1/1.5 with an extra den (bedroom). The updated kitchen features new appliances, and ample storage space with a hookup for a washer and dryer.<br />This meticulously maintained unit offers a flexible layout, providing an option to move in seamlessly. The open floor plan connects living and dining areas, creating an ideal space for entertainment or relaxation. Beyond the interior, the lanai apartment offers a unique outdoor experience. The 97\' patio extends your living space, perfect for enjoying the tropical climate.<br />A private gateway to the pool and steps away from the beach provides convenient leisure opportunities. Paradise awaits in your new lanai!</p>', NULL, NULL, '2024-06-10 11:40:57', '2024-06-10 11:40:57'),
(71, 25, 40, 'قرية ويسبيرنج باينز', 'قرية-ويسبيرنج-باينز', 'درومهيلر، كندا', '<p>امتلك شقة لاناي مع فناء مبهج بمساحة 97 قدمًا، وقد حددتها قائمة الضرائب في البداية على أنها 2/2 بمساحة 1409 قدمًا مربعًا، ولكن تم تعديلها إلى 1 / 1.5 مع غرفة نوم إضافية. يتميز المطبخ المحدث بأجهزة جديدة ومساحة تخزين واسعة مع وصلة لغسالة ومجفف.<br />توفر هذه الوحدة التي تمت صيانتها بدقة تصميمًا مرنًا، مما يوفر خيارًا للتحرك بسلاسة. يربط مخطط الطابق المفتوح بين مناطق المعيشة وتناول الطعام، مما يخلق مساحة مثالية للترفيه أو الاسترخاء. بالإضافة إلى التصميم الداخلي، توفر شقة الشرفة تجربة فريدة من نوعها في الهواء الطلق. يوسع الفناء الذي تبلغ مساحته 97 قدمًا مساحة معيشتك، وهو مثالي للاستمتاع بالمناخ الاستوائي.<br />توفر البوابة الخاصة للمسبح والتي تقع على بعد خطوات من الشاطئ فرصًا ترفيهية مريحة. الجنة تنتظرك في شرفتك الجديدة!</p>\r\n<p> </p>\r\n<p>توفر هذه الوحدة التي تمت صيانتها بدقة تصميمًا مرنًا، مما يوفر خيارًا للتحرك بسلاسة. يربط مخطط الطابق المفتوح بين مناطق المعيشة وتناول الطعام، مما يخلق مساحة مثالية للترفيه أو الاسترخاء. بالإضافة إلى التصميم الداخلي، توفر شقة الشرفة تجربة فريدة من نوعها في الهواء الطلق. يوسع الفناء الذي تبلغ مساحته 97 قدمًا مساحة معيشتك، وهو مثالي للاستمتاع بالمناخ</p>', NULL, NULL, '2024-06-10 11:40:57', '2024-06-13 09:06:56'),
(72, 20, 41, 'Urban Oasis Residences', 'urban-oasis-residences', 'San Antonio, TX 78204, USA', '<p style=\"line-height:1.5;\"><span style=\"font-size:14pt;\">**THIS HOME FEATURES OVER $59,000 IN UPGRADES!** The Driskill is an exciting new 1-story in our Encore Collection. This south facing home offers 4 bedrooms, 3 full baths, study, and a 2-car garage with added storage. The open kitchen features our trademark immensely sized kitchen island upgrade with trash can pull- out cabinet and drawer banks, Silestone quartz counters, 42\" white shaker style cabinetry, and stainless-steel appliances with 5-burner cooktop. This home is graced with luxury vinyl plank floors for durability and elegance. The homesite is 8,218 sq ft and offers an oversized covered back porch with room for a pool, dog run, and garden!</span></p>\r\n<p style=\"line-height:1.5;\"> </p>\r\n<p style=\"line-height:1.5;\"><span style=\"font-size:14pt;\">Hays County’s newest master-planned community offering new homes for sale in Mountain City located on the west side. Framed by an interconnected system of green belts and parks located along Mustang Branch which flows into Onion Creek, the community boasts 422-acres along FM 150. The master plan connects the</span></p>', NULL, NULL, '2024-06-11 04:50:36', '2024-06-11 04:50:36'),
(73, 25, 41, 'مساكن الواحة الحضرية', 'مساكن-الواحة-الحضرية', 'سان أنطونيو، تكساس 78204، الولايات المتحدة الأمريكية', '<p>** يتميز هذا المنزل بأكثر من 59000 دولار في الترقيات! ** Driskill عبارة عن قصة جديدة ومثيرة في مجموعة Encore الخاصة بنا. يوفر هذا المنزل المواجه للجنوب 4 غرف نوم و3 حمامات كاملة ومكتبًا ومرآبًا يتسع لسيارتين مع مساحة تخزين إضافية. يتميز المطبخ المفتوح بترقية جزيرة المطبخ كبيرة الحجم التي تحمل علامتنا التجارية مع خزانة قابلة للسحب وبنوك أدراج وطاولات كوارتز Silestone وخزائن بيضاء على طراز شاكر مقاس 42 بوصة وأجهزة من الفولاذ المقاوم للصدأ مع موقد بخمس شعلات. هذا المنزل يتميز بالفخامة أرضيات خشبية من الفينيل للمتانة والأناقة تبلغ مساحة المنزل 8218 قدمًا مربعًا ويوفر شرفة خلفية كبيرة مغطاة مع مساحة لحمام السباحة ومسار للكلاب وحديقة!</p>\r\n<p> </p>\r\n<p>أحدث مجتمع مخطط رئيسي في مقاطعة هايز يقدم منازل جديدة للبيع في ماونتن سيتي الواقعة على الجانب الغربي. يقع المجتمع في إطار نظام مترابط من الأحزمة الخضراء والحدائق الواقعة على طول فرع موستانج الذي يتدفق إلى أونيون كريك، ويفتخر بمساحة 422 فدانًا على طول FM 150. ويربط المخطط الرئيسي بين</p>', NULL, NULL, '2024-06-11 04:50:36', '2024-06-13 09:05:26'),
(74, 20, 42, 'Midtown Business Towers', 'midtown-business-towers', 'San Antonio, TX 78244, USA', '<p><span style=\"font-size:14pt;\">One <strong>Bennett </strong>Park has taken its place among Chicago\'s most elite residences. Designed by Robert A.M. Stern Architects and developed by Related Midwest, this world class building was designed from the top down. Gracing the crown of this iconic lakefront tower, Penthouse 65 is being offered as a fully designed and finished turn-key residence by Robert A.M. Stern Architects and Related\'s accomplished interiors team. This 7,500 SF full floor Penthouse with private elevator access features 12\'6\" ceilings, unrivaled 360-degree views of the city and lake and a 65 foot long outdoor terrace! This graciously appointed residence offers four bedroom suites including a generous primary suite with a private corner library. Gorgeous eat-in kitchen with custom millwork cabinetry and adjacent family room, elegant dining room opening onto your private terrace, expansive living room with custom stone fireplace, dedicated library with wood paneling and custom built-in cabinetry. Unparalleled finishes throughout this magnificent home in the sky. </span></p>\r\n<p><span style=\"font-size:14pt;\">Two parking spaces with valet service included. This Penthouse is also being offered as raw space option or as a fully custom build with the experienced team at Related offering seamless, concierge-level project management and construction services to ensure that your vision comes to life. This space is unlike any offering the city has ever seen! With only 69 total condominium residences, owners at One Bennett Park enjoy personalized 24-hour concierge services, and valet parking in our discreet porte-cochere offering the ultimate in service and privacy. Our full suite of building amenities is unrivaled in Chicago and includes a world-class fitness center, yoga room, pilates studio, salon and massage suite. The inviting 41st floor owner\'s lounge also offers residents a gracious gathering space with beautiful outdoor terraces, lounge area with fireplace, billiards room, private dining and cordial room. The two museum quality art installations in the lobby are a wonderful addition to this exquisitely designed building. This highly anticipated Penthouse residence is available now. Reach out to learn more about this once in a lifetime offering.</span></p>', NULL, NULL, '2024-06-11 04:55:03', '2024-06-11 04:55:03'),
(75, 25, 42, 'أبراج ميدتاون التجارية', 'أبراج-ميدتاون-التجارية', 'سان أنطونيو، تكساس 78244، الولايات المتحدة الأمريكية', '<p>احتل One Bennett Park مكانه بين أرقى المساكن في شيكاغو. صمم بواسطة روبرت أ.م. تم تطوير هذا المبنى من قبل شركة Stern Architects بواسطة شركة Associated Midwest، وقد تم تصميمه من الأعلى إلى الأسفل. يتربع بنتهاوس 65 على قمة هذا البرج الشهير المطل على البحيرة، ويتم تقديمه كمسكن جاهز للتسليم مصمم بالكامل من قبل روبرت إيه إم. فريق Stern Architects وRelated للتصميمات الداخلية المتميز. هذا البنتهاوس ذو الطابق الكامل الذي تبلغ مساحته 7500 قدم مربع مع إمكانية الوصول إلى المصعد الخاص يتميز بأسقف 12\'6 بوصة وإطلالات لا مثيل لها بزاوية 360 درجة على المدينة والبحيرة وتراس خارجي بطول 65 قدمًا! يوفر هذا السكن المجهز بلطف أجنحة من أربع غرف نوم بما في ذلك جناح رئيسي فسيح مع غرفة معيشة. مكتبة زاوية خاصة لتناول الطعام مع خزائن مخصصة وغرفة عائلية مجاورة وغرفة طعام أنيقة تفتح على شرفتك الخاصة وغرفة معيشة واسعة مع مدفأة حجرية مخصصة ومكتبة مخصصة بألواح خشبية وخزائن مدمجة مخصصة لا مثيل لها في جميع الأنحاء هذا المنزل الرائع في السماء.</p>\r\n<p>مكانان لوقوف السيارات مع خدمة صف السيارات متضمنة. يتم تقديم هذا البنتهاوس أيضًا كخيار للمساحة الأولية أو كمبنى مخصص بالكامل مع فريق من ذوي الخبرة في شركة ذات خبرة تقدم خدمات إدارة المشاريع والبناء السلسة على مستوى الكونسيرج لضمان تحقيق رؤيتك. هذه المساحة لا تشبه أي عرض شهدته المدينة على الإطلاق! مع 69 وحدة سكنية فقط، يتمتع أصحاب One Bennett Park بخدمات كونسيرج شخصية على مدار 24 ساعة، وخدمة صف السيارات في بابنا السري الذي يوفر أقصى درجات الخدمة والخصوصية. مجموعتنا الكاملة من مرافق البناء لا مثيل لها في شيكاغو وتتضمن مركزًا للياقة البدنية على مستوى عالمي وغرفة يوجا واستوديو بيلاتيس وصالونًا وجناحًا للتدليك. توفر صالة المالك الجذابة في الطابق 41 للمقيمين أيضًا مساحة تجمع رائعة مع شرفات خارجية جميلة ومنطقة صالة مع مدفأة وغرفة بلياردو وغرفة طعام خاصة وغرفة ودية. تعد المنشأتان الفنيتان ذات الجودة المتحفية في الردهة إضافة رائعة لهذا المبنى المصمم بشكل رائع. هذا السكن البنتهاوس المرتقب متاح الآن. تواصل معنا لمعرفة المزيد حول هذا العرض مرة واحدة في العمر.</p>', NULL, NULL, '2024-06-11 04:55:03', '2024-06-13 09:04:47'),
(76, 20, 43, 'Harmony Urban Village', 'harmony-urban-village', '2 E Theo Ave, San Antonio,  USA', '<p><span style=\"font-size:14pt;\">Welcome to urban living at its finest in this chic and updated 2 bed, 2 bath condo nestled in the Near West Side. Located two blocks from the United Center, this contemporary unit offers a perfect blend of comfort and convenience. Step inside to discover an inviting open layout flooded with natural light from expansive windows. The spacious living area is ideal for entertaining guests or simply relaxing after a long day. Retreat to the serene master suite, complete with a private ensuite bath and custom Elfa closet organizers. </span></p>\r\n<p><span style=\"font-size:14pt;\">The second bedroom is perfect as a home office, cozy den, or guest room providing flexibility to suit your lifestyle needs. Unlike other units in the building, it is fully enclosed with transom windows for additional light. Unique to the building, the internet with Zentro (formerly Everywhere Wireless) is included in the HOA dues-at only $25, with each unit receiving 1 Gig speed. Additional highlights include in-unit laundry, well-kept HVAC, new water heater, and assigned deeded parking for added convenience. Residents can also take advantage of the secure bike room in the lobby. Finally, if you\'re hoping to become an investor, units can be rented out after two years of ownership. </span></p>\r\n<p><span style=\"font-size:14pt;\">Don\'t miss this wonderful opportunity! Schedule your private tour today and make this stylish condo your new home sweet home!</span></p>', NULL, NULL, '2024-06-11 05:09:17', '2024-06-11 05:09:17'),
(77, 25, 43, 'قرية هارموني الحضرية', 'قرية-هارموني-الحضرية', 'شارع إي ثيو، سان أنطونيو، الولايات المتحدة الأمريكية', '<p>مرحبًا بكم في الحياة الحضرية في أفضل حالاتها في هذه الشقة الأنيقة والمحدثة المكونة من سريرين وحمامين والتي تقع في الجانب الغربي القريب. تقع هذه الوحدة المعاصرة على بعد بنايتين من United Center، وتوفر مزيجًا مثاليًا من الراحة والملاءمة. ادخل إلى الداخل لتكتشف تصميمًا مفتوحًا جذابًا يغمره الضوء الطبيعي من النوافذ الواسعة. تعتبر منطقة المعيشة الفسيحة مثالية للترفيه عن الضيوف أو مجرد الاسترخاء بعد يوم طويل. يمكنك العودة إلى الجناح الرئيسي الهادئ والمزود بحمام داخلي خاص ومنظمات خزانة Elfa المخصصة.</p>\r\n<p>تعتبر غرفة النوم الثانية مثالية كمكتب منزلي أو غرفة ضيوف مريحة أو غرفة ضيوف توفر المرونة التي تناسب احتياجات نمط حياتك. على عكس الوحدات الأخرى في المبنى، فهو محاط بالكامل بنوافذ عرضية لمزيد من الإضاءة. فريدة من نوعها في المبنى، يتم تضمين الإنترنت مع Zentro (المعروف سابقًا باسم Everywhere Wireless) في مستحقات HOA - بسعر 25 دولارًا فقط، مع حصول كل وحدة على سرعة 1 جيجا. تشمل الميزات الإضافية غسيل الملابس داخل الوحدة ونظام التدفئة والتهوية وتكييف الهواء الذي يتم الاعتناء به جيدًا وسخان المياه الجديد ومواقف السيارات المخصصة لمزيد من الراحة. يمكن للمقيمين أيضًا الاستفادة من غرفة الدراجات الآمنة في الردهة. وأخيرًا، إذا كنت تأمل أن تصبح مستثمرًا، فيمكن تأجير الوحدات بعد عامين من الملكية.</p>\r\n<p>لا تفوت هذه الفرصة الرائعة! حدد موعدًا لجولتك الخاصة اليوم واجعل من هذه الشقة الأنيقة منزلك الجديد الجميل!</p>', NULL, NULL, '2024-06-11 05:09:17', '2024-06-13 09:00:43'),
(78, 20, 44, 'Central Plaza Mixed-Use', 'central-plaza-mixed-use', '26 E Southcross, San Antonio, TX 723, USA', '<p><span style=\"font-size:14pt;\">Make this beautifully updated 2 Bed/ 2 Bath on a quiet, private street in the loop of Chicago Yours! Yes, quiet, hidden and in Chicago\'s Financial District ! Across from Union Station, kiddie corner from the Kennedy Expressway On \\ Off Ramps and steps away to everything our beautiful city has to offer! This northwest corner unit not only gives you the best natural light in the building, it provides less obstruction from surrounding buildings. New Floors ! Freshly painted! Polished marble! New quartz countertops in the kitchen with brand new appliances! Details of light fixtures and hardware make this unit complete and highly desirable! Best part? It has a Split Bedroom floor plan with great closet space ! Parking Additional $30,000!<br /><br />Make this beautifully updated 2 Bed/ 2 Bath on a quiet, private street in the loop of Chicago Yours! Yes, quiet, hidden and in Chicago\'s Financial District ! Across from Union Station, kiddie corner from the Kennedy Expressway On \\ Off Ramps and steps away to everything our beautiful city has to offer! This northwest corner unit not only gives you the best natural light in the building, it provides less obstruction from surrounding buildings. New Floors ! Freshly painted! Polished marble! New quartz countertops in the kitchen with brand new appliances! Details of light fixtures and hardware make this unit complete and highly desirable! Best part? It has a Split Bedroom floor plan with great closet space ! Parking Additional $30,000!<br /></span></p>', NULL, NULL, '2024-06-11 05:29:31', '2024-06-11 05:29:31'),
(79, 25, 44, 'سنترال بلازا متعدد الاستخدامات', 'سنترال-بلازا-متعدد-الاستخدامات', '26 إي ساوثكروس، سان أنطونيو، تكساس 723، الولايات المتحدة الأمريكية', '<p>اصنع هذا السرير الذي تم تحديثه بشكل جميل والذي يحتوي على سريرين / حمامين في شارع خاص وهادئ في حلقة Chicago Yours! نعم، هادئ ومخفي وفي الحي المالي بشيكاغو! على الجانب الآخر من محطة يونيون، زاوية للأطفال من طريق كينيدي السريع، منحدرات On/Off وعلى بعد خطوات من كل ما تقدمه مدينتنا الجميلة! لا تمنحك وحدة الزاوية الشمالية الغربية هذه أفضل ضوء طبيعي في المبنى فحسب، بل توفر أيضًا عوائق أقل من المباني المحيطة. طوابق جديدة! رسمت حديثا! رخام مصقول! أسطح كوارتز جديدة في المطبخ بأجهزة جديدة تمامًا! تفاصيل تركيبات الإضاءة والأجهزة تجعل هذه الوحدة كاملة ومرغوبة للغاية! افضل جزء؟ تحتوي على مخطط أرضية لغرفة نوم مقسمة مع مساحة خزانة كبيرة! موقف سيارات إضافي 30 ألف دولار!</p>\r\n<p>اصنع هذا السرير الذي تم تحديثه بشكل جميل والذي يحتوي على غرفتي نوم / حمامين في شارع خاص وهادئ في حلقة Chicago Yours! نعم، هادئ ومخفي وفي الحي المالي بشيكاغو! على الجانب الآخر من محطة يونيون، زاوية للأطفال من طريق كينيدي السريع، منحدرات On/Off وعلى بعد خطوات من كل ما تقدمه مدينتنا الجميلة! لا تمنحك وحدة الزاوية الشمالية الغربية هذه أفضل ضوء طبيعي في المبنى فحسب، بل توفر أيضًا عوائق أقل من المباني المحيطة. طوابق جديدة! رسمت حديثا! رخام مصقول! أسطح كوارتز جديدة في المطبخ بأجهزة جديدة تمامًا! تفاصيل تركيبات الإضاءة والأجهزة تجعل هذه الوحدة كاملة ومرغوبة للغاية! افضل جزء؟ تحتوي على مخطط أرضية لغرفة نوم مقسمة مع مساحة خزانة كبيرة! موقف سيارات إضافي 30 ألف دولار!</p>', NULL, NULL, '2024-06-11 05:29:31', '2024-06-13 09:00:10'),
(80, 20, 45, 'Serenity Grand Residences', 'serenity-grand-residences', '35 Roosevelt Ave, USA', '<p>Welcome to the epitome of waterfront luxury living in Miami\'s prestigious Eastern Shores! This stunning 4-Bedroom, 3.5-Bathroom residence offers approximately 3,400 sqft of living space and 90-feet of PRIME waterfront. There are no-fixed bridges and a large dock for up to an 80-foot yacht. This property provides unparalleled access for boat enthusiasts with direct water access and breathtaking views. Inside, discover spacious living areas, 24ft high ceilings throughout, elegant finishes, custom wood and iron work and modern amenities seamlessly integrating indoor-outdoor living. Perfect for entertaining or unwinding in style. Situated in a gated neighborhood minutes to shopping, dining, and entertainment. This is the essence of Miami\'s coveted waterfront lifestyle.</p>\r\n<div class=\"about-this-home\">\r\n<div class=\"ldp-description-text-container truncate-container\">\r\n<p class=\"ldp-description-text\">Rarely available spacious 3 bedroom, 2.5 bathrooms at Sunset Harbour. Tastefully updated and completely turnkey. Enjoy eastern views of Miami Beach from one of 2 balconies from the master bedroom. The spacious master bathroom features a luxurious soaking tub as well as a separate shower.<br /><br />Open kitchen with marble countertop with plenty of room to prepare gourmet meals.<br /><br />The condo has many custom-built features that must be seen. Sunset Harbour Drive is one of the most desirable Miami Beach Neighborhoods, filled with great restaurants, shops and things to do, up for renting a paddle board or going to yoga studio?<br /><br />Sunset Harbour South is a full-service building with many amenities.</p>\r\n</div>\r\n</div>\r\n<div class=\"agent-information-wrapper\">\r\n<div class=\"agent-information-mls-info\">\r\n<p class=\"listing-agent-title\"> </p>\r\n</div>\r\n</div>', NULL, NULL, '2024-06-11 05:33:56', '2024-06-13 05:55:49'),
(81, 25, 45, 'سيرينيتي جراند ريزيدنسيز', 'سيرينيتي-جراند-ريزيدنسيز', 'شارع روزفلت، الولايات المتحدة الأمريكية', '<p>مرحبًا بكم في مثال الحياة الفاخرة على الواجهة البحرية في الشواطئ الشرقية المرموقة في ميامي! يوفر هذا السكن المذهل المكون من 4 غرف نوم و3.5 حمامات ما يقرب من 3400 قدم مربع من مساحة المعيشة و90 قدمًا من الواجهة البحرية الرئيسية. لا توجد جسور ثابتة ورصيف كبير يتسع لليخت الذي يصل طوله إلى 80 قدمًا. توفر هذه المنشأة وصولاً لا مثيل له لعشاق القوارب مع إمكانية الوصول المباشر إلى المياه وإطلالات خلابة. في الداخل، اكتشف مناطق معيشة واسعة، وأسقف بارتفاع 24 قدمًا في جميع الأنحاء، وتشطيبات أنيقة، وأعمال خشبية وحديدية مخصصة ووسائل راحة حديثة تدمج بسلاسة بين المعيشة الداخلية والخارجية. مثالية للترفيه أو الاسترخاء بأناقة. يقع في حي مسور على بعد دقائق من التسوق وتناول الطعام والترفيه. هذا هو جوهر أسلوب الحياة المرموق على الواجهة البحرية في ميامي.</p>\r\n<p>نادرًا ما تتوفر 3 غرف نوم فسيحة و2.5 حمام في Sunset Harbour. تم تحديثه بذوق وتسليم المفتاح بالكامل. استمتع بالمناظر الشرقية لشاطئ ميامي من إحدى الشرفتين في غرفة النوم الرئيسية. يتميز الحمام الرئيسي الفسيح بحوض استحمام فاخر بالإضافة إلى دش منفصل.</p>\r\n<p>مطبخ مفتوح مع سطح رخامي مع مساحة كبيرة لإعداد وجبات الطعام اللذيذة.</p>\r\n<p>تحتوي الشقة على العديد من الميزات المصممة خصيصًا والتي يجب رؤيتها. يعد Sunset Harbour Drive واحدًا من أكثر أحياء ميامي بيتش المرغوبة، فهو مليء بالمطاعم والمتاجر الرائعة والأشياء التي يمكنك القيام بها، أو استئجار لوح تجديف أو الذهاب إلى استوديو اليوغا؟</p>\r\n<p>صن سيت هاربور ساوث عبارة عن مبنى متكامل الخدمات يضم العديد من وسائل الراحة.</p>', NULL, NULL, '2024-06-11 05:33:56', '2024-06-13 08:59:35'),
(82, 20, 46, 'Prestige Trade Center', 'prestige-trade-center', 'Sunset Harbour Dr Unit 807 Miami Beach', '<p>You\'ll find the charming, HOA-free, ranch-style residences of Hialeah Acres reaching toward Miami on the city of Hialeah\'s southeast side. \"It\'s an older area which keeps prices down,\" says Annemarie Daruna, a Realtor with RD Realty Group. \"It\'s not a quiet small town, but it\'s not a full-blown hectic city either. The area has a small city vibe. There are a lot of renters, and the location is a big draw since you\'re pretty much 30 minutes from everywhere.\"</p>\r\n<p> </p>\r\n<p> Hialeah Acres is framed by main roads like Hialeah Dr, also known as Northwest 54th Street, Red Road and Northwest 27th Avenue. The main roads give residents immediate access to public transportation, convenient shopping plazas, major entertainment and delectable eateries. So, whether you need to grab groceries from Sedano\'s or Publix, you\'re only minutes away. The same goes for catching the bus or grabbing a bite from a local favorite like Maruchi — a no-frills Cuban joint that serves up everything from Cuban sandwiches to ropa vieja. Due north, historic staple and entertainment mecca Hialeah Park Casino is also moments away. Formerly a greyhound</p>', NULL, NULL, '2024-06-13 09:38:50', '2024-06-13 09:38:50'),
(83, 25, 46, 'مركز برستيج التجاري', 'مركز-برستيج-التجاري', 'سانسيت هاربور دكتور يونيت 807 ميامي بيتش', '<p>ستجد مساكن Hialeah Acres الساحرة الخالية من القرن الأفريقي والمصممة على طراز المزرعة والتي تصل إلى ميامي على الجانب الجنوبي الشرقي من مدينة Hialeah. تقول Annemarie Daruna، وهي سمسارة عقارات لدى RD Realty Group: \"إنها منطقة قديمة تحافظ على انخفاض الأسعار\". \"إنها ليست مدينة صغيرة هادئة، ولكنها ليست مدينة مزدحمة تمامًا أيضًا. تتمتع المنطقة بأجواء المدينة الصغيرة. يوجد الكثير من المستأجرين، والموقع يمثل نقطة جذب كبيرة لأنك على بعد 30 دقيقة تقريبًا من في كل مكان.\"</p>\r\n<p> </p>\r\n<p>Hialeah Acres محاط بالطرق الرئيسية مثل Hialeah Dr، المعروف أيضًا باسم Northwest 54th Street، Red Road وNorthwest 27th Avenue. تتيح الطرق الرئيسية للمقيمين إمكانية الوصول الفوري إلى وسائل النقل العام وساحات التسوق المريحة ووسائل الترفيه الكبرى والمطاعم اللذيذة. لذلك، سواء كنت بحاجة إلى شراء البقالة من Sedano\'s أو Publix، فأنت على بعد دقائق فقط. وينطبق الشيء نفسه على ركوب الحافلة أو تناول وجبة خفيفة من أحد المأكولات المحلية المفضلة مثل ماروتشي - وهو مطعم كوبي بسيط يقدم كل شيء بدءًا من السندويشات الكوبية وحتى روبا فيجا. باتجاه الشمال، يقع كازينو Hialeah Park Casino التاريخي والترفيهي في مكة على بعد لحظات أيضًا. السلوقي سابقا</p>', NULL, NULL, '2024-06-13 09:38:50', '2024-06-13 09:38:50'),
(84, 20, 47, 'Crown Jewel Estates', 'crown-jewel-estates', 'Miami,USA', '<p>Introducing nearly 5 Acres for sale on Historic Miller Dr in Miami\'s coveted Horse Country. When space &amp; privacy means everything, look no further: Join the elite few &amp; build your legacy in a timeless investment. Miami\'s Horse Country offers the classic allure of the equestrian lifestyle for those searching for balance of privacy &amp; nature. The large lots of Horse Country has seen flourish a behind-the-gates lifestyle of custom estates, mins away from major business districts, highways &amp; schools-- offering peace &amp; private resort living. Currently a successful palm grove nursery, your options are limitless: Build, assemble, subdivide. The vision is yours to build. Land &amp; Location are the Cornerstones of Real Estate Success--Don\'t miss this unique opportunity!</p>\r\n<p>Zoned 4400/multifamily, the city of Opa Locka permits the construction of up to 33 units. Unlock a lucrative development opportunity with this strategically located 1.1-acre commercial lot in close proximity to major amenities. Key highlights include its prime location near the Amazon Warehouse, Executive Airport, and shopping centers, presenting a favorable environment for a dynamic and profitable residential space. This investment opportunity, strategically positioned in a thriving commercial district, is primed for substantial returns. Seize the chance to lead in the area\'s growth. </p>', NULL, NULL, '2024-06-13 09:44:42', '2024-06-13 09:44:42'),
(85, 25, 47, 'عقارات جوهرة التاج', 'عقارات-جوهرة-التاج', 'ميامي، الولايات المتحدة الأمريكية', '<p>نقدم ما يقرب من 5 أفدنة للبيع في Historic Miller Dr في منطقة الخيول المرغوبة في ميامي. عندما تكون المساحة والخصوصية تعني كل شيء، فلا داعي لمزيد من البحث: انضم إلى النخبة وقم ببناء إرثك في استثمار خالد. يقدم فندق Miami\'s Horse Country الجاذبية الكلاسيكية لأسلوب حياة الفروسية لأولئك الذين يبحثون عن التوازن بين الخصوصية والطبيعة. شهدت المساحات الكبيرة من Horse Country ازدهارًا لنمط حياة خلف البوابات من العقارات المخصصة، على بعد دقائق من المناطق التجارية الرئيسية والطرق السريعة والمدارس - مما يوفر حياة هادئة في منتجعات خاصة. حاليًا مشتل بستان النخيل ناجح، خياراتك لا حدود لها: البناء والتجميع والتقسيم. الرؤية ملكك لتبنيها. الأرض والموقع هما حجر الزاوية للنجاح العقاري - لا تفوت هذه الفرصة الفريدة!</p>\r\n<p>تسمح مدينة أوبا لوكا، المخصصة للعائلات المتعددة والمقسمة إلى 4400، ببناء ما يصل إلى 33 وحدة. أطلق العنان لفرصة تطوير مربحة من خلال هذه المنطقة التجارية ذات الموقع الاستراتيجي التي تبلغ مساحتها 1.1 فدانًا على مقربة من المرافق الرئيسية. تشمل أبرز المعالم موقعه المتميز بالقرب من Amazon Warehouse والمطار التنفيذي ومراكز التسوق، مما يوفر بيئة مناسبة لمساحة سكنية ديناميكية ومربحة. هذه الفرصة الاستثمارية، التي تتمتع بموقع استراتيجي في منطقة تجارية مزدهرة، مهيئة لتحقيق عوائد كبيرة. اغتنم الفرصة لقيادة نمو المنطقة.</p>', NULL, NULL, '2024-06-13 09:44:42', '2024-06-13 09:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `project_floorplan_images`
--

CREATE TABLE `project_floorplan_images` (
  `id` bigint UNSIGNED NOT NULL,
  `project_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_floorplan_images`
--

INSERT INTO `project_floorplan_images` (`id`, `project_id`, `image`, `created_at`, `updated_at`) VALUES
(62, 39, '6666e4cce8b52.jpg', '2024-06-10 11:34:36', '2024-06-10 11:37:47'),
(63, 39, '6666e4cf03e3e.jpg', '2024-06-10 11:34:39', '2024-06-10 11:37:47'),
(64, 39, '6666e4d20195d.jpg', '2024-06-10 11:34:42', '2024-06-10 11:37:47'),
(65, 40, '6666e5c6c8266.png', '2024-06-10 11:38:46', '2024-06-10 11:40:57'),
(66, 40, '6666e5cd6aa81.png', '2024-06-10 11:38:53', '2024-06-10 11:40:57'),
(67, 40, '6666e5cd7573a.png', '2024-06-10 11:38:53', '2024-06-10 11:40:57'),
(68, 40, '6666e5cd92dbf.png', '2024-06-10 11:38:53', '2024-06-10 11:40:57'),
(69, 41, '6667d6c292ba5.png', '2024-06-11 04:46:58', '2024-06-11 04:50:35'),
(70, 41, '6667d6c29e96c.png', '2024-06-11 04:46:58', '2024-06-11 04:50:35'),
(71, 41, '6667d6c2f1dbf.png', '2024-06-11 04:46:58', '2024-06-11 04:50:35'),
(72, 41, '6667d6c2f33ee.png', '2024-06-11 04:46:58', '2024-06-11 04:50:35'),
(74, 42, '6667d7c07a583.jpg', '2024-06-11 04:51:12', '2024-06-11 04:55:03'),
(75, 42, '6667d7c0a6510.jpg', '2024-06-11 04:51:12', '2024-06-11 04:55:03'),
(76, 42, '6667d7c0ae4fd.jpg', '2024-06-11 04:51:12', '2024-06-11 04:55:03'),
(77, 42, '6667d7c0d186f.jpg', '2024-06-11 04:51:12', '2024-06-11 04:55:03'),
(78, 43, '6667db0308078.png', '2024-06-11 05:05:07', '2024-06-11 05:09:17'),
(79, 43, '6667db030f556.png', '2024-06-11 05:05:07', '2024-06-11 05:09:17'),
(80, 43, '6667db034fabb.png', '2024-06-11 05:05:07', '2024-06-11 05:09:17'),
(81, 43, '6667db034faa0.png', '2024-06-11 05:05:07', '2024-06-11 05:09:17'),
(82, 43, '6667db052f306.jpg', '2024-06-11 05:05:09', '2024-06-11 05:09:17'),
(83, 44, '6667e03f7677d.png', '2024-06-11 05:27:27', '2024-06-11 05:29:30'),
(84, 44, '6667e03f949fc.png', '2024-06-11 05:27:27', '2024-06-11 05:29:30'),
(85, 44, '6667e03fd1981.png', '2024-06-11 05:27:27', '2024-06-11 05:29:30'),
(86, 44, '6667e03fd5938.png', '2024-06-11 05:27:27', '2024-06-11 05:29:30'),
(87, 44, '6667e043909d6.jpg', '2024-06-11 05:27:31', '2024-06-11 05:29:30'),
(88, 45, '6667e1c19abfb.png', '2024-06-11 05:33:53', '2024-06-11 05:33:56'),
(89, 45, '6667e1c19c9ae.png', '2024-06-11 05:33:53', '2024-06-11 05:33:56'),
(90, 45, '6667e1c1e09c3.png', '2024-06-11 05:33:53', '2024-06-11 05:33:56'),
(91, 45, '6667e1c1ecef1.png', '2024-06-11 05:33:53', '2024-06-11 05:33:56'),
(92, 45, '6667e1c223243.png', '2024-06-11 05:33:54', '2024-06-11 05:33:56'),
(93, 46, '666abd7793a91.png', '2024-06-13 09:35:51', '2024-06-13 09:38:50'),
(94, 46, '666abd7797b4a.png', '2024-06-13 09:35:51', '2024-06-13 09:38:50'),
(95, 46, '666abd77c9319.png', '2024-06-13 09:35:51', '2024-06-13 09:38:50'),
(96, 46, '666abd77d4414.png', '2024-06-13 09:35:51', '2024-06-13 09:38:50'),
(97, 46, '666abd7804198.png', '2024-06-13 09:35:52', '2024-06-13 09:38:50'),
(98, 47, '666abe40a3fd0.png', '2024-06-13 09:39:12', '2024-06-13 09:44:42'),
(99, 47, '666abe40b0272.png', '2024-06-13 09:39:12', '2024-06-13 09:44:42'),
(100, 47, '666abe40e59d0.png', '2024-06-13 09:39:12', '2024-06-13 09:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `project_gallery_images`
--

CREATE TABLE `project_gallery_images` (
  `id` bigint UNSIGNED NOT NULL,
  `project_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_gallery_images`
--

INSERT INTO `project_gallery_images` (`id`, `project_id`, `image`, `created_at`, `updated_at`) VALUES
(126, NULL, '66657faa4bd26.jpg', '2024-06-09 10:10:50', '2024-06-09 10:10:50'),
(127, NULL, '66657faa4bd20.jpg', '2024-06-09 10:10:50', '2024-06-09 10:10:50'),
(149, 39, '6666e4bb01fac.jpg', '2024-06-10 11:34:19', '2024-06-10 11:37:47'),
(150, 39, '6666e4bd626e5.jpg', '2024-06-10 11:34:21', '2024-06-10 11:37:47'),
(151, 39, '6666e4c686960.jpg', '2024-06-10 11:34:30', '2024-06-10 11:37:47'),
(152, 39, '6666e4c883228.jpg', '2024-06-10 11:34:32', '2024-06-10 11:37:47'),
(153, 40, '6666e5b29add3.jpg', '2024-06-10 11:38:26', '2024-06-10 11:40:57'),
(154, 40, '6666e5b7e45e2.jpg', '2024-06-10 11:38:31', '2024-06-10 11:40:57'),
(155, 40, '6666e5ba5a61b.jpg', '2024-06-10 11:38:34', '2024-06-10 11:40:57'),
(156, 41, '6667d6b005208.png', '2024-06-11 04:46:40', '2024-06-11 04:50:35'),
(157, 41, '6667d6b0051fb.png', '2024-06-11 04:46:40', '2024-06-11 04:50:35'),
(158, 41, '6667d6b03dc5c.png', '2024-06-11 04:46:40', '2024-06-11 04:50:35'),
(159, 42, '6667d7e91360f.jpg', '2024-06-11 04:51:53', '2024-06-11 04:55:03'),
(160, 42, '6667d7e918db9.jpg', '2024-06-11 04:51:53', '2024-06-11 04:55:03'),
(161, 42, '6667d7e9435ef.jpg', '2024-06-11 04:51:53', '2024-06-11 04:55:03'),
(162, 42, '6667d7e947b12.jpg', '2024-06-11 04:51:53', '2024-06-11 04:55:03'),
(163, 43, '6667daeeed83f.jpg', '2024-06-11 05:04:46', '2024-06-11 05:09:17'),
(164, 43, '6667daf1b9a72.jpg', '2024-06-11 05:04:49', '2024-06-11 05:09:17'),
(165, 43, '6667daf394fe8.jpg', '2024-06-11 05:04:51', '2024-06-11 05:09:17'),
(166, 44, '6667e01130219.png', '2024-06-11 05:26:41', '2024-06-11 05:29:30'),
(167, 44, '6667e01130211.png', '2024-06-11 05:26:41', '2024-06-11 05:29:30'),
(168, 44, '6667e011883f5.png', '2024-06-11 05:26:41', '2024-06-11 05:29:30'),
(169, 44, '6667e02cbf428.png', '2024-06-11 05:27:08', '2024-06-11 05:29:30'),
(170, 44, '6667e02cc88b3.png', '2024-06-11 05:27:08', '2024-06-11 05:29:30'),
(172, 45, '6667e115d7d41.png', '2024-06-11 05:31:01', '2024-06-11 05:33:56'),
(173, 45, '6667e1262d951.png', '2024-06-11 05:31:18', '2024-06-11 05:33:56'),
(174, 45, '6667e1262e639.png', '2024-06-11 05:31:18', '2024-06-11 05:33:56'),
(175, 45, '6667e13f2b945.png', '2024-06-11 05:31:43', '2024-06-11 05:33:56'),
(176, 46, '666abd5b00227.png', '2024-06-13 09:35:23', '2024-06-13 09:38:50'),
(177, 46, '666abd5b00ea6.png', '2024-06-13 09:35:23', '2024-06-13 09:38:50'),
(178, 46, '666abd5b2e3e5.png', '2024-06-13 09:35:23', '2024-06-13 09:38:50'),
(179, 46, '666abd6a63193.png', '2024-06-13 09:35:38', '2024-06-13 09:38:50'),
(180, 46, '666abd6a680dc.png', '2024-06-13 09:35:38', '2024-06-13 09:38:50'),
(181, 46, '666abd6a97935.png', '2024-06-13 09:35:38', '2024-06-13 09:38:50'),
(182, 47, '666abe371fb59.png', '2024-06-13 09:39:03', '2024-06-13 09:44:42'),
(183, 47, '666abe372603c.png', '2024-06-13 09:39:03', '2024-06-13 09:44:42'),
(184, 47, '666abe374f5d9.png', '2024-06-13 09:39:03', '2024-06-13 09:44:42'),
(185, 47, '666abe3757da2.png', '2024-06-13 09:39:03', '2024-06-13 09:44:42'),
(186, 47, '666abe631075d.png', '2024-06-13 09:39:47', '2024-06-13 09:44:42'),
(187, 47, '666abe6310783.png', '2024-06-13 09:39:47', '2024-06-13 09:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `project_sections`
--

CREATE TABLE `project_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_sections`
--

INSERT INTO `project_sections` (`id`, `language_id`, `title`, `subtitle`, `created_at`, `updated_at`) VALUES
(1, 20, 'Our Best Projects', 'Our Popular Estaty Projects', '2023-12-12 00:23:02', '2024-06-12 10:57:14'),
(2, 25, 'أفضل مشاريعنا', 'مشاريعنا العقارية الشهيرة', '2024-03-27 00:20:13', '2024-03-27 00:20:24');

-- --------------------------------------------------------

--
-- Table structure for table `project_spacifications`
--

CREATE TABLE `project_spacifications` (
  `id` bigint UNSIGNED NOT NULL,
  `project_id` bigint UNSIGNED NOT NULL,
  `key` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_spacifications`
--

INSERT INTO `project_spacifications` (`id`, `project_id`, `key`, `created_at`, `updated_at`) VALUES
(73, 13, 0, '2024-01-15 02:39:18', '2024-01-15 02:39:18'),
(80, 19, 0, '2024-01-30 03:55:54', '2024-01-30 03:55:54'),
(87, 21, 0, '2024-02-12 04:04:33', '2024-02-12 04:04:33'),
(149, 22, 0, '2024-02-13 03:56:50', '2024-02-13 03:56:50'),
(150, 22, 1, '2024-02-13 03:56:50', '2024-02-13 03:56:50'),
(151, 22, 2, '2024-02-13 03:56:50', '2024-02-13 03:56:50'),
(152, 22, 3, '2024-02-13 03:56:50', '2024-02-13 03:56:50'),
(316, 45, 0, '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(317, 45, 1, '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(318, 45, 2, '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(319, 45, 3, '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(320, 45, 4, '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(321, 45, 5, '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(322, 45, 6, '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(323, 45, 7, '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(324, 47, 0, '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(325, 47, 1, '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(326, 47, 2, '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(327, 47, 3, '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(328, 47, 4, '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(329, 47, 5, '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(330, 47, 6, '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(331, 47, 7, '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(332, 46, 0, '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(333, 46, 1, '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(334, 46, 2, '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(335, 46, 3, '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(336, 46, 4, '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(337, 46, 5, '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(338, 46, 6, '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(339, 46, 7, '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(340, 44, 0, '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(341, 44, 1, '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(342, 44, 2, '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(343, 44, 3, '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(352, 43, 0, '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(353, 43, 1, '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(354, 43, 2, '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(355, 43, 3, '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(356, 43, 4, '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(357, 43, 5, '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(358, 43, 6, '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(359, 43, 7, '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(360, 42, 0, '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(361, 42, 1, '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(362, 42, 2, '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(363, 42, 3, '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(364, 41, 0, '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(365, 41, 1, '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(366, 41, 2, '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(367, 41, 3, '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(368, 41, 4, '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(369, 41, 5, '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(370, 41, 6, '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(371, 41, 7, '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(372, 40, 0, '2024-06-14 05:41:56', '2024-06-14 05:41:56'),
(373, 40, 1, '2024-06-14 05:41:56', '2024-06-14 05:41:56'),
(374, 40, 2, '2024-06-14 05:41:56', '2024-06-14 05:41:56'),
(375, 40, 3, '2024-06-14 05:41:57', '2024-06-14 05:41:57'),
(376, 39, 0, '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(377, 39, 1, '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(378, 39, 2, '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(379, 39, 3, '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(380, 39, 4, '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(381, 39, 5, '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(382, 39, 6, '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(383, 39, 7, '2024-06-14 05:44:35', '2024-06-14 05:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `project_spacification_contents`
--

CREATE TABLE `project_spacification_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `project_spacification_id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_spacification_contents`
--

INSERT INTO `project_spacification_contents` (`id`, `language_id`, `project_spacification_id`, `label`, `value`, `created_at`, `updated_at`) VALUES
(479, 20, 316, 'Project Type', 'Townhome', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(480, 20, 317, 'Year Build', '2024', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(481, 20, 318, 'Parking', 'Underground parking garage', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(482, 20, 319, 'Interior Design', 'Modern and spacious layouts', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(483, 20, 320, 'Security', '24/7 CCTV surveillance', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(484, 20, 321, 'Maintenance and Management', 'On-site property management office', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(485, 20, 322, 'Storage', 'Built-in storage solutions', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(486, 20, 323, 'Accessibility', 'Elevators serving all floors', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(487, 25, 316, 'نوع المشروع', 'تاونهوم', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(488, 25, 317, 'بناء العام', '2024', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(489, 25, 318, 'موقف سيارات', 'مرآب للسيارات تحت الأرض', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(490, 25, 319, 'تصميم داخلي', 'تخطيطات حديثة وواسعة', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(491, 25, 320, 'حماية', 'مراقبة بالكاميرات التلفزيونية المغلقة على مدار', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(492, 25, 321, 'الصيانة والإدارة', 'مكتب إدارة الممتلكات في الموقع', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(493, 25, 322, 'تخزين', 'حلول تخزين مدمجة', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(494, 25, 323, 'إمكانية الوصول', 'مصاعد تخدم جميع الطوابق', '2024-06-14 05:22:37', '2024-06-14 05:22:37'),
(495, 20, 324, 'Project Type', 'Townhome', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(496, 20, 325, 'Year Build', '2024', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(497, 20, 326, 'Parking', 'Underground parking garage', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(498, 20, 327, 'Interior Design', 'Modern and spacious layouts', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(499, 20, 328, 'Security', '24/7 CCTV surveillance', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(500, 20, 329, 'Maintenance and Management', 'On-site property management office', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(501, 20, 330, 'Storage', 'Built-in storage solutions', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(502, 20, 331, 'Accessibility', 'Elevators serving all floors', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(503, 25, 324, 'نوع المشروع', 'تاونهوم', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(504, 25, 325, 'بناء العام', '2024', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(505, 25, 326, 'موقف سيارات', 'مرآب للسيارات تحت الأرض', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(506, 25, 327, 'تصميم داخلي', 'تخطيطات حديثة وواسعة', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(507, 25, 328, 'حماية', 'مراقبة بالكاميرات التلفزيونية المغلقة عل', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(508, 25, 329, 'الصيانة والإدارة', 'مكتب إدارة الممتلكات في الموقع', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(509, 25, 330, 'تخزين', 'حلول تخزين مدمجة', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(510, 25, 331, 'إمكانية الوصول', 'مصاعد تخدم جميع الطوابق', '2024-06-14 05:23:25', '2024-06-14 05:23:25'),
(511, 20, 332, 'Project Type', 'Townhome', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(512, 20, 333, 'Year Build', '2024', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(513, 20, 334, 'Parking', 'Underground parking garage', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(514, 20, 335, 'Interior Design', 'Modern and spacious layouts', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(515, 20, 336, 'Security', '24/7 CCTV surveillance', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(516, 20, 337, 'Maintenance and Management', 'On-site property management office', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(517, 20, 338, 'Storage', 'Built-in storage solutions', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(518, 20, 339, 'Accessibility', 'Elevators serving all floors', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(519, 25, 332, 'نوع المشروع', 'تاونهوم', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(520, 25, 333, 'بناء العام', '2024', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(521, 25, 334, 'موقف سيارات', 'مرآب للسيارات تحت الأرض', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(522, 25, 335, 'تصميم داخلي', 'تخطيطات حديثة وواسعة', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(523, 25, 336, 'حماية', 'مراقبة بالكاميرات التلفزيونية المغلقة على مدار', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(524, 25, 337, 'الصيانة والإدارة', 'مكتب إدارة الممتلكات في الموقع', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(525, 25, 338, 'تخزين', 'حلول تخزين مدمجة', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(526, 25, 339, 'إمكانية الوصول', 'مصاعد تخدم جميع الطوابق', '2024-06-14 05:26:30', '2024-06-14 05:26:30'),
(527, 20, 340, 'Interior Design', 'Modern and spacious layouts', '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(528, 20, 341, 'Parking', 'Underground parking garage', '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(529, 20, 342, 'Storage', 'Built-in storage solutions', '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(530, 20, 343, 'Accessibility', 'Elevators serving all floors', '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(531, 25, 340, 'تصميم داخلي', 'تخطيطات حديثة وواسعة', '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(532, 25, 341, 'موقف سيارات', 'مرآب للسيارات تحت الأرض', '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(533, 25, 342, 'تخزين', 'حلول تخزين مدمجة', '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(534, 25, 343, 'إمكانية الوصول', 'مصاعد تخدم جميع الطوابق', '2024-06-14 05:28:06', '2024-06-14 05:28:06'),
(551, 20, 352, 'Accessibility', 'Elevators serving all floors', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(552, 20, 353, 'Storage', 'Built-in storage solutions', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(553, 20, 354, 'Maintenance and Management', 'On-site property management office', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(554, 20, 355, 'Security', '24/7 CCTV surveillance', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(555, 20, 356, 'Parking', 'Underground parking garage', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(556, 20, 357, 'Interior Design', 'Modern and spacious layouts', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(557, 20, 358, 'Project Type', 'Townhome', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(558, 20, 359, 'Year Build', '2024', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(559, 25, 352, 'إمكانية الوصول', 'مصاعد تخدم جميع الطوابق', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(560, 25, 353, 'تخزين', 'حلول تخزين مدمجة', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(561, 25, 354, 'الصيانة والإدارة', 'مكتب إدارة الممتلكات في الموقع', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(562, 25, 355, 'حماية', '24/7 CCTV surveillance', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(563, 25, 356, 'موقف سيارات', 'مرآب للسيارات تحت الأرض', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(564, 25, 357, 'تصميم داخلي', 'تخطيطات حديثة وواسعة', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(565, 25, 358, 'نوع المشروع', 'تاونهوم', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(566, 25, 359, 'بناء العام', '2024', '2024-06-14 05:36:14', '2024-06-14 05:36:14'),
(567, 20, 360, 'Project Type', 'Townhome', '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(568, 20, 361, 'Year Build', '2024', '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(569, 20, 362, 'Parking', 'Underground parking garage', '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(570, 20, 363, 'Interior Design', 'Modern and spacious layouts', '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(571, 25, 360, 'نوع المشروع', 'تاونهوم', '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(572, 25, 361, 'بناء العام', '2024', '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(573, 25, 362, 'موقف سيارات', 'مرآب للسيارات تحت الأرض', '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(574, 25, 363, 'تصميم داخلي', 'تخطيطات حديثة وواسعة', '2024-06-14 05:37:56', '2024-06-14 05:37:56'),
(575, 20, 364, 'Security', '24/7 CCTV surveillance', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(576, 20, 365, 'Maintenance and Management', 'On-site property management office', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(577, 20, 366, 'Storage', 'Built-in storage solutions', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(578, 20, 367, 'Accessibility', 'Elevators serving all floors', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(579, 20, 368, 'Project Type', 'Townhome', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(580, 20, 369, 'Year Build', '2024', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(581, 20, 370, 'Parking', 'Underground parking garage', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(582, 20, 371, 'Interior Design', 'Modern and spacious layouts', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(583, 25, 364, 'حماية', 'مراقبة بالكاميرات التلفزيونية المغلقة على مدار', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(584, 25, 365, 'الصيانة والإدارة', 'مكتب إدارة الممتلكات في الموقع', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(585, 25, 366, 'تخزين', 'حلول تخزين مدمجة', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(586, 25, 367, 'إمكانية الوصول', 'مصاعد تخدم جميع الطوابق', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(587, 25, 368, 'نوع المشروع', 'تاونهوم', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(588, 25, 369, 'بناء العام', '2024', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(589, 25, 370, 'موقف سيارات', 'مرآب للسيارات تحت الأرض', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(590, 25, 371, 'تصميم داخلي', 'تخطيطات حديثة وواسعة', '2024-06-14 05:40:30', '2024-06-14 05:40:30'),
(591, 20, 372, 'Interior Design', 'Modern and spacious layouts', '2024-06-14 05:41:56', '2024-06-14 05:41:56'),
(592, 20, 373, 'Year Build', '2026', '2024-06-14 05:41:56', '2024-06-14 05:41:56'),
(593, 20, 374, 'Accessibility', 'Elevators serving all floors', '2024-06-14 05:41:56', '2024-06-14 05:41:56'),
(594, 20, 375, 'Storage', 'Built-in storage solutions', '2024-06-14 05:41:57', '2024-06-14 05:41:57'),
(595, 25, 372, 'تصميم داخلي', 'تخطيطات حديثة وواسعة', '2024-06-14 05:41:57', '2024-06-14 05:41:57'),
(596, 25, 373, 'بناء العام', '2026', '2024-06-14 05:41:57', '2024-06-14 05:41:57'),
(597, 25, 374, 'إمكانية الوصول', 'مصاعد تخدم جميع الطوابق', '2024-06-14 05:41:57', '2024-06-14 05:41:57'),
(598, 25, 375, 'تخزين', 'Elevators serving all floors', '2024-06-14 05:41:57', '2024-06-14 05:41:57'),
(599, 20, 376, 'Accessibility', 'Elevators serving all floors', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(600, 20, 377, 'Storage', 'Built-in storage solutions', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(601, 20, 378, 'Maintenance and Management', 'On-site property management office', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(602, 20, 379, 'Security', '24/7 CCTV surveillance', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(603, 20, 380, 'Interior Design', 'Modern and spacious layouts', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(604, 20, 381, 'Parking', 'Underground parking garage', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(605, 20, 382, 'Year Build', '2023', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(606, 20, 383, 'Project Type', 'Townhome', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(607, 25, 376, 'إمكانية الوصول', 'مصاعد تخدم جميع الطوابق', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(608, 25, 377, 'تخزين', 'حلول تخزين مدمجة', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(609, 25, 378, 'الصيانة والإدارة', 'مكتب إدارة الممتلكات في الموقع', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(610, 25, 379, 'حماية', 'مراقبة بالكاميرات التلفزيونية المغلقة على مدار', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(611, 25, 380, 'تصميم داخلي', 'تخطيطات حديثة وواسعة', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(612, 25, 381, 'موقف سيارات', 'مرآب للسيارات تحت الأرض', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(613, 25, 382, 'بناء العام', '2023', '2024-06-14 05:44:35', '2024-06-14 05:44:35'),
(614, 25, 383, 'نوع المشروع', 'تاونهوم', '2024-06-14 05:44:35', '2024-06-14 05:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `project_types`
--

CREATE TABLE `project_types` (
  `id` bigint UNSIGNED NOT NULL,
  `project_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_types`
--

INSERT INTO `project_types` (`id`, `project_id`, `created_at`, `updated_at`) VALUES
(74, 45, '2024-06-11 07:05:15', '2024-06-11 07:05:15'),
(75, 45, '2024-06-11 07:05:49', '2024-06-11 07:05:49'),
(76, 45, '2024-06-11 07:06:30', '2024-06-11 07:06:30'),
(77, 44, '2024-06-11 07:33:58', '2024-06-11 07:33:58'),
(78, 44, '2024-06-11 07:34:54', '2024-06-11 07:34:54'),
(79, 44, '2024-06-11 07:35:44', '2024-06-11 07:35:44'),
(80, 43, '2024-06-11 07:46:50', '2024-06-11 07:46:50'),
(81, 43, '2024-06-11 07:48:23', '2024-06-11 07:48:23'),
(82, 42, '2024-06-11 07:52:47', '2024-06-11 07:52:47'),
(83, 42, '2024-06-11 07:53:18', '2024-06-11 07:53:18'),
(84, 41, '2024-06-11 07:53:49', '2024-06-11 07:53:49'),
(85, 41, '2024-06-11 07:54:28', '2024-06-11 07:54:28'),
(86, 40, '2024-06-11 07:55:09', '2024-06-11 07:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `project_type_contents`
--

CREATE TABLE `project_type_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `project_type_id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_price` decimal(15,2) DEFAULT NULL,
  `max_price` decimal(15,2) DEFAULT NULL,
  `unit` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_type_contents`
--

INSERT INTO `project_type_contents` (`id`, `project_type_id`, `language_id`, `name`, `min_area`, `max_area`, `min_price`, `max_price`, `unit`, `created_at`, `updated_at`) VALUES
(46, 74, 20, 'Project Type One', '900', '1577', 1254.00, 4521.00, 10, '2024-06-11 07:05:15', '2024-06-11 07:05:15'),
(47, 74, 25, 'Project Type One', '900', '1577', 1254.00, 4521.00, 10, '2024-06-11 07:05:15', '2024-06-11 07:05:15'),
(48, 75, 20, 'Project Type Two', '12587', '2354', 23587.00, 35425.00, 8, '2024-06-11 07:05:49', '2024-06-11 07:05:49'),
(49, 75, 25, 'Project Type Two', '12587', '2354', 23587.00, 35425.00, 8, '2024-06-11 07:05:49', '2024-06-11 07:05:49'),
(50, 76, 20, 'Project Type Three', '2400', '3000', 2500.00, 3800.00, 12, '2024-06-11 07:06:30', '2024-06-11 07:06:30'),
(51, 76, 25, 'Project Type Three', '2400', '3000', 2500.00, 3800.00, 12, '2024-06-11 07:06:30', '2024-06-11 07:06:30'),
(52, 77, 20, 'Project Type One', '1200', '5646', 2500.00, 155452.00, 12, '2024-06-11 07:33:58', '2024-06-11 07:33:58'),
(53, 77, 25, 'Project Type One', '1200', '5646', 2500.00, 155452.00, 12, '2024-06-11 07:33:58', '2024-06-11 07:33:58'),
(54, 78, 20, 'Project Type Two', '2546', '3000', 5212.00, 5642.00, 15, '2024-06-11 07:34:54', '2024-06-11 07:34:54'),
(55, 78, 25, 'Project Type Two', '2546', '3000', 5212.00, 5642.00, 15, '2024-06-11 07:34:54', '2024-06-11 07:34:54'),
(56, 79, 20, 'Project Type Three', '1200', '1500', 1825.00, 2500.00, 5, '2024-06-11 07:35:44', '2024-06-11 07:35:44'),
(57, 79, 25, 'Project Type Three', '1200', '1500', 1825.00, 2500.00, 5, '2024-06-11 07:35:44', '2024-06-11 07:35:44'),
(58, 80, 20, 'Project Type One', '1200', '1500', 2500.00, 2800.00, 5, '2024-06-11 07:46:50', '2024-06-11 07:46:50'),
(59, 80, 25, 'Project Type One', '1200', '1500', 2500.00, 2800.00, 5, '2024-06-11 07:46:50', '2024-06-11 07:46:50'),
(60, 81, 20, 'Project Type Two', '900', '1100', 1824.00, 2574.00, 2, '2024-06-11 07:48:23', '2024-06-11 07:48:23'),
(61, 81, 25, 'Project Type Two', '900', '1100', 1824.00, 2574.00, 2, '2024-06-11 07:48:23', '2024-06-11 07:48:23'),
(62, 82, 20, 'Project Type One', '700', '954', 300.00, 587.00, 6, '2024-06-11 07:52:47', '2024-06-11 07:52:47'),
(63, 82, 25, 'Project Type One', '700', '954', 300.00, 587.00, 6, '2024-06-11 07:52:47', '2024-06-11 07:52:47'),
(64, 83, 20, 'Project Type Two', '1250', '1584', 2541.00, 2978.00, 3, '2024-06-11 07:53:18', '2024-06-11 07:53:18'),
(65, 83, 25, 'Project Type Two', '1250', '1584', 2541.00, 2978.00, 3, '2024-06-11 07:53:18', '2024-06-11 07:53:18'),
(66, 84, 20, 'Project Type One', '954', '1257', 2500.00, 2800.00, 8, '2024-06-11 07:53:49', '2024-06-11 07:53:49'),
(67, 84, 25, 'Project Type One', '954', '1257', 2500.00, 2800.00, 8, '2024-06-11 07:53:49', '2024-06-11 07:53:49'),
(68, 85, 20, 'Project Type Two', '1200', '2800', 1999.00, 5200.00, 20, '2024-06-11 07:54:28', '2024-06-11 07:54:28'),
(69, 85, 25, 'Project Type Two', '1200', '2800', 1999.00, 5200.00, 20, '2024-06-11 07:54:28', '2024-06-11 07:54:28'),
(70, 86, 20, 'Project Type One', '1159', '1559', 2500.00, 5000.00, 13, '2024-06-11 07:55:09', '2024-06-11 07:55:09'),
(71, 86, 25, 'Project Type One', '1159', '1559', 2500.00, 5000.00, 13, '2024-06-11 07:55:09', '2024-06-11 07:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `agent_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `city_id` bigint UNSIGNED NOT NULL,
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor_planning_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'residential,commercial',
  `beds` int DEFAULT NULL,
  `bath` int DEFAULT NULL,
  `area` int NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approve_status` int NOT NULL COMMENT '1== approved,0=pending,2=rejected'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `vendor_id`, `agent_id`, `category_id`, `country_id`, `state_id`, `city_id`, `featured_image`, `floor_planning_image`, `video_image`, `price`, `purpose`, `type`, `beds`, `bath`, `area`, `video_url`, `status`, `latitude`, `longitude`, `created_at`, `updated_at`, `approve_status`) VALUES
(68, 38, NULL, 34, 7, 10, 36, '6666b34c937fc.png', '6666b34c941c5.png', '666bea08dddc9.png', 253.00, 'rent', 'residential', 3, 3, 1500, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '33.9758939850391', '-118.27765235664378', '2024-06-10 08:03:24', '2024-06-14 06:58:16', 1),
(69, 0, 27, 39, 7, 11, 30, '6666b7098aa2c.png', '6666b7098bf17.png', '666be9ef7930d.png', 2500.00, 'rent', 'commercial', NULL, NULL, 2987, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '25.790398717837395', '-80.19377044812097', '2024-06-10 08:19:21', '2024-06-14 06:57:51', 1),
(70, 0, 21, 37, 8, NULL, 38, '6666b81ccc1bf.png', '6666b81cccbdf.png', '666be9d99e2e9.png', 1865.00, 'rent', 'residential', 3, 2, 2578, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '53.565909293072174', '-113.56430079859676', '2024-06-10 08:23:56', '2024-06-14 06:57:29', 1),
(71, 0, NULL, 38, 7, 10, 36, '6666ba5b52e2e.jpg', '6666ba5b53897.png', '666be9b5b1659.png', 1258.00, 'rent', 'commercial', NULL, NULL, 2501, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '34.015424728025955', '-118.27969053883852', '2024-06-10 08:33:31', '2024-06-14 06:56:53', 1),
(72, 39, NULL, 34, 8, NULL, 38, '6666bb5a07293.jpg', '6666bb5a08315.png', '666be9a307975.png', 35878.00, 'rent', 'residential', 5, 3, 2800, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '53.518825', '-113.511808', '2024-06-10 08:37:46', '2024-06-14 06:56:35', 1),
(73, 36, NULL, 39, 7, 12, 32, '6666bc711a6c9.jpg', '666be99013654.png', '666be9901435b.png', 38545.00, 'rent', 'commercial', NULL, NULL, 12578, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '29.74566059605579', '-95.36594176541463', '2024-06-10 08:42:25', '2024-06-14 06:56:16', 1),
(74, 36, NULL, 38, 7, 11, 31, '6666c12e28972.jpg', '6666c12e291b5.png', '666be9c9a0561.png', 2874.00, 'rent', 'commercial', NULL, NULL, 1754, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '28.515769301647744', '-81.39473207622888', '2024-06-10 09:02:38', '2024-06-14 06:57:13', 1),
(75, 35, NULL, 36, 7, 12, 33, '6666c2b4523b9.jpg', '6666c2b454197.png', '666be96d58882.png', 2500.00, 'rent', 'residential', 3, 2, 1800, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '29.45471373274093', '-98.44186235091526', '2024-06-10 09:09:08', '2024-06-14 06:55:41', 1),
(76, 0, NULL, 35, 7, 10, 40, '6666db80c26f7.jpg', '6666db80c2f6f.png', '666be95438dc4.png', 500.00, 'rent', 'commercial', NULL, NULL, 400, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '37.763023736519635', '-122.42377480576295', '2024-06-10 10:54:56', '2024-06-14 06:55:16', 1),
(77, 37, NULL, 37, 9, NULL, 37, '6666de07a165b.jpg', '6666de07a2006.png', '666be944db0dd.png', 18451.00, 'rent', 'residential', 2, 1, 700, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '34.571172417269096', '69.1540456193226', '2024-06-10 11:05:43', '2024-06-14 06:55:00', 1),
(78, 38, 25, 35, 7, NULL, 31, '6666df58bf5e7.jpg', '6666df58c00cc.png', '666be934dbdc7.png', 12587.00, 'rent', 'commercial', NULL, NULL, 14945, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '28.475741040586485', '-81.47406092316122', '2024-06-10 11:11:20', '2024-06-14 06:54:44', 1),
(79, 36, NULL, 36, 7, 12, 32, '6666e100f1567.jpg', '6666e100f2231.png', '666be89ba5307.png', 250151.00, 'rent', 'residential', 4, 2, 1934, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '29.724237493639027', '-95.32889486324028', '2024-06-10 11:18:24', '2024-06-14 06:52:11', 1),
(80, 0, 21, 38, 8, NULL, 38, '6666e2fe9e3e8.jpg', '6666e2fe9f0f1.png', '666be88bc1ad0.png', 23454.00, 'rent', 'commercial', NULL, NULL, 1934, 'https://www.youtube.com/watch?v=mrpiPK8_up0', 1, '51.45584603424815', '-112.70527779864342', '2024-06-10 11:26:54', '2024-06-14 06:51:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `property_amenities`
--

CREATE TABLE `property_amenities` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` bigint UNSIGNED NOT NULL,
  `amenity_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_amenities`
--

INSERT INTO `property_amenities` (`id`, `property_id`, `amenity_id`, `created_at`, `updated_at`) VALUES
(726, 80, 11, '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(727, 80, 12, '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(728, 79, 10, '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(729, 79, 12, '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(730, 79, 14, '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(731, 78, 10, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(732, 78, 11, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(733, 78, 12, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(734, 78, 13, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(735, 78, 14, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(736, 78, 15, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(737, 77, 11, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(738, 77, 14, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(739, 77, 15, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(740, 76, 11, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(741, 76, 12, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(742, 76, 14, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(743, 75, 11, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(744, 75, 14, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(745, 75, 15, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(746, 73, 10, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(747, 73, 11, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(748, 73, 12, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(749, 73, 13, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(750, 73, 14, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(751, 73, 15, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(752, 72, 10, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(753, 72, 11, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(754, 72, 13, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(755, 72, 14, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(756, 72, 15, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(757, 71, 10, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(758, 71, 11, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(759, 71, 13, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(760, 71, 14, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(761, 71, 15, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(762, 74, 10, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(763, 74, 11, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(764, 74, 12, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(765, 74, 13, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(766, 74, 14, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(767, 74, 15, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(768, 70, 10, '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(769, 70, 11, '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(770, 70, 12, '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(771, 70, 13, '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(772, 70, 14, '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(773, 70, 15, '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(774, 69, 10, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(775, 69, 13, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(776, 69, 14, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(777, 69, 15, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(778, 68, 10, '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(779, 68, 11, '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(780, 68, 13, '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(781, 68, 15, '2024-06-14 06:58:16', '2024-06-14 06:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `property_categories`
--

CREATE TABLE `property_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'residential,commercial',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` int NOT NULL,
  `featured` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_categories`
--

INSERT INTO `property_categories` (`id`, `type`, `image`, `status`, `serial_number`, `featured`, `created_at`, `updated_at`) VALUES
(34, 'residential', '6666994de647c.png', '1', 1, 1, '2024-06-10 06:12:29', '2024-06-11 04:17:49'),
(35, 'commercial', '6667d04d1d9d0.png', '1', 2, 1, '2024-06-10 06:15:04', '2024-06-11 04:19:25'),
(36, 'residential', '66669a29099d1.png', '1', 3, 1, '2024-06-10 06:16:09', '2024-06-11 04:17:45'),
(37, 'residential', '66669a7b1b159.png', '1', 6, 1, '2024-06-10 06:17:31', '2024-06-11 04:19:58'),
(38, 'commercial', '66669ac0ebf93.png', '1', 5, 1, '2024-06-10 06:18:40', '2024-06-11 04:17:54'),
(39, 'commercial', '6667e8eccc476.png', '1', 4, 1, '2024-06-10 06:20:00', '2024-06-11 06:04:28'),
(40, 'commercial', '6667e91207d0f.png', '1', 7, 1, '2024-06-11 06:05:06', '2024-06-11 06:05:14'),
(41, 'residential', '6667e9f0bc9ba.png', '1', 8, 1, '2024-06-11 06:06:23', '2024-06-11 06:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `property_category_contents`
--

CREATE TABLE `property_category_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_category_contents`
--

INSERT INTO `property_category_contents` (`id`, `category_id`, `language_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(32, 34, 20, 'Apartment', 'apartment', '2024-06-10 06:12:29', '2024-06-10 06:12:29'),
(33, 34, 25, 'شقة', 'شقة', '2024-06-10 06:12:29', '2024-06-10 06:12:29'),
(34, 35, 20, 'Hotel', 'hotel', '2024-06-10 06:15:04', '2024-06-10 06:15:04'),
(35, 35, 25, 'الفندق', 'الفندق', '2024-06-10 06:15:04', '2024-06-10 06:15:04'),
(36, 36, 20, 'House', 'house', '2024-06-10 06:16:09', '2024-06-10 06:16:09'),
(37, 36, 25, 'منزل', 'منزل', '2024-06-10 06:16:09', '2024-06-10 06:16:09'),
(38, 37, 20, 'Pent House', 'pent-house', '2024-06-10 06:17:31', '2024-06-10 06:17:31'),
(39, 37, 25, 'كنة', 'كنة', '2024-06-10 06:17:31', '2024-06-10 06:17:31'),
(40, 38, 20, 'Building', 'building', '2024-06-10 06:18:40', '2024-06-10 06:18:40'),
(41, 38, 25, 'مبنى', 'مبنى', '2024-06-10 06:18:40', '2024-06-10 06:18:40'),
(42, 39, 20, 'Floor', 'floor', '2024-06-10 06:20:00', '2024-06-10 06:20:00'),
(43, 39, 25, 'أرضية', 'أرضية', '2024-06-10 06:20:00', '2024-06-10 06:20:00'),
(44, 40, 20, 'Shop', 'shop', '2024-06-11 06:05:06', '2024-06-11 06:05:06'),
(45, 40, 25, 'محل', 'محل', '2024-06-11 06:05:06', '2024-06-11 06:05:06'),
(46, 41, 20, 'Duplex', 'duplex', '2024-06-11 06:06:23', '2024-06-11 06:06:23'),
(47, 41, 25, 'دوبلكس', 'دوبلكس', '2024-06-11 06:06:23', '2024-06-11 06:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `property_cities`
--

CREATE TABLE `property_cities` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `serial_number` int DEFAULT NULL,
  `featured` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_cities`
--

INSERT INTO `property_cities` (`id`, `country_id`, `state_id`, `image`, `status`, `serial_number`, `featured`, `created_at`, `updated_at`) VALUES
(30, 7, 11, '66669e7016717.jpg', 1, 1, 1, '2024-06-01 06:51:18', '2024-06-10 06:34:27'),
(31, 7, 11, '66669eb287284.jpg', 1, 2, 1, '2024-06-01 06:51:42', '2024-06-10 06:35:54'),
(32, 7, 12, '6666a425ad6d5.png', 1, 3, 1, '2024-06-01 06:52:28', '2024-06-10 06:58:45'),
(33, 7, 12, '6666a43a8cc02.png', 1, 4, 0, '2024-06-01 06:52:52', '2024-06-10 06:59:06'),
(34, 10, NULL, '6666a465d42a1.png', 1, 6, 0, '2024-06-01 06:53:35', '2024-06-10 06:59:49'),
(35, 10, NULL, '6666a477af152.png', 1, 7, 0, '2024-06-01 06:53:59', '2024-06-10 07:00:07'),
(36, 7, 10, '66669ff7ab146.jpg', 1, 8, 1, '2024-06-01 06:55:00', '2024-06-10 06:40:55'),
(37, 9, NULL, '6666a49032dce.png', 1, 9, 1, '2024-06-01 06:55:44', '2024-06-10 07:01:06'),
(38, 8, NULL, '6666a3fab2c50.png', 1, 10, 1, '2024-06-01 06:56:33', '2024-06-10 06:58:02'),
(39, 10, NULL, '665ae26798dbc.jpg', 1, 11, 0, '2024-06-01 06:57:11', '2024-06-01 06:57:11'),
(40, 7, 10, '665ae2b076586.webp', 1, 12, 0, '2024-06-01 06:58:24', '2024-06-01 06:58:24'),
(41, 9, NULL, '6666a44c876a8.png', 1, 5, 0, '2024-06-01 06:59:42', '2024-06-10 06:59:24');

-- --------------------------------------------------------

--
-- Table structure for table `property_city_contents`
--

CREATE TABLE `property_city_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `city_id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_city_contents`
--

INSERT INTO `property_city_contents` (`id`, `city_id`, `language_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(30, 30, 20, 'Miami', '', '2024-06-01 06:51:18', '2024-06-10 06:34:24'),
(31, 31, 20, 'Orlando', '', '2024-06-01 06:51:42', '2024-06-10 06:35:30'),
(32, 32, 20, 'Houston', '', '2024-06-01 06:52:28', '2024-06-10 06:58:45'),
(33, 33, 20, 'San Antonio', '', '2024-06-01 06:52:52', '2024-06-10 06:59:06'),
(34, 34, 20, 'Gaza City', '', '2024-06-01 06:53:35', '2024-06-10 06:59:49'),
(35, 35, 20, 'Rafah', '', '2024-06-01 06:53:59', '2024-06-10 07:00:07'),
(36, 36, 20, 'Los Angeles', '', '2024-06-01 06:55:00', '2024-06-10 06:40:55'),
(37, 37, 20, 'Kabul', '', '2024-06-01 06:55:44', '2024-06-10 07:00:32'),
(38, 38, 20, 'Alberta', '', '2024-06-01 06:56:33', '2024-06-10 06:41:38'),
(39, 39, 20, 'Jerusalem', 'jerusalem', '2024-06-01 06:57:11', '2024-06-01 06:57:11'),
(40, 40, 20, 'San Francisco', 'san-francisco', '2024-06-01 06:58:24', '2024-06-01 06:58:24'),
(41, 41, 20, 'Jalalabad', '', '2024-06-01 06:59:42', '2024-06-10 06:59:24'),
(42, 30, 25, 'ميامي', '', '2024-06-10 06:34:24', '2024-06-10 06:34:24'),
(43, 31, 25, 'أورلاندو', '', '2024-06-10 06:35:30', '2024-06-10 06:35:30'),
(44, 36, 25, 'لوس أنجلوس', '', '2024-06-10 06:40:55', '2024-06-10 06:40:55'),
(45, 38, 25, 'ألبرتا', '', '2024-06-10 06:41:38', '2024-06-10 06:41:38'),
(46, 32, 25, 'هيوستن', '', '2024-06-10 06:58:45', '2024-06-10 06:58:45'),
(47, 33, 25, 'سان أنطونيو', '', '2024-06-10 06:59:06', '2024-06-10 06:59:06'),
(48, 41, 25, 'جلال اباد', '', '2024-06-10 06:59:24', '2024-06-10 06:59:24'),
(49, 34, 25, 'مدينة غزة', '', '2024-06-10 06:59:49', '2024-06-10 06:59:49'),
(50, 35, 25, 'رفح', '', '2024-06-10 07:00:07', '2024-06-10 07:00:07'),
(51, 37, 25, 'كابول', '', '2024-06-10 07:00:32', '2024-06-10 07:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `property_contacts`
--

CREATE TABLE `property_contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `agent_id` bigint UNSIGNED DEFAULT NULL,
  `property_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_contents`
--

CREATE TABLE `property_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` int UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` longtext COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_contents`
--

INSERT INTO `property_contents` (`id`, `property_id`, `language_id`, `title`, `slug`, `address`, `description`, `meta_keyword`, `meta_description`, `created_at`, `updated_at`) VALUES
(68, 68, 20, 'Blues Modern House in Town', 'blues-modern-house-in-town', '241 W 71st St, Los Angeles, CA 90003, USA', '<p>Cras ultricies ligula sed magna dictum porta. Nulla quis lorem ut libero malesuada feugiat Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vestibulum ante ipsum primis in faucibus orci luctus etru ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullam corper sit amet ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n<p class=\"m-0\">Praesent lectus facilisi tempor ridiculus arcu pharetra non tellus. Torquent nisl tempor Magnis mollis lobortis nam, montes ut, consequat sed amet nullam.</p>', NULL, NULL, '2024-06-10 08:03:25', '2024-06-11 05:57:10'),
(69, 68, 25, 'البلوز البيت الحديث', 'البلوز-البيت-الحديث', 'لوس أنجلوس، كاليفورنيا، الولايات المتحدة الأمريكية', '<div> التفاصيل لتكتشف حقيقة وأساس تلك السعادة البشرية، فلا أحد يرفض أو يكره أو يتجنب الشعور بالسعادة، ولكن بفضل هؤلاء الأشخاص الذين لا يدركون بأن السعادة لا بد أن نستشعرها بصورة أكثر عقلانية ومنطقية فيعرضهم هذا لمواجهة الظروف الأليمة، وأكرر بأنه لا يوجد من يرغب في الحب ونيل المنال ويتلذذ بالآلام، الألم هو الألم ولكن نتيجة لظروف ما قد تكمن السعاده فيما نتحمله من كد وأسي.</div>\r\n<div> </div>\r\n<div>و سأعرض مثال حي لهذا، من منا لم يتحمل جهد بدني شاق إلا من أجل الحصول على ميزة أو فائدة؟ ولكن من لديه الحق أن ينتقد شخص ما أراد أن يشعر بالسعادة التي لا تشوبها عواقب أليمة أو آخر أراد أن يتجنب الألم الذي ربما تنجم عنه بعض المتعة ؟ </div>\r\n<div>علي الجانب الآخر نشجب ونستنكر هؤلاء الرجال المفتونون بنشوة اللحظة الهائمون في رغباتهم فلا يدركون ما يعقبها من الألم والأسي المحتم، واللوم كذلك يشمل هؤلاء الذين أخفقوا في واجباتهم نتيجة لضعف إرادتهم فيتساوي مع هؤلاء الذين يتجنبون وينأون عن تحمل الكدح والألم .</div>\r\n<div>       </div>', NULL, NULL, '2024-06-10 08:03:25', '2024-06-13 08:52:21'),
(70, 69, 20, 'Modern Floor with Private Entrance', 'modern-floor-with-private-entrance', '1555 NE Miami Ct, Miami, FL 33132, United States', '<p>Welcome home! This exquisite two-story townhouse nestled in the community of Sabal Chase boasts 3 bedrooms, including one conveniently located on the first floor, and 2 bathrooms. The thoughtfully crafted layout offers plenty of natural light, enhancing the spacious rooms and tranquil patio area. Imagine savoring morning coffee or hosting intimate gatherings here. Situated near a greenbelt, residents can enjoy endless opportunities for outdoor recreation, while also having easy access to the community clubhouse that is equipped with a pool, gym, and various courts for basketball, tennis, pickleball and racquetball. With top-rated schools, the FL Turnpike, restaurants, Miami Dade College, and a number of shopping options just moments away, this location truly offers convenience and comfort.</p>', NULL, NULL, '2024-06-10 08:19:21', '2024-06-10 08:19:21'),
(71, 69, 25, 'طابق حديث بمدخل خاص', 'طابق-حديث-بمدخل-خاص', 'ميامي، فلوريدا، الولايات المتحدة', '<p>مرحبا بك في البيت! يقع هذا المنزل المستقل الرائع المكون من طابقين في مجتمع Sabal Chase، ويضم 3 غرف نوم، بما في ذلك واحدة تقع في مكان مناسب في الطابق الأول وحمامين. يوفر التصميم المصمم بعناية الكثير من الضوء الطبيعي، مما يعزز الغرف الفسيحة ومنطقة الفناء الهادئة. تخيل تذوق قهوة الصباح أو استضافة التجمعات الحميمة هنا. يقع بالقرب من الحزام الأخضر، ويمكن للمقيمين الاستمتاع بفرص لا حصر لها للاستجمام في الهواء الطلق، مع سهولة الوصول أيضًا إلى النادي المجتمعي المجهز بمسبح وصالة ألعاب رياضية وملاعب مختلفة لكرة السلة والتنس وكرة المخلل وكرة المضرب. مع المدارس ذات التصنيف العالي، وFL Turnpike، والمطاعم، وكلية Miami Dade، وعدد من خيارات التسوق على بعد لحظات فقط، فإن هذا الموقع يوفر حقًا الراحة والمتعة.</p>\r\n<p>يمتد هذا المنزل العائلي الرائع المكون من 4 غرف نوم و2.5 حمام في مجتمع البحيرات الإسبانية في هياليه على مساحة 2780 قدمًا مربعًا. يتميز هذا المطبخ الراقي بأجهزة سلسلة المقهى حسب الطلب، وكوة من الطوب، وخزائن ذات لونين مع أسطح من الكوارتز. يشتمل الجناح الأساسي الكبير على سقف صينية وغرفة جلوس مثالية للمكتب أو الحضانة. يتميز الحمام الداخلي المذهل بخزائن شاكر زرقاء ملفوفة وحوض استحمام روماني ودش منفصل. استمتع بالمعيشة الداخلية والخارجية مع جدار من الأبواب الزجاجية التي تفتح على الفناء الفسيح والفناء.</p>', NULL, NULL, '2024-06-10 08:19:21', '2024-06-13 08:51:31'),
(72, 70, 20, 'Chic Penthouse with Rooftop Acces', 'chic-penthouse-with-rooftop-acces', '11508 140 St NW, Edmonton, AB T5M 1S7, Canada', '<p>This exquisite 4-bed, 2.5-bath single-family home in Hialeah\'s Spanish Lakes community spans 2,780 sq ft. This high end kitchen features in-demand Cafe Series appliances, a brick alcove, and two-toned cabinetry with quartz countertops. The grand primary suite includes a tray ceiling and a sitting room ideal for an office or nursery. The stunning ensuite bath boasts wraparound blue shaker cabinetry, a Roman tub, and a separate shower. Enjoy indoor/outdoor living with a wall of glass doors opening to the spacious patio and yard.</p>', NULL, NULL, '2024-06-10 08:23:56', '2024-06-10 08:23:56'),
(73, 70, 25, 'بنتهاوس أنيق مع إمكانية الوصول إلى السطح', 'بنتهاوس-أنيق-مع-إمكانية-الوصول-إلى-السطح', 'سانت إن دبليو، إدمونتون، كندا', '<p>يمتد هذا المنزل العائلي الرائع المكون من 4 غرف نوم و2.5 حمام في مجتمع البحيرات الإسبانية في هياليه على مساحة 2780 قدمًا مربعًا. يتميز هذا المطبخ الراقي بأجهزة سلسلة المقهى حسب الطلب، وكوة من الطوب، وخزائن ذات لونين مع أسطح من الكوارتز. يشتمل الجناح الأساسي الكبير على سقف صينية وغرفة جلوس مثالية للمكتب أو الحضانة. يتميز الحمام الداخلي المذهل بخزائن شاكر زرقاء ملفوفة وحوض استحمام روماني ودش منفصل. استمتع بالمعيشة الداخلية والخارجية مع جدار من الأبواب الزجاجية التي تفتح على الفناء الفسيح والفناء.</p>\r\n<p>زرقاء ملفوفة وحوض استحمام روماني ودش منفصل. استمتع بالمعيشة الداخلية والخارجية مع جدار من الأبواب الزجاجية التي تفتح على الفناء الفسيح والفناء.</p>', NULL, NULL, '2024-06-10 08:23:56', '2024-06-13 08:49:53'),
(74, 71, 20, 'Elegant Duplex with Private Yard', 'elegant-duplex-with-private-yard', '3761 S Hill St, Los Angeles, CA 90007, USA', '<p>Welcome to your cozy haven in beautiful Cutler Bay! This charming 3-bed, 2-bath home is perfect for families seeking comfort and convenience. With spacious living areas and plenty of natural light, it\'s great for gatherings or just relaxing. Remodeled and ready to make it your own. There\'s a community pool and walking paths for outdoor fun. Plus, you\'re only 45 minutes from the Florida Keys for weekend adventures! Enjoy the laid-back lifestyle you\'ve been dreaming of in this lovely neighborhood. Well connected to public transportation.</p>', NULL, NULL, '2024-06-10 08:33:31', '2024-06-10 08:33:31'),
(75, 71, 25, 'دوبلكس أنيق مع ساحة خاصة', 'دوبلكس-أنيق-مع-ساحة-خاصة', 'شارع إس هيل، لوس أنجلوس، كاليفورنيا، الولايات المتحدة الأمريكية', '<p>مرحبًا بك في ملاذك المريح في خليج كاتلر الجميل! هذا المنزل الساحر المكون من 3 غرف نوم وحمامين مثالي للعائلات التي تبحث عن الراحة والملاءمة. مع مناطق معيشة واسعة ووفرة من الضوء الطبيعي، فهي مكان رائع للتجمعات أو مجرد الاسترخاء. تم إعادة تشكيلها وجاهزة لجعلها خاصة بك. يوجد حمام سباحة مجتمعي ومسارات للمشي للمتعة في الهواء الطلق. بالإضافة إلى ذلك، أنت على بعد 45 دقيقة فقط من فلوريدا كيز لمغامرات نهاية الأسبوع! استمتع بأسلوب الحياة المريح الذي كنت تحلم به في هذا الحي الجميل. متصل بشكل جيد بوسائل النقل العام.</p>\r\n<p> </p>\r\n<p>مرحبًا بك في ملاذك المريح في خليج كاتلر الجميل! هذا المنزل الساحر المكون من 3 غرف نوم وحمامين مثالي للعائلات التي تبحث عن الراحة والملاءمة. مع مناطق معيشة واسعة ووفرة من الضوء الطبيعي، فهي مكان رائع للتجمعات أو مجرد الاسترخاء. تم إعادة تشكيلها وجاهزة لجعلها خاصة بك. يوجد حمام سباحة مجتمعي ومسارات للمشي للمتعة في الهواء الطلق. بالإضافة إلى ذلك، أنت على بعد 45 دقيقة فقط من فلوريدا كيز لمغامرات نهاية الأسبوع! استمتع بأسلوب الحياة المريح الذي كنت تحلم به في هذا الحي الجميل. متصل بشكل جيد بوسائل النقل العام.</p>', NULL, NULL, '2024-06-10 08:33:31', '2024-06-13 08:48:57'),
(76, 72, 20, 'Elegant Apartment with Natural Light', 'elegant-apartment-with-natural-light', '10845 83 Ave NW, Edmonton, AB T6E 2E6, Canada', '<p>Fantastic Ocean View from this updated 2 BR/2 bath in a Luxury Building with excellent amenities. Washer/Dryer in unit, porcelain floors, gorgeous quartz counter tops, SS appliances, separate shower &amp; roman tub in main bath. Pets ok and many amenities in building including gym, spa, covered park, multi common spaces, business ctr. &amp; more. All Utilities, Cable, &amp; Internet included in Assoc. quarterly fees. Selling furnished, Turn Key. Can rent right away as 1BR and separate studio OR full 2 BR, w/90 day min. (OR use Hilton daily rental program for daily, weekly or monthly rentals when you are not using it). Great for investors or owner occupant. Walkable to everything, 2 parks, (one w/golf), in same block. You\'ll feel like you\'re on vacation every day in this beachside luxury condo.</p>', NULL, NULL, '2024-06-10 08:37:46', '2024-06-10 08:37:46'),
(77, 72, 25, 'شقة أنيقة مع الضوء الطبيعي', 'شقة-أنيقة-مع-الضوء-الطبيعي', 'افي ادمونتون، كندا', '<p>إطلالة رائعة على المحيط من هذا الحمام المحدث المكون من غرفتي نوم/2 في مبنى فاخر مع وسائل راحة ممتازة. غسالة / مجفف في الوحدة وأرضيات بورسلين وأسطح منضدة كوارتز رائعة وأجهزة SS ودش منفصل وحوض استحمام روماني في الحمام الرئيسي. الحيوانات الأليفة جيدة والعديد من وسائل الراحة في المبنى بما في ذلك صالة الألعاب الرياضية والمنتجع الصحي والمنتزه المغطى والمساحات المشتركة المتعددة ومركز الأعمال. &amp; أكثر. جميع المرافق والكابلات والإنترنت متضمنة في Assoc. رسوم ربع سنوية. بيع مفروش، تسليم المفتاح. يمكن استئجارها على الفور كغرفة نوم واحدة واستوديو منفصل أو غرفتين نوم كاملتين، لمدة 90 يومًا كحد أدنى. (أو استخدم برنامج التأجير اليومي من هيلتون للتأجير اليومي أو الأسبوعي أو الشهري عندما لا تستخدمه). رائعة للمستثمرين أو المالك. يمكن المشي إلى كل شيء، ومتنزهين (أحدهما مع ملعب جولف)، في نفس المبنى. ستشعر وكأنك في إجازة كل يوم في هذه الشقة الفاخرة المطلة على الشاطئ.</p>', NULL, NULL, '2024-06-10 08:37:46', '2024-06-13 08:48:09'),
(78, 73, 20, 'Fully Furnished Floor Ready for Move-In', 'fully-furnished-floor-ready-for-move-in', '2019 Crawford St, Houston, TX 77002, United States', '<p>Rarely available spacious 3 bedroom, 2.5 bathrooms at Sunset Harbour. Tastefully updated and completely turnkey. Enjoy eastern views of Miami Beach from one of 2 balconies from the master bedroom. The spacious master bathroom features a luxurious soaking tub as well as a separate shower.<br /><br />Open kitchen with marble countertop with plenty of room to prepare gourmet meals.<br /><br />The condo has many custom-built features that must be seen. Sunset Harbour Drive is one of the most desirable Miami Beach Neighborhoods, filled with great restaurants, shops and things to do, up for renting a paddle board or going to yoga studio?<br /><br />Sunset Harbour South is a full-service building with many amenities.</p>', NULL, NULL, '2024-06-10 08:42:25', '2024-06-13 04:41:09'),
(79, 73, 25, 'أرضية مفروشة بالكامل وجاهزة للانتقال إليها', 'أرضية-مفروشة-بالكامل-وجاهزة-للانتقال-إليها', 'كروفورد ستريت، هيوستن، تكساس 77002، الولايات المتحدة', '<p>نادرًا ما تتوفر 3 غرف نوم فسيحة و2.5 حمام في Sunset Harbour. تم تحديثه بذوق وتسليم المفتاح بالكامل. استمتع بالمناظر الشرقية لشاطئ ميامي من إحدى الشرفتين في غرفة النوم الرئيسية. يتميز الحمام الرئيسي الفسيح بحوض استحمام فاخر بالإضافة إلى دش منفصل.</p>\r\n<p>مطبخ مفتوح مع سطح رخامي مع مساحة كبيرة لإعداد وجبات الطعام اللذيذة.</p>\r\n<p>تحتوي الشقة على العديد من الميزات المصممة خصيصًا والتي يجب رؤيتها. يعد Sunset Harbour Drive واحدًا من أكثر أحياء ميامي بيتش المرغوبة، فهو مليء بالمطاعم والمتاجر الرائعة والأشياء التي يمكنك القيام بها، أو استئجار لوح تجديف أو الذهاب إلى استوديو اليوغا؟</p>\r\n<p>صن ست هاربور ساوث عبارة عن مبنى متكامل الخدمات يضم العديد من وسائل الراحة.</p>', NULL, NULL, '2024-06-10 08:42:25', '2024-06-13 08:47:15'),
(80, 74, 20, 'Commercial Building in High-Traffic Area', 'commercial-building-in-high-traffic-area', '1238 W Michigan St, Orlando, FL 32805, USA', '<p>Located in the heart of the city, spectacular corner unit 2 bed / 2 bath of 1,538 Sqf. The impeccably designed interiors feature high-end finishes. Large master bedroom with walk-in closet, master bathroom with separate shower and tub with 2 sinks, marble counter tops, stainless steel appliances, kitchen with elegant marble counter tops, every detail adds elegance, stone floors. Enjoy this luxurious apartment that offers comfort, with stunning panoramic sunset views with large floor-to-ceiling windows. Enjoy of 34 acres exclusive club house, access to gym, inside pool and amenities. Experience urban living at its finest in this prestigious residence, with private restaurants only for resident, supermarkets, bars and shops within walking distance,Miami Shores Country Club of Golf 2 min away</p>', NULL, NULL, '2024-06-10 09:02:38', '2024-06-10 09:02:38'),
(81, 74, 25, 'مبنى تجاري في منطقة ذات حركة مرور عالية', 'مبنى-تجاري-في-منطقة-ذات-حركة-مرور-عالية', '1238 دبليو شارع ميشيغان، أورلاندو، فلوريدا 32805، الولايات المتحدة الأمريكية', '<p>تقع في قلب المدينة، وحدة زاوية مذهلة مكونة من 2 سرير / 2 حمام بمساحة 1,538 قدم مربع. تتميز التصميمات الداخلية المصممة بدقة بتشطيبات راقية. غرفة نوم رئيسية كبيرة مع خزانة ملابس كبيرة، وحمام رئيسي مع دش منفصل وحوض استحمام مع مغسلتين، وأسطح من الرخام، وأجهزة من الفولاذ المقاوم للصدأ، ومطبخ مع أسطح من الرخام الأنيق، كل التفاصيل تضيف الأناقة، والأرضيات الحجرية. استمتع بهذه الشقة الفاخرة التي توفر الراحة، مع إطلالات بانورامية خلابة على غروب الشمس ونوافذ كبيرة ممتدة من الأرض حتى السقف. استمتع بنادي حصري مساحته 34 فدانًا، وإمكانية الوصول إلى صالة الألعاب الرياضية وحمام السباحة الداخلي ووسائل الراحة. استمتع بالحياة الحضرية في أفضل حالاتها في هذا السكن المرموق، مع مطاعم خاصة للمقيمين فقط ومحلات السوبر ماركت والبارات والمحلات التجارية على مسافة قريبة، ويقع نادي ميامي شورز الريفي للجولف على بعد دقيقتين</p>', NULL, NULL, '2024-06-10 09:02:38', '2024-06-13 08:46:21'),
(82, 75, 20, 'Affordable Home Near Schools', 'affordable-home-near-schools', '2930 Marvin R Wood Rd, Fort Sam Houston, TX 78234, USA', '<p>Turnkey, immaculate unit available at The Club, situated right in the heart of Brickell. The building allows short-term rentals, including nightly, weekly, and monthly options, all of which are approved. The unit is predominantly occupied for short-term rentals and is nearly always fully booked. Ken Griffin\'s Citadel\'s future site is located directly adjacent to the east, promising to enhance an area that\'s already thriving. Enjoy the convenience of walking to any destination in Brickell/Downtown Miami, or take advantage of the free trolley &amp; train to explore nearby neighborhoods. It\'s an ideal location for both tourism and city living, with amenities such as two pools, a jacuzzi, sauna, children\'s playroom, a billiard room for all ages, a gym, 24-hour security, and much more</p>', NULL, NULL, '2024-06-10 09:09:08', '2024-06-10 09:09:08'),
(83, 75, 25, 'منزل بأسعار معقولة بالقرب من المدارس', 'منزل-بأسعار-معقولة-بالقرب-من-المدارس', '2930 طريق مارفن آر وود، فورت سام هيوستن، تكساس 78234، الولايات المتحدة الأمريكية', '<p>وحدة جاهزة ونظيفة متاحة في The Club، وتقع مباشرة في قلب مدينة بريكل. يسمح المبنى بالإيجارات قصيرة الأجل، بما في ذلك الخيارات الليلية والأسبوعية والشهرية، وجميعها معتمدة. الوحدة مشغولة في الغالب للإيجارات قصيرة الأجل وتكون دائمًا محجوزة بالكامل تقريبًا. يقع الموقع المستقبلي لقلعة كين غريفين بجوار الشرق مباشرة، مما يعد بتعزيز المنطقة المزدهرة بالفعل. استمتع براحة المشي إلى أي وجهة في بريكل/وسط مدينة ميامي، أو استفد من العربة والقطار المجانيين لاستكشاف الأحياء المجاورة. إنه موقع مثالي للسياحة والمعيشة في المدينة، مع وسائل الراحة مثل حمامي سباحة، وجاكوزي، وساونا، وغرفة ألعاب للأطفال، وغرفة بلياردو لجميع الأعمار، وصالة ألعاب رياضية، وأمن على مدار 24 ساعة، وأكثر من ذلك بكثير.</p>', NULL, NULL, '2024-06-10 09:09:08', '2024-06-13 08:45:21'),
(84, 76, 20, 'Luxury Condo with Stunning City Views', 'luxury-condo-with-stunning-city-views', '501 Guerrero St, San Francisco, CA 94110, USA', '<p>BY APPOINTMENTS ONLY !! 2-bedroom, 2-bathroom manufactured home in the heart of Sweetwater, FL 33172. Nestled in a central location, this residence offers convenience to nearby shopping plazas, ensuring that daily errands and retail therapy are just moments away. The home itself boasts a cozy and welcoming ambiance, with ample space for relaxation and entertaining. The well-appointed bedrooms provide comfort and privacy, while the bathrooms are modern and stylish. Whether you\'re enjoying the local amenities or unwinding in your own oasis, this manufactured home offers the perfect blend of comfort and convenience in a desirable location.</p>', NULL, NULL, '2024-06-10 10:54:56', '2024-06-10 10:54:56'),
(85, 76, 25, 'شقة فاخرة مع إطلالات مذهلة على المدينة', 'شقة-فاخرة-مع-إطلالات-مذهلة-على-المدينة', '501 شارع غيريرو، سان فرانسيسكو، كاليفورنيا 94110، الولايات المتحدة الأمريكية', '<p>عن طريق المواعيد فقط !! منزل مُصنع مكون من غرفتي نوم وحمامين في قلب سويتواتر، فلوريدا 33172. يقع هذا السكن في موقع مركزي، ويوفر الراحة لساحات التسوق القريبة، مما يضمن أن المهمات اليومية والعلاج بالتجزئة على بعد لحظات فقط. يتميز المنزل نفسه بأجواء مريحة وترحيبية، مع مساحة واسعة للاسترخاء والترفيه. توفر غرف النوم المجهزة تجهيزاً جيداً الراحة والخصوصية، في حين أن الحمامات حديثة وأنيقة. سواء كنت تستمتع بوسائل الراحة المحلية أو تسترخي في واحتك الخاصة، فإن هذا المنزل المصنّع يوفر مزيجًا مثاليًا من الراحة والملاءمة في موقع مرغوب فيه.</p>', NULL, NULL, '2024-06-10 10:54:56', '2024-06-13 08:44:31'),
(86, 77, 20, 'High-End Penthouse with Premium Finishes', 'high-end-penthouse-with-premium-finishes', 'H5C3+CHV district 15, Serahi Khowaja boghra, Kabul, Afghanistan', '<p>Discover Sofi House, a premier 5-story residence built in 2019, nestled in the coveted South of Fifth area. Spanning a total of 4,437SF, this corner unit boast Artefacto furnishings and elite Miele &amp; Sub-Zero appliances. The private rooftop pool and personal elevator stand out, offering unparalleled luxury and convenience. Additional highlights include a secluded master suite, separate levels for guest accommodations, and lush balconies for true indoor/outdoor living. Just moments from pristine beaches and fine dining, it merges the privacy of a single-family home with the practicality of townhome living.</p>', NULL, NULL, '2024-06-10 11:05:43', '2024-06-10 11:05:43'),
(87, 77, 25, 'بنتهاوس راقي بتشطيبات متميزة', 'بنتهاوس-راقي-بتشطيبات-متميزة', 'منطقة سراهي خواجة بوغرا، كابول، أفغانستان', '<p>اكتشف البيت، وهو مسكن رئيسي مكون من 5 طوابق، يقع في المنطقة الجنوبية المرغوبة. تمتد وحدة الزاوية هذه بشكل إجمالي وتتميز بمفروشات وأجهزة فاخرة. يبرز المسبح الخاص الموجود على السطح والمصعد الشخصي، مما يوفر رفاهية وراحة لا مثيل لها. تشمل الميزات الإضافية جناحًا رئيسيًا منعزلاً ومستويات منفصلة لأماكن إقامة الضيوف وشرفات مورقة للمعيشة الداخلية والخارجية الحقيقية. على بعد لحظات فقط من الشواطئ النقية والمطاعم الفاخرة، فهو يدمج خصوصية منزل عائلة واحدة مع التطبيق العملي للعيش في منزل مستقل.</p>', NULL, NULL, '2024-06-10 11:05:43', '2024-06-13 08:43:07'),
(88, 78, 20, 'Elegant Home in Quiet Neighborhood', 'elegant-home-in-quiet-neighborhood', '5911 Turkey Lake Rd, Orlando, FL 32819, USA', '<p>Own a lanai apartment with a delightful 97\' patio, tax roll initially designated it as a 2/2 with 1409 sq ft, but it has been modified to a 1/1.5 with an extra den (bedroom). The updated kitchen features new appliances, and ample storage space with a hookup for a washer and dryer.<br />This meticulously maintained unit offers a flexible layout, providing an option to move in seamlessly. The open floor plan connects living and dining areas, creating an ideal space for entertainment or relaxation. Beyond the interior, the lanai apartment offers a unique outdoor experience. The 97\' patio extends your living space, perfect for enjoying the tropical climate.<br />A private gateway to the pool and steps away from the beach provides convenient leisure opportunities. Paradise awaits in your new lanai!</p>', NULL, NULL, '2024-06-10 11:11:20', '2024-06-10 11:11:20'),
(89, 78, 25, 'منزل أنيق في حي هادئ', 'منزل-أنيق-في-حي-هادئ', 'طريق بحيرة تركيا، أورلاندو، فلوريدا، الولايات المتحدة الأمريكية', '<p>امتلك شقة لاناي مع فناء مبهج بمساحة 97 قدمًا، وقد حددتها قائمة الضرائب في البداية على أنها 2/2 بمساحة 1409 قدمًا مربعًا، ولكن تم تعديلها إلى 1 / 1.5 مع غرفة نوم إضافية. يتميز المطبخ المحدث بأجهزة جديدة ومساحة تخزين واسعة مع وصلة لغسالة ومجفف.<br />توفر هذه الوحدة التي تمت صيانتها بدقة تصميمًا مرنًا، مما يوفر خيارًا للتحرك بسلاسة. يربط مخطط الطابق المفتوح بين مناطق المعيشة وتناول الطعام، مما يخلق مساحة مثالية للترفيه أو الاسترخاء. بالإضافة إلى التصميم الداخلي، توفر شقة الشرفة تجربة فريدة من نوعها في الهواء الطلق. يوسع الفناء الذي تبلغ مساحته 97 قدمًا مساحة معيشتك، وهو مثالي للاستمتاع بالمناخ الاستوائي.<br />توفر البوابة الخاصة للمسبح والتي تقع على بعد خطوات من الشاطئ فرصًا ترفيهية مريحة. الجنة تنتظرك في شرفتك الجديدة!</p>\r\n<p> </p>\r\n<p>توفر هذه الوحدة التي تمت صيانتها بدقة تصميمًا مرنًا، مما يوفر خيارًا للتحرك بسلاسة. يربط مخطط الطابق المفتوح بين مناطق المعيشة وتناول الطعام، مما يخلق مساحة مثالية للترفيه أو الاسترخاء. بالإضافة إلى التصميم الداخلي، توفر شقة الشرفة تجربة فريدة من نوعها في الهواء الطلق. يوسع الفناء الذي تبلغ مساحته 97 قدمًا مساحة معيشتك، وهو مثالي للاستمتاع بالمناخ الاستوائي.</p>', NULL, NULL, '2024-06-10 11:11:20', '2024-06-13 08:41:01'),
(90, 79, 20, 'Renovated House with Contemporary Features', 'renovated-house-with-contemporary-features', 'Lombardy St, Houston, TX 77023, USA', '<p>Charming studio available in vibrant South Beach. This cute, well-lit space offers a cozy haven in the heart of the lively community. New AC May 2024. With proximity to the beach, Flamingo Park and Lincoln Rd, this studio is an ideal opportunity for those seeking a delightful Miami lifestyle.<br /><br />Own a lanai apartment with a delightful 97\' patio, tax roll initially designated it as a 2/2 with 1409 sq ft, but it has been modified to a 1/1.5 with an extra den (bedroom). The updated kitchen features new appliances, and ample storage space with a hookup for a washer and dryer.<br />This meticulously maintained unit offers a flexible layout, providing an option to move in seamlessly. The open floor plan connects living and dining areas, creating an ideal space for entertainment or relaxation. Beyond the interior, the lanai apartment offers a unique outdoor experience. The 97\' patio extends your living space, perfect for enjoying the tropical climate.<br />A private gateway to the pool and steps away from the beach provides convenient leisure opportunities. Paradise awaits in your new lanai!</p>', NULL, NULL, '2024-06-10 11:18:25', '2024-06-10 11:18:25'),
(91, 79, 25, 'منزل تم تجديده بميزات معاصرة', 'منزل-تم-تجديده-بميزات-معاصرة', 'شارع لومباردي، هيوستن، تكساس ، الولايات المتحدة الأمريكية', '<p>استوديو ساحر متاح في الشاطئ الجنوبي النابض بالحياة. توفر هذه المساحة اللطيفة والمضاءة جيدًا ملاذًا مريحًا في قلب المجتمع النابض بالحياة. مكيف هواء جديد مايو 2024. مع قربه من الشاطئ ومتنزه فلامنغو وطريق لينكولن، يعد هذا الاستوديو فرصة مثالية لأولئك الذين يبحثون عن أسلوب حياة مبهج في ميامي.</p>\r\n<p>امتلك شقة لاناي مع فناء مبهج بمساحة 97 قدمًا، وقد حددتها قائمة الضرائب في البداية على أنها 2/2 بمساحة 1409 قدمًا مربعًا، ولكن تم تعديلها إلى 1 / 1.5 مع غرفة نوم إضافية. يتميز المطبخ المحدث بأجهزة جديدة ومساحة تخزين واسعة مع وصلة لغسالة ومجفف.<br />توفر هذه الوحدة التي تمت صيانتها بدقة تصميمًا مرنًا، مما يوفر خيارًا للتحرك بسلاسة. يربط مخطط الطابق المفتوح بين مناطق المعيشة وتناول الطعام، مما يخلق مساحة مثالية للترفيه أو الاسترخاء. بالإضافة إلى التصميم الداخلي، توفر شقة الشرفة تجربة فريدة من نوعها في الهواء الطلق. يوسع الفناء الذي تبلغ مساحته 97 قدمًا مساحة معيشتك، وهو مثالي للاستمتاع بالمناخ الاستوائي.<br />توفر البوابة الخاصة للمسبح والتي تقع على بعد خطوات من الشاطئ فرصًا ترفيهية مريحة. الجنة تنتظرك في شرفتك الجديدة!</p>', NULL, NULL, '2024-06-10 11:18:25', '2024-06-13 08:39:54'),
(92, 80, 20, 'Prime Commercial Building for Rent', 'prime-commercial-building-for-rent', 'SE, Drumheller, AB T0J 0Y6, Canada', '<p>Welcome to luxury living at its finest! This stunning penthouse offers the pinnacle of elegance and sophistication. With 4 bedrooms, 4.5 baths, and a sprawling 3115 of living space, this designer masterpiece is sure to impress. Step outside onto the huge open terrace and be captivated by the breathtaking sunset views. Entertain friends and family in style with the summer kitchen and jacuzzi, creating memories that will last a lifetime. The masterful layout and one-story living make this penthouse a truly unique find. Discover the renowned Brickell City Centre shops just steps away. Experience the best of luxury living in Brickell. Don\'t miss your chance to own this remarkable penthouse!</p>', NULL, NULL, '2024-06-10 11:26:54', '2024-06-10 11:26:54'),
(93, 80, 25, 'مبنى تجاري رئيسي للإيجار', 'مبنى-تجاري-رئيسي-للإيجار', 'درومهيلر، كندا', '<p>مرحبًا بكم في الحياة الفاخرة في أفضل حالاتها! يوفر هذا البنتهاوس المذهل قمة الأناقة والرقي. مع 4 غرف نوم و4.5 حمامات ومساحة معيشة مترامية الأطراف تبلغ 3115، من المؤكد أن هذه التحفة الفنية ستثير الإعجاب. اخرج إلى التراس المفتوح الضخم واستمتع بمناظر غروب الشمس الخلابة. قم بترفيه الأصدقاء والعائلة بأناقة مع المطبخ الصيفي والجاكوزي، مما يخلق ذكريات تدوم مدى الحياة. التصميم الرائع والمعيشة المكونة من طابق واحد تجعل من هذا البنتهاوس اكتشافًا فريدًا حقًا. اكتشف متاجر Brickell City Center الشهيرة على بعد خطوات فقط. استمتع بأفضل حياة فاخرة في بريكل. لا تفوت فرصتك لامتلاك هذا البنتهاوس الرائع!</p>', NULL, NULL, '2024-06-10 11:26:54', '2024-06-13 08:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `property_countries`
--

CREATE TABLE `property_countries` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_countries`
--

INSERT INTO `property_countries` (`id`, `created_at`, `updated_at`) VALUES
(7, '2024-06-01 06:42:29', '2024-06-01 06:42:29'),
(8, '2024-06-01 06:42:36', '2024-06-01 06:42:36'),
(9, '2024-06-01 06:42:55', '2024-06-01 06:42:55'),
(10, '2024-06-01 06:45:23', '2024-06-01 06:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `property_country_contents`
--

CREATE TABLE `property_country_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_country_contents`
--

INSERT INTO `property_country_contents` (`id`, `country_id`, `language_id`, `name`, `created_at`, `updated_at`) VALUES
(14, 7, 20, 'USA', '2024-06-01 06:42:29', '2024-06-01 06:42:29'),
(15, 8, 20, 'Canada', '2024-06-01 06:42:36', '2024-06-01 06:42:36'),
(16, 9, 20, 'Afghanistan', '2024-06-01 06:42:55', '2024-06-01 06:42:55'),
(17, 10, 20, 'Palestine', '2024-06-01 06:45:23', '2024-06-01 06:45:23'),
(18, 10, 25, 'فلسطين', '2024-06-10 06:29:20', '2024-06-10 06:29:20'),
(19, 9, 25, 'أفغانستان', '2024-06-10 06:29:31', '2024-06-10 06:29:31'),
(20, 8, 25, 'كندا', '2024-06-10 06:29:41', '2024-06-10 06:29:41'),
(21, 7, 25, 'الولايات المتحدة الأمريكية', '2024-06-10 06:29:50', '2024-06-10 06:29:50');

-- --------------------------------------------------------

--
-- Table structure for table `property_sections`
--

CREATE TABLE `property_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_sections`
--

INSERT INTO `property_sections` (`id`, `language_id`, `title`, `created_at`, `updated_at`) VALUES
(1, 20, 'Latest Properties', '2023-12-12 00:53:00', '2024-06-12 12:08:06'),
(2, 25, 'أحدث العقارات', '2024-03-27 00:20:00', '2024-06-14 07:19:17');

-- --------------------------------------------------------

--
-- Table structure for table `property_slider_images`
--

CREATE TABLE `property_slider_images` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_slider_images`
--

INSERT INTO `property_slider_images` (`id`, `property_id`, `image`, `created_at`, `updated_at`) VALUES
(334, NULL, '6666afe13a5bb.png', '2024-06-10 07:48:49', '2024-06-10 07:48:49'),
(337, 68, '6666b101e6380.png', '2024-06-10 07:53:37', '2024-06-10 08:03:24'),
(338, 68, '6666b101ea7a1.png', '2024-06-10 07:53:37', '2024-06-10 08:03:24'),
(339, 68, '6666b1021c607.png', '2024-06-10 07:53:38', '2024-06-10 08:03:24'),
(343, 69, '6666b5417d13c.png', '2024-06-10 08:11:45', '2024-06-10 08:19:21'),
(344, 69, '6666b541861a1.png', '2024-06-10 08:11:45', '2024-06-10 08:19:21'),
(345, 69, '6666b541a8e6b.png', '2024-06-10 08:11:45', '2024-06-10 08:19:21'),
(346, 70, '6666b741d78e4.png', '2024-06-10 08:20:17', '2024-06-10 08:23:56'),
(347, 70, '6666b741e6b9d.png', '2024-06-10 08:20:17', '2024-06-10 08:23:56'),
(348, 70, '6666b7420c464.png', '2024-06-10 08:20:18', '2024-06-10 08:23:56'),
(352, 71, '6666b94f38da7.png', '2024-06-10 08:29:03', '2024-06-10 08:33:31'),
(353, 71, '6666b94f3a0a7.png', '2024-06-10 08:29:03', '2024-06-10 08:33:31'),
(354, 71, '6666b94f64888.png', '2024-06-10 08:29:03', '2024-06-10 08:33:31'),
(355, 72, '6666ba97a235e.png', '2024-06-10 08:34:31', '2024-06-10 08:37:46'),
(356, 72, '6666ba97c532a.png', '2024-06-10 08:34:31', '2024-06-10 08:37:46'),
(357, 72, '6666ba97cd46a.png', '2024-06-10 08:34:31', '2024-06-10 08:37:46'),
(358, 73, '6666bba9b24b4.png', '2024-06-10 08:39:05', '2024-06-10 08:42:25'),
(359, 73, '6666bba9bb358.png', '2024-06-10 08:39:05', '2024-06-10 08:42:25'),
(360, 73, '6666bba9dcb28.png', '2024-06-10 08:39:05', '2024-06-10 08:42:25'),
(361, 74, '6666bf21e74bb.png', '2024-06-10 08:53:53', '2024-06-10 09:02:38'),
(362, 74, '6666bf221365b.png', '2024-06-10 08:53:54', '2024-06-10 09:02:38'),
(363, 74, '6666bf221e5b2.png', '2024-06-10 08:53:54', '2024-06-10 09:02:38'),
(364, 75, '6666c18659169.png', '2024-06-10 09:04:06', '2024-06-10 09:09:08'),
(365, 75, '6666c186703db.png', '2024-06-10 09:04:06', '2024-06-10 09:09:08'),
(366, 75, '6666c18683aed.png', '2024-06-10 09:04:06', '2024-06-10 09:09:08'),
(370, 76, '6666dad205ea0.jpg', '2024-06-10 10:52:02', '2024-06-10 10:54:56'),
(371, 76, '6666dad209d14.jpg', '2024-06-10 10:52:02', '2024-06-10 10:54:56'),
(372, 76, '6666dad235608.jpg', '2024-06-10 10:52:02', '2024-06-10 10:54:56'),
(373, 77, '6666dc735e411.jpg', '2024-06-10 10:58:59', '2024-06-10 11:05:43'),
(374, 77, '6666dc73623e5.jpg', '2024-06-10 10:58:59', '2024-06-10 11:05:43'),
(375, 77, '6666dc738d0b8.jpg', '2024-06-10 10:58:59', '2024-06-10 11:05:43'),
(376, 77, '6666dc738ea00.jpg', '2024-06-10 10:58:59', '2024-06-10 11:05:43'),
(380, 78, '6666de6ad051e.png', '2024-06-10 11:07:22', '2024-06-10 11:11:20'),
(381, 78, '6666de6ad6aba.png', '2024-06-10 11:07:22', '2024-06-10 11:11:20'),
(382, 78, '6666de6b0547e.png', '2024-06-10 11:07:23', '2024-06-10 11:11:20'),
(383, 79, '6666e0b62f395.jpg', '2024-06-10 11:17:10', '2024-06-10 11:18:24'),
(385, 79, '6666e0b6584ad.jpg', '2024-06-10 11:17:10', '2024-06-10 11:18:24'),
(386, 79, '6666e0b6596d9.jpg', '2024-06-10 11:17:10', '2024-06-10 11:18:24'),
(387, 79, '6666e0b682742.jpg', '2024-06-10 11:17:10', '2024-06-10 11:18:24'),
(388, 80, '6666e2484bd70.png', '2024-06-10 11:23:52', '2024-06-10 11:26:54'),
(390, 80, '6666e251a780a.png', '2024-06-10 11:24:01', '2024-06-10 11:26:54'),
(391, 80, '6666e251ccf65.png', '2024-06-10 11:24:01', '2024-06-10 11:26:54'),
(392, 80, '6666e251d0d34.png', '2024-06-10 11:24:01', '2024-06-10 11:26:54');

-- --------------------------------------------------------

--
-- Table structure for table `property_spacifications`
--

CREATE TABLE `property_spacifications` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` bigint UNSIGNED NOT NULL,
  `key` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_spacifications`
--

INSERT INTO `property_spacifications` (`id`, `property_id`, `key`, `created_at`, `updated_at`) VALUES
(46, 11, 0, '2024-01-04 05:25:56', '2024-01-04 05:25:56'),
(48, 30, 0, '2024-01-09 00:55:03', '2024-01-09 00:55:03'),
(61, 34, 0, '2024-01-13 23:37:24', '2024-01-13 23:37:24'),
(64, 33, 0, '2024-01-14 02:30:26', '2024-01-14 02:30:26'),
(125, 37, 0, '2024-02-04 02:56:01', '2024-02-04 02:56:01'),
(126, 37, 1, '2024-02-04 02:56:01', '2024-02-04 02:56:01'),
(127, 37, 2, '2024-02-04 02:56:01', '2024-02-04 02:56:01'),
(236, 38, 0, '2024-02-08 00:56:58', '2024-02-08 00:56:58'),
(237, 38, 1, '2024-02-08 00:56:58', '2024-02-08 00:56:58'),
(251, 39, 0, '2024-02-13 01:46:35', '2024-02-13 01:46:35'),
(252, 39, 1, '2024-02-13 01:46:35', '2024-02-13 01:46:35'),
(253, 39, 2, '2024-02-13 01:46:35', '2024-02-13 01:46:35'),
(257, 36, 0, '2024-03-13 01:13:46', '2024-03-13 01:13:46'),
(260, 49, 0, '2024-03-16 03:00:49', '2024-03-16 03:00:49'),
(261, 47, 0, '2024-03-16 22:49:01', '2024-03-16 22:49:01'),
(540, 80, 0, '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(541, 80, 1, '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(542, 80, 2, '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(543, 80, 3, '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(544, 80, 4, '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(545, 80, 5, '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(546, 80, 6, '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(547, 80, 7, '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(548, 79, 0, '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(549, 79, 1, '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(550, 79, 2, '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(551, 79, 3, '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(552, 79, 4, '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(553, 79, 5, '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(554, 79, 6, '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(555, 78, 0, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(556, 78, 1, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(557, 78, 2, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(558, 78, 3, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(559, 78, 4, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(560, 78, 5, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(561, 78, 6, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(562, 78, 7, '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(563, 77, 0, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(564, 77, 1, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(565, 77, 2, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(566, 77, 3, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(567, 77, 4, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(568, 77, 5, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(569, 77, 6, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(570, 77, 7, '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(571, 76, 0, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(572, 76, 1, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(573, 76, 2, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(574, 76, 3, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(575, 76, 4, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(576, 76, 5, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(577, 76, 6, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(578, 76, 7, '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(579, 75, 0, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(580, 75, 1, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(581, 75, 2, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(582, 75, 3, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(583, 75, 4, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(584, 75, 5, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(585, 75, 6, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(586, 75, 7, '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(587, 73, 0, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(588, 73, 1, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(589, 73, 2, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(590, 73, 3, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(591, 73, 4, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(592, 73, 5, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(593, 73, 6, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(594, 73, 7, '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(595, 72, 0, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(596, 72, 1, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(597, 72, 2, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(598, 72, 3, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(599, 72, 4, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(600, 72, 5, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(601, 72, 6, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(602, 72, 7, '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(603, 71, 0, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(604, 71, 1, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(605, 71, 2, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(606, 71, 3, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(607, 71, 4, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(608, 71, 5, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(609, 71, 6, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(610, 71, 7, '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(611, 74, 0, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(612, 74, 1, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(613, 74, 2, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(614, 74, 3, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(615, 74, 4, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(616, 74, 5, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(617, 74, 6, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(618, 74, 7, '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(619, 70, 0, '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(620, 70, 1, '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(621, 70, 2, '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(622, 70, 3, '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(623, 69, 0, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(624, 69, 1, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(625, 69, 2, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(626, 69, 3, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(627, 69, 4, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(628, 69, 5, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(629, 69, 6, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(630, 69, 7, '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(631, 68, 0, '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(632, 68, 1, '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(633, 68, 2, '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(634, 68, 3, '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(635, 68, 4, '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(636, 68, 5, '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(637, 68, 6, '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(638, 68, 7, '2024-06-14 06:58:16', '2024-06-14 06:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `property_spacification_contents`
--

CREATE TABLE `property_spacification_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `property_spacification_id` bigint UNSIGNED DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_spacification_contents`
--

INSERT INTO `property_spacification_contents` (`id`, `language_id`, `property_spacification_id`, `label`, `value`, `created_at`, `updated_at`) VALUES
(3, 20, 8, 'f1', '1f', '2023-12-24 23:11:49', '2023-12-24 23:11:49'),
(5, 20, 9, 'f1', '1f', '2023-12-24 23:21:22', '2023-12-24 23:21:22'),
(6, 20, 10, 'g1', 'g1', '2023-12-24 23:21:22', '2023-12-24 23:21:22'),
(101, 20, 46, 'sdf', 'sadf', '2024-01-04 05:25:56', '2024-01-04 05:25:56'),
(105, 20, 48, NULL, NULL, '2024-01-09 00:55:03', '2024-01-09 00:55:03'),
(523, 20, 250, 'Featued', 'Featured Value', '2024-03-13 01:13:46', '2024-03-13 01:13:46'),
(535, 20, 263, 'Additional Features', 'Additional Features Value', '2024-03-24 00:27:30', '2024-03-24 00:27:30'),
(537, 20, 264, 'Additional Features', 'Additional Features Value', '2024-03-24 00:35:46', '2024-03-24 00:35:46'),
(539, 20, 265, 'Additional Features', 'Additional Features Value', '2024-03-24 00:36:47', '2024-03-24 00:36:47'),
(541, 20, 266, 'Additional Features', 'Additional Features Value', '2024-03-24 00:37:03', '2024-03-24 00:37:03'),
(543, 20, 267, 'Additional Features', 'Additional Features Value', '2024-03-24 00:45:01', '2024-03-24 00:45:01'),
(545, 20, 268, 'Additional Features', 'Additional Features Value', '2024-03-24 00:45:53', '2024-03-24 00:45:53'),
(1040, 20, 540, 'Home Type', 'Single Family', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1041, 20, 541, 'Flooring', 'Wood Tile', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1042, 20, 542, 'Utilities', 'Central  Cooling System', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1043, 20, 543, 'Parking', '1 Car Garage', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1044, 20, 544, 'Home Design', 'Concrete  Construction', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1045, 20, 545, 'Kitchen', 'Microwave , Dishwasher', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1046, 20, 546, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1047, 20, 547, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1048, 25, 540, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1049, 25, 541, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1050, 25, 542, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1051, 25, 543, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1052, 25, 544, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1053, 25, 545, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1054, 25, 546, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1055, 25, 547, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:51:55', '2024-06-14 06:51:55'),
(1056, 20, 548, 'Home Type', 'Single Family', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1057, 20, 549, 'Flooring', 'Wood Tile', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1058, 20, 550, 'Utilities', 'Central  Cooling System', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1059, 20, 551, 'Home Design', 'Concrete  Construction', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1060, 20, 552, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1061, 20, 553, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1062, 20, 554, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1063, 25, 548, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1064, 25, 549, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1065, 25, 550, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1066, 25, 551, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1067, 25, 552, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1068, 25, 553, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1069, 25, 554, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:52:11', '2024-06-14 06:52:11'),
(1070, 20, 555, 'Home Type', 'Single Family', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1071, 20, 556, 'Flooring', 'Wood Tile', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1072, 20, 557, 'Utilities', 'Central  Cooling System', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1073, 20, 558, 'Parking', '1 Car Garage', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1074, 20, 559, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1075, 20, 560, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1076, 20, 561, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1077, 20, 562, 'Home Design', 'Concrete  Construction', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1078, 25, 555, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1079, 25, 556, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1080, 25, 557, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1081, 25, 558, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1082, 25, 559, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1083, 25, 560, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1084, 25, 561, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1085, 25, 562, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:54:44', '2024-06-14 06:54:44'),
(1086, 20, 563, 'Home Type', 'Single Family', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1087, 20, 564, 'Flooring', 'Wood Tile', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1088, 20, 565, 'Utilities', 'Central  Cooling System', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1089, 20, 566, 'Parking', '1 Car Garage', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1090, 20, 567, 'Home Design', 'Concrete  Construction', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1091, 20, 568, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1092, 20, 569, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1093, 20, 570, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1094, 25, 563, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1095, 25, 564, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1096, 25, 565, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1097, 25, 566, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1098, 25, 567, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1099, 25, 568, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1100, 25, 569, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1101, 25, 570, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:55:00', '2024-06-14 06:55:00'),
(1102, 20, 571, 'Home Type', 'Single Family', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1103, 20, 572, 'Flooring', 'Wood Tile', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1104, 20, 573, 'Utilities', 'Central  Cooling System', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1105, 20, 574, 'Parking', '1 Car Garage', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1106, 20, 575, 'Home Design', 'Concrete  Construction', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1107, 20, 576, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1108, 20, 577, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1109, 20, 578, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1110, 25, 571, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1111, 25, 572, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1112, 25, 573, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1113, 25, 574, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1114, 25, 575, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1115, 25, 576, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1116, 25, 577, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1117, 25, 578, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:55:16', '2024-06-14 06:55:16'),
(1118, 20, 579, 'Home Type', 'Single Family', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1119, 20, 580, 'Flooring', 'Wood Tile', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1120, 20, 581, 'Utilities', 'Central  Cooling System', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1121, 20, 582, 'Parking', '1 Car Garage', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1122, 20, 583, 'Home Design', 'Concrete  Construction', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1123, 20, 584, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1124, 20, 585, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1125, 20, 586, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1126, 25, 579, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1127, 25, 580, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1128, 25, 581, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1129, 25, 582, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1130, 25, 583, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1131, 25, 584, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1132, 25, 585, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1133, 25, 586, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:55:41', '2024-06-14 06:55:41'),
(1134, 20, 587, 'Home Type', 'Single Family', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1135, 20, 588, 'Flooring', 'Wood Tile', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1136, 20, 589, 'Utilities', 'Central  Cooling System', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1137, 20, 590, 'Parking', '1 Car Garage', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1138, 20, 591, 'Home Design', 'Concrete  Construction', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1139, 20, 592, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1140, 20, 593, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1141, 20, 594, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1142, 25, 587, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1143, 25, 588, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1144, 25, 589, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1145, 25, 590, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1146, 25, 591, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1147, 25, 592, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1148, 25, 593, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1149, 25, 594, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:56:16', '2024-06-14 06:56:16'),
(1150, 20, 595, 'Home Type', 'Single Family', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1151, 20, 596, 'Flooring', 'Wood Tile', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1152, 20, 597, 'Utilities', 'Central  Cooling System', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1153, 20, 598, 'Parking', '1 Car Garage', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1154, 20, 599, 'Home Design', 'Concrete  Construction', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1155, 20, 600, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1156, 20, 601, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1157, 20, 602, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1158, 25, 595, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1159, 25, 596, 'الأرضيات', 'Central  Cooling System', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1160, 25, 597, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1161, 25, 598, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1162, 25, 599, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1163, 25, 600, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1164, 25, 601, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1165, 25, 602, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:56:35', '2024-06-14 06:56:35'),
(1166, 20, 603, 'Home Type', 'Single Family', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1167, 20, 604, 'Flooring', 'Wood Tile', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1168, 20, 605, 'Utilities', 'Central  Cooling System', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1169, 20, 606, 'Parking', '1 Car Garage', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1170, 20, 607, 'Home Design', 'Concrete  Construction', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1171, 20, 608, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1172, 20, 609, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1173, 20, 610, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1174, 25, 603, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1175, 25, 604, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1176, 25, 605, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1177, 25, 606, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1178, 25, 607, 'صميم البيت', 'البناء الخرساني', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1179, 25, 608, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1180, 25, 609, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1181, 25, 610, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:56:53', '2024-06-14 06:56:53'),
(1182, 20, 611, 'Home Type', 'Single Family', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1183, 20, 612, 'Flooring', 'Wood Tile', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1184, 20, 613, 'Utilities', 'Central  Cooling System', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1185, 20, 614, 'Parking', '1 Car Garage', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1186, 20, 615, 'Home Design', 'Concrete  Construction', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1187, 20, 616, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1188, 20, 617, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1189, 20, 618, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1190, 25, 611, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1191, 25, 612, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1192, 25, 613, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1193, 25, 614, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1194, 25, 615, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1195, 25, 616, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1196, 25, 617, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1197, 25, 618, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:57:13', '2024-06-14 06:57:13'),
(1198, 20, 619, 'Home Type', 'Single Family', '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(1199, 20, 620, 'Flooring', 'Wood Tile', '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(1200, 20, 621, 'Parking', '1 Car Garage', '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(1201, 20, 622, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(1202, 25, 619, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(1203, 25, 620, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(1204, 25, 621, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(1205, 25, 622, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:57:29', '2024-06-14 06:57:29'),
(1206, 20, 623, 'Home Type', 'Single Family', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1207, 20, 624, 'Flooring', 'Wood Tile', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1208, 20, 625, 'Utilities', 'Central  Cooling System', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1209, 20, 626, 'Parking', '1 Car Garage', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1210, 20, 627, 'Home Design', 'Concrete  Construction', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1211, 20, 628, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1212, 20, 629, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1213, 20, 630, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1214, 25, 623, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1215, 25, 624, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1216, 25, 625, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1217, 25, 626, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1218, 25, 627, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1219, 25, 628, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1220, 25, 629, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1221, 25, 630, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:57:51', '2024-06-14 06:57:51'),
(1222, 20, 631, 'Home Type', 'Single Family', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1223, 20, 632, 'Flooring', 'Wood Tile', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1224, 20, 633, 'Utilities', 'Central  Cooling System', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1225, 20, 634, 'Parking', '1 Car Garage', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1226, 20, 635, 'Home Design', 'Concrete  Construction', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1227, 20, 636, 'Kitchen', 'Microwave, Dishwasher', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1228, 20, 637, 'Pet Policy', 'Breed Restrictions', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1229, 20, 638, 'Additional Features', 'Balcony, Property Fronts a Bay or Harbor East', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1230, 25, 631, 'نوع المنزل', 'عائلة واحدة', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1231, 25, 632, 'الأرضيات', 'بلاط الخشب', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1232, 25, 633, 'خدمات', 'نظام التبريد المركزي', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1233, 25, 634, 'موقف سيارات', '1 جراج سيارات', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1234, 25, 635, 'تصميم البيت', 'البناء الخرساني', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1235, 25, 636, 'مطبخ', 'ميكروويف، غسالة صحون', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1236, 25, 637, 'سياسة الحيوانات الأليفة', 'قيود السلالة', '2024-06-14 06:58:16', '2024-06-14 06:58:16'),
(1237, 25, 638, 'ميزات إضافية', 'شرفة، واجهات الملكية على الخليج أو الميناء الشرقي', '2024-06-14 06:58:16', '2024-06-14 06:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `property_states`
--

CREATE TABLE `property_states` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_states`
--

INSERT INTO `property_states` (`id`, `country_id`, `created_at`, `updated_at`) VALUES
(10, 7, '2024-06-01 06:47:50', '2024-06-01 06:47:50'),
(11, 7, '2024-06-01 06:48:12', '2024-06-01 06:48:12'),
(12, 7, '2024-06-01 06:48:58', '2024-06-01 06:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `property_state_contents`
--

CREATE TABLE `property_state_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_state_contents`
--

INSERT INTO `property_state_contents` (`id`, `state_id`, `language_id`, `name`, `created_at`, `updated_at`) VALUES
(20, 10, 20, 'California', '2024-06-01 06:47:50', '2024-06-01 06:47:50'),
(21, 11, 20, 'Florida', '2024-06-01 06:48:12', '2024-06-01 06:48:12'),
(22, 12, 20, 'Texas', '2024-06-01 06:48:58', '2024-06-01 06:48:58'),
(23, 12, 25, 'تكساس', '2024-06-10 06:30:10', '2024-06-10 06:30:10'),
(24, 11, 25, 'فلوريدا', '2024-06-10 06:30:19', '2024-06-10 06:30:19'),
(25, 10, 25, 'كاليفورنيا', '2024-06-10 06:30:28', '2024-06-10 06:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `subscribable_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subscribable_id` bigint UNSIGNED NOT NULL,
  `endpoint` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `public_key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `content_encoding` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `push_subscriptions`
--

INSERT INTO `push_subscriptions` (`id`, `subscribable_type`, `subscribable_id`, `endpoint`, `public_key`, `auth_token`, `content_encoding`, `created_at`, `updated_at`) VALUES
(92, 'App\\Models\\Guest', 94, 'https://fcm.googleapis.com/fcm/send/dXs7VyhQvcI:APA91bEGXyxoErJavBQyZKwe15j7hy0hkJwbbUwZLYApwf1o_jFSBaf72lp2Q7JYcitOP8oHebbZaTKaMi0KQW2Dw7nO-o0g_qe-3ggEoxusqK3jTN7RGBFkKxJq8ceQRw9PfpruZ9kH', 'BHPMSnEl5erknt0scHqjckWr-lSiZV6SFpOGVPDfeLsjq7N-XMBbB8umpVTZ9bIFB6OP0na4LJU1tI54l_YvfhA', 'GGW-K4Fx6HERAA-eZnTQ2w', NULL, '2023-08-24 05:30:17', '2023-08-24 05:30:17'),
(94, 'App\\Models\\Guest', 96, 'https://fcm.googleapis.com/fcm/send/e7xN0DAsuOM:APA91bGzdy-7dmskHcwwc3uFtR9-expvCDJFZf5_iJkaMeDh9YX57mc9u-hYK2sjpmOBZ9B0jEBTC-ggKHYCqsAb3ikEeSCdBtY1OPpn9X8jWyPWA3xg8uQyLHrjIY--7H5G7eEmWucP', 'BNKjYBbEBbY0loyI__HK_QN-RkfMqobvOCIwdhxuG00MBkMWXLsxSRtSNBVvJ4OsMePDTic-Ysl7OJ--gjsPkZQ', '1TN-cjmZrIm0gD98Z3hfcA', NULL, '2023-08-24 05:30:55', '2023-08-24 05:30:55'),
(95, 'App\\Models\\Guest', 97, 'https://fcm.googleapis.com/fcm/send/c5E5VYPn2Xs:APA91bGys_oMMQqwQ9RbMtTIkK8jKpSFT2hp-yhhJ6PR5o4yIbDPOlbY-v3v3bcNyG2_zPOS95PVx6fYtq9JdTwQfj4vzTft_k_wzpl4meOf4kDP-zKyHfyaAJLKg9zS67w1ojGCNrrC', 'BAhWkMyecQ7eVZD0PXi7_unxi4MgErPwebInlrPmRuobPdsCPw9MZBhGGbb5enmtklsBB1442OPGrj8xCkIPks0', 'Kw9fIZBj4OQkNY4Jct4QUg', NULL, '2023-08-24 05:30:55', '2023-08-24 05:30:55'),
(96, 'App\\Models\\Guest', 1, 'https://fcm.googleapis.com/fcm/send/ekWUPr5_scI:APA91bECRXl3-qqcWsNMJtoSAZtUNGxy5vMnMGLTWxOXN-DLm0syumrsf21cSOGKcLRbRR5Kp5qghU_sPozm04SRdpL_dkJh01YDE5-TuYvreHLjPsl99c70fRBwYGHaVOJ19r8qx3ts', 'BBlfGRfO31qYxLmkDh6Fa5053T2XEPXq0kYXypJN025JAqGFzplyvja0wtv5lE8kAip_jp7nfxbVaA1-q0p-G2g', 'BCSODl41MbgxorD-r0wygg', NULL, '2023-08-24 05:31:29', '2023-08-24 05:31:29'),
(97, 'App\\Models\\Guest', 2, 'https://fcm.googleapis.com/fcm/send/d2WbfxhK864:APA91bGawNd1jXbxuBZZQ-v4BHah6L5DjWCGB2Ap4YPiNM06KD9iA6BwT-jXAQgP5w_EUcgUH_TBwN6pS4-Lmg09vrj2vC98hVCQoNbYdeYO9W78YtLh-RhzTACjlIBBH9iTVK4DqVGf', 'BMnV05uSSrzfTW2VUMduZDsEoHMWuBScmXXvlRsVokL7kTiDXCG-oO2H82lYIhn5tpFjwc6regcLM_NbaWFQxZo', 'PbylQJhoOovZwojIrqlq3w', NULL, '2023-08-25 21:54:35', '2023-08-25 21:54:35'),
(98, 'App\\Models\\Guest', 3, 'https://fcm.googleapis.com/fcm/send/cNE-KnQHwQY:APA91bFyveM2EqZNii6tZhFvQ4-OgX6-r8hnJUNURBnKqBGtJ5NGA2Kr4q6PbvvPLPYq7CSjZKaufD3mGIBXiFgc9kxMwfKvEA8g5IZ4U3T3naOmX9jBQGIWNr9gTHqHlKPa5BUtQ3Cd', 'BNK28OgRziWmUN7LEuFOHWnDpNBQcZsf6C_C87wmLx51GQ8m65Taqj8D_3MdtlkWKDSI5kqV5Bg6cf4g26Yc6J8', 'ppN9B6aglOHXQ7aOWU2rXA', NULL, '2023-08-25 21:54:35', '2023-08-25 21:54:35'),
(99, 'App\\Models\\Guest', 4, 'https://fcm.googleapis.com/fcm/send/fLZBCN7J8Rg:APA91bGjjcf1PJ5qG3evCVaoMGNXzS0k_nowNIo08U9_8wzqf1_AvvYbkke1Y8_IFaqNRBTTYkV7WmT70NQbLz3IRYdbD4PRhy61jIkMVnkJOC86emjWISAbAUbhdlgdQkm7Ye9bPvDp', 'BHnrcKWKchw8nsuSUCNJ49wCjJJQvJrHZlY6tz97CyoEgyxMGN0kjCpHKUpKXE71_nIFlH3T3GDPnIy4y4pIlX4', 'vr_LKbIsw6l0NpFTmpWt8A', NULL, '2023-08-25 22:24:39', '2023-08-25 22:24:39'),
(100, 'App\\Models\\Guest', 5, 'https://fcm.googleapis.com/fcm/send/cDmXVQoZOTQ:APA91bEnL26jt7DK9rFNdkfVD7f88LAFZuAc5Bse7OJ7ZHy7-XSsftsQF6l7ZNMU9h75GvtP_g4yL8-wE5GVo-OLPr75x7K5I94hkW4bVP1rg5efit86ik4Vj8EN6TwV0omYZSMq8kIn', 'BDzvdpgQRhZmnFKL-R5U8ZuZXa-BYfQtVff-W1CGfIe12OE_GkbAw-Bl6pX_RZVNHzWX-PPGDocHhHMq03ZhmEM', 'PUYkkRuGqH_IDCcGC9FBjA', NULL, '2023-08-25 22:24:39', '2023-08-25 22:24:39'),
(101, 'App\\Models\\Guest', 6, 'https://fcm.googleapis.com/fcm/send/cB5q1iovt_4:APA91bG7-ZP0oDGdWhFJv7EB1bvfNha8reYBs9VDT4r8uSBGjnLVT8c-23F5CGe_q3n_EePA4-Zd4MtdLMO3JYGPko3Ze5YfW11plJ2-SGJZTDV9iLOrLlkdKzz31mgTcXXW800gUUBp', 'BKVEiN8IVsKqxKf4irTW3mAUkfV3duA7hQTGTOpxguwCqo2-BZGglT1lpCWyk-SwY3VmEn8d6TVnplPIR-4_GMw', 'UIEoe3zhp21qyLt0U6ivJg', NULL, '2023-08-25 22:27:07', '2023-08-25 22:27:07'),
(102, 'App\\Models\\Guest', 7, 'https://fcm.googleapis.com/fcm/send/cUQf0vBdOoU:APA91bGZeXNsw0tXpyuutodJVgf9UxG8-8bxTK_kTbk8uL2h3xIreIhCOFRvWWcJyaGLSi1L5FMkW8XkQYYRFWU4g9MCruftS4JEQnp_3vmw35cBR17OuoVzn1NH8R0yrmovq8IEpIfO', 'BBSeXRBBf5lDYSwYAS345ODmcdA5cUp4-hbif-ikbPH3wgbYAYBNgCHwfP-4Ow7hIENTQh6DylUTsWIT1hSG-O0', 'UjCP5Lm2ZMlS8W1V6jtJaA', NULL, '2023-08-25 22:28:29', '2023-08-25 22:28:29'),
(103, 'App\\Models\\Guest', 8, 'https://fcm.googleapis.com/fcm/send/eopf5lr7yh0:APA91bEJFqnETYn5ElfI4xeRHPZbF_ZePvDTeg21BKer_mV-VXJzMmMkdB2vka-KjJOsTdnK_a-tSUPRv_T4D4ULIWB64ZmGn4xysVSSBPgM7XLlbUakWQA719S2j0oz2LTwH4vx3XCV', 'BBrIQzsW-owWDDt6EbQ_0Mfxxbx6TZyA-DLWndwylWWYLURFsKaZxvJyxhHZT31p4MMM3psBsDEGTK3IqO3FeQ4', 'zajwjilEAqMyDOSlXsYcuw', NULL, '2023-08-25 22:28:29', '2023-08-25 22:28:29'),
(104, 'App\\Models\\Guest', 9, 'https://fcm.googleapis.com/fcm/send/fF6nNjwlXAg:APA91bHlt_M0Jkkhm6P0_8VNjeXHK9l-uwbiSHdufOUeXN55fh94vjF6n8nz1GeuJ5P4-P2OU_lsT4wF7j_YRGLk0ZI3QwMUY3T1T3zG7X0o8hb1aGNoBsoBylglop9bkrohfjKfToN1', 'BLUGvVQQsJ52I1dOkTLtDE0b9Y9WEi7Kcn6xg1v-Zecy6jLKg_RdbxrI3g_8VNRJof0nQoxOLR8YExLvVjRFJ7w', 'OsH-CGg2NCML4x6MEigXPQ', NULL, '2023-08-25 22:29:45', '2023-08-25 22:29:45'),
(105, 'App\\Models\\Guest', 10, 'https://fcm.googleapis.com/fcm/send/fYubXs7q7oc:APA91bEfnffQhStARSTGNNrFmfI-Wxx-52YN2xfmBZBieA7OYC82rXQRt3LWd_hSqFyzKYiK8bUoEJW4nS2nZQRuTTxbfOJTaIJaHeCzYzgdTVtNvS2FtCFqX0ynAPVxFPs5RgICNgZ9', 'BKkFilgX2RqR_fiWDAv_Hvkmsph_xy6IcYYmaqykVOq-Io4vRzlMFLhOumQ0KSBFXlcL3Lb6SpvFF6zbTKIAONM', 'FGDRTjA7bCK5uC6gdxmfyg', NULL, '2023-08-25 22:29:45', '2023-08-25 22:29:45'),
(106, 'App\\Models\\Guest', 11, 'https://fcm.googleapis.com/fcm/send/eUFh30T09eQ:APA91bEp4sENuH6xv0Y6fX4y1xsoxIuEcrehBz5vZ380-9m9pCkkvB-wYNjUVf6zzWa9lPLD8vt7Mgvq8uHRjFyg1SUqMbACW5Q1HFrPsIah9LSLCd21lMSLSXNUKH0jx25eTbBHw2yX', 'BODrSf5uhaIFS1-NJ2NJxLeGYzGeX5pETBArb0t12Q3zdY8vNYj947JuZP5CkUIUsdtEySnb14uV1lYg-CNNN3U', 'y6LIQ6yh7IKW_Nwk__p23w', NULL, '2023-08-25 22:43:16', '2023-08-25 22:43:16'),
(107, 'App\\Models\\Guest', 12, 'https://fcm.googleapis.com/fcm/send/di83BwIZXrE:APA91bHhbKGJn3xSzCymTdGRXB9s9aN-6MpL8FksOkOJFVa3gGEuYzq2_cp-GZ29msBUdiUQOw8rLs-46N3KdVSxVlUL-eg0NlXtpv7YCEA61Xx4Vl8bpjvljg1T2_pEXBs9BAAHAgxK', 'BKxs8WwsG21kisHucBlFspi6hSEwrBjt7NlOUbbPhl6KcxSrOtcO5E_DXqTGopXYh_wpFjTQsSopqTviWaAw81o', 'p32Ft7gtCjhEsbuaYJEQIQ', NULL, '2023-08-25 22:43:16', '2023-08-25 22:43:16'),
(108, 'App\\Models\\Guest', 13, 'https://fcm.googleapis.com/fcm/send/dQuH6vHyE6o:APA91bF_BAkS8LdJV8vOnUo9lmyrdoov5tN8-mVL2Qf1jvUgh7JGR7q8baGP2tFeKQdhPTZHOsWvQnmCJikA24G7yjZBScHHRHkY74-G0Mv-Vn3xHizFHnn9YpFJszdXR_Qd5N1QifuT', 'BE7tOgM_ShPsZFW3ZzQjChAgIVhO8npbMB4QLIu5w8F3NblxmaWQ3mkRxXRYuC_o6cD84XgP8-ZFqI1KCgJKX1U', '6rreiQDbn7d-e4RVLtixzg', NULL, '2023-08-25 22:43:48', '2023-08-25 22:43:48'),
(109, 'App\\Models\\Guest', 14, 'https://fcm.googleapis.com/fcm/send/c8Ur5haooTQ:APA91bG0DZYMsZ3VL4NOZsoeT1mWJaCLGwaNFbDcK1D9vzrRqvZnZJxMswMLziob6Tx7DyXGZVd72skLMj6uX-y0vMH56bSKvWltW0HgdeqIHltwUDZZBtEIwJvbeAkaE8pct0V99fSN', 'BPxKhQ27WK_lVLevTLG5ITtf03on9QoPzMWTKsNcqkqY0uQmg_Rh6i17nMt0FN0vlILKhP4N7vxKZwh8YP_PM-c', 'xj9-sz2TbGecEX2Ooy9o2w', NULL, '2023-08-25 22:43:48', '2023-08-25 22:43:48'),
(110, 'App\\Models\\Guest', 16, 'https://fcm.googleapis.com/fcm/send/cq2BNcvCxuM:APA91bHTliOOU--8yunLQfpHs-w_TPe9KRCO9CV_-k4_6yflC8VIpAOdoZLs26F7cpKrTLPpzr5QnLqdzJ1xEM7Re2vE-Y2NfsKD6S3sNT9-P41BnmYKnh7o3lQlf3guMJD6iEla69pQ', 'BPHnKe_N_cgYtLwWRuT-CGaGSVeNSyxkAIsegArH2WbYI7A2ovpdPDDMw8jHCfJx3mH3DoM-tiWJq-Cop1yhVaM', '34FJUOL_o7tRlMNaudZtHg', NULL, '2023-08-25 23:12:26', '2023-08-25 23:12:26'),
(111, 'App\\Models\\Guest', 15, 'https://fcm.googleapis.com/fcm/send/cC65GL67-XU:APA91bFQsu95_qtCrcdXtDjwnTg_21XGN8cKmDYf72iMMGJ4CtX8bMaqFOOznPY8pOGKj-b_1B5BfD4TwcAaOdvRNwzM3CS3FsPHkAbxQGpgdE7ilr_Wj033HYs6fgSNK0OZUbgjH1fB', 'BJiOnBf6GWBkrdoWpqZuX0HW0SllXEDW3Tlias9SFXgT26tWLNtf6rGPlWBliGRwzlHS3eEdWX1FU3uASNzgKJ4', '7Q3GczpYwd9g5VCucvjLQw', NULL, '2023-08-25 23:12:26', '2023-08-25 23:12:26'),
(112, 'App\\Models\\Guest', 17, 'https://fcm.googleapis.com/fcm/send/fnB8r__s6oI:APA91bFAWXpJRN1Knw6mTZUBBL-Xj5w53trNJ_BHiikVLeHZVJ8hhVWIovLnqlirY1VWcYJvdgxH4dFw6eUhib2nGI3z4J9YRZaT9YbOIcOVtLCQzbBQMUZe1wOiFGh7KnyNWsGt5M8x', 'BMlw3-BQEzsw2rIhNCYKmeohJ5d3IaUJC9ufEQSLQyZoJX9R_QqVKvew3NgVS4n7rc6lizJbUppaMao8GBzt_Vs', 'ipb9YsNFiiau0bimKvzZFw', NULL, '2023-08-26 03:56:50', '2023-08-26 03:56:50'),
(113, 'App\\Models\\Guest', 18, 'https://fcm.googleapis.com/fcm/send/fZIpVPQewqI:APA91bGLQc3iUZemV5H7_pylGARzwnveUpCks7sbNibDqdXSAwBGYzblvzhgNA5sF7hLonbtlcmUgtQf91K8GuPesQK_qzvPpTALuyxIWZMiGKUYJCxik8lpdqZEbtJgznoX1lDmhS1x', 'BHUTy0gJmkfDqsGcJ4cPFwq2kMRYa5XGJmmZtiGkrs408vXtxD0ASGzjrFcWQH_BhkgkCxKJVTk2wVehfwh2ZDM', 'KLJrZkR255db-p2_5fYk3w', NULL, '2023-08-26 03:56:50', '2023-08-26 03:56:50'),
(114, 'App\\Models\\Guest', 19, 'https://fcm.googleapis.com/fcm/send/eBxIeKyuB7E:APA91bHMztPplrCJK2FR6w0SxlXBbuwF-F-SVq1kGBD8Ycn1o2ZHmQnmEp--ARUvjRuo9acDo6DkbGwGjnibcqr5tF28gt7NeREEZiuI9hQXqRI_m_BDbEzKQeq5lLantxBgzCsMSrz0', 'BCp8alFk_kYWHhmAAUVdrkbU315DrYzc2AcKh8BwF_PseK5nsj69ug1ARVzI3MY7eqLZVOmAfZbJaVEoZUwZ3tI', 'zQDR61-3jI10KN3zX_s-jw', NULL, '2023-08-26 22:11:57', '2023-08-26 22:11:57'),
(115, 'App\\Models\\Guest', 20, 'https://fcm.googleapis.com/fcm/send/eQt03XLxeTc:APA91bG_3c1rAiUspv6Ao0D_c-x9fQIbfTtgIz7gBiLqYvFqcIEFSft4VZCcvANXB1pFkNzk9g-9rxYN9a6FtjEqxsFmAI6fKQ_mK2q0u_CaaejCLnh9rUcchDdWAdoAQomnDSfVoR4U', 'BCW3-VgEp_sv3ahusW4bq4r1iUFYIxwKgcI4PnAD1vZzrOVNwBCTh-BY6cABPqrImXJwlrIShAj8ByV3daNze2w', 'L630SRwC_Qsl73jcc5d58w', NULL, '2023-08-26 22:11:57', '2023-08-26 22:11:57'),
(116, 'App\\Models\\Guest', 21, 'https://fcm.googleapis.com/fcm/send/eSZLYzm86i4:APA91bHZuORNV55HpTlcnbOeHijViB8QqkyioRzck_kut9PUzKhucm0w-9Ks2LWpvbwitjt-d9ylr5z_OfYgYmiq7tC22WJ82xd_x7A1ut9yB-awxBP8MBL0XsuH0U_zxeUbivgoMt8W', 'BBUPNXSyFGRFHfKsgSAb1t-9a_0bFRZXqI-O4zmUSGZHicfe3ut5tO1o-apdu8keigCqEwnvSEHSdp7J5jXbubY', 'kQ-11cZpQ4qmfheZ9_86rw', NULL, '2023-08-27 00:00:25', '2023-08-27 00:00:25'),
(117, 'App\\Models\\Guest', 22, 'https://fcm.googleapis.com/fcm/send/fEKzDiLsZtg:APA91bELRIjqMkrdM66LaVTRyNCu3mn0iuZdYVSpq9LnUzYbdnfvBYiLyp5mSLpnwwWgxDhcOnUyCTTldjlsiz7Y6VA8v7rUYc359EYfG4DNJa9WzCIfhXeMQ0tAJZX5uuSASx2TsJ6g', 'BP5bMz3yKQTMo82zLRbgqfae6H_bGWf8Jr_MHi_Hal3GuswXG2CBqU_Jot5GvPRgQHDbzq-4jWuKcB3m2V-u8M8', 'Osi1HYi9TCvHQA75RDzSYw', NULL, '2023-08-27 00:00:25', '2023-08-27 00:00:25'),
(118, 'App\\Models\\Guest', 23, 'https://fcm.googleapis.com/fcm/send/f2fm-zmps_U:APA91bFkhmypTwC9KFCen282oOBHGRKVfs7N99QPmGUI5i1foXdUCNa4VP8a9a6mxKbQbHvyYJdqO-BSXJnWrQ_21Ugwk0lOb42OfWpK3C2e0i3JAAt7r8DMXDJH5bNCa9IoEMdAZpbK', 'BDKm1TBr3qVFk5aSkkDXRF3nPTCRSLfneXaYvcEYxrxo0KIeJjFjlLOrkr1YJVEwCYeCocXROBhduQXpzNCxRPE', 'Bgsgbi5w6Yzlf2j56K0hhw', NULL, '2023-08-27 00:28:21', '2023-08-27 00:28:21'),
(119, 'App\\Models\\Guest', 24, 'https://fcm.googleapis.com/fcm/send/d0o5P1d7ldg:APA91bGxoZBNm_R_swcTqucQcU65TH2MQjQNlCWa5dg0CN9Eoe4oQwgAJdrcISuoM9uyIdChi_SqDQukbhRb_3EM0V-JMvNEXHuPieb1vdoA_pxpauLkub5eLHHXcY96IUsPx7z9t7NB', 'BMIVSEc6pPnuqkqmWxaBCxvu9_3rQVSIAYsAOuxL7atwAJU19qqg_MotcD8m7o4WOCIj0k9aczikAq5y-SUPFqU', 'J0D5j0EBa3YZh458ZOMLIQ', NULL, '2023-08-27 00:29:30', '2023-08-27 00:29:30'),
(120, 'App\\Models\\Guest', 25, 'https://fcm.googleapis.com/fcm/send/dz3tWZ3qibA:APA91bHid9bLmWjJGXXveEwaHuO1LUPbQmH0f918fmzEqXYmgsdCI06-B-TwZasmo9i0JofdTqEUG0nj-DlgAQrkZYFjVhhviVQilwdvsWNHF71mtQpzga5hvbmLGt6ZCMO9pNiScSUP', 'BI6phy2gNrkVViedHJekHqSSKqJyeTqRuZspmz5vSzXhkdSAccpR44U6XcaUldjRpd6imJVafam__kQmbbR-q44', 'RE07ECOj6uebT2ud_EFLZA', NULL, '2023-08-27 01:07:50', '2023-08-27 01:07:50'),
(121, 'App\\Models\\Guest', 26, 'https://fcm.googleapis.com/fcm/send/cEso0X4AGVQ:APA91bEL0WET42mVcfLqN1iDGPKEwdui2GOqGQ4AlwPLZVZ0RGRvn5Gn6lQEkNDarchGohdTRoV-Jy7Sij_N_QOsKmnxlLT1t1LO7OvE0sd5-XCMy_zbUni4kULxIGpvNWMhFRTTdxTu', 'BMO__QDjWuVk3DbRGQINsRlJgV2wnV2CllOXYGz3gRYK9NPEACeVXlkEuAeKZr09dmGnXqPexiTEqpP7C18XTec', 'TRChmFPT83V_vJLn-riwZg', NULL, '2023-08-27 01:07:51', '2023-08-27 01:07:51'),
(122, 'App\\Models\\Guest', 27, 'https://fcm.googleapis.com/fcm/send/eMdVhFj10Wg:APA91bHlVUzvh7-su40yOBaVTokf1hQa0q_TDmAnMty-dNf_i2aD7EN4c1GJjmo0_e4vQUb2cMCh1nTcEbTji3T_M2MYw10Tq8HvPpTimKYEHtuyQk2jgFwggIWpVU7yq-cYpCOrmqzX', 'BO-uZPNsWlTRByNemWUR-1TO_VGwKruYvtJHIesCbVXvuIP7_da2hLYor79uBVmUSciDZs0timrM55V2gaS8Ewk', 'JNQhKJAcmk6uV3M5q0DeMQ', NULL, '2023-08-27 03:14:56', '2023-08-27 03:14:56'),
(123, 'App\\Models\\Guest', 28, 'https://fcm.googleapis.com/fcm/send/cuJw8hu-_f8:APA91bEReMkM9KDiibEXpq3tgxqk4KMRnCX3f2ruMILXFXC2klJzpuEA0qlth9eTedOK0AWP5hwVqI_SL3rxILu8qhqN4sa7vwMukNdodc8c3OH1pZVhKxRKW_svpO2pFeYYf_avcaQc', 'BKVnJylbf-2Sn7lkf2BcF7UK7vJ1fqVz2Zpr0ghv1HQGihTF65OGfHuSi7XP0JrdE-5oDYc-LdzMT6sckNxZQek', '_bcCAIvNUZ3BuC30lY93-w', NULL, '2023-08-27 03:14:56', '2023-08-27 03:14:56'),
(124, 'App\\Models\\Guest', 29, 'https://fcm.googleapis.com/fcm/send/cgGPEYsuwfM:APA91bGXPPTI5b0oo1PpnC38eUP8XS5i1tIq48ZJCc21vSb1SyZr1UwvNgGzgEYZ2lhdaDWxkIqkp8NQnsYAZzSEP_-s4_COfj2H01fYkL0GnZnBKnOlTmnbBslWKzNzN7tAKrHEyl_L', 'BIrzzl9X_1DG0doETDTIrLptaS3CEuzkpDAMAYwqgnPJkS6Z6byxi7g73_P67nSBzRgcVuhP-rMDBqEhyNGFaz0', 'omGERSb_BHn3cUFnqBzb7A', NULL, '2023-08-27 22:20:23', '2023-08-27 22:20:23'),
(125, 'App\\Models\\Guest', 30, 'https://fcm.googleapis.com/fcm/send/dsDtSN3UZno:APA91bEnNgfIBQve4akXqn37KbjGeax1FAe_XKsr3jjuqvnStqGeoOo7l0wOfMd3YSRUNe8v88LiIIX3DpQFq-gZ6det0ur-IOIzxY8E7H-xyeItwiXC3VUSen8s1T0oXgTXexkxlPLw', 'BBUKRsGESDEtZOKTtgyp9lUbfT_DvqZCC7yDFAE8NQ-ft736g7-xrMXs1UDwek7uA2gYe0NdEgkGbLPIeBO-VjE', 'UYZo-j3W6W_5lah5yX5s-w', NULL, '2023-08-27 22:20:23', '2023-08-27 22:20:23'),
(126, 'App\\Models\\Guest', 32, 'https://fcm.googleapis.com/fcm/send/c0LJHnpdHj4:APA91bHWErRTlJ5I-iR1z0PvLMIuZxkjVZFxW1chP1mKQQb6MKIO4564u510jNZb4m8LwXySF8ALJxkFPYHMkkHd_-FZDg_E04LLv0Rx-TPduHR6Liq1iygVE-51Lpb_gglg7R4JgIMq', 'BFh0YBZvURSvepHwS5sdTfch_ZOZymRdT3B9-aVRX4xCJO1HV42eAGnWT3eucBEi19nWa2qK1bDq1D_48f0mpco', 'oXXKCUgYr9Jp9MNhc-8hFQ', NULL, '2023-08-28 03:43:09', '2023-08-28 03:43:09'),
(127, 'App\\Models\\Guest', 31, 'https://fcm.googleapis.com/fcm/send/e1p0e4vhr_A:APA91bElfH98QegGYNdLMKS4f20vv_4NLbDG_4vLtzs_oTPnDYBYzvx6SnxS_r2yOxX_Uzz2FcOGwf0s_-0jDgm6xq1kg3EvH0Lj7m9fxzVjRqiIQzjTIeoVdvI-PEA8pLyZ99DfFbZV', 'BPuacPh78NjRc87RegpMWznpIXIG6UJb6m4e3xD5JcMEpbPzjSFpW-64KAmCxd67opKweDcPMVO-foVsLQeGhXM', 'rAGc9MhnR0-7LhEsdSPEKg', NULL, '2023-08-28 03:43:09', '2023-08-28 03:43:09'),
(128, 'App\\Models\\Guest', 33, 'https://fcm.googleapis.com/fcm/send/cmQVeL8Ab8w:APA91bFrGYMkeDDP6ZbKNqt1v4QaZxfDD_HsQrAxgA9kj5ioIqMHn_b2EY7hTRr5E69s4ZusfWu81tr4hEECXYbhAWI1XIDHWwfJTOfaAzYCO0RSk2H9Gq10CIngj2XkjQZG8gX9rNX-', 'BJJMXF6H1no1AwMzqEozQDRelCiP0282drtcCNXX0SeV2WVlMANEJOrj6uCIEXkwHOttB_exo5pbjPGo64OgVTI', 'Z6u0K5mzu72QjsN1aDsfQQ', NULL, '2023-08-28 04:50:29', '2023-08-28 04:50:29'),
(129, 'App\\Models\\Guest', 34, 'https://fcm.googleapis.com/fcm/send/eM6PfWYeP7Y:APA91bHhkchbebQic-cAfbm6kFh9GoJcyeXQuxY5IdRMQbjl-zwkw2bpPx7emcptld9izXablP55vpECwEkMfV7ooOW_xmMPt52-At0nCbVojd18GWpiiKnfeKPvJLxg03gPTIyePfU2', 'BNzuQKhuusGq7yuonUMagpGo61cvZBNlyYqQG1JMLmaMqZmGgO_R81NHbIeItmR-LXw4AIEagmaMMtUzaX3ZcjQ', 'nORwFjmZC2-kTEuOXCWbnA', NULL, '2023-08-28 04:50:29', '2023-08-28 04:50:29'),
(131, 'App\\Models\\Guest', 36, 'https://fcm.googleapis.com/fcm/send/delWx4ssIoM:APA91bFTEjkyueVqSM7Hf9Vk1WWSIgg2fBnW3DGhuYAeG1iA3qwNNITCyKwxZDxDIb-NSNJZW7_YLZdbeuT42iUPzr1Uhiedjj8ShuENSriiM5HvF8uNcYidcAMZb6q2IM1Z5EREy0bZ', 'BOiWQqpLjryfkW1Jl5gJRCrBxgFHDsz94OB4zBQeROwqQwdFyJhyJfmGOXqMp8p7d0R8U7UzFtH-ZkRn47yvjDo', 'JGuT4mGbIOCl0AMuJcEM3A', NULL, '2023-09-24 01:03:53', '2023-09-24 01:03:53');

-- --------------------------------------------------------

--
-- Table structure for table `quick_links`
--

CREATE TABLE `quick_links` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `serial_number` smallint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `quick_links`
--

INSERT INTO `quick_links` (`id`, `language_id`, `title`, `url`, `serial_number`, `created_at`, `updated_at`) VALUES
(11, 20, 'About Us', 'about-us', 1, '2023-08-19 23:46:05', '2024-06-12 12:10:37'),
(12, 20, 'Contact', 'contact', 2, '2023-08-19 23:46:32', '2024-06-12 12:10:31'),
(13, 20, 'FAQ', 'faq', 4, '2023-08-19 23:46:51', '2024-06-12 12:10:25'),
(18, 20, 'Vendors', 'vendors', 3, '2024-06-12 08:58:53', '2024-06-12 08:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(4, 'Admin', '[\"Support Tickets\"]', '2021-08-06 22:42:38', '2023-07-17 04:07:24'),
(6, 'Moderator', '[\"Menu Builder\",\"Package Management\",\"Payment Log\",\"Property Specifications\",\"Property Management\",\"Featured Properties\",\"Property Messages\",\"Project Management\",\"Agent\",\"User Management\",\"Vendors Management\",\"Home Page\",\"Support Tickets\",\"Footer\",\"Custom Pages\",\"Blog Management\",\"FAQ Management\",\"Advertise\",\"Announcement Popups\",\"Payment Gateways\",\"Basic Settings\",\"Admin Management\",\"Language Management\"]', '2021-08-07 22:14:34', '2024-03-25 23:22:54'),
(14, 'Supervisor', 'null', '2021-11-24 22:48:53', '2022-02-26 05:23:44');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint UNSIGNED NOT NULL,
  `work_process_section_status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `category_section_status` tinyint DEFAULT '0',
  `featured_properties_section_status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `counter_section_status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `cities_section_status` tinyint NOT NULL DEFAULT '1',
  `testimonial_section_status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `call_to_action_section_status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `about_section_status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `subscribe_section_status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `why_choose_us_section_status` tinyint NOT NULL DEFAULT '1',
  `vendor_section_status` tinyint NOT NULL DEFAULT '1',
  `pricing_section_status` tinyint NOT NULL DEFAULT '1',
  `brand_section_status` tinyint NOT NULL DEFAULT '1',
  `project_section_status` tinyint NOT NULL DEFAULT '1',
  `property_section_status` tinyint NOT NULL DEFAULT '1',
  `footer_section_status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `work_process_section_status`, `category_section_status`, `featured_properties_section_status`, `counter_section_status`, `cities_section_status`, `testimonial_section_status`, `call_to_action_section_status`, `about_section_status`, `subscribe_section_status`, `why_choose_us_section_status`, `vendor_section_status`, `pricing_section_status`, `brand_section_status`, `project_section_status`, `property_section_status`, `footer_section_status`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, '2024-03-25 03:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `meta_keyword_home` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description_home` text COLLATE utf8mb3_unicode_ci,
  `meta_keyword_properties` text COLLATE utf8mb3_unicode_ci,
  `meta_description_properties` text COLLATE utf8mb3_unicode_ci,
  `meta_keyword_projects` text COLLATE utf8mb3_unicode_ci,
  `meta_description_projects` text COLLATE utf8mb3_unicode_ci,
  `meta_keyword_agent_login` text COLLATE utf8mb3_unicode_ci,
  `meta_description_agent_login` text COLLATE utf8mb3_unicode_ci,
  `meta_keywords_agent_forget_password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_descriptions_agent_forget_password` text COLLATE utf8mb3_unicode_ci,
  `meta_keyword_blog` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description_blog` text COLLATE utf8mb3_unicode_ci,
  `meta_keyword_faq` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description_faq` text COLLATE utf8mb3_unicode_ci,
  `meta_keyword_contact` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description_contact` text COLLATE utf8mb3_unicode_ci,
  `meta_keyword_login` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description_login` text COLLATE utf8mb3_unicode_ci,
  `meta_keyword_signup` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description_signup` text COLLATE utf8mb3_unicode_ci,
  `meta_keyword_forget_password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description_forget_password` text COLLATE utf8mb3_unicode_ci,
  `meta_keywords_vendor_login` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description_vendor_login` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_keywords_vendor_signup` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description_vendor_signup` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_keywords_vendor_forget_password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_descriptions_vendor_forget_password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_keywords_vendor_page` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description_vendor_page` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_keywords_about_page` text COLLATE utf8mb3_unicode_ci,
  `meta_description_about_page` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_keywords_pricing_page` text COLLATE utf8mb3_unicode_ci,
  `meta_description_pricing_page` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `language_id`, `meta_keyword_home`, `meta_description_home`, `meta_keyword_properties`, `meta_description_properties`, `meta_keyword_projects`, `meta_description_projects`, `meta_keyword_agent_login`, `meta_description_agent_login`, `meta_keywords_agent_forget_password`, `meta_descriptions_agent_forget_password`, `meta_keyword_blog`, `meta_description_blog`, `meta_keyword_faq`, `meta_description_faq`, `meta_keyword_contact`, `meta_description_contact`, `meta_keyword_login`, `meta_description_login`, `meta_keyword_signup`, `meta_description_signup`, `meta_keyword_forget_password`, `meta_description_forget_password`, `meta_keywords_vendor_login`, `meta_description_vendor_login`, `meta_keywords_vendor_signup`, `meta_description_vendor_signup`, `meta_keywords_vendor_forget_password`, `meta_descriptions_vendor_forget_password`, `meta_keywords_vendor_page`, `meta_description_vendor_page`, `meta_keywords_about_page`, `meta_description_about_page`, `created_at`, `updated_at`, `meta_keywords_pricing_page`, `meta_description_pricing_page`) VALUES
(5, 20, 'Home', 'Home Descriptions', 'Properties', 'properties descriptions', 'project', 'Project Description', 'Agent login', 'Agent login description', 'Agent Forget Password', 'Description For Agent Forget Password', 'Blog', 'Blog descriptions', 'Faq', 'faq descriptions', 'contact', 'contact descriptions', 'Login', 'Login descriptions', 'Signup', 'signup descriptions', 'Forget Password', 'Forget Password descriptions', 'Vendor Login', 'Vendor Login descriptions', 'Vendor Signup', 'Vendor Signup descriptions', 'Vendor Forget Password', 'vendor forget password descriptions', 'vendors', 'vendors descriptions', 'About us', 'about us descriptions', '2023-08-27 01:03:33', '2024-03-25 22:05:12', 'Pricing', 'Description For Pricing Page');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `background_image` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `language_id`, `background_image`, `title`, `text`, `created_at`, `updated_at`) VALUES
(10, 20, '657438b470449.jpg', 'Discover Your Perfect Home With Estay', 'Estaty Services Waiting For You', '2023-08-19 00:37:09', '2024-06-14 07:59:03'),
(11, 20, '657438a80c6be.jpg', 'Your Trusted Estaty Partner', 'Buy Land They\'re Not Making It Anymore', '2023-08-19 02:45:06', '2024-06-11 05:59:52'),
(14, 20, '657438c58e329.jpg', 'Your Trusted Estaty Partner', 'The Best Time To Buy House With Us', '2023-12-09 03:52:05', '2024-06-11 06:00:00'),
(15, 25, '666bf8c01b4be.jpg', 'اكتشف منزلك المثالي مع عقار', 'الخدمات العقارية في انتظاركم', '2024-06-14 08:01:04', '2024-06-14 08:03:06'),
(16, 25, '666bf8e87adb3.jpg', 'شريكك العقاري الموثوق به', 'اشترِ أرضًا، ولن يتمكنوا من تحقيق ذلك بعد الآن', '2024-06-14 08:01:44', '2024-06-14 08:01:44'),
(17, 25, '666bf90bd61f9.jpg', 'شريكك العقاري الموثوق به', 'اشترِ أرضًا، ولن يتمكنوا من تحقيق ذلك بعد الآن', '2024-06-14 08:02:19', '2024-06-14 08:02:19');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `serial_number` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `icon`, `url`, `serial_number`, `created_at`, `updated_at`) VALUES
(36, 'fab fa-instagram', 'http://example.com/', 1, '2021-11-20 03:01:42', '2024-06-12 08:51:18'),
(38, 'fab fa-dribbble', 'http://example.coms/', 2, '2021-11-20 03:04:29', '2024-06-12 08:50:57'),
(39, 'fab fa-youtube', 'http://example.com/', 4, '2024-06-12 08:49:44', '2024-06-12 08:50:42'),
(40, 'fab fa-twitter', 'http://example.com/', 3, '2024-06-12 08:50:34', '2024-06-12 08:50:34');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email_id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email_id`, `created_at`, `updated_at`) VALUES
(70, 'faltusone@gmail.com', '2025-10-12 08:04:00', '2025-10-12 08:04:00'),
(71, 'zyji@mailinator.com', '2025-11-01 06:28:26', '2025-11-01 06:28:26');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_sections`
--

CREATE TABLE `subscribe_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribe_sections`
--

INSERT INTO `subscribe_sections` (`id`, `language_id`, `title`, `subtitle`, `btn_name`, `created_at`, `updated_at`) VALUES
(1, 20, 'Do you want offer?', 'Let’s Start Build Your Home With Us', 'Start Now', '2023-12-11 22:36:03', '2023-12-11 22:36:03'),
(2, 25, 'هل تريد عرضا؟', 'لنبدأ في بناء منزلك معنا', 'ابدأ الآن', '2024-06-14 07:32:45', '2024-06-14 07:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` longtext,
  `attachment` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '1-pending, 2-open, 3-closed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_message` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_statuses`
--

CREATE TABLE `support_ticket_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `support_ticket_statuses`
--

INSERT INTO `support_ticket_statuses` (`id`, `support_ticket_status`, `created_at`, `updated_at`) VALUES
(1, 'active', '2022-06-25 03:52:18', '2024-01-29 00:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `rating` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `language_id`, `image`, `name`, `occupation`, `comment`, `rating`, `created_at`, `updated_at`) VALUES
(25, 20, '64e090a46f9b5.png', 'Hames Rodrigo', 'Marketing Executive', 'I had an amazing experience using this property listing website. The user-friendly interface made it so easy for me to find the perfect property that suited my needs.', '5', '2023-08-19 03:51:32', '2024-06-13 07:09:54'),
(26, 20, '64e090d7f3613.png', 'John Martinez', 'IT Consultant', 'As someone who values efficiency, I appreciated how organized and informative this property listing website is. The search filters helped me narrow down my options quickly.', '4.5', '2023-08-19 03:52:23', '2024-06-13 07:09:46'),
(27, 20, '64e09132e765f.png', 'Emily Parker', 'Teacher', 'I\'m usually quite skeptical about online purchases, but this estaty listing website exceeded my expectations. The transparency in providing vehicle histories', '5', '2023-08-19 03:53:54', '2024-06-13 07:09:38'),
(28, 20, '64e091760ae84.png', 'Michael Collins', 'Marketing Manager', '\"I had been dreading the process of searching for a new home, but this website made it surprisingly enjoyable. The intuitive layout made navigation a breeze.', '4.3', '2023-08-19 03:55:02', '2024-06-13 07:09:29'),
(29, 20, '64e091afd6994.png', 'Jennifer Lee', 'Freelance Photographer', 'I found the estaty website to be quite useful overall. It helped me find some interesting options for my next project.', '5', '2023-08-19 03:55:59', '2024-06-13 07:09:16'),
(37, 25, '666bf0c2052c6.png', 'جنيفر لي', 'مصور فوتوغرافي مستقل', 'لقد وجدت أن موقع الويب الخاص بالعقارات مفيد جدًا بشكل عام. لقد ساعدني ذلك في العثور على بعض الخيارات المثيرة للاهتمام لمشروعي القادم.', '5', '2024-06-14 07:26:58', '2024-06-14 07:26:58'),
(38, 25, '666bf112a1f62.png', 'مايكل كولينز', 'مدير تسويق', 'لقد كنت أخشى عملية البحث عن منزل جديد، ولكن هذا الموقع جعلها ممتعة بشكل مدهش. لقد جعل التصميم البديهي التنقل أمرًا سهلاً.', '4.3', '2024-06-14 07:28:18', '2024-06-14 07:28:18'),
(39, 25, '666bf17870f63.png', 'إميلي باركر', 'مدرس', 'I\'m usually quite skeptical about online purchases, but this estaty listing website exceeded my expectations. The transparency in providing vehicle histories', '5', '2024-06-14 07:30:00', '2024-06-14 07:30:00'),
(40, 25, '666bf1b2edba1.png', 'جون مارتينيز', 'مستشار تكنولوجيا المعلومات', 'كشخص يقدر الكفاءة، أقدر مدى تنظيم موقع قائمة السيارات هذا وغني بالمعلومات. ساعدتني مرشحات البحث في تضييق نطاق خياراتي بسرعة.', '4.5', '2024-06-14 07:30:58', '2024-06-14 07:30:58');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_sections`
--

CREATE TABLE `testimonial_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `testimonial_sections`
--

INSERT INTO `testimonial_sections` (`id`, `language_id`, `subtitle`, `title`, `content`, `created_at`, `updated_at`) VALUES
(7, 20, 'What Our Client\'s Say About Us', 'Client’s Testimonial', 'Proin adipiscing porta tellus, ut feugiat nibhiop adipisci amet In eu justo a felis faucibus vel Vestibulum ante ipsum primis in fauc.', '2023-08-19 03:45:43', '2023-12-08 03:22:52'),
(9, 25, 'ما يقوله عملائنا عنا', 'شهادات العملاء', 'المغلوطة حول استنكار  النشوة وتمجيد الألم نشأت بالفعل، وسأعرض لك التفاصيل لتكتشف حقيقة وأساس تلك السعادة البشرية، فلا أحد يرفض أو يكره أو يتجنب الشعور بالسعادة، ولكن بفضل هؤ.', '2024-06-14 07:25:29', '2024-06-14 07:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `country_code` char(3) NOT NULL,
  `timezone` varchar(125) NOT NULL DEFAULT '',
  `gmt_offset` float(10,2) DEFAULT NULL,
  `dst_offset` float(10,2) DEFAULT NULL,
  `raw_offset` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`country_code`, `timezone`, `gmt_offset`, `dst_offset`, `raw_offset`) VALUES
('AD', 'Europe/Andorra', 1.00, 2.00, 1.00),
('AE', 'Asia/Dubai', 4.00, 4.00, 4.00),
('AF', 'Asia/Kabul', 4.50, 4.50, 4.50),
('AG', 'America/Antigua', -4.00, -4.00, -4.00),
('AI', 'America/Anguilla', -4.00, -4.00, -4.00),
('AL', 'Europe/Tirane', 1.00, 2.00, 1.00),
('AM', 'Asia/Yerevan', 4.00, 4.00, 4.00),
('AO', 'Africa/Luanda', 1.00, 1.00, 1.00),
('AQ', 'Antarctica/Casey', 8.00, 8.00, 8.00),
('AQ', 'Antarctica/Davis', 7.00, 7.00, 7.00),
('AQ', 'Antarctica/DumontDUrville', 10.00, 10.00, 10.00),
('AQ', 'Antarctica/Mawson', 5.00, 5.00, 5.00),
('AQ', 'Antarctica/McMurdo', 13.00, 12.00, 12.00),
('AQ', 'Antarctica/Palmer', -3.00, -4.00, -4.00),
('AQ', 'Antarctica/Rothera', -3.00, -3.00, -3.00),
('AQ', 'Antarctica/South_Pole', 13.00, 12.00, 12.00),
('AQ', 'Antarctica/Syowa', 3.00, 3.00, 3.00),
('AQ', 'Antarctica/Vostok', 6.00, 6.00, 6.00),
('AR', 'America/Argentina/Buenos_Aires', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/Catamarca', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/Cordoba', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/Jujuy', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/La_Rioja', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/Mendoza', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/Rio_Gallegos', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/Salta', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/San_Juan', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/San_Luis', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/Tucuman', -3.00, -3.00, -3.00),
('AR', 'America/Argentina/Ushuaia', -3.00, -3.00, -3.00),
('AS', 'Pacific/Pago_Pago', -11.00, -11.00, -11.00),
('AT', 'Europe/Vienna', 1.00, 2.00, 1.00),
('AU', 'Antarctica/Macquarie', 11.00, 11.00, 11.00),
('AU', 'Australia/Adelaide', 10.50, 9.50, 9.50),
('AU', 'Australia/Brisbane', 10.00, 10.00, 10.00),
('AU', 'Australia/Broken_Hill', 10.50, 9.50, 9.50),
('AU', 'Australia/Currie', 11.00, 10.00, 10.00),
('AU', 'Australia/Darwin', 9.50, 9.50, 9.50),
('AU', 'Australia/Eucla', 8.75, 8.75, 8.75),
('AU', 'Australia/Hobart', 11.00, 10.00, 10.00),
('AU', 'Australia/Lindeman', 10.00, 10.00, 10.00),
('AU', 'Australia/Lord_Howe', 11.00, 10.50, 10.50),
('AU', 'Australia/Melbourne', 11.00, 10.00, 10.00),
('AU', 'Australia/Perth', 8.00, 8.00, 8.00),
('AU', 'Australia/Sydney', 11.00, 10.00, 10.00),
('AW', 'America/Aruba', -4.00, -4.00, -4.00),
('AX', 'Europe/Mariehamn', 2.00, 3.00, 2.00),
('AZ', 'Asia/Baku', 4.00, 5.00, 4.00),
('BA', 'Europe/Sarajevo', 1.00, 2.00, 1.00),
('BB', 'America/Barbados', -4.00, -4.00, -4.00),
('BD', 'Asia/Dhaka', 6.00, 6.00, 6.00),
('BE', 'Europe/Brussels', 1.00, 2.00, 1.00),
('BF', 'Africa/Ouagadougou', 0.00, 0.00, 0.00),
('BG', 'Europe/Sofia', 2.00, 3.00, 2.00),
('BH', 'Asia/Bahrain', 3.00, 3.00, 3.00),
('BI', 'Africa/Bujumbura', 2.00, 2.00, 2.00),
('BJ', 'Africa/Porto-Novo', 1.00, 1.00, 1.00),
('BL', 'America/St_Barthelemy', -4.00, -4.00, -4.00),
('BM', 'Atlantic/Bermuda', -4.00, -3.00, -4.00),
('BN', 'Asia/Brunei', 8.00, 8.00, 8.00),
('BO', 'America/La_Paz', -4.00, -4.00, -4.00),
('BQ', 'America/Kralendijk', -4.00, -4.00, -4.00),
('BR', 'America/Araguaina', -3.00, -3.00, -3.00),
('BR', 'America/Bahia', -3.00, -3.00, -3.00),
('BR', 'America/Belem', -3.00, -3.00, -3.00),
('BR', 'America/Boa_Vista', -4.00, -4.00, -4.00),
('BR', 'America/Campo_Grande', -3.00, -4.00, -4.00),
('BR', 'America/Cuiaba', -3.00, -4.00, -4.00),
('BR', 'America/Eirunepe', -5.00, -5.00, -5.00),
('BR', 'America/Fortaleza', -3.00, -3.00, -3.00),
('BR', 'America/Maceio', -3.00, -3.00, -3.00),
('BR', 'America/Manaus', -4.00, -4.00, -4.00),
('BR', 'America/Noronha', -2.00, -2.00, -2.00),
('BR', 'America/Porto_Velho', -4.00, -4.00, -4.00),
('BR', 'America/Recife', -3.00, -3.00, -3.00),
('BR', 'America/Rio_Branco', -5.00, -5.00, -5.00),
('BR', 'America/Santarem', -3.00, -3.00, -3.00),
('BR', 'America/Sao_Paulo', -2.00, -3.00, -3.00),
('BS', 'America/Nassau', -5.00, -4.00, -5.00),
('BT', 'Asia/Thimphu', 6.00, 6.00, 6.00),
('BW', 'Africa/Gaborone', 2.00, 2.00, 2.00),
('BY', 'Europe/Minsk', 3.00, 3.00, 3.00),
('BZ', 'America/Belize', -6.00, -6.00, -6.00),
('CA', 'America/Atikokan', -5.00, -5.00, -5.00),
('CA', 'America/Blanc-Sablon', -4.00, -4.00, -4.00),
('CA', 'America/Cambridge_Bay', -7.00, -6.00, -7.00),
('CA', 'America/Creston', -7.00, -7.00, -7.00),
('CA', 'America/Dawson', -8.00, -7.00, -8.00),
('CA', 'America/Dawson_Creek', -7.00, -7.00, -7.00),
('CA', 'America/Edmonton', -7.00, -6.00, -7.00),
('CA', 'America/Glace_Bay', -4.00, -3.00, -4.00),
('CA', 'America/Goose_Bay', -4.00, -3.00, -4.00),
('CA', 'America/Halifax', -4.00, -3.00, -4.00),
('CA', 'America/Inuvik', -7.00, -6.00, -7.00),
('CA', 'America/Iqaluit', -5.00, -4.00, -5.00),
('CA', 'America/Moncton', -4.00, -3.00, -4.00),
('CA', 'America/Montreal', -5.00, -4.00, -5.00),
('CA', 'America/Nipigon', -5.00, -4.00, -5.00),
('CA', 'America/Pangnirtung', -5.00, -4.00, -5.00),
('CA', 'America/Rainy_River', -6.00, -5.00, -6.00),
('CA', 'America/Rankin_Inlet', -6.00, -5.00, -6.00),
('CA', 'America/Regina', -6.00, -6.00, -6.00),
('CA', 'America/Resolute', -6.00, -5.00, -6.00),
('CA', 'America/St_Johns', -3.50, -2.50, -3.50),
('CA', 'America/Swift_Current', -6.00, -6.00, -6.00),
('CA', 'America/Thunder_Bay', -5.00, -4.00, -5.00),
('CA', 'America/Toronto', -5.00, -4.00, -5.00),
('CA', 'America/Vancouver', -8.00, -7.00, -8.00),
('CA', 'America/Whitehorse', -8.00, -7.00, -8.00),
('CA', 'America/Winnipeg', -6.00, -5.00, -6.00),
('CA', 'America/Yellowknife', -7.00, -6.00, -7.00),
('CC', 'Indian/Cocos', 6.50, 6.50, 6.50),
('CD', 'Africa/Kinshasa', 1.00, 1.00, 1.00),
('CD', 'Africa/Lubumbashi', 2.00, 2.00, 2.00),
('CF', 'Africa/Bangui', 1.00, 1.00, 1.00),
('CG', 'Africa/Brazzaville', 1.00, 1.00, 1.00),
('CH', 'Europe/Zurich', 1.00, 2.00, 1.00),
('CI', 'Africa/Abidjan', 0.00, 0.00, 0.00),
('CK', 'Pacific/Rarotonga', -10.00, -10.00, -10.00),
('CL', 'America/Santiago', -3.00, -4.00, -4.00),
('CL', 'Pacific/Easter', -5.00, -6.00, -6.00),
('CM', 'Africa/Douala', 1.00, 1.00, 1.00),
('CN', 'Asia/Chongqing', 8.00, 8.00, 8.00),
('CN', 'Asia/Harbin', 8.00, 8.00, 8.00),
('CN', 'Asia/Kashgar', 8.00, 8.00, 8.00),
('CN', 'Asia/Shanghai', 8.00, 8.00, 8.00),
('CN', 'Asia/Urumqi', 8.00, 8.00, 8.00),
('CO', 'America/Bogota', -5.00, -5.00, -5.00),
('CR', 'America/Costa_Rica', -6.00, -6.00, -6.00),
('CU', 'America/Havana', -5.00, -4.00, -5.00),
('CV', 'Atlantic/Cape_Verde', -1.00, -1.00, -1.00),
('CW', 'America/Curacao', -4.00, -4.00, -4.00),
('CX', 'Indian/Christmas', 7.00, 7.00, 7.00),
('CY', 'Asia/Nicosia', 2.00, 3.00, 2.00),
('CZ', 'Europe/Prague', 1.00, 2.00, 1.00),
('DE', 'Europe/Berlin', 1.00, 2.00, 1.00),
('DE', 'Europe/Busingen', 1.00, 2.00, 1.00),
('DJ', 'Africa/Djibouti', 3.00, 3.00, 3.00),
('DK', 'Europe/Copenhagen', 1.00, 2.00, 1.00),
('DM', 'America/Dominica', -4.00, -4.00, -4.00),
('DO', 'America/Santo_Domingo', -4.00, -4.00, -4.00),
('DZ', 'Africa/Algiers', 1.00, 1.00, 1.00),
('EC', 'America/Guayaquil', -5.00, -5.00, -5.00),
('EC', 'Pacific/Galapagos', -6.00, -6.00, -6.00),
('EE', 'Europe/Tallinn', 2.00, 3.00, 2.00),
('EG', 'Africa/Cairo', 2.00, 2.00, 2.00),
('EH', 'Africa/El_Aaiun', 0.00, 0.00, 0.00),
('ER', 'Africa/Asmara', 3.00, 3.00, 3.00),
('ES', 'Africa/Ceuta', 1.00, 2.00, 1.00),
('ES', 'Atlantic/Canary', 0.00, 1.00, 0.00),
('ES', 'Europe/Madrid', 1.00, 2.00, 1.00),
('ET', 'Africa/Addis_Ababa', 3.00, 3.00, 3.00),
('FI', 'Europe/Helsinki', 2.00, 3.00, 2.00),
('FJ', 'Pacific/Fiji', 13.00, 12.00, 12.00),
('FK', 'Atlantic/Stanley', -3.00, -3.00, -3.00),
('FM', 'Pacific/Chuuk', 10.00, 10.00, 10.00),
('FM', 'Pacific/Kosrae', 11.00, 11.00, 11.00),
('FM', 'Pacific/Pohnpei', 11.00, 11.00, 11.00),
('FO', 'Atlantic/Faroe', 0.00, 1.00, 0.00),
('FR', 'Europe/Paris', 1.00, 2.00, 1.00),
('GA', 'Africa/Libreville', 1.00, 1.00, 1.00),
('GB', 'Europe/London', 0.00, 1.00, 0.00),
('GD', 'America/Grenada', -4.00, -4.00, -4.00),
('GE', 'Asia/Tbilisi', 4.00, 4.00, 4.00),
('GF', 'America/Cayenne', -3.00, -3.00, -3.00),
('GG', 'Europe/Guernsey', 0.00, 1.00, 0.00),
('GH', 'Africa/Accra', 0.00, 0.00, 0.00),
('GI', 'Europe/Gibraltar', 1.00, 2.00, 1.00),
('GL', 'America/Danmarkshavn', 0.00, 0.00, 0.00),
('GL', 'America/Godthab', -3.00, -2.00, -3.00),
('GL', 'America/Scoresbysund', -1.00, 0.00, -1.00),
('GL', 'America/Thule', -4.00, -3.00, -4.00),
('GM', 'Africa/Banjul', 0.00, 0.00, 0.00),
('GN', 'Africa/Conakry', 0.00, 0.00, 0.00),
('GP', 'America/Guadeloupe', -4.00, -4.00, -4.00),
('GQ', 'Africa/Malabo', 1.00, 1.00, 1.00),
('GR', 'Europe/Athens', 2.00, 3.00, 2.00),
('GS', 'Atlantic/South_Georgia', -2.00, -2.00, -2.00),
('GT', 'America/Guatemala', -6.00, -6.00, -6.00),
('GU', 'Pacific/Guam', 10.00, 10.00, 10.00),
('GW', 'Africa/Bissau', 0.00, 0.00, 0.00),
('GY', 'America/Guyana', -4.00, -4.00, -4.00),
('HK', 'Asia/Hong_Kong', 8.00, 8.00, 8.00),
('HN', 'America/Tegucigalpa', -6.00, -6.00, -6.00),
('HR', 'Europe/Zagreb', 1.00, 2.00, 1.00),
('HT', 'America/Port-au-Prince', -5.00, -4.00, -5.00),
('HU', 'Europe/Budapest', 1.00, 2.00, 1.00),
('ID', 'Asia/Jakarta', 7.00, 7.00, 7.00),
('ID', 'Asia/Jayapura', 9.00, 9.00, 9.00),
('ID', 'Asia/Makassar', 8.00, 8.00, 8.00),
('ID', 'Asia/Pontianak', 7.00, 7.00, 7.00),
('IE', 'Europe/Dublin', 0.00, 1.00, 0.00),
('IL', 'Asia/Jerusalem', 2.00, 3.00, 2.00),
('IM', 'Europe/Isle_of_Man', 0.00, 1.00, 0.00),
('IN', 'Asia/Kolkata', 5.50, 5.50, 5.50),
('IO', 'Indian/Chagos', 6.00, 6.00, 6.00),
('IQ', 'Asia/Baghdad', 3.00, 3.00, 3.00),
('IR', 'Asia/Tehran', 3.50, 4.50, 3.50),
('IS', 'Atlantic/Reykjavik', 0.00, 0.00, 0.00),
('IT', 'Europe/Rome', 1.00, 2.00, 1.00),
('JE', 'Europe/Jersey', 0.00, 1.00, 0.00),
('JM', 'America/Jamaica', -5.00, -5.00, -5.00),
('JO', 'Asia/Amman', 2.00, 3.00, 2.00),
('JP', 'Asia/Tokyo', 9.00, 9.00, 9.00),
('KE', 'Africa/Nairobi', 3.00, 3.00, 3.00),
('KG', 'Asia/Bishkek', 6.00, 6.00, 6.00),
('KH', 'Asia/Phnom_Penh', 7.00, 7.00, 7.00),
('KI', 'Pacific/Enderbury', 13.00, 13.00, 13.00),
('KI', 'Pacific/Kiritimati', 14.00, 14.00, 14.00),
('KI', 'Pacific/Tarawa', 12.00, 12.00, 12.00),
('KM', 'Indian/Comoro', 3.00, 3.00, 3.00),
('KN', 'America/St_Kitts', -4.00, -4.00, -4.00),
('KP', 'Asia/Pyongyang', 9.00, 9.00, 9.00),
('KR', 'Asia/Seoul', 9.00, 9.00, 9.00),
('KW', 'Asia/Kuwait', 3.00, 3.00, 3.00),
('KY', 'America/Cayman', -5.00, -5.00, -5.00),
('KZ', 'Asia/Almaty', 6.00, 6.00, 6.00),
('KZ', 'Asia/Aqtau', 5.00, 5.00, 5.00),
('KZ', 'Asia/Aqtobe', 5.00, 5.00, 5.00),
('KZ', 'Asia/Oral', 5.00, 5.00, 5.00),
('KZ', 'Asia/Qyzylorda', 6.00, 6.00, 6.00),
('LA', 'Asia/Vientiane', 7.00, 7.00, 7.00),
('LB', 'Asia/Beirut', 2.00, 3.00, 2.00),
('LC', 'America/St_Lucia', -4.00, -4.00, -4.00),
('LI', 'Europe/Vaduz', 1.00, 2.00, 1.00),
('LK', 'Asia/Colombo', 5.50, 5.50, 5.50),
('LR', 'Africa/Monrovia', 0.00, 0.00, 0.00),
('LS', 'Africa/Maseru', 2.00, 2.00, 2.00),
('LT', 'Europe/Vilnius', 2.00, 3.00, 2.00),
('LU', 'Europe/Luxembourg', 1.00, 2.00, 1.00),
('LV', 'Europe/Riga', 2.00, 3.00, 2.00),
('LY', 'Africa/Tripoli', 2.00, 2.00, 2.00),
('MA', 'Africa/Casablanca', 0.00, 0.00, 0.00),
('MC', 'Europe/Monaco', 1.00, 2.00, 1.00),
('MD', 'Europe/Chisinau', 2.00, 3.00, 2.00),
('ME', 'Europe/Podgorica', 1.00, 2.00, 1.00),
('MF', 'America/Marigot', -4.00, -4.00, -4.00),
('MG', 'Indian/Antananarivo', 3.00, 3.00, 3.00),
('MH', 'Pacific/Kwajalein', 12.00, 12.00, 12.00),
('MH', 'Pacific/Majuro', 12.00, 12.00, 12.00),
('MK', 'Europe/Skopje', 1.00, 2.00, 1.00),
('ML', 'Africa/Bamako', 0.00, 0.00, 0.00),
('MM', 'Asia/Rangoon', 6.50, 6.50, 6.50),
('MN', 'Asia/Choibalsan', 8.00, 8.00, 8.00),
('MN', 'Asia/Hovd', 7.00, 7.00, 7.00),
('MN', 'Asia/Ulaanbaatar', 8.00, 8.00, 8.00),
('MO', 'Asia/Macau', 8.00, 8.00, 8.00),
('MP', 'Pacific/Saipan', 10.00, 10.00, 10.00),
('MQ', 'America/Martinique', -4.00, -4.00, -4.00),
('MR', 'Africa/Nouakchott', 0.00, 0.00, 0.00),
('MS', 'America/Montserrat', -4.00, -4.00, -4.00),
('MT', 'Europe/Malta', 1.00, 2.00, 1.00),
('MU', 'Indian/Mauritius', 4.00, 4.00, 4.00),
('MV', 'Indian/Maldives', 5.00, 5.00, 5.00),
('MW', 'Africa/Blantyre', 2.00, 2.00, 2.00),
('MX', 'America/Bahia_Banderas', -6.00, -5.00, -6.00),
('MX', 'America/Cancun', -6.00, -5.00, -6.00),
('MX', 'America/Chihuahua', -7.00, -6.00, -7.00),
('MX', 'America/Hermosillo', -7.00, -7.00, -7.00),
('MX', 'America/Matamoros', -6.00, -5.00, -6.00),
('MX', 'America/Mazatlan', -7.00, -6.00, -7.00),
('MX', 'America/Merida', -6.00, -5.00, -6.00),
('MX', 'America/Mexico_City', -6.00, -5.00, -6.00),
('MX', 'America/Monterrey', -6.00, -5.00, -6.00),
('MX', 'America/Ojinaga', -7.00, -6.00, -7.00),
('MX', 'America/Santa_Isabel', -8.00, -7.00, -8.00),
('MX', 'America/Tijuana', -8.00, -7.00, -8.00),
('MY', 'Asia/Kuala_Lumpur', 8.00, 8.00, 8.00),
('MY', 'Asia/Kuching', 8.00, 8.00, 8.00),
('MZ', 'Africa/Maputo', 2.00, 2.00, 2.00),
('NA', 'Africa/Windhoek', 2.00, 1.00, 1.00),
('NC', 'Pacific/Noumea', 11.00, 11.00, 11.00),
('NE', 'Africa/Niamey', 1.00, 1.00, 1.00),
('NF', 'Pacific/Norfolk', 11.50, 11.50, 11.50),
('NG', 'Africa/Lagos', 1.00, 1.00, 1.00),
('NI', 'America/Managua', -6.00, -6.00, -6.00),
('NL', 'Europe/Amsterdam', 1.00, 2.00, 1.00),
('NO', 'Europe/Oslo', 1.00, 2.00, 1.00),
('NP', 'Asia/Kathmandu', 5.75, 5.75, 5.75),
('NR', 'Pacific/Nauru', 12.00, 12.00, 12.00),
('NU', 'Pacific/Niue', -11.00, -11.00, -11.00),
('NZ', 'Pacific/Auckland', 13.00, 12.00, 12.00),
('NZ', 'Pacific/Chatham', 13.75, 12.75, 12.75),
('OM', 'Asia/Muscat', 4.00, 4.00, 4.00),
('PA', 'America/Panama', -5.00, -5.00, -5.00),
('PE', 'America/Lima', -5.00, -5.00, -5.00),
('PF', 'Pacific/Gambier', -9.00, -9.00, -9.00),
('PF', 'Pacific/Marquesas', -9.50, -9.50, -9.50),
('PF', 'Pacific/Tahiti', -10.00, -10.00, -10.00),
('PG', 'Pacific/Port_Moresby', 10.00, 10.00, 10.00),
('PH', 'Asia/Manila', 8.00, 8.00, 8.00),
('PK', 'Asia/Karachi', 5.00, 5.00, 5.00),
('PL', 'Europe/Warsaw', 1.00, 2.00, 1.00),
('PM', 'America/Miquelon', -3.00, -2.00, -3.00),
('PN', 'Pacific/Pitcairn', -8.00, -8.00, -8.00),
('PR', 'America/Puerto_Rico', -4.00, -4.00, -4.00),
('PS', 'Asia/Gaza', 2.00, 3.00, 2.00),
('PS', 'Asia/Hebron', 2.00, 3.00, 2.00),
('PT', 'Atlantic/Azores', -1.00, 0.00, -1.00),
('PT', 'Atlantic/Madeira', 0.00, 1.00, 0.00),
('PT', 'Europe/Lisbon', 0.00, 1.00, 0.00),
('PW', 'Pacific/Palau', 9.00, 9.00, 9.00),
('PY', 'America/Asuncion', -3.00, -4.00, -4.00),
('QA', 'Asia/Qatar', 3.00, 3.00, 3.00),
('RE', 'Indian/Reunion', 4.00, 4.00, 4.00),
('RO', 'Europe/Bucharest', 2.00, 3.00, 2.00),
('RS', 'Europe/Belgrade', 1.00, 2.00, 1.00),
('RU', 'Asia/Anadyr', 12.00, 12.00, 12.00),
('RU', 'Asia/Irkutsk', 9.00, 9.00, 9.00),
('RU', 'Asia/Kamchatka', 12.00, 12.00, 12.00),
('RU', 'Asia/Khandyga', 10.00, 10.00, 10.00),
('RU', 'Asia/Krasnoyarsk', 8.00, 8.00, 8.00),
('RU', 'Asia/Magadan', 12.00, 12.00, 12.00),
('RU', 'Asia/Novokuznetsk', 7.00, 7.00, 7.00),
('RU', 'Asia/Novosibirsk', 7.00, 7.00, 7.00),
('RU', 'Asia/Omsk', 7.00, 7.00, 7.00),
('RU', 'Asia/Sakhalin', 11.00, 11.00, 11.00),
('RU', 'Asia/Ust-Nera', 11.00, 11.00, 11.00),
('RU', 'Asia/Vladivostok', 11.00, 11.00, 11.00),
('RU', 'Asia/Yakutsk', 10.00, 10.00, 10.00),
('RU', 'Asia/Yekaterinburg', 6.00, 6.00, 6.00),
('RU', 'Europe/Kaliningrad', 3.00, 3.00, 3.00),
('RU', 'Europe/Moscow', 4.00, 4.00, 4.00),
('RU', 'Europe/Samara', 4.00, 4.00, 4.00),
('RU', 'Europe/Volgograd', 4.00, 4.00, 4.00),
('RW', 'Africa/Kigali', 2.00, 2.00, 2.00),
('SA', 'Asia/Riyadh', 3.00, 3.00, 3.00),
('SB', 'Pacific/Guadalcanal', 11.00, 11.00, 11.00),
('SC', 'Indian/Mahe', 4.00, 4.00, 4.00),
('SD', 'Africa/Khartoum', 3.00, 3.00, 3.00),
('SE', 'Europe/Stockholm', 1.00, 2.00, 1.00),
('SG', 'Asia/Singapore', 8.00, 8.00, 8.00),
('SH', 'Atlantic/St_Helena', 0.00, 0.00, 0.00),
('SI', 'Europe/Ljubljana', 1.00, 2.00, 1.00),
('SJ', 'Arctic/Longyearbyen', 1.00, 2.00, 1.00),
('SK', 'Europe/Bratislava', 1.00, 2.00, 1.00),
('SL', 'Africa/Freetown', 0.00, 0.00, 0.00),
('SM', 'Europe/San_Marino', 1.00, 2.00, 1.00),
('SN', 'Africa/Dakar', 0.00, 0.00, 0.00),
('SO', 'Africa/Mogadishu', 3.00, 3.00, 3.00),
('SR', 'America/Paramaribo', -3.00, -3.00, -3.00),
('SS', 'Africa/Juba', 3.00, 3.00, 3.00),
('ST', 'Africa/Sao_Tome', 0.00, 0.00, 0.00),
('SV', 'America/El_Salvador', -6.00, -6.00, -6.00),
('SX', 'America/Lower_Princes', -4.00, -4.00, -4.00),
('SY', 'Asia/Damascus', 2.00, 3.00, 2.00),
('SZ', 'Africa/Mbabane', 2.00, 2.00, 2.00),
('TC', 'America/Grand_Turk', -5.00, -4.00, -5.00),
('TD', 'Africa/Ndjamena', 1.00, 1.00, 1.00),
('TF', 'Indian/Kerguelen', 5.00, 5.00, 5.00),
('TG', 'Africa/Lome', 0.00, 0.00, 0.00),
('TH', 'Asia/Bangkok', 7.00, 7.00, 7.00),
('TJ', 'Asia/Dushanbe', 5.00, 5.00, 5.00),
('TK', 'Pacific/Fakaofo', 13.00, 13.00, 13.00),
('TL', 'Asia/Dili', 9.00, 9.00, 9.00),
('TM', 'Asia/Ashgabat', 5.00, 5.00, 5.00),
('TN', 'Africa/Tunis', 1.00, 1.00, 1.00),
('TO', 'Pacific/Tongatapu', 13.00, 13.00, 13.00),
('TR', 'Europe/Istanbul', 2.00, 3.00, 2.00),
('TT', 'America/Port_of_Spain', -4.00, -4.00, -4.00),
('TV', 'Pacific/Funafuti', 12.00, 12.00, 12.00),
('TW', 'Asia/Taipei', 8.00, 8.00, 8.00),
('TZ', 'Africa/Dar_es_Salaam', 3.00, 3.00, 3.00),
('UA', 'Europe/Kiev', 2.00, 3.00, 2.00),
('UA', 'Europe/Simferopol', 2.00, 4.00, 4.00),
('UA', 'Europe/Uzhgorod', 2.00, 3.00, 2.00),
('UA', 'Europe/Zaporozhye', 2.00, 3.00, 2.00),
('UG', 'Africa/Kampala', 3.00, 3.00, 3.00),
('UM', 'Pacific/Johnston', -10.00, -10.00, -10.00),
('UM', 'Pacific/Midway', -11.00, -11.00, -11.00),
('UM', 'Pacific/Wake', 12.00, 12.00, 12.00),
('US', 'America/Adak', -10.00, -9.00, -10.00),
('US', 'America/Anchorage', -9.00, -8.00, -9.00),
('US', 'America/Boise', -7.00, -6.00, -7.00),
('US', 'America/Chicago', -6.00, -5.00, -6.00),
('US', 'America/Denver', -7.00, -6.00, -7.00),
('US', 'America/Detroit', -5.00, -4.00, -5.00),
('US', 'America/Indiana/Indianapolis', -5.00, -4.00, -5.00),
('US', 'America/Indiana/Knox', -6.00, -5.00, -6.00),
('US', 'America/Indiana/Marengo', -5.00, -4.00, -5.00),
('US', 'America/Indiana/Petersburg', -5.00, -4.00, -5.00),
('US', 'America/Indiana/Tell_City', -6.00, -5.00, -6.00),
('US', 'America/Indiana/Vevay', -5.00, -4.00, -5.00),
('US', 'America/Indiana/Vincennes', -5.00, -4.00, -5.00),
('US', 'America/Indiana/Winamac', -5.00, -4.00, -5.00),
('US', 'America/Juneau', -9.00, -8.00, -9.00),
('US', 'America/Kentucky/Louisville', -5.00, -4.00, -5.00),
('US', 'America/Kentucky/Monticello', -5.00, -4.00, -5.00),
('US', 'America/Los_Angeles', -8.00, -7.00, -8.00),
('US', 'America/Menominee', -6.00, -5.00, -6.00),
('US', 'America/Metlakatla', -8.00, -8.00, -8.00),
('US', 'America/New_York', -5.00, -4.00, -5.00),
('US', 'America/Nome', -9.00, -8.00, -9.00),
('US', 'America/North_Dakota/Beulah', -6.00, -5.00, -6.00),
('US', 'America/North_Dakota/Center', -6.00, -5.00, -6.00),
('US', 'America/North_Dakota/New_Salem', -6.00, -5.00, -6.00),
('US', 'America/Phoenix', -7.00, -7.00, -7.00),
('US', 'America/Shiprock', -7.00, -6.00, -7.00),
('US', 'America/Sitka', -9.00, -8.00, -9.00),
('US', 'America/Yakutat', -9.00, -8.00, -9.00),
('US', 'Pacific/Honolulu', -10.00, -10.00, -10.00),
('UY', 'America/Montevideo', -2.00, -3.00, -3.00),
('UZ', 'Asia/Samarkand', 5.00, 5.00, 5.00),
('UZ', 'Asia/Tashkent', 5.00, 5.00, 5.00),
('VA', 'Europe/Vatican', 1.00, 2.00, 1.00),
('VC', 'America/St_Vincent', -4.00, -4.00, -4.00),
('VE', 'America/Caracas', -4.50, -4.50, -4.50),
('VG', 'America/Tortola', -4.00, -4.00, -4.00),
('VI', 'America/St_Thomas', -4.00, -4.00, -4.00),
('VN', 'Asia/Ho_Chi_Minh', 7.00, 7.00, 7.00),
('VU', 'Pacific/Efate', 11.00, 11.00, 11.00),
('WF', 'Pacific/Wallis', 12.00, 12.00, 12.00),
('WS', 'Pacific/Apia', 14.00, 13.00, 13.00),
('YE', 'Asia/Aden', 3.00, 3.00, 3.00),
('YT', 'Indian/Mayotte', 3.00, 3.00, 3.00),
('ZA', 'Africa/Johannesburg', 2.00, 2.00, 2.00),
('ZM', 'Africa/Lusaka', 2.00, 2.00, 2.00),
('ZW', 'Africa/Harare', 2.00, 2.00, 2.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 -> banned or deactive, 1 -> active',
  `verification_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `provider` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `image`, `email_verified_at`, `password`, `status`, `verification_token`, `remember_token`, `provider`, `provider_id`, `created_at`, `updated_at`, `phone`, `country`, `city`, `state`, `zip_code`, `address`) VALUES
(40, 'Jhon Deo', 'nenimok', 'nenimok340@example.com', NULL, '2024-06-12 04:35:37', '$2y$10$ttJINIggUyEDKhyxnkNI7.G/i/Mz/h9CarnloXdb.EaZYDibCxiZW', 1, NULL, NULL, NULL, NULL, '2024-06-12 04:35:17', '2024-06-12 04:35:37', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `amount` double(8,2) DEFAULT '0.00',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `avg_rating` float(8,2) NOT NULL DEFAULT '0.00',
  `show_email_addresss` tinyint NOT NULL DEFAULT '1',
  `show_phone_number` tinyint NOT NULL DEFAULT '1',
  `show_contact_form` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `photo`, `email`, `phone`, `username`, `password`, `status`, `amount`, `email_verified_at`, `avg_rating`, `show_email_addresss`, `show_phone_number`, `show_contact_form`, `created_at`, `updated_at`) VALUES
(35, '66693bf58cdcb.png', 'nenimok340@example.com', '2574512', 'marcia', '$2y$10$xF59sHuXjP3JReEPj490ceRF1DDeXkE0rpAuv75L1wVhyrp6WOZfu', 1, 0.00, '2024-06-12 04:37:42', 0.00, 1, 1, 1, '2024-06-12 04:37:17', '2025-11-04 12:18:30'),
(36, '66693baebe4c2.png', 'fomima3881@example.com', '26456852', 'oscar_eade', '$2y$10$40.0ALrfpGS5LKAUMg61Eun6fch7bjdWM9dNTBtevHrcuq4g4PKE6', 1, 0.00, '2024-06-12 04:59:56', 0.00, 1, 1, 1, '2024-06-12 04:59:43', '2024-06-12 06:09:50'),
(37, '66693b077cf35.png', 'sotiwo7688@example.com', '25486945', 'gledson', '$2y$10$eJcuA2pHMR2Tc6YGJgju6uUBfK0H51tMeGZ3Y/7b1oizLOto7lsWS', 1, 0.00, '2024-06-12 05:03:06', 0.00, 1, 1, 1, '2024-06-12 05:01:57', '2024-06-12 06:08:08'),
(38, '66693c33f1d1f.png', 'mackenziebuntine@example.com', '24541202', 'mackenzie', '$2y$10$Hd6Yi7QQLykDUCLJCxievuo7JgDSmwGWmJUFZ5juc.dOK12sg6IES', 1, 0.00, '2024-06-12 05:05:00', 0.00, 1, 1, 1, '2024-06-12 05:04:49', '2024-06-12 06:12:03'),
(39, '66693a4661a9f.png', 'justinleichhardt@example.com', '2654512', 'leichhardt', '$2y$10$g6eZsjqJPfr7ykkP7gxmCOmaSC.KREDXzk4icSHppaMQBCiERIXnu', 1, 0.00, '2024-06-12 05:16:43', 0.00, 1, 1, 1, '2024-06-12 05:16:16', '2024-06-12 06:03:50'),
(42, NULL, 'kubo@mailinator.com', '+1 (805) 302-1854', 'gusew', '$2y$10$9yeACtnUGmEvnUAp/ETlM.MDrvigbkQCljxQwtJLsfxnYm1CY/ftm', 1, 0.00, '2025-10-20 12:50:46', 0.00, 0, 0, 0, '2025-10-20 12:50:34', '2025-10-21 06:04:01'),
(43, '68f8d7b0dfe5c.jpg', 'faltusone@gmail.com', '01752303796', 'myenshohag', '$2y$10$3c9t3bLeyweI87MdvhF9ROcbPYuFUsZxfDN44P98J5opWj3UrDD.O', 1, 0.00, '2025-10-22 13:07:07', 0.00, 1, 1, 1, '2025-10-22 13:06:52', '2025-10-26 18:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_infos`
--

CREATE TABLE `vendor_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `language_id` bigint DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb3_unicode_ci,
  `details` longtext COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `vendor_infos`
--

INSERT INTO `vendor_infos` (`id`, `vendor_id`, `language_id`, `name`, `country`, `city`, `state`, `zip_code`, `address`, `details`, `created_at`, `updated_at`) VALUES
(56, 35, 20, 'Marcia R. Worth', 'USA', 'Homestead', 'Miami', NULL, 'Main Street Homestead, FL 33030', 'Born and raised in Northern Germany, Tinka\'s quest for white sand and sunshine led her to Southern Florida more than 21 years ago. Here she successfully led an international marketing and consulting firm before entering the real estate industry. Her in- depth knowledge of the local area, combined with her keen sense of marketing and sales make her the ideal agent to assist you with your real estate needs. Tinka is a highly successful, professional and reliable agent. She prides herself in excellent communication and negotiation skills. As an avid boater and water enthusiast, Tinka specializes in waterfront and coastal single-family homes, condos, townhouses and investment properties in Lighthouse Point, Boca Raton, Pompano Beach, Highland Beach, Delray Beach and Deerfield Beach. Tinka is an Ellie Platinum Award recipient (Top 3% company wide) and top 1.5% nationwide, real trends, Executive Director of Luxury Sales at the Boca Raton office', '2024-06-12 04:37:17', '2024-06-13 11:22:45'),
(57, 36, 20, 'Oscar Eade', 'USA', 'San Antonio', 'Texas', NULL, '123 Alamo Plaza San Antonio, TX 78205', 'Oscar Eade was born in Colombia and moved to the United States in 2001 at the age of 20, in pursuit of a better future. He initially took a job working at a cafeteria in a Miami hotel. Noticing construction taking off in 2002 he looked for a way into the real estate industry and found work with investors who were purchasing, remodeling, and selling single family homes in the Tampa Bay area.\r\n\r\nMiguel immediately fell in love with the business, and quickly learned from the investors who became mentors to him. They saw his potential and within a short time he was managing over 150 properties in Tampa Bay, Orlando, and Jacksonville, Florida while becoming a Residential Real Estate Appraiser until opening his own practice.\r\n\r\nSoon after became very interested in helping families achieve their home dreams and goals for what he became a Sales Associate and then a Top Producer Broker achieving the highest sales award over four consecutive years during his time at Weichert, Realtors - Best Beach. He is now ranked the #1 agent in sales for Century 21 KoRes and a member of Masters Emerald an elite group of high producing professionals for Century 21 in the country.\r\n\r\nMiguel’s top skills include Spanish/English fluent, quality negotiation skills MCNE (Master Certified Negotiation Expert) finding value in complex properties and hands on team ready to resolve and cater the most complex transaction or client’s need.\r\n\r\nIn his free time Miguel enjoys spending time with his family, traveling, little league, practicing CrossFit, soccer and triathlons.', '2024-06-12 04:59:43', '2024-06-13 11:52:28'),
(58, 37, 20, 'Holly Gledson', 'USA', 'San Antonio', 'Texas', NULL, '123 Alamo Plaza San Antonio, TX 78205', 'Holly Gledson was born in Colombia and moved to the United States in 2001 at the age of 20, in pursuit of a better future. He initially took a job working at a cafeteria in a Miami hotel. Noticing construction taking off in 2002 he looked for a way into the real estate industry and found work with investors who were purchasing, remodeling, and selling single family homes in the Tampa Bay area.\r\n\r\nMiguel immediately fell in love with the business, and quickly learned from the investors who became mentors to him. They saw his potential and within a short time he was managing over 150 properties in Tampa Bay, Orlando, and Jacksonville, Florida while becoming a Residential Real Estate Appraiser until opening his own practice.\r\n\r\nSoon after became very interested in helping families achieve their home dreams and goals for what he became a Sales Associate and then a Top Producer Broker achieving the highest sales award over four consecutive years during his time at Weichert, Realtors - Best Beach. He is now ranked the #1 agent in sales for Century 21 KoRes and a member of Masters Emerald an elite group of high producing professionals for Century 21 in the country.\r\n\r\nMiguel’s top skills include Spanish/English fluent, quality negotiation skills MCNE (Master Certified Negotiation Expert) finding value in complex properties and hands on team ready to resolve and cater the most complex transaction or client’s need.\r\n\r\nIn his free time Miguel enjoys spending time with his family, traveling, little league, practicing CrossFit, soccer and triathlons.', '2024-06-12 05:01:57', '2024-06-13 12:04:22'),
(59, 38, 20, 'Mackenzie Buntine', 'USA', 'San Antonio', 'Texas', NULL, '123 Alamo Plaza San Antonio, TX 78205', 'Mackenzie Buntine was born in Colombia and moved to the United States in 2001 at the age of 20, in pursuit of a better future. He initially took a job working at a cafeteria in a Miami hotel. Noticing construction taking off in 2002 he looked for a way into the real estate industry and found work with investors who were purchasing, remodeling, and selling single family homes in the Tampa Bay area.\r\n\r\nMiguel immediately fell in love with the business, and quickly learned from the investors who became mentors to him. They saw his potential and within a short time he was managing over 150 properties in Tampa Bay, Orlando, and Jacksonville, Florida while becoming a Residential Real Estate Appraiser until opening his own practice.\r\n\r\nSoon after became very interested in helping families achieve their home dreams and goals for what he became a Sales Associate and then a Top Producer Broker achieving the highest sales award over four consecutive years during his time at Weichert, Realtors - Best Beach. He is now ranked the #1 agent in sales for Century 21 KoRes and a member of Masters Emerald an elite group of high producing professionals for Century 21 in the country.\r\n\r\nMiguel’s top skills include Spanish/English fluent, quality negotiation skills MCNE (Master Certified Negotiation Expert) finding value in complex properties and hands on team ready to resolve and cater the most complex transaction or client’s need.\r\n\r\nIn his free time Miguel enjoys spending time with his family, traveling, little league, practicing CrossFit, soccer and triathlons.', '2024-06-12 05:04:49', '2024-06-13 12:06:13'),
(60, 39, 20, 'Justin Leichhardt', 'USA', 'San Antonio', 'Texas', NULL, '123 Alamo Plaza San Antonio, TX 78205', 'Justin Leichhardt  was born in Colombia and moved to the United States in 2001 at the age of 20, in pursuit of a better future. He initially took a job working at a cafeteria in a Miami hotel. Noticing construction taking off in 2002 he looked for a way into the real estate industry and found work with investors who were purchasing, remodeling, and selling single family homes in the Tampa Bay area.\r\n\r\nMiguel immediately fell in love with the business, and quickly learned from the investors who became mentors to him. They saw his potential and within a short time he was managing over 150 properties in Tampa Bay, Orlando, and Jacksonville, Florida while becoming a Residential Real Estate Appraiser until opening his own practice.\r\n\r\nSoon after became very interested in helping families achieve their home dreams and goals for what he became a Sales Associate and then a Top Producer Broker achieving the highest sales award over four consecutive years during his time at Weichert, Realtors - Best Beach. He is now ranked the #1 agent in sales for Century 21 KoRes and a member of Masters Emerald an elite group of high producing professionals for Century 21 in the country.\r\n\r\nMiguel’s top skills include Spanish/English fluent, quality negotiation skills MCNE (Master Certified Negotiation Expert) finding value in complex properties and hands on team ready to resolve and cater the most complex transaction or client’s need.\r\n\r\nIn his free time Miguel enjoys spending time with his family, traveling, little league, practicing CrossFit, soccer and triathlons.', '2024-06-12 05:16:16', '2024-06-13 12:13:54'),
(63, 39, 25, 'جوستين ليتشهارت', 'الولايات المتحدة الأمريكية', 'سان أنطونيو', 'تكساس', NULL, '123 ألامو بلازا سان أنطونيو، تكساس 78205', 'ولد أوسكار إيدي في كولومبيا وانتقل إلى الولايات المتحدة في عام 2001 عن عمر 20 عامًا، سعيًا وراء مستقبل أفضل. تولى في البداية وظيفة العمل في كافتيريا في أحد فنادق ميامي. لاحظ انطلاق أعمال البناء في عام 2002، فبحث عن طريقة للدخول في صناعة العقارات ووجد عملاً مع المستثمرين الذين كانوا يشترون ويعيدون تصميم وبيع منازل الأسرة الواحدة في منطقة خليج تامبا.\r\n\r\nوقع ميغيل على الفور في حب هذا العمل، وسرعان ما تعلم من المستثمرين الذين أصبحوا مرشدين له. لقد رأوا إمكاناته وفي غضون وقت قصير كان يدير أكثر من 150 عقارًا في خليج تامبا وأورلاندو وجاكسونفيل بولاية فلوريدا بينما أصبح مثمنًا للعقارات السكنية حتى افتتاح عيادته الخاصة.\r\n\r\nوبعد فترة وجيزة أصبح مهتمًا جدًا بمساعدة العائلات على تحقيق أحلامهم وأهدافهم المنزلية حيث أصبح مساعد مبيعات ثم وسيطًا من أفضل المنتجين محققًا أعلى جائزة مبيعات على مدار أربع سنوات متتالية خلال فترة وجوده.\r\n\r\nتشمل مهارات ميغيل العليا التحدث باللغة الإسبانية/الإنجليزية بطلاقة، ومهارات تفاوض عالية الجودة، وخبير تفاوض معتمد رئيسي يجد القيمة في العقارات المعقدة وفريق عمل جاهز لحل وتلبية المعاملات الأكثر تعقيدًا أو احتياجات العميل.\r\n\r\nفي أوقات فراغه، يستمتع ميغيل بقضاء الوقت مع عائلته، والسفر، وممارسة الدوري الصغير، وممارسة رياضة الكروس فيت، وكرة القدم، والسباقات الثلاثية.', '2024-06-12 06:03:26', '2024-06-13 12:13:54'),
(64, 38, 25, 'ماكنزي بونتين', 'الولايات المتحدة الأمريكية', 'تكساس', 'تكساس', NULL, NULL, 'ولد أوسكار إيدي في كولومبيا وانتقل إلى الولايات المتحدة في عام 2001 عن عمر 20 عامًا، سعيًا وراء مستقبل أفضل. تولى في البداية وظيفة العمل في كافتيريا في أحد فنادق ميامي. لاحظ انطلاق أعمال البناء في عام 2002، فبحث عن طريقة للدخول في صناعة العقارات ووجد عملاً مع المستثمرين الذين كانوا يشترون ويعيدون تصميم وبيع منازل الأسرة الواحدة في منطقة خليج تامبا.\r\n\r\nوقع ميغيل على الفور في حب هذا العمل، وسرعان ما تعلم من المستثمرين الذين أصبحوا مرشدين له. لقد رأوا إمكاناته وفي غضون وقت قصير كان يدير أكثر من 150 عقارًا في خليج تامبا وأورلاندو وجاكسونفيل بولاية فلوريدا بينما أصبح مثمنًا للعقارات السكنية حتى افتتاح عيادته الخاصة.\r\n\r\nوبعد فترة وجيزة أصبح مهتمًا جدًا بمساعدة العائلات على تحقيق أحلامهم وأهدافهم المنزلية حيث أصبح مساعد مبيعات ثم وسيطًا من أفضل المنتجين محققًا أعلى جائزة مبيعات على مدار أربع سنوات متتالية خلال فترة وجوده.\r\n\r\nتشمل مهارات ميغيل العليا التحدث باللغة الإسبانية/الإنجليزية بطلاقة، ومهارات تفاوض عالية الجودة، وخبير تفاوض معتمد رئيسي يجد القيمة في العقارات المعقدة وفريق عمل جاهز لحل وتلبية المعاملات الأكثر تعقيدًا أو احتياجات العميل.\r\n\r\nفي أوقات فراغه، يستمتع ميغيل بقضاء الوقت مع عائلته، والسفر، وممارسة الدوري الصغير، وممارسة رياضة الكروس فيت، وكرة القدم، والسباقات الثلاثية.', '2024-06-12 06:05:22', '2024-06-13 12:06:13'),
(65, 37, 25, 'هولي جليدسون', 'الولايات المتحدة الأمريكية', 'تكساس', 'تكساس', NULL, NULL, 'ولد أوسكار إيدي في كولومبيا وانتقل إلى الولايات المتحدة في عام 2001 عن عمر 20 عامًا، سعيًا وراء مستقبل أفضل. تولى في البداية وظيفة العمل في كافتيريا في أحد فنادق ميامي. لاحظ انطلاق أعمال البناء في عام 2002، فبحث عن طريقة للدخول في صناعة العقارات ووجد عملاً مع المستثمرين الذين كانوا يشترون ويعيدون تصميم وبيع منازل الأسرة الواحدة في منطقة خليج تامبا.\r\n\r\nوقع ميغيل على الفور في حب هذا العمل، وسرعان ما تعلم من المستثمرين الذين أصبحوا مرشدين له. لقد رأوا إمكاناته وفي غضون وقت قصير كان يدير أكثر من 150 عقارًا في خليج تامبا وأورلاندو وجاكسونفيل بولاية فلوريدا بينما أصبح مثمنًا للعقارات السكنية حتى افتتاح عيادته الخاصة.\r\n\r\nوبعد فترة وجيزة أصبح مهتمًا جدًا بمساعدة العائلات على تحقيق أحلامهم وأهدافهم المنزلية حيث أصبح مساعد مبيعات ثم وسيطًا من أفضل المنتجين محققًا أعلى جائزة مبيعات على مدار أربع سنوات متتالية خلال فترة وجوده.\r\n\r\nتشمل مهارات ميغيل العليا التحدث باللغة الإسبانية/الإنجليزية بطلاقة، ومهارات تفاوض عالية الجودة، وخبير تفاوض معتمد رئيسي يجد القيمة في العقارات المعقدة وفريق عمل جاهز لحل وتلبية المعاملات الأكثر تعقيدًا أو احتياجات العميل.\r\n\r\nفي أوقات فراغه، يستمتع ميغيل بقضاء الوقت مع عائلته، والسفر، وممارسة الدوري الصغير، وممارسة رياضة الكروس فيت، وكرة القدم، والسباقات الثلاثية.', '2024-06-12 06:07:03', '2024-06-13 12:04:22'),
(66, 36, 25, 'أوسكار إيدي', 'الولايات المتحدة الأمريكية', 'سان أنطونيو', 'تكساس', NULL, '123 ألامو بلازا سان أنطونيو، تكساس 78205', 'ولد أوسكار إيدي في كولومبيا وانتقل إلى الولايات المتحدة في عام 2001 عن عمر 20 عامًا، سعيًا وراء مستقبل أفضل. تولى في البداية وظيفة العمل في كافتيريا في أحد فنادق ميامي. لاحظ انطلاق أعمال البناء في عام 2002، فبحث عن طريقة للدخول في صناعة العقارات ووجد عملاً مع المستثمرين الذين كانوا يشترون ويعيدون تصميم وبيع منازل الأسرة الواحدة في منطقة خليج تامبا.\r\n\r\nوقع ميغيل على الفور في حب هذا العمل، وسرعان ما تعلم من المستثمرين الذين أصبحوا مرشدين له. لقد رأوا إمكاناته وفي غضون وقت قصير كان يدير أكثر من 150 عقارًا في خليج تامبا وأورلاندو وجاكسونفيل بولاية فلوريدا بينما أصبح مثمنًا للعقارات السكنية حتى افتتاح عيادته الخاصة.\r\n\r\nوبعد فترة وجيزة أصبح مهتمًا جدًا بمساعدة العائلات على تحقيق أحلامهم وأهدافهم المنزلية حيث أصبح مساعد مبيعات ثم وسيطًا من أفضل المنتجين محققًا أعلى جائزة مبيعات على مدار أربع سنوات متتالية خلال فترة وجوده.\r\n\r\nتشمل مهارات ميغيل العليا التحدث باللغة الإسبانية/الإنجليزية بطلاقة، ومهارات تفاوض عالية الجودة، وخبير تفاوض معتمد رئيسي يجد القيمة في العقارات المعقدة وفريق عمل جاهز لحل وتلبية المعاملات الأكثر تعقيدًا أو احتياجات العميل.\r\n\r\nفي أوقات فراغه، يستمتع ميغيل بقضاء الوقت مع عائلته، والسفر، وممارسة الدوري الصغير، وممارسة رياضة الكروس فيت، وكرة القدم، والسباقات الثلاثية.', '2024-06-12 06:09:36', '2024-06-13 11:52:28'),
(67, 35, 25, 'مارسيا ر. وورث', 'الولايات المتحدة الأمريكية', 'هومستيد', 'ميامي', NULL, 'مين ستريت هومستيد، فلوريدا 33030', 'ولدت تينكا ونشأت في شمال ألمانيا، وقادها سعيها وراء الرمال البيضاء وأشعة الشمس إلى جنوب فلوريدا منذ أكثر من 21 عامًا. هنا نجحت في قيادة شركة تسويق واستشارات دولية قبل دخولها مجال العقارات. إن معرفتها العميقة بالمنطقة المحلية، إلى جانب إحساسها الشديد بالتسويق والمبيعات، تجعلها الوكيل المثالي لمساعدتك في تلبية احتياجاتك العقارية. تعتبر Tinka وكيلًا ناجحًا للغاية ومحترفًا وموثوقًا. إنها تفتخر بمهارات الاتصال والتفاوض الممتازة. باعتبارها من عشاق ركوب القوارب والمياه، تتخصص تينكا في منازل الأسرة الواحدة على الواجهة البحرية والساحلية والشقق السكنية والمنازل المستقلة والعقارات الاستثمارية في لايت هاوس بوينت وبوكا راتون وشاطئ بومبانو وهايلاند بيتش وديلراي بيتش وديرفيلد بيتش. تينكا حائزة على جائزة Ellie Platinum (أفضل 3% على مستوى الشركة) وأفضل 1.5% على مستوى الدولة، اتجاهات حقيقية، المدير التنفيذي للمبيعات الفاخرة في مكتب بوكا راتون', '2024-06-12 06:11:01', '2024-06-13 11:22:45'),
(69, 42, 20, 'Mayeen', 'Illo vitae vel molli', 'Veritatis consequatu', 'Sunt exercitation u', '62130', 'Minus deleniti rerum', 'Sit sapiente tempor', '2025-10-20 12:50:34', '2025-10-21 06:04:01'),
(70, 42, 25, 'Mayeen', 'Voluptatem sed ipsam', 'Ut et dolor voluptat', 'Ut facilis vitae pos', '79048', 'Maxime sit qui imped', 'Eum cumque ex sed pe', '2025-10-21 06:04:01', '2025-10-21 06:04:01'),
(71, 43, 20, 'mayeen', 'Bangladesh', 'j8CPtCVnN3', '545', 'GNSHYY2HYP', '428lRzknAN', 'myenshohagmyenshohagmyenshohagmyenshohagmyenshohagmyenshohagmyenshohagmyenshohagmyenshohag', '2025-10-22 13:06:52', '2025-10-22 13:10:08'),
(72, 43, 25, 'Mayeen', 'Bangladesh', 'j8CPtCVnN3', '545', 'GNSHYY2HYP', '428lRzknAN', 'myenshohagmyenshohagmyenshohagmyenshohagmyenshohagmyenshohagmyenshohag', '2025-10-22 13:10:08', '2025-10-22 13:10:08');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_sections`
--

CREATE TABLE `vendor_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_sections`
--

INSERT INTO `vendor_sections` (`id`, `language_id`, `title`, `subtitle`, `btn_name`, `created_at`, `updated_at`) VALUES
(1, 20, 'Team Manager', 'Our Professional Vendors', 'All Vendors', '2023-12-11 23:38:02', '2024-01-27 03:10:58'),
(2, 25, 'مدير الفريق', 'البائعين المحترفين لدينا', 'جميع البائعين', '2024-06-14 07:33:22', '2024-06-14 07:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `why_choose_us`
--

CREATE TABLE `why_choose_us` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `why_choose_us`
--

INSERT INTO `why_choose_us` (`id`, `language_id`, `title`, `sub_title`, `description`, `created_at`, `updated_at`) VALUES
(1, 20, 'Why Choose Us', 'Our Great Services Waiting For You', '<p>Curabitur non nulla sit amet nisl tempus convallis quisac lectus. Nulla porttitor accumsan tincidunt. Curabitur arcu erat, accumsan id imperdiet et, porttitor at.</p>\n<p> </p>\n<p><img src=\"\\assets\\front\\demo-img/1.png\" alt=\"\" width=\"100\" height=\"100\">       <img src=\"\\assets\\front\\demo-img/2.png\" alt=\"\" width=\"100\" height=\"100\">       <img src=\"\\assets\\front\\demo-img/3.png\" alt=\"\" width=\"100\" height=\"100\"></p>\n<p>     House                Apartment              Hotel</p>\n<p><img src=\"\\assets\\front\\demo-img/4.png\" alt=\"\" width=\"100\" height=\"100\">       <img src=\"\\assets\\front\\demo-img/5.png\" alt=\"\" width=\"100\" height=\"100\">       <img src=\"\\assets\\front\\demo-img/6.png\" alt=\"\" width=\"100\" height=\"100\"></p>\n<div class=\"grid-item mb-30\">     Condo                     Villa                     Town</div>\n<div class=\"grid-item mb-30\">\n<div class=\"icon orange\"> </div>\n</div>', '2023-12-10 02:34:20', '2024-06-30 14:52:57'),
(2, 25, 'لماذا أخترتنا', 'خدماتنا الرائعة في انتظارك', '<p>علي الجانب الآخر نشجب ونستنكر هؤلاء الرجال المفتونون بنشوة اللحظة الهائمون في رغباتهم فلا يدركون ما يعقبها من الألم والأسي المحتم، واللوم كذلك يشمل هؤلاء الذين أخفقوا في واجباتهم نتيجة لضعف إرادتهم فيتساوي مع هؤلاء الذين يتجنبون وينأون عن تحمل الكدح والألم .</p>\n<p> </p>\n<p><img src=\"\\demo/assets\\front\\demo-img/1.png\" alt=\"\" width=\"100\" height=\"100\">       <img src=\"\\demo/assets\\front\\demo-img/2.png\" alt=\"\" width=\"100\" height=\"100\">       <img src=\"\\demo/assets\\front\\demo-img/3.png\" alt=\"\" width=\"100\" height=\"100\"></p>\n<p>        منزل                           شقة                   الفندق</p>\n<p><img src=\"\\demo/assets\\front\\demo-img/4.png\" alt=\"\" width=\"100\" height=\"100\">       <img src=\"\\demo/assets\\front\\demo-img/5.png\" alt=\"\" width=\"100\" height=\"100\">       <img src=\"\\demo/assets\\front\\demo-img/6.png\" alt=\"\" width=\"100\" height=\"100\"></p>\n<div class=\"grid-item mb-30\">           شقة                         فيلا                      بلدة</div>\n<div class=\"grid-item mb-30\">\n<div class=\"icon orange\"> </div>\n</div>', '2024-06-14 07:37:22', '2024-06-14 07:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `property_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `property_id`, `created_at`, `updated_at`) VALUES
(57, 36, 37, '2024-02-04 01:13:36', '2024-02-04 01:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `work_processes`
--

CREATE TABLE `work_processes` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `serial_number` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `work_processes`
--

INSERT INTO `work_processes` (`id`, `language_id`, `icon`, `serial_number`, `title`, `text`, `created_at`, `updated_at`) VALUES
(14, 20, 'fal fa-home', 1, 'Contract', 'Mauris rhoncus orci injaanairi imperdiet placerat. aroiko Vestibulum euismod nislko suscipit ligula akorks.', '2023-08-19 04:06:12', '2024-06-12 10:47:39'),
(15, 20, 'fal fa-map-marked-alt', 2, 'Location', 'Mauris rhoncus orci injaanairi imperdiet placerat. aroiko Vestibulum euismod nislko suscipit ligula akorks.', '2023-08-19 04:06:46', '2024-06-12 10:47:33'),
(16, 20, 'fal fa-chart-line', 3, 'Start Small', 'Mauris rhoncus orci injaanairi imperdiet placerat. aroiko Vestibulum euismod nislko suscipit ligula akorks.', '2023-08-19 04:07:22', '2024-06-12 10:47:26'),
(20, 20, 'fal fa-hands-helping', 4, 'Hire Agent', 'Mauris rhoncus orci injaanairi imperdiet placerat. aroiko Vestibulum euismod nislko suscipit ligula akorks.', '2023-12-10 06:20:18', '2024-06-12 10:47:20'),
(21, 25, 'fal fa-hands-helping', 1, 'وكيل تأجير', 'الرجال المفتونون بنشوة اللحظة الهائمون في رغباتهم فلا يدركون ما يعقبها من الألم والأسي المحتم، واللوم كذلك يشمل هؤلاء الذين أخفقوا في واجباتهم', '2024-06-14 08:05:35', '2024-06-14 08:05:35'),
(22, 25, 'fal fa-chart-line', 2, 'تبدأ صغيرة', 'الرجال المفتونون بنشوة اللحظة الهائمون في رغباتهم فلا يدركون ما يعقبها من الألم والأسي المحتم، واللوم كذلك يشمل هؤلاء الذين أخفقوا في واجباتهم', '2024-06-14 08:06:04', '2024-06-14 08:06:04'),
(23, 25, 'fal fa-map-marked-alt', 3, 'موقع', 'الرجال المفتونون بنشوة اللحظة الهائمون في رغباتهم فلا يدركون ما يعقبها من الألم والأسي المحتم، واللوم كذلك يشمل هؤلاء الذين أخفقوا في واجباتهم', '2024-06-14 08:06:27', '2024-06-14 08:06:27'),
(24, 25, 'fal fa-home', 4, 'عقد', 'الرجال المفتونون بنشوة اللحظة الهائمون في رغباتهم فلا يدركون ما يعقبها من الألم والأسي المحتم، واللوم كذلك يشمل هؤلاء الذين أخفقوا في واجباتهم', '2024-06-14 08:06:55', '2024-06-14 08:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `work_process_sections`
--

CREATE TABLE `work_process_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `work_process_sections`
--

INSERT INTO `work_process_sections` (`id`, `language_id`, `subtitle`, `title`, `created_at`, `updated_at`) VALUES
(3, 20, 'We Follow Some Great Steps For Project', 'Working Steps', '2023-08-19 04:05:15', '2023-12-11 05:02:36'),
(5, 25, 'نحن نتبع بعض الخطوات الرائعة للمشروع', 'خطوات العمل', '2024-03-27 00:21:02', '2024-03-27 00:21:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_sections`
--
ALTER TABLE `about_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_role_id_foreign` (`role_id`);

--
-- Indexes for table `admin_infos`
--
ALTER TABLE `admin_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_infos`
--
ALTER TABLE `agent_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenity_contents`
--
ALTER TABLE `amenity_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_settings`
--
ALTER TABLE `basic_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `blog_informations`
--
ALTER TABLE `blog_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_informations_language_id_foreign` (`language_id`),
  ADD KEY `blog_informations_blog_category_id_foreign` (`blog_category_id`),
  ADD KEY `blog_informations_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `blog_sections`
--
ALTER TABLE `blog_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_sections`
--
ALTER TABLE `brand_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_to_action_sections`
--
ALTER TABLE `call_to_action_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_sections`
--
ALTER TABLE `category_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_sections`
--
ALTER TABLE `city_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookie_alerts`
--
ALTER TABLE `cookie_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cookie_alerts_language_id_foreign` (`language_id`);

--
-- Indexes for table `counter_informations`
--
ALTER TABLE `counter_informations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counter_sections`
--
ALTER TABLE `counter_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_language_id_foreign` (`language_id`);

--
-- Indexes for table `featured_pricings`
--
ALTER TABLE `featured_pricings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_properties`
--
ALTER TABLE `featured_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_sections`
--
ALTER TABLE `feature_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_contents`
--
ALTER TABLE `footer_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footer_texts_language_id_foreign` (`language_id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_statics`
--
ALTER TABLE `hero_statics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_builders`
--
ALTER TABLE `menu_builders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_gateways`
--
ALTER TABLE `offline_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_gateways`
--
ALTER TABLE `online_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_contents`
--
ALTER TABLE `page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_contents_language_id_foreign` (`language_id`),
  ADD KEY `page_contents_page_id_foreign` (`page_id`);

--
-- Indexes for table `page_headings`
--
ALTER TABLE `page_headings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_headings_language_id_foreign` (`language_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_invoices`
--
ALTER TABLE `payment_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popups`
--
ALTER TABLE `popups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `popups_language_id_foreign` (`language_id`);

--
-- Indexes for table `pricing_sections`
--
ALTER TABLE `pricing_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_contents`
--
ALTER TABLE `project_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_floorplan_images`
--
ALTER TABLE `project_floorplan_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_gallery_images`
--
ALTER TABLE `project_gallery_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_sections`
--
ALTER TABLE `project_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_spacifications`
--
ALTER TABLE `project_spacifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_spacification_contents`
--
ALTER TABLE `project_spacification_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_types`
--
ALTER TABLE `project_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_type_contents`
--
ALTER TABLE `project_type_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_amenities`
--
ALTER TABLE `property_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_categories`
--
ALTER TABLE `property_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_category_contents`
--
ALTER TABLE `property_category_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_cities`
--
ALTER TABLE `property_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_city_contents`
--
ALTER TABLE `property_city_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_contacts`
--
ALTER TABLE `property_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_contents`
--
ALTER TABLE `property_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_countries`
--
ALTER TABLE `property_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_country_contents`
--
ALTER TABLE `property_country_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_sections`
--
ALTER TABLE `property_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_slider_images`
--
ALTER TABLE `property_slider_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_spacifications`
--
ALTER TABLE `property_spacifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_spacification_contents`
--
ALTER TABLE `property_spacification_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_states`
--
ALTER TABLE `property_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_state_contents`
--
ALTER TABLE `property_state_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `push_subscriptions_endpoint_unique` (`endpoint`),
  ADD KEY `push_subscriptions_subscribable_type_subscribable_id_index` (`subscribable_type`,`subscribable_id`);

--
-- Indexes for table `quick_links`
--
ALTER TABLE `quick_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quick_links_language_id_foreign` (`language_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seos_language_id_foreign` (`language_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_id_unique` (`email_id`);

--
-- Indexes for table `subscribe_sections`
--
ALTER TABLE `subscribe_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_statuses`
--
ALTER TABLE `support_ticket_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial_sections`
--
ALTER TABLE `testimonial_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`country_code`,`timezone`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_infos`
--
ALTER TABLE `vendor_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_sections`
--
ALTER TABLE `vendor_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_processes`
--
ALTER TABLE `work_processes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_process_sections`
--
ALTER TABLE `work_process_sections`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_sections`
--
ALTER TABLE `about_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin_infos`
--
ALTER TABLE `admin_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `agent_infos`
--
ALTER TABLE `agent_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `amenity_contents`
--
ALTER TABLE `amenity_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `basic_settings`
--
ALTER TABLE `basic_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `blog_informations`
--
ALTER TABLE `blog_informations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `blog_sections`
--
ALTER TABLE `blog_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `brand_sections`
--
ALTER TABLE `brand_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `call_to_action_sections`
--
ALTER TABLE `call_to_action_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_sections`
--
ALTER TABLE `category_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `city_sections`
--
ALTER TABLE `city_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `cookie_alerts`
--
ALTER TABLE `cookie_alerts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `counter_informations`
--
ALTER TABLE `counter_informations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `counter_sections`
--
ALTER TABLE `counter_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `featured_pricings`
--
ALTER TABLE `featured_pricings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `featured_properties`
--
ALTER TABLE `featured_properties`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `feature_sections`
--
ALTER TABLE `feature_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `footer_contents`
--
ALTER TABLE `footer_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `hero_statics`
--
ALTER TABLE `hero_statics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `menu_builders`
--
ALTER TABLE `menu_builders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `offline_gateways`
--
ALTER TABLE `offline_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `online_gateways`
--
ALTER TABLE `online_gateways`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `page_contents`
--
ALTER TABLE `page_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `page_headings`
--
ALTER TABLE `page_headings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `payment_invoices`
--
ALTER TABLE `payment_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `popups`
--
ALTER TABLE `popups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pricing_sections`
--
ALTER TABLE `pricing_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `project_contents`
--
ALTER TABLE `project_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `project_floorplan_images`
--
ALTER TABLE `project_floorplan_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `project_gallery_images`
--
ALTER TABLE `project_gallery_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `project_sections`
--
ALTER TABLE `project_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_spacifications`
--
ALTER TABLE `project_spacifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=384;

--
-- AUTO_INCREMENT for table `project_spacification_contents`
--
ALTER TABLE `project_spacification_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=615;

--
-- AUTO_INCREMENT for table `project_types`
--
ALTER TABLE `project_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `project_type_contents`
--
ALTER TABLE `project_type_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `property_amenities`
--
ALTER TABLE `property_amenities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=782;

--
-- AUTO_INCREMENT for table `property_categories`
--
ALTER TABLE `property_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `property_category_contents`
--
ALTER TABLE `property_category_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `property_cities`
--
ALTER TABLE `property_cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `property_city_contents`
--
ALTER TABLE `property_city_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `property_contacts`
--
ALTER TABLE `property_contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `property_contents`
--
ALTER TABLE `property_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `property_countries`
--
ALTER TABLE `property_countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `property_country_contents`
--
ALTER TABLE `property_country_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `property_sections`
--
ALTER TABLE `property_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `property_slider_images`
--
ALTER TABLE `property_slider_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT for table `property_spacifications`
--
ALTER TABLE `property_spacifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=639;

--
-- AUTO_INCREMENT for table `property_spacification_contents`
--
ALTER TABLE `property_spacification_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1238;

--
-- AUTO_INCREMENT for table `property_states`
--
ALTER TABLE `property_states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `property_state_contents`
--
ALTER TABLE `property_state_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `quick_links`
--
ALTER TABLE `quick_links`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `subscribe_sections`
--
ALTER TABLE `subscribe_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `support_ticket_statuses`
--
ALTER TABLE `support_ticket_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `testimonial_sections`
--
ALTER TABLE `testimonial_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `vendor_infos`
--
ALTER TABLE `vendor_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `vendor_sections`
--
ALTER TABLE `vendor_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `work_processes`
--
ALTER TABLE `work_processes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `work_process_sections`
--
ALTER TABLE `work_process_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_informations`
--
ALTER TABLE `blog_informations`
  ADD CONSTRAINT `blog_informations_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_informations_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_informations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cookie_alerts`
--
ALTER TABLE `cookie_alerts`
  ADD CONSTRAINT `cookie_alerts_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `footer_contents`
--
ALTER TABLE `footer_contents`
  ADD CONSTRAINT `footer_texts_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_contents`
--
ALTER TABLE `page_contents`
  ADD CONSTRAINT `page_contents_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `page_contents_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `popups`
--
ALTER TABLE `popups`
  ADD CONSTRAINT `popups_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quick_links`
--
ALTER TABLE `quick_links`
  ADD CONSTRAINT `quick_links_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seos`
--
ALTER TABLE `seos`
  ADD CONSTRAINT `seos_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
