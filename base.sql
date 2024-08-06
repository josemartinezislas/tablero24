-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-08-2024 a las 21:39:40
-- Versión del servidor: 10.6.18-MariaDB-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tablero24`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_fase`
--

CREATE TABLE `t_fase` (
  `id` int(11) NOT NULL,
  `fase_nom` varchar(500) NOT NULL,
  `id_fase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_general`
--

CREATE TABLE `t_general` (
  `id_proy` int(11) NOT NULL,
  `proy_nom` varchar(500) NOT NULL,
  `proy_sect` int(11) NOT NULL,
  `proy_tipo` int(11) NOT NULL,
  `proy_desc` varchar(500) NOT NULL,
  `proy_mpio` int(11) NOT NULL,
  `proy_inver` int(11) NOT NULL,
  `proy_e_dir` int(11) NOT NULL,
  `proy_e_ind` int(11) NOT NULL,
  `proy_fase` int(11) NOT NULL,
  `proy_estat` varchar(500) NOT NULL,
  `proy_seg` int(11) NOT NULL,
  `proy_stat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_general`
--

INSERT INTO `t_general` (`id_proy`, `proy_nom`, `proy_sect`, `proy_tipo`, `proy_desc`, `proy_mpio`, `proy_inver`, `proy_e_dir`, `proy_e_ind`, `proy_fase`, `proy_estat`, `proy_seg`, `proy_stat`) VALUES
(1, 'EMPRESA SQL', 2, 1, 'DESCRIPCION', 54, 34000000, 5, 100, 1, 'Estatus 14', 3, 1),
(2, 'Timejose  Ceramics', 4, 1, 'setas s a partir de la arcilla,', 21, 27000000, 1200, 2000, 2, 'Anunciada', 8, 1),
(3, 'TITÁN de Biopappel', 1, 2, 'Ampliación de la planta de papel para la fabricación de cajas de cartón.', 69, 1350000000, 350, 1050, 3, 'Anunciada', 8, 1),
(4, 'Torre Ag Air Life', 8, 1, 'Torre de 97 departamentos residenciales con zonas de amenidades.', 48, 363000000, 605, 300, 4, 'Anunciada', 8, 1),
(5, 'ISQUISA', 2, 1, 'Centro de distribución para productos químicos, de limpieza y agroindustriales.', 63, 250000000, 100, 300, 5, 'Anunciada', 8, 1),
(6, 'Nave Tepeji Actualizado', 2, 2, 'Nave industrial multimodal para arrendamiento', 63, 15000000, 100, 50, 6, 'Anunciada', 8, 1),
(7, 'EMPRESA empresa mas', 3, 2, 'Navemultimodal para arrendamiento', 63, 15000000, 100, 50, 6, 'Anunciada', 8, 1),
(8, 'nuevaEMPRESA', 5, 5, 'descripcion corta', 3, 5656666, 7, 33, 55, 'estado prosp', 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_municipios`
--

CREATE TABLE `t_municipios` (
  `id` int(11) NOT NULL,
  `mpio_nom` varchar(500) NOT NULL,
  `id_mpio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_sector`
--

CREATE TABLE `t_sector` (
  `id` int(11) NOT NULL,
  `sect_nom` varchar(500) NOT NULL,
  `id_sect` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_sector`
--

INSERT INTO `t_sector` (`id`, `sect_nom`, `id_sect`) VALUES
(1, 'Agro-químico', 3),
(2, 'Alimentos', 6),
(3, 'Automotriz', 7),
(4, 'Autopartes Fabricación de arneses automotrices.', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_users`
--

CREATE TABLE `t_users` (
  `id` int(11) NOT NULL,
  `user_nom` varchar(500) NOT NULL,
  `user_ape` varchar(500) NOT NULL,
  `user_car` varchar(500) NOT NULL,
  `user_dep` varchar(500) NOT NULL,
  `user_rol` int(11) NOT NULL,
  `user_usr` varchar(500) NOT NULL,
  `user_pas` varchar(500) NOT NULL,
  `user_img` varchar(500) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_fase`
--
ALTER TABLE `t_fase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1` (`id_fase`);

--
-- Indices de la tabla `t_general`
--
ALTER TABLE `t_general`
  ADD PRIMARY KEY (`id_proy`);

--
-- Indices de la tabla `t_municipios`
--
ALTER TABLE `t_municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1` (`id_mpio`);

--
-- Indices de la tabla `t_sector`
--
ALTER TABLE `t_sector`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1` (`id_sect`);

--
-- Indices de la tabla `t_users`
--
ALTER TABLE `t_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1` (`id_user`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_fase`
--
ALTER TABLE `t_fase`
  ADD CONSTRAINT `FK_3` FOREIGN KEY (`id_fase`) REFERENCES `t_general` (`id_proy`);

--
-- Filtros para la tabla `t_municipios`
--
ALTER TABLE `t_municipios`
  ADD CONSTRAINT `FK_2` FOREIGN KEY (`id_mpio`) REFERENCES `t_general` (`id_proy`);

--
-- Filtros para la tabla `t_sector`
--
ALTER TABLE `t_sector`
  ADD CONSTRAINT `FK_1` FOREIGN KEY (`id_sect`) REFERENCES `t_general` (`id_proy`);

--
-- Filtros para la tabla `t_users`
--
ALTER TABLE `t_users`
  ADD CONSTRAINT `FK_4` FOREIGN KEY (`id_user`) REFERENCES `t_general` (`id_proy`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
