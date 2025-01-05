-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2025 at 04:48 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collaboratask`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'Updated profile: Skills updated, Profile picture updated', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 38, '{\"changes\":[\"Skills updated\",\"Profile picture updated\"]}', NULL, '2024-11-04 13:13:22', '2024-11-04 13:13:22'),
(2, 'default', 'Updated profile: Name changed from Jerahmeel Tatcho to Jerahmeel, Bio updated, About Me section updated, Education updated', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 38, '{\"changes\":[\"Name changed from Jerahmeel Tatcho to Jerahmeel\",\"Bio updated\",\"About Me section updated\",\"Education updated\"]}', NULL, '2024-11-04 13:19:09', '2024-11-04 13:19:09'),
(3, 'default', 'Updated profile: About Me section updated', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 38, '{\"changes\":[\"About Me section updated\"]}', NULL, '2024-11-04 13:37:43', '2024-11-04 13:37:43'),
(4, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 13:37:52', '2024-11-04 13:37:52'),
(5, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 13:39:18', '2024-11-04 13:39:18'),
(6, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 13:49:33', '2024-11-04 13:49:33'),
(7, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 13:50:14', '2024-11-04 13:50:14'),
(8, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 13:50:52', '2024-11-04 13:50:52'),
(9, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 13:51:20', '2024-11-04 13:51:20'),
(10, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 13:52:52', '2024-11-04 13:52:52'),
(11, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 13:52:58', '2024-11-04 13:52:58'),
(12, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 13:54:19', '2024-11-04 13:54:19'),
(13, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 13:55:11', '2024-11-04 13:55:11'),
(14, 'default', 'Created a task: Create wireframe', 'App\\Models\\Task', NULL, 1, 'App\\Models\\User', 37, '{\"name\":\"Create wireframe\"}', NULL, '2024-11-04 13:55:44', '2024-11-04 13:55:44'),
(15, 'default', 'Updated task: Create wireframe with changes: Due date changed from \'2024-11-05 00:00:00\' to \'2024-11-05 00:00:00\'', 'App\\Models\\Task', NULL, 1, 'App\\Models\\User', 37, '{\"changes\":[\"Due date changed from \'2024-11-05 00:00:00\' to \'2024-11-05 00:00:00\'\"]}', NULL, '2024-11-04 13:56:04', '2024-11-04 13:56:04'),
(16, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 13:57:27', '2024-11-04 13:57:27'),
(17, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 13:57:35', '2024-11-04 13:57:35'),
(18, 'default', 'Created a team: New Order of the stones', 'App\\Models\\Team', NULL, 1, 'App\\Models\\User', 37, '{\"name\":\"New Order of the stones\"}', NULL, '2024-11-04 14:00:04', '2024-11-04 14:00:04'),
(19, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 14:01:07', '2024-11-04 14:01:07'),
(20, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 14:01:14', '2024-11-04 14:01:14'),
(21, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 14:01:38', '2024-11-04 14:01:38'),
(22, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 14:01:44', '2024-11-04 14:01:44'),
(23, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 14:02:26', '2024-11-04 14:02:26'),
(24, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-04 14:09:56', '2024-11-04 14:09:56'),
(25, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 14:12:06', '2024-11-04 14:12:06'),
(26, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 14:13:26', '2024-11-04 14:13:26'),
(27, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-04 14:58:24', '2024-11-04 14:58:24'),
(28, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 15:02:55', '2024-11-04 15:02:55'),
(29, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 15:09:51', '2024-11-04 15:09:51'),
(30, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-04 15:23:33', '2024-11-04 15:23:33'),
(31, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 15:23:37', '2024-11-04 15:23:37'),
(32, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 15:36:56', '2024-11-04 15:36:56'),
(33, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-04 16:14:56', '2024-11-04 16:14:56'),
(34, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 16:15:00', '2024-11-04 16:15:00'),
(35, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 16:21:03', '2024-11-04 16:21:03'),
(36, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 40, '[]', NULL, '2024-11-04 16:21:23', '2024-11-04 16:21:23'),
(37, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 16:21:26', '2024-11-04 16:21:26'),
(38, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 16:21:29', '2024-11-04 16:21:29'),
(39, 'default', 'Created a reward: First come first serve for team New Order of the stones', 'App\\Models\\Reward', NULL, 1, 'App\\Models\\User', 37, '{\"name\":\"First come first serve\",\"points_required\":\"50\"}', NULL, '2024-11-04 16:26:47', '2024-11-04 16:26:47'),
(40, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-04 16:27:03', '2024-11-04 16:27:03'),
(41, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 16:27:11', '2024-11-04 16:27:11'),
(42, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 17:05:35', '2024-11-04 17:05:35'),
(43, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 17:06:07', '2024-11-04 17:06:07'),
(44, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 17:08:07', '2024-11-04 17:08:07'),
(45, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 17:08:12', '2024-11-04 17:08:12'),
(46, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 17:17:39', '2024-11-04 17:17:39'),
(47, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 17:17:45', '2024-11-04 17:17:45'),
(48, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 17:18:39', '2024-11-04 17:18:39'),
(49, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-04 17:24:46', '2024-11-04 17:24:46'),
(50, 'default', 'Created a task: Distribute the survey', 'App\\Models\\Task', NULL, 4, 'App\\Models\\User', 39, '{\"name\":\"Distribute the survey\"}', NULL, '2024-11-04 17:27:44', '2024-11-04 17:27:44'),
(51, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 17:38:22', '2024-11-04 17:38:22'),
(52, 'default', 'Updated task: Distribute the survey with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 4, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-04 17:45:50', '2024-11-04 17:45:50'),
(53, 'default', 'Created a task: Do chapter 4', 'App\\Models\\Task', NULL, 5, 'App\\Models\\User', 39, '{\"name\":\"Do chapter 4\"}', NULL, '2024-11-04 17:51:44', '2024-11-04 17:51:44'),
(54, 'default', 'Updated task: Do chapter 4 with changes: Due date changed from \'2024-11-05 00:00:00\' to \'2024-11-05 00:00:00\'', 'App\\Models\\Task', NULL, 5, 'App\\Models\\User', 39, '{\"changes\":[\"Due date changed from \'2024-11-05 00:00:00\' to \'2024-11-05 00:00:00\'\"]}', NULL, '2024-11-04 17:52:03', '2024-11-04 17:52:03'),
(55, 'default', 'Updated task: Distribute the survey with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 4, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-04 17:52:14', '2024-11-04 17:52:14'),
(56, 'default', 'Updated task: Do chapter 4 with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 5, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-04 17:52:36', '2024-11-04 17:52:36'),
(57, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 17:58:29', '2024-11-04 17:58:29'),
(58, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-04 18:51:12', '2024-11-04 18:51:12'),
(59, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 18:51:17', '2024-11-04 18:51:17'),
(60, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 18:54:37', '2024-11-04 18:54:37'),
(61, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-04 19:09:43', '2024-11-04 19:09:43'),
(62, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 19:09:47', '2024-11-04 19:09:47'),
(63, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 19:25:46', '2024-11-04 19:25:46'),
(64, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 19:29:11', '2024-11-04 19:29:11'),
(65, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 19:30:41', '2024-11-04 19:30:41'),
(66, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 19:30:48', '2024-11-04 19:30:48'),
(67, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 19:30:58', '2024-11-04 19:30:58'),
(68, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 19:40:21', '2024-11-04 19:40:21'),
(69, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 19:41:29', '2024-11-04 19:41:29'),
(70, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 19:41:36', '2024-11-04 19:41:36'),
(71, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 19:46:32', '2024-11-04 19:46:32'),
(72, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 19:46:41', '2024-11-04 19:46:41'),
(73, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 19:52:59', '2024-11-04 19:52:59'),
(74, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 19:53:04', '2024-11-04 19:53:04'),
(75, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 19:57:08', '2024-11-04 19:57:08'),
(76, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 19:57:18', '2024-11-04 19:57:18'),
(77, 'default', 'Updated profile: Profile picture updated', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 38, '{\"changes\":[\"Profile picture updated\"]}', NULL, '2024-11-04 19:58:15', '2024-11-04 19:58:15'),
(78, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 19:58:55', '2024-11-04 19:58:55'),
(79, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 19:59:01', '2024-11-04 19:59:01'),
(80, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 20:42:55', '2024-11-04 20:42:55'),
(81, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 20:47:18', '2024-11-04 20:47:18'),
(82, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 20:48:04', '2024-11-04 20:48:04'),
(83, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-04 20:48:04', '2024-11-04 20:48:04'),
(84, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 20:48:11', '2024-11-04 20:48:11'),
(85, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 20:49:55', '2024-11-04 20:49:55'),
(86, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 42, '[]', NULL, '2024-11-04 21:22:34', '2024-11-04 21:22:34'),
(87, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 43, '[]', NULL, '2024-11-04 21:25:17', '2024-11-04 21:25:17'),
(88, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 43, '[]', NULL, '2024-11-04 21:25:22', '2024-11-04 21:25:22'),
(89, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 43, '[]', NULL, '2024-11-04 21:25:34', '2024-11-04 21:25:34'),
(90, 'default', 'Created a task: djsalkdjsa', 'App\\Models\\Task', NULL, 6, 'App\\Models\\User', 43, '{\"name\":\"djsalkdjsa\"}', NULL, '2024-11-04 21:26:57', '2024-11-04 21:26:57'),
(91, 'default', 'Task deleted: djsalkdjsa', 'App\\Models\\Task', NULL, 6, 'App\\Models\\User', 43, '{\"name\":\"djsalkdjsa\",\"description\":\"TO DO!!\"}', NULL, '2024-11-04 21:27:49', '2024-11-04 21:27:49'),
(92, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 21:42:03', '2024-11-04 21:42:03'),
(93, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 22:06:05', '2024-11-04 22:06:05'),
(94, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 22:18:24', '2024-11-04 22:18:24'),
(95, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 22:18:52', '2024-11-04 22:18:52'),
(96, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 22:35:47', '2024-11-04 22:35:47'),
(97, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 22:35:59', '2024-11-04 22:35:59'),
(98, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 22:42:15', '2024-11-04 22:42:15'),
(99, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 22:50:13', '2024-11-04 22:50:13'),
(100, 'default', 'Created a team: Avengers', 'App\\Models\\Team', NULL, 2, 'App\\Models\\User', 38, '{\"name\":\"Avengers\"}', NULL, '2024-11-04 22:53:01', '2024-11-04 22:53:01'),
(101, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 45, '[]', NULL, '2024-11-04 22:54:52', '2024-11-04 22:54:52'),
(102, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 22:57:14', '2024-11-04 22:57:14'),
(103, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 22:57:27', '2024-11-04 22:57:27'),
(104, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 44, '[]', NULL, '2024-11-04 22:58:42', '2024-11-04 22:58:42'),
(105, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:00:25', '2024-11-04 23:00:25'),
(106, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:00:47', '2024-11-04 23:00:47'),
(107, 'default', 'Updated profile: Name changed from Jerahmeel to Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 38, '{\"changes\":[\"Name changed from Jerahmeel to Vessel\"]}', NULL, '2024-11-04 23:01:01', '2024-11-04 23:01:01'),
(108, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:03:36', '2024-11-04 23:03:36'),
(109, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:03:46', '2024-11-04 23:03:46'),
(110, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:03:49', '2024-11-04 23:03:49'),
(111, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:03:56', '2024-11-04 23:03:56'),
(112, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:05:08', '2024-11-04 23:05:08'),
(113, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:05:55', '2024-11-04 23:05:55'),
(114, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 48, '[]', NULL, '2024-11-04 23:08:43', '2024-11-04 23:08:43'),
(115, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 44, '[]', NULL, '2024-11-04 23:08:50', '2024-11-04 23:08:50'),
(116, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 47, '[]', NULL, '2024-11-04 23:09:03', '2024-11-04 23:09:03'),
(117, 'default', 'Created a task: Paper Research', 'App\\Models\\Task', NULL, 7, 'App\\Models\\User', 38, '{\"name\":\"Paper Research\"}', NULL, '2024-11-04 23:09:16', '2024-11-04 23:09:16'),
(118, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 48, '[]', NULL, '2024-11-04 23:09:34', '2024-11-04 23:09:34'),
(119, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:09:49', '2024-11-04 23:09:49'),
(120, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:09:57', '2024-11-04 23:09:57'),
(121, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 48, '[]', NULL, '2024-11-04 23:10:08', '2024-11-04 23:10:08'),
(122, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:10:25', '2024-11-04 23:10:25'),
(123, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 49, '[]', NULL, '2024-11-04 23:10:33', '2024-11-04 23:10:33'),
(124, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 49, '[]', NULL, '2024-11-04 23:11:03', '2024-11-04 23:11:03'),
(125, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:11:33', '2024-11-04 23:11:33'),
(126, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 49, '[]', NULL, '2024-11-04 23:11:43', '2024-11-04 23:11:43'),
(127, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 49, '[]', NULL, '2024-11-04 23:12:19', '2024-11-04 23:12:19'),
(128, 'default', 'Created a task: ORAL COM REVIEWER', 'App\\Models\\Task', NULL, 8, 'App\\Models\\User', 44, '{\"name\":\"ORAL COM REVIEWER\"}', NULL, '2024-11-04 23:12:29', '2024-11-04 23:12:29'),
(129, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 45, '[]', NULL, '2024-11-04 23:13:48', '2024-11-04 23:13:48'),
(130, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-04 23:14:03', '2024-11-04 23:14:03'),
(131, 'default', 'Created a task: review biology', 'App\\Models\\Task', NULL, 9, 'App\\Models\\User', 49, '{\"name\":\"review biology\"}', NULL, '2024-11-04 23:15:55', '2024-11-04 23:15:55'),
(132, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:17:20', '2024-11-04 23:17:20'),
(133, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:17:26', '2024-11-04 23:17:26'),
(134, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:17:50', '2024-11-04 23:17:50'),
(135, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:17:58', '2024-11-04 23:17:58'),
(136, 'default', 'Updated task: ORAL COM REVIEWER with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 8, 'App\\Models\\User', 44, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-04 23:19:04', '2024-11-04 23:19:04'),
(137, 'default', 'Created a task: pr defense', 'App\\Models\\Task', NULL, 11, 'App\\Models\\User', 49, '{\"name\":\"pr defense\"}', NULL, '2024-11-04 23:19:50', '2024-11-04 23:19:50'),
(138, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:22:22', '2024-11-04 23:22:22'),
(139, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:25:11', '2024-11-04 23:25:11'),
(140, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:25:36', '2024-11-04 23:25:36'),
(141, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:25:43', '2024-11-04 23:25:43'),
(142, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:26:53', '2024-11-04 23:26:53'),
(143, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:34:17', '2024-11-04 23:34:17'),
(144, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-04 23:34:52', '2024-11-04 23:34:52'),
(145, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:35:00', '2024-11-04 23:35:00'),
(146, 'default', 'Updated team: Avengers with changes: Invitations sent to new members: DARYL MANGAYA, Members removed: Vessel', 'App\\Models\\Team', NULL, 2, 'App\\Models\\User', 38, '{\"changes\":[\"Invitations sent to new members: DARYL MANGAYA\",\"Members removed: Vessel\"]}', NULL, '2024-11-04 23:35:18', '2024-11-04 23:35:18'),
(147, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-04 23:35:27', '2024-11-04 23:35:27'),
(148, 'default', 'Created a task: System Maintenance', 'App\\Models\\Task', NULL, 12, 'App\\Models\\User', 51, '{\"name\":\"System Maintenance\"}', NULL, '2024-11-05 01:01:51', '2024-11-05 01:01:51'),
(149, 'default', 'Created a team: IT-47', 'App\\Models\\Team', NULL, 3, 'App\\Models\\User', 51, '{\"name\":\"IT-47\"}', NULL, '2024-11-05 01:16:11', '2024-11-05 01:16:11'),
(150, 'default', 'Updated task: System Maintenance with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 12, 'App\\Models\\User', 51, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-05 01:20:23', '2024-11-05 01:20:23'),
(151, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 06:03:10', '2024-11-05 06:03:10'),
(152, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 06:04:41', '2024-11-05 06:04:41'),
(153, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 06:04:48', '2024-11-05 06:04:48'),
(154, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 06:05:04', '2024-11-05 06:05:04'),
(155, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 08:30:15', '2024-11-05 08:30:15'),
(156, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 08:31:24', '2024-11-05 08:31:24'),
(157, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 08:31:33', '2024-11-05 08:31:33'),
(158, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 08:39:46', '2024-11-05 08:39:46'),
(159, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 08:40:21', '2024-11-05 08:40:21'),
(160, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 08:40:31', '2024-11-05 08:40:31'),
(161, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 08:42:04', '2024-11-05 08:42:04'),
(162, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 08:56:57', '2024-11-05 08:56:57'),
(163, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 08:57:21', '2024-11-05 08:57:21'),
(164, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 08:57:35', '2024-11-05 08:57:35'),
(165, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 08:58:20', '2024-11-05 08:58:20'),
(166, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 08:58:26', '2024-11-05 08:58:26'),
(167, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 09:15:09', '2024-11-05 09:15:09'),
(168, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 11:17:31', '2024-11-05 11:17:31'),
(169, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 11:17:45', '2024-11-05 11:17:45'),
(170, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 11:17:59', '2024-11-05 11:17:59'),
(171, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 11:18:25', '2024-11-05 11:18:25'),
(172, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 11:18:34', '2024-11-05 11:18:34'),
(173, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 11:19:00', '2024-11-05 11:19:00'),
(174, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 11:20:48', '2024-11-05 11:20:48'),
(175, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 11:25:38', '2024-11-05 11:25:38'),
(176, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 11:25:57', '2024-11-05 11:25:57'),
(177, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 11:28:34', '2024-11-05 11:28:34'),
(178, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 11:36:17', '2024-11-05 11:36:17'),
(179, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 11:37:10', '2024-11-05 11:37:10'),
(180, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 12:52:43', '2024-11-05 12:52:43'),
(181, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 12:53:31', '2024-11-05 12:53:31'),
(182, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 12:53:38', '2024-11-05 12:53:38'),
(183, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 12:53:46', '2024-11-05 12:53:46'),
(184, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 12:54:59', '2024-11-05 12:54:59'),
(185, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 13:40:51', '2024-11-05 13:40:51'),
(186, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 13:40:58', '2024-11-05 13:40:58'),
(187, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 15:17:33', '2024-11-05 15:17:33'),
(188, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 15:17:36', '2024-11-05 15:17:36'),
(189, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 15:17:39', '2024-11-05 15:17:39'),
(190, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 18:05:26', '2024-11-05 18:05:26'),
(191, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 18:05:29', '2024-11-05 18:05:29'),
(192, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 18:05:35', '2024-11-05 18:05:35'),
(193, 'default', 'Updated team: Avengers with changes: Invitations sent to new members: Derick Pangilinan, Members removed: Vessel', 'App\\Models\\Team', NULL, 2, 'App\\Models\\User', 38, '{\"changes\":[\"Invitations sent to new members: Derick Pangilinan\",\"Members removed: Vessel\"]}', NULL, '2024-11-05 18:05:56', '2024-11-05 18:05:56'),
(194, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-05 18:24:44', '2024-11-05 18:24:44'),
(195, 'default', 'Created a task: Make Ingrid happy', 'App\\Models\\Task', NULL, 13, 'App\\Models\\User', 37, '{\"name\":\"Make Ingrid happy\"}', NULL, '2024-11-05 19:31:28', '2024-11-05 19:31:28'),
(196, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-05 19:51:56', '2024-11-05 19:51:56'),
(197, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 53, '[]', NULL, '2024-11-05 19:54:34', '2024-11-05 19:54:34'),
(198, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 54, '[]', NULL, '2024-11-05 19:57:15', '2024-11-05 19:57:15'),
(199, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 55, '[]', NULL, '2024-11-05 20:04:19', '2024-11-05 20:04:19'),
(200, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 20:05:20', '2024-11-05 20:05:20'),
(201, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 20:06:58', '2024-11-05 20:06:58'),
(202, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 56, '[]', NULL, '2024-11-05 20:27:04', '2024-11-05 20:27:04'),
(203, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 58, '[]', NULL, '2024-11-05 22:57:31', '2024-11-05 22:57:31'),
(204, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-05 22:57:52', '2024-11-05 22:57:52'),
(205, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 23:19:33', '2024-11-05 23:19:33'),
(206, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 23:29:08', '2024-11-05 23:29:08'),
(207, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 23:29:13', '2024-11-05 23:29:13'),
(208, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-05 23:29:34', '2024-11-05 23:29:34'),
(209, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-06 00:01:44', '2024-11-06 00:01:44'),
(210, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-06 00:17:57', '2024-11-06 00:17:57'),
(211, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-06 00:24:30', '2024-11-06 00:24:30'),
(212, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-06 00:38:47', '2024-11-06 00:38:47'),
(213, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 00:40:33', '2024-11-06 00:40:33'),
(214, 'default', 'Task deleted: Make Ingrid happy', 'App\\Models\\Task', NULL, 13, 'App\\Models\\User', 2, '{\"name\":\"Make Ingrid happy\",\"description\":\"Make that princess happy as much as possible!\"}', NULL, '2024-11-06 00:44:50', '2024-11-06 00:44:50'),
(215, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 00:45:05', '2024-11-06 00:45:05'),
(216, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-06 00:52:26', '2024-11-06 00:52:26'),
(217, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 02:18:51', '2024-11-06 02:18:51'),
(218, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 02:19:48', '2024-11-06 02:19:48'),
(219, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 02:23:19', '2024-11-06 02:23:19'),
(220, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 02:24:05', '2024-11-06 02:24:05'),
(221, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 02:24:28', '2024-11-06 02:24:28'),
(222, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 02:25:23', '2024-11-06 02:25:23'),
(223, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 02:25:54', '2024-11-06 02:25:54'),
(224, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 61, '[]', NULL, '2024-11-06 02:35:12', '2024-11-06 02:35:12'),
(225, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 61, '[]', NULL, '2024-11-06 02:36:47', '2024-11-06 02:36:47'),
(226, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 61, '[]', NULL, '2024-11-06 02:36:56', '2024-11-06 02:36:56'),
(227, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 61, '[]', NULL, '2024-11-06 02:42:31', '2024-11-06 02:42:31'),
(228, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 02:50:25', '2024-11-06 02:50:25'),
(229, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 02:50:31', '2024-11-06 02:50:31'),
(230, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 03:02:56', '2024-11-06 03:02:56'),
(231, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 06:00:13', '2024-11-06 06:00:13'),
(232, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 07:16:39', '2024-11-06 07:16:39'),
(233, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 07:17:46', '2024-11-06 07:17:46'),
(234, 'default', 'Updated task: Distribute the survey with changes: Status changed from \'done\' to \'in progress\'', 'App\\Models\\Task', NULL, 4, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'done\' to \'in progress\'\"]}', NULL, '2024-11-06 08:12:34', '2024-11-06 08:12:34'),
(235, 'default', 'Updated task: Distribute the survey with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 4, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 08:12:35', '2024-11-06 08:12:35'),
(236, 'default', 'Updated task: Distribute the survey with changes: Status changed from \'done\' to \'in progress\'', 'App\\Models\\Task', NULL, 4, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'done\' to \'in progress\'\"]}', NULL, '2024-11-06 08:12:36', '2024-11-06 08:12:36'),
(237, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 08:15:51', '2024-11-06 08:15:51'),
(238, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 08:27:40', '2024-11-06 08:27:40'),
(239, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 08:28:22', '2024-11-06 08:28:22'),
(240, 'default', 'Updated profile: Name changed from Vessel to Vessel_Sc', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 38, '{\"changes\":[\"Name changed from Vessel to Vessel_Sc\"]}', NULL, '2024-11-06 08:28:36', '2024-11-06 08:28:36'),
(241, 'default', 'Updated profile: Name changed from Vessel_Sc to Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 38, '{\"changes\":[\"Name changed from Vessel_Sc to Vessel\"]}', NULL, '2024-11-06 08:28:43', '2024-11-06 08:28:43'),
(242, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 08:29:19', '2024-11-06 08:29:19'),
(243, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 08:33:30', '2024-11-06 08:33:30'),
(244, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 08:35:36', '2024-11-06 08:35:36'),
(245, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 08:35:39', '2024-11-06 08:35:39'),
(246, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 63, '[]', NULL, '2024-11-06 08:42:56', '2024-11-06 08:42:56'),
(247, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 08:50:54', '2024-11-06 08:50:54'),
(248, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 08:58:28', '2024-11-06 08:58:28'),
(249, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 08:58:35', '2024-11-06 08:58:35'),
(250, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 09:53:12', '2024-11-06 09:53:12'),
(251, 'default', 'Created a reward: Paid Leave for team Avengers', 'App\\Models\\Reward', NULL, 2, 'App\\Models\\User', 38, '{\"name\":\"Paid Leave\",\"points_required\":\"500\"}', NULL, '2024-11-06 10:37:02', '2024-11-06 10:37:02'),
(252, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 10:45:28', '2024-11-06 10:45:28'),
(253, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 10:46:24', '2024-11-06 10:46:24'),
(254, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 10:49:03', '2024-11-06 10:49:03'),
(255, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 10:49:10', '2024-11-06 10:49:10'),
(256, 'default', 'Updated task: Do chapter 4 with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 5, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 10:49:42', '2024-11-06 10:49:42'),
(257, 'default', 'Created a task: Sample 3', 'App\\Models\\Task', NULL, 14, 'App\\Models\\User', 39, '{\"name\":\"Sample 3\"}', NULL, '2024-11-06 10:50:39', '2024-11-06 10:50:39'),
(258, 'default', 'Updated task: Sample 3 with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 14, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 10:50:58', '2024-11-06 10:50:58'),
(259, 'default', 'Updated task: Do chapter 4 with changes: Status changed from \'done\' to \'not started\'', 'App\\Models\\Task', NULL, 5, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'done\' to \'not started\'\"]}', NULL, '2024-11-06 10:50:59', '2024-11-06 10:50:59'),
(260, 'default', 'Updated task: QA the system with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 10, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 10:51:00', '2024-11-06 10:51:00'),
(261, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 10:53:59', '2024-11-06 10:53:59'),
(262, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 10:55:22', '2024-11-06 10:55:22'),
(263, 'default', 'Created a task: Development', 'App\\Models\\Task', NULL, 15, 'App\\Models\\User', 65, '{\"name\":\"Development\"}', NULL, '2024-11-06 11:04:41', '2024-11-06 11:04:41'),
(264, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 11:05:15', '2024-11-06 11:05:15'),
(265, 'default', 'Updated task: Development with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 15, 'App\\Models\\User', 65, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 11:06:02', '2024-11-06 11:06:02'),
(266, 'default', 'Created a team: Team 1', 'App\\Models\\Team', NULL, 4, 'App\\Models\\User', 65, '{\"name\":\"Team 1\"}', NULL, '2024-11-06 11:08:24', '2024-11-06 11:08:24'),
(267, 'default', 'Updated team: Team 1 with changes: Invitations sent to new members: Vessel, Members removed: Fernand', 'App\\Models\\Team', NULL, 4, 'App\\Models\\User', 65, '{\"changes\":[\"Invitations sent to new members: Vessel\",\"Members removed: Fernand\"]}', NULL, '2024-11-06 11:09:02', '2024-11-06 11:09:02'),
(268, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 11:09:14', '2024-11-06 11:09:14'),
(269, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 11:09:31', '2024-11-06 11:09:31'),
(270, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 66, '[]', NULL, '2024-11-06 11:11:00', '2024-11-06 11:11:00'),
(271, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 12:03:06', '2024-11-06 12:03:06'),
(272, 'default', 'Updated task: upload with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 16, 'App\\Models\\User', 65, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 12:06:58', '2024-11-06 12:06:58'),
(273, 'default', 'Created a reward: The Finisher for team Team 1', 'App\\Models\\Reward', NULL, 3, 'App\\Models\\User', 65, '{\"name\":\"The Finisher\",\"points_required\":\"1\"}', NULL, '2024-11-06 12:10:06', '2024-11-06 12:10:06'),
(274, 'default', 'Created a task: aaaa', 'App\\Models\\Task', NULL, 17, 'App\\Models\\User', 38, '{\"name\":\"aaaa\"}', NULL, '2024-11-06 12:10:08', '2024-11-06 12:10:08'),
(275, 'default', 'Updated task: upload with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 16, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 12:10:32', '2024-11-06 12:10:32'),
(276, 'default', 'Task approved: upload', 'App\\Models\\Task', NULL, 16, 'App\\Models\\User', 65, '{\"task_name\":\"upload\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-06 12:11:25', '2024-11-06 12:11:25'),
(277, 'default', 'Task graded: upload as excellent for Vessel', 'App\\Models\\Task', NULL, 16, 'App\\Models\\User', 65, '{\"task_name\":\"upload\",\"grade\":\"excellent\",\"points\":50,\"user\":\"Vessel\"}', NULL, '2024-11-06 12:14:29', '2024-11-06 12:14:29'),
(278, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 65, '[]', NULL, '2024-11-06 12:16:06', '2024-11-06 12:16:06'),
(279, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 12:16:17', '2024-11-06 12:16:17'),
(280, 'default', 'Created a task: aaa', 'App\\Models\\Task', NULL, 18, 'App\\Models\\User', 38, '{\"name\":\"aaa\"}', NULL, '2024-11-06 12:17:17', '2024-11-06 12:17:17'),
(281, 'default', 'Task deleted: aaaa', 'App\\Models\\Task', NULL, 17, 'App\\Models\\User', 38, '{\"name\":\"aaaa\",\"description\":null}', NULL, '2024-11-06 12:17:23', '2024-11-06 12:17:23'),
(282, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 12:21:47', '2024-11-06 12:21:47'),
(283, 'default', 'Updated task: aaa with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 18, 'App\\Models\\User', 2, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 12:23:42', '2024-11-06 12:23:42'),
(284, 'default', 'Updated task: Build a sorting system with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 2, 'App\\Models\\User', 2, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 12:24:07', '2024-11-06 12:24:07'),
(285, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 12:25:16', '2024-11-06 12:25:16'),
(286, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 12:25:57', '2024-11-06 12:25:57'),
(287, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 12:38:44', '2024-11-06 12:38:44'),
(288, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 65, '[]', NULL, '2024-11-06 12:39:07', '2024-11-06 12:39:07'),
(289, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 12:42:33', '2024-11-06 12:42:33'),
(290, 'default', 'Updated task: Development with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 15, 'App\\Models\\User', 65, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 12:44:57', '2024-11-06 12:44:57'),
(291, 'default', 'Updated task: Full task with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 19, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 12:47:52', '2024-11-06 12:47:52'),
(292, 'default', 'Updated task: Full task with changes: Status changed from \'done\' to \'in progress\'', 'App\\Models\\Task', NULL, 19, 'App\\Models\\User', 65, '{\"changes\":[\"Status changed from \'done\' to \'in progress\'\"]}', NULL, '2024-11-06 12:49:57', '2024-11-06 12:49:57'),
(293, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 12:52:34', '2024-11-06 12:52:34'),
(294, 'default', 'Task approved: QA the system', 'App\\Models\\Task', NULL, 10, 'App\\Models\\User', 38, '{\"task_name\":\"QA the system\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-06 12:52:55', '2024-11-06 12:52:55'),
(295, 'default', 'Task graded: QA the system as good for byen', 'App\\Models\\Task', NULL, 10, 'App\\Models\\User', 38, '{\"task_name\":\"QA the system\",\"grade\":\"good\",\"points\":10,\"user\":\"byen\"}', NULL, '2024-11-06 12:53:15', '2024-11-06 12:53:15'),
(296, 'default', 'Updated task: QA the system with changes: Status changed from \'done\' to \'not started\'', 'App\\Models\\Task', NULL, 10, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'done\' to \'not started\'\"]}', NULL, '2024-11-06 12:54:20', '2024-11-06 12:54:20'),
(297, 'default', 'Updated task: QA the system with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 10, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 12:57:42', '2024-11-06 12:57:42'),
(298, 'default', 'Updated task: QA the system with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 10, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 12:57:45', '2024-11-06 12:57:45'),
(299, 'default', 'Task approved: QA the system', 'App\\Models\\Task', NULL, 10, 'App\\Models\\User', 38, '{\"task_name\":\"QA the system\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-06 12:57:49', '2024-11-06 12:57:49'),
(300, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 13:00:55', '2024-11-06 13:00:55'),
(301, 'default', 'Task deleted: QA the system', 'App\\Models\\Task', NULL, 10, 'App\\Models\\User', 38, '{\"name\":\"QA the system\",\"description\":\"Find bugs in the system.\"}', NULL, '2024-11-06 13:02:03', '2024-11-06 13:02:03'),
(302, 'default', 'Updated task: aaaa with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 20, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 13:02:20', '2024-11-06 13:02:20'),
(303, 'default', 'Task approved: aaaa', 'App\\Models\\Task', NULL, 20, 'App\\Models\\User', 38, '{\"task_name\":\"aaaa\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-06 13:02:41', '2024-11-06 13:02:41'),
(304, 'default', 'Task graded: aaaa as good for byen', 'App\\Models\\Task', NULL, 20, 'App\\Models\\User', 38, '{\"task_name\":\"aaaa\",\"grade\":\"good\",\"points\":10,\"user\":\"byen\"}', NULL, '2024-11-06 13:02:59', '2024-11-06 13:02:59'),
(305, 'default', 'Created a task: 1 pop', 'App\\Models\\Task', NULL, 21, 'App\\Models\\User', 38, '{\"name\":\"1 pop\"}', NULL, '2024-11-06 13:06:17', '2024-11-06 13:06:17'),
(306, 'default', 'Updated task: 1 pop with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 21, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 13:06:22', '2024-11-06 13:06:22'),
(307, 'default', 'Updated task: 1 pop with changes: Status changed from \'done\' to \'not started\'', 'App\\Models\\Task', NULL, 21, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'done\' to \'not started\'\"]}', NULL, '2024-11-06 13:06:37', '2024-11-06 13:06:37');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(308, 'default', 'Task deleted: aaaa', 'App\\Models\\Task', NULL, 20, 'App\\Models\\User', 38, '{\"name\":\"aaaa\",\"description\":\"b\"}', NULL, '2024-11-06 13:16:25', '2024-11-06 13:16:25'),
(309, 'default', 'Updated task: Paid Leave with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 22, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 13:16:41', '2024-11-06 13:16:41'),
(310, 'default', 'Updated task: Paid Leave with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 22, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 13:16:47', '2024-11-06 13:16:47'),
(311, 'default', 'Updated task: Paid Leave with changes: Status changed from \'done\' to \'in progress\'', 'App\\Models\\Task', NULL, 22, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'done\' to \'in progress\'\"]}', NULL, '2024-11-06 13:17:01', '2024-11-06 13:17:01'),
(312, 'default', 'Updated task: Paid Leave with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 22, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 13:17:20', '2024-11-06 13:17:20'),
(313, 'default', 'Task approved: Paid Leave', 'App\\Models\\Task', NULL, 22, 'App\\Models\\User', 38, '{\"task_name\":\"Paid Leave\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-06 13:17:22', '2024-11-06 13:17:22'),
(314, 'default', 'Task graded: Paid Leave as excellent for byen', 'App\\Models\\Task', NULL, 22, 'App\\Models\\User', 38, '{\"task_name\":\"Paid Leave\",\"grade\":\"excellent\",\"points\":50,\"user\":\"byen\"}', NULL, '2024-11-06 13:17:45', '2024-11-06 13:17:45'),
(315, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 13:18:57', '2024-11-06 13:18:57'),
(316, 'default', 'Updated task: 1 pop with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 21, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 13:30:22', '2024-11-06 13:30:22'),
(317, 'default', 'Updated task: 1 pop with changes: Status changed from \'done\' to \'not started\'', 'App\\Models\\Task', NULL, 21, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'done\' to \'not started\'\"]}', NULL, '2024-11-06 13:36:19', '2024-11-06 13:36:19'),
(318, 'default', 'Updated task: 1 pop with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 21, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 13:36:27', '2024-11-06 13:36:27'),
(319, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 13:38:25', '2024-11-06 13:38:25'),
(320, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 13:42:22', '2024-11-06 13:42:22'),
(321, 'default', 'Created a task: 45', 'App\\Models\\Task', NULL, 25, 'App\\Models\\User', 39, '{\"name\":\"45\"}', NULL, '2024-11-06 13:58:37', '2024-11-06 13:58:37'),
(322, 'default', 'Updated task: 45 with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 25, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 13:59:38', '2024-11-06 13:59:38'),
(323, 'default', 'Updated task: 45 with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 25, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 13:59:40', '2024-11-06 13:59:40'),
(324, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 14:00:05', '2024-11-06 14:00:05'),
(325, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 14:02:11', '2024-11-06 14:02:11'),
(326, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 14:03:44', '2024-11-06 14:03:44'),
(327, 'default', 'Created a task: Test 1 Bi Hourly attendance', 'App\\Models\\Task', NULL, 27, 'App\\Models\\User', 39, '{\"name\":\"Test 1 Bi Hourly attendance\"}', NULL, '2024-11-06 14:05:16', '2024-11-06 14:05:16'),
(328, 'default', 'Updated task: Test 1 Bi Hourly attendance with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 27, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 14:05:48', '2024-11-06 14:05:48'),
(329, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 14:27:18', '2024-11-06 14:27:18'),
(330, 'default', 'Created a task: debug', 'App\\Models\\Task', NULL, 28, 'App\\Models\\User', 38, '{\"name\":\"debug\"}', NULL, '2024-11-06 14:27:46', '2024-11-06 14:27:46'),
(331, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 14:28:20', '2024-11-06 14:28:20'),
(332, 'default', 'Created a task: deb2', 'App\\Models\\Task', NULL, 30, 'App\\Models\\User', 38, '{\"name\":\"deb2\"}', NULL, '2024-11-06 14:41:49', '2024-11-06 14:41:49'),
(333, 'default', 'Task deleted: deb2', 'App\\Models\\Task', NULL, 30, 'App\\Models\\User', 38, '{\"name\":\"deb2\",\"description\":null}', NULL, '2024-11-06 14:43:06', '2024-11-06 14:43:06'),
(334, 'default', 'Task deleted: 1 pop', 'App\\Models\\Task', NULL, 21, 'App\\Models\\User', 38, '{\"name\":\"1 pop\",\"description\":null}', NULL, '2024-11-06 14:43:13', '2024-11-06 14:43:13'),
(335, 'default', 'Task deleted: 1 pop', 'App\\Models\\Task', NULL, 26, 'App\\Models\\User', 38, '{\"name\":\"1 pop\",\"description\":null}', NULL, '2024-11-06 14:43:16', '2024-11-06 14:43:16'),
(336, 'default', 'Task deleted: 3 pop', 'App\\Models\\Task', NULL, 23, 'App\\Models\\User', 38, '{\"name\":\"3 pop\",\"description\":null}', NULL, '2024-11-06 14:43:19', '2024-11-06 14:43:19'),
(337, 'default', 'Task deleted: 4s', 'App\\Models\\Task', NULL, 24, 'App\\Models\\User', 38, '{\"name\":\"4s\",\"description\":null}', NULL, '2024-11-06 14:43:21', '2024-11-06 14:43:21'),
(338, 'default', 'Task deleted: aaa', 'App\\Models\\Task', NULL, 18, 'App\\Models\\User', 38, '{\"name\":\"aaa\",\"description\":null}', NULL, '2024-11-06 14:43:25', '2024-11-06 14:43:25'),
(339, 'default', 'Created a task: personals', 'App\\Models\\Task', NULL, 31, 'App\\Models\\User', 38, '{\"name\":\"personals\"}', NULL, '2024-11-06 14:43:45', '2024-11-06 14:43:45'),
(340, 'default', 'Updated task: asana with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 32, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 14:57:45', '2024-11-06 14:57:45'),
(341, 'default', 'Updated task: asana with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 32, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 14:58:00', '2024-11-06 14:58:00'),
(342, 'default', 'Task approved: asana', 'App\\Models\\Task', NULL, 32, 'App\\Models\\User', 38, '{\"task_name\":\"asana\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-06 14:58:22', '2024-11-06 14:58:22'),
(343, 'default', 'Updated task: Full task with changes: Status changed from \'in progress\' to \'not started\'', 'App\\Models\\Task', NULL, 19, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'in progress\' to \'not started\'\"]}', NULL, '2024-11-06 15:08:03', '2024-11-06 15:08:03'),
(344, 'default', 'Created a task: newm', 'App\\Models\\Task', NULL, 33, 'App\\Models\\User', 38, '{\"name\":\"newm\"}', NULL, '2024-11-06 15:08:37', '2024-11-06 15:08:37'),
(345, 'default', 'Updated task: newm with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 33, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 15:10:12', '2024-11-06 15:10:12'),
(346, 'default', 'Updated task: newm with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 33, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 15:10:15', '2024-11-06 15:10:15'),
(347, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 15:32:24', '2024-11-06 15:32:24'),
(348, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 15:32:40', '2024-11-06 15:32:40'),
(349, 'default', 'Task deleted: checklist', 'App\\Models\\Task', NULL, 29, 'App\\Models\\User', 38, '{\"name\":\"checklist\",\"description\":null}', NULL, '2024-11-06 15:51:08', '2024-11-06 15:51:08'),
(350, 'default', 'Task deleted: asana', 'App\\Models\\Task', NULL, 32, 'App\\Models\\User', 38, '{\"name\":\"asana\",\"description\":null}', NULL, '2024-11-06 15:51:17', '2024-11-06 15:51:17'),
(351, 'default', 'Task deleted: Paid Leave', 'App\\Models\\Task', NULL, 22, 'App\\Models\\User', 38, '{\"name\":\"Paid Leave\",\"description\":null}', NULL, '2024-11-06 15:51:21', '2024-11-06 15:51:21'),
(352, 'default', 'Task deleted: newm', 'App\\Models\\Task', NULL, 33, 'App\\Models\\User', 38, '{\"name\":\"newm\",\"description\":null}', NULL, '2024-11-06 15:51:56', '2024-11-06 15:51:56'),
(353, 'default', 'Task deleted: Paper Research', 'App\\Models\\Task', NULL, 7, 'App\\Models\\User', 38, '{\"name\":\"Paper Research\",\"description\":\"Paper research for Science.\"}', NULL, '2024-11-06 15:52:15', '2024-11-06 15:52:15'),
(354, 'default', 'Task deleted: personals', 'App\\Models\\Task', NULL, 31, 'App\\Models\\User', 38, '{\"name\":\"personals\",\"description\":null}', NULL, '2024-11-06 15:52:50', '2024-11-06 15:52:50'),
(355, 'default', 'Task deleted: debug', 'App\\Models\\Task', NULL, 28, 'App\\Models\\User', 38, '{\"name\":\"debug\",\"description\":null}', NULL, '2024-11-06 15:53:49', '2024-11-06 15:53:49'),
(356, 'default', 'Created a task: css editing', 'App\\Models\\Task', NULL, 34, 'App\\Models\\User', 38, '{\"name\":\"css editing\"}', NULL, '2024-11-06 15:55:50', '2024-11-06 15:55:50'),
(357, 'default', 'Updated task: css editing with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 34, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 15:56:10', '2024-11-06 15:56:10'),
(358, 'default', 'Task deleted: css editing', 'App\\Models\\Task', NULL, 34, 'App\\Models\\User', 38, '{\"name\":\"css editing\",\"description\":null}', NULL, '2024-11-06 15:56:27', '2024-11-06 15:56:27'),
(359, 'default', 'Created a task: css editing', 'App\\Models\\Task', NULL, 35, 'App\\Models\\User', 38, '{\"name\":\"css editing\"}', NULL, '2024-11-06 15:56:50', '2024-11-06 15:56:50'),
(360, 'default', 'Updated task: css editing with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 35, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 15:57:23', '2024-11-06 15:57:23'),
(361, 'default', 'Created a task: asana', 'App\\Models\\Task', NULL, 36, 'App\\Models\\User', 38, '{\"name\":\"asana\"}', NULL, '2024-11-06 15:59:41', '2024-11-06 15:59:41'),
(362, 'default', 'Updated task: asana with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 36, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 15:59:52', '2024-11-06 15:59:52'),
(363, 'default', 'Updated task: asana with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 36, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:00:00', '2024-11-06 16:00:00'),
(364, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 16:13:25', '2024-11-06 16:13:25'),
(365, 'default', 'Updated team: Avengers with changes: Invitations sent to new members: taurus, Members removed: Vessel', 'App\\Models\\Team', NULL, 2, 'App\\Models\\User', 38, '{\"changes\":[\"Invitations sent to new members: taurus\",\"Members removed: Vessel\"]}', NULL, '2024-11-06 16:13:53', '2024-11-06 16:13:53'),
(366, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 16:14:05', '2024-11-06 16:14:05'),
(367, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 16:15:04', '2024-11-06 16:15:04'),
(368, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 16:15:13', '2024-11-06 16:15:13'),
(369, 'default', 'Updated task: co-op with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 37, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 16:15:21', '2024-11-06 16:15:21'),
(370, 'default', 'Updated task: co-op with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 37, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:15:28', '2024-11-06 16:15:28'),
(371, 'default', 'Task rejected: co-op', 'App\\Models\\Task', NULL, 37, 'App\\Models\\User', 38, '{\"task_name\":\"co-op\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"Please change the files.\"}', NULL, '2024-11-06 16:17:49', '2024-11-06 16:17:49'),
(372, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 16:18:28', '2024-11-06 16:18:28'),
(373, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 16:18:40', '2024-11-06 16:18:40'),
(374, 'default', 'Updated task: co-op with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 37, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:18:56', '2024-11-06 16:18:56'),
(375, 'default', 'Task approved: co-op', 'App\\Models\\Task', NULL, 37, 'App\\Models\\User', 38, '{\"task_name\":\"co-op\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-06 16:19:13', '2024-11-06 16:19:13'),
(376, 'default', 'Updated task: rejected with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 38, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 16:25:57', '2024-11-06 16:25:57'),
(377, 'default', 'Updated task: rejected with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 38, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:26:00', '2024-11-06 16:26:00'),
(378, 'default', 'Task rejected: rejected', 'App\\Models\\Task', NULL, 38, 'App\\Models\\User', 38, '{\"task_name\":\"rejected\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"redo this task.\"}', NULL, '2024-11-06 16:26:21', '2024-11-06 16:26:21'),
(379, 'default', 'Updated task: rejected with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 38, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:32:40', '2024-11-06 16:32:40'),
(380, 'default', 'Task deleted: rejected', 'App\\Models\\Task', NULL, 38, 'App\\Models\\User', 38, '{\"name\":\"rejected\",\"description\":null}', NULL, '2024-11-06 16:33:07', '2024-11-06 16:33:07'),
(381, 'default', 'Updated task: remarks with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 39, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 16:33:33', '2024-11-06 16:33:33'),
(382, 'default', 'Updated task: remarks with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 39, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:33:36', '2024-11-06 16:33:36'),
(383, 'default', 'Task rejected: remarks', 'App\\Models\\Task', NULL, 39, 'App\\Models\\User', 38, '{\"task_name\":\"remarks\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"redo this\"}', NULL, '2024-11-06 16:33:51', '2024-11-06 16:33:51'),
(384, 'default', 'Updated task: remarks with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 39, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:37:38', '2024-11-06 16:37:38'),
(385, 'default', 'Task deleted: remarks', 'App\\Models\\Task', NULL, 39, 'App\\Models\\User', 38, '{\"name\":\"remarks\",\"description\":null}', NULL, '2024-11-06 16:40:45', '2024-11-06 16:40:45'),
(386, 'default', 'Updated task: remem with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 40, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 16:41:05', '2024-11-06 16:41:05'),
(387, 'default', 'Updated task: remem with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 40, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:41:09', '2024-11-06 16:41:09'),
(388, 'default', 'Task rejected: remem', 'App\\Models\\Task', NULL, 40, 'App\\Models\\User', 38, '{\"task_name\":\"remem\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"redo\"}', NULL, '2024-11-06 16:41:17', '2024-11-06 16:41:17'),
(389, 'default', 'Updated task: remem with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 40, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:41:27', '2024-11-06 16:41:27'),
(390, 'default', 'Updated task: wemble with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 41, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 16:45:30', '2024-11-06 16:45:30'),
(391, 'default', 'Task rejected: wemble', 'App\\Models\\Task', NULL, 41, 'App\\Models\\User', 38, '{\"task_name\":\"wemble\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"redo\"}', NULL, '2024-11-06 16:45:46', '2024-11-06 16:45:46'),
(392, 'default', 'Updated task: wemble with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 41, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:45:59', '2024-11-06 16:45:59'),
(393, 'default', 'Task deleted: remem', 'App\\Models\\Task', NULL, 40, 'App\\Models\\User', 38, '{\"name\":\"remem\",\"description\":null}', NULL, '2024-11-06 16:52:51', '2024-11-06 16:52:51'),
(394, 'default', 'Task deleted: wemble', 'App\\Models\\Task', NULL, 41, 'App\\Models\\User', 38, '{\"name\":\"wemble\",\"description\":null}', NULL, '2024-11-06 16:52:55', '2024-11-06 16:52:55'),
(395, 'default', 'Updated task: mwme with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 42, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 16:53:16', '2024-11-06 16:53:16'),
(396, 'default', 'Task rejected: mwme', 'App\\Models\\Task', NULL, 42, 'App\\Models\\User', 38, '{\"task_name\":\"mwme\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"we\"}', NULL, '2024-11-06 16:53:24', '2024-11-06 16:53:24'),
(397, 'default', 'Updated task: mwme with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 42, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 16:53:44', '2024-11-06 16:53:44'),
(398, 'default', 'Task deleted: mwme', 'App\\Models\\Task', NULL, 42, 'App\\Models\\User', 38, '{\"name\":\"mwme\",\"description\":null}', NULL, '2024-11-06 16:56:27', '2024-11-06 16:56:27'),
(399, 'default', 'Updated task: asana with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 17:03:54', '2024-11-06 17:03:54'),
(400, 'default', 'Task rejected: asana', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 38, '{\"task_name\":\"asana\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"we\"}', NULL, '2024-11-06 17:04:02', '2024-11-06 17:04:02'),
(401, 'default', 'Resubmitted task for approval: asana', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 64, '{\"approval_status\":\"pending\"}', NULL, '2024-11-06 17:04:16', '2024-11-06 17:04:16'),
(402, 'default', 'Updated task: asana with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:06:45', '2024-11-06 17:06:45'),
(403, 'default', 'Task rejected: asana', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 38, '{\"task_name\":\"asana\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"redo it again\"}', NULL, '2024-11-06 17:07:01', '2024-11-06 17:07:01'),
(404, 'default', 'Resubmitted task for approval: asana', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 64, '{\"approval_status\":\"pending\"}', NULL, '2024-11-06 17:07:07', '2024-11-06 17:07:07'),
(405, 'default', 'Updated task: asana with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:07:22', '2024-11-06 17:07:22'),
(406, 'default', 'Task rejected: asana', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 38, '{\"task_name\":\"asana\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"redo it\"}', NULL, '2024-11-06 17:07:34', '2024-11-06 17:07:34'),
(407, 'default', 'Updated task: asana with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:07:46', '2024-11-06 17:07:46'),
(408, 'default', 'Resubmitted task for approval: asana', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 64, '{\"approval_status\":\"pending\"}', NULL, '2024-11-06 17:07:57', '2024-11-06 17:07:57'),
(409, 'default', 'Task approved: asana', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 38, '{\"task_name\":\"asana\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-06 17:08:09', '2024-11-06 17:08:09'),
(410, 'default', 'Updated task: asana with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 44, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 17:09:31', '2024-11-06 17:09:31'),
(411, 'default', 'Task rejected: asana', 'App\\Models\\Task', NULL, 44, 'App\\Models\\User', 38, '{\"task_name\":\"asana\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"2\"}', NULL, '2024-11-06 17:09:37', '2024-11-06 17:09:37'),
(412, 'default', 'Updated task: asana with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 44, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:19:12', '2024-11-06 17:19:12'),
(413, 'default', 'Resubmitted task for approval: asana', 'App\\Models\\Task', NULL, 44, 'App\\Models\\User', 64, '{\"approval_status\":\"pending\"}', NULL, '2024-11-06 17:23:33', '2024-11-06 17:23:33'),
(414, 'default', 'Task rejected: asana', 'App\\Models\\Task', NULL, 44, 'App\\Models\\User', 38, '{\"task_name\":\"asana\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"test\"}', NULL, '2024-11-06 17:23:57', '2024-11-06 17:23:57'),
(415, 'default', 'Updated task: asana with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 44, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:24:05', '2024-11-06 17:24:05'),
(416, 'default', 'Resubmitted task for approval: asana', 'App\\Models\\Task', NULL, 44, 'App\\Models\\User', 64, '{\"approval_status\":\"pending\"}', NULL, '2024-11-06 17:25:01', '2024-11-06 17:25:01'),
(417, 'default', 'Task rejected: asana', 'App\\Models\\Task', NULL, 44, 'App\\Models\\User', 38, '{\"task_name\":\"asana\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"wewe\"}', NULL, '2024-11-06 17:25:14', '2024-11-06 17:25:14'),
(418, 'default', 'Updated task: asana with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 44, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:25:25', '2024-11-06 17:25:25'),
(419, 'default', 'Task deleted: asana', 'App\\Models\\Task', NULL, 44, 'App\\Models\\User', 38, '{\"name\":\"asana\",\"description\":null}', NULL, '2024-11-06 17:33:45', '2024-11-06 17:33:45'),
(420, 'default', 'Task deleted: asana', 'App\\Models\\Task', NULL, 43, 'App\\Models\\User', 38, '{\"name\":\"asana\",\"description\":null}', NULL, '2024-11-06 17:33:49', '2024-11-06 17:33:49'),
(421, 'default', 'Updated task: final with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 45, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 17:34:41', '2024-11-06 17:34:41'),
(422, 'default', 'Task rejected: final', 'App\\Models\\Task', NULL, 45, 'App\\Models\\User', 38, '{\"task_name\":\"final\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"reg\"}', NULL, '2024-11-06 17:34:51', '2024-11-06 17:34:51'),
(423, 'default', 'Resubmitted task for approval: final', 'App\\Models\\Task', NULL, 45, 'App\\Models\\User', 64, '{\"approval_status\":\"pending\"}', NULL, '2024-11-06 17:35:18', '2024-11-06 17:35:18'),
(424, 'default', 'Updated task: final with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 45, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:35:38', '2024-11-06 17:35:38'),
(425, 'default', 'Task rejected: final', 'App\\Models\\Task', NULL, 45, 'App\\Models\\User', 38, '{\"task_name\":\"final\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"sdsd\"}', NULL, '2024-11-06 17:35:48', '2024-11-06 17:35:48'),
(426, 'default', 'Resubmitted task for approval: final', 'App\\Models\\Task', NULL, 45, 'App\\Models\\User', 64, '{\"approval_status\":\"pending\"}', NULL, '2024-11-06 17:36:10', '2024-11-06 17:36:10'),
(427, 'default', 'Updated task: final with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 45, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:36:15', '2024-11-06 17:36:15'),
(428, 'default', 'Task approved: final', 'App\\Models\\Task', NULL, 45, 'App\\Models\\User', 38, '{\"task_name\":\"final\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-06 17:36:24', '2024-11-06 17:36:24'),
(429, 'default', 'Updated task: invited with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 17:41:39', '2024-11-06 17:41:39'),
(430, 'default', 'Task rejected: invited', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 38, '{\"task_name\":\"invited\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"wew\"}', NULL, '2024-11-06 17:41:45', '2024-11-06 17:41:45'),
(431, 'default', 'Updated task: invited with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:43:55', '2024-11-06 17:43:55'),
(432, 'default', 'Task rejected: invited', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 38, '{\"task_name\":\"invited\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"wew\"}', NULL, '2024-11-06 17:44:06', '2024-11-06 17:44:06'),
(433, 'default', 'Updated task: invited with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:45:50', '2024-11-06 17:45:50'),
(434, 'default', 'Task rejected: invited', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 38, '{\"task_name\":\"invited\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"2323\"}', NULL, '2024-11-06 17:45:57', '2024-11-06 17:45:57'),
(435, 'default', 'Updated task: invited with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:47:15', '2024-11-06 17:47:15'),
(436, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 68, '[]', NULL, '2024-11-06 17:48:31', '2024-11-06 17:48:31'),
(437, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 68, '[]', NULL, '2024-11-06 17:50:29', '2024-11-06 17:50:29'),
(438, 'default', 'Task rejected: invited', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 38, '{\"task_name\":\"invited\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"MOMO\"}', NULL, '2024-11-06 17:50:58', '2024-11-06 17:50:58'),
(439, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 68, '[]', NULL, '2024-11-06 17:51:17', '2024-11-06 17:51:17'),
(440, 'default', 'Resubmitted task for approval: invited', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 64, '{\"approval_status\":\"pending\"}', NULL, '2024-11-06 17:51:54', '2024-11-06 17:51:54'),
(441, 'default', 'Updated task: invited with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 17:51:59', '2024-11-06 17:51:59'),
(442, 'default', 'Task approved: invited', 'App\\Models\\Task', NULL, 46, 'App\\Models\\User', 38, '{\"task_name\":\"invited\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-06 17:52:42', '2024-11-06 17:52:42'),
(443, 'default', 'Task graded: final as good for taurus', 'App\\Models\\Task', NULL, 45, 'App\\Models\\User', 38, '{\"task_name\":\"final\",\"grade\":\"good\",\"points\":10,\"user\":\"taurus\"}', NULL, '2024-11-06 17:53:16', '2024-11-06 17:53:16'),
(444, 'default', 'Created a task: listen to music rn', 'App\\Models\\Task', NULL, 47, 'App\\Models\\User', 64, '{\"name\":\"listen to music rn\"}', NULL, '2024-11-06 17:56:20', '2024-11-06 17:56:20'),
(445, 'default', 'Updated task: listen to music rn with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 47, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-06 17:56:29', '2024-11-06 17:56:29'),
(446, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 18:07:29', '2024-11-06 18:07:29'),
(447, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 18:07:39', '2024-11-06 18:07:39'),
(448, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 18:08:26', '2024-11-06 18:08:26'),
(449, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 18:08:36', '2024-11-06 18:08:36'),
(450, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 18:08:49', '2024-11-06 18:08:49'),
(451, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 18:09:23', '2024-11-06 18:09:23'),
(452, 'default', 'Created a task: Capstone', 'App\\Models\\Task', NULL, 48, 'App\\Models\\User', 39, '{\"name\":\"Capstone\"}', NULL, '2024-11-06 18:12:18', '2024-11-06 18:12:18'),
(453, 'default', 'Created a task: Sample Task', 'App\\Models\\Task', NULL, 49, 'App\\Models\\User', 39, '{\"name\":\"Sample Task\"}', NULL, '2024-11-06 18:15:22', '2024-11-06 18:15:22'),
(454, 'default', 'Updated task: Test 1 Bi Hourly attendance with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 27, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-06 18:15:52', '2024-11-06 18:15:52'),
(455, 'default', 'Updated task: Sample Task with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 49, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 18:15:56', '2024-11-06 18:15:56'),
(456, 'default', 'Updated task: Sample Task with changes: Status changed from \'in progress\' to \'not started\'', 'App\\Models\\Task', NULL, 49, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'not started\'\"]}', NULL, '2024-11-06 18:15:57', '2024-11-06 18:15:57'),
(457, 'default', 'Updated task: Capstone with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 48, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 18:16:01', '2024-11-06 18:16:01'),
(458, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 18:16:16', '2024-11-06 18:16:16'),
(459, 'default', 'Created a team: Team 3', 'App\\Models\\Team', NULL, 5, 'App\\Models\\User', 39, '{\"name\":\"Team 3\"}', NULL, '2024-11-06 18:17:12', '2024-11-06 18:17:12'),
(460, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 18:20:25', '2024-11-06 18:20:25'),
(461, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 18:20:52', '2024-11-06 18:20:52'),
(462, 'default', 'Created a team: Team 3', 'App\\Models\\Team', NULL, 6, 'App\\Models\\User', 39, '{\"name\":\"Team 3\"}', NULL, '2024-11-06 18:23:55', '2024-11-06 18:23:55'),
(463, 'default', 'Updated team: Team 3 with changes: Invitations sent to new members: Vessel, Members removed: byen', 'App\\Models\\Team', NULL, 6, 'App\\Models\\User', 39, '{\"changes\":[\"Invitations sent to new members: Vessel\",\"Members removed: byen\"]}', NULL, '2024-11-06 18:24:25', '2024-11-06 18:24:25'),
(464, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-06 18:34:47', '2024-11-06 18:34:47'),
(465, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 18:35:12', '2024-11-06 18:35:12'),
(466, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 18:35:22', '2024-11-06 18:35:22'),
(467, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 18:35:48', '2024-11-06 18:35:48'),
(468, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 18:35:50', '2024-11-06 18:35:50'),
(469, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 18:36:41', '2024-11-06 18:36:41'),
(470, 'default', 'Created a task: my task', 'App\\Models\\Task', NULL, 50, 'App\\Models\\User', 2, '{\"name\":\"my task\"}', NULL, '2024-11-06 18:40:51', '2024-11-06 18:40:51'),
(471, 'default', 'Updated profile: Skills updated, Profile picture updated', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 39, '{\"changes\":[\"Skills updated\",\"Profile picture updated\"]}', NULL, '2024-11-06 18:42:24', '2024-11-06 18:42:24'),
(472, 'default', 'Created a team: Decoders', 'App\\Models\\Team', NULL, 7, 'App\\Models\\User', 37, '{\"name\":\"Decoders\"}', NULL, '2024-11-06 18:43:44', '2024-11-06 18:43:44'),
(473, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-06 18:44:26', '2024-11-06 18:44:26'),
(474, 'default', 'Updated profile: Profile picture updated', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 39, '{\"changes\":[\"Profile picture updated\"]}', NULL, '2024-11-06 18:44:50', '2024-11-06 18:44:50'),
(475, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 18:44:52', '2024-11-06 18:44:52'),
(476, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 18:46:49', '2024-11-06 18:46:49'),
(477, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 18:47:00', '2024-11-06 18:47:00'),
(478, 'default', 'Task deleted: my task', 'App\\Models\\Task', NULL, 50, 'App\\Models\\User', 2, '{\"name\":\"my task\",\"description\":null}', NULL, '2024-11-06 18:47:11', '2024-11-06 18:47:11'),
(479, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 18:50:18', '2024-11-06 18:50:18'),
(480, 'default', 'Created a reward: Public speaker for team Decoders', 'App\\Models\\Reward', NULL, 4, 'App\\Models\\User', 37, '{\"name\":\"Public speaker\",\"points_required\":\"100\"}', NULL, '2024-11-06 19:00:33', '2024-11-06 19:00:33'),
(481, 'default', 'Created a reward: Presentation wise for team Decoders', 'App\\Models\\Reward', NULL, 5, 'App\\Models\\User', 37, '{\"name\":\"Presentation wise\",\"points_required\":\"50\"}', NULL, '2024-11-06 19:01:17', '2024-11-06 19:01:17'),
(482, 'default', 'Created a reward: Teamwork Dream Work for team Decoders', 'App\\Models\\Reward', NULL, 6, 'App\\Models\\User', 37, '{\"name\":\"Teamwork Dream Work\",\"points_required\":\"150\"}', NULL, '2024-11-06 19:02:29', '2024-11-06 19:02:29'),
(483, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-06 19:03:10', '2024-11-06 19:03:10'),
(484, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 19:03:44', '2024-11-06 19:03:44'),
(485, 'default', 'Task deleted: Capstone', 'App\\Models\\Task', NULL, 48, 'App\\Models\\User', 39, '{\"name\":\"Capstone\",\"description\":null}', NULL, '2024-11-06 19:14:50', '2024-11-06 19:14:50'),
(486, 'default', 'Task deleted: Sample 3', 'App\\Models\\Task', NULL, 14, 'App\\Models\\User', 39, '{\"name\":\"Sample 3\",\"description\":\"Hello\"}', NULL, '2024-11-06 19:14:56', '2024-11-06 19:14:56'),
(487, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 19:38:48', '2024-11-06 19:38:48'),
(488, 'default', 'Task deleted: Development', 'App\\Models\\Task', NULL, 15, 'App\\Models\\User', 2, '{\"name\":\"Development\",\"description\":\"qwerty\"}', NULL, '2024-11-06 19:43:07', '2024-11-06 19:43:07'),
(489, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-06 20:11:40', '2024-11-06 20:11:40'),
(490, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 20:23:03', '2024-11-06 20:23:03'),
(491, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 20:23:38', '2024-11-06 20:23:38'),
(492, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 20:24:52', '2024-11-06 20:24:52'),
(493, 'default', 'Updated profile: Address updated, Profile picture updated', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 39, '{\"changes\":[\"Address updated\",\"Profile picture updated\"]}', NULL, '2024-11-06 20:28:19', '2024-11-06 20:28:19'),
(494, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 20:28:42', '2024-11-06 20:28:42'),
(495, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 20:28:45', '2024-11-06 20:28:45'),
(496, 'default', 'Created a task: Sample 1', 'App\\Models\\Task', NULL, 54, 'App\\Models\\User', 39, '{\"name\":\"Sample 1\"}', NULL, '2024-11-06 20:31:30', '2024-11-06 20:31:30'),
(497, 'default', 'Updated task: Sample 1 with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 54, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 20:32:29', '2024-11-06 20:32:29'),
(498, 'default', 'Updated task: Sample 1 with changes: Priority changed from \'high\' to \'high\'', 'App\\Models\\Task', NULL, 54, 'App\\Models\\User', 39, '{\"changes\":[\"Priority changed from \'high\' to \'high\'\"]}', NULL, '2024-11-06 20:32:41', '2024-11-06 20:32:41'),
(499, 'default', 'Created a task: Create website', 'App\\Models\\Task', NULL, 55, 'App\\Models\\User', 39, '{\"name\":\"Create website\"}', NULL, '2024-11-06 20:35:21', '2024-11-06 20:35:21'),
(500, 'default', 'Updated task: Create website with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 55, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-06 20:35:43', '2024-11-06 20:35:43'),
(501, 'default', 'Created a team: Capstone TEAM', 'App\\Models\\Team', NULL, 8, 'App\\Models\\User', 39, '{\"name\":\"Capstone TEAM\"}', NULL, '2024-11-06 20:36:56', '2024-11-06 20:36:56'),
(502, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-06 20:39:05', '2024-11-06 20:39:05'),
(503, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 20:41:05', '2024-11-06 20:41:05'),
(504, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 20:41:11', '2024-11-06 20:41:11'),
(505, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 20:41:32', '2024-11-06 20:41:32'),
(506, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 21:18:27', '2024-11-06 21:18:27'),
(507, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 21:18:30', '2024-11-06 21:18:30'),
(508, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:28:36', '2024-11-06 21:28:36'),
(509, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:28:48', '2024-11-06 21:28:48'),
(510, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:29:14', '2024-11-06 21:29:14'),
(511, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:30:47', '2024-11-06 21:30:47'),
(512, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:32:09', '2024-11-06 21:32:09'),
(513, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:32:36', '2024-11-06 21:32:36'),
(514, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:32:45', '2024-11-06 21:32:45'),
(515, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:32:49', '2024-11-06 21:32:49'),
(516, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:33:16', '2024-11-06 21:33:16'),
(517, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:33:20', '2024-11-06 21:33:20'),
(518, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:35:04', '2024-11-06 21:35:04'),
(519, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:35:22', '2024-11-06 21:35:22'),
(520, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:36:01', '2024-11-06 21:36:01'),
(521, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-06 21:36:04', '2024-11-06 21:36:04'),
(522, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 21:36:14', '2024-11-06 21:36:14'),
(523, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 21:36:17', '2024-11-06 21:36:17'),
(524, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 21:36:35', '2024-11-06 21:36:35'),
(525, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 21:36:37', '2024-11-06 21:36:37'),
(526, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 21:48:56', '2024-11-06 21:48:56'),
(527, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 21:49:12', '2024-11-06 21:49:12'),
(528, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 21:50:22', '2024-11-06 21:50:22'),
(529, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 21:50:27', '2024-11-06 21:50:27'),
(530, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:01:11', '2024-11-06 22:01:11'),
(531, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:01:45', '2024-11-06 22:01:45'),
(532, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:03:40', '2024-11-06 22:03:40'),
(533, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:03:46', '2024-11-06 22:03:46'),
(534, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:04:09', '2024-11-06 22:04:09'),
(535, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 22:04:12', '2024-11-06 22:04:12'),
(536, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-06 22:04:53', '2024-11-06 22:04:53'),
(537, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 22:05:04', '2024-11-06 22:05:04'),
(538, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:05:33', '2024-11-06 22:05:33'),
(539, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:06:24', '2024-11-06 22:06:24'),
(540, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:06:32', '2024-11-06 22:06:32'),
(541, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 22:07:28', '2024-11-06 22:07:28'),
(542, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:22:51', '2024-11-06 22:22:51'),
(543, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:22:57', '2024-11-06 22:22:57'),
(544, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:23:02', '2024-11-06 22:23:02'),
(545, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 71, '[]', NULL, '2024-11-06 22:23:09', '2024-11-06 22:23:09'),
(546, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 22:33:36', '2024-11-06 22:33:36'),
(547, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 22:33:49', '2024-11-06 22:33:49'),
(548, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 22:43:24', '2024-11-06 22:43:24'),
(549, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-06 22:45:52', '2024-11-06 22:45:52'),
(550, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-06 22:46:26', '2024-11-06 22:46:26'),
(551, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 40, '[]', NULL, '2024-11-06 22:53:03', '2024-11-06 22:53:03'),
(552, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-07 00:08:55', '2024-11-07 00:08:55'),
(553, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 00:09:01', '2024-11-07 00:09:01'),
(554, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 00:33:50', '2024-11-07 00:33:50'),
(555, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-07 01:47:43', '2024-11-07 01:47:43'),
(556, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-07 01:57:23', '2024-11-07 01:57:23'),
(557, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 06:37:07', '2024-11-07 06:37:07'),
(558, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 06:37:39', '2024-11-07 06:37:39'),
(559, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 06:37:45', '2024-11-07 06:37:45');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(560, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 06:39:10', '2024-11-07 06:39:10'),
(561, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 07:32:49', '2024-11-07 07:32:49'),
(562, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 08:46:41', '2024-11-07 08:46:41'),
(563, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 09:45:35', '2024-11-07 09:45:35'),
(564, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 09:47:08', '2024-11-07 09:47:08'),
(565, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-07 09:47:44', '2024-11-07 09:47:44'),
(566, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 09:48:12', '2024-11-07 09:48:12'),
(567, 'default', 'Updated task: loki with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 56, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-07 09:48:19', '2024-11-07 09:48:19'),
(568, 'default', 'Task rejected: loki', 'App\\Models\\Task', NULL, 56, 'App\\Models\\User', 38, '{\"task_name\":\"loki\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"redo this\"}', NULL, '2024-11-07 09:48:34', '2024-11-07 09:48:34'),
(569, 'default', 'Resubmitted task for approval: loki', 'App\\Models\\Task', NULL, 56, 'App\\Models\\User', 64, '{\"approval_status\":\"pending\"}', NULL, '2024-11-07 09:48:51', '2024-11-07 09:48:51'),
(570, 'default', 'Updated task: loki with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 56, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-07 09:48:55', '2024-11-07 09:48:55'),
(571, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-07 09:49:26', '2024-11-07 09:49:26'),
(572, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 10:40:09', '2024-11-07 10:40:09'),
(573, 'default', 'Updated task: <marquee>Distribute the survey</marquee> with changes: Task name changed from \'<marquee>Distribute the survey</marquee>\' to \'<marquee>Distribute the survey</marquee>\'', 'App\\Models\\Task', NULL, 4, 'App\\Models\\User', 39, '{\"changes\":[\"Task name changed from \'<marquee>Distribute the survey<\\/marquee>\' to \'<marquee>Distribute the survey<\\/marquee>\'\"]}', NULL, '2024-11-07 10:40:42', '2024-11-07 10:40:42'),
(574, 'default', 'Updated task: <i>Distribute the survey</i> with changes: Task name changed from \'<i>Distribute the survey</i>\' to \'<i>Distribute the survey</i>\'', 'App\\Models\\Task', NULL, 4, 'App\\Models\\User', 39, '{\"changes\":[\"Task name changed from \'<i>Distribute the survey<\\/i>\' to \'<i>Distribute the survey<\\/i>\'\"]}', NULL, '2024-11-07 10:42:26', '2024-11-07 10:42:26'),
(575, 'default', 'Updated task: Distribute the survey with changes: Task name changed from \'Distribute the survey\' to \'Distribute the survey\'', 'App\\Models\\Task', NULL, 4, 'App\\Models\\User', 39, '{\"changes\":[\"Task name changed from \'Distribute the survey\' to \'Distribute the survey\'\"]}', NULL, '2024-11-07 10:43:21', '2024-11-07 10:43:21'),
(576, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 10:51:55', '2024-11-07 10:51:55'),
(577, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-07 12:34:04', '2024-11-07 12:34:04'),
(578, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 12:34:14', '2024-11-07 12:34:14'),
(579, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 12:34:21', '2024-11-07 12:34:21'),
(580, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 12:34:56', '2024-11-07 12:34:56'),
(581, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 13:03:26', '2024-11-07 13:03:26'),
(582, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 13:13:14', '2024-11-07 13:13:14'),
(583, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 13:14:09', '2024-11-07 13:14:09'),
(584, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 13:19:41', '2024-11-07 13:19:41'),
(585, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 13:22:03', '2024-11-07 13:22:03'),
(586, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 48, '[]', NULL, '2024-11-07 13:25:53', '2024-11-07 13:25:53'),
(587, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 13:26:29', '2024-11-07 13:26:29'),
(588, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 72, '[]', NULL, '2024-11-07 13:36:38', '2024-11-07 13:36:38'),
(589, 'default', 'Updated team: Team 3 with changes: Invitations sent to new members: DARYL MANGAYA, Members removed: byen', 'App\\Models\\Team', NULL, 6, 'App\\Models\\User', 39, '{\"changes\":[\"Invitations sent to new members: DARYL MANGAYA\",\"Members removed: byen\"]}', NULL, '2024-11-07 13:52:00', '2024-11-07 13:52:00'),
(590, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 14:02:11', '2024-11-07 14:02:11'),
(591, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 14:02:15', '2024-11-07 14:02:15'),
(592, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 14:02:20', '2024-11-07 14:02:20'),
(593, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-07 14:06:08', '2024-11-07 14:06:08'),
(594, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 14:06:14', '2024-11-07 14:06:14'),
(595, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 14:58:27', '2024-11-07 14:58:27'),
(596, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 14:58:33', '2024-11-07 14:58:33'),
(597, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 16:43:59', '2024-11-07 16:43:59'),
(598, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 17:05:01', '2024-11-07 17:05:01'),
(599, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 17:17:21', '2024-11-07 17:17:21'),
(600, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 17:21:14', '2024-11-07 17:21:14'),
(601, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 17:21:48', '2024-11-07 17:21:48'),
(602, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 17:22:05', '2024-11-07 17:22:05'),
(603, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 48, '[]', NULL, '2024-11-07 17:23:06', '2024-11-07 17:23:06'),
(604, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 17:23:14', '2024-11-07 17:23:14'),
(605, 'default', 'Created a team: Capstone TEAM', 'App\\Models\\Team', NULL, 9, 'App\\Models\\User', 48, '{\"name\":\"Capstone TEAM\"}', NULL, '2024-11-07 17:34:39', '2024-11-07 17:34:39'),
(606, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 17:34:46', '2024-11-07 17:34:46'),
(607, 'default', 'Updated team: Capstone TEAM with changes: Members removed: DARYL MANGAYA', 'App\\Models\\Team', NULL, 9, 'App\\Models\\User', 48, '{\"changes\":[\"Members removed: DARYL MANGAYA\"]}', NULL, '2024-11-07 17:35:11', '2024-11-07 17:35:11'),
(608, 'default', 'Updated task: Capstone with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 57, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-07 17:35:40', '2024-11-07 17:35:40'),
(609, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 17:35:43', '2024-11-07 17:35:43'),
(610, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 17:37:38', '2024-11-07 17:37:38'),
(611, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 17:42:02', '2024-11-07 17:42:02'),
(612, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 17:42:07', '2024-11-07 17:42:07'),
(613, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 17:42:44', '2024-11-07 17:42:44'),
(614, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 17:42:52', '2024-11-07 17:42:52'),
(615, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 17:43:17', '2024-11-07 17:43:17'),
(616, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 17:43:25', '2024-11-07 17:43:25'),
(617, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 17:47:28', '2024-11-07 17:47:28'),
(618, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 17:48:30', '2024-11-07 17:48:30'),
(619, 'default', 'Updated task: Create a Responsive website with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 58, 'App\\Models\\User', 48, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-07 18:11:35', '2024-11-07 18:11:35'),
(620, 'default', 'Task approved: Create a Responsive website', 'App\\Models\\Task', NULL, 58, 'App\\Models\\User', 2, '{\"task_name\":\"Create a Responsive website\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-07 18:13:55', '2024-11-07 18:13:55'),
(621, 'default', 'Task graded: Create a Responsive website as excellent for DARYL MANGAYA', 'App\\Models\\Task', NULL, 58, 'App\\Models\\User', 2, '{\"task_name\":\"Create a Responsive website\",\"grade\":\"excellent\",\"points\":50,\"user\":\"DARYL MANGAYA\"}', NULL, '2024-11-07 18:14:25', '2024-11-07 18:14:25'),
(622, 'default', 'Task deleted: Create a Responsive website', 'App\\Models\\Task', NULL, 58, 'App\\Models\\User', 2, '{\"name\":\"Create a Responsive website\",\"description\":null}', NULL, '2024-11-07 18:16:00', '2024-11-07 18:16:00'),
(623, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 18:34:14', '2024-11-07 18:34:14'),
(624, 'default', 'Created a team: Capstone', 'App\\Models\\Team', NULL, 10, 'App\\Models\\User', 48, '{\"name\":\"Capstone\"}', NULL, '2024-11-07 18:35:33', '2024-11-07 18:35:33'),
(625, 'default', 'Created a team: Capstone', 'App\\Models\\Team', NULL, 11, 'App\\Models\\User', 48, '{\"name\":\"Capstone\"}', NULL, '2024-11-07 18:39:07', '2024-11-07 18:39:07'),
(626, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 18:41:06', '2024-11-07 18:41:06'),
(627, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 18:41:15', '2024-11-07 18:41:15'),
(628, 'default', 'Created a team: Capstone', 'App\\Models\\Team', NULL, 12, 'App\\Models\\User', 48, '{\"name\":\"Capstone\"}', NULL, '2024-11-07 18:43:51', '2024-11-07 18:43:51'),
(629, 'default', 'Updated team: Team 3 with changes: Invitations sent to new members: DARYL MANGAYA, Members removed: byen', 'App\\Models\\Team', NULL, 6, 'App\\Models\\User', 39, '{\"changes\":[\"Invitations sent to new members: DARYL MANGAYA\",\"Members removed: byen\"]}', NULL, '2024-11-07 18:45:13', '2024-11-07 18:45:13'),
(630, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 18:48:06', '2024-11-07 18:48:06'),
(631, 'default', 'Updated task: Sample Task with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 49, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-07 18:48:33', '2024-11-07 18:48:33'),
(632, 'default', 'Updated task: Create Responsive Website with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 59, 'App\\Models\\User', 48, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-07 18:49:11', '2024-11-07 18:49:11'),
(633, 'default', 'Task approved: Create Responsive Website', 'App\\Models\\Task', NULL, 59, 'App\\Models\\User', 2, '{\"task_name\":\"Create Responsive Website\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-07 18:49:52', '2024-11-07 18:49:52'),
(634, 'default', 'Task graded: Create Responsive Website as excellent for Vessel', 'App\\Models\\Task', NULL, 59, 'App\\Models\\User', 2, '{\"task_name\":\"Create Responsive Website\",\"grade\":\"excellent\",\"points\":25,\"user\":\"Vessel\"}', NULL, '2024-11-07 18:50:23', '2024-11-07 18:50:23'),
(635, 'default', 'Task graded: Create Responsive Website as excellent for DARYL MANGAYA', 'App\\Models\\Task', NULL, 59, 'App\\Models\\User', 2, '{\"task_name\":\"Create Responsive Website\",\"grade\":\"excellent\",\"points\":25,\"user\":\"DARYL MANGAYA\"}', NULL, '2024-11-07 18:50:23', '2024-11-07 18:50:23'),
(636, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 19:04:56', '2024-11-07 19:04:56'),
(637, 'default', 'Created a reward: First come first serve for team Capstone', 'App\\Models\\Reward', NULL, 7, 'App\\Models\\User', 48, '{\"name\":\"First come first serve\",\"points_required\":\"40\"}', NULL, '2024-11-07 19:12:54', '2024-11-07 19:12:54'),
(638, 'default', 'Updated task: Capstone with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 60, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-07 19:14:06', '2024-11-07 19:14:06'),
(639, 'default', 'Updated task: Capstone with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 60, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-07 19:14:09', '2024-11-07 19:14:09'),
(640, 'default', 'Created a team: Capstone TEAM', 'App\\Models\\Team', NULL, 13, 'App\\Models\\User', 39, '{\"name\":\"Capstone TEAM\"}', NULL, '2024-11-07 19:23:45', '2024-11-07 19:23:45'),
(641, 'default', 'Updated task: Create website with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 61, 'App\\Models\\User', 48, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-07 19:27:40', '2024-11-07 19:27:40'),
(642, 'default', 'Task approved: Create website', 'App\\Models\\Task', NULL, 61, 'App\\Models\\User', 2, '{\"task_name\":\"Create website\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-07 19:28:09', '2024-11-07 19:28:09'),
(643, 'default', 'Task graded: Create website as excellent for Vessel', 'App\\Models\\Task', NULL, 61, 'App\\Models\\User', 2, '{\"task_name\":\"Create website\",\"grade\":\"excellent\",\"points\":25,\"user\":\"Vessel\"}', NULL, '2024-11-07 19:28:18', '2024-11-07 19:28:18'),
(644, 'default', 'Task graded: Create website as excellent for DARYL MANGAYA', 'App\\Models\\Task', NULL, 61, 'App\\Models\\User', 2, '{\"task_name\":\"Create website\",\"grade\":\"excellent\",\"points\":25,\"user\":\"DARYL MANGAYA\"}', NULL, '2024-11-07 19:28:18', '2024-11-07 19:28:18'),
(645, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 19:57:46', '2024-11-07 19:57:46'),
(646, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 20:00:59', '2024-11-07 20:00:59'),
(647, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 20:01:24', '2024-11-07 20:01:24'),
(648, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 20:44:50', '2024-11-07 20:44:50'),
(649, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 40, '[]', NULL, '2024-11-07 20:45:12', '2024-11-07 20:45:12'),
(650, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 70, '[]', NULL, '2024-11-07 20:45:26', '2024-11-07 20:45:26'),
(651, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-07 20:45:50', '2024-11-07 20:45:50'),
(652, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 40, '[]', NULL, '2024-11-07 20:46:34', '2024-11-07 20:46:34'),
(653, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-07 20:49:56', '2024-11-07 20:49:56'),
(654, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-07 20:54:32', '2024-11-07 20:54:32'),
(655, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 21:49:10', '2024-11-07 21:49:10'),
(656, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 21:49:59', '2024-11-07 21:49:59'),
(657, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 21:50:21', '2024-11-07 21:50:21'),
(658, 'default', 'Created a reward: First come first serve for team Team 3', 'App\\Models\\Reward', NULL, 8, 'App\\Models\\User', 39, '{\"name\":\"First come first serve\",\"points_required\":\"40\"}', NULL, '2024-11-07 21:51:12', '2024-11-07 21:51:12'),
(659, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 21:51:51', '2024-11-07 21:51:51'),
(660, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-07 21:53:06', '2024-11-07 21:53:06'),
(661, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 21:53:12', '2024-11-07 21:53:12'),
(662, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 21:53:15', '2024-11-07 21:53:15'),
(663, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 21:56:23', '2024-11-07 21:56:23'),
(664, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 21:56:50', '2024-11-07 21:56:50'),
(665, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-07 21:57:03', '2024-11-07 21:57:03'),
(666, 'default', 'Deleted the reward: First come first serve from team Team 3', 'App\\Models\\Reward', NULL, 8, 'App\\Models\\User', 39, '{\"name\":\"First come first serve\"}', NULL, '2024-11-07 21:57:14', '2024-11-07 21:57:14'),
(667, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-07 22:39:28', '2024-11-07 22:39:28'),
(668, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 22:44:52', '2024-11-07 22:44:52'),
(669, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 22:47:30', '2024-11-07 22:47:30'),
(670, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 22:47:45', '2024-11-07 22:47:45'),
(671, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 22:48:43', '2024-11-07 22:48:43'),
(672, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 23:08:46', '2024-11-07 23:08:46'),
(673, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 23:08:53', '2024-11-07 23:08:53'),
(674, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 23:13:42', '2024-11-07 23:13:42'),
(675, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 23:13:48', '2024-11-07 23:13:48'),
(676, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 23:45:49', '2024-11-07 23:45:49'),
(677, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 23:45:55', '2024-11-07 23:45:55'),
(678, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 23:54:50', '2024-11-07 23:54:50'),
(679, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 23:54:56', '2024-11-07 23:54:56'),
(680, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-07 23:58:51', '2024-11-07 23:58:51'),
(681, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-07 23:58:57', '2024-11-07 23:58:57'),
(682, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 00:06:43', '2024-11-08 00:06:43'),
(683, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 00:06:49', '2024-11-08 00:06:49'),
(684, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 00:19:41', '2024-11-08 00:19:41'),
(685, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 00:22:35', '2024-11-08 00:22:35'),
(686, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 00:28:04', '2024-11-08 00:28:04'),
(687, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-08 00:28:18', '2024-11-08 00:28:18'),
(688, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 00:50:44', '2024-11-08 00:50:44'),
(689, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 00:50:57', '2024-11-08 00:50:57'),
(690, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-08 01:01:26', '2024-11-08 01:01:26'),
(691, 'default', 'Updated task: Create wireframe with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 1, 'App\\Models\\User', 37, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-08 01:19:46', '2024-11-08 01:19:46'),
(692, 'default', 'Updated task: Create a ppt presentation with changes: Due date changed from \'2024-11-10 00:00:00\' to \'2024-11-10 00:00:00\'', 'App\\Models\\Task', NULL, 52, 'App\\Models\\User', 37, '{\"changes\":[\"Due date changed from \'2024-11-10 00:00:00\' to \'2024-11-10 00:00:00\'\"]}', NULL, '2024-11-08 01:22:54', '2024-11-08 01:22:54'),
(693, 'default', 'Updated task: Make a report with changes: Due date changed from \'2024-11-10 00:00:00\' to \'2024-11-10 00:00:00\'', 'App\\Models\\Task', NULL, 53, 'App\\Models\\User', 37, '{\"changes\":[\"Due date changed from \'2024-11-10 00:00:00\' to \'2024-11-10 00:00:00\'\"]}', NULL, '2024-11-08 01:23:15', '2024-11-08 01:23:15'),
(694, 'default', 'Updated task: SQA with changes: Due date changed from \'2024-11-10 00:00:00\' to \'2024-11-10 00:00:00\'', 'App\\Models\\Task', NULL, 51, 'App\\Models\\User', 37, '{\"changes\":[\"Due date changed from \'2024-11-10 00:00:00\' to \'2024-11-10 00:00:00\'\"]}', NULL, '2024-11-08 01:23:41', '2024-11-08 01:23:41'),
(695, 'default', 'Updated task: Create a ppt presentation with changes: Due date changed from \'2024-11-28 00:00:00\' to \'2024-11-28 00:00:00\'', 'App\\Models\\Task', NULL, 52, 'App\\Models\\User', 37, '{\"changes\":[\"Due date changed from \'2024-11-28 00:00:00\' to \'2024-11-28 00:00:00\'\"]}', NULL, '2024-11-08 01:24:40', '2024-11-08 01:24:40'),
(696, 'default', 'Updated task: SQA with changes: Due date changed from \'2024-11-23 00:00:00\' to \'2024-11-23 00:00:00\'', 'App\\Models\\Task', NULL, 51, 'App\\Models\\User', 37, '{\"changes\":[\"Due date changed from \'2024-11-23 00:00:00\' to \'2024-11-23 00:00:00\'\"]}', NULL, '2024-11-08 01:24:56', '2024-11-08 01:24:56'),
(697, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 01:30:58', '2024-11-08 01:30:58'),
(698, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 01:31:05', '2024-11-08 01:31:05'),
(699, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 09:00:20', '2024-11-08 09:00:20'),
(700, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 09:02:20', '2024-11-08 09:02:20'),
(701, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 09:02:26', '2024-11-08 09:02:26'),
(702, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 09:26:09', '2024-11-08 09:26:09'),
(703, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 09:26:16', '2024-11-08 09:26:16'),
(704, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 09:27:46', '2024-11-08 09:27:46'),
(705, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 09:30:07', '2024-11-08 09:30:07'),
(706, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 09:32:17', '2024-11-08 09:32:17'),
(707, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 09:32:25', '2024-11-08 09:32:25'),
(708, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 09:33:20', '2024-11-08 09:33:20'),
(709, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 09:33:26', '2024-11-08 09:33:26'),
(710, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 09:34:01', '2024-11-08 09:34:01'),
(711, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 09:45:32', '2024-11-08 09:45:32'),
(712, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 10:19:50', '2024-11-08 10:19:50'),
(713, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 10:19:58', '2024-11-08 10:19:58'),
(714, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 10:22:18', '2024-11-08 10:22:18'),
(715, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:05:50', '2024-11-08 18:05:50'),
(716, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:09:12', '2024-11-08 18:09:12'),
(717, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:11:58', '2024-11-08 18:11:58'),
(718, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:23:45', '2024-11-08 18:23:45'),
(719, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-08 18:24:12', '2024-11-08 18:24:12'),
(720, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:26:27', '2024-11-08 18:26:27'),
(721, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:31:07', '2024-11-08 18:31:07'),
(722, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:35:56', '2024-11-08 18:35:56'),
(723, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 39, '[]', NULL, '2024-11-08 18:39:41', '2024-11-08 18:39:41'),
(724, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 39, '[]', NULL, '2024-11-08 18:39:46', '2024-11-08 18:39:46'),
(725, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:47:51', '2024-11-08 18:47:51'),
(726, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:50:41', '2024-11-08 18:50:41'),
(727, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:51:54', '2024-11-08 18:51:54'),
(728, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:52:11', '2024-11-08 18:52:11'),
(729, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:54:30', '2024-11-08 18:54:30'),
(730, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:55:16', '2024-11-08 18:55:16'),
(731, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:55:57', '2024-11-08 18:55:57'),
(732, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:56:38', '2024-11-08 18:56:38'),
(733, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:56:42', '2024-11-08 18:56:42'),
(734, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:56:46', '2024-11-08 18:56:46'),
(735, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:56:48', '2024-11-08 18:56:48'),
(736, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:56:50', '2024-11-08 18:56:50'),
(737, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:56:51', '2024-11-08 18:56:51'),
(738, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:56:52', '2024-11-08 18:56:52'),
(739, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:58:03', '2024-11-08 18:58:03'),
(740, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 18:58:56', '2024-11-08 18:58:56'),
(741, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:00:21', '2024-11-08 19:00:21'),
(742, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:00:25', '2024-11-08 19:00:25'),
(743, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:01:34', '2024-11-08 19:01:34'),
(744, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:01:49', '2024-11-08 19:01:49'),
(745, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:01:59', '2024-11-08 19:01:59'),
(746, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:02:41', '2024-11-08 19:02:41'),
(747, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:04:03', '2024-11-08 19:04:03'),
(748, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:04:36', '2024-11-08 19:04:36'),
(749, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:04:47', '2024-11-08 19:04:47'),
(750, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:06:35', '2024-11-08 19:06:35'),
(751, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:08:41', '2024-11-08 19:08:41'),
(752, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:08:53', '2024-11-08 19:08:53'),
(753, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:11', '2024-11-08 19:10:11'),
(754, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:15', '2024-11-08 19:10:15'),
(755, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:16', '2024-11-08 19:10:16'),
(756, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:17', '2024-11-08 19:10:17'),
(757, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:18', '2024-11-08 19:10:18'),
(758, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:19', '2024-11-08 19:10:19'),
(759, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:19', '2024-11-08 19:10:19'),
(760, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:22', '2024-11-08 19:10:22'),
(761, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:23', '2024-11-08 19:10:23'),
(762, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:24', '2024-11-08 19:10:24'),
(763, 'default', 'Viewed activity log of byen by Vessel', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:10:24', '2024-11-08 19:10:24'),
(764, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:23:09', '2024-11-08 19:23:09'),
(765, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:23:17', '2024-11-08 19:23:17'),
(766, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 37, '[]', NULL, '2024-11-08 19:24:48', '2024-11-08 19:24:48'),
(767, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 37, '[]', NULL, '2024-11-08 19:24:51', '2024-11-08 19:24:51'),
(768, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 37, '[]', NULL, '2024-11-08 19:24:53', '2024-11-08 19:24:53'),
(769, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 37, '[]', NULL, '2024-11-08 19:24:55', '2024-11-08 19:24:55'),
(770, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 37, '[]', NULL, '2024-11-08 19:24:57', '2024-11-08 19:24:57'),
(771, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 37, '[]', NULL, '2024-11-08 19:24:58', '2024-11-08 19:24:58'),
(772, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:25:11', '2024-11-08 19:25:11'),
(773, 'default', 'Viewed activity log of taurus', 'App\\Models\\User', NULL, 64, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 19:25:27', '2024-11-08 19:25:27'),
(774, 'default', 'Viewed activity log of taurus', 'App\\Models\\User', NULL, 64, 'App\\Models\\User', 39, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:34:27', '2024-11-08 19:34:27'),
(775, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:40:58', '2024-11-08 19:40:58'),
(776, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:42:14', '2024-11-08 19:42:14'),
(777, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:42:42', '2024-11-08 19:42:42'),
(778, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:44:35', '2024-11-08 19:44:35'),
(779, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:45:06', '2024-11-08 19:45:06'),
(780, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:45:21', '2024-11-08 19:45:21'),
(781, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:45:48', '2024-11-08 19:45:48'),
(782, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:47:06', '2024-11-08 19:47:06'),
(783, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:47:12', '2024-11-08 19:47:12'),
(784, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:47:15', '2024-11-08 19:47:15'),
(785, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:47:58', '2024-11-08 19:47:58'),
(786, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:48:35', '2024-11-08 19:48:35'),
(787, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:52:33', '2024-11-08 19:52:33'),
(788, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:52:39', '2024-11-08 19:52:39'),
(789, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:52:41', '2024-11-08 19:52:41'),
(790, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:53:35', '2024-11-08 19:53:35'),
(791, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:53:43', '2024-11-08 19:53:43'),
(792, 'default', 'Updated task: Site map with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 62, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-08 19:54:14', '2024-11-08 19:54:14'),
(793, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:54:21', '2024-11-08 19:54:21'),
(794, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 19:54:23', '2024-11-08 19:54:23'),
(795, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 20:00:50', '2024-11-08 20:00:50'),
(796, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 20:02:33', '2024-11-08 20:02:33'),
(797, 'default', 'Updated task: Build a sorting system with changes: Status changed from \'in progress\' to \'not started\'', 'App\\Models\\Task', NULL, 2, 'App\\Models\\User', 38, '{\"changes\":[\"Status changed from \'in progress\' to \'not started\'\"]}', NULL, '2024-11-08 20:06:55', '2024-11-08 20:06:55'),
(798, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 21:19:55', '2024-11-08 21:19:55'),
(799, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 21:20:01', '2024-11-08 21:20:01'),
(800, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 2, '{\"team\":\"Avengers\"}', NULL, '2024-11-08 22:17:44', '2024-11-08 22:17:44'),
(801, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-08 22:30:26', '2024-11-08 22:30:26'),
(802, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 22:30:31', '2024-11-08 22:30:31'),
(803, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-08 22:53:39', '2024-11-08 22:53:39'),
(804, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 23:20:39', '2024-11-08 23:20:39'),
(805, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 23:36:26', '2024-11-08 23:36:26'),
(806, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-08 23:39:35', '2024-11-08 23:39:35'),
(807, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-09 00:35:54', '2024-11-09 00:35:54'),
(808, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 00:35:59', '2024-11-09 00:35:59'),
(809, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 00:54:47', '2024-11-09 00:54:47'),
(810, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-09 00:55:45', '2024-11-09 00:55:45'),
(811, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 00:55:54', '2024-11-09 00:55:54'),
(812, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 00:56:34', '2024-11-09 00:56:34'),
(813, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-09 01:53:57', '2024-11-09 01:53:57'),
(814, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 02:42:39', '2024-11-09 02:42:39'),
(815, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 04:46:33', '2024-11-09 04:46:33'),
(816, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 2, '{\"team\":\"New Order of the stones\"}', NULL, '2024-11-09 06:15:15', '2024-11-09 06:15:15'),
(817, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 2, '{\"team\":\"New Order of the stones\"}', NULL, '2024-11-09 06:15:22', '2024-11-09 06:15:22'),
(818, 'default', 'Task approved: loki', 'App\\Models\\Task', NULL, 56, 'App\\Models\\User', 2, '{\"task_name\":\"loki\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-09 07:22:17', '2024-11-09 07:22:17'),
(819, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 07:23:06', '2024-11-09 07:23:06'),
(820, 'default', 'Updated task: Distribute the survey with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 4, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-09 07:23:48', '2024-11-09 07:23:48'),
(821, 'default', 'Updated task: Capstone with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 64, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-09 07:25:02', '2024-11-09 07:25:02'),
(822, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 08:01:36', '2024-11-09 08:01:36'),
(823, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 08:01:50', '2024-11-09 08:01:50'),
(824, 'default', 'Task rejected: Capstone', 'App\\Models\\Task', NULL, 64, 'App\\Models\\User', 38, '{\"task_name\":\"Capstone\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"I have noticed the discrepancy in your reports, please redo this.\"}', NULL, '2024-11-09 08:02:47', '2024-11-09 08:02:47'),
(825, 'default', 'Resubmitted task for approval: Capstone', 'App\\Models\\Task', NULL, 64, 'App\\Models\\User', 39, '{\"approval_status\":\"pending\"}', NULL, '2024-11-09 08:03:26', '2024-11-09 08:03:26'),
(826, 'default', 'Updated task: Capstone with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 64, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-09 08:03:31', '2024-11-09 08:03:31'),
(827, 'default', 'Task approved: Capstone', 'App\\Models\\Task', NULL, 64, 'App\\Models\\User', 38, '{\"task_name\":\"Capstone\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-09 08:03:42', '2024-11-09 08:03:42'),
(828, 'default', 'Updated task: approve with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 65, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-09 08:26:59', '2024-11-09 08:26:59'),
(829, 'default', 'Task rejected: approve', 'App\\Models\\Task', NULL, 65, 'App\\Models\\User', 38, '{\"task_name\":\"approve\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"redo this\"}', NULL, '2024-11-09 08:28:02', '2024-11-09 08:28:02'),
(830, 'default', 'Resubmitted task for approval: approve', 'App\\Models\\Task', NULL, 65, 'App\\Models\\User', 39, '{\"approval_status\":\"pending\"}', NULL, '2024-11-09 08:28:15', '2024-11-09 08:28:15'),
(831, 'default', 'Updated task: approve with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 65, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-09 08:28:26', '2024-11-09 08:28:26'),
(832, 'default', 'Task approved: approve', 'App\\Models\\Task', NULL, 65, 'App\\Models\\User', 38, '{\"task_name\":\"approve\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-09 08:28:37', '2024-11-09 08:28:37'),
(833, 'default', 'Updated task: test with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 66, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-09 08:37:28', '2024-11-09 08:37:28'),
(834, 'default', 'Task rejected: test', 'App\\Models\\Task', NULL, 66, 'App\\Models\\User', 38, '{\"task_name\":\"test\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"1\"}', NULL, '2024-11-09 08:37:49', '2024-11-09 08:37:49'),
(835, 'default', 'Resubmitted task for approval: test', 'App\\Models\\Task', NULL, 66, 'App\\Models\\User', 39, '{\"approval_status\":\"pending\"}', NULL, '2024-11-09 08:37:53', '2024-11-09 08:37:53'),
(836, 'default', 'Updated task: test with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 66, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-09 08:37:58', '2024-11-09 08:37:58'),
(837, 'default', 'Task approved: test', 'App\\Models\\Task', NULL, 66, 'App\\Models\\User', 38, '{\"task_name\":\"test\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-09 08:38:02', '2024-11-09 08:38:02'),
(838, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 08:49:33', '2024-11-09 08:49:33'),
(839, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 08:49:38', '2024-11-09 08:49:38'),
(840, 'default', 'Task deleted: asana', 'App\\Models\\Task', NULL, 36, 'App\\Models\\User', 38, '{\"name\":\"asana\",\"description\":null}', NULL, '2024-11-09 09:36:05', '2024-11-09 09:36:05'),
(841, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 09:36:15', '2024-11-09 09:36:15'),
(842, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 09:36:19', '2024-11-09 09:36:19'),
(843, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 11:47:48', '2024-11-09 11:47:48');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(844, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 11:50:53', '2024-11-09 11:50:53'),
(845, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 11:52:42', '2024-11-09 11:52:42'),
(846, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 12:03:01', '2024-11-09 12:03:01'),
(847, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 12:03:43', '2024-11-09 12:03:43'),
(848, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 13:41:23', '2024-11-09 13:41:23'),
(849, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 14:29:44', '2024-11-09 14:29:44'),
(850, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 14:30:26', '2024-11-09 14:30:26'),
(851, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 14:57:45', '2024-11-09 14:57:45'),
(852, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 2, '{\"team\":\"Avengers\"}', NULL, '2024-11-09 14:57:56', '2024-11-09 14:57:56'),
(853, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 14:58:06', '2024-11-09 14:58:06'),
(854, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 15:00:45', '2024-11-09 15:00:45'),
(855, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-09 15:01:09', '2024-11-09 15:01:09'),
(856, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 38, '{\"team\":\"Avengers\"}', NULL, '2024-11-09 15:01:22', '2024-11-09 15:01:22'),
(857, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 15:09:46', '2024-11-09 15:09:46'),
(858, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 15:09:52', '2024-11-09 15:09:52'),
(859, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 2, '{\"team\":\"Avengers\"}', NULL, '2024-11-09 15:31:01', '2024-11-09 15:31:01'),
(860, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 15:32:30', '2024-11-09 15:32:30'),
(861, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 2, '{\"team\":\"New Order of the stones\"}', NULL, '2024-11-09 15:36:21', '2024-11-09 15:36:21'),
(862, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 16:00:52', '2024-11-09 16:00:52'),
(863, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 16:00:59', '2024-11-09 16:00:59'),
(864, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 16:01:39', '2024-11-09 16:01:39'),
(865, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 16:01:44', '2024-11-09 16:01:44'),
(866, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 16:02:02', '2024-11-09 16:02:02'),
(867, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-09 16:15:12', '2024-11-09 16:15:12'),
(868, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 16:15:16', '2024-11-09 16:15:16'),
(869, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 16:20:42', '2024-11-09 16:20:42'),
(870, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-09 16:34:28', '2024-11-09 16:34:28'),
(871, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-09 16:43:38', '2024-11-09 16:43:38'),
(872, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 16:43:42', '2024-11-09 16:43:42'),
(873, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 16:43:55', '2024-11-09 16:43:55'),
(874, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 17:09:02', '2024-11-09 17:09:02'),
(875, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 17:20:12', '2024-11-09 17:20:12'),
(876, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 17:20:19', '2024-11-09 17:20:19'),
(877, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 17:28:21', '2024-11-09 17:28:21'),
(878, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 17:49:40', '2024-11-09 17:49:40'),
(879, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 17:49:55', '2024-11-09 17:49:55'),
(880, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 18:01:26', '2024-11-09 18:01:26'),
(881, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 18:06:11', '2024-11-09 18:06:11'),
(882, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 18:06:52', '2024-11-09 18:06:52'),
(883, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 18:10:41', '2024-11-09 18:10:41'),
(884, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 18:12:14', '2024-11-09 18:12:14'),
(885, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 18:12:22', '2024-11-09 18:12:22'),
(886, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 18:13:00', '2024-11-09 18:13:00'),
(887, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 18:13:02', '2024-11-09 18:13:02'),
(888, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 18:14:42', '2024-11-09 18:14:42'),
(889, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 18:14:49', '2024-11-09 18:14:49'),
(890, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-09 18:19:21', '2024-11-09 18:19:21'),
(891, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 18:19:27', '2024-11-09 18:19:27'),
(892, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 18:24:03', '2024-11-09 18:24:03'),
(893, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 19:53:50', '2024-11-09 19:53:50'),
(894, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 19:53:54', '2024-11-09 19:53:54'),
(895, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 19:58:02', '2024-11-09 19:58:02'),
(896, 'default', 'Created a task: SQA', 'App\\Models\\Task', NULL, 67, 'App\\Models\\User', 37, '{\"name\":\"SQA\"}', NULL, '2024-11-09 21:12:54', '2024-11-09 21:12:54'),
(897, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 21:20:14', '2024-11-09 21:20:14'),
(898, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-09 21:24:13', '2024-11-09 21:24:13'),
(899, 'default', 'Created a task: Past Due Date', 'App\\Models\\Task', NULL, 68, 'App\\Models\\User', 37, '{\"name\":\"Past Due Date\"}', NULL, '2024-11-09 21:25:21', '2024-11-09 21:25:21'),
(900, 'default', 'Task approved: Capstone', 'App\\Models\\Task', NULL, 60, 'App\\Models\\User', 2, '{\"task_name\":\"Capstone\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-09 21:51:45', '2024-11-09 21:51:45'),
(901, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 22:11:34', '2024-11-09 22:11:34'),
(902, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-09 22:17:50', '2024-11-09 22:17:50'),
(903, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 22:17:54', '2024-11-09 22:17:54'),
(904, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 22:22:00', '2024-11-09 22:22:00'),
(905, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-09 22:32:30', '2024-11-09 22:32:30'),
(906, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-09 22:47:28', '2024-11-09 22:47:28'),
(907, 'default', 'Created a task: 1', 'App\\Models\\Task', NULL, 69, 'App\\Models\\User', 38, '{\"name\":\"1\"}', NULL, '2024-11-09 23:32:42', '2024-11-09 23:32:42'),
(908, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 23:43:44', '2024-11-09 23:43:44'),
(909, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 23:43:49', '2024-11-09 23:43:49'),
(910, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-09 23:56:50', '2024-11-09 23:56:50'),
(911, 'default', 'Updated task: 12 with changes: Task name changed from \'12\' to \'12\'', 'App\\Models\\Task', NULL, 69, 'App\\Models\\User', 38, '{\"changes\":[\"Task name changed from \'12\' to \'12\'\"]}', NULL, '2024-11-10 00:00:36', '2024-11-10 00:00:36'),
(912, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 00:03:26', '2024-11-10 00:03:26'),
(913, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 00:04:20', '2024-11-10 00:04:20'),
(914, 'default', 'Created a task: pilk', 'App\\Models\\Task', NULL, 70, 'App\\Models\\User', 38, '{\"name\":\"pilk\"}', NULL, '2024-11-10 00:05:32', '2024-11-10 00:05:32'),
(915, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 00:10:19', '2024-11-10 00:10:19'),
(916, 'default', 'Created a team: ilkwreutygo45it78y5784tglukjg5487oiulghp59854giuh87g yu56ihg895ty8956ythufgi7854ouiglhb53o8745w5toguilbj5w78fgoyuh5tp9v7yghuigy89ioh54gtr89pyuhijngv90ujoei', 'App\\Models\\Team', NULL, 14, 'App\\Models\\User', 37, '{\"name\":\"ilkwreutygo45it78y5784tglukjg5487oiulghp59854giuh87g yu56ihg895ty8956ythufgi7854ouiglhb53o8745w5toguilbj5w78fgoyuh5tp9v7yghuigy89ioh54gtr89pyuhijngv90ujoei\"}', NULL, '2024-11-10 00:56:52', '2024-11-10 00:56:52'),
(917, 'default', 'Created a team: Site map', 'App\\Models\\Team', NULL, 15, 'App\\Models\\User', 37, '{\"name\":\"Site map\"}', NULL, '2024-11-10 01:02:53', '2024-11-10 01:02:53'),
(918, 'default', 'Updated team: Site map with changes: Invitations sent to new members: test, Members removed: Derick Pangilinan', 'App\\Models\\Team', NULL, 15, 'App\\Models\\User', 37, '{\"changes\":[\"Invitations sent to new members: test\",\"Members removed: Derick Pangilinan\"]}', NULL, '2024-11-10 01:06:36', '2024-11-10 01:06:36'),
(919, 'default', 'Created a team: Testers', 'App\\Models\\Team', NULL, 16, 'App\\Models\\User', 37, '{\"name\":\"Testers\"}', NULL, '2024-11-10 01:08:08', '2024-11-10 01:08:08'),
(920, 'default', 'Created a team: 65747fd6y4!@#$%^&', 'App\\Models\\Team', NULL, 17, 'App\\Models\\User', 37, '{\"name\":\"65747fd6y4!@#$%^&\"}', NULL, '2024-11-10 03:05:54', '2024-11-10 03:05:54'),
(921, 'default', 'Updated task: Create a ppt presentation with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 52, 'App\\Models\\User', 2, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-10 03:09:51', '2024-11-10 03:09:51'),
(922, 'default', 'Updated task: Create website with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 55, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-10 03:10:43', '2024-11-10 03:10:43'),
(923, 'default', 'Created a task: Keyboard', 'App\\Models\\Task', NULL, 71, 'App\\Models\\User', 39, '{\"name\":\"Keyboard\"}', NULL, '2024-11-10 03:11:44', '2024-11-10 03:11:44'),
(924, 'default', 'Updated task: Do chapter 4 with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 5, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-10 03:12:49', '2024-11-10 03:12:49'),
(925, 'default', 'Updated task: Do chapter 4 with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 5, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-10 03:13:33', '2024-11-10 03:13:33'),
(926, 'default', 'Updated task: Build a sorting system with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 2, 'App\\Models\\User', 2, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-10 03:14:32', '2024-11-10 03:14:32'),
(927, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-10 03:15:39', '2024-11-10 03:15:39'),
(928, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-10 03:15:51', '2024-11-10 03:15:51'),
(929, 'default', 'Updated task: KEYBOARD with changes: Status changed from \'not started\' to \'done\'', 'App\\Models\\Task', NULL, 72, 'App\\Models\\User', 39, '{\"changes\":[\"Status changed from \'not started\' to \'done\'\"]}', NULL, '2024-11-10 03:18:06', '2024-11-10 03:18:06'),
(930, 'default', 'Created a team: Max', 'App\\Models\\Team', NULL, 18, 'App\\Models\\User', 37, '{\"name\":\"Max\"}', NULL, '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(931, 'default', 'Created a team: Site map', 'App\\Models\\Team', NULL, 19, 'App\\Models\\User', 37, '{\"name\":\"Site map\"}', NULL, '2024-11-10 03:22:42', '2024-11-10 03:22:42'),
(932, 'default', 'Updated team: Site map with changes: Invitations sent to new members: byen, Members removed: Derick Pangilinan', 'App\\Models\\Team', NULL, 19, 'App\\Models\\User', 37, '{\"changes\":[\"Invitations sent to new members: byen\",\"Members removed: Derick Pangilinan\"]}', NULL, '2024-11-10 03:24:14', '2024-11-10 03:24:14'),
(933, 'default', 'Updated team: Max with changes: Invitations sent to new members: byen, Members removed: Derick Pangilinan', 'App\\Models\\Team', NULL, 18, 'App\\Models\\User', 37, '{\"changes\":[\"Invitations sent to new members: byen\",\"Members removed: Derick Pangilinan\"]}', NULL, '2024-11-10 03:24:49', '2024-11-10 03:24:49'),
(934, 'default', 'Created a team: Site map', 'App\\Models\\Team', NULL, 20, 'App\\Models\\User', 37, '{\"name\":\"Site map\"}', NULL, '2024-11-10 03:57:45', '2024-11-10 03:57:45'),
(935, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 08:56:27', '2024-11-10 08:56:27'),
(936, 'default', 'Created a task: filetype', 'App\\Models\\Task', NULL, 73, 'App\\Models\\User', 38, '{\"name\":\"filetype\"}', NULL, '2024-11-10 09:03:24', '2024-11-10 09:03:24'),
(937, 'default', 'Created a team: collaor', 'App\\Models\\Team', NULL, 21, 'App\\Models\\User', 38, '{\"name\":\"collaor\"}', NULL, '2024-11-10 09:12:12', '2024-11-10 09:12:12'),
(938, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-10 09:12:33', '2024-11-10 09:12:33'),
(939, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-10 09:16:13', '2024-11-10 09:16:13'),
(940, 'default', 'Created a team: asdasd', 'App\\Models\\Team', NULL, 22, 'App\\Models\\User', 38, '{\"name\":\"asdasd\"}', NULL, '2024-11-10 09:21:49', '2024-11-10 09:21:49'),
(941, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-10 09:23:46', '2024-11-10 09:23:46'),
(942, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-10 09:24:01', '2024-11-10 09:24:01'),
(943, 'default', 'Task deleted: 12', 'App\\Models\\Task', NULL, 69, 'App\\Models\\User', 38, '{\"name\":\"12\",\"description\":null}', NULL, '2024-11-10 09:25:06', '2024-11-10 09:25:06'),
(944, 'default', 'Task deleted: filetype', 'App\\Models\\Task', NULL, 73, 'App\\Models\\User', 38, '{\"name\":\"filetype\",\"description\":null}', NULL, '2024-11-10 09:25:11', '2024-11-10 09:25:11'),
(945, 'default', 'Task deleted: pilk', 'App\\Models\\Task', NULL, 70, 'App\\Models\\User', 38, '{\"name\":\"pilk\",\"description\":null}', NULL, '2024-11-10 09:25:18', '2024-11-10 09:25:18'),
(946, 'default', 'Task deleted: css editing', 'App\\Models\\Task', NULL, 35, 'App\\Models\\User', 38, '{\"name\":\"css editing\",\"description\":null}', NULL, '2024-11-10 09:25:24', '2024-11-10 09:25:24'),
(947, 'default', 'Task deleted: final', 'App\\Models\\Task', NULL, 45, 'App\\Models\\User', 38, '{\"name\":\"final\",\"description\":null}', NULL, '2024-11-10 09:25:29', '2024-11-10 09:25:29'),
(948, 'default', 'Task deleted: Create a ppt presentation', 'App\\Models\\Task', NULL, 52, 'App\\Models\\User', 38, '{\"name\":\"Create a ppt presentation\",\"description\":\"Create a ppt presentation about the sqa file.\"}', NULL, '2024-11-10 09:25:36', '2024-11-10 09:25:36'),
(949, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 09:34:20', '2024-11-10 09:34:20'),
(950, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-10 09:35:11', '2024-11-10 09:35:11'),
(951, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-10 09:35:23', '2024-11-10 09:35:23'),
(952, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-10 09:35:32', '2024-11-10 09:35:32'),
(953, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 09:42:36', '2024-11-10 09:42:36'),
(954, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 09:44:11', '2024-11-10 09:44:11'),
(955, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 11:23:45', '2024-11-10 11:23:45'),
(956, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 11:33:47', '2024-11-10 11:33:47'),
(957, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-10 11:33:56', '2024-11-10 11:33:56'),
(958, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 11:38:05', '2024-11-10 11:38:05'),
(959, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 11:45:08', '2024-11-10 11:45:08'),
(960, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 2, '{\"team\":\"Avengers\"}', NULL, '2024-11-10 11:45:21', '2024-11-10 11:45:21'),
(961, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-10 11:45:54', '2024-11-10 11:45:54'),
(962, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 13:35:58', '2024-11-10 13:35:58'),
(963, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-10 13:36:10', '2024-11-10 13:36:10'),
(964, 'default', 'Task deleted: approve', 'App\\Models\\Task', NULL, 65, 'App\\Models\\User', 38, '{\"name\":\"approve\",\"description\":null}', NULL, '2024-11-10 13:36:37', '2024-11-10 13:36:37'),
(965, 'default', 'Task deleted: Capstone', 'App\\Models\\Task', NULL, 64, 'App\\Models\\User', 38, '{\"name\":\"Capstone\",\"description\":null}', NULL, '2024-11-10 13:36:40', '2024-11-10 13:36:40'),
(966, 'default', 'Updated team: Avengers with changes: Invitations sent to new members: byen, Members removed: Vessel', 'App\\Models\\Team', NULL, 2, 'App\\Models\\User', 38, '{\"changes\":[\"Invitations sent to new members: byen\",\"Members removed: Vessel\"]}', NULL, '2024-11-10 13:41:43', '2024-11-10 13:41:43'),
(967, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-10 13:42:13', '2024-11-10 13:42:13'),
(968, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 13:42:17', '2024-11-10 13:42:17'),
(969, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 13:45:47', '2024-11-10 13:45:47'),
(970, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-10 13:46:37', '2024-11-10 13:46:37'),
(971, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-10 16:58:48', '2024-11-10 16:58:48'),
(972, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-10 22:09:41', '2024-11-10 22:09:41'),
(973, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-10 22:09:49', '2024-11-10 22:09:49'),
(974, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-10 22:09:55', '2024-11-10 22:09:55'),
(975, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-11 18:27:42', '2024-11-11 18:27:42'),
(976, 'default', 'Created a team: COLLABORATASK', 'App\\Models\\Team', NULL, 23, 'App\\Models\\User', 38, '{\"name\":\"COLLABORATASK\"}', NULL, '2024-11-11 18:29:36', '2024-11-11 18:29:36'),
(977, 'default', 'Created a reward: Iced Coffee for team COLLABORATASK', 'App\\Models\\Reward', NULL, 9, 'App\\Models\\User', 38, '{\"name\":\"Iced Coffee\",\"points_required\":\"50\"}', NULL, '2024-11-11 18:30:42', '2024-11-11 18:30:42'),
(978, 'default', 'Created a reward: Creamy Chicken for team COLLABORATASK', 'App\\Models\\Reward', NULL, 10, 'App\\Models\\User', 38, '{\"name\":\"Creamy Chicken\",\"points_required\":\"50\"}', NULL, '2024-11-11 18:32:16', '2024-11-11 18:32:16'),
(979, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-11 18:33:14', '2024-11-11 18:33:14'),
(980, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-11 18:34:14', '2024-11-11 18:34:14'),
(981, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-11 18:34:20', '2024-11-11 18:34:20'),
(982, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-11 18:35:12', '2024-11-11 18:35:12'),
(983, 'default', 'Created a team: Hello', 'App\\Models\\Team', NULL, 24, 'App\\Models\\User', 38, '{\"name\":\"Hello\"}', NULL, '2024-11-11 19:16:36', '2024-11-11 19:16:36'),
(984, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-11 19:17:49', '2024-11-11 19:17:49'),
(985, 'default', 'Created a team: asana', 'App\\Models\\Team', NULL, 25, 'App\\Models\\User', 38, '{\"name\":\"asana\"}', NULL, '2024-11-11 19:18:04', '2024-11-11 19:18:04'),
(986, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-11 19:21:28', '2024-11-11 19:21:28'),
(987, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-11 19:39:10', '2024-11-11 19:39:10'),
(988, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-11 22:10:45', '2024-11-11 22:10:45'),
(989, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-11 22:11:02', '2024-11-11 22:11:02'),
(990, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-12 01:42:35', '2024-11-12 01:42:35'),
(991, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 01:45:10', '2024-11-12 01:45:10'),
(992, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 01:48:37', '2024-11-12 01:48:37'),
(993, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-12 08:21:53', '2024-11-12 08:21:53'),
(994, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-12 08:23:09', '2024-11-12 08:23:09'),
(995, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 37, '[]', NULL, '2024-11-12 08:23:50', '2024-11-12 08:23:50'),
(996, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 08:35:17', '2024-11-12 08:35:17'),
(997, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 08:35:29', '2024-11-12 08:35:29'),
(998, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-12 08:35:48', '2024-11-12 08:35:48'),
(999, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 09:02:10', '2024-11-12 09:02:10'),
(1000, 'default', 'Updated the reward: Iced Coffee for team COLLABORATASK', 'App\\Models\\Reward', NULL, 9, 'App\\Models\\User', 38, '{\"name\":\"Iced Coffee\",\"points_required\":\"50\"}', NULL, '2024-11-12 09:06:29', '2024-11-12 09:06:29'),
(1001, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 09:13:47', '2024-11-12 09:13:47'),
(1002, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-12 09:13:58', '2024-11-12 09:13:58'),
(1003, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-12 09:14:10', '2024-11-12 09:14:10'),
(1004, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 09:14:39', '2024-11-12 09:14:39'),
(1005, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-12 09:14:49', '2024-11-12 09:14:49'),
(1006, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-12 09:14:58', '2024-11-12 09:14:58'),
(1007, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-12 09:15:43', '2024-11-12 09:15:43'),
(1008, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 09:15:54', '2024-11-12 09:15:54'),
(1009, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 09:17:15', '2024-11-12 09:17:15'),
(1010, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 09:27:02', '2024-11-12 09:27:02'),
(1011, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 38, '[]', NULL, '2024-11-12 10:15:26', '2024-11-12 10:15:26'),
(1012, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-12 10:26:36', '2024-11-12 10:26:36'),
(1013, 'default', 'Updated team: COLLABORATASK with changes: Invitations sent to new members: taurus, Members removed: Vessel', 'App\\Models\\Team', NULL, 23, 'App\\Models\\User', 38, '{\"changes\":[\"Invitations sent to new members: taurus\",\"Members removed: Vessel\"]}', NULL, '2024-11-12 10:28:25', '2024-11-12 10:28:25'),
(1014, 'default', 'Updated task: Create and upload logo with changes: Status changed from \'not started\' to \'in progress\'', 'App\\Models\\Task', NULL, 75, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'not started\' to \'in progress\'\"]}', NULL, '2024-11-12 10:33:51', '2024-11-12 10:33:51'),
(1015, 'default', 'Updated task: Create and upload logo with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 75, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-12 10:34:22', '2024-11-12 10:34:22'),
(1016, 'default', 'Task rejected: Create and upload logo', 'App\\Models\\Task', NULL, 75, 'App\\Models\\User', 38, '{\"task_name\":\"Create and upload logo\",\"approval_status\":\"rejected\",\"rejection_remarks\":\"Please redo this task.\"}', NULL, '2024-11-12 10:35:39', '2024-11-12 10:35:39'),
(1017, 'default', 'Resubmitted task for approval: Create and upload logo', 'App\\Models\\Task', NULL, 75, 'App\\Models\\User', 64, '{\"approval_status\":\"pending\"}', NULL, '2024-11-12 10:36:22', '2024-11-12 10:36:22'),
(1018, 'default', 'Updated task: Create and upload logo with changes: Status changed from \'in progress\' to \'done\'', 'App\\Models\\Task', NULL, 75, 'App\\Models\\User', 64, '{\"changes\":[\"Status changed from \'in progress\' to \'done\'\"]}', NULL, '2024-11-12 10:36:38', '2024-11-12 10:36:38'),
(1019, 'default', 'Task approved: Create and upload logo', 'App\\Models\\Task', NULL, 75, 'App\\Models\\User', 38, '{\"task_name\":\"Create and upload logo\",\"approval_status\":\"approved\",\"rejection_remarks\":null}', NULL, '2024-11-12 10:36:47', '2024-11-12 10:36:47'),
(1020, 'default', 'Task graded: Create and upload logo as excellent for byen', 'App\\Models\\Task', NULL, 75, 'App\\Models\\User', 38, '{\"task_name\":\"Create and upload logo\",\"grade\":\"excellent\",\"points\":25,\"user\":\"byen\"}', NULL, '2024-11-12 10:37:03', '2024-11-12 10:37:03'),
(1021, 'default', 'Task graded: Create and upload logo as excellent for taurus', 'App\\Models\\Task', NULL, 75, 'App\\Models\\User', 38, '{\"task_name\":\"Create and upload logo\",\"grade\":\"excellent\",\"points\":25,\"user\":\"taurus\"}', NULL, '2024-11-12 10:37:03', '2024-11-12 10:37:03'),
(1022, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-12 10:43:51', '2024-11-12 10:43:51'),
(1023, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-12 10:44:14', '2024-11-12 10:44:14'),
(1024, 'default', 'Viewed activity log of Vessel', 'App\\Models\\User', NULL, 38, 'App\\Models\\User', 2, '{\"team\":\"New Order of the stones\"}', NULL, '2024-11-12 10:51:53', '2024-11-12 10:51:53'),
(1025, 'default', 'Viewed activity log of taurus', 'App\\Models\\User', NULL, 64, 'App\\Models\\User', 2, '{\"team\":\"Avengers\"}', NULL, '2024-11-12 10:53:20', '2024-11-12 10:53:20'),
(1026, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-12 10:55:36', '2024-11-12 10:55:36'),
(1027, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-12 10:56:55', '2024-11-12 10:56:55'),
(1028, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-12 11:04:06', '2024-11-12 11:04:06'),
(1029, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 64, '[]', NULL, '2024-11-12 11:13:06', '2024-11-12 11:13:06'),
(1030, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-12 11:13:13', '2024-11-12 11:13:13'),
(1031, 'default', 'Viewed activity log of byen', 'App\\Models\\User', NULL, 39, 'App\\Models\\User', 2, '{\"team\":\"Team 3\"}', NULL, '2024-11-12 11:30:14', '2024-11-12 11:30:14'),
(1032, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-12 17:51:23', '2024-11-12 17:51:23'),
(1033, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-20 20:11:56', '2024-11-20 20:11:56'),
(1034, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-11-21 21:26:27', '2024-11-21 21:26:27'),
(1035, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-11-21 15:45:38', '2024-11-21 15:45:38'),
(1036, 'default', 'Created a task: 1', 'App\\Models\\Task', NULL, 76, 'App\\Models\\User', 39, '{\"name\":\"1\"}', NULL, '2024-11-21 15:46:45', '2024-11-21 15:46:45'),
(1037, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-12-08 16:33:10', '2024-12-08 16:33:10'),
(1038, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-12-08 16:36:37', '2024-12-08 16:36:37'),
(1039, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-12-08 16:36:50', '2024-12-08 16:36:50'),
(1040, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-12-08 18:04:19', '2024-12-08 18:04:19'),
(1041, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-12-08 18:04:27', '2024-12-08 18:04:27'),
(1042, 'default', 'User logged out', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-12-08 18:15:31', '2024-12-08 18:15:31'),
(1043, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 39, '[]', NULL, '2024-12-08 18:15:40', '2024-12-08 18:15:40'),
(1044, 'default', 'User logged in', NULL, NULL, NULL, 'App\\Models\\User', 2, '[]', NULL, '2024-12-16 11:24:22', '2024-12-16 11:24:22');

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE `badges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `criteria` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `badges`
--

INSERT INTO `badges` (`id`, `name`, `description`, `icon`, `criteria`, `created_at`, `updated_at`) VALUES
(58, 'Beginner Badge', 'Awarded for completing 1 task.', '/images/badges/beginner.png', NULL, '2024-10-23 19:38:41', '2024-10-23 19:38:41'),
(59, 'Intermediate Badge', 'Awarded for completing 5 tasks.', '/images/badges/intermediate.png', NULL, '2024-10-23 19:38:41', '2024-10-23 19:38:41'),
(60, 'Expert Badge', 'Awarded for completing 28 tasks.', '/images/badges/expert.png', NULL, '2024-10-23 19:38:41', '2024-10-23 19:38:41'),
(61, 'Advanced Badge', 'Awarded for completing 30 tasks.', '/images/badges/advanced.png', NULL, '2024-10-23 19:38:41', '2024-10-23 19:38:41'),
(62, 'Berserk Badge', 'Awarded for completing 31 tasks.', '/images/badges/berserk.png', NULL, '2024-10-23 19:38:41', '2024-10-23 19:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `borders`
--

CREATE TABLE `borders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `criteria` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `borders`
--

INSERT INTO `borders` (`id`, `name`, `description`, `image`, `criteria`, `created_at`, `updated_at`) VALUES
(1, 'Gold Border', 'Awarded for completing 100 tasks.', '/images/borders/gold-border.png', NULL, '2024-09-24 13:12:14', '2024-09-24 13:12:14'),
(2, 'Platinum Border', 'Awarded for completing 200 tasks.', '/images/borders/platinum-border.png', NULL, '2024-09-24 13:12:14', '2024-09-24 13:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('0286dd552c9bea9a69ecb3759e7b94777635514b', 'i:1;', 1730726777),
('0286dd552c9bea9a69ecb3759e7b94777635514b:timer', 'i:1730726777;', 1730726777),
('2a459380709e2fe4ac2dae5733c73225ff6cfee1', 'i:2;', 1730862068),
('2a459380709e2fe4ac2dae5733c73225ff6cfee1:timer', 'i:1730862068;', 1730862068),
('2e01e17467891f7c933dbaa00e1459d23db3fe4f', 'i:1;', 1730733588),
('2e01e17467891f7c933dbaa00e1459d23db3fe4f:timer', 'i:1730733588;', 1730733588),
('35e995c107a71caeb833bb3b79f9f54781b33fa1', 'i:1;', 1731329716),
('35e995c107a71caeb833bb3b79f9f54781b33fa1:timer', 'i:1731329716;', 1731329716),
('59129aacfb6cebbe2c52f30ef3424209f7252e82', 'i:1;', 1730862661),
('59129aacfb6cebbe2c52f30ef3424209f7252e82:timer', 'i:1730862661;', 1730862661),
('5b384ce32d8cdef02bc3a139d4cac0a22bb029e8', 'i:5;', 1730697148),
('5b384ce32d8cdef02bc3a139d4cac0a22bb029e8:timer', 'i:1730697148;', 1730697148),
('64e095fe763fc62418378753f9402623bea9e227', 'i:1;', 1730957270),
('64e095fe763fc62418378753f9402623bea9e227:timer', 'i:1730957270;', 1730957270),
('667be543b02294b7624119adc3a725473df39885', 'i:1;', 1730818654),
('667be543b02294b7624119adc3a725473df39885:timer', 'i:1730818654;', 1730818654),
('6c1e671f9af5b46d9c1a52067bdf0e53685674f7', 'i:1;', 1730832305),
('6c1e671f9af5b46d9c1a52067bdf0e53685674f7:timer', 'i:1730832305;', 1730832305),
('827bfc458708f0b442009c9c9836f7e4b65557fb', 'i:1;', 1730732986),
('827bfc458708f0b442009c9c9836f7e4b65557fb:timer', 'i:1730732986;', 1730732986),
('92cfceb39d57d914ed8b14d0e37643de0797ae56', 'i:1;', 1730726594),
('92cfceb39d57d914ed8b14d0e37643de0797ae56:timer', 'i:1730726594;', 1730726594),
('972a67c48192728a34979d9a35164c1295401b71', 'i:1;', 1730696820),
('972a67c48192728a34979d9a35164c1295401b71:timer', 'i:1730696820;', 1730696820),
('98fbc42faedc02492397cb5962ea3a3ffc0a9243', 'i:1;', 1730733260),
('98fbc42faedc02492397cb5962ea3a3ffc0a9243:timer', 'i:1730733260;', 1730733260),
('a9334987ece78b6fe8bf130ef00b74847c1d3da6', 'i:1;', 1730753908),
('a9334987ece78b6fe8bf130ef00b74847c1d3da6:timer', 'i:1730753908;', 1730753908),
('admmin@admin.com|120.29.79.156', 'i:1;', 1730947978),
('admmin@admin.com|120.29.79.156:timer', 'i:1730947978;', 1730947978),
('af3e133428b9e25c55bc59fe534248e6a0c0f17b', 'i:2;', 1730904825),
('af3e133428b9e25c55bc59fe534248e6a0c0f17b:timer', 'i:1730904825;', 1730904825),
('b4c96d80854dd27e76d8cc9e21960eebda52e962', 'i:2;', 1730886689),
('b4c96d80854dd27e76d8cc9e21960eebda52e962:timer', 'i:1730886689;', 1730886689),
('b7103ca278a75cad8f7d065acda0c2e80da0b7dc', 'i:1;', 1730900002),
('b7103ca278a75cad8f7d065acda0c2e80da0b7dc:timer', 'i:1730900002;', 1730900002),
('b7eb6c689c037217079766fdb77c3bac3e51cb4c', 'i:1;', 1730738644),
('b7eb6c689c037217079766fdb77c3bac3e51cb4c:timer', 'i:1730738644;', 1730738644),
('c66c65175fecc3103b3b587be9b5b230889c8628', 'i:1;', 1730853396),
('c66c65175fecc3103b3b587be9b5b230889c8628:timer', 'i:1730853396;', 1730853396),
('ca3512f4dfa95a03169c5a670a4c91a19b3077b4', 'i:1;', 1730895966),
('ca3512f4dfa95a03169c5a670a4c91a19b3077b4:timer', 'i:1730895966;', 1730895966),
('cb7a1d775e800fd1ee4049f7dca9e041eb9ba083', 'i:2;', 1730697083),
('cb7a1d775e800fd1ee4049f7dca9e041eb9ba083:timer', 'i:1730697083;', 1730697083),
('d02560dd9d7db4467627745bd6701e809ffca6e3', 'i:1;', 1730901909),
('d02560dd9d7db4467627745bd6701e809ffca6e3:timer', 'i:1730901909;', 1730901909),
('da4b9237bacccdf19c0760cab7aec4a8359010b0', 'i:2;', 1730697034),
('da4b9237bacccdf19c0760cab7aec4a8359010b0:timer', 'i:1730697034;', 1730697034),
('daniela.coronel0303@gmail.com|119.94.171.79', 'i:1;', 1730733148),
('daniela.coronel0303@gmail.com|119.94.171.79:timer', 'i:1730733148;', 1730733148),
('f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59', 'i:1;', 1730696864),
('f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59:timer', 'i:1730696864;', 1730696864),
('fb644351560d8296fe6da332236b1f8d61b2828a', 'i:4;', 1730732142),
('fb644351560d8296fe6da332236b1f8d61b2828a:timer', 'i:1730732142;', 1730732142),
('fc074d501302eb2b93e2554793fcaf50b3bf7291', 'i:1;', 1730696934),
('fc074d501302eb2b93e2554793fcaf50b3bf7291:timer', 'i:1730696934;', 1730696934),
('greevilghst@gmail.co|161.49.215.7', 'i:1;', 1730898772),
('greevilghst@gmail.co|161.49.215.7:timer', 'i:1730898772;', 1730898772),
('louisebiancaescorido@gmail.com|120.29.72.191', 'i:1;', 1730734021),
('louisebiancaescorido@gmail.com|120.29.72.191:timer', 'i:1730734021;', 1730734021),
('mangaya.daryl@auf.edu.ph|120.29.110.217', 'i:1;', 1730830894),
('mangaya.daryl@auf.edu.ph|120.29.110.217:timer', 'i:1730830894;', 1730830894),
('mangayadaryl15@gmail.com|120.29.110.217', 'i:1;', 1730830881),
('mangayadaryl15@gmail.com|120.29.110.217:timer', 'i:1730830881;', 1730830881),
('zerotwo0727@gmail.com|120.29.79.88', 'i:1;', 1730732072),
('zerotwo0727@gmail.com|120.29.79.88:timer', 'i:1730732072;', 1730732072);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checklists`
--

CREATE TABLE `checklists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `item` varchar(255) NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checklists`
--

INSERT INTO `checklists` (`id`, `task_id`, `item`, `is_completed`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 1, 'Create wireframe for a website', 1, '2024-11-04 13:55:44', '2024-11-08 01:19:43', NULL),
(2, 2, 'Make a sorting system.', 0, '2024-11-04 14:05:06', '2024-11-04 14:05:06', NULL),
(3, 3, 'Create a calculator app.', 0, '2024-11-04 16:25:29', '2024-11-04 16:25:29', NULL),
(4, 4, 'IT Experts', 0, '2024-11-04 17:27:44', '2024-11-04 17:27:44', NULL),
(5, 4, 'Admin', 0, '2024-11-04 17:27:57', '2024-11-04 17:28:20', NULL),
(6, 4, 'Students', 0, '2024-11-04 17:28:07', '2024-11-04 17:28:07', NULL),
(7, 4, 'Small Company', 0, '2024-11-04 17:28:16', '2024-11-04 17:28:16', NULL),
(8, 7, 'Prepare document template', 0, '2024-11-04 23:09:16', '2024-11-04 23:09:43', NULL),
(9, 7, 'Compile document content', 0, '2024-11-04 23:09:16', '2024-11-04 23:09:16', NULL),
(10, 7, 'Finalize Drafts', 0, '2024-11-04 23:09:16', '2024-11-04 23:09:16', NULL),
(11, 8, 'Type of speech', 0, '2024-11-04 23:12:29', '2024-11-04 23:12:29', NULL),
(12, 8, 'effective speech delivery', 0, '2024-11-04 23:12:29', '2024-11-04 23:12:29', NULL),
(13, 8, 'principles of effective speech writing', 0, '2024-11-04 23:12:29', '2024-11-04 23:12:29', NULL),
(14, 12, 'System Performance Review', 0, '2024-11-05 01:01:51', '2024-11-05 01:28:27', NULL),
(15, 12, 'Software Updates', 0, '2024-11-05 01:01:51', '2024-11-05 01:28:26', NULL),
(16, 12, 'User Access Review', 0, '2024-11-05 01:01:51', '2024-11-05 01:28:25', NULL),
(17, 12, 'Documentation Update', 0, '2024-11-05 01:01:51', '2024-11-05 01:28:25', NULL),
(18, 13, 'Make her laugh or crack a joke', 0, '2024-11-05 19:31:28', '2024-11-05 19:32:21', NULL),
(27, 19, 'task 2', 1, '2024-11-06 12:47:38', '2024-11-06 12:49:09', NULL),
(28, 19, 'task 1', 1, '2024-11-06 12:48:42', '2024-11-06 14:36:10', NULL),
(30, 23, '1', 0, '2024-11-06 13:48:20', '2024-11-06 13:56:04', NULL),
(31, 23, '2', 0, '2024-11-06 13:48:20', '2024-11-06 13:56:05', NULL),
(32, 23, '11', 0, '2024-11-06 13:49:20', '2024-11-06 13:56:05', NULL),
(33, 23, 'asdsad', 1, '2024-11-06 13:50:50', '2024-11-06 13:50:52', NULL),
(34, 23, 'asdasd', 1, '2024-11-06 13:56:08', '2024-11-06 13:56:10', NULL),
(37, 24, '3', 1, '2024-11-06 13:57:00', '2024-11-06 13:58:17', NULL),
(38, 25, '1', 1, '2024-11-06 13:58:37', '2024-11-06 13:58:55', NULL),
(39, 25, '2', 1, '2024-11-06 13:58:37', '2024-11-06 13:58:56', NULL),
(40, 26, '1', 0, '2024-11-06 14:00:54', '2024-11-06 14:00:54', NULL),
(41, 26, '2', 0, '2024-11-06 14:00:54', '2024-11-06 14:00:54', NULL),
(42, 28, '1', 1, '2024-11-06 14:27:46', '2024-11-06 14:40:07', NULL),
(43, 28, '2', 1, '2024-11-06 14:27:46', '2024-11-06 14:39:25', NULL),
(44, 19, 'sds', 1, '2024-11-06 14:36:05', '2024-11-06 15:07:58', NULL),
(45, 29, 'task 1', 1, '2024-11-06 14:37:04', '2024-11-06 15:50:11', NULL),
(46, 29, 'task 2', 1, '2024-11-06 14:37:04', '2024-11-06 15:50:12', NULL),
(47, 29, 'still got time', 1, '2024-11-06 14:37:53', '2024-11-06 15:50:19', NULL),
(48, 29, 'sdsd', 1, '2024-11-06 14:40:20', '2024-11-06 15:50:21', NULL),
(49, 30, '1', 0, '2024-11-06 14:41:49', '2024-11-06 14:41:49', NULL),
(50, 30, '2', 0, '2024-11-06 14:41:49', '2024-11-06 14:41:49', NULL),
(51, 31, '1', 1, '2024-11-06 14:43:45', '2024-11-06 15:08:23', NULL),
(54, 32, '2', 1, '2024-11-06 14:49:51', '2024-11-06 14:58:10', NULL),
(55, 32, 'asdasd', 1, '2024-11-06 14:52:52', '2024-11-06 14:58:11', NULL),
(57, 33, '2', 0, '2024-11-06 15:08:37', '2024-11-06 15:10:35', NULL),
(58, 34, '12', 1, '2024-11-06 15:55:50', '2024-11-06 15:56:07', NULL),
(59, 35, '5', 1, '2024-11-06 15:56:50', '2024-11-06 15:57:22', NULL),
(60, 36, '1', 1, '2024-11-06 15:59:41', '2024-11-06 15:59:47', NULL),
(61, 36, '2', 1, '2024-11-06 15:59:41', '2024-11-06 15:59:48', NULL),
(62, 37, '1', 1, '2024-11-06 16:14:39', '2024-11-06 16:14:54', NULL),
(63, 37, '2', 1, '2024-11-06 16:14:39', '2024-11-06 16:15:17', NULL),
(64, 51, 'Create a sqa file in excel', 0, '2024-11-06 18:55:17', '2024-11-06 18:55:17', NULL),
(66, 53, 'Make a report and discuss it f2f on Friday', 0, '2024-11-06 18:58:46', '2024-11-06 18:58:46', NULL),
(67, 66, 'entertainer', 1, '2024-11-09 08:37:14', '2024-11-09 08:37:24', NULL),
(68, 67, 'Create sqa in excel', 0, '2024-11-09 21:12:54', '2024-11-09 21:12:54', NULL),
(69, 68, 'No description', 0, '2024-11-09 21:25:21', '2024-11-09 21:25:21', NULL),
(70, 52, 'hello', 0, '2024-11-10 00:35:33', '2024-11-10 00:35:33', NULL),
(71, 74, 'File draft', 0, '2024-11-12 10:16:46', '2024-11-12 10:16:46', NULL),
(72, 74, 'Document upload', 0, '2024-11-12 10:16:46', '2024-11-12 10:16:46', NULL),
(73, 75, 'Create the logo', 1, '2024-11-12 10:31:06', '2024-11-12 10:36:27', NULL),
(74, 75, 'Upload the logo', 1, '2024-11-12 10:31:06', '2024-11-12 10:36:29', NULL),
(75, 76, '1', 0, '2024-11-21 15:46:45', '2024-11-21 15:46:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(23, '45baed0c-0e5b-4049-83a7-713fec788957', 'database', 'default', '{\"uuid\":\"45baed0c-0e5b-4049-83a7-713fec788957\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:38;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:39;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"8b415e55-bae1-4fc8-b733-76cc94f7ce96\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-211057d8ae2sm92095875ad.274 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-06 18:17:18'),
(24, '4d75d698-82cb-4e53-bb59-ac68d478ac14', 'database', 'default', '{\"uuid\":\"4d75d698-82cb-4e53-bb59-ac68d478ac14\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:38;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:39;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"fa50e40c-f907-4e54-b9c8-edb8f0ae14a8\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-211057d8ae2sm92095875ad.274 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-06 18:24:00'),
(25, 'ec6284af-19a3-41d6-841b-c9f422d9d4b6', 'database', 'default', '{\"uuid\":\"ec6284af-19a3-41d6-841b-c9f422d9d4b6\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:38;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"57680818-ca7b-4ade-b865-b878857bebfa\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d2e1a72fcca58-72119bca1ccsm7247459b3a.128 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-06 18:43:52'),
(26, 'd0905fa1-a900-4900-bf52-fd61e8989ec5', 'database', 'default', '{\"uuid\":\"d0905fa1-a900-4900-bf52-fd61e8989ec5\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:64;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"e0d9f151-b6ef-4ad5-8db9-08992626f3fa\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d2e1a72fcca58-72119bca1ccsm7247459b3a.128 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-06 18:43:53');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(27, '6d51e0c9-af18-494b-af67-a727d2abceab', 'database', 'default', '{\"uuid\":\"6d51e0c9-af18-494b-af67-a727d2abceab\",\"displayName\":\"App\\\\Events\\\\UserMessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\UserMessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\UserAdminMessage\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: Class \"App\\Events\\PrivateChannel\" not found in /home/u403067048/domains/collaboratask.site/public_html/app/Events/UserMessageSent.php:25\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(79): App\\Events\\UserMessageSent->broadcastOn()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#34 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#35 {main}', '2024-11-07 21:53:53'),
(28, '500f3b16-a2df-4caa-892f-3fa644031f43', 'database', 'default', '{\"uuid\":\"500f3b16-a2df-4caa-892f-3fa644031f43\",\"displayName\":\"App\\\\Events\\\\UserMessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\UserMessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\UserAdminMessage\\\";s:2:\\\"id\\\";i:48;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: Class \"App\\Events\\PrivateChannel\" not found in /home/u403067048/domains/collaboratask.site/public_html/app/Events/UserMessageSent.php:25\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(79): App\\Events\\UserMessageSent->broadcastOn()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#34 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#35 {main}', '2024-11-07 21:54:23'),
(29, '116f1c08-cd33-4441-a0da-f353a17ca481', 'database', 'default', '{\"uuid\":\"116f1c08-cd33-4441-a0da-f353a17ca481\",\"displayName\":\"App\\\\Events\\\\UserMessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\UserMessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\UserAdminMessage\\\";s:2:\\\"id\\\";i:49;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: Class \"App\\Events\\PrivateChannel\" not found in /home/u403067048/domains/collaboratask.site/public_html/app/Events/UserMessageSent.php:25\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(79): App\\Events\\UserMessageSent->broadcastOn()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#34 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#35 {main}', '2024-11-07 21:56:56'),
(30, '971ee188-de6c-476a-9d5f-4ba6d0578169', 'database', 'default', '{\"uuid\":\"971ee188-de6c-476a-9d5f-4ba6d0578169\",\"displayName\":\"App\\\\Events\\\\UserMessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\UserMessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\UserAdminMessage\\\";s:2:\\\"id\\\";i:50;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: Class \"App\\Events\\PrivateChannel\" not found in /home/u403067048/domains/collaboratask.site/public_html/app/Events/UserMessageSent.php:25\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(79): App\\Events\\UserMessageSent->broadcastOn()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#34 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#35 {main}', '2024-11-07 21:57:29'),
(31, '483f8514-1f70-498d-a354-5cef147851c9', 'database', 'default', '{\"uuid\":\"483f8514-1f70-498d-a354-5cef147851c9\",\"displayName\":\"App\\\\Events\\\\UserMessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\UserMessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\UserAdminMessage\\\";s:2:\\\"id\\\";i:51;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: Class \"App\\Events\\PrivateChannel\" not found in /home/u403067048/domains/collaboratask.site/public_html/app/Events/UserMessageSent.php:25\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(79): App\\Events\\UserMessageSent->broadcastOn()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#34 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#35 {main}', '2024-11-07 22:06:44'),
(32, '9e726561-bfe0-40d2-ad2e-132cc8a37d0b', 'database', 'default', '{\"uuid\":\"9e726561-bfe0-40d2-ad2e-132cc8a37d0b\",\"displayName\":\"App\\\\Events\\\\UserMessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\UserMessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\UserAdminMessage\\\";s:2:\\\"id\\\";i:52;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: Class \"App\\Events\\PrivateChannel\" not found in /home/u403067048/domains/collaboratask.site/public_html/app/Events/UserMessageSent.php:25\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(79): App\\Events\\UserMessageSent->broadcastOn()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#34 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#35 {main}', '2024-11-07 22:16:33');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(33, '9ebe52a2-2628-479d-a39f-4ad03e7534af', 'database', 'default', '{\"uuid\":\"9ebe52a2-2628-479d-a39f-4ad03e7534af\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:65;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"15f9e557-2e62-48b1-8abd-18be5424527c\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-21177e7b7e0sm49238945ad.263 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 03:19:41'),
(34, '0595b4cb-ae18-4b26-a269-38ee5c05a917', 'database', 'default', '{\"uuid\":\"0595b4cb-ae18-4b26-a269-38ee5c05a917\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:66;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"c1a60230-0595-4974-8e24-d529b10b333e\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-21177e7b7e0sm49238945ad.263 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 03:19:42'),
(35, '50b72dff-29ee-4df9-9322-aa6941a4ee43', 'database', 'default', '{\"uuid\":\"50b72dff-29ee-4df9-9322-aa6941a4ee43\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:67;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"0369a6e9-8742-4247-a548-639b62be3029\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-21177e7b7e0sm49238945ad.263 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 03:19:43'),
(36, 'aa1c93f6-95c9-47c7-84d9-e53d5feb98b9', 'database', 'default', '{\"uuid\":\"aa1c93f6-95c9-47c7-84d9-e53d5feb98b9\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:70;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"bdfb6df9-20c4-46f0-a275-15cf3b61bcb6\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-21177e7b7e0sm49238945ad.263 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 03:19:44');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(37, '2ecb8117-580f-4387-8bfe-fe4208f96787', 'database', 'default', '{\"uuid\":\"2ecb8117-580f-4387-8bfe-fe4208f96787\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:71;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"762a0c3b-1d6f-4573-883c-8e563820b5fa\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-21177e7b7e0sm49238945ad.263 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 03:19:45'),
(38, '98e9a358-c30a-454f-9116-c90e87be42d5', 'database', 'default', '{\"uuid\":\"98e9a358-c30a-454f-9116-c90e87be42d5\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:72;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"4d13c6cc-4345-45f4-9bee-9e7437cb64e4\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-21177e7b7e0sm49238945ad.263 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 03:19:46'),
(39, 'acf55406-c890-4d4d-b680-341943d66f57', 'database', 'default', '{\"uuid\":\"acf55406-c890-4d4d-b680-341943d66f57\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:39;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:19;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"b6a9b56f-e893-4389-a915-310c5fcf3cc1\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-21177e7b7e0sm49238945ad.263 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 03:22:46'),
(40, 'e84f87d4-be22-4808-ba52-bed9050020c0', 'database', 'default', '{\"uuid\":\"e84f87d4-be22-4808-ba52-bed9050020c0\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:39;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"f867bf82-078d-4aa6-bbb3-949003d2bcda\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-21177e6a33bsm49142335ad.239 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 03:57:52');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(41, 'b2ecb1fd-668d-442f-9edd-3e4007479740', 'database', 'default', '{\"uuid\":\"b2ecb1fd-668d-442f-9edd-3e4007479740\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:39;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:38;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"7515d62b-357c-45d1-bdfa-3aedba5ee0a8\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-21177ddd604sm52021625ad.67 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 09:12:18'),
(42, '5b5a7577-a371-4184-b60d-920297a172e7', 'database', 'default', '{\"uuid\":\"5b5a7577-a371-4184-b60d-920297a172e7\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:39;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:38;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"578d7bbd-9930-4493-b777-b9c74198e8e0\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d9443c01a7336-21177ddd604sm52021625ad.67 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 09:21:54'),
(43, 'f5b18173-65a1-463a-9bd7-9e72baab4659', 'database', 'default', '{\"uuid\":\"f5b18173-65a1-463a-9bd7-9e72baab4659\",\"displayName\":\"App\\\\Notifications\\\\TeamMemberLeftNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:38;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:44:\\\"App\\\\Notifications\\\\TeamMemberLeftNotification\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:2:{i:0;s:7:\\\"members\\\";i:1;s:7:\\\"creator\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:13:\\\"\\u0000*\\u0000memberName\\\";s:4:\\\"byen\\\";s:2:\\\"id\\\";s:36:\\\"a162e0ba-2f3c-411b-990b-876c6706e2e8\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d2e1a72fcca58-72407a1a800sm6578581b3a.164 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 13:37:33'),
(44, 'b0990a48-c9c0-4850-b6a6-5db4bace4a04', 'database', 'default', '{\"uuid\":\"b0990a48-c9c0-4850-b6a6-5db4bace4a04\",\"displayName\":\"App\\\\Notifications\\\\TeamInvitation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:39;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:32:\\\"App\\\\Notifications\\\\TeamInvitation\\\":3:{s:7:\\\"\\u0000*\\u0000team\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Team\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:1:{i:0;s:7:\\\"members\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:10:\\\"\\u0000*\\u0000inviter\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:38;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"e61bcdd9-f0e6-400a-bdd7-9032975cf84e\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 d2e1a72fcca58-72407a1a800sm6578581b3a.164 - gsmtp\". in /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php:333\nStack trace:\n#0 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode()\n#1 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#2 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(219): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#3 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#4 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#5 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#6 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#7 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send()\n#8 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#17 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#18 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#19 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#20 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#21 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#24 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#25 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#27 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#28 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#29 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#31 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#32 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#33 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#34 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#37 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#38 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#39 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#40 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#41 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#42 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#43 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#44 /home/u403067048/domains/collaboratask.site/public_html/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#45 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#46 /home/u403067048/domains/collaboratask.site/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1198): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 /home/u403067048/domains/collaboratask.site/public_html/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#48 {main}', '2024-11-10 13:41:48');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `user_id`, `category`, `comment`, `rating`, `created_at`, `updated_at`) VALUES
(2, 37, 'Other', 'What is the purpose of the contact us page?', NULL, '2024-11-09 00:55:40', '2024-11-09 00:55:40'),
(3, 38, 'Suggestion', 'Please add more features.', NULL, '2024-11-12 10:44:09', '2024-11-12 10:44:09');

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `inviter_id` bigint(20) UNSIGNED NOT NULL,
  `invitee_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` enum('pending','accepted','declined','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invitations`
--

INSERT INTO `invitations` (`id`, `team_id`, `inviter_id`, `invitee_id`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 37, 38, 'greevilghst@gmail.com', 'accepted', '2024-11-04 14:00:04', '2024-11-04 14:01:23'),
(2, 2, 38, 37, 'pangilinanderick100@gmail.com', 'accepted', '2024-11-04 22:53:01', '2024-11-06 23:12:35'),
(3, 2, 38, 39, 'sia.batul.avienflaire@gmail.com', 'accepted', '2024-11-04 22:53:01', '2024-11-04 23:14:10'),
(4, 2, 38, 48, 'mangaya.daryl@auf.edu.ph', 'accepted', '2024-11-04 23:35:18', '2024-11-07 17:16:59'),
(5, 3, 51, 37, 'pangilinanderick100@gmail.com', 'accepted', '2024-11-05 01:16:11', '2024-11-06 23:12:49'),
(6, 3, 51, 40, 'pangilinan.dericknathaniel@auf.edu.ph', 'pending', '2024-11-05 01:16:11', '2024-11-05 01:16:11'),
(7, 3, 51, 42, 'glenjustin.gnc@gmail.com', 'pending', '2024-11-05 01:16:11', '2024-11-05 01:16:11'),
(8, 4, 65, 37, 'pangilinanderick100@gmail.com', 'accepted', '2024-11-06 11:08:24', '2024-11-06 23:12:57'),
(9, 4, 65, 45, 'avienflairebatul@gmail.com', 'pending', '2024-11-06 11:08:24', '2024-11-06 11:08:24'),
(10, 4, 65, 38, 'greevilghst@gmail.com', 'accepted', '2024-11-06 11:09:02', '2024-11-06 11:09:22'),
(11, 2, 38, 64, 'jerahmeel.tatcho@gmail.com', 'accepted', '2024-11-06 16:13:53', '2024-11-06 16:14:09'),
(12, 5, 39, 38, 'greevilghst@gmail.com', 'rejected', '2024-11-06 18:17:12', '2024-11-07 06:38:11'),
(13, 6, 39, 38, 'greevilghst@gmail.com', 'accepted', '2024-11-06 18:23:55', '2024-11-07 06:38:16'),
(14, 7, 37, 38, 'greevilghst@gmail.com', 'accepted', '2024-11-06 18:43:44', '2024-11-06 18:45:07'),
(15, 7, 37, 64, 'jerahmeel.tatcho@gmail.com', 'accepted', '2024-11-06 18:43:44', '2024-11-06 18:48:11'),
(16, 8, 39, 45, 'avienflairebatul@gmail.com', 'pending', '2024-11-06 20:36:56', '2024-11-06 20:36:56'),
(17, 6, 39, 48, 'mangaya.daryl@auf.edu.ph', 'accepted', '2024-11-07 13:52:00', '2024-11-07 18:08:04'),
(18, 9, 48, 39, 'sia.batul.avienflaire@gmail.com', 'accepted', '2024-11-07 17:34:39', '2024-11-07 17:34:50'),
(19, 10, 48, 39, 'sia.batul.avienflaire@gmail.com', 'accepted', '2024-11-07 18:35:33', '2024-11-08 22:18:43'),
(20, 11, 48, 37, 'pangilinanderick100@gmail.com', 'accepted', '2024-11-07 18:39:07', '2024-11-07 22:15:52'),
(21, 11, 48, 39, 'sia.batul.avienflaire@gmail.com', 'accepted', '2024-11-07 18:39:07', '2024-11-07 18:41:26'),
(22, 12, 48, 37, 'pangilinanderick100@gmail.com', 'accepted', '2024-11-07 18:43:51', '2024-11-07 22:15:53'),
(23, 12, 48, 38, 'greevilghst@gmail.com', 'accepted', '2024-11-07 18:43:51', '2024-11-07 23:53:24'),
(24, 12, 48, 39, 'sia.batul.avienflaire@gmail.com', 'accepted', '2024-11-07 18:43:51', '2024-11-07 18:44:11'),
(25, 6, 39, 48, 'mangaya.daryl@auf.edu.ph', 'accepted', '2024-11-07 18:45:13', '2024-11-07 18:47:07'),
(26, 13, 39, 38, 'greevilghst@gmail.com', 'accepted', '2024-11-07 19:23:45', '2024-11-07 23:53:39'),
(27, 13, 39, 48, 'mangaya.daryl@auf.edu.ph', 'accepted', '2024-11-07 19:23:45', '2024-11-07 19:24:08'),
(28, 13, 39, 49, 'daniela.coronel0302@gmail.com', 'pending', '2024-11-07 19:23:45', '2024-11-07 19:23:45'),
(29, 14, 37, 38, 'greevilghst@gmail.com', 'rejected', '2024-11-10 00:56:52', '2024-11-10 09:06:42'),
(30, 14, 37, 39, 'sia.batul.avienflaire@gmail.com', 'accepted', '2024-11-10 00:56:52', '2024-11-10 01:58:01'),
(31, 14, 37, 42, 'glenjustin.gnc@gmail.com', 'pending', '2024-11-10 00:56:52', '2024-11-10 00:56:52'),
(32, 15, 37, 44, 'laurencejeidzfrancisco@gmail.com', 'pending', '2024-11-10 01:02:53', '2024-11-10 01:02:53'),
(33, 15, 37, 42, 'glenjustin.gnc@gmail.com', 'pending', '2024-11-10 01:06:36', '2024-11-10 01:06:36'),
(34, 16, 37, 63, 'sia.batul.avienflaire@auf.edu.ph', 'pending', '2024-11-10 01:08:08', '2024-11-10 01:08:08'),
(35, 17, 37, 39, 'sia.batul.avienflaire@gmail.com', 'rejected', '2024-11-10 03:05:54', '2024-11-10 09:12:48'),
(36, 18, 37, 38, 'greevilghst@gmail.com', 'rejected', '2024-11-10 03:18:51', '2024-11-10 09:06:27'),
(37, 18, 37, 39, 'sia.batul.avienflaire@gmail.com', 'rejected', '2024-11-10 03:18:51', '2024-11-10 09:12:59'),
(38, 18, 37, 40, 'pangilinan.dericknathaniel@auf.edu.ph', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(39, 18, 37, 42, 'glenjustin.gnc@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(40, 18, 37, 43, 'alianjustin1000@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(41, 18, 37, 44, 'laurencejeidzfrancisco@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(42, 18, 37, 45, 'avienflairebatul@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(43, 18, 37, 46, 'zerotwo0727@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(44, 18, 37, 47, 'daniela.edielle@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(45, 18, 37, 48, 'mangaya.daryl@auf.edu.ph', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(46, 18, 37, 49, 'daniela.coronel0302@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(47, 18, 37, 50, 'louisebiancaescorido@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(48, 18, 37, 51, 'angelamungcal16@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(49, 18, 37, 52, 'nogodthe547@stayhome.li', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(50, 18, 37, 56, 'oroprogamer23@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(51, 18, 37, 57, 'pangilinan.dericknathaniel@1auf.edu.ph', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(52, 18, 37, 58, 'dbsalvador@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(56, 18, 37, 62, 'chickentea000@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(57, 18, 37, 63, 'sia.batul.avienflaire@auf.edu.ph', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(58, 18, 37, 64, 'jerahmeel.tatcho@gmail.com', 'rejected', '2024-11-10 03:18:51', '2024-11-12 09:14:16'),
(59, 18, 37, 65, 'layug.fernand@auf.edu.ph', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(61, 18, 37, 67, 'first.second0099@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(62, 18, 37, 70, 'dericknath23@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(63, 18, 37, 71, 'soberanomarkanthony18@gmail.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(64, 18, 37, 72, 'admin@admin.com', 'pending', '2024-11-10 03:18:51', '2024-11-10 03:18:51'),
(65, 19, 37, 39, 'sia.batul.avienflaire@gmail.com', 'rejected', '2024-11-10 03:22:42', '2024-11-10 09:13:05'),
(66, 20, 37, 39, 'sia.batul.avienflaire@gmail.com', 'rejected', '2024-11-10 03:57:45', '2024-11-10 09:13:11'),
(67, 21, 38, 39, 'sia.batul.avienflaire@gmail.com', 'rejected', '2024-11-10 09:12:12', '2024-11-10 09:12:55'),
(68, 22, 38, 39, 'sia.batul.avienflaire@gmail.com', 'accepted', '2024-11-10 09:21:49', '2024-11-10 09:22:45'),
(69, 2, 38, 39, 'sia.batul.avienflaire@gmail.com', 'accepted', '2024-11-10 13:41:43', '2024-11-10 13:41:47'),
(70, 23, 38, 37, 'pangilinanderick100@gmail.com', 'pending', '2024-11-11 18:29:36', '2024-11-11 18:29:36'),
(71, 23, 38, 39, 'sia.batul.avienflaire@gmail.com', 'accepted', '2024-11-11 18:29:36', '2024-11-12 09:15:08'),
(72, 23, 38, 48, 'mangaya.daryl@auf.edu.ph', 'pending', '2024-11-11 18:29:36', '2024-11-11 18:29:36'),
(73, 24, 38, 39, 'sia.batul.avienflaire@gmail.com', 'accepted', '2024-11-11 19:16:36', '2024-11-11 19:18:35'),
(75, 23, 38, 64, 'jerahmeel.tatcho@gmail.com', 'accepted', '2024-11-12 10:28:25', '2024-11-12 10:28:41');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(3317, 'default', '{\"uuid\":\"bfcba707-c56d-4953-bf3b-18f737bd7d10\",\"displayName\":\"App\\\\Events\\\\TaskCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\TaskCreated\\\":1:{s:4:\\\"task\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Task\\\";s:2:\\\"id\\\";i:76;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1732204007, 1732204007);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `original_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `team_id`, `user_id`, `message`, `created_at`, `updated_at`, `file_path`, `deleted_at`, `file_url`, `original_file_name`) VALUES
(60, 2, 38, 'Hello', '2024-11-10 11:38:13', '2024-11-10 11:38:13', NULL, NULL, NULL, NULL),
(61, 23, 64, 'Hello po!', '2024-11-12 10:39:11', '2024-11-12 10:39:11', NULL, NULL, NULL, NULL),
(62, 2, 64, 'Hi po', '2024-11-12 10:40:41', '2024-11-12 10:40:41', NULL, NULL, NULL, NULL),
(63, 23, 64, 'Hello po', '2024-11-12 10:40:59', '2024-11-12 10:40:59', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_06_23_094617_create_tasks_table', 2),
(5, '2024_06_23_095908_create_tasks_table', 3),
(6, '2024_06_24_103449_add_user_id_to_tasks_table', 4),
(7, '2024_06_28_170808_add_attachment_to_tasks_table', 4),
(8, '2024_06_28_183431_add_attachments_to_tasks_table', 5),
(9, '2024_07_06_060401_create_attachments_table', 6),
(10, '2024_07_11_100847_create_task_attachments_table', 7),
(11, '2024_07_11_104659_create_task_attachments_table', 8),
(12, '2024_07_16_142823_create_task_attachments_table', 9),
(13, '2024_07_17_144137_add_attachment_to_tasks_table', 10),
(14, '2024_07_18_063911_create_attachments_table', 11),
(15, '2024_07_18_065324_create_task_attachments_table', 12),
(16, '2024_07_18_080851_create_teams_table', 13),
(17, '2024_07_18_080852_create_team_members_table', 13),
(18, '2024_07_18_084211_add_creator_id_to_teams_table', 14),
(19, '2024_07_18_084353_add_creator_id_to_teams_table', 15),
(20, '2024_07_18_085212_drop_creator_id_from_teams_table', 16),
(21, '2024_08_08_061727_create_checklists_table', 17),
(22, '2024_08_12_024537_create_checklists_table', 18),
(23, '2024_08_12_054012_add_team_id_to_tasks_table', 19),
(24, '2024_08_27_152703_add_profile_photo_path_to_users_table', 20),
(25, '2024_08_27_154616_add_profile_fields_to_users_table', 20),
(26, '2024_08_27_161349_create_activities_table', 21),
(27, '2024_08_30_150526_add_profile_fields_to_users_table', 22),
(28, '2024_09_02_124217_add_duration_to_tasks_table', 23),
(29, '2024_09_02_131624_add_duration_to_tasks_table', 24),
(30, '2024_09_02_142207_create_rewards_table', 25),
(31, '2024_09_02_142208_add_points_to_users_table', 25),
(32, '2024_09_02_142209_create_user_rewards_table', 25),
(33, '2024_09_02_152706_add_team_id_to_rewards_table', 26),
(34, '2024_09_02_162005_add_points_to_team_members_table', 27),
(35, '2024_09_03_133154_add_quality_to_tasks_table', 28),
(36, '2024_09_03_133155_add_points_to_team_members_table', 28),
(37, '2024_09_03_140110_add_points_and_grade_to_tasks', 29),
(38, '2024_09_03_145136_create_rewards_table', 30),
(39, '2024_09_05_132027_add_approval_status_and_rejection_remarks_to_tasks_table', 31),
(40, '2024_09_09_075839_create_messages_table', 32),
(41, '2024_09_10_041739_add_file_to_messages_table', 33),
(42, '2024_09_10_061010_add_file_path_to_messages_table', 34),
(43, '2024_09_10_110836_add_features_enabled_to_teams_table', 35),
(44, '2024_09_10_121813_add_rewards_system_to_teams_table', 36),
(45, '2024_09_10_121949_add_rewards_system_to_teams_table', 37),
(46, '2024_09_11_171122_add_font_family_to_users_table', 38),
(47, '2024_09_12_130323_add_completed_at_to_tasks_table', 39),
(48, '2024_09_12_143404_add_duration_to_tasks_table', 40),
(49, '2024_09_12_163742_create_task_assignments_table', 41),
(50, '2024_09_16_162729_modify_tasks_table_for_duration_tracking', 42),
(51, '2024_09_16_170046_add_duration_to_tasks_table', 43),
(52, '2024_09_21_130108_add_dashboard_layout_to_users_table', 44),
(53, '2024_09_24_210443_create_badges_table', 45),
(54, '2024_09_24_210530_create_borders_table', 45),
(55, '2024_09_24_210555_create_user_badges_table', 45),
(56, '2024_09_24_210617_create_user_borders_table', 45),
(57, '2024_09_24_231050_add_selected_border_to_users_table', 46),
(59, '2024_09_26_105611_create_notifications_table', 47),
(60, '2024_09_26_150619_create_invitations_table', 48),
(61, '2024_09_28_204555_add_image_to_teams_table', 49),
(62, '2024_09_28_215857_add_image_to_teams_table', 50),
(63, '2024_09_28_234155_add_updated_by_to_tasks_table', 51),
(64, '2024_09_29_001150_create_activity_logs_table', 52),
(65, '2024_09_29_184951_create_activity_log_table', 53),
(66, '2024_09_29_184952_add_event_column_to_activity_log_table', 53),
(67, '2024_09_29_184953_add_batch_uuid_column_to_activity_log_table', 53),
(68, '2024_10_04_190438_add_is_graded_to_tasks_table', 54),
(69, '2024_10_05_022226_create_session_durations_table', 55),
(70, '2024_10_05_024819_add_soft_deletes_to_teams_table', 56),
(71, '2024_10_05_025838_add_soft_deletes_to_tasks_table', 57),
(72, '2024_10_05_030421_add_soft_deletes_to_rewards_table', 58),
(73, '2024_10_05_030512_add_soft_deletes_to_messages_table', 59),
(74, '2024_10_05_030717_add_soft_deletes_to_users_table', 60),
(75, '2024_10_05_031530_add_soft_deletes_to_team_members_table', 61),
(76, '2024_10_06_185845_add_file_url_to_messages_table', 62),
(77, '2024_10_06_193134_add_original_file_name_to_messages_table', 63),
(78, '2024_10_11_022635_add_xp_and_level_to_users_table', 64),
(79, '2024_10_17_124635_add_total_points_to_users_table', 65),
(80, '2024_10_19_045856_create_widgets_table', 66),
(81, '2024_10_19_053829_create_notes_table', 67),
(82, '2024_10_20_234705_create_reward_redemptions_table', 68),
(83, '2024_10_22_002213_add_customization_columns_to_users_table', 69),
(84, '2024_10_22_012759_add_navbar_sidebar_body_colors_to_users_table', 70),
(85, '2024_10_24_044521_create_titles_table', 71),
(86, '2024_10_24_044826_add_selected_title_to_users_table', 71),
(87, '2024_10_24_044914_create_titles_table', 72),
(89, '2024_10_26_034012_create_widget_checklists_table', 73),
(90, '2024_10_27_143739_create_feedbacks_table', 74),
(91, '2024_10_27_150147_remove_task_id_from_feedbacks_table', 75);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('02639016-7e52-43f0-a8aa-22c36fd17658', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 65, '{\"message_id\":8,\"message_body\":\"Hello po sir\",\"sender_name\":\"Derick Pangilinan\",\"team_id\":4,\"team_name\":\"Team 1\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-07 00:55:23', '2024-11-07 00:55:23'),
('02f6d470-00f4-4113-a13c-e9d3cb85262e', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":34,\"message_body\":\"hallu\",\"sender_name\":\"admin\",\"team_id\":4,\"team_name\":\"Team 1\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-09 14:30:08', '2024-11-09 14:30:08'),
('0369a6e9-8742-4247-a548-639b62be3029', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 67, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:31', '2024-11-10 03:19:31'),
('063f6f80-141e-4199-9982-ae17cb571afc', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":18,\"message_body\":\"asdsad\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:12:40', '2024-11-07 23:12:40'),
('07134d80-5c2b-4ae5-8da3-e9af2c74bb5f', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":38,\"message_body\":\"hello\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:09:11', '2024-11-09 17:09:11'),
('08b86c4e-db33-4e61-a722-90ca6f76ad71', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 48, '{\"message\":\"You have been invited to join the team.\",\"team_id\":23,\"team_name\":\"COLLABORATASK\",\"inviter_name\":\"Vessel\"}', NULL, '2024-11-11 18:29:45', '2024-11-11 18:29:45'),
('0ca1308d-dc6e-4d16-8111-32d4ec10d53e', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 37, '{\"message\":\"You have been invited to join the team.\",\"team_id\":23,\"team_name\":\"COLLABORATASK\",\"inviter_name\":\"Vessel\"}', NULL, '2024-11-11 18:29:42', '2024-11-11 18:29:42'),
('0d088b8f-1c6e-433d-8f0e-c6e19a1dc290', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":51,\"message_body\":\"23\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:57:23', '2024-11-09 17:57:23'),
('0f155582-6611-4d76-8d5c-1adab31063a4', 'App\\Notifications\\TaskApprovedNotification', 'App\\Models\\User', 39, '{\"task_id\":75,\"task_name\":\"Create and upload logo\",\"team_name\":\"COLLABORATASK\",\"message\":\"Your task has been approved\"}', NULL, '2024-11-12 10:36:49', '2024-11-12 10:36:49'),
('0f7844d5-6666-4237-878b-726a2f4fdbf9', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":39,\"message_body\":\"...\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:10:26', '2024-11-09 17:10:26'),
('1077aa32-28a6-4842-8684-9482ca01e08b', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":25,\"message_body\":\"ddd\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:49:50', '2024-11-07 23:49:50'),
('10fcf658-e385-4e30-8aca-fd4b5c5ba523', 'App\\Notifications\\BadgeUnlocked', 'App\\Models\\User', 48, '{\"badge_name\":\"Beginner Badge\",\"message\":\"Congratulations! You have unlocked the Beginner Badge badge.\",\"icon\":\"\\/images\\/badges\\/beginner.png\"}', NULL, '2024-11-07 19:14:08', '2024-11-07 19:14:08'),
('111be8f0-7c9c-4c82-a450-48d359801c60', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":59,\"message_body\":\"Hello!\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 18:12:30', '2024-11-09 18:12:30'),
('12026fd4-4a2d-4bce-8726-1e911330c021', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":38,\"message_body\":\"hello\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:09:11', '2024-11-09 17:09:11'),
('12843d84-7653-4d14-8da0-da4f3734a9f6', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 65, '{\"message\":\"Task \'Full task\' has been updated to status: \'done\'\",\"task_id\":19,\"team_name\":\"Team 1\",\"team_id\":4}', NULL, '2024-11-06 12:47:52', '2024-11-06 12:47:52'),
('129a9506-a494-4646-8efa-dead11045bc1', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 49, '{\"message\":\"Reminder: Task \'pr defense\' is due in 3 days.\",\"task_id\":11,\"task_name\":\"pr defense\",\"due_in_days\":3}', NULL, '2024-11-12 08:00:05', '2024-11-12 08:00:05'),
('15f9e557-2e62-48b1-8abd-18be5424527c', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 65, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:30', '2024-11-10 03:19:30'),
('188bceec-bc89-43d2-b520-44588b535d2a', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 48, '{\"message\":\"Vessel has accepted your invitation to join Capstone:\",\"team_name\":\"Capstone\",\"response\":\"accepted\",\"user_name\":\"Vessel\"}', NULL, '2024-11-07 23:53:27', '2024-11-07 23:53:27'),
('189874f2-4528-4139-a671-43ad5a743ed3', 'App\\Notifications\\FeedbackSubmitted', 'App\\Models\\User', 2, '{\"message\":\"by Derick Pangilinan in \'Other\'. category \",\"feedback_id\":2,\"feedback_url\":\"https:\\/\\/collaboratask.site\\/admin\\/feedbacks\",\"category\":\"Other\",\"comment\":\"What is the purpose of the contact us page?\",\"submitted_at\":\"2024-11-09 00:55:40\"}', '2024-11-09 09:35:22', '2024-11-09 00:55:40', '2024-11-09 09:35:22'),
('193b268e-bb95-4828-9f6c-bfbc16ec1baf', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":54,\"message_body\":\"11\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:59:36', '2024-11-09 17:59:36'),
('1a8a05b2-e826-4e4e-a778-b89d59c4a4f4', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":42,\"message_body\":\"hello\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:12:15', '2024-11-09 17:12:15'),
('1dd2d54a-8507-4f30-a4b1-fa1e82f27153', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":44,\"message_body\":\"23savage\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:20:10', '2024-11-09 17:20:10'),
('1f71a690-6b2b-4ab1-935e-de03b086cb8d', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 65, '{\"message\":\"Task \'Full task\' has been updated to status: \'in progress\'\",\"task_id\":19,\"team_name\":\"Team 1\",\"team_id\":4}', NULL, '2024-11-06 12:49:57', '2024-11-06 12:49:57'),
('1f8857e7-f69d-49fe-8d5b-52262ba6a01d', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":52,\"message_body\":\"25\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:57:29', '2024-11-09 17:57:29'),
('221f66e6-1b11-48f9-bd03-4d9450637969', 'App\\Notifications\\NewUserAdminMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":133,\"message_body\":\"Answer reports or answer your queries.\",\"sender_name\":\"admin\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-09 16:45:35', '2024-11-09 16:45:35'),
('22d7f939-decb-41b9-b740-3d476d798a26', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 51, '{\"message\":\"Reminder: Task \'System Maintenance\' is due in 1 days.\",\"task_id\":12,\"task_name\":\"System Maintenance\",\"due_in_days\":1}', NULL, '2024-11-05 08:00:06', '2024-11-05 08:00:06'),
('24f53153-9fa6-4c91-9eae-42d4e25385f3', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":13,\"message_body\":\"2323\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:09:39', '2024-11-07 23:09:39'),
('25da72cf-76db-4529-ae8a-462b549ffd46', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":29,\"message_body\":\"okay\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:59:16', '2024-11-07 23:59:16'),
('27b40fba-cc4b-40d9-8e8c-e2459e1c7cb7', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":24,\"message_body\":\"ddd\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:49:47', '2024-11-07 23:49:47'),
('28e42ef4-1e9d-420b-ac32-aa0865101980', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 39, '{\"message\":\"You have been assigned a new task: \'Document Research\'\",\"task_id\":74,\"task_name\":\"Document Research\",\"team_name\":\"COLLABORATASK\"}', NULL, '2024-11-12 10:16:46', '2024-11-12 10:16:46'),
('2b610435-4659-4b23-aea9-5ad337ffdf09', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 65, '{\"message_id\":33,\"message_body\":\"hallu\",\"sender_name\":\"admin\",\"team_id\":4,\"team_name\":\"Team 1\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-09 14:30:02', '2024-11-09 14:30:02'),
('2c600bfc-e9b4-45ea-8926-0b056cedd316', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 39, '{\"message\":\"Reminder: Task \'Create website\' is due in 1 days.\",\"task_id\":61,\"task_name\":\"Create website\",\"due_in_days\":1}', NULL, '2024-11-15 08:00:07', '2024-11-15 08:00:07'),
('2e788aec-5783-4b1c-a525-bcbfd1be4206', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 65, '{\"message\":\"Task \'Full task\' has been updated to status: \'not started\'\",\"task_id\":19,\"team_name\":\"Team 1\",\"team_id\":4}', NULL, '2024-11-06 15:08:03', '2024-11-06 15:08:03'),
('2ece62fd-937d-4983-9933-39bea1c0d192', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":22,\"message_body\":\"ddd\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:46:30', '2024-11-07 23:46:30'),
('2f3cef54-6738-4020-ae7d-0e50a2dd6e0e', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":60,\"message_body\":\"Hello\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-10 11:38:14', '2024-11-10 11:38:14'),
('2f445a14-fec6-4d13-8c03-d51088e47798', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":14,\"message_body\":\"hehehe\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:10:55', '2024-11-07 23:10:55'),
('31335efc-b8f3-489e-988b-6d083ed81073', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":52,\"message_body\":\"25\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:57:29', '2024-11-09 17:57:29'),
('31e0ebe4-1c59-482f-ab5b-aa07d101d976', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 39, '{\"message_id\":63,\"message_body\":\"Hello po\",\"sender_name\":\"taurus\",\"team_id\":23,\"team_name\":\"COLLABORATASK\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-12 10:41:02', '2024-11-12 10:41:02'),
('32971bf6-8543-46d8-affe-18a23b27352c', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":56,\"message_body\":\"2233\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 18:00:06', '2024-11-09 18:00:06'),
('336f4747-886c-4687-ad43-3742d21764f4', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":15,\"message_body\":\"wewew\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:11:01', '2024-11-07 23:11:01'),
('33dbcd37-064b-434a-969a-2910b0cc9c7d', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":32,\"message_body\":\"12\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-08 00:04:34', '2024-11-08 00:04:34'),
('3567b57a-9dc3-4040-9b7c-f13c8b0a27f1', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":56,\"message_body\":\"2233\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 18:00:06', '2024-11-09 18:00:06'),
('3631e38b-c1e0-4563-855a-ab0b67544a95', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":30,\"message_body\":\"okay\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:59:31', '2024-11-07 23:59:31'),
('3693b34d-7720-408b-80c2-e28962bdda8c', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 47, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:08', '2024-11-10 03:19:08'),
('376bb6b4-c4d4-4aec-ac1b-0ca4a009c153', 'App\\Notifications\\NewUserAdminMessageNotification', 'App\\Models\\User', 2, '{\"message_id\":158,\"message_body\":\"2\",\"sender_name\":\"Vessel\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', '2024-11-10 10:01:08', '2024-11-10 09:23:57', '2024-11-10 10:01:08'),
('37861dea-e475-49b1-ad51-1768b6e281b9', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":49,\"message_body\":\"2222\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:52:04', '2024-11-09 17:52:04'),
('3872f82c-5a77-42f1-9cc5-2a2d581c7adf', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 38, '{\"message\":\"Reminder: Task \'Document Research\' is due in 1 days.\",\"task_id\":74,\"task_name\":\"Document Research\",\"due_in_days\":1}', NULL, '2024-11-14 08:00:09', '2024-11-14 08:00:09'),
('3d8e64db-0ed3-4dda-8522-ea32ae5257e9', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 48, '{\"message\":\"Task \'Capstone\' has been updated to status: \'done\'\",\"task_id\":60,\"team_name\":\"Capstone\",\"team_id\":12}', NULL, '2024-11-07 19:14:06', '2024-11-07 19:14:06'),
('3dc55cca-c758-4899-b6db-6b2dcd199ee1', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 44, '{\"message\":\"You have been invited to join the team.\",\"team_id\":15,\"team_name\":\"Site map\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 01:02:55', '2024-11-10 01:02:55'),
('3e4a32cd-788b-4f19-9a84-3bb46f914dce', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":12,\"message_body\":\"hehehe\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:09:18', '2024-11-07 23:09:18'),
('3f8ffd6c-c4eb-473e-939a-6b7987a8e32b', 'App\\Notifications\\NewUserAdminMessageNotification', 'App\\Models\\User', 38, '{\"message_id\":160,\"message_body\":\"What is your problem?\",\"sender_name\":\"admin\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-12 10:45:05', '2024-11-12 10:45:05'),
('40f1d43f-2034-4c60-88ea-af9c2a0dd9b6', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 65, '{\"message\":\"Task \'upload\' has been updated to status: \'done\'\",\"task_id\":16,\"team_name\":\"Team 1\",\"team_id\":4}', NULL, '2024-11-06 12:10:32', '2024-11-06 12:10:32'),
('41f7e266-893c-43aa-a6dc-725a8d77dc16', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 62, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:26', '2024-11-10 03:19:26'),
('433b8589-6733-48bb-ab9d-6af492325dac', 'App\\Notifications\\TaskResubmittedNotification', 'App\\Models\\User', 38, '{\"task_id\":75,\"task_name\":\"Create and upload logo\",\"message\":\"A task has been resubmitted for your approval\",\"team_id\":23}', NULL, '2024-11-12 10:36:22', '2024-11-12 10:36:22'),
('44277484-6a9b-4710-b20b-bc8749971767', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 64, '{\"message\":\"You have been invited to join the team.\",\"team_id\":23,\"team_name\":\"COLLABORATASK\",\"inviter_name\":\"Vessel\"}', NULL, '2024-11-12 10:28:30', '2024-11-12 10:28:30'),
('46d313e0-37a9-463c-8907-692c60382e8e', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":48,\"message_body\":\"22\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:51:49', '2024-11-09 17:51:49'),
('47b87a61-32e8-4f22-8325-7c14edfdadf1', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 65, '{\"message\":\"Reminder: Task \'upload\' is due in 7 days.\",\"task_id\":16,\"task_name\":\"upload\",\"due_in_days\":7}', NULL, '2024-11-14 08:00:08', '2024-11-14 08:00:08'),
('485458ea-1159-4312-a0d0-a87e486db9f7', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 51, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:13', '2024-11-10 03:19:13'),
('49115147-1e3a-4496-b216-15a74df2950a', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":49,\"message_body\":\"2222\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:52:04', '2024-11-09 17:52:04'),
('497715bb-cc01-4393-894c-af6c15a20c09', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":43,\"message_body\":\"hii\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:12:33', '2024-11-09 17:12:33'),
('49ba0521-a379-4820-9b44-f1e5df3422e2', 'App\\Notifications\\TaskRejectedNotification', 'App\\Models\\User', 64, '{\"task_id\":75,\"task_name\":\"Create and upload logo\",\"team_name\":\"COLLABORATASK\",\"rejection_remarks\":\"Please redo this task.\",\"message\":\"Your task has been rejected\"}', NULL, '2024-11-12 10:35:39', '2024-11-12 10:35:39'),
('4bf86a0b-7e34-4bb9-83e3-97818e63f6b0', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":24,\"message_body\":\"ddd\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:49:47', '2024-11-07 23:49:47'),
('4c705900-c51b-41aa-87f8-a86668c1a10b', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":33,\"message_body\":\"hallu\",\"sender_name\":\"admin\",\"team_id\":4,\"team_name\":\"Team 1\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-09 14:30:02', '2024-11-09 14:30:02'),
('4ca54fc4-b455-4b1d-bb89-cddf46bc78f3', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":12,\"message_body\":\"hehehe\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:09:18', '2024-11-07 23:09:18'),
('4d13c6cc-4345-45f4-9bee-9e7437cb64e4', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 72, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:34', '2024-11-10 03:19:34'),
('4d2bc2e3-6e34-4cf7-9c88-968554d44585', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":40,\"message_body\":\".,.\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:11:45', '2024-11-09 17:11:45'),
('4e054c6a-c22c-45bb-adca-20ae5caff625', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":46,\"message_body\":\"222\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:50:28', '2024-11-09 17:50:28'),
('4eac162c-f4d2-4451-9aa8-d983be0ceafe', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 40, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:18:59', '2024-11-10 03:18:59'),
('500c223d-142a-408b-b1a3-c03b9f2c31c8', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":60,\"message_body\":\"Hello\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-10 11:38:14', '2024-11-10 11:38:14'),
('52a4a4e3-1411-4b79-b02c-616f82cb9a50', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 37, '{\"message\":\"Reminder: Task \'SQA\' is due in 3 days.\",\"task_id\":51,\"task_name\":\"SQA\",\"due_in_days\":3}', NULL, '2024-11-20 08:00:08', '2024-11-20 08:00:08'),
('53597226-0694-4476-bb01-e5d0e21a28ef', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 38, '{\"message\":\"byen has accepted your invitation to join COLLABORATASK:\",\"team_name\":\"COLLABORATASK\",\"response\":\"accepted\",\"user_name\":\"byen\"}', NULL, '2024-11-12 09:15:11', '2024-11-12 09:15:11'),
('5563e2de-5980-4d37-87cc-8fff5b890c9a', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 48, '{\"message\":\"You have been assigned a new task: \'Site map\'\",\"task_id\":62,\"task_name\":\"Site map\",\"team_name\":\"Avengers\"}', NULL, '2024-11-08 09:08:26', '2024-11-08 09:08:26'),
('55c45326-48f7-4737-a481-f841221b50a3', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":23,\"message_body\":\"asdasd\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:49:23', '2024-11-07 23:49:23'),
('5743a55c-943c-4723-9670-7e1793de11b7', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 38, '{\"message\":\"Reminder: Task \'Create and upload logo\' is due in 1 days.\",\"task_id\":75,\"task_name\":\"Create and upload logo\",\"due_in_days\":1}', NULL, '2024-11-14 08:00:11', '2024-11-14 08:00:11'),
('5a72e847-cfb8-414f-ae5b-c7c157058d60', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":50,\"message_body\":\"11\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:54:11', '2024-11-09 17:54:11'),
('5b4033a8-34f2-4427-ac82-ef98d7edf365', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 65, '{\"message\":\"Derick Pangilinan has accepted your invitation to join Team 1:\",\"team_name\":\"Team 1\",\"response\":\"accepted\",\"user_name\":\"Derick Pangilinan\"}', NULL, '2024-11-06 23:13:00', '2024-11-06 23:13:00'),
('5b6c7ceb-6714-46eb-83c7-c67894fa2e86', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 39, '{\"message\":\"You have been assigned a new task: \'Create and upload logo\'\",\"task_id\":75,\"task_name\":\"Create and upload logo\",\"team_name\":\"COLLABORATASK\"}', NULL, '2024-11-12 10:31:06', '2024-11-12 10:31:06'),
('5d110bb4-7205-4f3e-bc25-5975297dedd9', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":59,\"message_body\":\"Hello!\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', '2024-11-09 18:24:23', '2024-11-09 18:12:30', '2024-11-09 18:24:23'),
('5e2b6ab8-e6fe-40f7-a727-07e490f2d510', 'App\\Notifications\\TaskApprovedNotification', 'App\\Models\\User', 64, '{\"task_id\":75,\"task_name\":\"Create and upload logo\",\"team_name\":\"COLLABORATASK\",\"message\":\"Your task has been approved\"}', NULL, '2024-11-12 10:36:49', '2024-11-12 10:36:49'),
('5e79eb31-7628-4460-bf86-b83aea040b82', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":29,\"message_body\":\"okay\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:59:16', '2024-11-07 23:59:16'),
('5ef1d13b-a1ed-4d6a-a9fa-87599d9da1b5', 'App\\Notifications\\NewUserAdminMessageNotification', 'App\\Models\\User', 2, '{\"message_id\":159,\"message_body\":\"I have a problem with my team.\",\"sender_name\":\"Vessel\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-12 10:44:50', '2024-11-12 10:44:50'),
('607db967-6a28-425c-ace9-5c93ea7a28a7', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 38, '{\"message\":\"taurus has accepted your invitation to join COLLABORATASK:\",\"team_name\":\"COLLABORATASK\",\"response\":\"accepted\",\"user_name\":\"taurus\"}', NULL, '2024-11-12 10:28:44', '2024-11-12 10:28:44'),
('63dda2f1-a960-4b36-a9ee-a5a0ecf23fb4', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":53,\"message_body\":\"111\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:57:53', '2024-11-09 17:57:53'),
('66c6ba1b-ac9f-4563-bd1a-3f6822d79cb5', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 37, '{\"message\":\"Task \'Create a ppt presentation\' has been updated to status: \'not started\'\",\"task_id\":52,\"team_name\":\"Decoders\",\"team_id\":7}', NULL, '2024-11-10 03:09:18', '2024-11-10 03:09:18'),
('6797afef-3f12-421b-8846-845e4c6f6547', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 37, '{\"message\":\"Task \'Create a ppt presentation\' has been updated to status: \'in progress\'\",\"task_id\":52,\"team_name\":\"Decoders\",\"team_id\":7}', NULL, '2024-11-10 03:09:51', '2024-11-10 03:09:51'),
('68d468cb-26a6-4978-a806-5cd3dbc3fa00', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 56, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:16', '2024-11-10 03:19:16'),
('690c6236-2d47-4432-91fe-f7df34671c7c', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 48, '{\"message\":\"byen has accepted your invitation to join Unknown Team:\",\"team_name\":\"Unknown Team\",\"response\":\"accepted\",\"user_name\":\"byen\"}', NULL, '2024-11-08 22:18:46', '2024-11-08 22:18:46'),
('6a281e0d-3774-45eb-bf09-d6ee7da137fb', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 49, '{\"message\":\"Reminder: Task \'pr defense\' is due in 7 days.\",\"task_id\":11,\"task_name\":\"pr defense\",\"due_in_days\":7}', NULL, '2024-11-08 08:00:06', '2024-11-08 08:00:06'),
('6aeb4f28-9465-49e7-9135-51c5e3d40866', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 58, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:19', '2024-11-10 03:19:19'),
('6deb21d6-07e6-4d93-9ec8-69dc319ae854', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":47,\"message_body\":\"23\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:51:16', '2024-11-09 17:51:16'),
('6ea0e91e-7ee4-41b1-9dc2-68018312351f', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 39, '{\"message_id\":60,\"message_body\":\"Hello\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-10 11:38:14', '2024-11-10 11:38:14'),
('71b37e47-2d1c-44dd-8ee5-cf7acfb88e0b', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 43, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:02', '2024-11-10 03:19:02'),
('71ccc80c-66ee-479d-97d7-248aac53b0f0', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 63, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:27', '2024-11-10 03:19:27'),
('72ab8f0d-4799-40e6-a68e-be400e036318', 'App\\Notifications\\NewUserAdminMessageNotification', 'App\\Models\\User', 2, '{\"message_id\":156,\"message_body\":\"Hell admin\",\"sender_name\":\"byen\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', '2024-11-09 20:04:42', '2024-11-09 19:58:14', '2024-11-09 20:04:42'),
('7318585d-554e-407e-8a35-645cd82f59ce', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":37,\"message_body\":\"hell\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 16:01:32', '2024-11-09 16:01:32'),
('7349b3ae-d340-4d1b-8004-dd303cabf3cd', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":51,\"message_body\":\"23\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:57:23', '2024-11-09 17:57:23'),
('734e04c6-4096-4018-806b-15fc0b7f7366', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":15,\"message_body\":\"wewew\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:11:01', '2024-11-07 23:11:01'),
('762a0c3b-1d6f-4573-883c-8e563820b5fa', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 71, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:34', '2024-11-10 03:19:34'),
('76d5be1d-9306-4d36-93c5-10153869dbc0', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":16,\"message_body\":\"asdsad\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:12:25', '2024-11-07 23:12:25'),
('78ab04fe-2366-4707-bbcd-78f3c1b85d20', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":50,\"message_body\":\"11\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:54:11', '2024-11-09 17:54:11'),
('791064f4-daef-4039-bb70-646c93d037fe', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 38, '{\"message\":\"Task \'Create and upload logo\' has been updated to status: \'done\'\",\"task_id\":75,\"team_name\":\"COLLABORATASK\",\"team_id\":23}', NULL, '2024-11-12 10:34:22', '2024-11-12 10:34:22'),
('79efdde8-715a-4559-a2cd-1566248852f2', 'App\\Notifications\\ViewActivityLogNotification', 'App\\Models\\User', 39, '{\"message\":\"admin has viewed your activity log.\",\"team_leader_name\":\"admin\",\"viewed_at\":\"2024-11-10T03:45:23.992523Z\"}', NULL, '2024-11-10 11:45:23', '2024-11-10 11:45:23'),
('7b06df84-46c5-4c7a-bfa6-c2f8f8972651', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":31,\"message_body\":\"12\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-08 00:04:31', '2024-11-08 00:04:31'),
('7decb83a-36e4-42b4-8a0a-be967e2c226a', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":27,\"message_body\":\"okay\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:51:00', '2024-11-07 23:51:00'),
('7e46e57d-1cd0-4820-95dc-2c3838a25de4', 'App\\Notifications\\ViewActivityLogNotification', 'App\\Models\\User', 38, '{\"message\":\"admin has viewed your activity log.\",\"team_leader_name\":\"admin\",\"viewed_at\":\"2024-11-12T02:51:54.233112Z\"}', NULL, '2024-11-12 10:51:54', '2024-11-12 10:51:54'),
('7e97c462-e62b-4945-ac7d-765b7f48959d', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":30,\"message_body\":\"okay\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:59:31', '2024-11-07 23:59:31'),
('7ee60b5a-e9af-4929-b882-6ef79011ecd9', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":40,\"message_body\":\".,.\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:11:45', '2024-11-09 17:11:45'),
('8037dc38-6e7f-4cc6-b737-248687351940', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 65, '{\"message\":\"Task \'upload\' has been updated to status: \'in progress\'\",\"task_id\":16,\"team_name\":\"Team 1\",\"team_id\":4}', NULL, '2024-11-06 12:10:28', '2024-11-06 12:10:28'),
('807dc77b-5594-4498-a124-a55994ecf572', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 48, '{\"message\":\"Task \'Capstone\' has been updated to status: \'done\'\",\"task_id\":60,\"team_name\":\"Capstone\",\"team_id\":12}', NULL, '2024-11-07 19:14:09', '2024-11-07 19:14:09'),
('808a7165-ab99-4e44-b064-b890b1a1aa42', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 65, '{\"message\":\"Vessel has accepted your invitation to join Team 1:\",\"team_name\":\"Team 1\",\"response\":\"accepted\",\"user_name\":\"Vessel\"}', '2024-11-06 12:08:02', '2024-11-06 11:09:25', '2024-11-06 12:08:02'),
('8265196d-3602-4711-8ac2-28b1004fbeaf', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":14,\"message_body\":\"hehehe\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:10:55', '2024-11-07 23:10:55'),
('827aef70-94cd-401d-ae90-998d2e1bd2b5', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 37, '{\"message\":\"taurus has rejected your invitation to join Unknown Team:\",\"team_name\":\"Unknown Team\",\"response\":\"rejected\",\"user_name\":\"taurus\"}', NULL, '2024-11-12 09:14:19', '2024-11-12 09:14:19'),
('82f9c708-9ba2-49e8-8aa0-0c7310b8c877', 'App\\Notifications\\FeedbackSubmitted', 'App\\Models\\User', 2, '{\"message\":\"by Vessel in \'Suggestion\'. category \",\"feedback_id\":3,\"feedback_url\":\"https:\\/\\/collaboratask.site\\/admin\\/feedbacks\",\"category\":\"Suggestion\",\"comment\":\"Please add more features.\",\"submitted_at\":\"2024-11-12 10:44:09\"}', NULL, '2024-11-12 10:44:09', '2024-11-12 10:44:09'),
('83ef75f8-5867-4570-bf7c-47bd7ccbd4f5', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":58,\"message_body\":\"hey\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 18:06:32', '2024-11-09 18:06:32'),
('843ef9dd-c916-4f2c-829f-710b5e61e284', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 65, '{\"message_id\":4,\"message_body\":\"hi po sir\",\"sender_name\":\"Vessel\",\"team_id\":4,\"team_name\":\"Team 1\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', '2024-11-06 12:15:41', '2024-11-06 12:15:32', '2024-11-06 12:15:41'),
('8516d607-2303-4bb9-a084-d2d691531cd4', 'App\\Notifications\\ViewActivityLogNotification', 'App\\Models\\User', 39, '{\"message\":\"admin has viewed your activity log.\",\"team_leader_name\":\"admin\",\"viewed_at\":\"2024-11-12T03:30:15.617259Z\"}', NULL, '2024-11-12 11:30:15', '2024-11-12 11:30:15'),
('85bb2b6b-e8c8-47c5-8cfa-444da2f5d347', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 37, '{\"message\":\"Reminder: Task \'Make a report\' is due in 1 days.\",\"task_id\":53,\"task_name\":\"Make a report\",\"due_in_days\":1}', NULL, '2024-11-09 08:00:06', '2024-11-09 08:00:06'),
('85d25354-ec6d-4a1a-8a1f-011b6e81e150', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":32,\"message_body\":\"12\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-08 00:04:34', '2024-11-08 00:04:34'),
('8866149d-05e4-4109-9454-166e71ddde86', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 57, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:18', '2024-11-10 03:19:18'),
('88b13aca-1b2a-4797-a1ec-e70b61bd25af', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 48, '{\"message\":\"Derick Pangilinan has accepted your invitation to join Capstone:\",\"team_name\":\"Capstone\",\"response\":\"accepted\",\"user_name\":\"Derick Pangilinan\"}', NULL, '2024-11-07 22:15:56', '2024-11-07 22:15:56'),
('8abb437f-facc-4ade-b63a-4f83ebeff251', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":20,\"message_body\":\"ghehehe\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:13:23', '2024-11-07 23:13:23'),
('8b3ed83e-6905-4701-8c2f-a2b1a3774f9f', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 63, '{\"message\":\"You have been invited to join the team.\",\"team_id\":16,\"team_name\":\"Testers\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 01:08:11', '2024-11-10 01:08:11'),
('8bde04b8-a0fc-419f-8ed0-d8de8bcc2d46', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":62,\"message_body\":\"Hi po\",\"sender_name\":\"taurus\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-12 10:40:43', '2024-11-12 10:40:43'),
('8c050954-bb14-4157-8660-05f6cdc20960', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":25,\"message_body\":\"ddd\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:49:50', '2024-11-07 23:49:50'),
('8d520589-6ab8-4bb1-8e59-a30607a1315b', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 48, '{\"message\":\"byen has accepted your invitation to join Capstone:\",\"team_name\":\"Capstone\",\"response\":\"accepted\",\"user_name\":\"byen\"}', NULL, '2024-11-07 18:44:14', '2024-11-07 18:44:14'),
('8d5b0d16-c41c-4721-a929-472b80a36522', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":21,\"message_body\":\"dasds\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:46:21', '2024-11-07 23:46:21'),
('8ded4f6a-e6a3-4aa1-92a0-b08acf38f0a7', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":11,\"message_body\":\"test\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:09:00', '2024-11-07 23:09:00'),
('8e06150c-23e2-4073-b0e9-cac6e54a8aab', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":28,\"message_body\":\"okay\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:59:12', '2024-11-07 23:59:12'),
('8f0b157a-f18d-4426-b61c-fa03e488f3d1', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":17,\"message_body\":\"asdsad\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:12:34', '2024-11-07 23:12:34'),
('8f816b06-b52b-445c-95b0-72337e807c4d', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":27,\"message_body\":\"okay\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:51:00', '2024-11-07 23:51:00'),
('920e8cd9-c3bd-4def-8910-87a188c91897', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 59, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:22', '2024-11-10 03:19:22'),
('92433551-a921-4d28-a3d6-df120fc0c52f', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":37,\"message_body\":\"hell\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 16:01:32', '2024-11-09 16:01:32'),
('92f920b1-f63c-461a-8432-2165e44b35f3', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 48, '{\"message\":\"byen has accepted your invitation to join Capstone TEAM:\",\"team_name\":\"Capstone TEAM\",\"response\":\"accepted\",\"user_name\":\"byen\"}', NULL, '2024-11-07 17:34:52', '2024-11-07 17:34:52'),
('934e631c-e8bf-43d1-9602-aa2617d70471', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":10,\"message_body\":\"Hello\",\"sender_name\":\"Derick Pangilinan\",\"team_id\":12,\"team_name\":\"Capstone\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-07 22:16:42', '2024-11-07 22:16:42'),
('954bc7b0-6fab-483b-a8e6-b2724e16959b', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":45,\"message_body\":\"..\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:50:13', '2024-11-09 17:50:13'),
('9909c29c-c998-4b2e-b2aa-4f804a4b086d', 'App\\Notifications\\TaskRejectedNotification', 'App\\Models\\User', 39, '{\"task_id\":75,\"task_name\":\"Create and upload logo\",\"team_name\":\"COLLABORATASK\",\"rejection_remarks\":\"Please redo this task.\",\"message\":\"Your task has been rejected\"}', NULL, '2024-11-12 10:35:39', '2024-11-12 10:35:39'),
('991f13b0-96db-4cfc-a802-cbcd11b91900', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 49, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:11', '2024-11-10 03:19:11'),
('99b3401a-3d23-4459-898c-99f996ebf652', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 38, '{\"message\":\"Task \'Create and upload logo\' has been updated to status: \'in progress\'\",\"task_id\":75,\"team_name\":\"COLLABORATASK\",\"team_id\":23}', NULL, '2024-11-12 10:33:51', '2024-11-12 10:33:51');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('99f11fe3-9c4e-42a5-852f-47138727e18f', 'App\\Notifications\\ViewActivityLogNotification', 'App\\Models\\User', 64, '{\"message\":\"admin has viewed your activity log.\",\"team_leader_name\":\"admin\",\"viewed_at\":\"2024-11-12T02:53:21.296895Z\"}', NULL, '2024-11-12 10:53:21', '2024-11-12 10:53:21'),
('9b15b2b5-664d-4206-8d49-00d0cf9e84d0', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":62,\"message_body\":\"Hi po\",\"sender_name\":\"taurus\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-12 10:40:44', '2024-11-12 10:40:44'),
('9b7d4d21-6398-488f-9014-b6edfe85aba8', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 65, '{\"message\":\"Task \'upload\' has been updated to status: \'in progress\'\",\"task_id\":16,\"team_name\":\"Team 1\",\"team_id\":4}', '2024-11-06 12:08:02', '2024-11-06 12:06:58', '2024-11-06 12:08:02'),
('9ce423ea-dd1f-43f0-b520-56dd4c0bd55c', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 49, '{\"message\":\"You have been invited to join the team.\",\"team_id\":13,\"team_name\":\"Capstone TEAM\",\"inviter_name\":\"byen\"}', NULL, '2024-11-07 19:23:52', '2024-11-07 19:23:52'),
('9deea8ce-5627-42d3-8deb-8dea4a8227cb', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":57,\"message_body\":\"22\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 18:06:20', '2024-11-09 18:06:20'),
('9df91a0c-2ba3-44eb-b146-33586cd87d96', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 64, '{\"message\":\"You have been assigned a new task: \'Create and upload logo\'\",\"task_id\":75,\"task_name\":\"Create and upload logo\",\"team_name\":\"COLLABORATASK\"}', NULL, '2024-11-12 10:31:06', '2024-11-12 10:31:06'),
('9f910119-9c78-4b6b-9830-fdc338d8b509', 'App\\Notifications\\NewUserAdminMessageNotification', 'App\\Models\\User', 2, '{\"message_id\":155,\"message_body\":\"hello!\",\"sender_name\":\"Vessel\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', '2024-11-09 19:33:06', '2024-11-09 18:10:53', '2024-11-09 19:33:06'),
('9fd6ee8f-b7d5-4cb0-9677-ee39012a8293', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":54,\"message_body\":\"11\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:59:36', '2024-11-09 17:59:36'),
('a0a3f91b-e34d-48e2-b215-944fafa42af2', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 46, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:06', '2024-11-10 03:19:06'),
('a140e35e-af89-40b9-9e93-fb85a14f6f50', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":58,\"message_body\":\"hey\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 18:06:32', '2024-11-09 18:06:32'),
('a142bcbc-0c25-45b8-9f00-010fbef1d623', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 37, '{\"message\":\"Reminder: Task \'SQA\' is due in 7 days.\",\"task_id\":51,\"task_name\":\"SQA\",\"due_in_days\":7}', NULL, '2024-11-16 08:00:05', '2024-11-16 08:00:05'),
('a14a8bfa-9e1e-4ae5-9c0a-1acbc419040d', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 48, '{\"message\":\"You have been invited to join the team.\",\"team_id\":13,\"team_name\":\"Capstone TEAM\",\"inviter_name\":\"byen\"}', NULL, '2024-11-07 19:23:51', '2024-11-07 19:23:51'),
('a1b23f57-df28-468e-8318-fd4df21ca0b2', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":43,\"message_body\":\"hii\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:12:33', '2024-11-09 17:12:33'),
('a1f27c4f-7b53-40a5-b313-77204f5c53b5', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 45, '{\"message\":\"You have been invited to join the team.\",\"team_id\":4,\"team_name\":\"Team 1\",\"inviter_name\":\"Fernand\"}', NULL, '2024-11-06 11:08:32', '2024-11-06 11:08:32'),
('a2a9692f-7efd-463d-8def-20d177e86f68', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 48, '{\"message\":\"You have been invited to join the team.\",\"team_id\":6,\"team_name\":\"Team 3\",\"inviter_name\":\"byen\"}', NULL, '2024-11-07 13:52:05', '2024-11-07 13:52:05'),
('a310e8f3-80d9-4b6e-b76e-0f391ed222d6', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":53,\"message_body\":\"111\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:57:53', '2024-11-09 17:57:53'),
('a3347264-75d8-4f73-b36d-38a28d78d63b', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 37, '{\"message\":\"You have been invited to join the team.\",\"team_id\":11,\"team_name\":\"Capstone\",\"inviter_name\":\"DARYL MANGAYA\"}', NULL, '2024-11-07 18:39:10', '2024-11-07 18:39:10'),
('a34857d7-b4ab-47d8-88ca-305edf855443', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 38, '{\"message_id\":62,\"message_body\":\"Hi po\",\"sender_name\":\"taurus\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-12 10:40:43', '2024-11-12 10:40:43'),
('a781c4b7-950a-4457-b287-da8b5c5059e6', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":21,\"message_body\":\"dasds\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:46:21', '2024-11-07 23:46:21'),
('a78760ac-9f1e-45bc-b209-704d06fc31bf', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 38, '{\"message_id\":63,\"message_body\":\"Hello po\",\"sender_name\":\"taurus\",\"team_id\":23,\"team_name\":\"COLLABORATASK\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-12 10:41:02', '2024-11-12 10:41:02'),
('a8ef6dbf-de45-4be3-8160-a6b09f8fc63b', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 38, '{\"message\":\"Task \'Create and upload logo\' has been updated to status: \'done\'\",\"task_id\":75,\"team_name\":\"COLLABORATASK\",\"team_id\":23}', NULL, '2024-11-12 10:36:38', '2024-11-12 10:36:38'),
('acbe9cce-d5ee-42f8-a957-df3938da0560', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":26,\"message_body\":\"wtf\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:50:54', '2024-11-07 23:50:54'),
('aee5fb56-7253-457e-95a6-bafd98a4a014', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 37, '{\"message\":\"Task \'Build a sorting system\' has been updated to status: \'not started\'\",\"task_id\":2,\"team_name\":\"New Order of the stones\",\"team_id\":1}', NULL, '2024-11-08 20:06:55', '2024-11-08 20:06:55'),
('af7df185-c497-489f-8850-f4e792a12136', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 65, '{\"message\":\"Reminder: Task \'upload\' is due in 1 days.\",\"task_id\":16,\"task_name\":\"upload\",\"due_in_days\":1}', NULL, '2024-11-20 08:00:06', '2024-11-20 08:00:06'),
('b0b26578-5284-4938-9ad9-bce93003ebd8', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 48, '{\"message\":\"You have been assigned a new task: \'Create website\'\",\"task_id\":61,\"task_name\":\"Create website\",\"team_name\":\"Team 3\"}', NULL, '2024-11-07 19:25:47', '2024-11-07 19:25:47'),
('b0c43c4a-a5fd-4e07-9c14-a2e175ce6289', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":55,\"message_body\":\"222\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:59:48', '2024-11-09 17:59:48'),
('b1f3ede9-bca9-495e-9d83-e6446c8b7598', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 39, '{\"message\":\"Reminder: Task \'Create website\' is due in 3 days.\",\"task_id\":61,\"task_name\":\"Create website\",\"due_in_days\":3}', NULL, '2024-11-13 08:00:07', '2024-11-13 08:00:07'),
('b1ff6f84-2b3b-4b49-830b-7eb896e8b8c4', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 37, '{\"message\":\"You have been assigned a new task: \'Site map\'\",\"task_id\":62,\"task_name\":\"Site map\",\"team_name\":\"Avengers\"}', NULL, '2024-11-08 09:08:26', '2024-11-08 09:08:26'),
('b4873a5a-93fd-443b-8120-c0beb48e9425', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":42,\"message_body\":\"hello\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:12:15', '2024-11-09 17:12:15'),
('b510ae43-a43c-4ed8-96fc-98078c18b5a0', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 37, '{\"message\":\"byen has accepted your invitation to join Unknown Team:\",\"team_name\":\"Unknown Team\",\"response\":\"accepted\",\"user_name\":\"byen\"}', NULL, '2024-11-10 01:58:05', '2024-11-10 01:58:05'),
('b68ee082-f92c-425d-8234-25e66a7068c1', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 51, '{\"message_id\":9,\"message_body\":\"Hii tnx btw\",\"sender_name\":\"Derick Pangilinan\",\"team_id\":3,\"team_name\":\"IT-47\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-07 00:55:35', '2024-11-07 00:55:35'),
('b8b67d0b-7097-45d5-abf0-87395a00cc55', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":19,\"message_body\":\"ddd\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:12:53', '2024-11-07 23:12:53'),
('b93c8436-6d43-4db8-ba57-a0003a3d2c80', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 37, '{\"message\":\"Task \'Build a sorting system\' has been updated to status: \'in progress\'\",\"task_id\":2,\"team_name\":\"New Order of the stones\",\"team_id\":1}', NULL, '2024-11-10 03:14:32', '2024-11-10 03:14:32'),
('ba21a2dd-e160-4938-9292-f4cfe142b6df', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 65, '{\"message\":\"Reminder: Task \'Full task\' is due in 3 days.\",\"task_id\":19,\"task_name\":\"Full task\",\"due_in_days\":3}', NULL, '2024-11-08 08:00:07', '2024-11-08 08:00:07'),
('ba8f9c21-f9d5-4b92-91a8-d0034969a654', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 39, '{\"message\":\"Reminder: Task \'Create Responsive Website\' is due in 3 days.\",\"task_id\":59,\"task_name\":\"Create Responsive Website\",\"due_in_days\":3}', NULL, '2024-11-13 08:00:05', '2024-11-13 08:00:05'),
('bd32f977-7a9e-4f45-b8a5-f1bb22f83751', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":47,\"message_body\":\"23\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:51:16', '2024-11-09 17:51:16'),
('bd42663f-8562-4d34-a86b-2422e7790919', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 40, '{\"message\":\"You have been invited to join the team.\",\"team_id\":3,\"team_name\":\"IT-47\",\"inviter_name\":\"Angela Mungcal\"}', NULL, '2024-11-05 01:16:19', '2024-11-05 01:16:19'),
('bdecff5f-9494-48c9-9106-0201e55dcf54', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":45,\"message_body\":\"..\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:50:13', '2024-11-09 17:50:13'),
('bdfb6df9-20c4-46f0-a275-15cf3b61bcb6', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 70, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:32', '2024-11-10 03:19:32'),
('be1de63c-c269-41cb-979f-aa142ee3d1a7', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 48, '{\"message\":\"You have been assigned a new task: \'Create a Responsive website\'\",\"task_id\":58,\"task_name\":\"Create a Responsive website\",\"team_name\":\"Team 3\"}', NULL, '2024-11-07 18:11:09', '2024-11-07 18:11:09'),
('bed601d7-20a0-4ef4-b67c-c6b55e23d383', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 37, '{\"message\":\"You have been invited to join the team.\",\"team_id\":12,\"team_name\":\"Capstone\",\"inviter_name\":\"DARYL MANGAYA\"}', NULL, '2024-11-07 18:43:55', '2024-11-07 18:43:55'),
('c003ab50-9111-4e55-9a9e-d702b309d13d', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 38, '{\"message_id\":61,\"message_body\":\"Hello po!\",\"sender_name\":\"taurus\",\"team_id\":23,\"team_name\":\"COLLABORATASK\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-12 10:39:13', '2024-11-12 10:39:13'),
('c0b3f9fa-69c2-4d50-a640-863ecddfa7df', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 39, '{\"message_id\":61,\"message_body\":\"Hello po!\",\"sender_name\":\"taurus\",\"team_id\":23,\"team_name\":\"COLLABORATASK\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-12 10:39:13', '2024-11-12 10:39:13'),
('c0d05117-5741-48d3-b079-aa7758cdac3b', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 39, '{\"message\":\"You have been invited to join the team.\",\"team_id\":23,\"team_name\":\"COLLABORATASK\",\"inviter_name\":\"Vessel\"}', NULL, '2024-11-11 18:29:43', '2024-11-11 18:29:43'),
('c0e6308e-5a0c-4683-b191-43b2649384b2', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":31,\"message_body\":\"12\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-08 00:04:31', '2024-11-08 00:04:31'),
('c1a60230-0595-4974-8e24-d529b10b333e', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 66, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:31', '2024-11-10 03:19:31'),
('c1c402f5-20b6-47fc-91e6-e7fc24545044', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":16,\"message_body\":\"asdsad\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:12:25', '2024-11-07 23:12:25'),
('c2e8644d-2d90-46e1-a0cc-54f81ad48dc5', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 60, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:23', '2024-11-10 03:19:23'),
('c3846a36-d73a-4569-bb31-c00f307f61b9', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 51, '{\"message\":\"Derick Pangilinan has accepted your invitation to join IT-47:\",\"team_name\":\"IT-47\",\"response\":\"accepted\",\"user_name\":\"Derick Pangilinan\"}', NULL, '2024-11-06 23:12:52', '2024-11-06 23:12:52'),
('c38b7a9d-2480-42de-81a8-9d6c3417b142', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 48, '{\"message\":\"Task \'KEYBOARD\' has been updated to status: \'done\'\",\"task_id\":72,\"team_name\":\"Capstone\",\"team_id\":12}', NULL, '2024-11-10 03:18:06', '2024-11-10 03:18:06'),
('c486ce3b-b233-4177-b6c0-e2c010a2e3de', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 42, '{\"message\":\"You have been invited to join the team.\",\"team_id\":15,\"team_name\":\"Site map\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 01:06:39', '2024-11-10 01:06:39'),
('c59009e1-4d33-444f-be55-af70ff2ae042', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":55,\"message_body\":\"222\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:59:48', '2024-11-09 17:59:48'),
('c60e7b5f-946d-44d9-8998-ca063631aa21', 'App\\Notifications\\RewardRedeemedNotification', 'App\\Models\\User', 38, '{\"message\":\"taurus has redeemed the reward: Iced Coffee\",\"team_name\":\"COLLABORATASK\",\"reward_name\":\"Iced Coffee\"}', NULL, '2024-11-12 10:37:57', '2024-11-12 10:37:57'),
('c6666bb6-2432-4b52-803a-74b9b5df4d53', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 39, '{\"message\":\"Reminder: Task \'Create Responsive Website\' is due in 1 days.\",\"task_id\":59,\"task_name\":\"Create Responsive Website\",\"due_in_days\":1}', NULL, '2024-11-15 08:00:05', '2024-11-15 08:00:05'),
('c8a00cd6-936b-474b-9cca-14dee63b9349', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":48,\"message_body\":\"22\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:51:49', '2024-11-09 17:51:49'),
('c9bef502-3719-41a2-af62-9cd872068503', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 48, '{\"message\":\"Task \'Capstone\' has been updated to status: \'done\'\",\"task_id\":57,\"team_name\":\"Capstone TEAM\",\"team_id\":9}', NULL, '2024-11-07 17:35:40', '2024-11-07 17:35:40'),
('c9c14f8d-3bcc-4038-9113-dcbf1ab8e3d6', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 48, '{\"message\":\"You have been invited to join the team.\",\"team_id\":6,\"team_name\":\"Team 3\",\"inviter_name\":\"byen\"}', NULL, '2024-11-07 18:45:17', '2024-11-07 18:45:17'),
('ca4c10ea-61c2-480c-9ede-64128e6e5db2', 'App\\Notifications\\BadgeUnlocked', 'App\\Models\\User', 48, '{\"badge_name\":\"Beginner Badge\",\"message\":\"Congratulations! You have unlocked the Beginner Badge badge.\",\"icon\":\"\\/images\\/badges\\/beginner.png\"}', NULL, '2024-11-07 19:14:09', '2024-11-07 19:14:09'),
('ca700fb3-bf86-4b1e-84fe-c2991ee83b52', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":18,\"message_body\":\"asdsad\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:12:40', '2024-11-07 23:12:40'),
('ccd344c4-d753-4699-bfd3-878bcafff309', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 42, '{\"message\":\"You have been invited to join the team.\",\"team_id\":14,\"team_name\":\"ilkwreutygo45it78y5784tglukjg5487oiulghp59854giuh87g yu56ihg895ty8956ythufgi7854ouiglhb53o8745w5toguilbj5w78fgoyuh5tp9v7yghuigy89ioh54gtr89pyuhijngv90ujoei\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 00:57:00', '2024-11-10 00:57:00'),
('d07aa62b-dac9-43e8-9791-c7d15ae2cf0f', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 48, '{\"message\":\"You have been invited to join the team.\",\"team_id\":2,\"team_name\":\"Avengers\",\"inviter_name\":\"Vessel\"}', NULL, '2024-11-04 23:35:23', '2024-11-04 23:35:23'),
('d3e398c6-affe-4e96-87ae-c8df2fb27cd7', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 39, '{\"message_id\":62,\"message_body\":\"Hi po\",\"sender_name\":\"taurus\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-12 10:40:44', '2024-11-12 10:40:44'),
('d4592dad-e857-4d6c-9af0-75a67c011879', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":13,\"message_body\":\"2323\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:09:39', '2024-11-07 23:09:39'),
('d5851e7a-58b3-45d7-b37e-65831d51d8f3', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":28,\"message_body\":\"okay\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:59:12', '2024-11-07 23:59:12'),
('d602bf23-36f3-4d89-b4a6-f84bfbc718a9', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 50, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:12', '2024-11-10 03:19:12'),
('d74f4ed4-da80-4616-8206-07789959c19e', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 42, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:01', '2024-11-10 03:19:01'),
('d7b022a5-4cd6-4977-bf09-b1123053904d', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":17,\"message_body\":\"asdsad\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:12:34', '2024-11-07 23:12:34'),
('d7fdc49d-77af-49d4-b4b6-3e1b5361763e', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 42, '{\"message\":\"You have been invited to join the team.\",\"team_id\":3,\"team_name\":\"IT-47\",\"inviter_name\":\"Angela Mungcal\"}', NULL, '2024-11-05 01:16:20', '2024-11-05 01:16:20'),
('daa86aec-eb69-4b41-9f30-3bdcc1643cab', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 61, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:25', '2024-11-10 03:19:25'),
('de1d6a9a-06a1-490f-9f37-6f46d41ad8ef', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":26,\"message_body\":\"wtf\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:50:54', '2024-11-07 23:50:54'),
('e254d5fe-8916-455c-ae63-c7aa2db73b53', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 48, '{\"message\":\"byen has accepted your invitation to join Capstone:\",\"team_name\":\"Capstone\",\"response\":\"accepted\",\"user_name\":\"byen\"}', NULL, '2024-11-07 18:41:29', '2024-11-07 18:41:29'),
('e3114112-658f-4bec-aa6e-8ec1bcf448f1', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":22,\"message_body\":\"ddd\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:46:30', '2024-11-07 23:46:30'),
('e33f2b16-0def-42ff-ae1f-831cd59fcb67', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 45, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:05', '2024-11-10 03:19:05'),
('e4084348-51a4-40c4-a264-17fd21d205d4', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 65, '{\"message_id\":34,\"message_body\":\"hallu\",\"sender_name\":\"admin\",\"team_id\":4,\"team_name\":\"Team 1\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-09 14:30:08', '2024-11-09 14:30:08'),
('e4213449-382a-46d5-90d7-12c918a475f6', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 65, '{\"message\":\"Reminder: Task \'upload\' is due in 3 days.\",\"task_id\":16,\"task_name\":\"upload\",\"due_in_days\":3}', NULL, '2024-11-18 08:00:06', '2024-11-18 08:00:06'),
('e55b3298-05d1-452a-8af7-f70dfe0b21b1', 'App\\Notifications\\InvitationResponseNotification', 'App\\Models\\User', 48, '{\"message\":\"Derick Pangilinan has accepted your invitation to join Unknown Team:\",\"team_name\":\"Unknown Team\",\"response\":\"accepted\",\"user_name\":\"Derick Pangilinan\"}', NULL, '2024-11-07 22:15:55', '2024-11-07 22:15:55'),
('e61bcdd9-f0e6-400a-bdd7-9032975cf84e', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 39, '{\"message\":\"You have been invited to join the team.\",\"team_id\":2,\"team_name\":\"Avengers\",\"inviter_name\":\"Vessel\"}', NULL, '2024-11-10 13:41:46', '2024-11-10 13:41:46'),
('e767fdc4-fae9-4955-b38d-82125840e289', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 37, '{\"message\":\"Reminder: Task \'Past Due Date\' is due in 3 days.\",\"task_id\":68,\"task_name\":\"Past Due Date\",\"due_in_days\":3}', NULL, '2024-11-13 08:00:09', '2024-11-13 08:00:09'),
('e891bab1-8fc8-4e30-a176-dae239a7a92c', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":20,\"message_body\":\"ghehehe\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-07 23:13:23', '2024-11-07 23:13:23'),
('e89ba1f7-39b9-44fb-9800-2424c7461816', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 48, '{\"message\":\"Task \'Capstone\' has been updated to status: \'not started\'\",\"task_id\":60,\"team_name\":\"Capstone\",\"team_id\":12}', NULL, '2024-11-07 19:14:03', '2024-11-07 19:14:03'),
('e8a5c4fc-71b9-4bbb-a275-6d50808a5942', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 48, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:09', '2024-11-10 03:19:09'),
('e8beeb73-0cf4-42b2-8fc4-4ef1c79b0b07', 'App\\Notifications\\NewUserAdminMessageNotification', 'App\\Models\\User', 39, '{\"message_id\":157,\"message_body\":\"hello\",\"sender_name\":\"admin\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', '2024-11-10 01:57:54', '2024-11-09 19:58:36', '2024-11-10 01:57:54'),
('ebabc354-b13d-4ff5-8b0a-455f24f76e69', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":36,\"message_body\":\"..\",\"sender_name\":\"admin\",\"team_id\":6,\"team_name\":\"Team 3\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-09 15:35:32', '2024-11-09 15:35:32'),
('ecf0f544-5098-4024-a6c0-3e4764a96a4b', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 44, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:03', '2024-11-10 03:19:03'),
('edfd7995-ce11-43f4-ab41-aeea24c9ec2f', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":46,\"message_body\":\"222\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:50:28', '2024-11-09 17:50:28'),
('f03c5014-0c01-4128-bde8-0925b66b8df3', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":57,\"message_body\":\"22\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 18:06:20', '2024-11-09 18:06:20'),
('f091b4b6-92b8-45e6-9354-536494c3e900', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 52, '{\"message\":\"You have been invited to join the team.\",\"team_id\":18,\"team_name\":\"Max\",\"inviter_name\":\"Derick Pangilinan\"}', NULL, '2024-11-10 03:19:15', '2024-11-10 03:19:15'),
('f10aa941-9021-41c9-994c-e231d6718398', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 37, '{\"message\":\"Reminder: Task \'Past Due Date\' is due in 1 days.\",\"task_id\":68,\"task_name\":\"Past Due Date\",\"due_in_days\":1}', NULL, '2024-11-15 08:00:08', '2024-11-15 08:00:08'),
('f12f3d01-a976-4826-9411-bca9c8e77703', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":41,\"message_body\":\"!!\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:11:57', '2024-11-09 17:11:57'),
('f22a4c7e-30bc-4ad8-8da2-f31c3a7f5931', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":39,\"message_body\":\"...\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:10:26', '2024-11-09 17:10:26'),
('f30b23e3-f88a-4843-a709-c3a3f76c78bf', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":35,\"message_body\":\"hallu\",\"sender_name\":\"admin\",\"team_id\":6,\"team_name\":\"Team 3\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/dist\\/img\\/avatar5.png\"}', NULL, '2024-11-09 14:31:06', '2024-11-09 14:31:06'),
('f35ed9bc-13db-407a-896b-c525931ebef2', 'App\\Notifications\\RewardRedeemedNotification', 'App\\Models\\User', 65, '{\"message\":\"Vessel has redeemed the reward: The Finisher\",\"team_name\":\"Team 1\",\"reward_name\":\"The Finisher\"}', NULL, '2024-11-06 12:12:01', '2024-11-06 12:12:01'),
('f64fbd95-60c2-412c-8fca-2c8a08ac3676', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":41,\"message_body\":\"!!\",\"sender_name\":\"byen\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/672b60e365350_avatar4.png\"}', NULL, '2024-11-09 17:11:57', '2024-11-09 17:11:57'),
('f699a61f-9d59-405c-99e6-2ef5e7bfd200', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 37, '{\"message_id\":11,\"message_body\":\"test\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:09:00', '2024-11-07 23:09:00'),
('f79cd454-9cc9-4409-a561-f2be80449d4d', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":44,\"message_body\":\"23savage\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-09 17:20:10', '2024-11-09 17:20:10'),
('f8311b71-8a31-4d52-94aa-f25b9a2f9c7a', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":23,\"message_body\":\"asdasd\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:49:23', '2024-11-07 23:49:23'),
('fa938033-239c-4cce-b175-101243db9110', 'App\\Notifications\\TeamInvitation', 'App\\Models\\User', 45, '{\"message\":\"You have been invited to join the team.\",\"team_id\":8,\"team_name\":\"Capstone TEAM\",\"inviter_name\":\"byen\"}', NULL, '2024-11-06 20:37:00', '2024-11-06 20:37:00'),
('fa9467dd-f41e-49da-acbe-2c2de68ee382', 'App\\Notifications\\TaskProgressUpdated', 'App\\Models\\User', 48, '{\"message\":\"Task \'Capstone\' has been updated to status: \'done\'\",\"task_id\":60,\"team_name\":\"Capstone\",\"team_id\":12}', NULL, '2024-11-07 19:14:06', '2024-11-07 19:14:06'),
('facc829a-45c3-48a3-9c32-74ab76fa2e1a', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 48, '{\"message_id\":19,\"message_body\":\"ddd\",\"sender_name\":\"Vessel\",\"team_id\":2,\"team_name\":\"Avengers\",\"sender_avatar\":\"https:\\/\\/collaboratask.site\\/storage\\/profile_photos\\/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg\"}', NULL, '2024-11-07 23:12:53', '2024-11-07 23:12:53'),
('fb79289c-19a6-448a-967c-c75fd0d03341', 'App\\Notifications\\TaskDueReminderNotification', 'App\\Models\\User', 49, '{\"message\":\"Reminder: Task \'pr defense\' is due in 1 days.\",\"task_id\":11,\"task_name\":\"pr defense\",\"due_in_days\":1}', NULL, '2024-11-14 08:00:06', '2024-11-14 08:00:06'),
('fd7d4862-e0b4-4cbb-92c5-e9a8b7a6ca3d', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 48, '{\"message\":\"You have been assigned a new task: \'Create Responsive Website\'\",\"task_id\":59,\"task_name\":\"Create Responsive Website\",\"team_name\":\"Team 3\"}', NULL, '2024-11-07 18:48:20', '2024-11-07 18:48:20');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `points_required` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `team_id`, `name`, `description`, `points_required`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'First come first serve', 'The first one to finish a task first gets a reward.', 50, '2024-11-04 16:26:47', '2024-11-04 16:26:47', NULL),
(2, 2, 'Paid Leave', 'Claim your paid leave for a day', 500, '2024-11-06 10:37:02', '2024-11-06 10:37:02', NULL),
(3, 4, 'The Finisher', 'Finisher', 1, '2024-11-06 12:10:06', '2024-11-06 12:10:06', NULL),
(4, 7, 'Public speaker', 'Be a good public speaker.', 100, '2024-11-06 19:00:33', '2024-11-06 19:00:33', NULL),
(5, 7, 'Presentation wise', 'Make a very presentable PowerPoint presentation', 50, '2024-11-06 19:01:17', '2024-11-06 19:01:17', NULL),
(6, 7, 'Teamwork Dream Work', 'Be a good team and finish all the tasks assigned as a group or team.', 150, '2024-11-06 19:02:29', '2024-11-06 19:02:29', NULL),
(7, 12, 'First come first serve', 'The first one to finish a task first gets a reward.', 40, '2024-11-07 19:12:54', '2024-11-07 19:12:54', NULL),
(8, 6, 'First come first serve', 'The first one to finish a task first gets a reward.', 40, '2024-11-07 21:51:12', '2024-11-07 21:57:14', '2024-11-07 21:57:14'),
(9, 23, 'Iced Coffee', 'Claim your Iced coffee', 50, '2024-11-11 18:30:42', '2024-11-12 09:06:29', NULL),
(10, 23, 'Creamy Chicken', 'Team Leader is feeling generous, you get a free meal on me. As long as you have enough points.', 50, '2024-11-11 18:32:16', '2024-11-11 18:32:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reward_redemptions`
--

CREATE TABLE `reward_redemptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reward_id` bigint(20) UNSIGNED NOT NULL,
  `redeemed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reward_redemptions`
--

INSERT INTO `reward_redemptions` (`id`, `user_id`, `reward_id`, `redeemed_at`, `created_at`, `updated_at`) VALUES
(1, 38, 3, '2024-11-06 12:12:01', '2024-11-06 12:12:01', '2024-11-06 12:12:01'),
(2, 48, 8, '2024-11-07 21:52:31', '2024-11-07 21:52:31', '2024-11-07 21:52:31'),
(3, 64, 9, '2024-11-12 10:37:57', '2024-11-12 10:37:57', '2024-11-12 10:37:57');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Rq0mJwCXdiXIII4AHgFZFqzQUksPn46Ha0yAV5V9', 39, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibkE3UjR0YTFNZllKR1pOakVpM1JwOHpXQXltR1NVZ1VmVWNCWXVMaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL3NldHRpbmdzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzk7fQ==', 1733681751),
('x8ajDlYzdAPaZh55EV8GKXrRrOF9J8zm7s346k6w', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMGtTdUNsVFE4Q2VIZlQ1cWdtMDdNNlNSY0YzTTZCNlQyUThBUEpVWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1734348314);

-- --------------------------------------------------------

--
-- Table structure for table `session_durations`
--

CREATE TABLE `session_durations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `logout_time` timestamp NULL DEFAULT NULL,
  `duration_in_minutes` int(11) DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session_durations`
--

INSERT INTO `session_durations` (`id`, `user_id`, `login_time`, `logout_time`, `duration_in_minutes`, `last_activity`, `created_at`, `updated_at`) VALUES
(2, 2, '2024-11-04 05:04:46', '2024-11-04 13:04:46', -2, '2024-11-04 05:04:46', '2024-11-04 13:02:41', '2024-11-04 13:04:46'),
(6, 2, '2024-11-04 05:09:59', '2024-11-04 13:09:59', -2, '2024-11-04 05:09:59', '2024-11-04 13:08:18', '2024-11-04 13:09:59'),
(7, 37, '2024-11-04 05:17:48', '2024-11-04 13:17:48', -8, '2024-11-04 05:17:48', '2024-11-04 13:10:03', '2024-11-04 13:17:48'),
(8, 38, '2024-11-04 05:16:44', '2024-11-04 13:16:44', -6, '2024-11-04 05:16:44', '2024-11-04 13:10:57', '2024-11-04 13:16:44'),
(9, 2, '2024-11-04 05:17:49', '2024-11-04 13:17:49', -1, '2024-11-04 05:17:49', '2024-11-04 13:16:54', '2024-11-04 13:17:49'),
(10, 2, '2024-11-04 05:49:33', '2024-11-04 13:49:33', -32, '2024-11-04 05:49:33', '2024-11-04 13:17:52', '2024-11-04 13:49:33'),
(11, 38, '2024-11-04 05:19:38', '2024-11-04 13:19:38', -2, '2024-11-04 05:19:38', '2024-11-04 13:17:56', '2024-11-04 13:19:38'),
(12, 2, '2024-11-04 05:22:24', '2024-11-04 13:22:24', -3, '2024-11-04 05:22:24', '2024-11-04 13:19:44', '2024-11-04 13:22:24'),
(13, 2, '2024-11-04 05:22:55', '2024-11-04 13:22:55', 0, '2024-11-04 05:22:55', '2024-11-04 13:22:35', '2024-11-04 13:22:55'),
(14, 2, '2024-11-04 05:27:34', '2024-11-04 13:27:34', 0, '2024-11-04 05:27:34', '2024-11-04 13:27:18', '2024-11-04 13:27:34'),
(15, 2, '2024-11-04 05:31:31', '2024-11-04 13:31:31', 0, '2024-11-04 05:31:31', '2024-11-04 13:31:20', '2024-11-04 13:31:31'),
(16, 37, '2024-11-04 06:58:24', '2024-11-04 14:58:24', -87, '2024-11-04 06:58:24', '2024-11-04 13:31:41', '2024-11-04 14:58:24'),
(17, 38, '2024-11-04 05:37:52', '2024-11-04 13:37:52', -1, '2024-11-04 05:37:52', '2024-11-04 13:37:07', '2024-11-04 13:37:52'),
(18, 38, '2024-11-04 05:39:18', '2024-11-04 13:39:18', 0, '2024-11-04 05:39:18', '2024-11-04 13:39:04', '2024-11-04 13:39:18'),
(19, 2, '2024-11-04 05:50:14', '2024-11-04 13:50:14', -1, '2024-11-04 05:50:14', '2024-11-04 13:49:36', '2024-11-04 13:50:14'),
(20, 2, '2024-11-04 05:50:52', '2024-11-04 13:50:52', -1, '2024-11-04 05:50:52', '2024-11-04 13:50:19', '2024-11-04 13:50:52'),
(21, 2, '2024-11-04 05:51:20', '2024-11-04 13:51:20', 0, '2024-11-04 05:51:20', '2024-11-04 13:51:10', '2024-11-04 13:51:20'),
(22, 2, '2024-11-04 05:52:52', '2024-11-04 13:52:52', -1, '2024-11-04 05:52:52', '2024-11-04 13:51:42', '2024-11-04 13:52:52'),
(23, 2, '2024-11-04 05:54:19', '2024-11-04 13:54:19', -1, '2024-11-04 05:54:19', '2024-11-04 13:52:58', '2024-11-04 13:54:19'),
(24, 2, '2024-11-04 05:57:27', '2024-11-04 13:57:27', -2, '2024-11-04 05:57:27', '2024-11-04 13:55:11', '2024-11-04 13:57:27'),
(25, 2, '2024-11-04 06:01:07', '2024-11-04 14:01:07', -4, '2024-11-04 06:01:07', '2024-11-04 13:57:35', '2024-11-04 14:01:07'),
(26, 38, '2024-11-04 06:01:38', '2024-11-04 14:01:38', 0, '2024-11-04 06:01:38', '2024-11-04 14:01:14', '2024-11-04 14:01:38'),
(27, 2, '2024-11-04 06:02:26', '2024-11-04 14:02:26', -1, '2024-11-04 06:02:26', '2024-11-04 14:01:44', '2024-11-04 14:02:26'),
(28, 39, '2024-11-04 14:05:17', NULL, NULL, '2024-11-04 06:05:17', '2024-11-04 14:05:17', '2024-11-04 14:05:17'),
(29, 39, '2024-11-04 14:09:56', NULL, NULL, '2024-11-04 06:09:56', '2024-11-04 14:09:56', '2024-11-04 14:09:56'),
(30, 2, '2024-11-04 06:13:26', '2024-11-04 14:13:26', -1, '2024-11-04 06:13:26', '2024-11-04 14:12:06', '2024-11-04 14:13:26'),
(31, 2, '2024-11-04 07:09:51', '2024-11-04 15:09:51', -7, '2024-11-04 07:09:51', '2024-11-04 15:02:55', '2024-11-04 15:09:51'),
(32, 37, '2024-11-04 07:23:33', '2024-11-04 15:23:33', -14, '2024-11-04 07:23:33', '2024-11-04 15:10:00', '2024-11-04 15:23:33'),
(33, 2, '2024-11-04 07:36:56', '2024-11-04 15:36:56', -13, '2024-11-04 07:36:56', '2024-11-04 15:23:37', '2024-11-04 15:36:56'),
(34, 37, '2024-11-04 08:14:56', '2024-11-04 16:14:56', -38, '2024-11-04 08:14:56', '2024-11-04 15:37:04', '2024-11-04 16:14:56'),
(35, 2, '2024-11-04 08:21:03', '2024-11-04 16:21:03', -6, '2024-11-04 08:21:03', '2024-11-04 16:15:00', '2024-11-04 16:21:03'),
(36, 40, '2024-11-04 08:21:23', '2024-11-04 16:21:23', 0, '2024-11-04 08:21:23', '2024-11-04 16:21:20', '2024-11-04 16:21:23'),
(37, 2, '2024-11-04 08:21:29', '2024-11-04 16:21:29', 0, '2024-11-04 08:21:29', '2024-11-04 16:21:26', '2024-11-04 16:21:29'),
(38, 37, '2024-11-04 08:27:03', '2024-11-04 16:27:03', -5, '2024-11-04 08:27:03', '2024-11-04 16:21:38', '2024-11-04 16:27:03'),
(39, 2, '2024-11-04 16:27:11', NULL, NULL, '2024-11-04 08:27:11', '2024-11-04 16:27:11', '2024-11-04 16:27:11'),
(41, 2, '2024-11-04 09:58:29', '2024-11-04 17:58:29', -53, '2024-11-04 09:58:29', '2024-11-04 17:05:35', '2024-11-04 17:58:29'),
(42, 2, '2024-11-04 09:08:07', '2024-11-04 17:08:07', -2, '2024-11-04 09:08:07', '2024-11-04 17:06:07', '2024-11-04 17:08:07'),
(43, 38, '2024-11-04 09:17:39', '2024-11-04 17:17:39', -9, '2024-11-04 09:17:39', '2024-11-04 17:08:12', '2024-11-04 17:17:39'),
(44, 2, '2024-11-04 09:18:39', '2024-11-04 17:18:39', -1, '2024-11-04 09:18:39', '2024-11-04 17:17:45', '2024-11-04 17:18:39'),
(45, 39, '2024-11-04 17:24:46', NULL, NULL, '2024-11-04 09:24:46', '2024-11-04 17:24:46', '2024-11-04 17:24:46'),
(46, 38, '2024-11-04 11:25:46', '2024-11-04 19:25:46', -107, '2024-11-04 11:25:46', '2024-11-04 17:38:22', '2024-11-04 19:25:46'),
(47, 37, '2024-11-04 10:51:12', '2024-11-04 18:51:12', -53, '2024-11-04 10:51:12', '2024-11-04 17:58:41', '2024-11-04 18:51:12'),
(48, 2, '2024-11-04 10:54:37', '2024-11-04 18:54:37', -3, '2024-11-04 10:54:37', '2024-11-04 18:51:17', '2024-11-04 18:54:37'),
(49, 37, '2024-11-04 11:09:43', '2024-11-04 19:09:43', -15, '2024-11-04 11:09:43', '2024-11-04 18:54:45', '2024-11-04 19:09:43'),
(50, 2, '2024-11-04 19:09:47', NULL, NULL, '2024-11-04 11:09:47', '2024-11-04 19:09:47', '2024-11-04 19:09:47'),
(51, 38, '2024-11-04 11:30:41', '2024-11-04 19:30:41', -2, '2024-11-04 11:30:41', '2024-11-04 19:29:11', '2024-11-04 19:30:41'),
(52, 2, '2024-11-04 11:30:58', '2024-11-04 19:30:58', 0, '2024-11-04 11:30:58', '2024-11-04 19:30:48', '2024-11-04 19:30:58'),
(53, 2, '2024-11-04 11:41:29', '2024-11-04 19:41:29', -1, '2024-11-04 11:41:29', '2024-11-04 19:40:21', '2024-11-04 19:41:29'),
(54, 38, '2024-11-04 11:46:32', '2024-11-04 19:46:32', -5, '2024-11-04 11:46:32', '2024-11-04 19:41:36', '2024-11-04 19:46:32'),
(55, 2, '2024-11-04 11:52:59', '2024-11-04 19:52:59', -6, '2024-11-04 11:52:59', '2024-11-04 19:46:41', '2024-11-04 19:52:59'),
(56, 2, '2024-11-04 11:57:08', '2024-11-04 19:57:08', -4, '2024-11-04 11:57:08', '2024-11-04 19:53:04', '2024-11-04 19:57:08'),
(57, 38, '2024-11-04 11:58:55', '2024-11-04 19:58:55', -2, '2024-11-04 11:58:55', '2024-11-04 19:57:18', '2024-11-04 19:58:55'),
(58, 2, '2024-11-04 12:42:55', '2024-11-04 20:42:55', -44, '2024-11-04 12:42:55', '2024-11-04 19:59:01', '2024-11-04 20:42:55'),
(59, 2, '2024-11-04 12:48:04', '2024-11-04 20:48:04', -1, '2024-11-04 12:48:04', '2024-11-04 20:47:18', '2024-11-04 20:48:04'),
(60, 39, '2024-11-04 20:48:04', NULL, NULL, '2024-11-04 12:48:04', '2024-11-04 20:48:04', '2024-11-04 20:48:04'),
(61, 2, '2024-11-04 12:49:55', '2024-11-04 20:49:55', -2, '2024-11-04 12:49:55', '2024-11-04 20:48:11', '2024-11-04 20:49:55'),
(62, 42, '2024-11-04 13:22:34', '2024-11-04 21:22:34', -1, '2024-11-04 13:22:34', '2024-11-04 21:21:38', '2024-11-04 21:22:34'),
(63, 43, '2024-11-04 21:23:38', NULL, NULL, '2024-11-04 13:23:38', '2024-11-04 21:23:38', '2024-11-04 21:23:38'),
(64, 43, '2024-11-04 13:25:22', '2024-11-04 21:25:22', 0, '2024-11-04 13:25:22', '2024-11-04 21:25:17', '2024-11-04 21:25:22'),
(65, 43, '2024-11-04 21:25:34', NULL, NULL, '2024-11-04 13:25:34', '2024-11-04 21:25:34', '2024-11-04 21:25:34'),
(66, 2, '2024-11-04 14:06:05', '2024-11-04 22:06:05', -24, '2024-11-04 14:06:05', '2024-11-04 21:42:03', '2024-11-04 22:06:05'),
(67, 2, '2024-11-04 14:18:52', '2024-11-04 22:18:52', 0, '2024-11-04 14:18:52', '2024-11-04 22:18:24', '2024-11-04 22:18:52'),
(68, 2, '2024-11-04 14:35:59', '2024-11-04 22:35:59', 0, '2024-11-04 14:35:59', '2024-11-04 22:35:47', '2024-11-04 22:35:59'),
(69, 2, '2024-11-04 22:42:15', NULL, NULL, '2024-11-04 14:42:15', '2024-11-04 22:42:15', '2024-11-04 22:42:15'),
(70, 38, '2024-11-04 14:57:14', '2024-11-04 22:57:14', -7, '2024-11-04 14:57:14', '2024-11-04 22:50:13', '2024-11-04 22:57:14'),
(71, 45, '2024-11-04 14:54:52', '2024-11-04 22:54:52', 0, '2024-11-04 14:54:52', '2024-11-04 22:54:34', '2024-11-04 22:54:52'),
(72, 45, '2024-11-04 15:13:48', '2024-11-04 23:13:48', -19, '2024-11-04 15:13:48', '2024-11-04 22:55:00', '2024-11-04 23:13:48'),
(73, 2, '2024-11-04 15:00:25', '2024-11-04 23:00:25', -3, '2024-11-04 15:00:25', '2024-11-04 22:57:27', '2024-11-04 23:00:25'),
(74, 44, '2024-11-04 22:58:42', NULL, NULL, '2024-11-04 14:58:42', '2024-11-04 22:58:42', '2024-11-04 22:58:42'),
(75, 38, '2024-11-04 15:03:36', '2024-11-04 23:03:36', -3, '2024-11-04 15:03:36', '2024-11-04 23:00:47', '2024-11-04 23:03:36'),
(76, 38, '2024-11-04 15:03:49', '2024-11-04 23:03:49', 0, '2024-11-04 15:03:49', '2024-11-04 23:03:46', '2024-11-04 23:03:49'),
(77, 2, '2024-11-04 15:05:08', '2024-11-04 23:05:08', -1, '2024-11-04 15:05:08', '2024-11-04 23:03:56', '2024-11-04 23:05:08'),
(78, 47, '2024-11-04 15:09:03', '2024-11-04 23:09:03', -4, '2024-11-04 15:09:03', '2024-11-04 23:05:30', '2024-11-04 23:09:03'),
(79, 38, '2024-11-04 15:09:49', '2024-11-04 23:09:49', -4, '2024-11-04 15:09:49', '2024-11-04 23:05:55', '2024-11-04 23:09:49'),
(80, 48, '2024-11-04 15:08:43', '2024-11-04 23:08:43', 0, '2024-11-04 15:08:43', '2024-11-04 23:08:40', '2024-11-04 23:08:43'),
(81, 44, '2024-11-04 23:08:50', NULL, NULL, '2024-11-04 15:08:50', '2024-11-04 23:08:50', '2024-11-04 23:08:50'),
(82, 48, '2024-11-04 15:09:34', '2024-11-04 23:09:34', -1, '2024-11-04 15:09:34', '2024-11-04 23:08:58', '2024-11-04 23:09:34'),
(83, 49, '2024-11-04 23:09:54', NULL, NULL, '2024-11-04 15:09:54', '2024-11-04 23:09:54', '2024-11-04 23:09:54'),
(84, 2, '2024-11-04 15:10:25', '2024-11-04 23:10:25', 0, '2024-11-04 15:10:25', '2024-11-04 23:09:57', '2024-11-04 23:10:25'),
(85, 48, '2024-11-04 15:10:08', '2024-11-04 23:10:08', 0, '2024-11-04 15:10:08', '2024-11-04 23:10:01', '2024-11-04 23:10:08'),
(86, 49, '2024-11-04 15:11:03', '2024-11-04 23:11:03', -1, '2024-11-04 15:11:03', '2024-11-04 23:10:33', '2024-11-04 23:11:03'),
(87, 48, '2024-11-04 23:10:51', NULL, NULL, '2024-11-04 15:10:51', '2024-11-04 23:10:51', '2024-11-04 23:10:51'),
(88, 38, '2024-11-04 15:17:20', '2024-11-04 23:17:20', -6, '2024-11-04 15:17:20', '2024-11-04 23:11:33', '2024-11-04 23:17:20'),
(89, 49, '2024-11-04 23:11:43', NULL, NULL, '2024-11-04 15:11:43', '2024-11-04 23:11:43', '2024-11-04 23:11:43'),
(90, 49, '2024-11-04 23:12:19', NULL, NULL, '2024-11-04 15:12:19', '2024-11-04 23:12:19', '2024-11-04 23:12:19'),
(91, 39, '2024-11-04 23:14:03', NULL, NULL, '2024-11-04 15:14:03', '2024-11-04 23:14:03', '2024-11-04 23:14:03'),
(92, 2, '2024-11-04 15:17:50', '2024-11-04 23:17:50', 0, '2024-11-04 15:17:50', '2024-11-04 23:17:26', '2024-11-04 23:17:50'),
(93, 2, '2024-11-04 15:22:22', '2024-11-04 23:22:22', -4, '2024-11-04 15:22:22', '2024-11-04 23:17:58', '2024-11-04 23:22:22'),
(94, 38, '2024-11-04 15:25:36', '2024-11-04 23:25:36', 0, '2024-11-04 15:25:36', '2024-11-04 23:25:11', '2024-11-04 23:25:36'),
(95, 2, '2024-11-04 15:26:53', '2024-11-04 23:26:53', -1, '2024-11-04 15:26:53', '2024-11-04 23:25:43', '2024-11-04 23:26:53'),
(96, 2, '2024-11-04 15:34:52', '2024-11-04 23:34:52', -1, '2024-11-04 15:34:52', '2024-11-04 23:34:17', '2024-11-04 23:34:52'),
(97, 38, '2024-11-04 15:35:27', '2024-11-04 23:35:27', 0, '2024-11-04 15:35:27', '2024-11-04 23:35:00', '2024-11-04 23:35:27'),
(98, 51, '2024-11-05 00:38:34', NULL, NULL, '2024-11-04 16:38:34', '2024-11-05 00:38:34', '2024-11-05 00:38:34'),
(99, 52, '2024-11-05 04:56:41', NULL, NULL, '2024-11-04 20:56:41', '2024-11-05 04:56:41', '2024-11-05 04:56:41'),
(100, 2, '2024-11-04 22:04:41', '2024-11-05 06:04:41', -2, '2024-11-04 22:04:41', '2024-11-05 06:03:10', '2024-11-05 06:04:41'),
(101, 38, '2024-11-04 22:05:04', '2024-11-05 06:05:04', 0, '2024-11-04 22:05:04', '2024-11-05 06:04:48', '2024-11-05 06:05:04'),
(102, 2, '2024-11-05 00:31:24', '2024-11-05 08:31:24', -1, '2024-11-05 00:31:24', '2024-11-05 08:30:15', '2024-11-05 08:31:24'),
(103, 38, '2024-11-05 00:40:21', '2024-11-05 08:40:21', -9, '2024-11-05 00:40:21', '2024-11-05 08:31:33', '2024-11-05 08:40:21'),
(104, 2, '2024-11-05 08:39:46', NULL, NULL, '2024-11-05 00:39:46', '2024-11-05 08:39:46', '2024-11-05 08:39:46'),
(105, 2, '2024-11-05 00:42:04', '2024-11-05 08:42:04', -2, '2024-11-05 00:42:04', '2024-11-05 08:40:31', '2024-11-05 08:42:04'),
(106, 38, '2024-11-05 00:57:21', '2024-11-05 08:57:21', 0, '2024-11-05 00:57:21', '2024-11-05 08:56:57', '2024-11-05 08:57:21'),
(107, 2, '2024-11-05 00:58:20', '2024-11-05 08:58:20', -1, '2024-11-05 00:58:20', '2024-11-05 08:57:35', '2024-11-05 08:58:20'),
(108, 38, '2024-11-05 01:15:09', '2024-11-05 09:15:09', -17, '2024-11-05 01:15:09', '2024-11-05 08:58:26', '2024-11-05 09:15:09'),
(109, 2, '2024-11-05 03:17:45', '2024-11-05 11:17:45', 0, '2024-11-05 03:17:45', '2024-11-05 11:17:31', '2024-11-05 11:17:45'),
(110, 38, '2024-11-05 03:18:25', '2024-11-05 11:18:25', 0, '2024-11-05 03:18:25', '2024-11-05 11:17:59', '2024-11-05 11:18:25'),
(111, 2, '2024-11-05 03:19:00', '2024-11-05 11:19:00', 0, '2024-11-05 03:19:00', '2024-11-05 11:18:34', '2024-11-05 11:19:00'),
(112, 2, '2024-11-05 03:25:38', '2024-11-05 11:25:38', -5, '2024-11-05 03:25:38', '2024-11-05 11:20:48', '2024-11-05 11:25:38'),
(113, 38, '2024-11-05 03:28:34', '2024-11-05 11:28:34', -3, '2024-11-05 03:28:34', '2024-11-05 11:25:57', '2024-11-05 11:28:34'),
(114, 38, '2024-11-05 03:37:10', '2024-11-05 11:37:10', -1, '2024-11-05 03:37:10', '2024-11-05 11:36:17', '2024-11-05 11:37:10'),
(115, 2, '2024-11-05 04:53:31', '2024-11-05 12:53:31', -1, '2024-11-05 04:53:31', '2024-11-05 12:52:43', '2024-11-05 12:53:31'),
(116, 38, '2024-11-05 04:53:46', '2024-11-05 12:53:46', 0, '2024-11-05 04:53:46', '2024-11-05 12:53:38', '2024-11-05 12:53:46'),
(117, 38, '2024-11-05 05:40:51', '2024-11-05 13:40:51', -46, '2024-11-05 05:40:51', '2024-11-05 12:54:59', '2024-11-05 13:40:51'),
(118, 2, '2024-11-05 07:17:33', '2024-11-05 15:17:33', -97, '2024-11-05 07:17:33', '2024-11-05 13:40:58', '2024-11-05 15:17:33'),
(119, 2, '2024-11-05 07:17:39', '2024-11-05 15:17:39', 0, '2024-11-05 07:17:39', '2024-11-05 15:17:36', '2024-11-05 15:17:39'),
(120, 2, '2024-11-05 10:05:29', '2024-11-05 18:05:29', 0, '2024-11-05 10:05:29', '2024-11-05 18:05:26', '2024-11-05 18:05:29'),
(121, 38, '2024-11-05 10:24:44', '2024-11-05 18:24:44', -19, '2024-11-05 10:24:44', '2024-11-05 18:05:35', '2024-11-05 18:24:44'),
(122, 37, '2024-11-05 11:51:56', '2024-11-05 19:51:56', -23, '2024-11-05 11:51:56', '2024-11-05 19:29:17', '2024-11-05 19:51:56'),
(126, 2, '2024-11-05 12:06:58', '2024-11-05 20:06:58', -2, '2024-11-05 12:06:58', '2024-11-05 20:05:20', '2024-11-05 20:06:58'),
(127, 56, '2024-11-05 12:27:04', '2024-11-05 20:27:04', -13, '2024-11-05 12:27:04', '2024-11-05 20:13:59', '2024-11-05 20:27:04'),
(128, 58, '2024-11-05 14:57:31', '2024-11-05 22:57:31', -2, '2024-11-05 14:57:31', '2024-11-05 22:55:19', '2024-11-05 22:57:31'),
(129, 39, '2024-11-05 22:57:52', NULL, NULL, '2024-11-05 14:57:52', '2024-11-05 22:57:52', '2024-11-05 22:57:52'),
(130, 2, '2024-11-05 15:29:08', '2024-11-05 23:29:08', -10, '2024-11-05 15:29:08', '2024-11-05 23:19:33', '2024-11-05 23:29:08'),
(131, 2, '2024-11-05 15:29:34', '2024-11-05 23:29:34', 0, '2024-11-05 15:29:34', '2024-11-05 23:29:13', '2024-11-05 23:29:34'),
(132, 37, '2024-11-05 23:29:50', NULL, NULL, '2024-11-05 15:29:50', '2024-11-05 23:29:50', '2024-11-05 23:29:50'),
(133, 37, '2024-11-05 23:44:20', NULL, NULL, '2024-11-05 15:44:20', '2024-11-05 23:44:20', '2024-11-05 23:44:20'),
(134, 37, '2024-11-05 16:24:30', '2024-11-06 00:24:30', -40, '2024-11-05 16:24:30', '2024-11-05 23:44:28', '2024-11-06 00:24:30'),
(135, 37, '2024-11-05 16:01:44', '2024-11-06 00:01:44', -7, '2024-11-05 16:01:44', '2024-11-05 23:54:57', '2024-11-06 00:01:44'),
(136, 37, '2024-11-05 16:17:57', '2024-11-06 00:17:57', -3, '2024-11-05 16:17:57', '2024-11-06 00:14:53', '2024-11-06 00:17:57'),
(137, 37, '2024-11-06 00:24:44', NULL, NULL, '2024-11-05 16:24:44', '2024-11-06 00:24:44', '2024-11-06 00:24:44'),
(138, 37, '2024-11-05 16:38:47', '2024-11-06 00:38:47', -2, '2024-11-05 16:38:47', '2024-11-06 00:36:48', '2024-11-06 00:38:47'),
(139, 2, '2024-11-05 16:45:05', '2024-11-06 00:45:05', -5, '2024-11-05 16:45:05', '2024-11-06 00:40:33', '2024-11-06 00:45:05'),
(140, 37, '2024-11-05 16:52:26', '2024-11-06 00:52:26', 0, '2024-11-05 16:52:26', '2024-11-06 00:52:05', '2024-11-06 00:52:26'),
(141, 2, '2024-11-05 18:19:48', '2024-11-06 02:19:48', -1, '2024-11-05 18:19:48', '2024-11-06 02:18:51', '2024-11-06 02:19:48'),
(142, 39, '2024-11-05 18:25:54', '2024-11-06 02:25:54', -4, '2024-11-05 18:25:54', '2024-11-06 02:21:45', '2024-11-06 02:25:54'),
(143, 2, '2024-11-05 18:24:05', '2024-11-06 02:24:05', -1, '2024-11-05 18:24:05', '2024-11-06 02:23:19', '2024-11-06 02:24:05'),
(144, 39, '2024-11-05 18:25:23', '2024-11-06 02:25:23', -1, '2024-11-05 18:25:23', '2024-11-06 02:24:28', '2024-11-06 02:25:23'),
(148, 39, '2024-11-05 18:50:31', '2024-11-06 02:50:31', 0, '2024-11-05 18:50:31', '2024-11-06 02:50:25', '2024-11-06 02:50:31'),
(149, 39, '2024-11-06 03:02:56', NULL, NULL, '2024-11-05 19:02:56', '2024-11-06 03:02:56', '2024-11-06 03:02:56'),
(150, 39, '2024-11-06 06:00:13', NULL, NULL, '2024-11-05 22:00:13', '2024-11-06 06:00:13', '2024-11-06 06:00:13'),
(151, 2, '2024-11-05 23:17:46', '2024-11-06 07:17:46', -1, '2024-11-05 23:17:46', '2024-11-06 07:16:39', '2024-11-06 07:17:46'),
(152, 63, '2024-11-06 00:42:56', '2024-11-06 08:42:56', -30, '2024-11-06 00:42:56', '2024-11-06 08:12:54', '2024-11-06 08:42:56'),
(153, 2, '2024-11-06 00:27:40', '2024-11-06 08:27:40', -12, '2024-11-06 00:27:40', '2024-11-06 08:15:51', '2024-11-06 08:27:40'),
(154, 38, '2024-11-06 00:29:19', '2024-11-06 08:29:19', -1, '2024-11-06 00:29:19', '2024-11-06 08:28:22', '2024-11-06 08:29:19'),
(155, 64, '2024-11-06 00:33:30', '2024-11-06 08:33:30', -3, '2024-11-06 00:33:30', '2024-11-06 08:30:25', '2024-11-06 08:33:30'),
(156, 64, '2024-11-06 00:35:39', '2024-11-06 08:35:39', 0, '2024-11-06 00:35:39', '2024-11-06 08:35:36', '2024-11-06 08:35:39'),
(157, 64, '2024-11-06 00:58:28', '2024-11-06 08:58:28', -8, '2024-11-06 00:58:28', '2024-11-06 08:50:54', '2024-11-06 08:58:28'),
(158, 38, '2024-11-06 02:46:24', '2024-11-06 10:46:24', -108, '2024-11-06 02:46:24', '2024-11-06 08:58:35', '2024-11-06 10:46:24'),
(159, 39, '2024-11-06 09:53:12', NULL, NULL, '2024-11-06 01:53:12', '2024-11-06 09:53:12', '2024-11-06 09:53:12'),
(160, 37, '2024-11-06 10:08:24', NULL, NULL, '2024-11-06 02:08:24', '2024-11-06 10:08:24', '2024-11-06 10:08:24'),
(161, 39, '2024-11-06 10:45:28', NULL, NULL, '2024-11-06 02:45:28', '2024-11-06 10:45:28', '2024-11-06 10:45:28'),
(162, 2, '2024-11-06 10:49:03', NULL, NULL, '2024-11-06 02:49:03', '2024-11-06 10:49:03', '2024-11-06 10:49:03'),
(163, 39, '2024-11-06 03:05:15', '2024-11-06 11:05:15', -16, '2024-11-06 03:05:15', '2024-11-06 10:49:10', '2024-11-06 11:05:15'),
(164, 2, '2024-11-06 02:55:22', '2024-11-06 10:55:22', -1, '2024-11-06 02:55:22', '2024-11-06 10:53:59', '2024-11-06 10:55:22'),
(165, 65, '2024-11-06 04:16:06', '2024-11-06 12:16:06', -80, '2024-11-06 04:16:06', '2024-11-06 10:56:09', '2024-11-06 12:16:06'),
(167, 38, '2024-11-06 03:09:31', '2024-11-06 11:09:31', 0, '2024-11-06 03:09:31', '2024-11-06 11:09:14', '2024-11-06 11:09:31'),
(168, 38, '2024-11-06 12:03:06', NULL, NULL, '2024-11-06 04:03:06', '2024-11-06 12:03:06', '2024-11-06 12:03:06'),
(169, 2, '2024-11-06 04:25:16', '2024-11-06 12:25:16', -9, '2024-11-06 04:25:16', '2024-11-06 12:16:17', '2024-11-06 12:25:16'),
(170, 38, '2024-11-06 06:02:11', '2024-11-06 14:02:11', -100, '2024-11-06 06:02:11', '2024-11-06 12:21:47', '2024-11-06 14:02:11'),
(171, 2, '2024-11-06 04:38:44', '2024-11-06 12:38:44', -13, '2024-11-06 04:38:44', '2024-11-06 12:25:57', '2024-11-06 12:38:44'),
(172, 65, '2024-11-06 12:39:07', NULL, NULL, '2024-11-06 04:39:07', '2024-11-06 12:39:07', '2024-11-06 12:39:07'),
(173, 2, '2024-11-06 12:42:33', NULL, NULL, '2024-11-06 04:42:33', '2024-11-06 12:42:33', '2024-11-06 12:42:33'),
(174, 39, '2024-11-06 12:52:34', NULL, NULL, '2024-11-06 04:52:34', '2024-11-06 12:52:34', '2024-11-06 12:52:34'),
(175, 39, '2024-11-06 13:00:55', NULL, NULL, '2024-11-06 05:00:55', '2024-11-06 13:00:55', '2024-11-06 13:00:55'),
(176, 2, '2024-11-06 05:42:22', '2024-11-06 13:42:22', -23, '2024-11-06 05:42:22', '2024-11-06 13:18:57', '2024-11-06 13:42:22'),
(177, 39, '2024-11-06 06:00:05', '2024-11-06 14:00:05', -22, '2024-11-06 06:00:05', '2024-11-06 13:38:25', '2024-11-06 14:00:05'),
(178, 67, '2024-11-06 13:56:47', NULL, NULL, '2024-11-06 05:56:47', '2024-11-06 13:56:47', '2024-11-06 13:56:47'),
(179, 39, '2024-11-06 14:03:44', NULL, NULL, '2024-11-06 06:03:44', '2024-11-06 14:03:44', '2024-11-06 14:03:44'),
(180, 38, '2024-11-06 10:07:29', '2024-11-06 18:07:29', -220, '2024-11-06 10:07:29', '2024-11-06 14:27:18', '2024-11-06 18:07:29'),
(181, 39, '2024-11-06 07:32:24', '2024-11-06 15:32:24', -64, '2024-11-06 07:32:24', '2024-11-06 14:28:20', '2024-11-06 15:32:24'),
(182, 2, '2024-11-06 08:13:25', '2024-11-06 16:13:25', -41, '2024-11-06 08:13:25', '2024-11-06 15:32:40', '2024-11-06 16:13:25'),
(183, 64, '2024-11-06 08:15:04', '2024-11-06 16:15:04', -1, '2024-11-06 08:15:04', '2024-11-06 16:14:05', '2024-11-06 16:15:04'),
(184, 39, '2024-11-06 08:18:28', '2024-11-06 16:18:28', -3, '2024-11-06 08:18:28', '2024-11-06 16:15:13', '2024-11-06 16:18:28'),
(185, 64, '2024-11-06 10:16:16', '2024-11-06 18:16:16', -118, '2024-11-06 10:16:16', '2024-11-06 16:18:40', '2024-11-06 18:16:16'),
(188, 2, '2024-11-06 10:08:26', '2024-11-06 18:08:26', -1, '2024-11-06 10:08:26', '2024-11-06 18:07:39', '2024-11-06 18:08:26'),
(189, 39, '2024-11-06 10:08:49', '2024-11-06 18:08:49', 0, '2024-11-06 10:08:49', '2024-11-06 18:08:36', '2024-11-06 18:08:49'),
(190, 39, '2024-11-06 11:38:48', '2024-11-06 19:38:48', -89, '2024-11-06 11:38:48', '2024-11-06 18:09:23', '2024-11-06 19:38:48'),
(191, 2, '2024-11-06 10:20:52', '2024-11-06 18:20:52', 0, '2024-11-06 10:20:52', '2024-11-06 18:20:25', '2024-11-06 18:20:52'),
(192, 37, '2024-11-06 10:34:47', '2024-11-06 18:34:47', -6, '2024-11-06 10:34:47', '2024-11-06 18:28:53', '2024-11-06 18:34:47'),
(193, 38, '2024-11-06 10:35:22', '2024-11-06 18:35:22', 0, '2024-11-06 10:35:22', '2024-11-06 18:35:12', '2024-11-06 18:35:22'),
(194, 2, '2024-11-06 12:41:05', '2024-11-06 20:41:05', -125, '2024-11-06 12:41:05', '2024-11-06 18:35:48', '2024-11-06 20:41:05'),
(195, 64, '2024-11-06 10:36:41', '2024-11-06 18:36:41', -1, '2024-11-06 10:36:41', '2024-11-06 18:35:50', '2024-11-06 18:36:41'),
(196, 37, '2024-11-06 10:44:26', '2024-11-06 18:44:26', -8, '2024-11-06 10:44:26', '2024-11-06 18:36:49', '2024-11-06 18:44:26'),
(197, 38, '2024-11-06 10:46:49', '2024-11-06 18:46:49', -2, '2024-11-06 10:46:49', '2024-11-06 18:44:52', '2024-11-06 18:46:49'),
(198, 64, '2024-11-06 10:50:18', '2024-11-06 18:50:18', -3, '2024-11-06 10:50:18', '2024-11-06 18:47:00', '2024-11-06 18:50:18'),
(199, 37, '2024-11-06 11:03:10', '2024-11-06 19:03:10', -9, '2024-11-06 11:03:10', '2024-11-06 18:53:43', '2024-11-06 19:03:10'),
(200, 64, '2024-11-06 12:11:40', '2024-11-06 20:11:40', -68, '2024-11-06 12:11:40', '2024-11-06 19:03:44', '2024-11-06 20:11:40'),
(201, 39, '2024-11-06 12:23:38', '2024-11-06 20:23:38', -1, '2024-11-06 12:23:38', '2024-11-06 20:23:03', '2024-11-06 20:23:38'),
(202, 39, '2024-11-06 12:39:05', '2024-11-06 20:39:05', -14, '2024-11-06 12:39:05', '2024-11-06 20:24:52', '2024-11-06 20:39:05'),
(203, 2, '2024-11-06 12:28:45', '2024-11-06 20:28:45', 0, '2024-11-06 12:28:45', '2024-11-06 20:28:42', '2024-11-06 20:28:45'),
(204, 2, '2024-11-06 12:41:32', '2024-11-06 20:41:32', 0, '2024-11-06 12:41:32', '2024-11-06 20:41:11', '2024-11-06 20:41:32'),
(205, 2, '2024-11-06 13:18:30', '2024-11-06 21:18:30', 0, '2024-11-06 13:18:30', '2024-11-06 21:18:27', '2024-11-06 21:18:30'),
(206, 70, '2024-11-06 21:26:53', NULL, NULL, '2024-11-06 13:26:53', '2024-11-06 21:26:53', '2024-11-06 21:26:53'),
(207, 70, '2024-11-06 13:28:48', '2024-11-06 21:28:48', 0, '2024-11-06 13:28:48', '2024-11-06 21:28:36', '2024-11-06 21:28:48'),
(208, 70, '2024-11-06 13:30:47', '2024-11-06 21:30:47', -2, '2024-11-06 13:30:47', '2024-11-06 21:29:14', '2024-11-06 21:30:47'),
(209, 70, '2024-11-06 13:32:36', '2024-11-06 21:32:36', 0, '2024-11-06 13:32:36', '2024-11-06 21:32:09', '2024-11-06 21:32:36'),
(210, 70, '2024-11-06 13:32:49', '2024-11-06 21:32:49', 0, '2024-11-06 13:32:49', '2024-11-06 21:32:45', '2024-11-06 21:32:49'),
(211, 70, '2024-11-06 13:33:20', '2024-11-06 21:33:20', 0, '2024-11-06 13:33:20', '2024-11-06 21:33:16', '2024-11-06 21:33:20'),
(212, 70, '2024-11-06 13:35:22', '2024-11-06 21:35:22', 0, '2024-11-06 13:35:22', '2024-11-06 21:35:04', '2024-11-06 21:35:22'),
(213, 70, '2024-11-06 13:36:04', '2024-11-06 21:36:04', 0, '2024-11-06 13:36:04', '2024-11-06 21:36:01', '2024-11-06 21:36:04'),
(214, 2, '2024-11-06 13:36:17', '2024-11-06 21:36:17', 0, '2024-11-06 13:36:17', '2024-11-06 21:36:14', '2024-11-06 21:36:17'),
(215, 38, '2024-11-06 13:36:37', '2024-11-06 21:36:37', 0, '2024-11-06 13:36:37', '2024-11-06 21:36:35', '2024-11-06 21:36:37'),
(216, 38, '2024-11-06 13:49:12', '2024-11-06 21:49:12', 0, '2024-11-06 13:49:12', '2024-11-06 21:48:56', '2024-11-06 21:49:12'),
(217, 38, '2024-11-06 13:50:27', '2024-11-06 21:50:27', 0, '2024-11-06 13:50:27', '2024-11-06 21:50:22', '2024-11-06 21:50:27'),
(218, 71, '2024-11-06 14:01:11', '2024-11-06 22:01:11', -2, '2024-11-06 14:01:11', '2024-11-06 21:59:39', '2024-11-06 22:01:11'),
(219, 71, '2024-11-06 14:03:40', '2024-11-06 22:03:40', -2, '2024-11-06 14:03:40', '2024-11-06 22:01:45', '2024-11-06 22:03:40'),
(220, 71, '2024-11-06 22:03:46', NULL, NULL, '2024-11-06 14:03:46', '2024-11-06 22:03:46', '2024-11-06 22:03:46'),
(221, 71, '2024-11-06 14:05:33', '2024-11-06 22:05:33', -1, '2024-11-06 14:05:33', '2024-11-06 22:04:09', '2024-11-06 22:05:33'),
(222, 38, '2024-11-06 14:04:53', '2024-11-06 22:04:53', -1, '2024-11-06 14:04:53', '2024-11-06 22:04:12', '2024-11-06 22:04:53'),
(223, 2, '2024-11-06 14:07:28', '2024-11-06 22:07:28', -2, '2024-11-06 14:07:28', '2024-11-06 22:05:04', '2024-11-06 22:07:28'),
(224, 71, '2024-11-06 14:06:32', '2024-11-06 22:06:32', 0, '2024-11-06 14:06:32', '2024-11-06 22:06:24', '2024-11-06 22:06:32'),
(225, 71, '2024-11-06 14:22:57', '2024-11-06 22:22:57', 0, '2024-11-06 14:22:57', '2024-11-06 22:22:51', '2024-11-06 22:22:57'),
(226, 71, '2024-11-06 14:23:09', '2024-11-06 22:23:09', 0, '2024-11-06 14:23:09', '2024-11-06 22:23:02', '2024-11-06 22:23:09'),
(227, 2, '2024-11-06 14:33:49', '2024-11-06 22:33:49', 0, '2024-11-06 14:33:49', '2024-11-06 22:33:36', '2024-11-06 22:33:49'),
(228, 2, '2024-11-06 14:45:52', '2024-11-06 22:45:52', -2, '2024-11-06 14:45:52', '2024-11-06 22:43:24', '2024-11-06 22:45:52'),
(229, 37, '2024-11-06 14:46:26', '2024-11-06 22:46:26', 0, '2024-11-06 14:46:26', '2024-11-06 22:46:06', '2024-11-06 22:46:26'),
(230, 40, '2024-11-06 22:52:10', NULL, NULL, '2024-11-06 14:52:10', '2024-11-06 22:52:10', '2024-11-06 22:52:10'),
(231, 40, '2024-11-06 14:53:03', '2024-11-06 22:53:03', 0, '2024-11-06 14:53:03', '2024-11-06 22:52:41', '2024-11-06 22:53:03'),
(232, 37, '2024-11-06 16:08:55', '2024-11-07 00:08:55', -67, '2024-11-06 16:08:55', '2024-11-06 23:02:09', '2024-11-07 00:08:55'),
(233, 2, '2024-11-06 16:33:50', '2024-11-07 00:33:50', -25, '2024-11-06 16:33:50', '2024-11-07 00:09:01', '2024-11-07 00:33:50'),
(234, 37, '2024-11-06 17:47:43', '2024-11-07 01:47:43', -72, '2024-11-06 17:47:43', '2024-11-07 00:35:47', '2024-11-07 01:47:43'),
(235, 37, '2024-11-06 17:57:23', '2024-11-07 01:57:23', -9, '2024-11-06 17:57:23', '2024-11-07 01:47:54', '2024-11-07 01:57:23'),
(236, 37, '2024-11-07 01:57:34', NULL, NULL, '2024-11-06 17:57:34', '2024-11-07 01:57:34', '2024-11-07 01:57:34'),
(237, 2, '2024-11-06 22:37:39', '2024-11-07 06:37:39', -1, '2024-11-06 22:37:39', '2024-11-07 06:37:07', '2024-11-07 06:37:39'),
(238, 38, '2024-11-06 22:39:10', '2024-11-07 06:39:10', -1, '2024-11-06 22:39:10', '2024-11-07 06:37:45', '2024-11-07 06:39:10'),
(239, 2, '2024-11-07 00:46:41', '2024-11-07 08:46:41', -74, '2024-11-07 00:46:41', '2024-11-07 07:32:49', '2024-11-07 08:46:41'),
(240, 38, '2024-11-07 01:47:08', '2024-11-07 09:47:08', -2, '2024-11-07 01:47:08', '2024-11-07 09:45:34', '2024-11-07 09:47:08'),
(241, 64, '2024-11-07 01:49:26', '2024-11-07 09:49:26', -2, '2024-11-07 01:49:26', '2024-11-07 09:47:44', '2024-11-07 09:49:26'),
(242, 38, '2024-11-07 09:48:12', NULL, NULL, '2024-11-07 01:48:12', '2024-11-07 09:48:12', '2024-11-07 09:48:12'),
(243, 39, '2024-11-07 10:40:09', NULL, NULL, '2024-11-07 02:40:09', '2024-11-07 10:40:09', '2024-11-07 10:40:09'),
(244, 39, '2024-11-07 10:51:55', NULL, NULL, '2024-11-07 02:51:55', '2024-11-07 10:51:55', '2024-11-07 10:51:55'),
(245, 37, '2024-11-07 04:34:04', '2024-11-07 12:34:04', -28, '2024-11-07 04:34:04', '2024-11-07 12:06:12', '2024-11-07 12:34:04'),
(246, 2, '2024-11-07 04:34:21', '2024-11-07 12:34:21', 0, '2024-11-07 04:34:21', '2024-11-07 12:34:14', '2024-11-07 12:34:21'),
(247, 38, '2024-11-07 06:02:11', '2024-11-07 14:02:11', -87, '2024-11-07 06:02:11', '2024-11-07 12:34:56', '2024-11-07 14:02:11'),
(248, 39, '2024-11-07 05:22:03', '2024-11-07 13:22:03', -19, '2024-11-07 05:22:03', '2024-11-07 13:03:26', '2024-11-07 13:22:03'),
(249, 2, '2024-11-07 05:14:09', '2024-11-07 13:14:09', -1, '2024-11-07 05:14:09', '2024-11-07 13:13:14', '2024-11-07 13:14:09'),
(250, 2, '2024-11-07 13:19:41', NULL, NULL, '2024-11-07 05:19:41', '2024-11-07 13:19:41', '2024-11-07 13:19:41'),
(251, 48, '2024-11-07 05:25:53', '2024-11-07 13:25:53', -4, '2024-11-07 05:25:53', '2024-11-07 13:22:13', '2024-11-07 13:25:53'),
(252, 39, '2024-11-07 13:26:29', NULL, NULL, '2024-11-07 05:26:29', '2024-11-07 13:26:29', '2024-11-07 13:26:29'),
(253, 48, '2024-11-07 13:26:42', NULL, NULL, '2024-11-07 05:26:42', '2024-11-07 13:26:42', '2024-11-07 13:26:42'),
(254, 72, '2024-11-07 05:36:38', '2024-11-07 13:36:38', 0, '2024-11-07 05:36:38', '2024-11-07 13:36:28', '2024-11-07 13:36:38'),
(255, 38, '2024-11-07 06:02:20', '2024-11-07 14:02:20', 0, '2024-11-07 06:02:20', '2024-11-07 14:02:15', '2024-11-07 14:02:20'),
(256, 37, '2024-11-07 06:06:08', '2024-11-07 14:06:08', -4, '2024-11-07 06:06:08', '2024-11-07 14:02:31', '2024-11-07 14:06:08'),
(257, 38, '2024-11-07 06:58:27', '2024-11-07 14:58:27', -52, '2024-11-07 06:58:27', '2024-11-07 14:06:14', '2024-11-07 14:58:27'),
(258, 38, '2024-11-07 14:58:33', NULL, NULL, '2024-11-07 06:58:33', '2024-11-07 14:58:33', '2024-11-07 14:58:33'),
(259, 37, '2024-11-07 15:15:11', NULL, NULL, '2024-11-07 07:15:11', '2024-11-07 15:15:11', '2024-11-07 15:15:11'),
(260, 2, '2024-11-07 09:21:14', '2024-11-07 17:21:14', -37, '2024-11-07 09:21:14', '2024-11-07 16:43:59', '2024-11-07 17:21:14'),
(261, 39, '2024-11-07 09:21:48', '2024-11-07 17:21:48', -17, '2024-11-07 09:21:48', '2024-11-07 17:05:01', '2024-11-07 17:21:48'),
(262, 38, '2024-11-07 17:17:21', NULL, NULL, '2024-11-07 09:17:21', '2024-11-07 17:17:21', '2024-11-07 17:17:21'),
(263, 48, '2024-11-07 09:23:06', '2024-11-07 17:23:06', -1, '2024-11-07 09:23:06', '2024-11-07 17:21:44', '2024-11-07 17:23:06'),
(264, 2, '2024-11-07 17:22:05', NULL, NULL, '2024-11-07 09:22:05', '2024-11-07 17:22:05', '2024-11-07 17:22:05'),
(265, 39, '2024-11-07 09:48:30', '2024-11-07 17:48:30', -25, '2024-11-07 09:48:30', '2024-11-07 17:23:14', '2024-11-07 17:48:30'),
(266, 2, '2024-11-07 09:35:43', '2024-11-07 17:35:43', -1, '2024-11-07 09:35:43', '2024-11-07 17:34:46', '2024-11-07 17:35:43'),
(267, 2, '2024-11-07 09:42:02', '2024-11-07 17:42:02', -4, '2024-11-07 09:42:02', '2024-11-07 17:37:38', '2024-11-07 17:42:02'),
(268, 38, '2024-11-07 09:42:44', '2024-11-07 17:42:44', -1, '2024-11-07 09:42:44', '2024-11-07 17:42:07', '2024-11-07 17:42:44'),
(269, 2, '2024-11-07 09:43:17', '2024-11-07 17:43:17', 0, '2024-11-07 09:43:17', '2024-11-07 17:42:52', '2024-11-07 17:43:17'),
(270, 38, '2024-11-07 09:47:28', '2024-11-07 17:47:28', -4, '2024-11-07 09:47:28', '2024-11-07 17:43:25', '2024-11-07 17:47:28'),
(271, 38, '2024-11-07 10:41:06', '2024-11-07 18:41:06', -7, '2024-11-07 10:41:06', '2024-11-07 18:34:14', '2024-11-07 18:41:06'),
(272, 2, '2024-11-07 18:41:15', NULL, NULL, '2024-11-07 10:41:15', '2024-11-07 18:41:15', '2024-11-07 18:41:15'),
(273, 39, '2024-11-07 18:48:06', NULL, NULL, '2024-11-07 10:48:06', '2024-11-07 18:48:06', '2024-11-07 18:48:06'),
(274, 38, '2024-11-07 12:44:50', '2024-11-07 20:44:50', -100, '2024-11-07 12:44:50', '2024-11-07 19:04:56', '2024-11-07 20:44:50'),
(275, 38, '2024-11-07 12:00:59', '2024-11-07 20:00:59', -3, '2024-11-07 12:00:59', '2024-11-07 19:57:46', '2024-11-07 20:00:59'),
(276, 39, '2024-11-07 13:49:59', '2024-11-07 21:49:59', -109, '2024-11-07 13:49:59', '2024-11-07 20:01:24', '2024-11-07 21:49:59'),
(277, 40, '2024-11-07 12:45:12', '2024-11-07 20:45:12', 0, '2024-11-07 12:45:12', '2024-11-07 20:45:06', '2024-11-07 20:45:12'),
(278, 70, '2024-11-07 12:45:26', '2024-11-07 20:45:26', 0, '2024-11-07 12:45:26', '2024-11-07 20:45:22', '2024-11-07 20:45:26'),
(279, 37, '2024-11-07 12:45:50', '2024-11-07 20:45:50', 0, '2024-11-07 12:45:50', '2024-11-07 20:45:38', '2024-11-07 20:45:50'),
(280, 40, '2024-11-07 12:46:34', '2024-11-07 20:46:34', 0, '2024-11-07 12:46:34', '2024-11-07 20:46:30', '2024-11-07 20:46:34'),
(281, 37, '2024-11-07 12:49:56', '2024-11-07 20:49:56', -2, '2024-11-07 12:49:56', '2024-11-07 20:47:45', '2024-11-07 20:49:56'),
(282, 37, '2024-11-07 12:54:32', '2024-11-07 20:54:32', 0, '2024-11-07 12:54:32', '2024-11-07 20:54:12', '2024-11-07 20:54:32'),
(283, 37, '2024-11-07 13:53:06', '2024-11-07 21:53:06', -20, '2024-11-07 13:53:06', '2024-11-07 21:32:42', '2024-11-07 21:53:06'),
(284, 2, '2024-11-07 15:08:46', '2024-11-07 23:08:46', -80, '2024-11-07 15:08:46', '2024-11-07 21:49:10', '2024-11-07 23:08:46'),
(285, 39, '2024-11-07 13:51:51', '2024-11-07 21:51:51', -2, '2024-11-07 13:51:51', '2024-11-07 21:50:21', '2024-11-07 21:51:51'),
(286, 48, '2024-11-07 21:51:59', NULL, NULL, '2024-11-07 13:51:59', '2024-11-07 21:51:59', '2024-11-07 21:51:59'),
(287, 2, '2024-11-07 13:53:15', '2024-11-07 21:53:15', 0, '2024-11-07 13:53:15', '2024-11-07 21:53:12', '2024-11-07 21:53:15'),
(288, 37, '2024-11-07 14:39:28', '2024-11-07 22:39:28', -46, '2024-11-07 14:39:28', '2024-11-07 21:53:26', '2024-11-07 22:39:28'),
(289, 2, '2024-11-07 13:56:50', '2024-11-07 21:56:50', 0, '2024-11-07 13:56:50', '2024-11-07 21:56:23', '2024-11-07 21:56:50'),
(290, 39, '2024-11-07 16:28:18', '2024-11-08 00:28:18', -151, '2024-11-07 16:28:18', '2024-11-07 21:57:03', '2024-11-08 00:28:18'),
(291, 2, '2024-11-07 14:47:30', '2024-11-07 22:47:30', -3, '2024-11-07 14:47:30', '2024-11-07 22:44:52', '2024-11-07 22:47:30'),
(292, 2, '2024-11-07 14:48:43', '2024-11-07 22:48:43', -1, '2024-11-07 14:48:43', '2024-11-07 22:47:45', '2024-11-07 22:48:43'),
(293, 37, '2024-11-07 17:01:26', '2024-11-08 01:01:26', -127, '2024-11-07 17:01:26', '2024-11-07 22:54:35', '2024-11-08 01:01:26'),
(294, 38, '2024-11-07 15:13:42', '2024-11-07 23:13:42', -5, '2024-11-07 15:13:42', '2024-11-07 23:08:53', '2024-11-07 23:13:42'),
(295, 2, '2024-11-07 15:45:49', '2024-11-07 23:45:49', -32, '2024-11-07 15:45:49', '2024-11-07 23:13:48', '2024-11-07 23:45:49'),
(296, 38, '2024-11-07 15:54:50', '2024-11-07 23:54:50', -9, '2024-11-07 15:54:50', '2024-11-07 23:45:55', '2024-11-07 23:54:50'),
(297, 2, '2024-11-07 15:58:51', '2024-11-07 23:58:51', -4, '2024-11-07 15:58:51', '2024-11-07 23:54:56', '2024-11-07 23:58:51'),
(298, 38, '2024-11-07 16:06:43', '2024-11-08 00:06:43', -8, '2024-11-07 16:06:43', '2024-11-07 23:58:57', '2024-11-08 00:06:43'),
(299, 2, '2024-11-07 16:19:41', '2024-11-08 00:19:41', -13, '2024-11-07 16:19:41', '2024-11-08 00:06:49', '2024-11-08 00:19:41'),
(300, 2, '2024-11-07 16:28:04', '2024-11-08 00:28:04', -5, '2024-11-07 16:28:04', '2024-11-08 00:22:35', '2024-11-08 00:28:04'),
(301, 38, '2024-11-07 17:30:58', '2024-11-08 01:30:58', -40, '2024-11-07 17:30:58', '2024-11-08 00:50:44', '2024-11-08 01:30:58'),
(302, 2, '2024-11-07 17:31:05', '2024-11-08 01:31:05', -40, '2024-11-07 17:31:05', '2024-11-08 00:50:57', '2024-11-08 01:31:05'),
(303, 37, '2024-11-08 01:01:35', NULL, NULL, '2024-11-07 17:01:35', '2024-11-08 01:01:35', '2024-11-08 01:01:35'),
(304, 2, '2024-11-08 01:02:20', '2024-11-08 09:02:20', -2, '2024-11-08 01:02:20', '2024-11-08 09:00:20', '2024-11-08 09:02:20'),
(305, 38, '2024-11-08 01:26:09', '2024-11-08 09:26:09', -24, '2024-11-08 01:26:09', '2024-11-08 09:02:26', '2024-11-08 09:26:09'),
(306, 2, '2024-11-08 01:27:46', '2024-11-08 09:27:46', -2, '2024-11-08 01:27:46', '2024-11-08 09:26:16', '2024-11-08 09:27:46'),
(307, 38, '2024-11-08 01:32:17', '2024-11-08 09:32:17', -2, '2024-11-08 01:32:17', '2024-11-08 09:30:07', '2024-11-08 09:32:17'),
(308, 2, '2024-11-08 01:33:20', '2024-11-08 09:33:20', -1, '2024-11-08 01:33:20', '2024-11-08 09:32:25', '2024-11-08 09:33:20'),
(309, 38, '2024-11-08 01:34:01', '2024-11-08 09:34:01', -1, '2024-11-08 01:34:01', '2024-11-08 09:33:26', '2024-11-08 09:34:01'),
(310, 2, '2024-11-08 02:19:50', '2024-11-08 10:19:50', -34, '2024-11-08 02:19:50', '2024-11-08 09:45:32', '2024-11-08 10:19:50'),
(311, 38, '2024-11-08 02:22:18', '2024-11-08 10:22:18', -2, '2024-11-08 02:22:18', '2024-11-08 10:19:58', '2024-11-08 10:22:18'),
(312, 38, '2024-11-08 13:19:55', '2024-11-08 21:19:55', -194, '2024-11-08 13:19:55', '2024-11-08 18:05:50', '2024-11-08 21:19:55'),
(313, 39, '2024-11-08 14:53:39', '2024-11-08 22:53:39', -269, '2024-11-08 14:53:39', '2024-11-08 18:24:12', '2024-11-08 22:53:39'),
(314, 2, '2024-11-08 14:30:26', '2024-11-08 22:30:26', -70, '2024-11-08 14:30:26', '2024-11-08 21:20:01', '2024-11-08 22:30:26'),
(315, 38, '2024-11-08 15:20:39', '2024-11-08 23:20:39', -50, '2024-11-08 15:20:39', '2024-11-08 22:30:31', '2024-11-08 23:20:39'),
(316, 38, '2024-11-08 15:39:35', '2024-11-08 23:39:35', -3, '2024-11-08 15:39:35', '2024-11-08 23:36:26', '2024-11-08 23:39:35'),
(317, 37, '2024-11-08 16:35:54', '2024-11-09 00:35:54', -36, '2024-11-08 16:35:54', '2024-11-08 23:59:27', '2024-11-09 00:35:54'),
(318, 2, '2024-11-08 16:54:47', '2024-11-09 00:54:47', -19, '2024-11-08 16:54:47', '2024-11-09 00:35:59', '2024-11-09 00:54:47'),
(319, 37, '2024-11-08 16:55:45', '2024-11-09 00:55:45', -1, '2024-11-08 16:55:45', '2024-11-09 00:54:59', '2024-11-09 00:55:45'),
(320, 2, '2024-11-08 16:56:34', '2024-11-09 00:56:34', -1, '2024-11-08 16:56:34', '2024-11-09 00:55:54', '2024-11-09 00:56:34'),
(321, 37, '2024-11-08 17:53:57', '2024-11-09 01:53:57', -57, '2024-11-08 17:53:57', '2024-11-09 00:56:43', '2024-11-09 01:53:57'),
(322, 37, '2024-11-09 01:54:05', NULL, NULL, '2024-11-08 17:54:05', '2024-11-09 01:54:05', '2024-11-09 01:54:05'),
(323, 2, '2024-11-09 02:42:39', NULL, NULL, '2024-11-08 18:42:39', '2024-11-09 02:42:39', '2024-11-09 02:42:39'),
(324, 39, '2024-11-09 04:46:33', NULL, NULL, '2024-11-08 20:46:33', '2024-11-09 04:46:33', '2024-11-09 04:46:33'),
(325, 39, '2024-11-09 07:23:06', NULL, NULL, '2024-11-08 23:23:06', '2024-11-09 07:23:06', '2024-11-09 07:23:06'),
(326, 38, '2024-11-09 01:36:19', '2024-11-09 09:36:19', -95, '2024-11-09 01:36:19', '2024-11-09 08:01:36', '2024-11-09 09:36:19'),
(327, 39, '2024-11-09 00:49:33', '2024-11-09 08:49:33', -48, '2024-11-09 00:49:33', '2024-11-09 08:01:50', '2024-11-09 08:49:33'),
(328, 2, '2024-11-09 01:36:15', '2024-11-09 09:36:15', -47, '2024-11-09 01:36:15', '2024-11-09 08:49:38', '2024-11-09 09:36:15'),
(329, 38, '2024-11-09 03:50:53', '2024-11-09 11:50:53', -3, '2024-11-09 03:50:53', '2024-11-09 11:47:48', '2024-11-09 11:50:53'),
(330, 38, '2024-11-09 04:03:01', '2024-11-09 12:03:01', -10, '2024-11-09 04:03:01', '2024-11-09 11:52:42', '2024-11-09 12:03:01'),
(331, 2, '2024-11-09 05:41:23', '2024-11-09 13:41:23', -98, '2024-11-09 05:41:23', '2024-11-09 12:03:43', '2024-11-09 13:41:23'),
(332, 2, '2024-11-09 14:29:44', NULL, NULL, '2024-11-09 06:29:44', '2024-11-09 14:29:44', '2024-11-09 14:29:44'),
(333, 39, '2024-11-09 14:30:26', NULL, NULL, '2024-11-09 06:30:26', '2024-11-09 14:30:26', '2024-11-09 14:30:26'),
(334, 2, '2024-11-09 06:58:06', '2024-11-09 14:58:06', 0, '2024-11-09 06:58:06', '2024-11-09 14:57:45', '2024-11-09 14:58:06'),
(335, 38, '2024-11-09 07:09:46', '2024-11-09 15:09:46', -9, '2024-11-09 07:09:46', '2024-11-09 15:00:45', '2024-11-09 15:09:46'),
(336, 2, '2024-11-09 08:00:52', '2024-11-09 16:00:52', -51, '2024-11-09 08:00:52', '2024-11-09 15:09:52', '2024-11-09 16:00:52'),
(337, 37, '2024-11-09 08:15:12', '2024-11-09 16:15:12', -59, '2024-11-09 08:15:12', '2024-11-09 15:16:40', '2024-11-09 16:15:12'),
(338, 39, '2024-11-09 08:01:39', '2024-11-09 16:01:39', -29, '2024-11-09 08:01:39', '2024-11-09 15:32:30', '2024-11-09 16:01:39'),
(339, 38, '2024-11-09 10:13:00', '2024-11-09 18:13:00', -132, '2024-11-09 10:13:00', '2024-11-09 16:00:59', '2024-11-09 18:13:00'),
(340, 2, '2024-11-09 08:02:02', '2024-11-09 16:02:02', 0, '2024-11-09 08:02:02', '2024-11-09 16:01:44', '2024-11-09 16:02:02'),
(341, 2, '2024-11-09 08:20:42', '2024-11-09 16:20:42', -5, '2024-11-09 08:20:42', '2024-11-09 16:15:16', '2024-11-09 16:20:42'),
(342, 37, '2024-11-09 08:34:28', '2024-11-09 16:34:28', -14, '2024-11-09 08:34:28', '2024-11-09 16:20:51', '2024-11-09 16:34:28'),
(343, 37, '2024-11-09 08:43:38', '2024-11-09 16:43:38', -9, '2024-11-09 08:43:38', '2024-11-09 16:34:43', '2024-11-09 16:43:38'),
(344, 2, '2024-11-09 16:43:42', NULL, NULL, '2024-11-09 08:43:42', '2024-11-09 16:43:42', '2024-11-09 16:43:42'),
(345, 2, '2024-11-09 09:49:40', '2024-11-09 17:49:40', -66, '2024-11-09 09:49:40', '2024-11-09 16:43:55', '2024-11-09 17:49:40'),
(346, 39, '2024-11-09 09:20:12', '2024-11-09 17:20:12', -11, '2024-11-09 09:20:12', '2024-11-09 17:09:02', '2024-11-09 17:20:12'),
(347, 2, '2024-11-09 09:28:21', '2024-11-09 17:28:21', -8, '2024-11-09 09:28:21', '2024-11-09 17:20:19', '2024-11-09 17:28:21'),
(348, 37, '2024-11-09 10:19:21', '2024-11-09 18:19:21', -51, '2024-11-09 10:19:21', '2024-11-09 17:28:35', '2024-11-09 18:19:21'),
(349, 39, '2024-11-09 10:01:26', '2024-11-09 18:01:26', -12, '2024-11-09 10:01:26', '2024-11-09 17:49:54', '2024-11-09 18:01:26'),
(350, 39, '2024-11-09 10:06:52', '2024-11-09 18:06:52', -1, '2024-11-09 10:06:52', '2024-11-09 18:06:11', '2024-11-09 18:06:52'),
(351, 2, '2024-11-09 10:12:14', '2024-11-09 18:12:14', -2, '2024-11-09 10:12:14', '2024-11-09 18:10:41', '2024-11-09 18:12:14'),
(352, 39, '2024-11-09 10:13:02', '2024-11-09 18:13:02', -1, '2024-11-09 10:13:02', '2024-11-09 18:12:22', '2024-11-09 18:13:02'),
(353, 38, '2024-11-09 10:14:49', '2024-11-09 18:14:49', 0, '2024-11-09 10:14:49', '2024-11-09 18:14:42', '2024-11-09 18:14:49'),
(354, 2, '2024-11-09 10:24:03', '2024-11-09 18:24:03', -5, '2024-11-09 10:24:03', '2024-11-09 18:19:27', '2024-11-09 18:24:03'),
(355, 37, '2024-11-09 18:24:13', NULL, NULL, '2024-11-09 10:24:13', '2024-11-09 18:24:13', '2024-11-09 18:24:13'),
(356, 2, '2024-11-09 11:53:54', '2024-11-09 19:53:54', 0, '2024-11-09 11:53:54', '2024-11-09 19:53:50', '2024-11-09 19:53:54'),
(357, 39, '2024-11-09 19:58:02', NULL, NULL, '2024-11-09 11:58:02', '2024-11-09 19:58:02', '2024-11-09 19:58:02'),
(358, 37, '2024-11-09 14:17:50', '2024-11-09 22:17:50', -73, '2024-11-09 14:17:50', '2024-11-09 21:04:43', '2024-11-09 22:17:50'),
(359, 2, '2024-11-09 21:20:14', NULL, NULL, '2024-11-09 13:20:14', '2024-11-09 21:20:14', '2024-11-09 21:20:14'),
(360, 39, '2024-11-09 21:24:13', NULL, NULL, '2024-11-09 13:24:13', '2024-11-09 21:24:13', '2024-11-09 21:24:13'),
(361, 2, '2024-11-09 15:43:44', '2024-11-09 23:43:44', -92, '2024-11-09 15:43:44', '2024-11-09 22:11:34', '2024-11-09 23:43:44'),
(362, 2, '2024-11-09 14:22:00', '2024-11-09 22:22:00', -4, '2024-11-09 14:22:00', '2024-11-09 22:17:54', '2024-11-09 22:22:00'),
(363, 37, '2024-11-09 14:32:30', '2024-11-09 22:32:30', -10, '2024-11-09 14:32:30', '2024-11-09 22:22:11', '2024-11-09 22:32:30'),
(364, 37, '2024-11-09 22:33:02', NULL, NULL, '2024-11-09 14:33:02', '2024-11-09 22:33:02', '2024-11-09 22:33:02'),
(365, 38, '2024-11-09 16:03:26', '2024-11-10 00:03:26', -76, '2024-11-09 16:03:26', '2024-11-09 22:47:28', '2024-11-10 00:03:26'),
(366, 2, '2024-11-09 15:56:50', '2024-11-09 23:56:50', -13, '2024-11-09 15:56:50', '2024-11-09 23:43:49', '2024-11-09 23:56:50'),
(367, 38, '2024-11-09 16:10:19', '2024-11-10 00:10:19', -6, '2024-11-09 16:10:19', '2024-11-10 00:04:20', '2024-11-10 00:10:19'),
(368, 39, '2024-11-09 19:15:51', '2024-11-10 03:15:51', 0, '2024-11-09 19:15:51', '2024-11-10 03:15:39', '2024-11-10 03:15:51'),
(369, 48, '2024-11-10 03:16:07', NULL, NULL, '2024-11-09 19:16:07', '2024-11-10 03:16:07', '2024-11-10 03:16:07'),
(370, 38, '2024-11-10 01:34:20', '2024-11-10 09:34:20', -38, '2024-11-10 01:34:20', '2024-11-10 08:56:27', '2024-11-10 09:34:20'),
(371, 39, '2024-11-10 01:23:46', '2024-11-10 09:23:46', -11, '2024-11-10 01:23:46', '2024-11-10 09:12:33', '2024-11-10 09:23:46'),
(372, 2, '2024-11-10 09:16:13', NULL, NULL, '2024-11-10 01:16:13', '2024-11-10 09:16:13', '2024-11-10 09:16:13'),
(373, 2, '2024-11-10 01:35:11', '2024-11-10 09:35:11', -11, '2024-11-10 01:35:11', '2024-11-10 09:24:01', '2024-11-10 09:35:11'),
(374, 39, '2024-11-10 01:35:32', '2024-11-10 09:35:32', 0, '2024-11-10 01:35:32', '2024-11-10 09:35:23', '2024-11-10 09:35:32'),
(375, 38, '2024-11-10 01:44:11', '2024-11-10 09:44:11', -2, '2024-11-10 01:44:11', '2024-11-10 09:42:36', '2024-11-10 09:44:11'),
(376, 38, '2024-11-10 03:33:47', '2024-11-10 11:33:47', -10, '2024-11-10 03:33:47', '2024-11-10 11:23:45', '2024-11-10 11:33:47'),
(377, 2, '2024-11-10 03:45:54', '2024-11-10 11:45:54', -12, '2024-11-10 03:45:54', '2024-11-10 11:33:56', '2024-11-10 11:45:54'),
(378, 38, '2024-11-10 03:45:08', '2024-11-10 11:45:08', -7, '2024-11-10 03:45:08', '2024-11-10 11:38:05', '2024-11-10 11:45:08'),
(379, 38, '2024-11-10 05:42:17', '2024-11-10 13:42:17', -6, '2024-11-10 05:42:17', '2024-11-10 13:35:58', '2024-11-10 13:42:17'),
(380, 39, '2024-11-10 05:42:13', '2024-11-10 13:42:13', -6, '2024-11-10 05:42:13', '2024-11-10 13:36:10', '2024-11-10 13:42:13'),
(381, 38, '2024-11-10 05:46:37', '2024-11-10 13:46:37', -1, '2024-11-10 05:46:37', '2024-11-10 13:45:47', '2024-11-10 13:46:37'),
(382, 2, '2024-11-10 16:58:48', NULL, NULL, '2024-11-10 08:58:48', '2024-11-10 16:58:48', '2024-11-10 16:58:48'),
(383, 37, '2024-11-10 14:09:41', '2024-11-10 22:09:41', -1, '2024-11-10 14:09:41', '2024-11-10 22:08:17', '2024-11-10 22:09:41'),
(384, 2, '2024-11-10 14:09:55', '2024-11-10 22:09:55', 0, '2024-11-10 14:09:55', '2024-11-10 22:09:49', '2024-11-10 22:09:55'),
(385, 40, '2024-11-10 22:10:07', NULL, NULL, '2024-11-10 14:10:07', '2024-11-10 22:10:07', '2024-11-10 22:10:07'),
(386, 38, '2024-11-11 11:39:10', '2024-11-11 19:39:10', -71, '2024-11-11 11:39:10', '2024-11-11 18:27:42', '2024-11-11 19:39:10'),
(387, 39, '2024-11-11 10:34:14', '2024-11-11 18:34:14', -1, '2024-11-11 10:34:14', '2024-11-11 18:33:14', '2024-11-11 18:34:14'),
(388, 2, '2024-11-11 10:35:12', '2024-11-11 18:35:12', -1, '2024-11-11 10:35:12', '2024-11-11 18:34:20', '2024-11-11 18:35:12'),
(389, 39, '2024-11-11 11:21:28', '2024-11-11 19:21:28', -4, '2024-11-11 11:21:28', '2024-11-11 19:17:49', '2024-11-11 19:21:28'),
(390, 73, '2024-11-11 20:52:03', NULL, NULL, '2024-11-11 12:52:03', '2024-11-11 20:52:03', '2024-11-11 20:52:03'),
(391, 73, '2024-11-11 20:53:23', NULL, NULL, '2024-11-11 12:53:23', '2024-11-11 20:53:23', '2024-11-11 20:53:23'),
(392, 73, '2024-11-11 20:53:56', NULL, NULL, '2024-11-11 12:53:56', '2024-11-11 20:53:56', '2024-11-11 20:53:56'),
(393, 37, '2024-11-11 21:28:44', NULL, NULL, '2024-11-11 13:28:44', '2024-11-11 21:28:44', '2024-11-11 21:28:44'),
(394, 2, '2024-11-11 22:10:45', NULL, NULL, '2024-11-11 14:10:45', '2024-11-11 22:10:45', '2024-11-11 22:10:45'),
(395, 39, '2024-11-11 22:11:02', NULL, NULL, '2024-11-11 14:11:02', '2024-11-11 22:11:02', '2024-11-11 22:11:02'),
(396, 39, '2024-11-12 01:42:35', NULL, NULL, '2024-11-11 17:42:35', '2024-11-12 01:42:35', '2024-11-12 01:42:35'),
(397, 38, '2024-11-11 17:48:37', '2024-11-12 01:48:37', -3, '2024-11-11 17:48:37', '2024-11-12 01:45:10', '2024-11-12 01:48:37'),
(398, 39, '2024-11-12 07:30:32', NULL, NULL, '2024-11-11 23:30:32', '2024-11-12 07:30:32', '2024-11-12 07:30:32'),
(399, 2, '2024-11-12 00:23:09', '2024-11-12 08:23:09', -1, '2024-11-12 00:23:09', '2024-11-12 08:21:53', '2024-11-12 08:23:09'),
(400, 37, '2024-11-12 00:23:50', '2024-11-12 08:23:50', 0, '2024-11-12 00:23:50', '2024-11-12 08:23:22', '2024-11-12 08:23:50'),
(401, 38, '2024-11-12 00:35:29', '2024-11-12 08:35:29', 0, '2024-11-12 00:35:29', '2024-11-12 08:35:17', '2024-11-12 08:35:29'),
(402, 39, '2024-11-12 01:13:58', '2024-11-12 09:13:58', -38, '2024-11-12 01:13:58', '2024-11-12 08:35:48', '2024-11-12 09:13:58'),
(403, 38, '2024-11-12 01:13:47', '2024-11-12 09:13:47', -12, '2024-11-12 01:13:47', '2024-11-12 09:02:10', '2024-11-12 09:13:47'),
(404, 64, '2024-11-12 01:14:49', '2024-11-12 09:14:49', -1, '2024-11-12 01:14:49', '2024-11-12 09:14:10', '2024-11-12 09:14:49'),
(405, 38, '2024-11-12 01:27:02', '2024-11-12 09:27:02', -12, '2024-11-12 01:27:02', '2024-11-12 09:14:39', '2024-11-12 09:27:02'),
(406, 39, '2024-11-12 01:15:43', '2024-11-12 09:15:43', -1, '2024-11-12 01:15:43', '2024-11-12 09:14:58', '2024-11-12 09:15:43'),
(407, 38, '2024-11-12 01:17:15', '2024-11-12 09:17:15', -1, '2024-11-12 01:17:15', '2024-11-12 09:15:54', '2024-11-12 09:17:15'),
(408, 38, '2024-11-12 10:15:26', NULL, NULL, '2024-11-12 02:15:26', '2024-11-12 10:15:26', '2024-11-12 10:15:26'),
(409, 64, '2024-11-12 02:43:51', '2024-11-12 10:43:51', -17, '2024-11-12 02:43:51', '2024-11-12 10:26:36', '2024-11-12 10:43:51'),
(410, 2, '2024-11-12 02:55:36', '2024-11-12 10:55:36', -11, '2024-11-12 02:55:36', '2024-11-12 10:44:14', '2024-11-12 10:55:36'),
(411, 64, '2024-11-12 03:13:06', '2024-11-12 11:13:06', -16, '2024-11-12 03:13:06', '2024-11-12 10:56:55', '2024-11-12 11:13:06'),
(412, 39, '2024-11-12 11:04:06', NULL, NULL, '2024-11-12 03:04:06', '2024-11-12 11:04:06', '2024-11-12 11:04:06'),
(413, 2, '2024-11-12 09:51:23', '2024-11-12 17:51:23', -398, '2024-11-12 09:51:23', '2024-11-12 11:13:13', '2024-11-12 17:51:23'),
(414, 2, '2024-11-20 20:11:56', NULL, NULL, '2024-11-20 12:11:56', '2024-11-20 20:11:56', '2024-11-20 20:11:56');
INSERT INTO `session_durations` (`id`, `user_id`, `login_time`, `logout_time`, `duration_in_minutes`, `last_activity`, `created_at`, `updated_at`) VALUES
(415, 2, '2024-11-21 21:26:27', NULL, NULL, '2024-11-21 13:26:27', '2024-11-21 21:26:27', '2024-11-21 21:26:27'),
(416, 39, '2024-11-21 15:45:38', NULL, NULL, '2024-11-21 15:45:38', '2024-11-21 15:45:38', '2024-11-21 15:45:38'),
(417, 2, '2024-12-08 16:36:37', '2024-12-08 16:36:37', -3, '2024-12-08 16:36:37', '2024-12-08 16:33:10', '2024-12-08 16:36:37'),
(418, 39, '2024-12-08 18:04:19', '2024-12-08 18:04:19', -87, '2024-12-08 18:04:19', '2024-12-08 16:36:50', '2024-12-08 18:04:19'),
(419, 2, '2024-12-08 18:15:31', '2024-12-08 18:15:31', -11, '2024-12-08 18:15:31', '2024-12-08 18:04:27', '2024-12-08 18:15:31'),
(420, 39, '2024-12-08 18:15:40', NULL, NULL, '2024-12-08 18:15:40', '2024-12-08 18:15:40', '2024-12-08 18:15:40'),
(421, 2, '2024-12-16 11:24:21', NULL, NULL, '2024-12-16 11:24:21', '2024-12-16 11:24:21', '2024-12-16 11:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `due_date` date NOT NULL,
  `date_started` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `grade` varchar(255) DEFAULT NULL,
  `is_graded` tinyint(1) NOT NULL DEFAULT 0,
  `approval_status` varchar(255) DEFAULT NULL,
  `rejection_remarks` text DEFAULT NULL,
  `date_completed` timestamp NULL DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `resubmit_for_approval` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `team_id`, `name`, `priority`, `description`, `status`, `quality`, `due_date`, `date_started`, `created_at`, `updated_at`, `attachment`, `points`, `grade`, `is_graded`, `approval_status`, `rejection_remarks`, `date_completed`, `duration`, `deleted_at`, `resubmit_for_approval`) VALUES
(1, 37, NULL, 'Create wireframe', 'low', 'Make a wireframe in pencil.', 'done', NULL, '2024-11-05', NULL, '2024-11-04 13:55:44', '2024-11-08 01:19:46', NULL, 0, NULL, 0, NULL, NULL, '2024-11-08 01:19:46', NULL, NULL, 0),
(2, 37, 1, 'Build a sorting system', 'medium', 'Build a sorting system that segregates things.', 'in progress', NULL, '2024-11-04', '2024-11-10 03:14:32', '2024-11-04 14:05:06', '2024-11-10 03:14:32', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(3, 37, 1, 'Make a calculator program.', 'high', 'Create a calculator app.', 'not started', NULL, '2024-11-04', NULL, '2024-11-04 16:25:29', '2024-11-04 16:25:29', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(4, 39, NULL, 'Distribute the survey', 'medium', NULL, 'done', NULL, '2024-11-05', '2024-11-04 17:45:50', '2024-11-04 17:27:44', '2024-11-09 07:23:48', NULL, 0, NULL, 0, 'pending', NULL, '2024-11-09 07:23:48', '4 days', NULL, 0),
(5, 39, NULL, 'Do chapter 4', 'high', NULL, 'done', NULL, '2024-11-07', '2024-11-10 03:12:49', '2024-11-04 17:51:44', '2024-11-10 03:13:33', NULL, 0, NULL, 0, 'pending', NULL, '2024-11-10 03:13:33', '44 seconds', NULL, 0),
(6, 43, NULL, 'djsalkdjsa', 'high', 'TO DO!!', 'not started', NULL, '2024-11-04', NULL, '2024-11-04 21:26:57', '2024-11-04 21:27:49', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-04 21:27:49', 0),
(7, 38, NULL, 'Paper Research', 'medium', 'Paper research for Science.', 'not started', NULL, '2024-11-08', NULL, '2024-11-04 23:09:16', '2024-11-06 15:52:15', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 15:52:15', 0),
(8, 44, NULL, 'ORAL COM REVIEWER', 'high', NULL, 'in progress', NULL, '2024-11-04', '2024-11-04 23:19:04', '2024-11-04 23:12:29', '2024-11-04 23:19:04', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(9, 49, NULL, 'review biology', 'high', NULL, 'not started', NULL, '2024-11-05', NULL, '2024-11-04 23:15:55', '2024-11-04 23:15:55', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(10, 38, 2, 'QA the system', 'medium', 'Find bugs in the system.', 'done', NULL, '2024-11-11', NULL, '2024-11-04 23:16:27', '2024-11-06 13:02:03', NULL, 10, 'good', 1, 'approved', NULL, '2024-11-06 12:57:40', NULL, '2024-11-06 13:02:03', 0),
(11, 49, NULL, 'pr defense', 'high', 'go', 'not started', NULL, '2024-11-15', NULL, '2024-11-04 23:19:50', '2024-11-04 23:19:50', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(12, 51, NULL, 'System Maintenance', 'high', NULL, 'in progress', NULL, '2024-11-06', '2024-11-05 01:20:23', '2024-11-05 01:01:51', '2024-11-05 01:20:23', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(13, 37, NULL, 'Make Ingrid happy', 'high', 'Make that princess happy as much as possible!', 'not started', NULL, '2024-11-05', NULL, '2024-11-05 19:31:28', '2024-11-06 00:44:50', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 00:44:50', 0),
(14, 39, NULL, 'Sample 3', 'high', 'Hello', 'in progress', NULL, '2024-11-07', '2024-11-06 10:50:58', '2024-11-06 10:50:39', '2024-11-06 19:14:56', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 19:14:56', 0),
(15, 65, NULL, 'Development', 'low', 'qwerty', 'done', NULL, '2024-11-30', '2024-11-06 11:06:02', '2024-11-06 11:04:41', '2024-11-06 19:43:07', NULL, 0, NULL, 0, 'pending', NULL, '2024-11-06 12:44:57', '1 hour', '2024-11-06 19:43:07', 0),
(16, 65, 4, 'upload', 'low', 'upload files', 'done', NULL, '2024-11-21', '2024-11-06 12:06:58', '2024-11-06 12:06:02', '2024-11-06 12:14:29', NULL, 50, 'excellent', 1, 'approved', NULL, '2024-11-06 12:10:32', '3 minutes', NULL, 0),
(17, 38, NULL, 'aaaa', 'low', NULL, 'not started', NULL, '2024-11-21', NULL, '2024-11-06 12:10:08', '2024-11-06 12:17:23', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 12:17:23', 0),
(18, 38, NULL, 'aaa', 'low', NULL, 'in progress', NULL, '2024-11-06', '2024-11-06 12:23:42', '2024-11-06 12:17:17', '2024-11-06 14:43:25', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 14:43:25', 0),
(19, 65, 4, 'Full task', 'medium', NULL, 'not started', NULL, '2024-11-11', NULL, '2024-11-06 12:47:38', '2024-11-06 15:08:03', NULL, 0, NULL, 0, 'pending', NULL, NULL, NULL, NULL, 0),
(20, 38, 2, 'aaaa', 'low', 'b', 'done', NULL, '2024-11-06', NULL, '2024-11-06 13:02:14', '2024-11-06 13:16:25', NULL, 10, 'good', 1, 'approved', NULL, '2024-11-06 13:02:20', NULL, '2024-11-06 13:16:25', 0),
(21, 38, NULL, '1 pop', 'low', NULL, 'done', NULL, '2024-11-06', NULL, '2024-11-06 13:06:17', '2024-11-06 14:43:13', NULL, 0, NULL, 0, 'pending', NULL, '2024-11-06 13:36:27', NULL, '2024-11-06 14:43:13', 0),
(22, 38, 2, 'Paid Leave', 'medium', NULL, 'done', NULL, '2024-11-06', '2024-11-06 13:16:41', '2024-11-06 13:16:35', '2024-11-06 15:51:21', NULL, 50, 'excellent', 1, 'approved', NULL, '2024-11-06 13:16:47', '6 seconds', '2024-11-06 15:51:21', 0),
(23, 38, 2, '3 pop', 'high', NULL, 'not started', NULL, '2024-11-06', NULL, '2024-11-06 13:48:20', '2024-11-06 14:43:19', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 14:43:19', 0),
(24, 38, 2, '4s', 'low', NULL, 'not started', NULL, '2024-11-06', NULL, '2024-11-06 13:56:50', '2024-11-06 14:43:21', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 14:43:21', 0),
(25, 39, NULL, '45', 'low', NULL, 'done', NULL, '2024-11-06', NULL, '2024-11-06 13:58:37', '2024-11-06 13:59:38', NULL, 0, NULL, 0, NULL, NULL, '2024-11-06 13:59:35', NULL, NULL, 0),
(26, 38, 2, '1 pop', 'low', NULL, 'not started', NULL, '2024-11-06', NULL, '2024-11-06 14:00:54', '2024-11-06 14:43:16', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 14:43:16', 0),
(27, 39, NULL, 'Test 1 Bi Hourly attendance', 'high', 'Attendance check for all 3 sites and send them to Management', 'done', NULL, '2024-11-06', '2024-11-06 14:05:48', '2024-11-06 14:05:16', '2024-11-06 18:15:52', NULL, 0, NULL, 0, NULL, NULL, '2024-11-06 18:15:52', '4 hours', NULL, 0),
(28, 38, NULL, 'debug', 'low', NULL, 'not started', NULL, '2024-11-06', NULL, '2024-11-06 14:27:46', '2024-11-06 15:53:49', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 15:53:49', 0),
(29, 38, 2, 'checklist', 'low', NULL, 'not started', NULL, '2024-11-06', NULL, '2024-11-06 14:37:04', '2024-11-06 15:51:08', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 15:51:08', 0),
(30, 38, NULL, 'deb2', 'low', NULL, 'not started', NULL, '2024-11-06', NULL, '2024-11-06 14:41:49', '2024-11-06 14:43:06', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 14:43:06', 0),
(31, 38, NULL, 'personals', 'low', NULL, 'not started', NULL, '2024-11-08', NULL, '2024-11-06 14:43:45', '2024-11-06 15:52:50', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 15:52:50', 0),
(32, 38, 2, 'asana', 'low', NULL, 'done', NULL, '2024-11-08', '2024-11-06 14:57:45', '2024-11-06 14:49:51', '2024-11-06 15:51:17', NULL, 0, NULL, 0, 'approved', NULL, '2024-11-06 14:58:00', '15 seconds', '2024-11-06 15:51:17', 0),
(33, 38, NULL, 'newm', 'low', NULL, 'done', NULL, '2024-11-06', '2024-11-06 15:10:12', '2024-11-06 15:08:37', '2024-11-06 15:51:56', NULL, 0, NULL, 0, NULL, NULL, '2024-11-06 15:10:15', '3 seconds', '2024-11-06 15:51:56', 0),
(34, 38, NULL, 'css editing', 'low', NULL, 'done', NULL, '2024-11-07', NULL, '2024-11-06 15:55:50', '2024-11-06 15:56:27', NULL, 0, NULL, 0, NULL, NULL, '2024-11-06 15:56:10', NULL, '2024-11-06 15:56:27', 0),
(35, 38, NULL, 'css editing', 'low', NULL, 'done', NULL, '2024-11-07', NULL, '2024-11-06 15:56:50', '2024-11-10 09:25:24', NULL, 0, NULL, 0, NULL, NULL, '2024-11-06 15:57:23', NULL, '2024-11-10 09:25:24', 0),
(36, 38, NULL, 'asana', 'low', NULL, 'done', NULL, '2024-11-07', '2024-11-06 15:59:52', '2024-11-06 15:59:41', '2024-11-09 09:36:05', NULL, 0, NULL, 0, NULL, NULL, '2024-11-06 16:00:00', '8 seconds', '2024-11-09 09:36:05', 0),
(37, 38, 2, 'co-op', 'medium', NULL, 'done', NULL, '2024-11-10', '2024-11-06 16:15:21', '2024-11-06 16:14:39', '2024-11-06 16:19:13', NULL, 0, NULL, 0, 'approved', 'Please change the files.', '2024-11-06 16:18:56', '3 minutes', NULL, 0),
(38, 38, 2, 'rejected', 'low', NULL, 'done', NULL, '2024-11-06', '2024-11-06 16:25:57', '2024-11-06 16:25:46', '2024-11-06 16:33:07', NULL, 0, NULL, 0, 'rejected', 'redo this task.', '2024-11-06 16:26:00', '3 seconds', '2024-11-06 16:33:07', 0),
(39, 38, 2, 'remarks', 'low', NULL, 'done', NULL, '2024-11-06', '2024-11-06 16:33:33', '2024-11-06 16:33:20', '2024-11-06 16:40:45', NULL, 0, NULL, 0, 'rejected', 'redo this', '2024-11-06 16:33:36', '3 seconds', '2024-11-06 16:40:45', 0),
(40, 38, 2, 'remem', 'low', NULL, 'done', NULL, '2024-11-06', '2024-11-06 16:41:05', '2024-11-06 16:40:56', '2024-11-06 16:52:51', NULL, 0, NULL, 0, 'rejected', 'redo', '2024-11-06 16:41:09', '4 seconds', '2024-11-06 16:52:51', 0),
(41, 38, 2, 'wemble', 'low', NULL, 'done', NULL, '2024-11-06', NULL, '2024-11-06 16:45:20', '2024-11-06 16:52:55', NULL, 0, NULL, 0, 'rejected', 'redo', '2024-11-06 16:45:30', NULL, '2024-11-06 16:52:55', 0),
(42, 38, 2, 'mwme', 'low', NULL, 'done', NULL, '2024-11-06', NULL, '2024-11-06 16:53:06', '2024-11-06 16:56:27', NULL, 0, NULL, 0, 'rejected', 'we', '2024-11-06 16:53:16', NULL, '2024-11-06 16:56:27', 0),
(43, 38, 2, 'asana', 'low', NULL, 'done', NULL, '2024-11-06', NULL, '2024-11-06 17:03:46', '2024-11-06 17:33:49', NULL, 0, NULL, 0, 'approved', NULL, '2024-11-06 17:03:54', NULL, '2024-11-06 17:33:49', 0),
(44, 38, 2, 'asana', 'low', NULL, 'done', NULL, '2024-11-06', NULL, '2024-11-06 17:09:23', '2024-11-06 17:33:45', NULL, 0, NULL, 0, 'rejected', 'wewe', '2024-11-06 17:09:31', NULL, '2024-11-06 17:33:45', 1),
(45, 38, 2, 'final', 'low', NULL, 'done', NULL, '2024-11-06', NULL, '2024-11-06 17:34:33', '2024-11-10 09:25:29', NULL, 10, 'good', 1, 'approved', NULL, '2024-11-06 17:34:41', NULL, '2024-11-10 09:25:29', 1),
(46, 38, 2, 'invited', 'low', NULL, 'done', NULL, '2024-11-06', NULL, '2024-11-06 17:41:31', '2024-11-06 17:52:42', NULL, 0, NULL, 0, 'approved', NULL, '2024-11-06 17:41:39', NULL, NULL, 1),
(47, 64, NULL, 'listen to music rn', 'low', NULL, 'done', NULL, '2024-11-06', NULL, '2024-11-06 17:56:20', '2024-11-06 17:56:29', NULL, 0, NULL, 0, NULL, NULL, '2024-11-06 17:56:29', NULL, NULL, 0),
(48, 39, NULL, 'Capstone', 'low', NULL, 'in progress', NULL, '2024-11-07', '2024-11-06 18:16:01', '2024-11-06 18:12:18', '2024-11-06 19:14:50', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 19:14:50', 0),
(49, 39, NULL, 'Sample Task', 'high', 'High Priority', 'in progress', NULL, '2024-11-07', '2024-11-07 18:48:33', '2024-11-06 18:15:22', '2024-11-07 18:48:33', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(50, 2, NULL, 'my task', 'low', NULL, 'not started', NULL, '2024-11-06', NULL, '2024-11-06 18:40:51', '2024-11-06 18:47:11', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-06 18:47:11', 0),
(51, 37, 7, 'SQA', 'medium', 'Make a sqa on excel file', 'not started', NULL, '2024-11-23', NULL, '2024-11-06 18:55:17', '2024-11-08 01:24:56', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(52, 38, 7, 'Create a ppt presentation', 'low', 'Create a ppt presentation about the sqa file.', 'in progress', NULL, '2024-11-28', '2024-11-10 03:09:51', '2024-11-06 18:57:00', '2024-11-10 09:25:36', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-10 09:25:36', 0),
(53, 37, 7, 'Make a report', 'high', 'Make a brief report about the sqa that you have created.', 'not started', NULL, '2024-11-10', NULL, '2024-11-06 18:58:46', '2024-11-08 01:23:15', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(54, 39, NULL, 'Sample 1', 'high', NULL, 'in progress', NULL, '2024-11-07', '2024-11-06 20:32:29', '2024-11-06 20:31:30', '2024-11-06 20:32:41', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(55, 39, NULL, 'Create website', 'high', 'Create a responsive website', 'done', NULL, '2024-11-08', '2024-11-06 20:35:43', '2024-11-06 20:35:21', '2024-11-10 03:10:37', NULL, 0, NULL, 0, NULL, NULL, '2024-11-10 03:10:37', '3 days', NULL, 0),
(56, 38, 2, 'loki', 'low', NULL, 'done', NULL, '2024-11-09', NULL, '2024-11-07 09:47:05', '2024-11-09 07:22:17', NULL, 0, NULL, 0, 'approved', NULL, '2024-11-07 09:48:19', NULL, NULL, 1),
(57, 48, 9, 'Capstone', 'high', NULL, 'done', NULL, '2024-11-07', NULL, '2024-11-07 17:35:22', '2024-11-07 18:15:19', NULL, 0, NULL, 0, 'pending', NULL, '2024-11-07 17:35:40', NULL, '2024-11-07 18:15:19', 0),
(58, 39, 6, 'Create a Responsive website', 'medium', NULL, 'done', NULL, '2024-11-08', NULL, '2024-11-07 18:11:09', '2024-11-07 18:16:00', NULL, 50, 'excellent', 1, 'approved', NULL, '2024-11-07 18:11:35', NULL, '2024-11-07 18:16:00', 0),
(59, 39, 6, 'Create Responsive Website', 'high', 'For mobile and web', 'done', NULL, '2024-11-16', NULL, '2024-11-07 18:48:20', '2024-11-07 18:50:23', NULL, 50, 'excellent', 1, 'approved', NULL, '2024-11-07 18:49:11', NULL, NULL, 0),
(60, 48, 12, 'Capstone', 'medium', NULL, 'done', NULL, '2024-11-08', NULL, '2024-11-07 19:13:54', '2024-11-09 21:51:45', NULL, 0, NULL, 0, 'approved', NULL, '2024-11-07 19:14:05', NULL, NULL, 0),
(61, 39, 6, 'Create website', 'high', 'Responsive Website', 'done', NULL, '2024-11-16', NULL, '2024-11-07 19:25:47', '2024-11-07 19:28:18', NULL, 50, 'excellent', 1, 'approved', NULL, '2024-11-07 19:27:40', NULL, NULL, 0),
(62, 38, 2, 'Site map', 'low', NULL, 'in progress', NULL, '2024-11-08', '2024-11-08 19:54:14', '2024-11-08 09:08:26', '2024-11-08 19:54:14', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(63, 38, 2, 'multiple', 'low', NULL, 'not started', NULL, '2024-11-08', NULL, '2024-11-08 20:13:27', '2024-11-08 20:13:27', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(64, 2, 2, 'Capstone', 'high', NULL, 'done', NULL, '2024-11-08', NULL, '2024-11-09 07:24:27', '2024-11-10 13:36:40', NULL, 0, NULL, 0, 'approved', NULL, '2024-11-09 07:25:02', NULL, '2024-11-10 13:36:40', 1),
(65, 38, 2, 'approve', 'low', NULL, 'done', NULL, '2024-11-09', NULL, '2024-11-09 08:26:52', '2024-11-10 13:36:37', NULL, 0, NULL, 0, 'approved', NULL, '2024-11-09 08:26:59', NULL, '2024-11-10 13:36:37', 1),
(66, 38, 2, 'test', 'low', NULL, 'done', NULL, '2024-11-09', NULL, '2024-11-09 08:36:55', '2024-11-09 08:38:02', NULL, 0, NULL, 0, 'approved', NULL, '2024-11-09 08:37:28', NULL, NULL, 1),
(67, 37, NULL, 'SQA', 'high', 'Make a sqa', 'not started', NULL, '2024-11-10', NULL, '2024-11-09 21:12:54', '2024-11-09 21:12:54', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(68, 37, NULL, 'Past Due Date', 'medium', NULL, 'not started', NULL, '2024-11-16', NULL, '2024-11-09 21:25:21', '2024-11-09 21:25:21', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(69, 38, NULL, '12', 'low', NULL, 'not started', NULL, '2024-11-09', NULL, '2024-11-09 23:32:42', '2024-11-10 09:25:06', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-10 09:25:06', 0),
(70, 38, NULL, 'pilk', 'low', NULL, 'not started', NULL, '2024-11-09', NULL, '2024-11-10 00:05:32', '2024-11-10 09:25:18', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-10 09:25:18', 0),
(71, 39, NULL, 'Keyboard', 'high', NULL, 'not started', NULL, '2024-11-09', NULL, '2024-11-10 03:11:44', '2024-11-10 03:11:44', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(72, 48, 12, 'KEYBOARD', 'high', NULL, 'done', NULL, '2024-11-09', NULL, '2024-11-10 03:17:21', '2024-11-10 03:18:06', NULL, 0, NULL, 0, 'pending', NULL, '2024-11-10 03:18:06', NULL, NULL, 0),
(73, 38, NULL, 'filetype', 'low', NULL, 'not started', NULL, '2024-11-10', NULL, '2024-11-10 09:03:24', '2024-11-10 09:25:11', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '2024-11-10 09:25:11', 0),
(74, 38, 23, 'Document Research', 'medium', 'Research the format of the document.', 'not started', NULL, '2024-11-15', NULL, '2024-11-12 10:16:46', '2024-11-12 10:16:46', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(75, 38, 23, 'Create and upload logo', 'medium', 'Create and upload the logo before the meeting.', 'done', NULL, '2024-11-15', '2024-11-12 10:33:51', '2024-11-12 10:31:06', '2024-11-12 10:37:03', NULL, 50, 'excellent', 1, 'approved', NULL, '2024-11-12 10:34:22', '31 seconds', NULL, 1),
(76, 39, NULL, '1', 'low', '1', 'not started', NULL, '2024-11-21', NULL, '2024-11-21 15:46:45', '2024-11-21 15:46:45', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `task_assignments`
--

CREATE TABLE `task_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_at` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_assignments`
--

INSERT INTO `task_assignments` (`id`, `task_id`, `user_id`, `assigned_at`, `created_at`, `updated_at`) VALUES
(1, 2, 38, '2024-11-04 06:05:06', '2024-11-04 14:05:06', '2024-11-04 14:05:06'),
(2, 3, 38, '2024-11-04 08:25:29', '2024-11-04 16:25:29', '2024-11-04 16:25:29'),
(3, 10, 39, '2024-11-04 15:16:27', '2024-11-04 23:16:27', '2024-11-04 23:16:27'),
(4, 16, 38, '2024-11-06 04:06:02', '2024-11-06 12:06:02', '2024-11-06 12:06:02'),
(5, 19, 38, '2024-11-06 04:47:38', '2024-11-06 12:47:38', '2024-11-06 12:47:38'),
(6, 20, 39, '2024-11-06 05:02:14', '2024-11-06 13:02:14', '2024-11-06 13:02:14'),
(7, 22, 39, '2024-11-06 05:16:35', '2024-11-06 13:16:35', '2024-11-06 13:16:35'),
(8, 23, 39, '2024-11-06 05:48:20', '2024-11-06 13:48:20', '2024-11-06 13:48:20'),
(9, 24, 39, '2024-11-06 05:56:50', '2024-11-06 13:56:50', '2024-11-06 13:56:50'),
(10, 26, 39, '2024-11-06 06:00:54', '2024-11-06 14:00:54', '2024-11-06 14:00:54'),
(11, 29, 39, '2024-11-06 06:37:04', '2024-11-06 14:37:04', '2024-11-06 14:37:04'),
(12, 32, 39, '2024-11-06 06:49:51', '2024-11-06 14:49:51', '2024-11-06 14:49:51'),
(13, 37, 39, '2024-11-06 08:14:39', '2024-11-06 16:14:39', '2024-11-06 16:14:39'),
(14, 37, 64, '2024-11-06 08:14:39', '2024-11-06 16:14:39', '2024-11-06 16:14:39'),
(15, 38, 64, '2024-11-06 08:25:46', '2024-11-06 16:25:46', '2024-11-06 16:25:46'),
(16, 39, 64, '2024-11-06 08:33:20', '2024-11-06 16:33:20', '2024-11-06 16:33:20'),
(17, 40, 64, '2024-11-06 08:40:56', '2024-11-06 16:40:56', '2024-11-06 16:40:56'),
(18, 41, 64, '2024-11-06 08:45:20', '2024-11-06 16:45:20', '2024-11-06 16:45:20'),
(19, 42, 64, '2024-11-06 08:53:06', '2024-11-06 16:53:06', '2024-11-06 16:53:06'),
(20, 43, 64, '2024-11-06 09:03:46', '2024-11-06 17:03:46', '2024-11-06 17:03:46'),
(21, 44, 64, '2024-11-06 09:09:23', '2024-11-06 17:09:23', '2024-11-06 17:09:23'),
(22, 45, 64, '2024-11-06 09:34:33', '2024-11-06 17:34:33', '2024-11-06 17:34:33'),
(23, 46, 64, '2024-11-06 09:41:31', '2024-11-06 17:41:31', '2024-11-06 17:41:31'),
(24, 51, 38, '2024-11-06 10:55:17', '2024-11-06 18:55:17', '2024-11-06 18:55:17'),
(25, 52, 64, '2024-11-06 10:57:00', '2024-11-06 18:57:00', '2024-11-06 18:57:00'),
(26, 53, 38, '2024-11-06 10:58:46', '2024-11-06 18:58:46', '2024-11-06 18:58:46'),
(27, 53, 64, '2024-11-06 10:58:46', '2024-11-06 18:58:46', '2024-11-06 18:58:46'),
(28, 56, 64, '2024-11-07 01:47:05', '2024-11-07 09:47:05', '2024-11-07 09:47:05'),
(29, 57, 39, '2024-11-07 09:35:22', '2024-11-07 17:35:22', '2024-11-07 17:35:22'),
(30, 58, 48, '2024-11-07 10:11:09', '2024-11-07 18:11:09', '2024-11-07 18:11:09'),
(31, 59, 38, '2024-11-07 10:48:20', '2024-11-07 18:48:20', '2024-11-07 18:48:20'),
(32, 59, 48, '2024-11-07 10:48:20', '2024-11-07 18:48:20', '2024-11-07 18:48:20'),
(33, 60, 39, '2024-11-07 11:13:54', '2024-11-07 19:13:54', '2024-11-07 19:13:54'),
(34, 61, 38, '2024-11-07 11:25:47', '2024-11-07 19:25:47', '2024-11-07 19:25:47'),
(35, 61, 48, '2024-11-07 11:25:47', '2024-11-07 19:25:47', '2024-11-07 19:25:47'),
(36, 62, 39, '2024-11-08 01:08:26', '2024-11-08 09:08:26', '2024-11-08 09:08:26'),
(37, 62, 37, '2024-11-08 01:08:26', '2024-11-08 09:08:26', '2024-11-08 09:08:26'),
(38, 62, 48, '2024-11-08 01:08:26', '2024-11-08 09:08:26', '2024-11-08 09:08:26'),
(39, 63, 39, '2024-11-08 12:13:27', '2024-11-08 20:13:27', '2024-11-08 20:13:27'),
(40, 64, 39, '2024-11-08 23:24:27', '2024-11-09 07:24:27', '2024-11-09 07:24:27'),
(41, 65, 39, '2024-11-09 00:26:52', '2024-11-09 08:26:52', '2024-11-09 08:26:52'),
(42, 66, 39, '2024-11-09 00:36:55', '2024-11-09 08:36:55', '2024-11-09 08:36:55'),
(43, 72, 39, '2024-11-09 19:17:21', '2024-11-10 03:17:21', '2024-11-10 03:17:21'),
(44, 74, 39, '2024-11-12 02:16:46', '2024-11-12 10:16:46', '2024-11-12 10:16:46'),
(45, 75, 39, '2024-11-12 02:31:06', '2024-11-12 10:31:06', '2024-11-12 10:31:06'),
(46, 75, 64, '2024-11-12 02:31:06', '2024-11-12 10:31:06', '2024-11-12 10:31:06');

-- --------------------------------------------------------

--
-- Table structure for table `task_attachments`
--

CREATE TABLE `task_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_attachments`
--

INSERT INTO `task_attachments` (`id`, `task_id`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 5, 'attachments/messages.txt', '2024-11-04 17:51:44', '2024-11-04 17:51:44'),
(2, 6, 'attachments/Screenshot (26).png', '2024-11-04 21:26:57', '2024-11-04 21:26:57'),
(3, 15, 'attachments/adobe.snr.patch.v2.0-painter.exe', '2024-11-06 11:04:41', '2024-11-06 11:04:41'),
(4, 16, 'attachments/adobe.snr.patch.v2.0-painter.exe', '2024-11-06 12:06:02', '2024-11-06 12:06:02'),
(5, 17, 'attachments/manualusercolla.docx', '2024-11-06 12:10:08', '2024-11-06 12:10:08'),
(6, 18, 'attachments/manualusercolla.docx', '2024-11-06 12:17:17', '2024-11-06 12:17:17'),
(8, 36, 'attachments/462554058_441371501954649_2652761590999894983_n.jpg', '2024-11-06 15:59:41', '2024-11-06 15:59:41'),
(9, 37, 'attachments/dd22.png', '2024-11-06 16:18:12', '2024-11-06 16:18:12'),
(10, 55, 'attachments/AdminLTELogo.png', '2024-11-06 20:35:21', '2024-11-06 20:35:21'),
(11, 58, 'attachments/AdminLTELogo.png', '2024-11-07 18:11:35', '2024-11-07 18:11:35'),
(12, 52, 'attachments/bg.png', '2024-11-10 03:09:51', '2024-11-10 03:09:51'),
(13, 70, 'attachments/3.1.20 Lab - Shodan Searches - ILM-1-TATCHO.pdf', '2024-11-10 08:56:45', '2024-11-10 08:56:45'),
(14, 70, 'attachments/1mb.exe', '2024-11-10 08:57:48', '2024-11-10 08:57:48');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `creator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `has_rewards` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `description`, `creator_id`, `created_at`, `updated_at`, `has_rewards`, `image`, `deleted_at`) VALUES
(1, 'New Order of the stones', 'The order of the stones are legendary Minecraft Programmers.', 37, '2024-11-04 14:00:04', '2024-11-04 14:00:04', 1, NULL, NULL),
(2, 'Avengers', 'Marvel Inspired', 38, '2024-11-04 22:53:01', '2024-11-04 22:53:01', 1, 'team_images/83pPp0W7B3yMGBNS9BqWRjKkJywBMsisl8HOsL9T.jpg', NULL),
(3, 'IT-47', 'Capstone Group', 51, '2024-11-05 01:16:11', '2024-11-05 01:16:11', 1, NULL, NULL),
(4, 'Team 1', 'Team1', 65, '2024-11-06 11:08:24', '2024-11-06 11:08:24', 1, 'team_images/EvHyrNxUUD16IHzxn80NIjxNn7WWauxxCEeBzYkU.jpg', NULL),
(5, 'Team 3', NULL, 39, '2024-11-06 18:17:12', '2024-11-06 18:23:22', 1, NULL, '2024-11-06 18:23:22'),
(6, 'Team 3', NULL, 39, '2024-11-06 18:23:55', '2024-11-06 18:23:55', 1, NULL, NULL),
(7, 'Decoders', 'Earth\'s mightiest programmers', 37, '2024-11-06 18:43:44', '2024-11-06 18:43:44', 1, 'team_images/B9r8nsMEBGWdHiqI1wUN4eXX192iszLNVA4GhL6R.png', NULL),
(8, 'Capstone TEAM', NULL, 39, '2024-11-06 20:36:56', '2024-11-07 18:34:08', 1, 'team_images/TWQhBl4OqIjFNRVPAe5NH1ufCSHR2JcqQVr1nBdP.jpg', '2024-11-07 18:34:08'),
(9, 'Capstone TEAM', NULL, 48, '2024-11-07 17:34:39', '2024-11-07 18:15:19', 1, 'team_images/TOHgqdYSeS1ao1cMNjpN2ktW09baMCKTVeYhQInC.png', '2024-11-07 18:15:19'),
(10, 'Capstone', NULL, 48, '2024-11-07 18:35:33', '2024-11-07 18:35:55', 1, 'team_images/iuoxx6sAwmpBHiT3LlthDtpiIU6yTZrGOxWr969i.png', '2024-11-07 18:35:55'),
(11, 'Capstone', NULL, 48, '2024-11-07 18:39:07', '2024-11-07 18:43:01', 1, 'team_images/33E9A4C1pQxvyc52zyJwHjRfA7HaOfeWdNcTmNO3.png', '2024-11-07 18:43:01'),
(12, 'Capstone', NULL, 48, '2024-11-07 18:43:51', '2024-11-07 18:43:51', 1, 'team_images/eT4CIT1pt9G5JMytusqi0tZwRLt7KDWAkxTmNa0C.png', NULL),
(13, 'Capstone TEAM', NULL, 39, '2024-11-07 19:23:45', '2024-11-07 19:23:45', 1, 'team_images/rcToKt9LTWEUSpaOMSMvV4KZSExuV8wAbHjtghUz.png', NULL),
(14, 'ilkwreutygo45it78y5784tglukjg5487oiulghp59854giuh87g yu56ihg895ty8956ythufgi7854ouiglhb53o8745w5toguilbj5w78fgoyuh5tp9v7yghuigy89ioh54gtr89pyuhijngv90ujoei', NULL, 37, '2024-11-10 00:56:52', '2024-11-10 00:57:47', 1, NULL, '2024-11-10 00:57:47'),
(15, 'Site map', 'hnolbjkm9,8.i7uy6rbbbbbbbbbbbbbbrbrbrbrbbbbbbbbbbbbbbbbbrbrbrbr,br bbbbbbbb7bb6bubbbbbbbbbbbbbbbbbbbb ,bbbbb7ybu6bbbibbbbbbbbbbb,bbbbibibibbbbbbb4i9l7u8umbyg489r7luuuuuuuuruu5uuuuuuuuuuuuuuuuu879uluuuuuuubumuuuuyimmmm6u78o6596666m6666666666666666m66666666u6ro8795vftu27yc7drdddd57nucrbtnjrrr2rrrrrrrrrrrrrrr2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2r2rr3rer5rrrrrrrrrrrrrrrrrrt4b5nujttttttjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjtjte354ttgyhgggghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghghg', 37, '2024-11-10 01:02:53', '2024-11-10 01:06:52', 1, NULL, '2024-11-10 01:06:52'),
(16, 'Testers', '8ghjibfuktvny7635hjihjihjihjihjihjihjihjihjihjihjihjihjikhjihjihjihjihjihjihjihjihjihjihjihjihjihjihjikhjikhjikhjikhjikhjikhjikhjikhjikhjikhjikhjikhjikhjikhjikhjihjihjihjihjihjihjihjihjik7hjihjihjihjihjihjihjihjihjihjihjihjihjihjihji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hji7hjiehjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjiehjiehjiehjiehji5hjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihji5hji5hjikhjihjihjihjihjihjihjihjihjihjihjihjihjihjihjikhjikhjikhjikhjikhjikhjikhjikhjikhjinhjihjihjihjinhjihjihjihjihjihjihjihjihjihjihjihjihjihjihjihnjihnjihjinhjinhjinhjinhjinhjinhjinhnjihnjihnjihnjihnjihjinhjinhjinhjinhjinhnjihjinhnjihnjihnjihnjihnjihjinhjinhjinhjinhjinhjinhnjihnjihnjihnjihnjihjihjihjihjihjihjihji5hjiwhjihjihjihjihdjihji3r24sfnyvj722222u222222222222i2222222222222222256k2vk756t77777777777t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7t7777', 37, '2024-11-10 01:08:08', '2024-11-10 01:40:44', 1, NULL, '2024-11-10 01:40:44'),
(17, '65747fd6y4!@#$%^&', NULL, 37, '2024-11-10 03:05:54', '2024-11-10 03:06:01', 1, NULL, '2024-11-10 03:06:01'),
(18, 'Max', NULL, 37, '2024-11-10 03:18:51', '2024-11-10 03:56:23', 1, 'team_images/xdkcGWLYwq0AoDGC085j7dgcZPBLOnmI2kfcCukl.jpg', '2024-11-10 03:56:23'),
(19, 'Site map', NULL, 37, '2024-11-10 03:22:42', '2024-11-10 03:56:32', 1, 'team_images/jTxC4OHe5peWgJRPUBviWXSxbnk1AKoauxIi91Y8.png', '2024-11-10 03:56:32'),
(20, 'Site map', NULL, 37, '2024-11-10 03:57:45', '2024-11-10 03:57:54', 1, NULL, '2024-11-10 03:57:54'),
(21, 'collaor', '123', 38, '2024-11-10 09:12:12', '2024-11-10 09:12:23', 1, NULL, '2024-11-10 09:12:23'),
(22, 'asdasd', NULL, 38, '2024-11-10 09:21:49', '2024-11-10 09:21:55', 1, NULL, '2024-11-10 09:21:55'),
(23, 'COLLABORATASK', 'The developers\' culmination of studies.', 38, '2024-11-11 18:29:36', '2024-11-11 18:29:36', 1, 'team_images/G9UBX1Zd8ATs99RWKu0rByJhZFYQf3HjlvDxeibU.jpg', NULL),
(24, 'Hello', 'test', 38, '2024-11-11 19:16:36', '2024-11-11 19:17:54', 1, NULL, '2024-11-11 19:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `xp` int(11) NOT NULL DEFAULT 0,
  `total_points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `team_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `level`, `xp`, `total_points`) VALUES
(1, 1, 37, '2024-11-04 14:00:04', '2024-11-04 14:00:04', NULL, 0, 0, 0),
(2, 1, 38, '2024-11-04 14:01:23', '2024-11-04 14:01:23', NULL, 0, 0, 0),
(3, 2, 38, '2024-11-04 22:53:01', '2024-11-04 22:53:01', NULL, 0, 0, 0),
(5, 3, 51, '2024-11-05 01:16:11', '2024-11-05 01:16:11', NULL, 0, 0, 0),
(6, 4, 65, '2024-11-06 11:08:24', '2024-11-06 11:08:24', NULL, 0, 0, 0),
(7, 4, 38, '2024-11-06 11:09:22', '2024-11-06 11:09:22', NULL, 0, 15, 79),
(8, 2, 64, '2024-11-06 16:14:09', '2024-11-06 16:14:09', NULL, 0, 78, 166),
(10, 6, 39, '2024-11-06 18:23:55', '2024-11-06 18:23:55', NULL, 0, 0, 0),
(11, 7, 37, '2024-11-06 18:43:44', '2024-11-06 18:43:44', NULL, 0, 0, 0),
(12, 7, 38, '2024-11-06 18:45:07', '2024-11-06 18:45:07', NULL, 0, 0, 0),
(13, 7, 64, '2024-11-06 18:48:11', '2024-11-06 18:48:11', NULL, 0, 0, 0),
(15, 2, 37, '2024-11-06 23:12:35', '2024-11-06 23:12:35', NULL, 0, 0, 0),
(16, 3, 37, '2024-11-06 23:12:49', '2024-11-06 23:12:49', NULL, 0, 0, 0),
(17, 4, 37, '2024-11-06 23:12:57', '2024-11-06 23:12:57', NULL, 0, 0, 0),
(18, 6, 38, '2024-11-07 06:38:16', '2024-11-07 06:38:16', NULL, 0, 56, 162),
(19, 2, 48, '2024-11-07 17:16:59', '2024-11-07 17:16:59', NULL, 0, 0, 0),
(26, 12, 48, '2024-11-07 18:43:51', '2024-11-07 18:43:51', NULL, 0, 0, 0),
(27, 12, 39, '2024-11-07 18:44:11', '2024-11-07 18:44:11', NULL, 0, 35, 70),
(28, 6, 48, '2024-11-07 18:47:07', '2024-11-07 18:47:07', NULL, 0, 56, 122),
(29, 13, 39, '2024-11-07 19:23:45', '2024-11-07 19:23:45', NULL, 0, 0, 0),
(30, 13, 48, '2024-11-07 19:24:08', '2024-11-07 19:24:08', NULL, 0, 0, 0),
(31, 12, 37, '2024-11-07 22:15:53', '2024-11-07 22:15:53', NULL, 0, 0, 0),
(32, 12, 38, '2024-11-07 23:53:24', '2024-11-07 23:53:24', NULL, 0, 0, 0),
(33, 13, 38, '2024-11-07 23:53:39', '2024-11-07 23:53:39', NULL, 0, 0, 0),
(43, 2, 39, '2024-11-10 13:41:47', '2024-11-10 13:41:47', NULL, 0, 0, 0),
(44, 23, 38, '2024-11-11 18:29:36', '2024-11-11 18:29:36', NULL, 0, 0, 0),
(47, 23, 39, '2024-11-12 09:15:08', '2024-11-12 09:15:08', NULL, 0, 18, 61),
(48, 23, 64, '2024-11-12 10:28:41', '2024-11-12 10:28:41', NULL, 0, 18, 11);

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `name`, `description`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'The Owl', 'For the late-night users.', 'icons/owl.png', '2024-10-23 21:01:45', '2024-10-23 21:01:45'),
(2, 'Caffeine Overdose', 'For the coffee lovers.', 'icons/coffee.png', '2024-10-23 21:01:45', '2024-10-23 21:01:45'),
(3, 'Bug Squasher', 'For the problem solvers.', 'icons/bug.png', '2024-10-23 21:01:45', '2024-10-23 21:01:45'),
(4, 'Master of Disguise', 'For the frequent profile changers.', 'icons/mask.png', '2024-10-23 21:01:45', '2024-10-23 21:01:45'),
(5, 'The Lurker', 'For those who observe quietly.', 'icons/eye.png', '2024-10-23 21:01:45', '2024-10-23 21:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `selected_border` varchar(255) DEFAULT NULL,
  `selected_title_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(255) DEFAULT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `about_me` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `skills` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`skills`)),
  `education` varchar(255) DEFAULT NULL,
  `font_family` varchar(255) DEFAULT NULL,
  `dashboard_layout` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dashboard_layout`)),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `xp` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `total_points` int(11) NOT NULL DEFAULT 0,
  `background_color` varchar(255) NOT NULL DEFAULT '#ffffff',
  `font_color` varchar(255) NOT NULL DEFAULT '#000000',
  `font_size` varchar(255) NOT NULL DEFAULT '16px',
  `navbar_color` varchar(255) NOT NULL DEFAULT '#00355b',
  `sidebar_color` varchar(255) NOT NULL DEFAULT '#00355b'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `selected_border`, `selected_title_id`, `profile_photo_path`, `usertype`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `full_name`, `bio`, `about_me`, `address`, `skills`, `education`, `font_family`, `dashboard_layout`, `deleted_at`, `xp`, `level`, `total_points`, `background_color`, `font_color`, `font_size`, `navbar_color`, `sidebar_color`) VALUES
(2, 'admin', 'admin@gmail.com', 'sample-2', 4, NULL, 'admin', NULL, '$2y$12$HvNSmSJj939Rq/cxWr/Dy.ogcQ3VgmVp.330Mi21qe5WSsQyaK0Kq', 'mXPiY2tpNGPMs1beSlYJVAMjWx1Q1UF8ixIdnWjoopUViCYi7jYRzCSjv2JF', '2024-06-19 05:02:22', '2024-12-08 16:33:21', 'admin admin', NULL, NULL, NULL, '[\"\"]', NULL, 'Arial', '[\"box-1\",\"box-2\",\"box-3\",\"box-4\",\"box-5\",\"box-6\",\"box-7\",\"box-8\",\"box-9\",\"box-10\",\"box-11\",\"box-13\",\"box-12\"]', NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(37, 'Derick Pangilinan', 'pangilinanderick100@gmail.com', NULL, NULL, NULL, 'user', '2024-11-04 13:10:35', '$2y$12$gOixPi7RQoz1xjmn/sanzOuAUVgNHHiJ0yDFV/bvMGxCir7QHAcBi', NULL, '2024-11-04 13:09:59', '2024-11-07 15:16:25', NULL, NULL, NULL, NULL, NULL, NULL, 'Arial', NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(38, 'Vessel', 'greevilghst@gmail.com', 'sample-2', 1, 'profile_photos/6728b6d75cc1d_462547525_433523226049959_2789961530606909306_n.jpg', 'user', '2024-11-04 13:12:01', '$2y$12$xq5ng1vFt8flHGDb4.f5GOayZVBgYCbQEDeRFljhdaSbp87TcQucO', 'IiFVCzHv4bxtck9TUktSXGfbVaOSqxBC2IIsszCPBeFHr2TlNWKQp1kFVsPF', '2024-11-04 13:10:54', '2024-11-12 10:43:31', NULL, 'The way you dress is the way you will be addressed.', 'Anxiety ridden student', NULL, '[\"\"]', 'Bachelor of Science in Information Technology', 'Arial', NULL, NULL, 0, 1, 0, '#fbe9d0', '#244855', '16px', '#e64833', '#874f41'),
(39, 'byen', 'sia.batul.avienflaire@gmail.com', 'sample-2', 2, 'profile_photos/672b60e365350_avatar4.png', 'user', '2024-11-04 14:09:56', '$2y$12$rkMOwt9csI1UtMrAHcP3NeWjiC9iYPBoAn39DO6HMMODYPTxasgzi', 'wwabNqXFMbjb4gim00r18fcarWZE4J8Mt6V4uUJodOVSJE0nKDg53y4eoSXn', '2024-11-04 14:05:15', '2024-11-12 08:35:59', NULL, NULL, NULL, 'Angeles City', '[\"\"]', NULL, 'Arial', NULL, NULL, 0, 1, 0, '#a5bfc6', '#1b4a4d', '16px', '#2e6975', '#102c34'),
(40, 'DERICK NATHANIEL PANGILINAN', 'pangilinan.dericknathaniel@auf.edu.ph', NULL, NULL, NULL, 'user', '2024-11-06 22:52:53', '$2y$12$utiQgVo.HQMmN8HohPmFkeDcqxp8vrNOa7PHumg6/6sfgz.DtEBCu', NULL, '2024-11-04 16:21:15', '2024-11-06 22:52:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(42, 'test', 'glenjustin.gnc@gmail.com', NULL, NULL, NULL, 'user', NULL, '$2y$12$WGlbJKanyPg1clOY.Q9xo.QC4r14XpyEAi.yahZrvMlBsQfwDuFve', NULL, '2024-11-04 21:21:34', '2024-11-04 21:21:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(43, 'test', 'alianjustin1000@gmail.com', NULL, NULL, NULL, 'user', '2024-11-04 21:25:17', '$2y$12$4Q6MTw5p12ZPeKWDOAyclu5E4MFcH0y2BzmKCnqwlf62vGmzVh.xW', 'XW1OUkoCjamxHAo4LZV7NUGcHQwmUANJbnU9RKZEYj3OBSI1410yk0gryVJs', '2024-11-04 21:23:35', '2024-11-04 21:25:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(44, 'Laurence Santi', 'laurencejeidzfrancisco@gmail.com', NULL, NULL, NULL, 'user', '2024-11-04 23:08:51', '$2y$12$Z3TjKffhoYkFJ7N.CTu81e7n/7AXyN3OS2vyyBePkmkyMPVSSeDuy', NULL, '2024-11-04 22:48:59', '2024-11-04 23:08:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(45, 'Avien Batul', 'avienflairebatul@gmail.com', NULL, NULL, NULL, 'user', '2024-11-04 22:55:10', '$2y$12$SScPjRxWFMs..shdo0BGlenm4r4c6xuPfS05rP2SmX1SG8C0QUkka', NULL, '2024-11-04 22:54:30', '2024-11-04 22:55:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(46, 'Laurence Santi', 'zerotwo0727@gmail.com', NULL, NULL, NULL, 'user', NULL, '$2y$12$PWkddEy/cHcmzBejorlUUe2kBpst8G5Q0fqz9JuO7cB6RxnOYgvMa', NULL, '2024-11-04 22:55:31', '2024-11-04 22:55:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(47, 'Daniela', 'daniela.edielle@gmail.com', NULL, NULL, NULL, 'user', NULL, '$2y$12$NU1yAoI7Uf5rsuIdcsoq2eenO6Cyn455GZfsqZnPzwDyJ31ReB4.2', NULL, '2024-11-04 23:05:27', '2024-11-04 23:05:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(48, 'DARYL MANGAYA', 'mangaya.daryl@auf.edu.ph', NULL, NULL, NULL, 'user', '2024-11-07 13:26:50', '$2y$12$w15.v0d6dpm.ZdapesV.Eu3OKfWqsZUF5pvqdZHHa813O76bUG876', NULL, '2024-11-04 23:08:35', '2024-11-07 13:26:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(49, 'Daniela', 'daniela.coronel0302@gmail.com', NULL, NULL, NULL, 'user', '2024-11-04 23:14:55', '$2y$12$XSDLuv7hSCAYVKzrNVsUTOJhPYzsWB/6yPUIxC7JoHpaJlRC/J0Ka', NULL, '2024-11-04 23:09:51', '2024-11-04 23:14:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(50, 'Bianca', 'louisebiancaescorido@gmail.com', NULL, NULL, NULL, 'user', NULL, '$2y$12$8QyIU.3diBZ.oDMI2BeBLOuGNsspeG5xVy.cxPGA0X0GWz0SnWqDW', NULL, '2024-11-04 23:28:09', '2024-11-04 23:28:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(51, 'Angela Mungcal', 'angelamungcal16@gmail.com', 'sample-1', 2, NULL, 'user', '2024-11-05 00:43:04', '$2y$12$OllqjmFX7mj05mfXfquO5OBNtph8ssxHww02y9eiO3z1rjp9j1.92', NULL, '2024-11-05 00:38:29', '2024-11-05 01:27:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(52, 'Shane Reyes', 'nogodthe547@stayhome.li', NULL, NULL, NULL, 'user', NULL, '$2y$12$nNgTdTdVvAHmNUJwonw09e8F8swczoSGUyJaidsowwwtPrZ013NUS', NULL, '2024-11-05 04:56:38', '2024-11-05 04:56:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(56, 'Derick', 'oroprogamer23@gmail.com', NULL, NULL, NULL, 'user', NULL, '$2y$12$XW4aUE9CqxWj1H21k/bOfe3GJ8TE9NNeA0PK/L6j1p6VpGpeFQf7i', NULL, '2024-11-05 20:13:56', '2024-11-05 20:13:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(57, 'Derick Pangilinan', 'pangilinan.dericknathaniel@1auf.edu.ph', NULL, NULL, NULL, 'user', NULL, '$2y$12$32KRcZMKXhwPlGv2qNS2puTcXpj5WMG46/YA1IRafVBFg9vrou79i', NULL, '2024-11-05 20:37:44', '2024-11-05 20:37:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(58, 'Dennis', 'dbsalvador@gmail.com', NULL, NULL, NULL, 'user', NULL, '$2y$12$fe4vNFDCfA1vBCOksYQ.auqYBEHj09GwFF5oAhvA8bhI98E0bRaYe', NULL, '2024-11-05 22:55:16', '2024-11-05 22:55:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(62, 'chickenjoy', 'chickentea000@gmail.com', NULL, NULL, NULL, 'user', NULL, '$2y$12$gn5YVFPOTWxnYgnworq5Eetvkrj4HjVpmE.R7t2tHALJYJ3hBkE5K', NULL, '2024-11-06 02:34:46', '2024-11-06 02:34:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(63, 'aaa', 'sia.batul.avienflaire@auf.edu.ph', NULL, NULL, NULL, 'user', NULL, '$2y$12$.5FJIyDEUXwA4JHKlS9v4.oYalpdLb05IYXfm3XQmso3P3Nz5n7pO', NULL, '2024-11-06 08:12:51', '2024-11-06 08:12:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(64, 'taurus', 'jerahmeel.tatcho@gmail.com', NULL, NULL, NULL, 'user', '2024-11-06 08:35:36', '$2y$12$MmjqHb1qAOTFR3GLxxniMuK6Cgv9LtY1hk5Pj1lVJFIo5KX9mEDqW', NULL, '2024-11-06 08:30:22', '2024-11-06 08:35:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(65, 'Fernand', 'layug.fernand@auf.edu.ph', NULL, NULL, NULL, 'user', '2024-11-06 11:00:33', '$2y$12$xIBoO2ZGYQqNwWt9cu8Q6e.xKPMvUt3NyMEjrj4xWlSVp6uiDOZPq', NULL, '2024-11-06 10:56:06', '2024-11-06 11:00:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(67, 'Carlow RTest', 'first.second0099@gmail.com', NULL, NULL, NULL, 'user', NULL, '$2y$12$D46n0kP3QVzwbjWXMcES4ONNRkk7HRI2EGepp/5m890EtvelqfcOO', NULL, '2024-11-06 13:56:44', '2024-11-06 13:56:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(70, 'Derick Nathaniel', 'dericknath23@gmail.com', NULL, NULL, NULL, 'user', '2024-11-06 21:32:22', '$2y$12$dQKAXMZJY6Nz9shL9ml.5O3lBrbjkt/DcCL0uq1ulSaNU8NJ.Mmh6', 'XZYV68eVY7y7R5LN70wB4zRWy353AG8DIHJnAysoVCMmVUJ3LbExsGjgNmhf', '2024-11-06 21:26:50', '2024-11-06 21:32:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(71, 'Mark Soberano', 'soberanomarkanthony18@gmail.com', NULL, 2, NULL, 'user', '2024-11-06 22:04:09', '$2y$12$g6IzB4W5//lDuzXfMIT2O.Iq0AddANLxroft7K8iFvorEmw36L8vK', 'UipfXysfq5iVaTR9ObbDenWToOwv76oS79QhV8Y7bnwYJu1YRqiRySnzcD8R', '2024-11-06 21:59:36', '2024-11-06 22:05:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(72, 'admin', 'admin@admin.com', NULL, NULL, NULL, 'user', NULL, '$2y$12$FJPierP78wJi5K8c/0ssz.DsiJak3RluhrpF4ih05OWKM5iNdAXK6', NULL, '2024-11-07 13:36:25', '2024-11-07 13:36:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b'),
(73, 'jalen quiambao', 'it.jalenquiambao@gmail.com', NULL, NULL, NULL, 'user', '2024-11-11 20:54:16', '$2y$12$1fMt5gKU7hv/njEsb0oQtO9DCk/dhTIe7SXIATC5PdEUcqWbr83Xq', NULL, '2024-11-11 20:51:58', '2024-11-11 20:54:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '#ffffff', '#000000', '16px', '#00355b', '#00355b');

-- --------------------------------------------------------

--
-- Table structure for table `user_admin_messages`
--

CREATE TABLE `user_admin_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parent_message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `message` text NOT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `original_file_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_admin_messages`
--

INSERT INTO `user_admin_messages` (`id`, `user_id`, `parent_message_id`, `read_at`, `message`, `file_url`, `original_file_name`, `created_at`, `updated_at`) VALUES
(155, 38, NULL, NULL, 'hello!', NULL, NULL, '2024-11-09 18:10:51', '2024-11-09 18:10:51'),
(156, 39, NULL, NULL, 'Hell admin', NULL, NULL, '2024-11-09 19:58:14', '2024-11-09 19:58:14'),
(157, 2, 156, NULL, 'hello', NULL, NULL, '2024-11-09 19:58:35', '2024-11-09 19:58:35'),
(158, 38, NULL, NULL, '2', NULL, NULL, '2024-11-10 09:23:54', '2024-11-10 09:23:54'),
(159, 38, NULL, NULL, 'I have a problem with my team.', NULL, NULL, '2024-11-12 10:44:48', '2024-11-12 10:44:48'),
(160, 2, 159, NULL, 'What is your problem?', NULL, NULL, '2024-11-12 10:45:04', '2024-11-12 10:45:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_badges`
--

CREATE TABLE `user_badges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `badge_id` bigint(20) UNSIGNED NOT NULL,
  `earned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_badges`
--

INSERT INTO `user_badges` (`id`, `user_id`, `badge_id`, `earned_at`, `created_at`, `updated_at`) VALUES
(1, 38, 58, '2024-11-06 12:57:40', '2024-11-06 12:57:40', '2024-11-06 12:57:40'),
(2, 38, 58, '2024-11-06 12:57:43', '2024-11-06 12:57:43', '2024-11-06 12:57:43'),
(3, 39, 58, '2024-11-06 13:59:35', '2024-11-06 13:59:35', '2024-11-06 13:59:35'),
(4, 39, 58, '2024-11-06 13:59:38', '2024-11-06 13:59:38', '2024-11-06 13:59:38'),
(5, 64, 58, '2024-11-06 17:56:26', '2024-11-06 17:56:26', '2024-11-06 17:56:26'),
(6, 48, 58, '2024-11-07 19:14:05', '2024-11-07 19:14:05', '2024-11-07 19:14:05'),
(7, 48, 58, '2024-11-07 19:14:08', '2024-11-07 19:14:08', '2024-11-07 19:14:08'),
(8, 39, 59, '2024-11-10 03:10:37', '2024-11-10 03:10:37', '2024-11-10 03:10:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_borders`
--

CREATE TABLE `user_borders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `border_id` bigint(20) UNSIGNED NOT NULL,
  `unlocked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_borders`
--

INSERT INTO `user_borders` (`id`, `user_id`, `border_id`, `unlocked_at`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 39, 1, '2024-11-09 19:10:41', 0, '2024-11-10 03:10:41', '2024-11-10 03:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widget_checklists`
--

CREATE TABLE `widget_checklists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(255) NOT NULL,
  `is_checked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borders`
--
ALTER TABLE `borders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `checklists`
--
ALTER TABLE `checklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checklists_task_id_foreign` (`task_id`),
  ADD KEY `fk_checklists_created_by` (`created_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedbacks_user_id_foreign` (`user_id`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invitations_team_id_foreign` (`team_id`),
  ADD KEY `invitations_inviter_id_foreign` (`inviter_id`),
  ADD KEY `invitations_invitee_id_foreign` (`invitee_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_team_id_foreign` (`team_id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_widget_id_foreign` (`widget_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rewards_team_id_foreign` (`team_id`);

--
-- Indexes for table `reward_redemptions`
--
ALTER TABLE `reward_redemptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reward_redemptions_user_id_foreign` (`user_id`),
  ADD KEY `reward_redemptions_reward_id_foreign` (`reward_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `session_durations`
--
ALTER TABLE `session_durations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_durations_user_id_foreign` (`user_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_team_id_foreign` (`team_id`),
  ADD KEY `idx_user_status_due_date` (`user_id`,`status`,`due_date`);

--
-- Indexes for table `task_assignments`
--
ALTER TABLE `task_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_assignments_task_id_foreign` (`task_id`),
  ADD KEY `task_assignments_user_id_foreign` (`user_id`);

--
-- Indexes for table `task_attachments`
--
ALTER TABLE `task_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_attachments_task_id_foreign` (`task_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_members_team_id_foreign` (`team_id`),
  ADD KEY `team_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_selected_title_id_foreign` (`selected_title_id`);

--
-- Indexes for table `user_admin_messages`
--
ALTER TABLE `user_admin_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_message_id` (`parent_message_id`);

--
-- Indexes for table `user_badges`
--
ALTER TABLE `user_badges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_badges_user_id_foreign` (`user_id`),
  ADD KEY `user_badges_badge_id_foreign` (`badge_id`);

--
-- Indexes for table `user_borders`
--
ALTER TABLE `user_borders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_borders_user_id_foreign` (`user_id`),
  ADD KEY `user_borders_border_id_foreign` (`border_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_user_id_foreign` (`user_id`);

--
-- Indexes for table `widget_checklists`
--
ALTER TABLE `widget_checklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widget_checklists_widget_id_foreign` (`widget_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1045;

--
-- AUTO_INCREMENT for table `badges`
--
ALTER TABLE `badges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `borders`
--
ALTER TABLE `borders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `checklists`
--
ALTER TABLE `checklists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3318;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reward_redemptions`
--
ALTER TABLE `reward_redemptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `session_durations`
--
ALTER TABLE `session_durations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `task_assignments`
--
ALTER TABLE `task_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `task_attachments`
--
ALTER TABLE `task_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `user_admin_messages`
--
ALTER TABLE `user_admin_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `user_badges`
--
ALTER TABLE `user_badges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_borders`
--
ALTER TABLE `user_borders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `widget_checklists`
--
ALTER TABLE `widget_checklists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checklists`
--
ALTER TABLE `checklists`
  ADD CONSTRAINT `checklists_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_checklists_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `invitations_invitee_id_foreign` FOREIGN KEY (`invitee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invitations_inviter_id_foreign` FOREIGN KEY (`inviter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_widget_id_foreign` FOREIGN KEY (`widget_id`) REFERENCES `widgets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rewards`
--
ALTER TABLE `rewards`
  ADD CONSTRAINT `rewards_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reward_redemptions`
--
ALTER TABLE `reward_redemptions`
  ADD CONSTRAINT `reward_redemptions_reward_id_foreign` FOREIGN KEY (`reward_id`) REFERENCES `rewards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reward_redemptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `session_durations`
--
ALTER TABLE `session_durations`
  ADD CONSTRAINT `session_durations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `task_assignments`
--
ALTER TABLE `task_assignments`
  ADD CONSTRAINT `task_assignments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_assignments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_attachments`
--
ALTER TABLE `task_attachments`
  ADD CONSTRAINT `task_attachments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_members`
--
ALTER TABLE `team_members`
  ADD CONSTRAINT `team_members_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `team_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_selected_title_id_foreign` FOREIGN KEY (`selected_title_id`) REFERENCES `titles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_admin_messages`
--
ALTER TABLE `user_admin_messages`
  ADD CONSTRAINT `user_admin_messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_admin_messages_ibfk_2` FOREIGN KEY (`parent_message_id`) REFERENCES `user_admin_messages` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_badges`
--
ALTER TABLE `user_badges`
  ADD CONSTRAINT `user_badges_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_badges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_borders`
--
ALTER TABLE `user_borders`
  ADD CONSTRAINT `user_borders_border_id_foreign` FOREIGN KEY (`border_id`) REFERENCES `borders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_borders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `widget_checklists`
--
ALTER TABLE `widget_checklists`
  ADD CONSTRAINT `widget_checklists_widget_id_foreign` FOREIGN KEY (`widget_id`) REFERENCES `widgets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
