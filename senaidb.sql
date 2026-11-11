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

--
-- Índices de tabela `estoque_pecas`
--


--
-- Índices de tabela `historico_sensores`
--

--
-- Índices de tabela `linhas_producao`
--


--
-- Índices de tabela `maquinas_senai`
--

--
-- Índices de tabela `ordens_servico`
--

--
-- Índices de tabela `pecas_os`
--

--
-- Índices de tabela `tecnicos`
--

--
-- Índices de tabela `tipos_maquina`
--

--
-- Índices de tabela `unidades_senai`
--

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `componentes_maq`
--

--
-- AUTO_INCREMENT de tabela `estoque_pecas`
--


--
-- AUTO_INCREMENT de tabela `historico_sensores`
--

-- AUTO_INCREMENT de tabela `linhas_producao`
--

-- AUTO_INCREMENT de tabela `maquinas_senai`
--

 
--
-- AUTO_INCREMENT de tabela `ordens_servico`
--

-- AUTO_INCREMENT de tabela `tecnicos`
--

--
-- AUTO_INCREMENT de tabela `tipos_maquina`
--


--
-- AUTO_INCREMENT de tabela `unidades_senai`
--

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `componentes_maq`
--

--
-- Restrições para tabelas `historico_sensores`
--

--
-- Restrições para tabelas `linhas_producao`
--ALTER TABLE `pecas_os`

--
-- Restrições para tabelas `maquinas_senai`
--


--
-- Restrições para tabelas `ordens_servico`
--

--
-- Restrições para tabelas `pecas_os`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
