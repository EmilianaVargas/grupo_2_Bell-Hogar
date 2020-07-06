-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-07-2020 a las 21:16:37
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bell_hogar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL,
  `address` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL,
  `card_number` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `category_id` VARCHAR(45) NULL,
  `subcategory_id` VARCHAR(45) NULL,
  `brand_id` VARCHAR(45) NULL,
  `description` VARCHAR(255) NULL,
  `technical_specifications` VARCHAR(255) NULL,
  `color` VARCHAR(255) NULL,
  `unit_price` DOUBLE NOT NULL,
  `image1` VARCHAR(45) NULL,
  `image2` VARCHAR(45) NULL,
  `image3` VARCHAR(45) NULL,
  `image4` VARCHAR(45) NULL,
  `stock` DOUBLE NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `first_name` char(20) NOT NULL,
  `last_name` char(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `dni_cuit` double DEFAULT NULL,
  `is_admin` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `phone` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `users`:
--   `address_id`
--       `addresses` -> `id`
--   `payment_id`
--       `payments` -> `id`
--

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `dni_cuit`, `is_admin`, `image`, `phone`, `created_at`, `updated_at`, `password`, `address_id`, `payment_id`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', 12345678, 'true', 'a', 44444444, '2020-07-06 01:01:01', '2020-07-06 01:01:01', '$2b$10$5Fguf1R2XZTCJL7Qk7/AeuouEw7o3jbTk6BHOoo71sXwdXvHjCf7e', NULL, NULL),
(2, 'emiliana', 'vargas', 'emiliana@abc.com', NULL, 'false', NULL, 99999999, NULL, NULL, '$2b$10$djprOAo.LxwuX0zG1PTCL.QxyXPDydTN7HLgdnnXVcuJGdI21HAlO', NULL, NULL),
(3, 'prueba3', 'prueba3', 'prueba3@abc.com', 33333333, 'false', NULL, 33333333, NULL, NULL, '$2b$10$K731/tDXVyq4cG1enM.ZleTecsN.pOVvd3ZNvLYfkK0P5Zhaywrpa', NULL, NULL),
(4, 'prueba4', 'prueba4', 'prueba4@abc.com', 44444444, 'false', NULL, 44444444, NULL, NULL, '$2b$10$5Fguf1R2XZTCJL7Qk7/AeuouEw7o3jbTk6BHOoo71sXwdXvHjCf7e', NULL, NULL),
(5, 'prueba9', 'prueba9', 'prueba9@abc.com', 99999999, 'false', NULL, 99999999, NULL, NULL, '$2b$10$djprOAo.LxwuX0zG1PTCL.QxyXPDydTN7HLgdnnXVcuJGdI21HAlO', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);
  ADD KEY `fk_addresses_idx` (`user_id`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payments_idx` (`user_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_address_idx` (`address_id`),
  ADD KEY `fk_payments_idx` (`payment_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_addresses` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_3` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
