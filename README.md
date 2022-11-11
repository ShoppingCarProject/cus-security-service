# cus-security-service
![JSON COLLECTION](https://github.com/ShoppingCarProject/cus-shopping-car-service/blob/develop/src/main/resources/cus-collection.postman_collection.json)
## how to start de project: 
>Download repository

`git clone https://github.com/ShoppingCarProject/cus-security-service.git `

> Open with your IDE ( I Worked the project with Spring tool suite)

`Instal XAMP or client for MySql en start a server OR use docker container and expose de port`
>if you want to use docker

 `docker pull redis`
 `docker -name redis-container redis -p 6379:6379`
> Search the apllication.properties file in the spring boot project o modify yout configuration of MySql and redis
> we only need de conection, becouse the framework is going to generate the database with the project cus-shopping-car-service

```
jwt.secret=d0ugl4s
server.port=7000
#mysql
spring.datasource.url=jdbc:mysql://{YourHost}:{YourPort}/shoppingcar?createDatabaseIfNotExist=true&autoReconnect=true&useSSL=false
spring.datasource.username={Your UserName}
spring.datasource.password={Your Password}
spring.datasource.platform=mysql

#redis
spring.redis.database=3
spring.redis.host={YourHost}
spring.redis.port={Your PORT}
spring.redis.password={Your password}
spring.redis.ttl=60
#sql validatio
spring.datasource.dbcp2.validation-query=select 1 from dual
#Configuracion de log
logging.pattern.console=%d{yyyy-MM-dd HH:mm:ss} %-5level %logger{36} - %msg%n
logging.level.org.hibernate.SQL=WARN
logging.level.root=INFO
``` 
> run your project if you hava a conetion with redis and Mysql, the projects works

> THE PROJECT  cus-shopping-car-service GOING TO GENERATE THE DATABASE

## Dependencys: 
 - Redis
 - MySql

> With this microservice we are going to generate token to do autentications
> is importan to have a database on the project, the data base is on the proyect, shoppingcar.sql

[I'm shoppingcar.sql](https://github.com/ShoppingCarProject/cus-security-service/blob/main/shoppingcar.sql)
## Endpoints examples: 
Login of the application:
```
curl --location --request POST 'http://localhost:7000/login/authenticate' \
--header 'Content-Type: application/json' \
--data-raw '{"username":"douglas4", "password":"douglas"}'
```

Register a new user:
```
curl --location --request POST 'Localhost:7000/login/register' \
--header 'Content-Type: application/json' \
--data-raw '{"username":"douglas4", "password":"douglas" , "name": "douglas" ,"identification":"000002-2"  , "adress": "lourdes"}'
```
When token is valid we are going to continue, in other cases the user is no autorize
```
curl --location --request POST 'localhost:7000/auth/validate' \
--header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkb3VnbGFzNCIsImV4cCI6MTY2ODE0OTM3NywiaWF0IjoxNjY4MTMxMzc3fQ.3M9TDknSwa5_OFmGbcSDs7J0EYbjAWoy9d3u9qYLvCCfUPpxYg_KwNjGp-8d3FoNcV_jqVzNhWaJoblPtNQpKw'
```

# If you have a problem with the database 

```

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2022 a las 22:44:24
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
  `idstatus` int(11) NOT NULL,
  `user_iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`idorders`, `idstatus`, `user_iduser`) VALUES
(1, 1, 3),
(5, 2, 3),
(6, 1, 3);

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
(2, 'IN PROCESS'),
(3, 'CANCELED');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productscar`
--

CREATE TABLE `productscar` (
  `idproductscar` int(11) NOT NULL,
  `category` varchar(45) NOT NULL,
  `description` varchar(800) NOT NULL,
  `idapi` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `title` varchar(200) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shoppingdetail`
--

CREATE TABLE `shoppingdetail` (
  `iddetail` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `paid` bit(1) NOT NULL,
  `price` double NOT NULL,
  `productid` int(11) NOT NULL,
  `title` varchar(400) NOT NULL,
  `idorders` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shoppingdetail`
--

INSERT INTO `shoppingdetail` (`iddetail`, `image`, `paid`, `price`, `productid`, `title`, `idorders`) VALUES
(1, 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg', b'1', 15.99, 4, 'Mens Casual Slim Fit', 1),
(2, 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg', b'1', 15.99, 4, 'Mens Casual Slim Fit', 1),
(3, 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg', b'1', 22.3, 2, 'Mens Casual Premium Slim Fit T-Shirts ', 1),
(4, 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg', b'1', 695, 5, 'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet', 1),
(8, 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg', b'1', 168, 6, 'Solid Gold Petite Micropave ', 5),
(9, 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg', b'1', 168, 6, 'Solid Gold Petite Micropave ', 5),
(10, 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg', b'1', 168, 6, 'Solid Gold Petite Micropave ', 6),
(11, 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg', b'1', 168, 6, 'Solid Gold Petite Micropave ', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `created` date NOT NULL,
  `identification` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(600) NOT NULL,
  `user` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `address`, `created`, `identification`, `name`, `password`, `user`) VALUES
(1, 'La Libertad, Colon.', '2022-11-10', '000002-2', 'Douglas Isaias Valle Ortiz', '$2a$10$I7iEVeb18YE3/g0GFQZPlOd0v9jmTFDBHaF/j.QEPxFIZlqsZZWdS', 'admin'),
(2, 'La Libertad, Colon.', '2022-11-11', '000002-2', 'Douglas Isaias Valle Ortiz', '$2a$10$aijnmTWOQz1WdOAdTfdTHukWuiGLcQjdDi6Pkvx/0RbnvG7Ct8QtO', 'admin2'),
(3, 'La Libertad, Colon.', '2022-11-11', '000002-2', 'Douglas Isaias Valle Ortiz', '$2a$10$FTK4SJKli81BhlFkt8RcV.H3rWh3WxBtGji4zoQ4MypZb4In8ya3C', 'admin4');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idorders`),
  ADD KEY `FK1domqf02i6ifbtoie3np0kaqs` (`idstatus`),
  ADD KEY `FKr3h12vja8i73su0nt6ywukvs1` (`user_iduser`);

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
  ADD KEY `FKcyboumlk9hgrew6h8ppaqs49g` (`iduser`);

--
-- Indices de la tabla `shoppingdetail`
--
ALTER TABLE `shoppingdetail`
  ADD PRIMARY KEY (`iddetail`),
  ADD KEY `FKoofb3r01rlc0k44axf2i92uqj` (`idorders`);

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
  MODIFY `idorders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `idstatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productscar`
--
ALTER TABLE `productscar`
  MODIFY `idproductscar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `shoppingdetail`
--
ALTER TABLE `shoppingdetail`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK1domqf02i6ifbtoie3np0kaqs` FOREIGN KEY (`idstatus`) REFERENCES `orderstatus` (`idstatus`),
  ADD CONSTRAINT `FKr3h12vja8i73su0nt6ywukvs1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`);

--
-- Filtros para la tabla `productscar`
--
ALTER TABLE `productscar`
  ADD CONSTRAINT `FKcyboumlk9hgrew6h8ppaqs49g` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`);

--
-- Filtros para la tabla `shoppingdetail`
--
ALTER TABLE `shoppingdetail`
  ADD CONSTRAINT `FKoofb3r01rlc0k44axf2i92uqj` FOREIGN KEY (`idorders`) REFERENCES `orders` (`idorders`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

```
