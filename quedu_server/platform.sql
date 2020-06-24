-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 24 2020 г., 14:44
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
  `Id` int(11) NOT NULL,
  `Question_id` int(11) NOT NULL,
  `Answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `True_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `answers`
--

INSERT INTO `answers` (`Id`, `Question_id`, `Answer`, `True_answer`) VALUES
(1, 1, 'ответ на вопрос 1 №1', 1),
(2, 1, 'ответ на вопрос 1 №2', 1),
(3, 1, 'ответ на вопрос 1 №3', 1),
(4, 1, 'ответ на вопрос 1 №4', 1),
(5, 1, 'ответ на вопрос 1 №5', 1),
(6, 2, 'ответ на вопрос 2 №1', 1),
(7, 2, 'ответ на вопрос 2 №2', 1),
(8, 3, 'ссссс', 1),
(9, 4, 'вапвап', 1),
(10, 5, 'ввввв', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `quest`
--

CREATE TABLE `quest` (
  `Id` int(11) NOT NULL,
  `Name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Author_id` int(11) DEFAULT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Entry_Level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `quest`
--

INSERT INTO `quest` (`Id`, `Name`, `Author_id`, `Description`, `Entry_Level`) VALUES
(1, 'Квест проверка', NULL, NULL, NULL),
(2, 'ясяячсся', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `question`
--

CREATE TABLE `question` (
  `Id` int(11) NOT NULL,
  `Quest_id` int(11) NOT NULL,
  `Number_id` int(11) NOT NULL,
  `Question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Time` int(11) DEFAULT NULL,
  `Attempts` int(11) DEFAULT NULL,
  `Reward` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `question`
--

INSERT INTO `question` (`Id`, `Quest_id`, `Number_id`, `Question`, `Time`, `Attempts`, `Reward`) VALUES
(1, 1, 0, 'Вопрос 1', NULL, NULL, 1),
(2, 1, 1, 'Вопрос 2', NULL, NULL, 1),
(3, 2, 0, 'ячсячсячсячс', NULL, NULL, 1),
(4, 2, 1, 'ячсячсячсячс', NULL, NULL, 1),
(5, 2, 2, 'фыффвыфвы', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `quest_answer`
--

CREATE TABLE `quest_answer` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Quest_id` int(11) NOT NULL,
  `Summary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Структура таблицы `user_answers`
--

CREATE TABLE `user_answers` (
  `Quest_id` int(11) NOT NULL,
  `Question_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Answer` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`Id`);

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
-- Индексы таблицы `quest_answer`
--
ALTER TABLE `quest_answer`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`Quest_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `quest`
--
ALTER TABLE `quest`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `question`
--
ALTER TABLE `question`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `quest_answer`
--
ALTER TABLE `quest_answer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `Quest_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
