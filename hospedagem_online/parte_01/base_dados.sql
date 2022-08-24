-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Ago-2022 às 13:27
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(255) DEFAULT NULL,
  `email_cliente` varchar(255) DEFAULT NULL,
  `telefone_cliente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome_cliente`, `email_cliente`, `telefone_cliente`) VALUES
(1, 'ETEC MCM', 'etec@email.com', '(11)4455-5533'),
(2, 'ETEC MAUA', 'etecmaua@email.com', '(11)6754-0989'),
(3, 'CPS', 'cps@email.com', '(11)9876-5432'),
(4, 'IBM', 'ibm@email.com', '(11)3456-8967');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome_usuario` varchar(255) DEFAULT NULL,
  `email_usuario` varchar(255) DEFAULT NULL,
  `senha_usuario` varchar(255) DEFAULT NULL,
  `tipo_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome_usuario`, `email_usuario`, `senha_usuario`, `tipo_usuario`) VALUES
(1, 'ADMINISTRADOR', 'adm@email.com', '1234', 1),
(2, 'ANDERSON VANIN', 'anderson@email.com', '1234', 2),
(3, 'FULANO DA SILVA', 'fulano@email.com', '1234', 2),
(4, 'ZEZINHO DA SILVA', 'zezinho@email.com', '1234', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_cliente`
--

CREATE TABLE `usuario_cliente` (
  `fk_usuarios_id` int(11) DEFAULT NULL,
  `fk_clientes_id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario_cliente`
--

INSERT INTO `usuario_cliente` (`fk_usuarios_id`, `fk_clientes_id_cliente`) VALUES
(2, 1),
(2, 4),
(3, 2),
(4, 3),
(4, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD KEY `FK_usuario_cliente_1` (`fk_usuarios_id`),
  ADD KEY `FK_usuario_cliente_2` (`fk_clientes_id_cliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD CONSTRAINT `FK_usuario_cliente_1` FOREIGN KEY (`fk_usuarios_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `FK_usuario_cliente_2` FOREIGN KEY (`fk_clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
