-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25-Jan-2019 às 12:46
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aulas`
--

CREATE TABLE `aulas` (
  `cod_aula` int(11) NOT NULL,
  `nome_aula` varchar(50) NOT NULL,
  `numero_vagas` varchar(30) NOT NULL,
  `data_aula` bigint(20) NOT NULL,
  `url` varchar(258) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aulas`
--

INSERT INTO `aulas` (`cod_aula`, `nome_aula`, `numero_vagas`, `data_aula`, `url`) VALUES
(3, 'Hit12345', '20', 1548089403767, 'http://www.thegoodbook.co.uk/downloads/training-barbell.jpg'),
(4, 'BodyCombat234', '20', 1548089403767, 'http://www.resolvefitness.com.au/wp-content/uploads/2013/08/body-combat.jpg'),
(5, 'RPM', '20', 1548089403767, 'http://www.llandarcyacademy.com/files/class-rpm-w1200.jpg'),
(6, 'Power Jump', '20', 1548089403767, 'http://www.indicegym.pt/wordpress/wp-content/uploads/2016/09/Jump2-650x365.png'),
(7, 'Body Pump', '20', 1548089403767, 'http://arcunion.org.uk/wp-content/uploads/2016/09/bodypump.jpg'),
(8, 'G.A.P', '20', 1548089403767, 'http://revistahigh.com.ar/wp-content/uploads/2018/04/gap.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `feed`
--

CREATE TABLE `feed` (
  `id_feed` int(11) NOT NULL,
  `cod_utilizador` int(11) NOT NULL,
  `text` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `feed`
--

INSERT INTO `feed` (`id_feed`, `cod_utilizador`, `text`) VALUES
(1, 4, 'olá cesar'),
(2, 3, 'está tudo bem?'),
(3, 2, 'Como é que é ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

CREATE TABLE `utilizador` (
  `cod_utilizador` int(11) NOT NULL,
  `nome_utilizador` varchar(50) NOT NULL,
  `email_utilizador` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `token` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `utilizador`
--

INSERT INTO `utilizador` (`cod_utilizador`, `nome_utilizador`, `email_utilizador`, `password`, `token`) VALUES
(2, 'pedro', 'pedro.dionisio@hotmial.com', '1234556', 'f28beb5e41b6fa7e45ef023af15ca83180f0cd2a65cf2235ccdf030875e110c132cf079833ab77afb2d2014272ce780088be21e7121989ae56cfc00e4df79ad0'),
(3, 'edgar', 'edgar.cavalinhos@hotmail.com', 'edgarcavalinhos', '31852861de60af893c11153b3b62c1453fa67abbaef28a78e5f5736f963b4ef1e6ff69d69801281160ec157955599f0f215146f5d971af11d805419378ddca0d'),
(4, 'cesar', 'cesar.cosme@hotmail.com', 'cesarcosme123', 'd8c776881339de9b87d01282aa666506bc27283c78991c7538d810eda3bc086012f941cd03f83199971bd49fb52364260ef9258d96082a79146b5e582eebb016'),
(18, 'teste', 'teste', 'teste', 'ea9be29b35ac428b6863ee5cd998f11cb9fe8cd43d1b8815e78855a31e931368139186ebe5bb49f505ccbc76c317f49c3facec72c01922adeeca036d821945b2'),
(19, 'teste5', 'teste5', 'teste5', '5d09b9d204071fc5609bd68cf3e11c03e5c65e5900d4ae16cd8005d04aa689037176bd29a6b1d4ad56360bee632ad820c4f968c7ee09bcc724824c6518021329'),
(20, 'pedro', 'pedro@hotmail.com', '123456789', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador_aulas`
--

CREATE TABLE `utilizador_aulas` (
  `cod_utilizador` int(11) NOT NULL,
  `cod_aula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `utilizador_aulas`
--

INSERT INTO `utilizador_aulas` (`cod_utilizador`, `cod_aula`) VALUES
(2, 3),
(3, 7),
(4, 4),
(18, 3),
(18, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`cod_aula`);

--
-- Indexes for table `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`id_feed`),
  ADD KEY `cod_utilizador` (`cod_utilizador`);

--
-- Indexes for table `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`cod_utilizador`);

--
-- Indexes for table `utilizador_aulas`
--
ALTER TABLE `utilizador_aulas`
  ADD PRIMARY KEY (`cod_utilizador`,`cod_aula`),
  ADD KEY `cod_aula` (`cod_aula`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aulas`
--
ALTER TABLE `aulas`
  MODIFY `cod_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feed`
--
ALTER TABLE `feed`
  MODIFY `id_feed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `utilizador`
--
ALTER TABLE `utilizador`
  MODIFY `cod_utilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `feed`
--
ALTER TABLE `feed`
  ADD CONSTRAINT `feed_ibfk_1` FOREIGN KEY (`cod_utilizador`) REFERENCES `utilizador` (`cod_utilizador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `utilizador_aulas`
--
ALTER TABLE `utilizador_aulas`
  ADD CONSTRAINT `utilizador_aulas_ibfk_1` FOREIGN KEY (`cod_utilizador`) REFERENCES `utilizador` (`cod_utilizador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utilizador_aulas_ibfk_2` FOREIGN KEY (`cod_aula`) REFERENCES `aulas` (`cod_aula`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
