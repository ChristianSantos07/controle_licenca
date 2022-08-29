-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Ago-2022 às 17:50
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `controle`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `licensa`
--

CREATE TABLE `licensa` (
  `id_licensa` int(11) NOT NULL,
  `chave` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(30) NOT NULL,
  `uso` int(11) NOT NULL,
  `tempo` int(11) NOT NULL,
  `maquina` varchar(20) NOT NULL,
  `data` datetime NOT NULL,
  `observacao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `licensa`
--

INSERT INTO `licensa` (`id_licensa`, `chave`, `nome`, `cpf`, `telefone`, `uso`, `tempo`, `maquina`, `data`, `observacao`) VALUES
(1, 102030, 'titi', '03564412026', '519997140450', 0, 1, 'servidor', '2022-08-27 06:29:50', 'uso de teste');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `licensa`
--
ALTER TABLE `licensa`
  ADD PRIMARY KEY (`id_licensa`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `licensa`
--
ALTER TABLE `licensa`
  MODIFY `id_licensa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
