-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 19-04-2023 a las 18:58:27
-- Versión del servidor: 8.0.32-0ubuntu0.22.04.2
-- Versión de PHP: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ResOdi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Administradores`
--

CREATE TABLE `Administradores` (
  `Usuario` varchar(50) NOT NULL,
  `Contraseña` varchar(30) NOT NULL,
  `NIF` varchar(9) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Apellidos` varchar(40) NOT NULL,
  `Telefono` varchar(9) NOT NULL,
  `Direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Administradores`
--

INSERT INTO `Administradores` (`Usuario`, `Contraseña`, `NIF`, `Nombre`, `Apellidos`, `Telefono`, `Direccion`) VALUES
('Alejandro_Robles@res.odisea.org', 'ar03052023', '58578286T', 'Alejandro', 'Robles Correa', '692211271', 'C// Calvo Sotelo 9 BajoD 28931 Mostoles Madrid'),
('Carlos_Gutierrez@res.odisea.org', 'cg03052023', '97453211A', 'Carlos', 'Gutierrez Benjarano', '717893004', 'C// Pelayo 1 1ºC 28004 Madrid'),
('Desire_Sanchez00@res.odisea.org', 'ds03052023', '82176339F', 'Desire', 'Sanchez Rojo', '693475110', 'C// Apodaca 12 3ºA 28004 Madrid'),
('Jaime_Gonzalez00@res.odisea.org', 'jg03052023', '77496879N', 'Jaime', 'Gonzalez Martin', '692202122', 'C// Apodaca 12 3ºA 28004 Madrid'),
('Monica_Gomez@res.odisea.org', 'mg03052023', '81006728S', 'Monica', 'Gomez Moreno', '682718485', 'C// Rafael Canogar 6 3ºB 28521 Rivas-Vaciamadrid Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Alergenos`
--

CREATE TABLE `Alergenos` (
  `Codigo` varchar(2) NOT NULL,
  `Nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Alergenos`
--

INSERT INTO `Alergenos` (`Codigo`, `Nombre`) VALUES
('A0', 'Apio'),
('A1', 'Altramuces'),
('F0', 'Frutos Secos'),
('G0', 'Gluten'),
('H0', 'Huevo'),
('L0', 'Lactosa'),
('M0', 'Marisco'),
('M1', 'Mostaza'),
('P0', 'Pescado'),
('S0', 'Soja'),
('S1', 'Sésamo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Incidencias`
--

CREATE TABLE `Incidencias` (
  `Codigo` varchar(5) NOT NULL,
  `Descripcion` varchar(75) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Solucion` date DEFAULT NULL,
  `Usuario_Admin` varchar(50) NOT NULL,
  `Usuario_Usu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Incidencias`
--

INSERT INTO `Incidencias` (`Codigo`, `Descripcion`, `Fecha_Inicio`, `Fecha_Solucion`, `Usuario_Admin`, `Usuario_Usu`) VALUES
('IC001', 'No se ha entregado todo lo figurado en el pedido.', '2023-05-05', '2023-05-05', 'Monica_Gomez@res.odisea.org', 'NurseyBoy00@gmail.es'),
('IC002', 'El pedido llegó con retraso debido a la avería del vehículo del repartidor.', '2023-05-06', NULL, 'Carlos_Gutierrez@res.odisea.org', 'LuisFDZ@hotmail.com'),
('IC003', 'A la hora de pagar en efectivo, la tarjeta no funcionaba correctamente.', '2023-05-06', '2023-05-06', 'Desire_Sanchez00@res.odisea.org', 'HelloKitty88@outlook.es'),
('IC004', 'Retraso en la entrega del pedido por desorientación del repartidor.', '2023-05-06', '2023-05-06', 'Alejandro_Robles@res.odisea.org', 'Jameslebron22@outlook.com'),
('IC005', 'El cliente introdujo la dirección erróneamente.', '2023-05-07', NULL, 'Carlos_Gutierrez@res.odisea.org', 'HelloKitty88@outlook.es'),
('IC006', 'Problemas en la cocina con uno de los fuegos, se retrasó un pedido', '2023-05-07', '2023-05-08', 'Monica_Gomez@res.odisea.org', 'Musicoffskin12@outlook.es'),
('IC007', 'Por indisponibilidad de un empleado, se ha cancelado un pedido', '2023-05-08', NULL, 'Desire_Sanchez00@res.odisea.org', 'Twomad360@outlook.es'),
('IC008', 'Unido a la incidencia 9, se han intercambiado pedidos inintencionadamente.', '2023-05-09', NULL, 'Alejandro_Robles@res.odisea.org', 'Carmengonz@gmail.es'),
('IC009', 'Unido a la incidencia 8, se han intercambiado pedidos inintencionadamente.', '2023-05-09', NULL, 'Alejandro_Robles@res.odisea.org', 'Elaine98@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedidos`
--

CREATE TABLE `Pedidos` (
  `Codigo` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Precio_Total` decimal(10,2) NOT NULL,
  `Usuario_Usu` varchar(50) NOT NULL,
  `Direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Mensaje` varchar(175) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Pedidos`
--

INSERT INTO `Pedidos` (`Codigo`, `Precio_Total`, `Usuario_Usu`, `Direccion`, `Mensaje`) VALUES
('PD-01AA', '38.50', 'Musicoffskin12@outlook.es', 'C// Barrafon 29 2ºA 28011 Madrid', NULL),
('PD-02AA', '31.70', 'Jameslebron22@outlook.com', 'C// Bilbao 15 28223 Pozuelo de Alarcon Madrid', NULL),
('PD-03AA', '54.38', 'Carmengonz@gmail.es', 'C// La huerta 5 28850 Torrejon de Ardoz Madrid', NULL),
('PD-04AA', '36.81', 'NurseyBoy00@gmail.es', 'C// Sierra 80 BajoC 28038 Madrid', NULL),
('PD-05AA', '20.00', 'Twomad360@outlook.es', 'C// Viloria de la Rioja 21 3ºB 28050 Madrid', 'Si no respondo al telefonillo llame al teléfono, a veces no funciona bien.'),
('PD-06AA', '25.43', 'LuisFDZ@hotmail.com', 'Av. de Europa 8 28224 Pozuelo de Alarcon Madrid', 'Diga en recepción que trae un pedido a nombre de Luis Fernandez.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ped_Plato`
--

CREATE TABLE `Ped_Plato` (
  `Codigo_ped` varchar(7) NOT NULL,
  `Codigo_plat` varchar(7) NOT NULL,
  `Unidades` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Ped_Plato`
--

INSERT INTO `Ped_Plato` (`Codigo_ped`, `Codigo_plat`, `Unidades`) VALUES
('PD-01AA', 'BB-01AA', 1),
('PD-01AA', 'BB-02AA', 1),
('PD-01AA', 'PT-10AA', 1),
('PD-01AA', 'PT-15AA', 1),
('PD-01AA', 'PT-24AA', 1),
('PD-02AA', 'BB-09AA', 1),
('PD-02AA', 'PT-08AA', 1),
('PD-02AA', 'PT-20AA', 1),
('PD-03AA', 'BB-03AA', 1),
('PD-03AA', 'BB-08AA', 2),
('PD-03AA', 'PT-07AA', 1),
('PD-03AA', 'PT-16AA', 1),
('PD-03AA', 'PT-22AA', 2),
('PD-03AA', 'PT-26AA', 1),
('PD-04AA', 'BB-14AA', 2),
('PD-04AA', 'PT-14AA', 1),
('PD-04AA', 'PT-21AA', 1),
('PD-05AA', 'BB-01AA', 1),
('PD-05AA', 'PT-11AA', 1),
('PD-06AA', 'BB-09AA', 1),
('PD-06AA', 'PT-09AA', 1),
('PD-06AA', 'PT-14AA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ped_Prom`
--

CREATE TABLE `Ped_Prom` (
  `Codigo_ped` varchar(7) NOT NULL,
  `Codigo_prom` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Ped_Prom`
--

INSERT INTO `Ped_Prom` (`Codigo_ped`, `Codigo_prom`) VALUES
('PD-03AA', 'PR-01AA'),
('PD-04AA', 'PR-02AA'),
('PD-06AA', 'PR-05AA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Plato`
--

CREATE TABLE `Plato` (
  `Codigo` varchar(7) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Codigo_tipo` varchar(3) NOT NULL,
  `Precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Plato`
--

INSERT INTO `Plato` (`Codigo`, `Nombre`, `Codigo_tipo`, `Precio`) VALUES
('BB-01AA', 'Agua grande', 'BBD', '3.00'),
('BB-02AA', 'Coca-cola', 'BBD', '3.50'),
('BB-03AA', 'Nestea', 'BBD', '3.50'),
('BB-04AA', 'Fanta limon', 'BBD', '3.50'),
('BB-05AA', 'Fanta naranja', 'BBD', '3.50'),
('BB-06AA', 'Coca-cola Zero', 'BBD', '3.50'),
('BB-07AA', 'Coca-cola Light', 'BBD', '3.50'),
('BB-08AA', 'Est.Galicia', 'ALC', '5.00'),
('BB-09AA', 'Retsina', 'ALC', '10.00'),
('BB-10AA', 'Sprite', 'BBD', '3.50'),
('BB-11AA', 'Gaseosa', 'BBD', '3.50'),
('BB-12AA', 'Aquarius', 'BBD', '3.50'),
('BB-13AA', 'Vino Tinto', 'ALC', '5.00'),
('BB-14AA', 'Agua peque', 'BBD', '1.50'),
('PT-01AA', 'Horiatiki', 'ENS', '10.50'),
('PT-02AA', 'Spanakopita', 'ENT', '8.40'),
('PT-03AA', 'Dolmadakia', 'ENT', '8.70'),
('PT-04AA', 'Tzatziki', 'ENT', '5.00'),
('PT-05AA', 'Musaka', 'PAS', '14.75'),
('PT-06AA', 'Souvlaki', 'CRN', '13.20'),
('PT-07AA', 'Gyros', 'SND', '11.70'),
('PT-08AA', 'Baklava', 'PST', '7.00'),
('PT-09AA', 'Loukoumades', 'PST', '5.00'),
('PT-10AA', 'Griega', 'ENS', '10.20'),
('PT-11AA', 'Mykonos', 'ENS', '12.50'),
('PT-12AA', 'Chipriota', 'ENS', '11.30'),
('PT-13AA', 'Dakos', 'ENS', '10.00'),
('PT-14AA', 'Entrecot', 'CRN', '18.90'),
('PT-15AA', 'Burger griega', 'CRN', '13.40'),
('PT-16AA', 'Bifteki', 'CRN', '13.90'),
('PT-17AA', 'Paidakia ', 'CRN', '16.50'),
('PT-18AA', 'Kritharaki', 'MSC', '14.70'),
('PT-19AA', 'Mikrolimano', 'MSC', '15.00'),
('PT-20AA', 'Salonika', 'PSC', '14.70'),
('PT-21AA', 'Pulpo', 'MSC', '19.00'),
('PT-22AA', 'Menu Infantil', 'OTR', '13.00'),
('PT-23AA', 'Melitzanosalata', 'ENT', '5.90'),
('PT-24AA', 'Tiri saganaki', 'ENT', '8.40'),
('PT-25AA', 'Tiropita', 'PAS', '7.40'),
('PT-26AA', 'Sapanakopita', 'PAS', '7.40'),
('PT-27AA', 'Keftedakia', 'ENT', '8.50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Plat_Alerg`
--

CREATE TABLE `Plat_Alerg` (
  `Codigo_alerg` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Codigo_plat` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Plat_Alerg`
--

INSERT INTO `Plat_Alerg` (`Codigo_alerg`, `Codigo_plat`) VALUES
('H0', 'PT-01AA'),
('L0', 'PT-01AA'),
('G0', 'PT-02AA'),
('F0', 'PT-02AA'),
('L0', 'PT-02AA'),
('H0', 'PT-02AA'),
('L0', 'PT-04AA'),
('L0', 'PT-05AA'),
('G0', 'PT-07AA'),
('F0', 'PT-07AA'),
('L0', 'PT-07AA'),
('G0', 'PT-08AA'),
('F0', 'PT-08AA'),
('L0', 'PT-08AA'),
('G0', 'PT-09AA'),
('F0', 'PT-09AA'),
('L0', 'PT-10AA'),
('M0', 'PT-11AA'),
('P0', 'PT-11AA'),
('L0', 'PT-12AA'),
('G0', 'PT-12AA'),
('G0', 'PT-13AA'),
('L0', 'PT-13AA'),
('L0', 'PT-14AA'),
('L0', 'PT-15AA'),
('L0', 'PT-16AA'),
('L0', 'PT-17AA'),
('G0', 'PT-18AA'),
('L0', 'PT-18AA'),
('M0', 'PT-18AA'),
('L0', 'PT-19AA'),
('M0', 'PT-19AA'),
('P0', 'PT-20AA'),
('M0', 'PT-21AA'),
('S1', 'PT-21AA'),
('G0', 'PT-22AA'),
('L0', 'PT-22AA'),
('L0', 'PT-24AA'),
('L0', 'PT-25AA'),
('G0', 'PT-25AA'),
('L0', 'PT-26AA'),
('G0', 'PT-26AA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Promociones`
--

CREATE TABLE `Promociones` (
  `Codigo` varchar(7) NOT NULL,
  `Porcentaje` int NOT NULL,
  `Descripcion` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Promociones`
--

INSERT INTO `Promociones` (`Codigo`, `Porcentaje`, `Descripcion`) VALUES
('PR-01AA', 25, 'Ahorro del 25% si es tu primer pedido y supera los 50€'),
('PR-02AA', 10, 'Si es tu pedido número 3, se te descontará un 10%'),
('PR-03AA', 10, 'Un descuento del 10% cuando llegues a tu pedido número 8'),
('PR-04AA', 15, 'Un descuento del 15% al llegar al pedido número 10'),
('PR-05AA', 25, 'Al llegar a los 15 pedidos el descuento será del 25%'),
('PR-06AA', 50, 'Al llegar al pedido numero veinte, el descuento es del 50%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reservas`
--

CREATE TABLE `Reservas` (
  `Usuario_Usu` varchar(50) NOT NULL,
  `Fecha_hora` datetime NOT NULL,
  `Mesa` varchar(2) NOT NULL,
  `Num_Comensales` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Reservas`
--

INSERT INTO `Reservas` (`Usuario_Usu`, `Fecha_hora`, `Mesa`, `Num_Comensales`) VALUES
('Carmengonz@gmail.es', '2023-05-09 15:00:00', '02', 5),
('Jameslebron22@outlook.com', '2023-05-07 20:15:00', '10', 5),
('LuisFDZ@hotmail.com', '2023-05-05 14:00:00', '07', 7),
('NurseyBoy00@gmail.es', '2023-05-08 21:30:00', '06', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipos de platos`
--

CREATE TABLE `Tipos de platos` (
  `Codigo` varchar(3) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Descripcion` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Tipos de platos`
--

INSERT INTO `Tipos de platos` (`Codigo`, `Nombre`, `Descripcion`) VALUES
('ALC', 'Alcohol', 'Bebidas alcoholicas'),
('BBD', 'Bebidas', 'Bebidas no alcholicas'),
('CRN', 'Carnes', 'Platos cuyo protagonista principal es la carne'),
('ENS', 'Ensaladas', 'Ensaladas de todo tipo'),
('ENT', 'Entrantes', 'Platos para abrir la mesa'),
('MSC', 'Mariscos', 'Platos cuyo protagonista principal es algun tipo de mariscos o crustaceos'),
('OTR', 'Otros', 'Menus infantiles, platos especiales, etc'),
('PAS', 'Pastas', 'Platos cuyo protagonista principal es algún tipo de pasta'),
('PSC', 'Pescados', 'Platos cuyo protagonista principal es algun tipo de pescado'),
('PST', 'Postres', 'Postres de todo tipo'),
('SND', 'Sandwiches', 'Tipos de platos envueltos o recogidos en pan o cualquier derivado del trigo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `Usuario` varchar(50) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Apellidos` varchar(40) NOT NULL,
  `Telefono` varchar(9) NOT NULL,
  `Direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`Usuario`, `Password`, `Nombre`, `Apellidos`, `Telefono`, `Direccion`) VALUES
('Carmengonz@gmail.es', 'franymarcos00y05', 'Carmen', 'Ruiz Castillo', '729030302', 'C// La huerta 5 28850 Torrejon de Ardoz Madrid'),
('DeathSlayer@gmail.com', '123PedroPascalLOVE', 'Maria Teresa', 'Gutierrez Hidalgo', '648194032', 'C// Laguna 23 1ºD 28047 Madrid'),
('Elaine98@hotmail.com', 'elenisQuinn773', 'Elena', 'García Torres', '692734011', 'C// Oviedo 24 5ºF 28934 Mostoles Madrid'),
('HelloKitty88@outlook.es', '11jenlo23', 'Evelyn', 'Cortes Quesada', '683942018', 'C// Regil 32 BajoA 28041 Madrid'),
('Jameslebron22@outlook.com', '93MJking95', 'Ruben', 'Lopez Navarro', '694027481', 'C// Bilbao 15 28223 Pozuelo de Alarcon Madrid'),
('LuisFDZ@hotmail.com', 'aj23eq2e3oo3p68d', 'Luis', 'Fernandez Pacheco', '713749010', 'C// Salsipuedes 9 2ºC 28021 Madrid'),
('Musicoffskin12@outlook.es', '19kk94', 'Roberto', 'Mata del Campo', '691020394', 'C// Barrafon 29 2ºA 28011 Madrid'),
('NurseyBoy00@gmail.es', 'ui1jrew131hg', 'Marcos', 'FIsher del Rio', '629310375', 'C// Sierra 80 BajoC 28038 Madrid'),
('Raul.pichichi@gmail.com', '14halaMadrid14', 'Raul', 'Turnagiu', '619030475', 'C// Pozano 11 BajoD 28010 Madrid'),
('Twomad360@outlook.es', 'OWmama2834', 'Alex', 'Morgan', '639102034', 'C// Viloria de la Rioja 21 3ºB 28050 Madrid');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Administradores`
--
ALTER TABLE `Administradores`
  ADD PRIMARY KEY (`Usuario`),
  ADD KEY `Usuario` (`Usuario`);

--
-- Indices de la tabla `Alergenos`
--
ALTER TABLE `Alergenos`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `Incidencias`
--
ALTER TABLE `Incidencias`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `Usuario_Admin` (`Usuario_Admin`,`Usuario_Usu`),
  ADD KEY `Usuario_Usu` (`Usuario_Usu`);

--
-- Indices de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `UsuPed` (`Usuario_Usu`);

--
-- Indices de la tabla `Ped_Plato`
--
ALTER TABLE `Ped_Plato`
  ADD PRIMARY KEY (`Codigo_ped`,`Codigo_plat`),
  ADD KEY `PlatPed` (`Codigo_plat`);

--
-- Indices de la tabla `Ped_Prom`
--
ALTER TABLE `Ped_Prom`
  ADD PRIMARY KEY (`Codigo_ped`,`Codigo_prom`),
  ADD KEY `PromPed` (`Codigo_prom`);

--
-- Indices de la tabla `Plato`
--
ALTER TABLE `Plato`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `PlaTipo` (`Codigo_tipo`);

--
-- Indices de la tabla `Plat_Alerg`
--
ALTER TABLE `Plat_Alerg`
  ADD KEY `PlatAlerg` (`Codigo_plat`),
  ADD KEY `AlergPlat` (`Codigo_alerg`);

--
-- Indices de la tabla `Promociones`
--
ALTER TABLE `Promociones`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `Reservas`
--
ALTER TABLE `Reservas`
  ADD PRIMARY KEY (`Usuario_Usu`,`Fecha_hora`);

--
-- Indices de la tabla `Tipos de platos`
--
ALTER TABLE `Tipos de platos`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`Usuario`),
  ADD KEY `Usuario` (`Usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Incidencias`
--
ALTER TABLE `Incidencias`
  ADD CONSTRAINT `AdminInci` FOREIGN KEY (`Usuario_Admin`) REFERENCES `Administradores` (`Usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `UsuInci` FOREIGN KEY (`Usuario_Usu`) REFERENCES `Usuarios` (`Usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD CONSTRAINT `UsuPed` FOREIGN KEY (`Usuario_Usu`) REFERENCES `Usuarios` (`Usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Ped_Plato`
--
ALTER TABLE `Ped_Plato`
  ADD CONSTRAINT `PedPlat` FOREIGN KEY (`Codigo_ped`) REFERENCES `Pedidos` (`Codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `PlatPed` FOREIGN KEY (`Codigo_plat`) REFERENCES `Plato` (`Codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Ped_Prom`
--
ALTER TABLE `Ped_Prom`
  ADD CONSTRAINT `PedProm` FOREIGN KEY (`Codigo_ped`) REFERENCES `Pedidos` (`Codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `PromPed` FOREIGN KEY (`Codigo_prom`) REFERENCES `Promociones` (`Codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Plato`
--
ALTER TABLE `Plato`
  ADD CONSTRAINT `PlaTipo` FOREIGN KEY (`Codigo_tipo`) REFERENCES `Tipos de platos` (`Codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Plat_Alerg`
--
ALTER TABLE `Plat_Alerg`
  ADD CONSTRAINT `AlergPlat` FOREIGN KEY (`Codigo_alerg`) REFERENCES `Alergenos` (`Codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `PlatAlerg` FOREIGN KEY (`Codigo_plat`) REFERENCES `Plato` (`Codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Reservas`
--
ALTER TABLE `Reservas`
  ADD CONSTRAINT `UsuRes` FOREIGN KEY (`Usuario_Usu`) REFERENCES `Usuarios` (`Usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
