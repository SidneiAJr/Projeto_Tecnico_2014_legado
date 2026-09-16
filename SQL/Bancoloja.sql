-- Gerado a partir de BancoLoja.mdb
-- Tabelas: Categorias, Fornecedores, Produtos

-- ============================================
-- Tabela: Categorias
-- ============================================
CREATE TABLE `Categorias` (
    `Cat_Codigo` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Cat_Nome`   VARCHAR(20)
);

-- ============================================
-- Tabela: Fornecedores
-- ============================================
CREATE TABLE `Fornecedores` (
    `For_Codigo` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `For_Nome`   VARCHAR(25)
);

-- ============================================
-- Tabela: Produtos
-- ============================================
CREATE TABLE `Produtos` (
    `Loja_Codigo`       INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Loja_Produto`      VARCHAR(50),
    `Loja_Preco`        FLOAT,
    `Loja_Controle`     BOOLEAN NOT NULL DEFAULT FALSE,
    `Loja_Cor`          VARCHAR(10),
    `Loja_Peso`         VARCHAR(10),
    `Loja_Tensao`       VARCHAR(10),
    `Loja_Complemento`  VARCHAR(30),
    `Loja_Descricao`    TEXT,
    `Loja_Potencia`     VARCHAR(10),
    `Loja_Categoria`    TINYINT,
    `Loja_Fornecedor`   SMALLINT,
    FOREIGN KEY (`Loja_Categoria`)  REFERENCES `Categorias`(`Cat_Codigo`),
    FOREIGN KEY (`Loja_Fornecedor`) REFERENCES `Fornecedores`(`For_Codigo`)
);

-- ============================================
-- Dados: Categorias
-- ============================================
INSERT INTO `Categorias` (`Cat_Codigo`, `Cat_Nome`) VALUES
    (1, 'Condicionador de Ar'),
    (2, 'Som'),
    (3, 'TV'),
    (4, 'DVD'),
    (5, 'Video-Cassete'),
    (6, 'Discman'),
    (7, 'Home-Teather'),
    (8, 'Walkman'),
    (9, 'Auto-Rádio');

-- ============================================
-- Dados: Fornecedores
-- ============================================
INSERT INTO `Fornecedores` (`For_Codigo`, `For_Nome`) VALUES
    (1,  'Consul'),
    (2,  'Brastemp'),
    (3,  'Cougar'),
    (4,  'Audax'),
    (5,  'Aiwa'),
    (6,  'CCE'),
    (7,  'Sony'),
    (8,  'LG'),
    (9,  'Philco'),
    (10, 'Phillips'),
    (11, 'Panasonic'),
    (12, 'Semp Toshiba'),
    (13, 'Gradiente'),
    (14, 'Yamaha'),
    (15, 'JVC'),
    (16, 'Lenoxx'),
    (17, 'Precision');

