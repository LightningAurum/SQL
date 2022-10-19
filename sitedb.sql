-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 19 2022 г., 19:19
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `section_sort_max` ()   BEGIN  
   SELECT * FROM section ORDER BY section.goods_amount DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `section_with_empty` ()   BEGIN  
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

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `header` text DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `dop_picture_id` int(11) DEFAULT NULL,
  `sections_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `price_without_sale` float DEFAULT NULL,
  `price_with_promo` float DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `header`, `picture_id`, `dop_picture_id`, `sections_id`, `price`, `price_without_sale`, `price_with_promo`, `description`) VALUES
(1, '[value-2]', 3, 3, 5, 6, 7, 8, '[value-9]'),
(2, '[value-2]', 4, 4, 5, 6, 7, 8, '[value-9]'),
(3, '[value-2]', 6, 6, 5, 6, 7, 8, '[value-9]'),
(4, '[value-2]', 1, 1, 5, 6, 7, 8, '[value-9]'),
(5, '[value-2]', 9, 2, 5, 6, 7, 8, '[value-9]'),
(6, '[value-2]', 80, 4, 5, 6, 7, 8, '[value-9]'),
(7, '[value-2]', 30, 6, 5, 6, 7, 8, '[value-9]'),
(8, '[value-2]', 3, 3, 5, 6, 7, 8, '[value-9]'),
(9, '[value-2]', 2, 6, 5, 6, 7, 8, '[value-9]'),
(10, '[value-2]', 4, 9, 5, 6, 7, 8, '[value-9]'),
(11, '[value-2]', 9, 6, 5, 6, 7, 8, '[value-9]'),
(12, '[value-2]', 12, 12, 5, 6, 7, 8, '[value-9]'),
(13, '[value-2]', 17, 23, 5, 6, 7, 8, '[value-9]'),
(14, '[value-2]', 27, 45, 5, 6, 7, 8, '[value-9]'),
(15, '[value-2]', 49, 46, 5, 6, 7, 8, '[value-9]'),
(16, '[value-2]', 102, 12, 5, 6, 7, 8, '[value-9]'),
(17, '[value-2]', 123, 120, 5, 6, 7, 8, '[value-9]'),
(18, '[value-2]', 23, 124, 5, 6, 7, 8, '[value-9]'),
(19, '[value-2]', 2023, 122, 5, 6, 7, 8, '[value-9]'),
(20, '[value-2]', 103, 212, 5, 6, 7, 8, '[value-9]'),
(21, '[value-2]', 33, 78, 5, 6, 7, 8, '[value-9]'),
(22, '[value-2]', 13, 90, 5, 6, 7, 8, '[value-9]'),
(23, '[value-2]', 38, 23, 5, 6, 7, 8, '[value-9]'),
(24, '[value-2]', 20, 14, 5, 6, 7, 8, '[value-9]'),
(25, '[value-2]', 31, 36, 5, 6, 7, 8, '[value-9]'),
(26, '[value-2]', 10, 768, 5, 6, 7, 8, '[value-9]'),
(27, '[value-2]', 76, 90, 5, 6, 7, 8, '[value-9]'),
(28, '[value-2]', 77, 39, 5, 6, 7, 8, '[value-9]'),
(29, '[value-2]', 73, 51, 5, 6, 7, 8, '[value-9]'),
(30, '[value-2]', 79, 31, 5, 6, 7, 8, '[value-9]'),
(31, '[value-2]', 87, 73, 5, 6, 7, 8, '[value-9]'),
(32, '[value-2]', 82, 94, 5, 6, 7, 8, '[value-9]'),
(33, '[value-2]', 80, 27, 5, 6, 7, 8, '[value-9]'),
(34, '[value-2]', 90, 41, 5, 6, 7, 8, '[value-9]'),
(35, '[value-2]', 95, 84, 5, 6, 7, 8, '[value-9]'),
(36, '[value-2]', 923, 941, 5, 6, 7, 8, '[value-9]'),
(37, '[value-2]', 293, 412, 5, 6, 7, 8, '[value-9]'),
(38, '[value-2]', 92, 321, 5, 6, 7, 8, '[value-9]'),
(39, '[value-2]', 95, 72, 5, 6, 7, 8, '[value-9]'),
(40, '[value-2]', 92, 99, 5, 6, 7, 8, '[value-9]'),
(41, '[value-2]', 63, 241, 5, 6, 7, 8, '[value-9]'),
(42, '[value-2]', 163, 36, 5, 6, 7, 8, '[value-9]');

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
