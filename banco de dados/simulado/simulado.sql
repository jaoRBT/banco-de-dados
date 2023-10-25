-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Tempo de geração: 11/09/2023 às 23:12
-- Versão do servidor: 5.7.39
-- Versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `simulado`
--
CREATE DATABASE IF NOT EXISTS `simulado` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `simulado`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `animal`
--

INSERT INTO `animal` (`id`, `nome`, `tipo`, `id_cliente`) VALUES
(1, 'max', 'cachorro', 2),
(2, 'ariel', 'gato', 3),
(3, 'cacau', 'hamster', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `cpf`, `telefone`) VALUES
(1, 'Julian Rocha Ferreira', '53931796183', '1669317485'),
(2, 'Diego Araujo Gomes', '76374554167', '2425917050'),
(3, 'Tomás Silva Almeida', '97051845853', '14877707562');

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `id_veteriario` int(11) NOT NULL,
  `valor_total` float NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id`, `id_animal`, `id_veteriario`, `valor_total`, `data`, `hora`) VALUES
(7, 2, 3, 200, '2019-09-18', '18:54:09'),
(8, 3, 1, 400, '2019-03-13', '13:09:34'),
(9, 1, 2, 550, '2020-04-14', '10:48:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta_procedimento`
--

CREATE TABLE `consulta_procedimento` (
  `id` int(11) NOT NULL,
  `id_consulta` int(11) NOT NULL,
  `id_procedimento` int(11) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `consulta_procedimento`
--

INSERT INTO `consulta_procedimento` (`id`, `id_consulta`, `id_procedimento`, `valor`) VALUES
(1, 9, 3, 200),
(2, 9, 2, 350),
(3, 7, 2, 200),
(4, 8, 2, 200),
(5, 8, 1, 200);

-- --------------------------------------------------------

--
-- Estrutura para tabela `procedimento`
--

CREATE TABLE `procedimento` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `procedimento`
--

INSERT INTO `procedimento` (`id`, `nome`, `valor`) VALUES
(1, 'Exame de urina', 200),
(2, 'exame de fezes', 200),
(3, 'Ultrassonografia abdominal', 350);

-- --------------------------------------------------------

--
-- Estrutura para tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `data_entrada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `veterinario`
--

INSERT INTO `veterinario` (`id`, `nome`, `telefone`, `data_entrada`) VALUES
(1, 'Aline Ribeiro Melo', '6158883751', '2014-04-14'),
(2, 'Antônio Sousa Dias', '8563247626', '2016-01-08'),
(3, 'Arthur Correia Gomes', '1198645810', '2017-05-17');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`id_cliente`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`id_animal`),
  ADD KEY `fk5` (`id_veteriario`);

--
-- Índices de tabela `consulta_procedimento`
--
ALTER TABLE `consulta_procedimento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk3` (`id_consulta`),
  ADD KEY `fk4` (`id_procedimento`);

--
-- Índices de tabela `procedimento`
--
ALTER TABLE `procedimento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `consulta_procedimento`
--
ALTER TABLE `consulta_procedimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `procedimento`
--
ALTER TABLE `procedimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `fk5` FOREIGN KEY (`id_veteriario`) REFERENCES `veterinario` (`id`);

--
-- Restrições para tabelas `consulta_procedimento`
--
ALTER TABLE `consulta_procedimento`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id`),
  ADD CONSTRAINT `fk4` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimento` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
