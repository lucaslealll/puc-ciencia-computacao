CREATE DATABASE IF NOT EXISTS db_aereo;

USE db_aereo;

DROP TABLE IF EXISTS escala;
DROP TABLE IF EXISTS equipe_voo;
DROP TABLE IF EXISTS programacao;
DROP TABLE IF EXISTS aeronave;
DROP TABLE IF EXISTS tripulante;
DROP TABLE IF EXISTS administrativo;
DROP TABLE IF EXISTS voo;
DROP TABLE IF EXISTS aeroporto;
DROP TABLE IF EXISTS base;
DROP TABLE IF EXISTS tipo_aeronave;
DROP TABLE IF EXISTS cargo;
DROP TABLE IF EXISTS companhia;

CREATE TABLE cargo 
(
  	cod_cargo 	NUMERIC(2) 	NOT NULL,
  	nom_cargo 	VARCHAR(20) 	NOT NULL,
	
	CONSTRAINT pk_cargo
  		PRIMARY KEY(cod_cargo)
)engine="innodb";

CREATE TABLE tipo_aeronave (
  	cod_tipo_aeronave VARCHAR(6) 		NOT NULL,
  	dsc_tipo_aeronave VARCHAR(20)  	NOT NULL,

	CONSTRAINT pk_tipo_aeronave
  		PRIMARY KEY(cod_tipo_aeronave)
)engine="innodb";

CREATE TABLE base (
  cod_base NUMERIC(3) 	NOT NULL,
  nom_base VARCHAR(30) 	NOT NULL,
  ind_base CHAR(1) 		NOT NULL,

  CONSTRAINT pk_base	
  	PRIMARY KEY(cod_base)
)engine="innodb";

CREATE TABLE aeroporto (
  	cod_aeroporto VARCHAR(3) 	NOT NULL,
  	nom_aeroporto VARCHAR(30) 	NOT NULL,
  	nom_cidade VARCHAR(25) 		NOT NULL,

	CONSTRAINT pk_aeroporto
  		PRIMARY KEY(cod_aeroporto)
)engine="innodb";

CREATE TABLE voo (
	num_voo 						NUMERIC(3) 		NOT NULL,
  	cod_aeroporto_origem 	VARCHAR(3) 		NOT NULL,
  	cod_aeroporto_destino 	VARCHAR(3) 		NOT NULL,
  	vlr_distancia 				NUMERIC(6) 		NOT NULL,
  	vlr_preco 					NUMERIC(6,2)	NOT NULL,

	CONSTRAINT pk_voo
  		PRIMARY KEY(num_voo),

	CONSTRAINT fk_voo_aeroporto_origem
  		FOREIGN KEY(cod_aeroporto_origem)
    	REFERENCES aeroporto(cod_aeroporto)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT,

	CONSTRAINT fk_voo_aeroporto_destino
  		FOREIGN KEY(cod_aeroporto_destino)
    	REFERENCES aeroporto(cod_aeroporto)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT
)engine="innodb";

CREATE TABLE tripulante (
  	cod_tripulante 		VARCHAR(5) 	NOT NULL,
  	cod_cargo 				NUMERIC(2) 	NOT NULL,
  	cod_base 				NUMERIC(3) 	NOT NULL,
  	nom_tripulante 		VARCHAR(30) NOT NULL,
  	dat_admissao 			DATE 			NOT NULL,

	CONSTRAINT pk_tripulante
  		PRIMARY KEY(cod_tripulante),

	CONSTRAINT fk_tripulante_base
  		FOREIGN KEY(cod_base)
    	REFERENCES base(cod_base)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT,

	CONSTRAINT fk_tripulante_cargo
  		FOREIGN KEY(cod_cargo)
    	REFERENCES cargo(cod_cargo)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT
)engine="innodb";

CREATE TABLE administrativo (
  	cod_administrativo 		VARCHAR(5) 	NOT NULL,
  	cod_cargo 				NUMERIC(2) 	NOT NULL,
  	cod_base 				NUMERIC(3) 	NOT NULL,
  	nom_administrativo 		VARCHAR(30) NOT NULL,
  	dat_admissao 			DATE 			NOT NULL,

	CONSTRAINT pk_administrativo
  		PRIMARY KEY(cod_administrativo),

	CONSTRAINT fk_administrativo_base
  		FOREIGN KEY(cod_base)
    	REFERENCES base(cod_base)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT,

	CONSTRAINT fk_administrativo_cargo
  		FOREIGN KEY(cod_cargo)
    	REFERENCES cargo(cod_cargo)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT
)engine="innodb";


