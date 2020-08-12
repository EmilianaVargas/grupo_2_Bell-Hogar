-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-08-2020 a las 05:28:37
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

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zip_code` int(10) NOT NULL,
  `locality` varchar(100) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_addresses` (`user_id`),
  KEY `fk_address_state_idx` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `confirmed_at` date DEFAULT NULL,
  `finished` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_carts_1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
CREATE TABLE IF NOT EXISTS `cart_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `units` int(11) NOT NULL DEFAULT 0,
  `subtotal` float DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_products_idProducts1_idx` (`product_id`),
  KEY `fk_cart_products_idCart_idx` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_number` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `stock` double NOT NULL,
  `id_carrito` int(11) DEFAULT NULL,
  `enabled` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `category`, `subcategory`, `brand`, `description`, `price`, `image1`, `image2`, `image3`, `image4`, `stock`, `id_carrito`, `enabled`) VALUES
(1, 'CALEFACTOR LILIANA LEÑOS C/FORZADOR 700/1400 ', 'CALEFACCION         ', 'CALEFACTORES ELECTRICOS         ', 'LILIANA         ', 'CALEFACTOR LILIANA LEÑOS C/FORZADOR 700/1400 W CH218AR         ', 15991, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-2.jpg', 40, NULL, 0),
(2, 'CALEFACTOR LILIANA INFRARROJO CALORE CCI08', 'CALEFACCION        ', 'CALEFACTORES ELECTRICOS        ', 'LILIANA        ', 'CALEFACTOR LILIANA INFRARROJO \"CALORE\" CCI080       ', 2644, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 330, NULL, 1),
(3, 'CALOVENTOR LILIANA DUAL HOT CCCFH510', 'CALEFACCION  ', 'CALEFACTORES ELECTRICOS  ', 'LILIANA  ', 'CALOVENTOR LILIANA DUAL HOT CCCFH510', 2652, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 1),
(4, 'CALEFACTOR LILIANA INFRARROJO OSCILANTE INFR', 'CALEFACCION   ', 'CALEFACTORES ELECTRICOS   ', 'LILIANA   ', 'CALEFACTOR LILIANA INFRARROJO OSCILANTE \"INFRASOL\"\" 700/1400 W NEGRO CCIG100\"   ', 3145, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 20, NULL, 1),
(5, 'TURBOCALEFACTOR LILIANA \"HOTDECO\"\" PIE/PARED ', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TURBOCALEFACTOR LILIANA \"HOTDECO\"\" PIE/PARED CCPPV500\"', 6611, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 0),
(6, 'TECNOTURBO LILIANA TECNOHOT CTCV100', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TECNOTURBO LILIANA TECNOHOT CTCV100', 3223, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 0),
(7, 'TURBOCALEFACTOR LILIANA CCTC20  ', 'CALEFACCION  ', 'CALEFACTORES ELECTRICOS  ', 'LILIANA  ', 'TURBOCALEFACTOR LILIANA CCTC20  ', 2199, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 60, NULL, 0),
(8, 'TECNOTURBO LILIANA TECNOHOT CTCV100', 'CALEFACCION      ', 'CALEFACTORES ELECTRICOS      ', 'LILIANA      ', 'PANEL RADIANTE LILIANA INFRARROJO VULCANO 1200/2400 W CCCI640      ', 4389, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 90, NULL, 1),
(9, 'CALOVENTOR LILIANA \"MINISOL\"\" 1000/2000 W CCC', 'CALEFACCION ', 'CALEFACTORES ELECTRICOS ', 'LILIANA ', 'CALOVENTOR LILIANA \"MINISOL\"\" 1000/2000 W CCCFH400\" ', 1579, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 0),
(10, 'TURBOCALEFACTOR LILIANA \"CONFORTDECO\"\" PIE/PA', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TURBOCALEFACTOR LILIANA \"CONFORTDECO\"\" PIE/PARED CCPPV400\"', 5371, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 20, NULL, 0),
(11, 'TURBOFORZADOR LILIANA TORRE \"TROPIC\"\" CCFTP53', 'CALEFACCION', 'CALEFACTORES ELECTRICOS', 'LILIANA', 'TURBOFORZADOR LILIANA TORRE \"TROPIC\"\" CCFTP530\"', 3801, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 20, NULL, 0),
(12, 'PROCESADORA LILIANA MANUAL \"TWISTMIX\"\" AAH910', 'ELECTRODOMESTICOS ', 'PROCESADORAS ', 'LILIANA ', 'PROCESADORA LILIANA MANUAL \"TWISTMIX\"\" AAH910/911\" ', 3145, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 50, NULL, 0),
(13, 'LUSTRASPIRADORA LILIANA CON PAÑOS LL340', 'ELECTRODOMESTICOS ', 'ASPIRADORAS ', 'LILIANA ', 'LUSTRASPIRADORA LILIANA CON PAÑOS LL340 ', 7438, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 20, NULL, 1),
(14, 'LICUADORA LILIANA DELUXLIX AL180', 'ELECTRODOMESTICOS', 'LICUADORAS', 'LILIANA', 'LICUADORA LILIANA \"DELUXLIX\"\" AL180\"', 4628, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 1),
(15, 'PAVA ELECTRICA LILIANA TEMPOMATEMATEAND', 'ELECTRODOMESTICOS', 'PAVAS ELECTRICAS', 'LILIANA', 'PAVA ELECTRICA LILIANA \"TEMPOMATE\"\"/\"\"MATEANDO\"\" AP975\"', 3016, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 90, NULL, 1),
(16, 'BATIDORA LILIANA PLANETARIA POWERMIX AB910', 'ELECTRODOMESTICOS', 'BATIDORAS', 'LILIANA', 'BATIDORA LILIANA PLANETARIA \"POWERMIX\"\" AB910\"', 14049, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 1),
(17, 'HORNO DE PAN LILIANA \"FULL BREAD\"\" 45 L AFP91', 'ELECTRODOMESTICOS', 'HORNOS PARA PAN', 'LILIANA', 'HORNO DE PAN LILIANA \"FULL BREAD\"\" 45 L AFP910\"', 6198, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 20, NULL, 0),
(19, 'VENTILADOR DE PIE LILIANA 20\" PARR MET/ASPAS ', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 20\" PARR MET/ASPAS METALICAS VPM2016\"', 3966, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 0),
(20, 'VENTILADOR DE TECHO LILIANA VTB100', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE TECHO LILIANA VTB100', 3801, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 30, NULL, 0),
(21, 'VENTILADOR DE TECHO LILIANA C4 TULIPAS VTHM4', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE TECHO LILIANA C/4 TULIPAS VTHM410', 9008, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 40, NULL, 0),
(22, 'VENTILADOR INDUSTRIAL LILIANA 32\" VPI32\"', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR INDUSTRIAL LILIANA 32\" VPI32\"', 6942, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 80, NULL, 0),
(23, 'VENTILADOR DE TECHO LILIANA C4 TULIPAS VTHM4', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 20\" CROMADO VVPC20B\"', 4297, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 1),
(24, 'VENTILADOR DE MESA LILIANA 16 ORBITAL VSOC16', 'FRIO/CALOR', 'AIRES ACONDICIONADOS', 'LILIANA', 'AIRE ACONDICIONADO TCL MIRACLE 5100 W F/C TACA-5100FCSA/MI2-SK', 36776, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 40, NULL, 1),
(25, 'VENTILADOR INDUSTRIAL LILIANA 32 VPI32', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 20\" CROMADO VVPRC20\"', 553, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 1),
(26, 'VENTILADOR DE PIE LILIANA 18\" ORBITAL CROMADO', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PIE LILIANA 18\" ORBITAL CROMADO VVPRC18\"', 619, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 0),
(27, 'VENTILADOR DE PARED LILIANA 30 VVID30', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'VENTILADOR DE PARED LILIANA 30\" VVID30\"', 6776, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 20, NULL, 1),
(28, 'VENTILADOR INDUSTRIAL LILIANA 32 VPI32', 'FRIO/CALOR', 'VENTILADORES', 'LILIANA', 'TURBOVENTILADOR LILIANA 18\" ORBITAL CROMADO VVTRC18/VVOTRC18\"', 3305, 'silla-1-1.jpg', 'silla-1-3.jpg', 'sofa banner.jpg', 'silla-1-3.jpg', 10, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
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

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `payment_id` int(11) DEFAULT NULL,
  `adress` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_payments_idx` (`payment_id`),
  KEY `fk_users_2_idx` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `dni_cuit`, `is_admin`, `image`, `phone`, `created_at`, `updated_at`, `password`, `address_id`, `payment_id`, `adress`) VALUES