-- ============================================
-- Dados: Produtos
-- ============================================
INSERT INTO `Produtos` (`Loja_Codigo`, `Loja_Produto`, `Loja_Preco`, `Loja_Controle`, `Loja_Cor`, `Loja_Peso`, `Loja_Tensao`, `Loja_Complemento`, `Loja_Descricao`, `Loja_Potencia`, `Loja_Categoria`, `Loja_Fornecedor`) VALUES
    (1,  'AR CONDICIONADO CONSUL CCF07B',         469.00,   0, 'BRANCA',     '31,7 kg', '220',     'somente frio',              'Base moldada em plástico imune a corrosão. Duas velocidades de ventilação. Sistema de redução de ruídos.',        '7500 btus',  1, 1),
    (2,  'AR CONDICIONADO BRASTEMP BCF07A',        569.00,   0, 'BRANCA',     '-',       '110/220', 'reverso',                   'Total Air. Exclusivo sistema de distribuição de ar. Exclusivo filtro 3M filtrete. Exclusiva função turbo.',        '7500 btus',  1, 2),
    (3,  'AR CONDICIONADO BRASTEMP BCV07A',        659.00,   1, 'BRANCA',     '23.7 kg', '110/220', 'somente frio',              'Total Air Eletrônico. Saídas de ar por todos os lados. Função Turbo. Filtrete. Menor nível de ruído.',            '7500 btus',  1, 2),
    (4,  'AR CONDICIONADO CONSUL CCF10B',          649.00,   0, 'BRANCA',     '52 kg',   '110',     'somente frio',              'Gabinete e chassi galvanizados. Duas velocidades de ventilação. Ventiladores balanceados eletronicamente.',        '10000 btus', 1, 1),
    (5,  'AR CONDICIONADO BRASTEMP BCHV10',        927.00,   1, 'BRANCA',     '54 kg',   '220',     'reverso',                   'Sistema fuzzy. 3 modos de operação: normal, conforto e dormir. Exclusivo filtro descartável.',                    '10000 btus', 1, 2),
    (6,  'MICRO SYSTEM COUGAR MS-686 LS',          259.00,   1, 'CINZA',      '-',       '110/220', '-',                         'Rádio AM/FM. Bass reflex.',                                                                                       '-',          2, 3),
    (7,  'MINI SYSTEM AUDAX SMS-8200',             289.00,   1, 'CINZA',      '-',       '110/220', 'com sleep/timer',           '240 W PMPO. 2 equalizações pré-programadas e 1 personalizada. Capacidade para 1 CD.',                            '240 PMPO',   2, 4),
    (8,  'MICRO SYSTEM AIWA NSX-SZ6',              359.00,   1, 'CINZA',      '-',       '110/220', 'com sleep/timer',           '3 equalizações pré-programadas rock, pop e classic.',                                                            '320 PMPO',   2, 5),
    (9,  'MICRO SYSTEM CCE MD-3130',               439.00,   1, 'CINZA',      '9,9 kg',  '110/220', 'com sleep/timer',           '3 equalizações pré-programadas. X-Tone. Loudness. Reproduz CDs graváveis.',                                      '1000 PMPO',  2, 6),
    (10, 'MICRO SYSTEM SONY MHC-DX80',            1649.00,   1, 'CINZA',      '26,1 kg', '110/220', 'com sleep/timer',           'Sound Broad System. Entrada frontal. Saída ótica digital. 2 tipos diferentes de woofers de 15 cm.',              '6600 PMPO',  2, 7),
    (11, 'MICRO SYSTEM SONY MHC-DX8',             1499.00,   1, 'CINZA',      '19,8 kg', '110/220', 'com sleep/timer',           'Equalização com 10 modos pré-programados. Disk Exchange. Cassete Dubbing. Saída óptica digital para MD.',        '6000 PMPO',  2, 7),
    (12, 'MICRO SYSTEM SONY MH-DS65',             1325.00,   1, 'CINZA ESC.', '29,3 kg', '110/220', 'com sleep/timer',           'Sound Broad System. Multi Booster e 2 caixas acústicas satélites.',                                             '5000 PMPO',  2, 7),
    (13, 'TELEVISOR LG CP-29K30 29',               929.00,   1, 'PRETO',      '38,7 kg', '110/220', 'closed caption',            'Tela de 29 polegadas. Som estéreo. Automatic Volume Level. Conexão Vídeo Componente.',                           '29"',        3, 8),
    (14, 'TELEVISOR PHILCO 2902 MTFLAT PLANA 29"', 1399.00,  1, 'CINZA ESC.', '39 kg',   '110/220', 'tela plana/close caption/SAP', 'Tela totalmente plana. 700 linhas de resolução. Controle remoto iluminado.',                                 '29"',        3, 9),
    (15, 'TELEVISOR PHILIPS PT654 PLANA 29',       1599.00,  1, 'CINZA',      '46 kg',   '110/220', 'tela plana/close caption/SAP', 'Black Matrix. Bloqueio de canais. Autovolume. Saídas para áudio estéreo e vídeo.',                           '29"',        3, 10),
    (16, 'TELEVISOR LG CP 29Q50P PLANA 29"',       1699.00,  1, 'CINZA',      '55 kg',   '110/220', 'tela plana/close caption/SAP', 'Potência de 45W RMS. Equalizador gráfico. Digital Comb Filter.',                                            '29"',        3, 8),
    (17, 'TELEVISOR PANASONIC TC 14A10 14"',        359.00,  1, 'CINZA',      '8,7 kg',  '110/220', 'closed caption',            'Tela negra. Pré-ajustes de contraste e brilho. Bloqueio de canais.',                                             '14"',        3, 11),
    (18, 'TELEVISOR PHILCO 1452-N 14"',             359.00,  1, 'CINZA ESC.', '9 kg',    '110/220', 'closed caption',            'Potência total de áudio 2 Watts RMS. 3 ajustes de imagem pré-programadas. Autovolume.',                         '14"',        3, 9),
    (19, 'TELEVISOR PHILIPS PT616 14"',             459.00,  1, 'CINZA TRA.', '10 kg',   '110/220', 'closed caption/SAP',        'Visual moderno. Autovolume. Bloqueio de canais. Potência 2 x 3 Watts RMS estéreo.',                              '14"',        3, 10),
    (20, 'TELEVISOR SEMPTOSHIBA 3888BP 37"',       3399.00,  1, 'PRETO',      '64 kg',   '110/220', 'tela plana/close caption/PIP', 'Channel Guide. Entrada S-Video. Comb Filter.',                                                               '37"',        3, 12),
    (21, 'TELEVISOR PHILIPS FD 9932',             28999.00,  1, 'CINZA',      '42,5 kg', '110/220', 'tela plana/close caption/PIP', 'Alto contraste. Tela anti-reflexo. Sistema de 6 alto-falantes. 2 x 7W RMS.',                                '42"',        3, 10),
    (22, 'DVD LG 3230N',                           499.00,   1, 'PRATA',      '3,5 kg',  '110/220', 'closed caption/região 4',   'Resolução de 720 linhas. Surround Spatializer N-2-2. Zoom 4x e 16x. Saída Vídeo Componente.',                   '720 linhas', 4, 8),
    (23, 'DVD GRADIENTE D-10',                     499.00,   1, 'PRATA',      '3,36 kg', '110/220', 'closed caption/região 4',   'Menu em 5 idiomas. Dolby Digital. 6 canais de som independentes. Efeitos especiais.',                           '720 linhas', 4, 13),
    (24, 'DVD PHILIPS 703ES',                      559.00,   1, 'CINZA',      '4 kg',    '110/220', 'closed caption/região 4',   'TruSurround som 3D. Reproduz DVD, vídeo CD e áudio CD. Saída Vídeo Componente.',                                '500 linhas', 4, 10),
    (25, 'DVD SONY DVP S560D',                     879.00,   1, 'CINZA',      '2,9 kg',  '110/220', 'closed caption/região 4',   'Decodificador Dolby Digital. Saídas 5.1 canais. Resolução 720 linhas.',                                         '720 linhas', 4, 7),
    (26, 'DVD SONY DVP-S360D',                     659.00,   1, 'PRATA',      '2,8 kg',  '110/220', 'closed caption/região 4',   'Digital Cinema Sound com 4 modos. Dolby Digital. Conversor 24 bit/96 kHz. Saída Vídeo Componente.',             '500 linhas', 4, 7),
    (27, 'VIDEOCASSETE LG BC-490B',                319.00,   1, 'CINZA MET.', '3,4 kg',  '110/220', 'auto-tracking',             'Modelo Millenium. Melhora de qualidade da imagem. Rebobinamento em 60 segundos.',                               '5 cabeças',  5, 8),
    (28, 'VIDEOCASSETE PHILIPS VR 410',            329.00,   1, 'CINZA',      '3,8 kg',  '110/220', 'auto-tracking',             'Câmera lenta reversa. Reprodução instantânea. Código de índice automático.',                                    '5 cabeças',  5, 10),
    (29, 'VIDEOCASSETE SEMPTOSHIBA VCX-687',       359.00,   1, 'CINZA',      '3,4 kg',  '110/220', 'auto-tracking',             'Câmera lenta. Skip de comerciais. Programação para 8 gravações/ano.',                                           '5 cabeças',  5, 12),
    (30, 'VIDEOCASSETE PANASONIC NV-FJ615BR',      379.00,   1, 'PRATA',      '3,3 kg',  '110/220', 'estéreo HI-FI',             'Som estéreo de alta fidelidade. Busca super rápida. Programação de até 16 gravações em 1 mês.',                  '7 cabeças',  5, 11),
    (31, 'VIDEOCASSETE LG BC-991B',                359.00,   1, 'CINZA MET.', '3,4 kg',  '110/220', 'estéreo HI-FI',             'Permite repetir cenas. Salto de comerciais. Rebobinamento em 60 segundos.',                                     '7 cabeças',  5, 8),
    (32, 'VIDEOCASSETE SONY SLV-EX8BR',            399.00,   1, 'CINZA',      '4 kg',    '110/220', 'estéreo HI-FI/auto-tracking','Grava em 6 horas com qualidade de 2 horas. Localização automática do início de cada gravação.',                '7 cabeças',  5, 7),
    (33, 'VIDEOCASSETE SEMPTOSHIBA VCX-688',       408.00,   1, 'PRATA',      '3,4 kg',  '110/220', 'estéreo HI-FI/auto-tracking','Câmera lenta. Salto de comerciais. Anel Shuttle. Gravação até 1 ano de antecedência.',                         '7 cabeças',  5, 12),
    (34, 'DISCMAN CCE DM-1100 AZ',                 139.00,   0, 'AZUL',       '0,9 kg',  '-',       'com fone de ouvido',        'Proteção antichoque 10s. Bass boost. Sistema lock/unlock. Display LCD.',                                         '-',          6, 6),
    (35, 'DISCMAN PHILIPS AX-1001 LS',             169.00,   0, 'CINZA MET.', '0,8 kg',  '-',       'com fone de ouvido',        'Resiste a altas temperaturas. Reforço de graves digital. Toca CDs regraváveis.',                                 '-',          6, 10),
    (36, 'DISCMAN SONY DFJ-63',                    369.00,   0, 'GRAFITE',    '1 kg',    '-',       'com fone de ouvido',        'G-Protection. 30 estações. Sintonizador digital. 32 horas de reprodução contínua.',                              '-',          6, 8),
    (37, 'DISCMAN SONY D-E201',                    209.00,   0, 'CINZA MET.', '1,1 kg',  '-',       'com fone de ouvido',        'Até 15 horas de reprodução contínua. Reforço de graves digital. Volume digital.',                                '-',          6, 8),
    (38, 'HOME THEATER YAMAHA YHT1 B4',           1799.00,   1, 'PRETO',      '-',       '110/220', 'Dolby Digital',             'Receiver RXV-396. Cinema DSP. 6 canais. 40 emissoras AM/FM. Subwoofer ativo 50W RMS.',                          '60X5 RMS',   7, 14),
    (39, 'HOME THEATER CCE DCS-57 RX',             919.00,   1, 'PRATA',      '24,5 kg', '110/220', 'Dolby',                     'Amplificador de áudio 3D. Subwoofer com amplificador incorporado. Surround 4 modos.',                            '6000 PMPO',  7, 6),
    (40, 'HOME THEATER SONY DAV-S300',            2299.00,   1, 'CINZA',      '3,8 kg',  '110/220', 'Dolby',                     'DVD, receiver e 6 caixas acústicas integrados. Dolby Digital e DTS. 30 x 6 Watts RMS.',                         '30X30 RMS',  7, 7),
    (41, 'WALKMAN COUGAR CPC 60',                   69.00,   0, 'PRETO',      '0,7 kg',  '-',       'com fone de ouvido',        'Tape deck com parada automática. Reforço de graves. Rádio AM/FM. Relógio e alarme.',                             '-',          8, 4),
    (42, 'WALKMAN COUGAR CPC 50',                   24.50,   0, 'CINZA',      '0,8 kg',  '-',       'com fone de ouvido',        'Simples e fácil de usar. Rádio AM/FM.',                                                                          '-',          8, 4),
    (43, 'WALKMAN AIWA TX409',                      99.00,   0, 'PRATA',      '0,9 kg',  '-',       'com fone de ouvido',        'Sintonia digital FM/AM. Memória para 30 emissoras. Relógio. Display LCD.',                                       '-',          8, 5),
    (44, 'AUTO-RÁDIO JVC KD - S577',               399.00,   0, 'CINZA ESC.', '2 kg',    '-',       'CD Player',                 'Display com acesso direto às faixas. 3 modos de som pré-ajustados.',                                             '40 X 4 RMS', 9, 15),
    (45, 'AUTO-RÁDIO SONY CDX - L477X',            459.00,   1, 'PRETO',      '1,2 kg',  '-',       'CD Player',                 'Relógio digital. Sintonizador SSIR-EX com 30 memórias. Painel destacável. Controle remoto.',                     '50 X 4 RMS', 9, 7),
    (46, 'AUTO-RÁDIO CCE CM-88X',                  339.00,   0, 'CINZA',      '1,5 kg',  '-',       'CD Player',                 'Display LCD multifunções. 3 equalizações. Relógio digital. Sintonia Digital AM/FM.',                             '35 X 4 RMS', 9, 6),
    (47, 'AUTO-RÁDIO JVC KDSX-650',                429.00,   1, 'PRETO',      '1,6 kg',  '-',       'CD Player/CD-RW/CD-R',      'Controlador de disqueteira. 720 minutos ininterruptos de música. 3 equalizações pré-programadas.',               '40 X 4 RMS', 9, 15),
    (48, 'AUTO-RÁDIO LENOXX LX 452 LS',            299.00,   0, 'CINZA',      '1,8 kg',  '-',       'CD Player',                 'Equalizador pré-programado. Display LCD multi-colorido. 12 memórias AM e 18 FM.',                               '30 X 4 RMS', 9, 16),
    (49, 'TOCA-FITAS COUGAR CAR 215',               69.90,   0, 'PRETO',      '-',       '-',       'Toca-fitas',                'Rádio AM/FM. Auto-Stop. Controles de Loudness.',                                                                 '-',          9, 3),
    (50, 'TOCA-FITAS LENOXX LX-400',               64.50,   0, 'PRETO',      '-',       '-',       'Toca-fitas',                'Iluminação noturna. Auto-Stop. Controle de tonalidade. AM/FM estéreo.',                                          '2 X 7 RMS',  9, 16),
    (51, 'TOCA-FITAS PRECISION PSC595',             84.50,   0, 'PRETO',      '-',       '-',       'Toca-fitas',                'AM/FM estéreo. Auto-stop. Controle de volume. Frente destacável.',                                               '-',          9, 17),
    (52, 'TOCA-FITAS SONY XR - C2 607',            269.90,   0, 'PRETO',      '-',       '-',       'Toca-fitas/Saída Amplificada','Controlador de CD/MD Changer. D-Bass reforço de graves.',                                                     '30 X 4 RMS', 9, 7),
    (53, 'TOCA-FITAS LENOXX LX410',                106.40,  0, 'PRETO',      '1,7 kg',  '-',       'Toca-fitas',                'Iluminação noturna. Auto-Stop. Display digital. Entrada auxiliar para CD. Painel destacável.',                   '2 X 7 RMS',  9, 16);