CREATE TABLE aeronave (
  	num_prefixo 		VARCHAR(6) 	NOT NULL,
  	cod_tipo_aeronave VARCHAR(6) 	NOT NULL,
  	cod_base 			NUMERIC(3) 	NOT NULL,
  	dat_aquisicao 		DATE 			NOT NULL,

	CONSTRAINT pk_aeronave
  		PRIMARY KEY(num_prefixo),

	CONSTRAINT fk_aeronave_base
  		FOREIGN KEY(cod_base)
    	REFERENCES base(cod_base)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT,

	CONSTRAINT fk_aeronave_tipo_aeronave
  		FOREIGN KEY(cod_tipo_aeronave)
    	REFERENCES tipo_aeronave(cod_tipo_aeronave)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT
)engine="innodb";

CREATE TABLE programacao (
	num_voo 			NUMERIC(3) 	NOT NULL,
  	dat_voo 			DATE 			NOT NULL,
  	num_prefixo 		VARCHAR(6) 	NOT NULL,

	CONSTRAINT pk_programacao
  		PRIMARY KEY(num_voo, dat_voo),

	CONSTRAINT fk_programacao_voo
  		FOREIGN KEY(num_voo)
    	REFERENCES voo(num_voo)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT,

	CONSTRAINT fk_programacao_aeronave
  		FOREIGN KEY(num_prefixo)
    	REFERENCES aeronave(num_prefixo)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT
)engine="innodb";

CREATE TABLE equipe_voo (
  	num_voo 					NUMERIC(3) 	NOT NULL,
  	dat_voo 					DATE 			NOT NULL,
  	cod_tripulante 			VARCHAR(5) 	NOT NULL,

	CONSTRAINT pk_equipe_voo
  		PRIMARY KEY(num_voo, dat_voo, cod_tripulante),
	CONSTRAINT fk_equipe_voo_tripulante
  		FOREIGN KEY(cod_tripulante)
    	REFERENCES tripulante(cod_tripulante)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT,
	CONSTRAINT fk_equipe_voo_programacao
  		FOREIGN KEY(num_voo, dat_voo)
    	REFERENCES programacao(num_voo, dat_voo)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT
)engine="innodb";

CREATE TABLE escala (
  	num_escala 		INTEGER 			NOT NULL,
  	num_voo 			NUMERIC(3) 		NOT NULL,
  	dat_voo 			DATE 				NOT NULL,
  	cod_aeroporto 	VARCHAR(3) 		NOT NULL,
  	hor_prevista_chegada 	TIME 	NOT NULL,
  	hor_prevista_saida 		TIME 	NOT NULL,

	CONSTRAINT pk_escala
  		PRIMARY KEY(num_escala, num_voo, dat_voo),

	CONSTRAINT fk_escala_aeroporto
  		FOREIGN KEY(cod_aeroporto)
    	REFERENCES aeroporto(cod_aeroporto)
      	ON DELETE RESTRICT
     	 	ON UPDATE RESTRICT,

	CONSTRAINT fk_escala_programacao
  		FOREIGN KEY(num_voo, dat_voo)
    	REFERENCES programacao(num_voo, dat_voo)
      	ON DELETE RESTRICT
      	ON UPDATE RESTRICT
)engine="innodb";

ALTER TABLE aeroporto ADD
(
	sig_uf 				VARCHAR(2)			NOT NULL,
	nom_pais			VARCHAR(20)			NOT NULL,
	vlr_fuso_horario 	NUMERIC(2)			NOT NULL
);

ALTER TABLE tripulante 
	ADD vlr_salario NUMERIC(8,2) DEFAULT 1000 NOT NULL;

ALTER TABLE tripulante 
	ADD CONSTRAINT ck_tripulante_vlr_salario CHECK (vlr_salario BETWEEN 1000 AND 2000);

CREATE TABLE companhia
(
	cod_companhia 	NUMERIC(3)		NOT NULL,
	nom_companhia	VARCHAR(30)		NOT NULL,
	sig_companhia 	VARCHAR(5)		NOT NULL,
	
	CONSTRAINT pk_companhia 
		PRIMARY KEY(cod_companhia)
        
) engine=innodb;

ALTER TABLE aeronave ADD
(
	cod_companhia NUMERIC(3) NOT NULL
);
ALTER TABLE aeronave ADD
(
	CONSTRAINT fk_aeronave_companhia 
		FOREIGN KEY(cod_companhia)
		REFERENCES companhia(cod_companhia)
) ;

ALTER TABLE tripulante DROP COLUMN vlr_salario;

