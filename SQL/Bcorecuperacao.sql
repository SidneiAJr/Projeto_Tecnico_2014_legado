-- Gerado a partir de bcorecuperacao.mdb
-- Tabelas: TIPOPACOTE, PACOTES, HOSPEDAGEM

-- ============================================
-- Tabela: TIPOPACOTE
-- ============================================
CREATE TABLE `TIPOPACOTE` (
    `id`            INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tipo`          VARCHAR(10)
);

-- ============================================
-- Tabela: PACOTES
-- ============================================
CREATE TABLE `PACOTES` (
    `id`            INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `codtipopacote` INT,
    `pacote`        VARCHAR(30),
    FOREIGN KEY (`codtipopacote`) REFERENCES `TIPOPACOTE`(`id`)
);

-- ============================================
-- Tabela: HOSPEDAGEM
-- ============================================
CREATE TABLE `HOSPEDAGEM` (
    `id`            INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tarifa`        FLOAT,
    `codpacote`     INT,
    `hospedagem`    VARCHAR(30),
    FOREIGN KEY (`codpacote`) REFERENCES `PACOTES`(`id`)
);

-- ============================================
-- Dados
-- ============================================
INSERT INTO `TIPOPACOTE` (`id`, `tipo`) VALUES
    (1, 'NORDESTE'),
    (2, 'SERRA'),
    (3, 'PANTANAL'),
    (4, 'EXTERIOR');

INSERT INTO `PACOTES` (`id`, `codtipopacote`, `pacote`) VALUES
    (1, 1, 'MACEIÓ'),
    (2, 1, 'FORTALEZA'),
    (3, 2, 'SERRA GAÚCHA'),
    (4, 4, 'FLÓRIDA FLY & DRIVE'),
    (5, 4, 'RIVIERA MAYA');

INSERT INTO `HOSPEDAGEM` (`id`, `tarifa`, `codpacote`, `hospedagem`) VALUES
    (1, 179.42, 1, 'HOTEL MARINAS MACEIÓ'),
    (2, 166.88, 2, 'HOTEL BELLOMAR ARIAÚ'),
    (3, 172.44, 3, 'BLUE TREE TOWERS'),
    (4, 542.58, 4, 'CELEBRATION SUITES AT OLD TOWN'),
    (5, 746.10, 5, 'CATALONIA RIVIERA MAYA RESORT');