-- Banco: clinicadodb
-- Corrigido e atualizado de 2016 para padrões atuais
-- Alterações: charset latin1 → utf8mb4, senhas com hash, AUTO_INCREMENT,
--             int(3) → INT, varchar(6) senha → VARCHAR(255), espaços removidos

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET NAMES utf8mb4;

-- ============================================
-- Tabela: tab_especialidades
-- ============================================
CREATE TABLE IF NOT EXISTS `tab_especialidades` (
    `ID`       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Esp_nome` VARCHAR(50)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tab_especialidades` (`ID`, `Esp_nome`) VALUES
    (1, 'Pediatra'),
    (2, 'Clínico Geral'),
    (3, 'Cardiologista'),
    (4, 'Neurologista');

-- ============================================
-- Tabela: tab_medicos
-- ============================================
CREATE TABLE IF NOT EXISTS `tab_medicos` (
    `ID`               INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `med_nome`         VARCHAR(50) NOT NULL,
    `med_CRM`          VARCHAR(10) NOT NULL UNIQUE,
    `med_dtnasc`       DATE        NOT NULL,
    `med_especialidade` INT        NOT NULL,
    FOREIGN KEY (`med_especialidade`) REFERENCES `tab_especialidades`(`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Tabela: tab_usuarios
-- ============================================
CREATE TABLE IF NOT EXISTS `tab_usuarios` (
    `usu_codigo`  INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `usu_usuario` VARCHAR(50)  NOT NULL UNIQUE,
    `usu_senha`   VARCHAR(255) NOT NULL
    -- ATENÇÃO: armazene sempre o hash da senha (ex: bcrypt)
    -- nunca salve senha em texto puro!
    -- exemplo no PHP: password_hash($senha, PASSWORD_BCRYPT)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;