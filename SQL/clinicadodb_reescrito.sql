-- ============================================================
-- Banco: clinicadodb
-- Reescrito por: Claude (Anthropic) — Novembro 2026
-- Original: phpMyAdmin 4.1.14 / MySQL 5.6.17 / PHP 5.5.12
-- Motivo: o original tinha senha varchar(6), charset latin1
--         e ID 0 com especialidade vazia. Foi corrigido.
-- ============================================================

CREATE DATABASE IF NOT EXISTS `clinicadodb`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `clinicadodb`;

-- --------------------------------------------------------
-- Especialidades médicas
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tab_especialidades` (
  `id`       INT          NOT NULL AUTO_INCREMENT,
  `esp_nome` VARCHAR(50)  NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dados iniciais (removido o ID 0 com nome vazio — era um bug)
INSERT INTO `tab_especialidades` (`esp_nome`) VALUES
  ('Pediatra'),
  ('Clínico Geral'),
  ('Cardiologista'),
  ('Neurologista');

-- --------------------------------------------------------
-- Médicos
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tab_medicos` (
  `id`               INT         NOT NULL AUTO_INCREMENT,
  `med_nome`         VARCHAR(50) NOT NULL,
  `med_crm`          VARCHAR(10) NOT NULL,
  `med_dt_nasc`      DATE        NOT NULL,
  `med_especialidade` INT        NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_medico_especialidade`
    FOREIGN KEY (`med_especialidade`)
    REFERENCES `tab_especialidades` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Usuários
-- Senha VARCHAR(6) em texto puro foi substituída por hash bcrypt (60 chars)
-- NUNCA armazene senha em texto puro. Nunca. Jamais. Por favor.
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tab_usuarios` (
  `usu_codigo`  INT          NOT NULL AUTO_INCREMENT,
  `usu_usuario` VARCHAR(50)  NOT NULL UNIQUE,
  `usu_senha`   VARCHAR(255) NOT NULL, -- bcrypt/argon2 hash
  `usu_criado`  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`usu_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- O que mudou em relação ao original:
--
-- 1. charset latin1 → utf8mb4 (suporta acentos e emojis de verdade)
-- 2. ID 0 com especialidade '' removido (era lixo no banco)
-- 3. AUTO_INCREMENT em vez de IDs manuais
-- 4. usu_senha VARCHAR(6) → VARCHAR(255) para hash bcrypt/argon2
--    (senha em texto puro é crime contra a humanidade)
-- 5. FOREIGN KEY de médico para especialidade (integridade referencial)
-- 6. usu_usuario UNIQUE (não pode ter dois iguais)
-- 7. usu_criado para saber quando o usuário foi cadastrado
-- ============================================================
