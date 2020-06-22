-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 22 2020 г., 10:50
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `platform`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `Quest_id` int(11) NOT NULL,
  `Question_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Answer` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `quest`
--

CREATE TABLE `quest` (
  `Id` int(11) NOT NULL,
  `Name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Author_id` int(11) DEFAULT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reward` int(11) DEFAULT NULL,
  `Entry_Level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `quest`
--

INSERT INTO `quest` (`Id`, `Name`, `Author_id`, `Description`, `Reward`, `Entry_Level`) VALUES
(1, 'sdfgsdfg', NULL, NULL, NULL, NULL),
(2, 'Квест о математике', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `question`
--

CREATE TABLE `question` (
  `Id` int(11) NOT NULL,
  `Quest_id` int(11) NOT NULL,
  `Number_id` int(11) NOT NULL,
  `Question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Time` int(11) DEFAULT NULL,
  `Attempts` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `question`
--

INSERT INTO `question` (`Id`, `Quest_id`, `Number_id`, `Question`, `Answer`, `Time`, `Attempts`) VALUES
(1, 1, 0, 'Вопрос', 'Ответ №1', NULL, NULL),
(2, 2, 0, '2+2?', '4', NULL, NULL),
(3, 2, 1, '3+3?', '6', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Login` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Level` int(11) NOT NULL,
  `Wallet` int(11) NOT NULL,
  `Experience` int(11) NOT NULL,
  `Author` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`Quest_id`);

--
-- Индексы таблицы `quest`
--
ALTER TABLE `quest`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `Quest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `quest`
--
ALTER TABLE `quest`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `question`
--
ALTER TABLE `question`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
