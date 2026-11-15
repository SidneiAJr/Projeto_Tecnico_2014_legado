-- ============================================================
-- Banco: locadora_db
-- Baseado no ER original da disciplina (MySQL Workbench)
-- Reescrito por: Claude (Anthropic) — Novembro 2026
-- Motivo: original feito em Access/MySQL 5.6 com charset latin1,
--         sem boas práticas, sem índices, sem constraints direito
-- ============================================================

CREATE DATABASE IF NOT EXISTS `locadora_db`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `locadora_db`;

-- ============================================================
-- CLIENTES
-- ============================================================
CREATE TABLE IF NOT EXISTS `clientes` (
  `id`        INT           NOT NULL AUTO_INCREMENT,
  `nome`      VARCHAR(255)  NOT NULL,
  `telefone`  VARCHAR(20)       NULL,
  `endereco`  VARCHAR(255)      NULL,
  `criado_em` DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- ATORES
-- ============================================================
CREATE TABLE IF NOT EXISTS `atores` (
  `id`              INT          NOT NULL AUTO_INCREMENT,
  `nome_artistico`  VARCHAR(45)  NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- FILMES
-- ============================================================
CREATE TABLE IF NOT EXISTS `filmes` (
  `id`        INT           NOT NULL AUTO_INCREMENT,
  `titulo`    VARCHAR(255)  NOT NULL,
  `categoria` VARCHAR(255)      NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- ELENCO — relação Filme <-> Ator (N:N)
-- No ER original chamada de "Ator_filme"
-- ============================================================
CREATE TABLE IF NOT EXISTS `elenco` (
  `id_ator`  INT NOT NULL,
  `id_filme` INT NOT NULL,
  PRIMARY KEY (`id_ator`, `id_filme`),
  CONSTRAINT `fk_elenco_ator`
    FOREIGN KEY (`id_ator`)  REFERENCES `atores`  (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_elenco_filme`
    FOREIGN KEY (`id_filme`) REFERENCES `filmes`  (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- DVDs — cada DVD é uma cópia física de um filme
-- Um filme pode ter várias cópias (DVD)
-- ============================================================
CREATE TABLE IF NOT EXISTS `dvds` (
  `id`         INT        NOT NULL AUTO_INCREMENT,
  `id_filme`   INT        NOT NULL,
  `quantidade` TINYINT    NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_dvd_filme`
    FOREIGN KEY (`id_filme`) REFERENCES `filmes` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- ALUGUEIS
-- Um cliente aluga um DVD em uma data e devolve em outra
-- ============================================================
CREATE TABLE IF NOT EXISTS `alugueis` (
  `id`             INT   NOT NULL AUTO_INCREMENT,
  `id_cliente`     INT   NOT NULL,
  `id_dvd`         INT   NOT NULL,
  `data_retirada`  DATE  NOT NULL,
  `data_entrega`   DATE      NULL, -- NULL = ainda não devolvido
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_aluguel_cliente`
    FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_aluguel_dvd`
    FOREIGN KEY (`id_dvd`)     REFERENCES `dvds`     (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- ÍNDICES úteis para as consultas mais comuns
-- ============================================================
CREATE INDEX `idx_alugueis_cliente`    ON `alugueis` (`id_cliente`);
CREATE INDEX `idx_alugueis_dvd`        ON `alugueis` (`id_dvd`);
CREATE INDEX `idx_alugueis_entrega`    ON `alugueis` (`data_entrega`);
CREATE INDEX `idx_dvds_filme`          ON `dvds`     (`id_filme`);
CREATE INDEX `idx_filmes_categoria`    ON `filmes`   (`categoria`);

-- ============================================================
-- VIEWS úteis
-- ============================================================

-- Alugueis em aberto (não devolvidos)
CREATE OR REPLACE VIEW `vw_alugueis_abertos` AS
SELECT
  a.id              AS id_aluguel,
  c.nome            AS cliente,
  c.telefone,
  f.titulo          AS filme,
  d.id              AS id_dvd,
  a.data_retirada,
  DATEDIFF(CURDATE(), a.data_retirada) AS dias_em_aberto
FROM `alugueis` a
JOIN `clientes` c ON c.id = a.id_cliente
JOIN `dvds`     d ON d.id = a.id_dvd
JOIN `filmes`   f ON f.id = d.id_filme
WHERE a.data_entrega IS NULL
ORDER BY dias_em_aberto DESC;

-- Filmes com elenco completo
CREATE OR REPLACE VIEW `vw_filmes_elenco` AS
SELECT
  f.id              AS id_filme,
  f.titulo,
  f.categoria,
  GROUP_CONCAT(at.nome_artistico ORDER BY at.nome_artistico SEPARATOR ', ') AS elenco
FROM `filmes`  f
LEFT JOIN `elenco` e  ON e.id_filme = f.id
LEFT JOIN `atores` at ON at.id      = e.id_ator
GROUP BY f.id, f.titulo, f.categoria;

-- ============================================================
-- O que mudou em relação ao modelo original:
--
-- 1. charset latin1 → utf8mb4
-- 2. Nomes de tabelas em português e consistentes
-- 3. AUTO_INCREMENT em todas as PKs
-- 4. FOREIGN KEYs com ON DELETE/UPDATE explícitos
-- 5. data_apanha → data_retirada (nome menos confuso)
-- 6. data_entrega NULL = ainda não devolvido (semântica clara)
-- 7. Tabela "Ator_filme" renomeada para "elenco" (mais legível)
-- 8. PK composta em elenco (id_ator + id_filme) evita duplicata
-- 9. Índices nas colunas de busca mais comuns
-- 10. Views prontas para os relatórios pedidos no objetivo
-- ============================================================
