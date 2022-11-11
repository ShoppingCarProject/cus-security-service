-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2022 a las 05:17:20
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shoppingcar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `idorders` int(11) NOT NULL,
  `user_iduser` int(11) NOT NULL,
  `idstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orderstatus`
--

CREATE TABLE `orderstatus` (
  `idstatus` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orderstatus`
--

INSERT INTO `orderstatus` (`idstatus`, `name`) VALUES
(1, 'COMPLETE'),
(2, 'IN PROCESS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productscar`
--

CREATE TABLE `productscar` (
  `idproductscar` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `category` varchar(45) NOT NULL,
  `idapi` int(11) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(800) NOT NULL,
  `image` varchar(200) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productscar`
--

INSERT INTO `productscar` (`idproductscar`, `title`, `category`, `idapi`, `price`, `description`, `image`, `iduser`) VALUES
(1, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'men\'s clothing', 0, 110, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 2),
(2, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'men\'s clothing', 0, 110, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 2),
(3, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'men\'s clothing', 1, 110, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 2),
(4, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'men\'s clothing', 1, 110, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 2),
(5, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'men\'s clothing', 1, 109.95, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 2),
(6, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'men\'s clothing', 1, 109.95, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 3),
(7, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'men\'s clothing', 1, 109.95, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 3),
(8, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'men\'s clothing', 1, 109.95, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 4),
(9, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'men\'s clothing', 1, 109.95, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 4),
(10, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'men\'s clothing', 1, 109.95, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 4),
(11, 'Mens Casual Premium Slim Fit T-Shirts ', 'men\'s clothing', 2, 22.3, 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.', 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg', 4),
(13, 'Solid Gold Petite Micropave ', 'jewelery', 6, 168, 'Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.', 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shoppingdetail`
--

CREATE TABLE `shoppingdetail` (
  `iddetail` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `price` varchar(45) NOT NULL,
  `idorders` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user` varchar(45) NOT NULL,
  `password` varchar(600) NOT NULL,
  `identification` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `name`, `user`, `password`, `identification`, `address`, `created`) VALUES
(1, 'douglas', 'sasasasas', '$2a$10$h99Kh.9EBpG8RvO1Dhc6rOJ4p5Odqe.IgXiQVTU9OSZUii1JE2T52', '000002-2', 'lourdes', '2022-11-10'),
(2, 'douglas', 'douglas22', '$2a$10$BonMfN.Ok9oQPztqegx0oe4A.Ss/wZConuKLAPXdqVELy9v5V1e4S', '000002-2', 'lourdes', '2022-11-10'),
(3, 'douglas', 'douglas3', '$2a$10$cOQq7hBvPss4HAPZEFKvZug5VcYWVb2AdhTKMU9b.jE4nP1Kjsd7y', '000002-2', 'lourdes', '2022-11-10'),
(4, 'douglas', 'douglas4', '$2a$10$cbFRlYgi3OtuR0ldDUemSOJ3ulspul61kTauJheKbP.oTatJ6iAta', '000002-2', 'lourdes', '2022-11-10'),
(5, 'douglas', 'douglas6', '$2a$10$r3TN2.vJ0teRF398GbE3xuaoku4si2u4sv8TNUyt92v0dvdWPuAQ.', '000002-2', 'lourdes', '2022-11-10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idorders`),
  ADD KEY `fk_orders_user1_idx` (`user_iduser`),
  ADD KEY `fk_orders_orderstatus1_idx` (`idstatus`);

--
-- Indices de la tabla `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`idstatus`);

--
-- Indices de la tabla `productscar`
--
ALTER TABLE `productscar`
  ADD PRIMARY KEY (`idproductscar`),
  ADD KEY `fk_productscar_user_idx` (`iduser`);

--
-- Indices de la tabla `shoppingdetail`
--
ALTER TABLE `shoppingdetail`
  ADD PRIMARY KEY (`iddetail`),
  ADD KEY `fk_shoppingdetail_orders1_idx` (`idorders`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `idorders` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `idstatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productscar`
--
ALTER TABLE `productscar`
  MODIFY `idproductscar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `shoppingdetail`
--
ALTER TABLE `shoppingdetail`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_orderstatus1` FOREIGN KEY (`idstatus`) REFERENCES `orderstatus` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productscar`
--
ALTER TABLE `productscar`
  ADD CONSTRAINT `fk_productscar_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `shoppingdetail`
--
ALTER TABLE `shoppingdetail`
  ADD CONSTRAINT `fk_shoppingdetail_orders1` FOREIGN KEY (`idorders`) REFERENCES `orders` (`idorders`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
