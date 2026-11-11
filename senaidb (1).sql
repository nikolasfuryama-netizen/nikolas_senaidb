-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 11/11/2026 às 14:17
-- Versão do servidor: 8.0.45-0ubuntu0.24.04.1
-- Versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `senaidb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `componentes_maq`
--

CREATE TABLE `componentes_maq` (
  `id_componente` int NOT NULL,
  `id_maquina` int DEFAULT NULL,
  `nome_componente` varchar(100) DEFAULT NULL,
  `horas_uso_acumulado` int DEFAULT NULL,
  `limite_horas_alerta` int DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `componentes_maq`
--

INSERT INTO `componentes_maq` (`id_componente`, `id_maquina`, `nome_componente`, `horas_uso_acumulado`, `limite_horas_alerta`) VALUES
(1, 1, 'Motor Principal', 200, 500),
(2, 2, 'Correia Transportadora', 150, 300),
(3, 3, 'Valvula Hidraulica', 350, 400),
(4, 4, 'Eletrodo', 100, 250),
(5, 5, 'Filtro de Ar', 200, 350);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque_pecas`
--

CREATE TABLE `estoque_pecas` (
  `id_peca` int NOT NULL,
  `codigo_part_number` varchar(50) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `qtd_estoque` int DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `estoque_pecas`
--

INSERT INTO `estoque_pecas` (`id_peca`, `codigo_part_number`, `descricao`, `qtd_estoque`, `preco_unitario`) VALUES
(1, 'PEC-001', 'Rolamento Industrial', 20, 150.00),
(2, 'PEC-002', 'Correia de Transmissao', 15, 85.50),
(3, 'PEC-003', 'Valvula Hidraulica', 10, 230.00),
(4, 'PEC-004', 'Eletrodo de Solda', 50, 25.00),
(5, 'PEC-005', 'Filtro de Ar', 30, 45.90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_sensores`
--

CREATE TABLE `historico_sensores` (
  `id_leitura` int NOT NULL,
  `id_ordem` int DEFAULT NULL,
  `temperatura_medida` decimal(5,2) DEFAULT NULL,
  `vibracao_mm_s` decimal(5,2) DEFAULT NULL,
  `data_hora_leitura` datetime DEFAULT NULL,
  `prompt_geracao_ia` varchar(100) DEFAULT 'gerado_por_llm'
) ;

--
-- Despejando dados para a tabela `historico_sensores`
--

INSERT INTO `historico_sensores` (`id_leitura`, `id_ordem`, `temperatura_medida`, `vibracao_mm_s`, `data_hora_leitura`, `prompt_geracao_ia`) VALUES
(2, NULL, 65.50, 2.30, '2026-10-01 08:30:00', 'gerado_por_llm'),
(3, NULL, 95.40, 7.80, '2026-10-02 10:00:00', 'gerado_por_llm'),
(4, NULL, 75.60, 3.40, '2026-10-03 10:30:00', 'gerado_por_llm'),
(5, NULL, 55.30, 1.50, '2026-10-04 13:30:00', 'gerado_por_llm'),
(6, NULL, 110.50, 10.20, '2026-10-05 15:00:00', 'gerado_por_llm');

-- --------------------------------------------------------

--
-- Estrutura para tabela `linhas_producao`
--

CREATE TABLE `linhas_producao` (
  `id_linha` int NOT NULL,
  `id_unidade` int DEFAULT NULL,
  `nome_linha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `linhas_producao`
--

INSERT INTO `linhas_producao` (`id_linha`, `id_unidade`, `nome_linha`) VALUES
(1, 1, 'Linha de Montagem'),
(2, 2, 'Linha de Embalagem'),
(3, 3, 'Linha de Usinagem'),
(4, 4, 'Linha de Soldagem'),
(5, 5, 'Linha de Pintura');

-- --------------------------------------------------------

--
-- Estrutura para tabela `maquinas_senai`
--

CREATE TABLE `maquinas_senai` (
  `id_maquina` int NOT NULL,
  `id_linha` int DEFAULT NULL,
  `id_tipo` int DEFAULT NULL,
  `tag_patrimonio` varchar(30) DEFAULT NULL,
  `data_aquisicao` date DEFAULT NULL,
  `status_operacao` varchar(20) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `maquinas_senai`
--

INSERT INTO `maquinas_senai` (`id_maquina`, `id_linha`, `id_tipo`, `tag_patrimonio`, `data_aquisicao`, `status_operacao`) VALUES
(1, 1, 1, 'PAT-001', '2022-03-15', 'ATIVA'),
(2, 2, 2, 'PAT-002', '2021-06-20', 'ATIVA'),
(3, 3, 3, 'PAT-003', '2023-01-10', 'MANUTENCAO'),
(4, 4, 4, 'PAT-004', '2020-09-05', 'ATIVA'),
(5, 5, 5, 'PAT-005', '2022-11-18', 'DESATIVADA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ordens_servico`
--

CREATE TABLE `ordens_servico` (
  `id_ordem` int NOT NULL,
  `id_maquina` int DEFAULT NULL,
  `id_tecnico` int DEFAULT NULL,
  `data_abertura` datetime DEFAULT NULL,
  `tipo_manutencao` varchar(20) DEFAULT NULL,
  `status_os` varchar(20) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `ordens_servico`
--

INSERT INTO `ordens_servico` (`id_ordem`, `id_maquina`, `id_tecnico`, `data_abertura`, `tipo_manutencao`, `status_os`) VALUES
(1, 1, 1, '2026-10-01 08:00:00', 'preventiva', 'concluida'),
(2, 2, 2, '2026-10-02 09:30:00', 'corretiva', 'em_andamento'),
(3, 3, 3, '2026-10-03 10:00:00', 'preditiva', 'aberta'),
(4, 4, 4, '2026-10-04 13:00:00', 'preventiva', 'concluida'),
(5, 5, 5, '2026-10-05 14:30:00', 'corretiva', 'cancelada');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pecas_os`
--

CREATE TABLE `pecas_os` (
  `id_ordem` int NOT NULL,
  `id_peca` int NOT NULL,
  `qtd_utilizada` int DEFAULT NULL,
  `preco_aplicado` decimal(10,2) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `pecas_os`
--

INSERT INTO `pecas_os` (`id_ordem`, `id_peca`, `qtd_utilizada`, `preco_aplicado`) VALUES
(1, 1, 2, 150.00),
(2, 2, 1, 85.50),
(3, 3, 2, 230.00),
(4, 4, 5, 25.00),
(5, 5, 1, 45.90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id_tecnico` int NOT NULL,
  `nome_tecnico` varchar(100) DEFAULT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `nivel_certificacao` varchar(30) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `tecnicos`
--

INSERT INTO `tecnicos` (`id_tecnico`, `nome_tecnico`, `especialidade`, `nivel_certificacao`) VALUES
(1, 'Carlos Silva', 'Mecanica', 'SENIOR'),
(2, 'Ana Souza', 'Eletrica', 'PLENO'),
(3, 'Pedro Santos', 'Automacao', 'JUNIOR'),
(4, 'Mariana Costa', 'Soldagem', 'SPECIALIST'),
(5, 'Lucas Oliveira', 'Hidraulica', 'PLENO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_maquina`
--

CREATE TABLE `tipos_maquina` (
  `id_tipo` int NOT NULL,
  `nome_tipo` varchar(50) DEFAULT NULL,
  `horas_revisao_padrao` int DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `tipos_maquina`
--

INSERT INTO `tipos_maquina` (`id_tipo`, `nome_tipo`, `horas_revisao_padrao`) VALUES
(1, 'Torno CNC', 500),
(2, 'Esteira Industrial', 300),
(3, 'Prensa Hidraulica', 400),
(4, 'Maquina de Solda', 250),
(5, 'Compressor', 350);

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidades_senai`
--

CREATE TABLE `unidades_senai` (
  `id_unidade` int NOT NULL,
  `nome_unidade` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `unidades_senai`
--

INSERT INTO `unidades_senai` (`id_unidade`, `nome_unidade`, `cidade`) VALUES
(1, 'SENAI Central', 'Curitiba'),
(2, 'SENAI Industrial', 'Sao Paulo'),
(3, 'SENAI Tecnologico', 'Londrina'),
(4, 'SENAI Norte', 'Joinville'),
(5, 'SENAI Sul', 'Porto Alegre');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `componentes_maq`
--
ALTER TABLE `componentes_maq`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `fk_id_maquina` (`id_maquina`);

--
-- Índices de tabela `estoque_pecas`
--
ALTER TABLE `estoque_pecas`
  ADD PRIMARY KEY (`id_peca`),
  ADD UNIQUE KEY `codigo_part_number` (`codigo_part_number`);

--
-- Índices de tabela `historico_sensores`
--
ALTER TABLE `historico_sensores`
  ADD PRIMARY KEY (`id_leitura`),
  ADD KEY `fk_historico_ordem` (`id_ordem`);

--
-- Índices de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD PRIMARY KEY (`id_linha`),
  ADD KEY `fk_id_unidade` (`id_unidade`);

--
-- Índices de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD PRIMARY KEY (`id_maquina`),
  ADD UNIQUE KEY `tag_patrimonio` (`tag_patrimonio`),
  ADD KEY `fk_id_linha` (`id_linha`),
  ADD KEY `fk_id_tipo` (`id_tipo`);

--
-- Índices de tabela `ordens_servico`
--
ALTER TABLE `ordens_servico`
  ADD PRIMARY KEY (`id_ordem`),
  ADD KEY `fk_ordem_maquina` (`id_maquina`),
  ADD KEY `fk_id_tecnico` (`id_tecnico`);

--
-- Índices de tabela `pecas_os`
--
ALTER TABLE `pecas_os`
  ADD PRIMARY KEY (`id_ordem`,`id_peca`),
  ADD KEY `fk_id_peca` (`id_peca`);

--
-- Índices de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id_tecnico`);

--
-- Índices de tabela `tipos_maquina`
--
ALTER TABLE `tipos_maquina`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Índices de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  ADD PRIMARY KEY (`id_unidade`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `componentes_maq`
--
ALTER TABLE `componentes_maq`
  MODIFY `id_componente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoque_pecas`
--
ALTER TABLE `estoque_pecas`
  MODIFY `id_peca` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historico_sensores`
--
ALTER TABLE `historico_sensores`
  MODIFY `id_leitura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  MODIFY `id_linha` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  MODIFY `id_maquina` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ordens_servico`
--
ALTER TABLE `ordens_servico`
  MODIFY `id_ordem` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id_tecnico` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipos_maquina`
--
ALTER TABLE `tipos_maquina`
  MODIFY `id_tipo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  MODIFY `id_unidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `componentes_maq`
--
ALTER TABLE `componentes_maq`
  ADD CONSTRAINT `fk_id_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`);

--
-- Restrições para tabelas `historico_sensores`
--
ALTER TABLE `historico_sensores`
  ADD CONSTRAINT `fk_historico_ordem` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_servico` (`id_ordem`);

--
-- Restrições para tabelas `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD CONSTRAINT `fk_id_unidade` FOREIGN KEY (`id_unidade`) REFERENCES `unidades_senai` (`id_unidade`);

--
-- Restrições para tabelas `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD CONSTRAINT `fk_id_linha` FOREIGN KEY (`id_linha`) REFERENCES `linhas_producao` (`id_linha`),
  ADD CONSTRAINT `fk_id_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_maquina` (`id_tipo`);

--
-- Restrições para tabelas `ordens_servico`
--
ALTER TABLE `ordens_servico`
  ADD CONSTRAINT `fk_id_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnicos` (`id_tecnico`),
  ADD CONSTRAINT `fk_ordem_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`);

--
-- Restrições para tabelas `pecas_os`
--
ALTER TABLE `pecas_os`
  ADD CONSTRAINT `fk_id_ordem` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_servico` (`id_ordem`),
  ADD CONSTRAINT `fk_id_peca` FOREIGN KEY (`id_peca`) REFERENCES `estoque_pecas` (`id_peca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
