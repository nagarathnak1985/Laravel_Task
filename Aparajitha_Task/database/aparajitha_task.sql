-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2024 at 07:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aparajitha_task`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `incomeexpenses`
--

CREATE TABLE `incomeexpenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incomeexpenses`
--

INSERT INTO `incomeexpenses` (`id`, `item`, `type`, `amount`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Books', 'Expense', 500.00, 2, '2024-09-16 16:14:25', '2024-09-16 23:20:15'),
(2, 'Shoping', 'Expence', 2000.00, 2, '2024-09-16 16:19:17', '2024-09-16 16:19:17'),
(4, 'Free shoping', 'Income', 600.00, 2, '2024-09-16 16:21:31', '2024-09-16 21:42:49'),
(5, 'Gifts123', 'Income', 2100.00, 4, '2024-09-16 18:58:06', '2024-09-16 22:38:12'),
(7, 'Mobile', 'Expense', 25000.00, 1, '2024-09-16 19:12:19', '2024-09-16 19:12:19'),
(12, 'furniture', 'Income', 25000.00, 2, '2024-09-16 21:51:36', '2024-09-16 21:51:36'),
(15, 'Laptop', 'Expense', 60000.00, 2, '2024-09-16 22:39:10', '2024-09-16 22:40:21');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_16_113631_insert_default_user_into_users_table', 2),
(6, '2024_09_16_161832_create_permission_tables', 3),
(7, '2024_09_16_174855_create_incomeexpenses_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage entries', 'web', '2024-09-16 06:30:32', '2024-09-16 06:30:32'),
(2, 'view all entries', 'web', '2024-09-16 06:30:32', '2024-09-16 06:30:32'),
(3, 'manage permissions', 'web', '2024-09-16 06:30:32', '2024-09-16 06:30:32');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-09-16 10:52:44', '2024-09-16 10:52:44'),
(2, 'Accountant', 'web', '2024-09-16 10:56:40', '2024-09-16 10:56:40'),
(7, 'Manager', 'web', '2024-09-16 22:59:54', '2024-09-16 22:59:54'),
(8, 'Developer', 'web', '2024-09-16 23:18:19', '2024-09-16 23:18:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '2024-09-16 06:08:03', '$2y$10$SqHcKwBsMsvhypykNz/iTusMQMISHWA6DLgPcm3fT6OQVpmfXo8x6', 1, 'GeoL4QoZRHaVMzW63QYe6fQtAwvWBdw6svk5iAPm5KKzrtyURwpOSjjpXvoS', '2024-09-16 06:08:03', '2024-09-16 06:08:03'),
(2, 'Accountant', 'accountant@gmail.com', '2024-09-16 06:08:03', '$2y$10$SqHcKwBsMsvhypykNz/iTusMQMISHWA6DLgPcm3fT6OQVpmfXo8x6', 2, 'TTF5ad5PBcCjLEqFO8MmejQmMy4XvTL3raq9GJ0UDA6cXRfiD9oG52RywUfJ', '2024-09-16 06:08:03', '2024-09-16 06:08:03'),
(3, 'kunte', 'accountant1@gmail.com', NULL, '$2y$10$wRU2QEM30xHJpCbPBuHWt.TXlBY7fJ6sU0nZ/tSpuhMFcy7osmeG2', 2, NULL, '2024-09-16 14:09:58', '2024-09-16 14:09:58'),
(4, 'test', 'test@gmail.com', NULL, '$2y$10$S0BD45BbFfNnuHZY2WWBAeVpLjtcFTtUGkZfkkb9pidCkyE5/5OvK', 2, NULL, '2024-09-16 14:11:01', '2024-09-16 14:11:01'),
(5, 'test1', 'test1@gmail.com', NULL, '$2y$10$z3WpB/WwvX5zP5wMgi8h1u8Mi6mLLpIstrubIEa/ZHq2.t8xgh6I6', 1, NULL, '2024-09-16 14:11:45', '2024-09-16 14:11:45'),
(6, 'nani', 'nani@gmail.com', NULL, '$2y$10$hK/HXnaKEw8qTu7XWTAtOeN8otZyiz1Ww.u4Fvnei.ErVv/55tNmK', 1, NULL, '2024-09-16 14:14:35', '2024-09-16 14:14:35'),
(7, 'nani', 'nani1@gmail.com', NULL, '$2y$10$Ci.xa5V0iWE8fc3PYCIRbO0DupRTr2CGgufCuNvCHGJVp0g46IQ/G', 2, NULL, '2024-09-16 14:16:51', '2024-09-16 14:16:51'),
(8, 'Harsha', 'harsha@gmail.com', NULL, '$2y$10$B/0fLhz2pC2V11ry8.W5VO05leAqIc.Sh8znlJYI7i1NHkTrPGji.', 1, NULL, '2024-09-16 14:17:58', '2024-09-16 14:17:58'),
(9, 'Test', 'test12@gmail.com', NULL, '$2y$10$gO08Pfu68sFzinMIMdzrPe1teoulFCWm.fvTZm8ZOSYrtkP//xn/e', 7, NULL, '2024-09-16 23:17:34', '2024-09-16 23:17:34'),
(10, 'new accountant', '123accountant@gmail.com', NULL, '$2y$10$4kLA4VjrSmJl9tViB6sT4OKuzDdqZ58jHJKG2kGIjQOARG.uc4jSm', 7, NULL, '2024-09-16 23:19:43', '2024-09-16 23:19:43'),
(11, 'aparajitha', 'aparajitha@gmail.com', NULL, '$2y$10$geA6/5USWBYtB5I7cNJAju/vHqfG52Zv7F6198weSc3A3UF5q3gB.', 2, NULL, '2024-09-16 23:35:57', '2024-09-16 23:35:57'),
(12, 'testUser', 'accountantTest@gmail.com', NULL, '$2y$10$M./6LQl.fUhQSkOvZrI/cO2E384W1K4LGvR7YREms.8rD5l2YuOsK', 8, NULL, '2024-09-16 23:38:43', '2024-09-16 23:38:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `incomeexpenses`
--
ALTER TABLE `incomeexpenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomeexpenses_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomeexpenses`
--
ALTER TABLE `incomeexpenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `incomeexpenses`
--
ALTER TABLE `incomeexpenses`
  ADD CONSTRAINT `incomeexpenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