ALTER TABLE tripulante 
	ADD vlr_salario NUMERIC(8,2)	DEFAULT 1000 NOT NULL;

ALTER TABLE administrativo 
	ADD vlr_salario NUMERIC(8,2)	DEFAULT 1000 NOT NULL;

INSERT INTO cargo (cod_cargo, nom_cargo) VALUES
(1, 'PILOTO'),
(2, 'COMISSARIO'),
(3, 'ASSISTENTE'),
(4, 'DESPACHANTE');

INSERT INTO companhia (cod_companhia, nom_companhia, sig_companhia) VALUES
('1', 'X GOL', 'GOL'),
('2', 'Y VAR', 'VARIG'),
('3', 'Z TAM', 'TAM'),
('4', 'W AZUL', 'AZUL');

INSERT INTO base (cod_base, nom_base, ind_base) VALUES
(1, 'ALCANTARA', 'D'),
(2, 'SANTOS', 'D'),
(3, 'SAO SEBASTIAO', 'M'),
(4, 'SAO JOSE', 'M');

INSERT INTO tipo_aeronave (cod_tipo_aeronave, dsc_tipo_aeronave) VALUES
('AB4000', 'AIR BUS 4000'),
('AB6000', 'AIR BUS 6000'),
('BG7377', 'BOEING 737-700'),
('BG7373', 'BOEING 737-300');

INSERT INTO tripulante(cod_tripulante, cod_cargo, cod_base, nom_tripulante, dat_admissao, vlr_salario) VALUES
('MS667', 1, 1, 'JOAO DA SILVA', '1979-10-01', 7500.00),
('OR003', 1, 2, 'PEDRO UBIRAJARA', '1978-12-05', 4500.00),
('AP128', 2, 3, 'RICARDO ALMEIDA', '1995-07-15', 3000.00),
('AS459', 2, 3, 'PAULO HENRIQUE', '1991-01-15', 4000.00),
('AA005', 2, 2, 'MARIA LUIZA', '2000-06-01', 1800.00);

INSERT INTO administrativo(cod_administrativo, cod_cargo, cod_base, nom_administrativo, dat_admissao, vlr_salario) VALUES
('MS667', 1, 1, 'JOAO DA SILVA', '1979-10-01', 7500.00),
('OR003', 1, 2, 'PEDRO UBIRAJARA', '1978-12-05', 4500.00),
('AP020', 3, 3, 'ANA MARIA', '2001-07-30', 1890.00),
('AS505', 4, 3, 'LUIZ HENRIQUE', '2002-08-16', 1650.00),
('AA005', 2, 2, 'MARIA LUIZA', '2000-06-01', 1800.00);

INSERT INTO aeronave (num_prefixo, cod_tipo_aeronave, cod_base, dat_aquisicao, cod_companhia) VALUES
('00001', 'AB4000', 4, '2001-01-15', '2'),
('00002', 'AB6000', 4, '2001-01-20', '3'),
('00003', 'BG7377', 3, '2003-01-25', '1'),
('00004', 'BG7373', 3, '2006-01-23', '2');

INSERT INTO aeroporto (cod_aeroporto, nom_aeroporto, nom_cidade, SIG_UF, nom_pais, vlr_fuso_horario) VALUES
('PLU', 'PAMPULHA', 'BELO HORIZONTE', 'XX', 'BRASIL', 9),
('CNF', 'TANCREDO NEVES', 'BELO HORIZONTE', 'XX', 'BRASIL', 9),
('VRC', 'VIRACOPOS', 'CAMPINAS', 'XX', 'BRASIL', 9),
('CGH', 'CONGONHAS', 'SÃO PAULO', 'XX', 'BRASIL', 9),
('SSA', 'LUIS ANTÔNIO CARLOS', 'SALVADOR', 'XX', 'BRASIL', 9),
('PRE', 'SALGADO FILHO', 'PORTO ALEGRE', 'XX', 'BRASIL', 9),
('GRU', 'FRANCO MONTORO', 'GUARULHOS', 'XX', 'BRASIL', 9);

INSERT INTO voo (num_voo, cod_aeroporto_origem, cod_aeroporto_destino, vlr_distancia, vlr_preco) VALUES
(1, 'PLU', 'PRE', 800, 350.00),
(2, 'VRC', 'SSA', 1200, 450.00),
(3, 'CGH', 'VRC', 250, 150.00),
(4, 'SSA', 'CGH', 1100, 400.00),
(5, 'PRE', 'PLU', 1600, 500.00),
(6, 'PRE', 'SSA', 2400, 650.00),
(7, 'SSA', 'VRC', 1200, 450.00),
(8, 'VRC', 'CGH', 250, 150.00),
(9, 'CGH', 'SSA', 1100, 400.00),
(10, 'PLU', 'VRC', 400, 200.00);

