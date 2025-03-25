-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Out-2023 às 05:14
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
-- Banco de dados: `bd_sigap`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id` int(11) NOT NULL,
  `periodo` int(11) DEFAULT NULL,
  `turno` varchar(14) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `qnt_total_aulas` int(11) DEFAULT NULL,
  `carga_horaria` float NOT NULL,
  `curso` varchar(100) NOT NULL,
  `fk_professores_fk_usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `disciplinas`
--

INSERT INTO `disciplinas` (`id`, `periodo`, `turno`, `nome`, `qnt_total_aulas`, `carga_horaria`, `curso`, `fk_professores_fk_usuarios_id`) VALUES
(11, 1, 'Noturno', 'Algoritmos 1', 80, 60, 'PROEJA-Informática para Internet', 2),
(12, 1, 'Noturno', 'Projeto e Design', 100, 75, 'PROEJA-Informática para Internet', 3),
(13, 1, 'Noturno', 'Filosofia 1', 40, 30, 'PROEJA-Informática para Internet', 5),
(14, 1, 'Noturno', 'Redes de Computadores', 80, 60, 'PROEJA-Informática para Internet', 4),
(15, 1, 'Noturno', 'Algoritmos 2', 80, 60, 'Licenciatura em Computação', 2),
(16, 1, 'Noturno', 'Banco de Dados', 100, 75, 'Licenciatura em Computação', 2),
(17, 1, 'Noturno', 'Filosofia 2', 40, 30, 'Licenciatura em Computação', 5),
(18, 2, 'Noturno', 'Desenvolvimento Web', 80, 60, 'PROEJA-Informática para Internet', 3),
(19, 3, 'Noturno', 'Banco de Dados 2', 100, 75, 'Licenciatura em Computação', 3),
(20, 3, 'Matutino', 'Dispositivos Móveis', 100, 75, 'Técnico em Informática', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estudantes`
--

CREATE TABLE `estudantes` (
  `ra` int(11) NOT NULL,
  `fk_usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estudantes`
--

INSERT INTO `estudantes` (`ra`, `fk_usuarios_id`) VALUES
(4, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogo_da_velha`
--

CREATE TABLE `jogo_da_velha` (
  `id` int(11) NOT NULL,
  `player1` varchar(100) DEFAULT NULL,
  `player2` varchar(100) DEFAULT NULL,
  `resultado` varchar(100) DEFAULT NULL,
  `data_jogo` date DEFAULT NULL,
  `fk_usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula_se`
--

CREATE TABLE `matricula_se` (
  `fk_disciplinas_id` int(11) NOT NULL,
  `fk_estudantes_fk_usuarios_id` int(11) NOT NULL,
  `n1` float DEFAULT NULL,
  `n2` float DEFAULT NULL,
  `media` float DEFAULT NULL,
  `faltas` int(11) DEFAULT NULL,
  `situacao` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professores`
--

CREATE TABLE `professores` (
  `siape` int(11) NOT NULL,
  `fk_usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professores`
--

INSERT INTO `professores` (`siape`, `fk_usuarios_id`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `cpf`, `foto`, `email`, `data_nascimento`, `nome`, `senha`) VALUES
(2, '11111111111', '93b163f73780fecd32914da83a2b4a15.avif', 'aurelio@gmail.com', '2023-06-14', 'Aurelio Junior', '123'),
(3, '1333123123', '8c251fdfa28a245ce68ae6d1531cd260.webp', 'camilap@gmail.com', '2023-06-14', 'Camila', '123'),
(4, '123312312', '2dc85bb4902b6b68dc41d4b80a7addaf.jpg', 'leandro@gmail.com', '2023-06-15', 'Leandro Steffen', '123'),
(5, '123213123123', '5c5b41d23a686f62b030041349c3995f.jpg', 'ricardo@gmail.com', '2023-06-09', 'Ricardo ', '123'),
(8, '12345678911', '8adb7c513055483e133039ccc4fc66e0.webp', 'cat@gmail.com', '2023-10-06', 'cat', '123');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_disciplinas_2` (`fk_professores_fk_usuarios_id`);

--
-- Índices para tabela `estudantes`
--
ALTER TABLE `estudantes`
  ADD PRIMARY KEY (`fk_usuarios_id`),
  ADD UNIQUE KEY `ra` (`ra`);

--
-- Índices para tabela `jogo_da_velha`
--
ALTER TABLE `jogo_da_velha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_jogo_da_velha_2` (`fk_usuarios_id`);

--
-- Índices para tabela `matricula_se`
--
ALTER TABLE `matricula_se`
  ADD KEY `FK_matricula_se_1` (`fk_disciplinas_id`),
  ADD KEY `FK_matricula_se_2` (`fk_estudantes_fk_usuarios_id`);

--
-- Índices para tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`fk_usuarios_id`),
  ADD UNIQUE KEY `siape` (`siape`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`,`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `estudantes`
--
ALTER TABLE `estudantes`
  MODIFY `ra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `jogo_da_velha`
--
ALTER TABLE `jogo_da_velha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `siape` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD CONSTRAINT `FK_disciplinas_2` FOREIGN KEY (`fk_professores_fk_usuarios_id`) REFERENCES `professores` (`fk_usuarios_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `estudantes`
--
ALTER TABLE `estudantes`
  ADD CONSTRAINT `FK_estudantes_2` FOREIGN KEY (`fk_usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `jogo_da_velha`
--
ALTER TABLE `jogo_da_velha`
  ADD CONSTRAINT `FK_jogo_da_velha_2` FOREIGN KEY (`fk_usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `matricula_se`
--
ALTER TABLE `matricula_se`
  ADD CONSTRAINT `FK_matricula_se_1` FOREIGN KEY (`fk_disciplinas_id`) REFERENCES `disciplinas` (`id`),
  ADD CONSTRAINT `FK_matricula_se_2` FOREIGN KEY (`fk_estudantes_fk_usuarios_id`) REFERENCES `estudantes` (`fk_usuarios_id`);

--
-- Limitadores para a tabela `professores`
--
ALTER TABLE `professores`
  ADD CONSTRAINT `FK_professores_2` FOREIGN KEY (`fk_usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;