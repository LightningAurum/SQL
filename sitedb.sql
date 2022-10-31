-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 31 2022 г., 17:03
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
(1, 'Рубашка Medicine', 1, 3, 1, 1, 2499, 2699, 2227, 'Рубашка Medicine выполнена из вискозной ткани с клетчатым узором.<br>\r\nДетали: прямой крой; отложной воротник; планка и манжеты на пуговицах; карман на груди.', 1),
(2, '[value-2]', 4, 4, 3, 5, 6, 7, 8, 'Рубашка', 1),
(3, '[value-2]', 6, 6, 3, 5, 6, 7, 8, '[value-10]', 0),
(4, 'Рубашка', 1, 1, 3, 5, 6, 7, 8, '[value-10]', 1),
(5, '[value-2]', 9, 2, 3, 5, 6, 7, 8, '[value-10]', 1),
(6, '[value-2]', 0, 4, 4, 5, 6, 7, 8, '[value-10]', 1),
(7, '[value-2]', 30, 6, 3, 5, 6, 7, 8, '[value-10]', 0),
(8, '[value-2]', 3, 3, 6, 5, 6, 7, 8, '[value-10]', 1),
(9, '[value-2]', 2, 6, 3, 5, 6, 7, 8, '[value-10]', 1),
(10, '[value-2]', 4, 9, 2, 5, 6, 7, 8, '[value-10]', 1),
(11, '[value-2]', 9, 6, 7, 5, 6, 7, 8, '[value-10]', 1),
(12, '[value-2]', 12, 12, 12, 5, 6, 7, 8, '[value-10]', 1),
(13, '[value-2]', 17, 23, 3, 5, 6, 7, 8, '[value-10]', 1),
(14, '[value-2]', 27, 45, 9, 5, 6, 7, 8, '[value-10]', 1),
(15, '[value-2]', 0, 46, 3, 7, 6, 7, 8, '[value-10]', 1),
(16, '[value-2]', 4, 12, 8, 5, 6, 7, 8, '[value-10]', 0),
(17, 'Рубашка', 2, 120, 3, 5, 6, 7, 8, '[value-10]', 1),
(18, '[value-2]', 2, 12, 5, 3, 6, 7, 8, '[value-10]', 1),
(19, '[value-2]', 2023, 3, 122, 5, 6, 7, 8, '[value-10]', 1),
(20, '[value-2]', 103, 212, 3, 5, 6, 7, 8, '[value-10]', 1),
(21, '[value-2]', 33, 78, 18, 7, 6, 7, 8, '[value-10]', 1),
(22, '[value-2]', 13, 90, 19, 5, 6, 7, 8, '[value-10]', 0),
(23, '[value-2]', 38, 23, 10, 5, 6, 7, 8, '[value-10]', 1),
(24, '[value-2]', 20, 14, 3, 5, 6, 7, 8, '[value-10]', 1),
(25, '[value-2]', 31, 36, 11, 5, 6, 7, 8, '[value-10]', 1),
(26, '[value-2]', 10, 768, 3, 5, 6, 7, 8, '[value-10]', 1),
(27, '[value-2]', 76, 90, 3, 5, 6, 7, 8, '[value-10]', 1),
(28, '[value-2]', 77, 39, 3, 5, 6, 7, 8, '[value-10]', 0),
(29, '[value-2]', 73, 51, 3, 5, 6, 7, 8, '[value-10]', 1),
(30, '[value-2]', 79, 31, 3, 5, 6, 7, 8, '[value-10]', 1),
(31, '[value-2]', 87, 73, 3, 5, 6, 7, 8, '[value-10]', 1),
(32, '[value-2]', 82, 94, 3, 5, 6, 7, 8, '[value-10]', 1),
(33, '[value-2]', 0, 27, 3, 7, 6, 7, 8, '[value-10]', 1),
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
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `section`
--

INSERT INTO `section` (`id`, `name`, `details`) VALUES
(1, 'Рубашки Medicine', 'Большой выбор рубашек из каталога Medicine'),
(2, 'Все модели Medicine', 'Большой выбор товаров из каталога Medicine'),
(3, 'Рубашки', 'Рубашка - тканевая одежда для верхней части тела (от шеи до талии)'),
(4, 'Джинсы', 'Джинсы'),
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
(4, 2, 2),
(5, 2, 3),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 3, 1),
(10, 3, 9),
(11, 4, 1),
(12, 4, 3),
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
(24, 7, 3),
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
