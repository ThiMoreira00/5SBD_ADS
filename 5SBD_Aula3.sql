-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/08/2024 às 01:28
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `5sbd_2024.2`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `sbd_produtos`
--

CREATE TABLE `sbd_produtos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(32) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `preco` float NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sbd_produtos`
--

INSERT INTO `sbd_produtos` (`id`, `codigo`, `nome`, `preco`, `quantidade`) VALUES
(3, '1', 'Frutas Tropicais', 10, 1),
(4, '2', 'Mel Gourmet', 20, 2),
(5, '3', 'Arroz Integral', 30, 3),
(6, '4', 'Leite Natural', 40, 4),
(7, '5', 'Pasta de Amendoim', 50, 5),
(8, '6', 'Creme Hidratante', 60, 6),
(9, '7', 'Desinfetante Citrus', 70, 7),
(10, '8', 'Cereal Integral', 80, 8),
(11, '9', 'Biscoito Crocante', 90, 9),
(12, '10', 'Condimento Aromático', 100, 10),
(13, '11', 'Óleo de Cozinha', 110, 11),
(14, '12', 'Sabonete Líquido', 120, 12),
(15, '13', 'Sucos Naturais', 130, 13),
(16, '14', 'Papel Toalha', 140, 14),
(17, '15', 'Café Gourmet', 150, 15),
(18, '16', 'Manteiga Clarificada', 160, 16),
(19, '17', 'Shampoo Revitalizante', 170, 17),
(20, '18', 'Granola Caseira', 180, 18),
(21, '19', 'Gel de Aloe Vera', 190, 19),
(22, '20', 'Condicionador Nutritivo', 200, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sbd_tempdata`
--

CREATE TABLE `sbd_tempdata` (
  `codigoPedido` varchar(30) NOT NULL,
  `dataPedido` date NOT NULL,
  `SKU` varchar(20) NOT NULL,
  `UPC` varchar(3) NOT NULL,
  `nomeProduto` varchar(100) NOT NULL,
  `qtd` int(11) NOT NULL,
  `valor` float NOT NULL,
  `frete` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `codigoComprador` varchar(3) NOT NULL,
  `nomeComprador` varchar(50) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `CEP` varchar(11) NOT NULL,
  `UF` varchar(2) NOT NULL,
  `pais` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sbd_tempdata`
--

INSERT INTO `sbd_tempdata` (`codigoPedido`, `dataPedido`, `SKU`, `UPC`, `nomeProduto`, `qtd`, `valor`, `frete`, `email`, `codigoComprador`, `nomeComprador`, `endereco`, `CEP`, `UF`, `pais`) VALUES
('codigoPedido', '0000-00-00', 'SKU', 'UPC', 'nomeProduto', 0, 0, 0, 'email', 'cod', 'nomeComprador', 'endereco', 'CEP', 'UF', 'pais'),
('abc123', '2024-03-19', 'brinq456rio', '456', 'quebra-cabeca', 1, 43, 5, 'samir@gmail.com', '123', 'Samir', 'Rua Exemplo 1', '21212322', 'RJ', 'Brasil'),
('abc123', '2024-03-19', 'brinq789rio', '789', 'jogo', 1, 43, 5, 'samir@gmail.com', '123', 'Samir', 'Rua Exemplo 1', '21212322', 'RJ', 'Brasil'),
('abc789', '2024-03-20', 'roupa123rio', '123', 'camisa', 2, 47, 6, 'teste@gmail.com', '789', 'Fulano', 'Rua Exemplo 2', '14784520', 'RJ', 'Brasil'),
('abc741', '2024-03-21', 'brinq789rio', '789', 'jogo', 1, 43, 5, 'samir@gmail.com', '123', 'Samir', 'Rua Exemplo 1', '21212322', 'RJ', 'Brasil');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `sbd_produtos`
--
ALTER TABLE `sbd_produtos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `sbd_produtos`
--
ALTER TABLE `sbd_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
