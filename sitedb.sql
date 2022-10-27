-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 27 2022 г., 06:16
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `amount_of_goods_update` (IN `section_id` INT)   BEGIN
   DECLARE num1 INT;
   SET num1 = (SELECT COUNT(*) FROM goods INNER JOIN sections_list ON sections_list.product_id = goods.id WHERE (goods.main_section_id = section_id) OR (sections_list.section_id = section_id) ORDER BY goods.id);
   SELECT * FROM section WHERE section.id = section_id;
   UPDATE section SET section.goods_amount = num1 WHERE section.id = section_id;
   SELECT * FROM section WHERE section.id = section_id;
   SELECT num1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `amount_of_goods_updateTEST` (IN `s` INT)   BEGIN
   DECLARE num1 INT;
   SET num1 = (SELECT COUNT(*) FROM goods INNER JOIN sections_list ON sections_list.product_id = goods.id WHERE (goods.main_section_id = section_id) OR (sections_list.section_id = section_id) ORDER BY goods.id);
   UPDATE section SET section.goods_amount = num1 WHERE section.id = section_id;
   SELECT num1;
   SELECT * FROM sections_list WHERE sections_list.section_id = section_id ORDER BY sections_list.product_id;
   SELECT * FROM goods WHERE goods.main_section_id = section_id ORDER BY goods.id;
   SELECT goods.id, sections_list.product_id, sections_list.section_id, goods.main_section_id FROM goods RIGHT JOIN sections_list ON sections_list.product_id = goods.id WHERE (goods.main_section_id = section_id) OR (sections_list.section_id = section_id) ORDER BY sections_list.product_id, goods.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllSections` ()   BEGIN
	SELECT * FROM section;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_product_info` (IN `product_id` INT)   BEGIN
	SELECT * FROM goods WHERE goods.id = product_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `goodsForSection` (IN `page_num` INT, IN `section_id` INT)   BEGIN
	DECLARE num1 INT;
	SET num1 = page_num * 12;
	SELECT goods.id, goods.header, image.path, image.alt, goods.description FROM goods RIGHT JOIN sections_list ON sections_list.product_id = goods.id INNER JOIN image ON goods.picture_id = image.id WHERE (goods.main_section_id = section_id OR sections_list.section_id = section_id) AND goods.product_activity = true ORDER BY goods.id LIMIT num1, 12;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productAllImages` (IN `good_id` INT)   BEGIN
	SELECT dop_picture_list.id, dop_picture_list.product_id, image.path, image.alt FROM dop_picture_list LEFT JOIN image ON dop_picture_list.image_id = image.id WHERE dop_picture_list.product_id = good_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productAllSections` (IN `good_id` INT)   BEGIN
	SELECT sections_list.id, sections_list.product_id, section.name FROM sections_list LEFT JOIN section ON sections_list.section_id = section.id WHERE sections_list.product_id = good_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productMainImage` (IN `good_id` INT)   BEGIN
	SELECT goods.id, image.path, image.alt FROM goods LEFT JOIN image ON goods.picture_id = image.id WHERE goods.id = good_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productMainSection` (IN `good_id` INT)   BEGIN
	SELECT goods.id, section.name FROM goods LEFT JOIN section ON goods.main_section_id = section.id WHERE goods.id = good_id;
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
   SELECT * FROM goods WHERE goods.product_activity = true LIMIT num1, 12;
END$$

