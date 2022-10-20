-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 20 2022 г., 06:58
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sitedb`
--
CREATE DATABASE IF NOT EXISTS `sitedb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sitedb`;

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_images` (IN `image_id` INT)   BEGIN
   SELECT * FROM dop_picture_list WHERE product_id = image_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_sections` (IN `section_id` INT)   BEGIN
   SELECT * FROM sections_list WHERE product_id = section_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `section_sort_max` ()   BEGIN  
   SELECT * FROM section ORDER BY section.goods_amount DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `section_without_empty` ()   BEGIN  
   SELECT * FROM section WHERE (section.goods_amount IS NOT NULL) OR (section.goods_amount > 0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_goods_on_one_page` (IN `page_num` INT)   BEGIN
   DECLARE num1 INT;
   SET num1 = page_num * 12;
   SELECT * FROM goods LIMIT num1, 12;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `dop_picture_list`
--

CREATE TABLE `dop_picture_list` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `dop_picture_list`
--

INSERT INTO `dop_picture_list` (`id`, `product_id`, `image_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 3, 1),
(10, 3, 9),
(11, 4, 1),
(12, 4, 2),
(13, 4, 10),
(14, 4, 11),
(15, 4, 12),
(16, 5, 13),
(17, 5, 14),
(18, 5, 15),
(19, 5, 16),
(20, 6, 6),
(21, 6, 7),
(22, 6, 17),
(23, 7, 1),
(24, 7, 18),
(25, 8, 10),
(26, 8, 11),
(27, 9, 17),
(28, 9, 18),
(29, 10, 18),
(30, 11, 19),
(31, 12, 19),
(32, 14, 6),
(33, 15, 20),
(34, 16, 8),
(35, 17, 1),
(36, 18, 2),
(37, 18, 3),
(38, 19, 21),
(39, 20, 20),
(40, 21, 22),
(41, 22, 23),
(42, 22, 24),
(43, 23, 25),
(44, 24, 26),
(45, 25, 23),
(46, 26, 27),
(47, 27, 28),
(48, 28, 29),
(49, 29, 30),
(50, 30, 3),
(51, 31, 31),
(52, 32, 32),
(53, 32, 33),
(54, 33, 34),
(55, 34, 34),
(56, 35, 35),
(57, 35, 36),
(58, 35, 37),
(59, 36, 23),
(60, 37, 38),
(61, 38, 4),
(62, 39, 2),
(63, 40, 39),
(64, 41, 40),
(65, 41, 41),
(66, 42, 42),
(67, 42, 43),
(68, 42, 44),
(69, 43, 36),
(70, 43, 37),
(71, 44, 38),
(72, 45, 40),
(73, 46, 40),
(75, 46, 19);

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `header` text DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `dop_picture_id` int(11) DEFAULT NULL,
  `main_section_id` int(11) DEFAULT NULL,
  `sections_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `price_without_sale` float DEFAULT NULL,
  `price_with_promo` float DEFAULT NULL,
  `description` text DEFAULT NULL,
  `product_activity` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `header`, `picture_id`, `dop_picture_id`, `main_section_id`, `sections_id`, `price`, `price_without_sale`, `price_with_promo`, `description`, `product_activity`) VALUES