(1, 'Administrador', 'Bell Hogar', 'admin@bellhogar.com', 12345678, 1, 'random_profile.jpg', 44444444, '2020-07-06 01:01:01', '2020-07-06 01:01:01', '$2b$10$5Fguf1R2XZTCJL7Qk7/AeuouEw7o3jbTk6BHOoo71sXwdXvHjCf7e', NULL, NULL, 'Paso de los Andes 1234 Ciuadad Mendoza'),
(2, 'Emiliana', 'Vargas', 'emiliana@gmail.com', NULL, 0, 'random_profile.jpg', 99999999, NULL, NULL, '$2b$10$djprOAo.LxwuX0zG1PTCL.QxyXPDydTN7HLgdnnXVcuJGdI21HAlO', NULL, NULL, 'Paso de los Andes 1234 Ciuadad Mendoza'),
(3, 'Juan', 'Garcia', 'juanGarcia@gmail.com', 33333333, 0, 'random_profile.jpg', 33333333, NULL, NULL, '$2b$10$K731/tDXVyq4cG1enM.ZleTecsN.pOVvd3ZNvLYfkK0P5Zhaywrpa', NULL, NULL, 'Paso de los Andes 1234 Ciuadad Mendoza'),
(17, 'Emiliana Giselle', 'Vargas Verdejo', 'emilianavargasverdejo@gmail.com', 123123456, 0, 'Emiliana Giselle - 325555552020-.jpg', 261155555555, NULL, NULL, '$2b$10$nN6SlGBGT6RGi5W2VYf0Fuwf6jt02ZLCvBjsYglSnLTRPQGa2BHuK', NULL, NULL, 'Paso de los Andes 1234 Ciuadad Mendoza'),
(29, 'Pedro', 'Ortiz', 'pedroortiz@gmail.com', 32123124, 0, 'Pedro - 321231232020-.jpg', 155123123, NULL, NULL, '$2b$10$96N0GlZqRqnQn/guEFOVtul0N4g6YFkHSPJa15REb3nmy20/t4Y3W', NULL, NULL, 'Paso de los Andes 1234 Ciuadad Mendoza');

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
-- Filtros para la tabla `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_carts_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `fk_cart_products_idCart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cart_products_idProducts` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