--
-- Функции
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getProductMainImage` (`product_id` INT) RETURNS VARCHAR(30) CHARSET utf8mb4 DETERMINISTIC BEGIN
	DECLARE result VARCHAR(30);
	SET result = (SELECT image.path FROM goods LEFT JOIN image ON goods.picture_id = image.id WHERE goods.id = product_id);
	RETURN (result); 
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
(4, 2, 4),
(5, 2, 5),
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
(1, 'Рубашка Medicine', 1, 3, 1, 2, 2499, 2699, 2227, 'Рубашка', 1),
(2, '[value-2]', 4, 4, 3, 5, 6, 7, 8, 'Рубашка', 1),
(3, '[value-2]', 6, 6, 3, 5, 6, 7, 8, '[value-10]', 0),
(4, 'Рубашка', 1, 1, 3, 5, 6, 7, 8, '[value-10]', 1),
(5, '[value-2]', 9, 2, 3, 5, 6, 7, 8, '[value-10]', 1),
(6, '[value-2]', 80, 4, 3, 5, 6, 7, 8, '[value-10]', 1),
(7, '[value-2]', 30, 6, 3, 5, 6, 7, 8, '[value-10]', 0),
(8, '[value-2]', 3, 3, 3, 5, 6, 7, 8, '[value-10]', 1),
(9, '[value-2]', 2, 6, 3, 5, 6, 7, 8, '[value-10]', 1),
(10, '[value-2]', 4, 9, 3, 5, 6, 7, 8, '[value-10]', 1),
(11, '[value-2]', 9, 6, 3, 5, 6, 7, 8, '[value-10]', 1),
(12, '[value-2]', 12, 12, 3, 5, 6, 7, 8, '[value-10]', 1),
(13, '[value-2]', 17, 23, 3, 5, 6, 7, 8, '[value-10]', 1),
(14, '[value-2]', 27, 45, 3, 5, 6, 7, 8, '[value-10]', 1),
(15, '[value-2]', 49, 46, 3, 5, 6, 7, 8, '[value-10]', 1),
(16, '[value-2]', 102, 12, 3, 5, 6, 7, 8, '[value-10]', 0),
(17, 'Рубашка', 2, 120, 3, 5, 6, 7, 8, '[value-10]', 1),
(18, '[value-2]', 23, 124, 5, 3, 6, 7, 8, '[value-10]', 1),
(19, '[value-2]', 2023, 3, 122, 5, 6, 7, 8, '[value-10]', 1),
(20, '[value-2]', 103, 212, 3, 5, 6, 7, 8, '[value-10]', 1),
(21, '[value-2]', 33, 78, 3, 5, 6, 7, 8, '[value-10]', 1),
(22, '[value-2]', 13, 90, 3, 5, 6, 7, 8, '[value-10]', 0),
(23, '[value-2]', 38, 23, 3, 5, 6, 7, 8, '[value-10]', 1),
(24, '[value-2]', 20, 14, 3, 5, 6, 7, 8, '[value-10]', 1),
(25, '[value-2]', 31, 36, 3, 5, 6, 7, 8, '[value-10]', 1),
(26, '[value-2]', 10, 768, 3, 5, 6, 7, 8, '[value-10]', 1),
(27, '[value-2]', 76, 90, 3, 5, 6, 7, 8, '[value-10]', 1),
(28, '[value-2]', 77, 39, 3, 5, 6, 7, 8, '[value-10]', 0),
(29, '[value-2]', 73, 51, 3, 5, 6, 7, 8, '[value-10]', 1),
(30, '[value-2]', 79, 31, 3, 5, 6, 7, 8, '[value-10]', 1),
(31, '[value-2]', 87, 73, 3, 5, 6, 7, 8, '[value-10]', 1),
(32, '[value-2]', 82, 94, 3, 5, 6, 7, 8, '[value-10]', 1),
(33, '[value-2]', 80, 27, 3, 5, 6, 7, 8, '[value-10]', 1),
(34, '[value-2]', 90, 41, 3, 5, 6, 7, 8, '[value-10]', 1),
(35, '[value-2]', 95, 84, 3, 5, 6, 7, 8, '[value-10]', 1),
(36, '[value-2]', 923, 941, 3, 5, 6, 7, 8, '[value-10]', 0),
(37, '[value-2]', 293, 412, 3, 5, 6, 7, 8, '[value-10]', 0),
(38, '[value-2]', 92, 321, 3, 5, 6, 7, 8, '[value-10]', 1),
(39, '[value-2]', 95, 72, 3, 5, 6, 7, 8, '[value-10]', 1),
(40, '[value-2]', 92, 99, 3, 5, 6, 7, 8, '[value-10]', 1),
(41, '[value-2]', 63, 241, 3, 5, 6, 7, 8, '[value-10]', 0),
(42, '[value-2]', 163, 36, 3, 5, 6, 7, 8, '[value-10]', 1);

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
(1, '../pictures/1.png', 'Рубашка'),
(2, '../pictures/2.png', 'Рубашка'),
(3, '../pictures/3.png', 'Рубашка'),
(4, '[value-2]', 'Рубашка'),
(5, '[value-2]', 'image_id=5'),
(6, '[value-2]', 'Рубашка'),
(7, '[value-2]', 'image_id=6'),
(8, '[value-2]', 'image_id=7'),
(9, '[value-2]', 'image_id=8'),
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
(1, 'Рубашки Medicine', 'Большой выбор рубашек из каталога Medicine', 7),
(2, 'Все модели Medicine', 'Большой выбор товаров из каталога Medicine', 4),
(3, 'Рубашки', 'Рубашка - тканевая одежда для верхней части тела (от шеи до талии)', 42),
(4, '[value-2]', '[value-3]', 2),
(5, '[value-2]', '[value-3]', 2),
(6, '[value-2]', '[value-3]', 3),
(7, '[value-2]', '[value-3]', 2),
(8, '[value-2]', '[value-3]', 2),
(9, '[value-2]', '[value-3]', 1),
(10, '[value-2]', '[value-3]', 2),
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
(46, '[value-2]', '[value-3]', 41);

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
(4, 2, 4),
(5, 2, 5),
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