(1, '[value-2]', 3, 3, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(2, '[value-2]', 4, 4, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(3, '[value-2]', 6, 6, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(4, '[value-2]', 1, 1, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(5, '[value-2]', 9, 2, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(6, '[value-2]', 80, 4, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(7, '[value-2]', 30, 6, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(8, '[value-2]', 3, 3, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(9, '[value-2]', 2, 6, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(10, '[value-2]', 4, 9, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(11, '[value-2]', 9, 6, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(12, '[value-2]', 12, 12, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(13, '[value-2]', 17, 23, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(14, '[value-2]', 27, 45, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(15, '[value-2]', 49, 46, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(16, '[value-2]', 102, 12, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(17, '[value-2]', 123, 120, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(18, '[value-2]', 23, 124, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(19, '[value-2]', 2023, 122, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(20, '[value-2]', 103, 212, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(21, '[value-2]', 33, 78, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(22, '[value-2]', 13, 90, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(23, '[value-2]', 38, 23, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(24, '[value-2]', 20, 14, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(25, '[value-2]', 31, 36, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(26, '[value-2]', 10, 768, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(27, '[value-2]', 76, 90, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(28, '[value-2]', 77, 39, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(29, '[value-2]', 73, 51, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(30, '[value-2]', 79, 31, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(31, '[value-2]', 87, 73, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(32, '[value-2]', 82, 94, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(33, '[value-2]', 80, 27, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(34, '[value-2]', 90, 41, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(35, '[value-2]', 95, 84, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(36, '[value-2]', 923, 941, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(37, '[value-2]', 293, 412, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(38, '[value-2]', 92, 321, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(39, '[value-2]', 95, 72, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(40, '[value-2]', 92, 99, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(41, '[value-2]', 63, 241, NULL, 5, 6, 7, 8, '[value-9]', NULL),
(42, '[value-2]', 163, 36, NULL, 5, 6, 7, 8, '[value-9]', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `path` text DEFAULT NULL,
  `alt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `path`, `alt`) VALUES
(1, '[value-2]', '[value-3]'),
(2, '[value-2]', '[value-3]'),
(3, '[value-2]', '[value-3]'),
(4, '[value-2]', '[value-3]'),
(5, '[value-2]', '[value-3]'),
(6, '[value-2]', '[value-3]'),
(7, '[value-2]', '[value-3]'),
(8, '[value-2]', '[value-3]'),
(9, '[value-2]', '[value-3]'),
(10, '[value-2]', '[value-3]'),
(11, '[value-2]', '[value-3]'),
(12, '[value-2]', '[value-3]'),
(13, '[value-2]', '[value-3]'),
(14, '[value-2]', '[value-3]'),
(15, '[value-2]', '[value-3]'),
(16, '[value-2]', '[value-3]'),
(17, '[value-2]', '[value-3]'),
(18, '[value-2]', '[value-3]'),
(19, '[value-2]', '[value-3]'),
(20, '[value-2]', '[value-3]'),
(21, '[value-2]', '[value-3]'),
(22, '[value-2]', '[value-3]'),
(23, '[value-2]', '[value-3]'),
(24, '[value-2]', '[value-3]'),
(25, '[value-2]', '[value-3]'),
(26, '[value-2]', '[value-3]'),
(27, '[value-2]', '[value-3]'),
(28, '[value-2]', '[value-3]'),
(29, '[value-2]', '[value-3]'),
(30, '[value-2]', '[value-3]'),
(31, '[value-2]', '[value-3]'),
(32, '[value-2]', '[value-3]'),
(33, '[value-2]', '[value-3]'),
(34, '[value-2]', '[value-3]'),
(35, '[value-2]', '[value-3]'),
(36, '[value-2]', '[value-3]'),
(37, '[value-2]', '[value-3]'),
(38, '[value-2]', '[value-3]'),
(39, '[value-2]', '[value-3]'),
(40, '[value-2]', '[value-3]'),
(41, '[value-2]', '[value-3]'),
(42, '[value-2]', '[value-3]'),
(43, '[value-2]', '[value-3]'),
(44, '[value-2]', '[value-3]'),
(45, '[value-2]', '[value-3]'),
(46, '[value-2]', '[value-3]');

-- --------------------------------------------------------

--
-- Структура таблицы `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `goods_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `section`
--

INSERT INTO `section` (`id`, `name`, `details`, `goods_amount`) VALUES
(1, '[value-2]', '[value-3]', 4),
(2, '[value-2]', '[value-3]', 2),
(3, '[value-2]', '[value-3]', 3),
(4, '[value-2]', '[value-3]', 12),
(5, '[value-2]', '[value-3]', 16),
(6, '[value-2]', '[value-3]', 8),
(7, '[value-2]', '[value-3]', 20),
(8, '[value-2]', '[value-3]', 14),
(9, '[value-2]', '[value-3]', 12),
(10, '[value-2]', '[value-3]', 15),
(11, '[value-2]', '[value-3]', 23),
(12, '[value-2]', '[value-3]', 4),
(13, '[value-2]', '[value-3]', 6),
(14, '[value-2]', '[value-3]', 32),
(15, '[value-2]', '[value-3]', 12),
(16, '[value-2]', '[value-3]', 40),
(17, '[value-2]', '[value-3]', 37),
(18, '[value-2]', '[value-3]', 26),
(19, '[value-2]', '[value-3]', 15),
(20, '[value-2]', '[value-3]', 28),
(21, '[value-2]', '[value-3]', 42),
(22, '[value-2]', '[value-3]', 13),
(23, '[value-2]', '[value-3]', 9),
(24, '[value-2]', '[value-3]', 7),
(25, '[value-2]', '[value-3]', 24),
(26, '[value-2]', '[value-3]', 12),
(27, '[value-2]', '[value-3]', 10),
(28, '[value-2]', '[value-3]', 29),
(29, '[value-2]', '[value-3]', 16),
(30, '[value-2]', '[value-3]', 7),
(31, '[value-2]', '[value-3]', 2),
(32, '[value-2]', '[value-3]', 17),
(33, '[value-2]', '[value-3]', 23),
(34, '[value-2]', '[value-3]', 31),
(35, '[value-2]', '[value-3]', 62),
(36, '[value-2]', '[value-3]', 24),
(37, '[value-2]', '[value-3]', 38),
(38, '[value-2]', '[value-3]', 51),
(39, '[value-2]', '[value-3]', 58),
(40, '[value-2]', '[value-3]', 53),
(41, '[value-2]', '[value-3]', 23),
(42, '[value-2]', '[value-3]', 20),
(43, '[value-2]', '[value-3]', 31),
(44, '[value-2]', '[value-3]', 36),
(45, '[value-2]', '[value-3]', 22),
(46, '[value-2]', '[value-3]', 41),
(47, '', '', 0),
(48, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `sections_list`
--

CREATE TABLE `sections_list` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `sections_list`
--

INSERT INTO `sections_list` (`id`, `product_id`, `section_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 3, 1),
(10, 3, 9),
(11, 4, 1),
(12, 4, 2),
(13, 4, 10),
(14, 4, 11),
(15, 4, 12),
(16, 5, 13),
(17, 5, 14),
(18, 5, 15),
(19, 5, 16),
(20, 6, 6),
(21, 6, 7),
(22, 6, 17),
(23, 7, 1),
(24, 7, 18),
(25, 8, 10),
(26, 8, 11),
(27, 9, 17),
(28, 9, 18),
(29, 10, 18),
(30, 11, 19),
(31, 12, 19),
(32, 14, 6),
(33, 15, 20),
(34, 16, 8),
(35, 17, 1),
(36, 18, 2),
(37, 18, 3),
(38, 19, 21),
(39, 20, 20),
(40, 21, 22),
(41, 22, 23),
(42, 22, 24),
(43, 23, 25),
(44, 24, 26),
(45, 25, 23),
(46, 26, 27),
(47, 27, 28),
(48, 28, 29),
(49, 29, 30),
(50, 30, 3),
(51, 31, 31),
(52, 32, 32),
(53, 32, 33),
(54, 33, 34),
(55, 34, 34),
(56, 35, 35),
(57, 35, 36),
(58, 35, 37),
(59, 36, 23),
(60, 37, 38),
(61, 38, 4),
(62, 39, 2),
(63, 40, 39),
(64, 41, 40),
(65, 41, 41),
(66, 42, 42),
(67, 42, 43),
(68, 42, 44),
(69, 43, 36),
(70, 43, 37),
(71, 44, 38),
(72, 45, 40),
(73, 46, 40),
(75, 46, 19);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `dop_picture_list`
--
ALTER TABLE `dop_picture_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sections_list`
--
ALTER TABLE `sections_list`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