INSERT INTO programacao (num_voo, dat_voo, num_prefixo) VALUES
(4, '2006-02-01', '00001'),
(4, '2004-01-02', '00001'),
(4, '2005-02-22', '00001'),
(2, '2004-01-03', '00002'),
(5, '2007-01-03', '00004');

INSERT INTO equipe_voo (num_voo, dat_voo, cod_tripulante) VALUES
(2, '2004-01-03', 'MS667'),
(2, '2004-01-03', 'OR003'),
(2, '2004-01-03', 'AP128'),
(4, '2004-01-02', 'OR003'),
(4, '2004-01-02', 'AS459'),
(4, '2005-02-22', 'OR003'),
(4, '2005-02-22', 'AP128'),
(4, '2006-02-01', 'MS667'),
(4, '2006-02-01', 'AP128');

INSERT INTO escala (num_escala, num_voo, dat_voo, cod_aeroporto, hor_prevista_chegada, hor_prevista_saida) VALUES
(1, 2, '2004-01-03', 'CGH', '13:00:00', '14:00:00'),
(2, 2, '2004-01-03', 'PLU', '15:00:00', '15:30:00'),
(1, 4, '2006-02-01', 'CGH', '17:00:00', '18:00:00'),
(2, 4, '2006-02-01', 'CNF', '19:00:00', '19:30:00');

UPDATE tripulante 
SET 
    vlr_salario = 1200.50
WHERE
    cod_tripulante = 'MS667';

UPDATE tripulante 
SET 
    vlr_salario = 1000.00
WHERE
    cod_tripulante = 'OR003';

UPDATE tripulante 
SET 
    vlr_salario = 1456.00
WHERE
    cod_tripulante = 'AP128';

UPDATE tripulante 
SET 
    vlr_salario = 1250.00
WHERE
    cod_tripulante = 'AS459';

UPDATE aeronave 
SET 
    cod_companhia = '4'
WHERE
    num_prefixo = '00001';

UPDATE aeronave 
SET 
    cod_companhia = '3'
WHERE
    num_prefixo = '00002';

UPDATE aeronave 
SET 
    cod_companhia = '2'
WHERE
    num_prefixo = '00003';

UPDATE aeronave 
SET 
    cod_companhia = '1'
WHERE
    num_prefixo = '00004';

UPDATE aeroporto 
SET 
    sig_uf = 'SP',
    vlr_fuso_horario = 0
WHERE
    cod_aeroporto = 'CGH';

UPDATE aeroporto 
SET 
    sig_uf = 'MG',
    vlr_fuso_horario = 0
WHERE
    cod_aeroporto = 'CNF';

UPDATE aeroporto 
SET 
    sig_uf = 'SP',
    vlr_fuso_horario = 0
WHERE
    cod_aeroporto = 'GRU';

UPDATE aeroporto 
SET 
    sig_uf = 'MG',
    vlr_fuso_horario = 0
WHERE
    cod_aeroporto = 'PLU';

UPDATE aeroporto 
SET 
    sig_uf = 'RS',
    vlr_fuso_horario = - 1
WHERE
    cod_aeroporto = 'PRE';

UPDATE aeroporto 
SET 
    sig_uf = 'BA',
    vlr_fuso_horario = 0
WHERE
    cod_aeroporto = 'SSA';

UPDATE aeroporto 
SET 
    sig_uf = 'SP',
    vlr_fuso_horario = 0
WHERE
    cod_aeroporto = 'VRC';

INSERT INTO aeroporto (cod_aeroporto, nom_aeroporto, nom_cidade, SIG_UF, nom_pais, vlr_fuso_horario) VALUES
('LON', 'AI LONDRES', 'LONDRES', 'NA', 'INGLATERRA', 3),
('PAR', 'AI PARIS', 'PARIS', 'NA', 'FRANCA', 5),
('LIS', 'AI PORTUGAL', 'LISBOA', 'NA', 'PORTUGAL', 4),
('ROM', 'AI ITALIA', 'ROMA', 'NA', 'ITALIA', 2);

INSERT INTO voo (num_voo, cod_aeroporto_origem, cod_aeroporto_destino, vlr_distancia, vlr_preco) VALUES
(11, 'GRU', 'LIS', 3400, 1400.00),
(12, 'GRU', 'PAR', 3600, 1600.00),
(13, 'LIS', 'GRU', 3400, 1400.00),
(14, 'ROM', 'CNF', 3800, 1700.00);


