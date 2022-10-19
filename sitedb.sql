-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 19 2022 г., 09:44
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
DROP PROCEDURE IF EXISTS `section_sort_max`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `section_sort_max` ()   BEGIN  
   SELECT * FROM sections ORDER BY sections.goods_amount DESC;
END$$

DROP PROCEDURE IF EXISTS `section_with_empty`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `section_with_empty` ()   BEGIN  
   SELECT * FROM sections WHERE (sections.goods_amount IS NOT NULL) OR (sections.goods_amount > 0);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `header` text DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `dop_picture_id` int(11) DEFAULT NULL,
  `sections_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `price_without_sale` int(11) DEFAULT NULL,
  `price_with_promo` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `goods_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

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
-- Индексы таблицы `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
