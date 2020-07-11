-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2020 a las 23:24:11
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
CREATE DATABASE IF NOT EXISTS `bell_hogar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bell_hogar`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `address`:
--   `user_id`
--       `users` -> `id`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `card_number` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `payment`:
--   `user_id`
--       `users` -> `id`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `subcategory` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `image1` varchar(45) DEFAULT NULL,
  `image2` varchar(45) DEFAULT NULL,
  `image3` varchar(45) DEFAULT NULL,
  `image4` varchar(45) DEFAULT NULL,
  `stock` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `product`:
--

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(1, 'CALEFACTOR LILIANA LEÑOS C/FORZADOR 700/1400 ', 'CALEFACCION        ', 'CALEFACTORES ELECTRICOS        ', 'LILIANA        ', 'CALEFACTOR LILIANA LEÑOS C/FORZADOR 700/1400 W CH218AR        ', 15.999, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-2.jpg', 4);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(2, 'CALEFACTOR LILIANA INFRARROJO \"CALORE\" CCI08 ', 'CALEFACCION ', 'CALEFACTORES ELECTRICOS ', 'LILIANA ', 'CALEFACTOR LILIANA INFRARROJO \"CALORE\" CCI080', 2.644, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 14);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(3, 'CALOVENTOR LILIANA \"DUAL HOT\" \"CCCFH510\"  ', 'CALEFACCION  ', 'CALEFACTORES ELECTRICOS  ', 'LILIANA  ', 'CALOVENTOR LILIANA \"DUAL HOT\" \"CCCFH510\"  ', 2.652, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(4, 'CALEFACTOR LILIANA INFRARROJO OSCILANTE \"INFR', 'CALEFACCION   ', 'CALEFACTORES ELECTRICOS   ', 'LILIANA   ', 'CALEFACTOR LILIANA INFRARROJO OSCILANTE \"INFRASOL\"\" 700/1400 W NEGRO CCIG100\"   ', 3.145, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(5, 'TURBOCALEFACTOR LILIANA \"HOTDECO\"\" PIE/PARED ', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TURBOCALEFACTOR LILIANA \"HOTDECO\"\" PIE/PARED CCPPV500\"', 6.611, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(6, 'TECNOTURBO LILIANA TECNOHOT CTCV100', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TECNOTURBO LILIANA TECNOHOT CTCV100', 3.223, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(7, 'TURBOCALEFACTOR LILIANA CCTC20  ', 'CALEFACCION  ', 'CALEFACTORES ELECTRICOS  ', 'LILIANA  ', 'TURBOCALEFACTOR LILIANA CCTC20  ', 2.199, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 6);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(8, 'PANEL RADIANTE LILIANA INFRARROJO VULCANO 120', 'CALEFACCION      ', 'CALEFACTORES ELECTRICOS      ', 'LILIANA      ', 'PANEL RADIANTE LILIANA INFRARROJO VULCANO 1200/2400 W CCCI640      ', 4.389, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 9);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(9, 'CALOVENTOR LILIANA \"MINISOL\"\" 1000/2000 W CCC', 'CALEFACCION ', 'CALEFACTORES ELECTRICOS ', 'LILIANA ', 'CALOVENTOR LILIANA \"MINISOL\"\" 1000/2000 W CCCFH400\" ', 1.579, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(10, 'TURBOCALEFACTOR LILIANA \"CONFORTDECO\"\" PIE/PA', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TURBOCALEFACTOR LILIANA \"CONFORTDECO\"\" PIE/PARED CCPPV400\"', 5.371, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(11, 'TURBOFORZADOR LILIANA TORRE \"TROPIC\"\" CCFTP53', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TURBOFORZADOR LILIANA TORRE \"TROPIC\"\" CCFTP530\"', 3.801, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(12, 'PROCESADORA LILIANA MANUAL \"TWISTMIX\"\" AAH910', 'ELECTRODOMESTICOS ', 'PROCESADORAS ', 'LILIANA ', 'PROCESADORA LILIANA MANUAL \"TWISTMIX\"\" AAH910/911\" ', 3.145, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 5);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(13, 'LUSTRASPIRADORA LILIANA CON PAÑOS LL340 ', 'ELECTRODOMESTICOS ', 'ASPIRADORAS ', 'LILIANA ', 'LUSTRASPIRADORA LILIANA CON PAÑOS LL340 ', 7.438, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(14, 'LICUADORA LILIANA \"DELUXLIX\"\" AL180\"', 'ELECTRODOMESTICOS', 'LICUADORAS', 'LILIANA', 'LICUADORA LILIANA \"DELUXLIX\"\" AL180\"', 4.628, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(15, 'PAVA ELECTRICA LILIANA \"TEMPOMATE\"\"/\"\"MATEAND', 'ELECTRODOMESTICOS', 'PAVAS ELECTRICAS', 'LILIANA', 'PAVA ELECTRICA LILIANA \"TEMPOMATE\"\"/\"\"MATEANDO\"\" AP975\"', 3.016, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 9);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(16, 'BATIDORA LILIANA PLANETARIA \"POWERMIX\"\" AB910', 'ELECTRODOMESTICOS', 'BATIDORAS', 'LILIANA', 'BATIDORA LILIANA PLANETARIA \"POWERMIX\"\" AB910\"', 14.049, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(17, 'HORNO DE PAN LILIANA \"FULL BREAD\"\" 45 L AFP91', 'ELECTRODOMESTICOS', 'HORNOS PARA PAN', 'LILIANA', 'HORNO DE PAN LILIANA \"FULL BREAD\"\" 45 L AFP910\"', 6.198, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(19, 'VENTILADOR DE PIE LILIANA 20\" PARR MET/ASPAS ', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 20\" PARR MET/ASPAS METALICAS VPM2016\"', 3.966, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(20, 'VENTILADOR DE TECHO LILIANA VTB100', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE TECHO LILIANA VTB100', 3.801, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 3);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(21, 'VENTILADOR DE TECHO LILIANA C/4 TULIPAS VTHM4', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE TECHO LILIANA C/4 TULIPAS VTHM410', 9.008, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 4);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(22, 'VENTILADOR INDUSTRIAL LILIANA 32\" VPI32\"', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR INDUSTRIAL LILIANA 32\" VPI32\"', 6.942, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 8);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(23, 'VENTILADOR DE PIE LILIANA 20\" CROMADO VVPC20B', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 20\" CROMADO VVPC20B\"', 4.297, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(24, 'AIRE ACONDICIONADO TCL MIRACLE 5100 W F/C TAC', 'FRIO/CALOR', 'AIRES ACONDICIONADOS', 'LILIANA', 'AIRE ACONDICIONADO TCL MIRACLE 5100 W F/C TACA-5100FCSA/MI2-SK', 36.776, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 4);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(25, 'VENTILADOR DE PIE LILIANA 20\" CROMADO VVPRC20', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 20\" CROMADO VVPRC20\"', 553, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(26, 'VENTILADOR DE PIE LILIANA 18\" ORBITAL CROMADO', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 18\" ORBITAL CROMADO VVPRC18\"', 619, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(27, 'VENTILADOR DE PARED LILIANA 30\" VVID30\"', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PARED LILIANA 30\" VVID30\"', 6.776, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(28, 'TURBOVENTILADOR LILIANA 18\" ORBITAL CROMADO V', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'TURBOVENTILADOR LILIANA 18\" ORBITAL CROMADO VVTRC18/VVOTRC18\"', 3.305, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1);
INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES(29, 'VENTILADOR DE MESA LILIANA 16\" ORBITAL VSOC16', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE MESA LILIANA 16\" ORBITAL VSOC16\"', 2.975, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` char(20) NOT NULL,
  `last_name` char(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `dni_cuit` double DEFAULT NULL,
  `is_admin` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'true/false por defecto para cualquier usuario que se registre',
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
--       `address` -> `id`
--   `payment_id`
--       `payment` -> `id`
--

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `dni_cuit`, `is_admin`, `image`, `phone`, `created_at`, `updated_at`, `password`, `address_id`, `payment_id`) VALUES(1, 'admin', 'admin', 'admin@admin.com', 12345678, '1', 'a', 44444444, '2020-07-06 01:01:01', '2020-07-06 01:01:01', '$2b$10$5Fguf1R2XZTCJL7Qk7/AeuouEw7o3jbTk6BHOoo71sXwdXvHjCf7e', NULL, NULL);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `dni_cuit`, `is_admin`, `image`, `phone`, `created_at`, `updated_at`, `password`, `address_id`, `payment_id`) VALUES(2, 'emiliana', 'vargas', 'emiliana@abc.com', NULL, '0', NULL, 99999999, NULL, NULL, '$2b$10$djprOAo.LxwuX0zG1PTCL.QxyXPDydTN7HLgdnnXVcuJGdI21HAlO', NULL, NULL);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `dni_cuit`, `is_admin`, `image`, `phone`, `created_at`, `updated_at`, `password`, `address_id`, `payment_id`) VALUES(3, 'prueba3', 'prueba3', 'prueba3@abc.com', 33333333, '0', 'kjashdkjhas - 999999992020-.jpg', 33333333, NULL, NULL, '$2b$10$K731/tDXVyq4cG1enM.ZleTecsN.pOVvd3ZNvLYfkK0P5Zhaywrpa', NULL, NULL);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `dni_cuit`, `is_admin`, `image`, `phone`, `created_at`, `updated_at`, `password`, `address_id`, `payment_id`) VALUES(4, 'prueba4', 'prueba4', 'prueba4@abc.com', 44444444, '0', NULL, 44444444, NULL, NULL, '$2b$10$5Fguf1R2XZTCJL7Qk7/AeuouEw7o3jbTk6BHOoo71sXwdXvHjCf7e', NULL, NULL);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `dni_cuit`, `is_admin`, `image`, `phone`, `created_at`, `updated_at`, `password`, `address_id`, `payment_id`) VALUES(5, 'prueba9', 'prueba9', 'prueba9@abc.com', 99999999, '0', NULL, 99999999, NULL, NULL, '$2b$10$djprOAo.LxwuX0zG1PTCL.QxyXPDydTN7HLgdnnXVcuJGdI21HAlO', NULL, NULL);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `dni_cuit`, `is_admin`, `image`, `phone`, `created_at`, `updated_at`, `password`, `address_id`, `payment_id`) VALUES(11, 'actualizado prueba5', 'prueba5', 'prueba5@abc.com', NULL, '0', 'prueba5 - 555555552020-.jpg', 55555555, NULL, NULL, '$2b$10$UY9boXhO1MQnnVmsf2VW2eHe4g2m3WkefXGuwOZJZnyNbgHmEtcXm', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_addresses` (`user_id`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payments_idx` (`user_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
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
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_addresses` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payments` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_3` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
