-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 25 2020 г., 14:40
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
(1, 1, 'да', 1),
(2, 1, 'нет', 0),
(3, 1, 'да', 1),
(4, 1, 'нет', 0),
(5, 1, 'нет', 0),
(6, 2, 'да', 1),
(7, 2, 'нет', 0),
(8, 2, 'да', 1),
(9, 2, 'нет', 0),
(10, 2, 'нет', 0),
(11, 3, 'да', 1),
(12, 3, 'нет', 0),
(13, 3, 'да', 1),
(14, 3, 'нет', 0),
(15, 3, 'нет', 0),
(16, 4, 'да', 1),
(17, 4, 'нет', 0),
(18, 4, 'да', 1),
(19, 4, 'нет', 0),
(20, 4, 'нет', 0),
(21, 5, 'да', 1),
(22, 5, 'нет', 0),
(23, 5, 'да', 1),
(24, 5, 'нет', 0),
(25, 5, 'нет', 0),
(26, 6, 'да', 1),
(27, 6, 'нет', 0),
(28, 6, 'да', 1),
(29, 6, 'нет', 0),
(30, 6, 'нет', 0),
(31, 7, 'да', 1),
(32, 7, 'нет', 0),
(33, 7, 'да', 1),
(34, 7, 'нет', 0),
(35, 7, 'нет', 0),
(36, 8, 'да', 1),
(37, 8, 'нет', 0),
(38, 8, 'да', 1),
(39, 8, 'нет', 0),
(40, 8, 'нет', 0),
(41, 9, 'да', 1),
(42, 9, 'нет', 0),
(43, 9, 'да', 1),
(44, 9, 'нет', 0),
(45, 9, 'нет', 0),
(46, 10, 'да', 1),
(47, 10, 'нет', 0),
(48, 10, 'да', 1),
(49, 10, 'нет', 0),
(50, 10, 'fgxdfghdfh', 0),
(51, 11, 'да', 1),
(52, 11, 'нет', 0),
(53, 11, 'да', 1),
(54, 11, 'нет', 0),
(55, 11, 'нет', 0),
(56, 12, 'да', 1),
(57, 12, 'нет', 0),
(58, 12, 'да', 1),
(59, 12, 'нет', 0),
(60, 12, 'нет', 0),
(61, 13, 'да', 1),
(62, 13, 'нет', 0),
(63, 13, 'да', 1),
(64, 13, 'нет', 0),
(65, 13, 'нет', 0),
(66, 14, 'да', 1),
(67, 14, 'нет', 0),
(68, 14, 'да', 1),
(69, 14, 'нет', 0),
(70, 14, 'нет', 0),
(71, 15, 'Ответ 1', 1),
(72, 15, '2', 0),
(73, 15, '3', 0),
(74, 16, '1', 1),
(75, 16, '2', 0),
(76, 16, '3', 1),
(77, 17, '1', 0),
(78, 17, '2', 1),
(79, 17, '3', 0),
(80, 18, '1', 0),
(81, 18, '2', 0),
(82, 18, '3', 1),
(83, 19, '1', 1),
(84, 19, '2', 0),
(85, 19, '3', 1),
(86, 20, '1', 0),
(87, 20, '2', 1),
(88, 20, '3', 0);

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
(1, 'Квест тест', NULL, NULL, NULL),
(2, 'Квест для проверки всего', NULL, NULL, NULL);

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
(1, 1, 0, 'Вопрос', NULL, NULL, 1),
(2, 1, 1, 'Вопрос', NULL, NULL, 1),
(3, 1, 2, 'Вопрос', NULL, NULL, 1),
(4, 1, 3, 'Вопрос', NULL, NULL, 1),
(5, 1, 4, 'Вопрос', NULL, NULL, 1),
(6, 1, 5, 'Вопрос', NULL, NULL, 1),
(7, 1, 6, 'Вопрос', NULL, NULL, 1),
(8, 1, 7, 'Вопрос', NULL, NULL, 1),
(9, 1, 8, 'Вопрос', NULL, NULL, 1),
(10, 1, 9, 'Вопрос', NULL, NULL, 1),
(11, 1, 10, 'Вопрос', NULL, NULL, 1),
(12, 1, 11, 'Вопрос', NULL, NULL, 1),
(13, 1, 12, 'Вопрос', NULL, NULL, 1),
(14, 1, 13, 'Вопрос', NULL, NULL, 1),
(15, 2, 0, 'Вопрос под засыпку', NULL, NULL, 1),
(16, 2, 1, 'Вопрос №2', NULL, NULL, 1),
(17, 2, 2, 'Вопрос №3', NULL, NULL, 1),
(18, 2, 3, 'Вопрос №4', NULL, NULL, 1),
(19, 2, 4, 'Вопрос №5', NULL, NULL, 1),
(20, 2, 5, 'Вопрос №6', NULL, NULL, 1);

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
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Login` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Level` int(11) NOT NULL DEFAULT 1,
  `Wallet` int(11) NOT NULL DEFAULT 0,
  `Experience` int(11) NOT NULL DEFAULT 0,
  `Author` tinyint(4) NOT NULL DEFAULT -1,
  `Hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`Id`, `Name`, `Login`, `Password`, `Level`, `Wallet`, `Experience`, `Author`, `Hash`) VALUES
(1, 'Зеленский Данил Олегович', 'danil.zelenskiy.2005@gmail.com', 'skdjhfkjsjdf', 1, 0, 0, -1, '67593');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT для таблицы `quest`
--
ALTER TABLE `quest`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `question`
--
ALTER TABLE `question`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `quest_answer`
--
ALTER TABLE `quest_answer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `Quest_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
