-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-07-2020 a las 02:36:37
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
  `user_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zip_code` int(10) NOT NULL,
  `locality` varchar(100) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`id`, `user_id`, `address`, `zip_code`, `locality`, `state_id`) VALUES
(5, 3, 'Paso de los Andes 1234', 5500, 'Sexta Seccion', 1),
(10, 3, 'Calle Segunda 321', 5701, '11 de Mayo', 3),
(11, 3, 'Lavalle 1234', 5501, 'Godoy Cruz', 1),
(22, 3, 'Patricias Mendocinas 7- Depto 7', 5500, 'Ciudad de Mendoza', 1),
(30, 17, 'Calle Tercera 1234', 5400, 'Rivadavia', 2),
(31, 17, '9 de Julio', 5703, 'Divisadero', 3),
(34, 17, 'Salta 1500', 5500, 'Ciudad de Mendoza', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `card_number` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `subcategory` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `technical_specifications` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `image1` varchar(45) DEFAULT NULL,
  `image2` varchar(45) DEFAULT NULL,
  `image3` varchar(45) DEFAULT NULL,
  `image4` varchar(45) DEFAULT NULL,
  `stock` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `technical_specifications`, `color`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`) VALUES
(1, 'CALEFACTOR LILIANA LEÑOS C/FORZADOR 700/1400 ', 'CALEFACCION        ', 'CALEFACTORES ELECTRICOS        ', 'LILIANA        ', 'CALEFACTOR LILIANA LEÑOS C/FORZADOR 700/1400 W CH218AR        ', NULL, NULL, 15.999, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-2.jpg', 4),
(2, 'CALEFACTOR LILIANA INFRARROJO \"CALORE\" CCI08 ', 'CALEFACCION ', 'CALEFACTORES ELECTRICOS ', 'LILIANA ', 'CALEFACTOR LILIANA INFRARROJO \"CALORE\" CCI080', NULL, NULL, 2.644, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 14),
(3, 'CALOVENTOR LILIANA \"DUAL HOT\" \"CCCFH510\"  ', 'CALEFACCION  ', 'CALEFACTORES ELECTRICOS  ', 'LILIANA  ', 'CALOVENTOR LILIANA \"DUAL HOT\" \"CCCFH510\"  ', NULL, NULL, 2.652, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(4, 'CALEFACTOR LILIANA INFRARROJO OSCILANTE \"INFR', 'CALEFACCION   ', 'CALEFACTORES ELECTRICOS   ', 'LILIANA   ', 'CALEFACTOR LILIANA INFRARROJO OSCILANTE \"INFRASOL\"\" 700/1400 W NEGRO CCIG100\"   ', NULL, NULL, 3.145, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2),
(5, 'TURBOCALEFACTOR LILIANA \"HOTDECO\"\" PIE/PARED ', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TURBOCALEFACTOR LILIANA \"HOTDECO\"\" PIE/PARED CCPPV500\"', NULL, NULL, 6.611, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(6, 'TECNOTURBO LILIANA TECNOHOT CTCV100', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TECNOTURBO LILIANA TECNOHOT CTCV100', NULL, NULL, 3.223, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(7, 'TURBOCALEFACTOR LILIANA CCTC20  ', 'CALEFACCION  ', 'CALEFACTORES ELECTRICOS  ', 'LILIANA  ', 'TURBOCALEFACTOR LILIANA CCTC20  ', NULL, NULL, 2.199, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 6),
(8, 'PANEL RADIANTE LILIANA INFRARROJO VULCANO 120', 'CALEFACCION      ', 'CALEFACTORES ELECTRICOS      ', 'LILIANA      ', 'PANEL RADIANTE LILIANA INFRARROJO VULCANO 1200/2400 W CCCI640      ', NULL, NULL, 4.389, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 9),
(9, 'CALOVENTOR LILIANA \"MINISOL\"\" 1000/2000 W CCC', 'CALEFACCION ', 'CALEFACTORES ELECTRICOS ', 'LILIANA ', 'CALOVENTOR LILIANA \"MINISOL\"\" 1000/2000 W CCCFH400\" ', NULL, NULL, 1.579, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(10, 'TURBOCALEFACTOR LILIANA \"CONFORTDECO\"\" PIE/PA', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TURBOCALEFACTOR LILIANA \"CONFORTDECO\"\" PIE/PARED CCPPV400\"', NULL, NULL, 5.371, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2),
(11, 'TURBOFORZADOR LILIANA TORRE \"TROPIC\"\" CCFTP53', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TURBOFORZADOR LILIANA TORRE \"TROPIC\"\" CCFTP530\"', NULL, NULL, 3.801, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2),
(12, 'PROCESADORA LILIANA MANUAL \"TWISTMIX\"\" AAH910', 'ELECTRODOMESTICOS ', 'PROCESADORAS ', 'LILIANA ', 'PROCESADORA LILIANA MANUAL \"TWISTMIX\"\" AAH910/911\" ', NULL, NULL, 3.145, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 5),
(13, 'LUSTRASPIRADORA LILIANA CON PAÑOS LL340 ', 'ELECTRODOMESTICOS ', 'ASPIRADORAS ', 'LILIANA ', 'LUSTRASPIRADORA LILIANA CON PAÑOS LL340 ', NULL, NULL, 7.438, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2),
(14, 'LICUADORA LILIANA \"DELUXLIX\"\" AL180\"', 'ELECTRODOMESTICOS', 'LICUADORAS', 'LILIANA', 'LICUADORA LILIANA \"DELUXLIX\"\" AL180\"', NULL, NULL, 4.628, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(15, 'PAVA ELECTRICA LILIANA \"TEMPOMATE\"\"/\"\"MATEAND', 'ELECTRODOMESTICOS', 'PAVAS ELECTRICAS', 'LILIANA', 'PAVA ELECTRICA LILIANA \"TEMPOMATE\"\"/\"\"MATEANDO\"\" AP975\"', NULL, NULL, 3.016, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 9),
(16, 'BATIDORA LILIANA PLANETARIA \"POWERMIX\"\" AB910', 'ELECTRODOMESTICOS', 'BATIDORAS', 'LILIANA', 'BATIDORA LILIANA PLANETARIA \"POWERMIX\"\" AB910\"', NULL, NULL, 14.049, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(17, 'HORNO DE PAN LILIANA \"FULL BREAD\"\" 45 L AFP91', 'ELECTRODOMESTICOS', 'HORNOS PARA PAN', 'LILIANA', 'HORNO DE PAN LILIANA \"FULL BREAD\"\" 45 L AFP910\"', NULL, NULL, 6.198, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2),
(19, 'VENTILADOR DE PIE LILIANA 20\" PARR MET/ASPAS ', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 20\" PARR MET/ASPAS METALICAS VPM2016\"', NULL, NULL, 3.966, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(20, 'VENTILADOR DE TECHO LILIANA VTB100', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE TECHO LILIANA VTB100', NULL, NULL, 3.801, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 3),
(21, 'VENTILADOR DE TECHO LILIANA C/4 TULIPAS VTHM4', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE TECHO LILIANA C/4 TULIPAS VTHM410', NULL, NULL, 9.008, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 4),
(22, 'VENTILADOR INDUSTRIAL LILIANA 32\" VPI32\"', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR INDUSTRIAL LILIANA 32\" VPI32\"', NULL, NULL, 6.942, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 8),
(23, 'VENTILADOR DE PIE LILIANA 20\" CROMADO VVPC20B', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 20\" CROMADO VVPC20B\"', NULL, NULL, 4.297, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(24, 'AIRE ACONDICIONADO TCL MIRACLE 5100 W F/C TAC', 'FRIO/CALOR', 'AIRES ACONDICIONADOS', 'LILIANA', 'AIRE ACONDICIONADO TCL MIRACLE 5100 W F/C TACA-5100FCSA/MI2-SK', NULL, NULL, 36.776, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 4),
(25, 'VENTILADOR DE PIE LILIANA 20\" CROMADO VVPRC20', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 20\" CROMADO VVPRC20\"', NULL, NULL, 553, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(26, 'VENTILADOR DE PIE LILIANA 18\" ORBITAL CROMADO', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 18\" ORBITAL CROMADO VVPRC18\"', NULL, NULL, 619, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(27, 'VENTILADOR DE PARED LILIANA 30\" VVID30\"', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PARED LILIANA 30\" VVID30\"', NULL, NULL, 6.776, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 2),
(28, 'TURBOVENTILADOR LILIANA 18\" ORBITAL CROMADO V', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'TURBOVENTILADOR LILIANA 18\" ORBITAL CROMADO VVTRC18/VVOTRC18\"', NULL, NULL, 3.305, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 1),
(29, 'VENTILADOR DE MESA LILIANA 16\" ORBITAL VSOC16', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE MESA LILIANA 16\" ORBITAL VSOC16\"', NULL, NULL, 2.975, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, 'Mendoza'),
(2, 'San Juan '),
(3, 'San Luis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` char(20) NOT NULL,
  `last_name` char(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dni_cuit` double DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `phone` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `dni_cuit`, `is_admin`, `image`, `phone`, `created_at`, `updated_at`, `password`, `address_id`, `payment_id`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', 12345678, 1, 'random_profile.jpg', 44444444, '2020-07-06 01:01:01', '2020-07-06 01:01:01', '$2b$10$5Fguf1R2XZTCJL7Qk7/AeuouEw7o3jbTk6BHOoo71sXwdXvHjCf7e', NULL, NULL),
(2, 'emiliana', 'vargas', 'emiliana@abc.com', NULL, 0, 'random_profile.jpg', 99999999, NULL, NULL, '$2b$10$djprOAo.LxwuX0zG1PTCL.QxyXPDydTN7HLgdnnXVcuJGdI21HAlO', NULL, NULL),
(3, 'prueba3', 'prueba3', 'prueba3@abc.com', 33333333, 0, 'random_profile.jpg', 33333333, NULL, NULL, '$2b$10$K731/tDXVyq4cG1enM.ZleTecsN.pOVvd3ZNvLYfkK0P5Zhaywrpa', NULL, NULL),
(4, 'prueba4', 'prueba4', 'prueba4@abc.com', 44444444, 0, NULL, 44444444, NULL, NULL, '$2b$10$5Fguf1R2XZTCJL7Qk7/AeuouEw7o3jbTk6BHOoo71sXwdXvHjCf7e', NULL, NULL),
(5, 'prueba9', 'prueba9', 'prueba9@abc.com', 99999999, 0, NULL, 99999999, NULL, NULL, '$2b$10$djprOAo.LxwuX0zG1PTCL.QxyXPDydTN7HLgdnnXVcuJGdI21HAlO', NULL, NULL),
(11, 'actualizado prueba5', 'prueba5', 'prueba5@abc.com', NULL, 0, 'prueba5 - 555555552020-.jpg', 55555555, NULL, NULL, '$2b$10$UY9boXhO1MQnnVmsf2VW2eHe4g2m3WkefXGuwOZJZnyNbgHmEtcXm', NULL, NULL),
(17, 'Emiliana Giselle', 'Vargas Verdejo', 'emilianavargasverdejo@gmail.com', 123123456, 0, 'Emiliana Giselle - 325555552020-.jpg', 261155555555, NULL, NULL, '$2b$10$nN6SlGBGT6RGi5W2VYf0Fuwf6jt02ZLCvBjsYglSnLTRPQGa2BHuK', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_addresses` (`user_id`),
  ADD KEY `fk_address_state_idx` (`state_id`);

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
-- Indices de la tabla `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_payments_idx` (`payment_id`),
  ADD KEY `fk_users_2_idx` (`address_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_address_state` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
