DROP DATABASE IF EXISTS loja;-- cria tabela 
CREATE DATABASE loja;
USE loja;

-- drop table if exists usuario;
-- drop table if exists produto;
-- drop table if exists categoria_produto;
-- drop table if exists pedido;
-- drop table if exists pedido_produto;
-- drop table if exists categoria;
-- drop table if exists pagamento;
-- drop table if exists situação;

-- cria tabela usuario
CREATE TABLE usuario (
	num_cpf 		CHAR(11) 		NOT NULL, -- PK
	nom_usuario 	VARCHAR(45),
	nom_endereco 	VARCHAR(45),
	num_cep 		CHAR(8),
	nom_email 		VARCHAR(45),
	num_telefone	CHAR(11),
	saldo 			DECIMAL(8,2),
  
	flag_vendedor 		TINYINT,
	flag_comprador 		TINYINT,
	flag_loja_oficial 	TINYINT,

	-- definição da chave primária
	CONSTRAINT pk_usuario PRIMARY KEY(num_cpf)
  
) ENGINE = "InnoDB";

-- cria tabela produto
CREATE TABLE produto (
	cod_produto			INT, -- Chave artificial -- PK -- AK
	nom_titulo 			CHAR(30),
	txt_descricao		TEXT(2000),
	num_preco			DECIMAL(8,2),
	num_quantidade		INT(8),
	nom_categoria		CHAR(20),
	dat_expiracao		DATE,
	num_qtd_disponivel	INT,
	usuario_num_cpf		CHAR(11), -- FK
    
    -- definição da chave primária
    CONSTRAINT pk_produto PRIMARY KEY(cod_produto),
	
    -- definição da chave estrangeira
    CONSTRAINT fk_produto_usuario
		FOREIGN KEY(usuario_num_cpf) REFERENCES usuario(num_cpf)
        
) ENGINE = "InnoDB";

-- cria tabela categoria
CREATE TABLE categoria (
	cod_categoria 		INT, -- PK
    nom_categoria 		VARCHAR(45),
    
    -- definição da chave primária
    CONSTRAINT pk_categoria PRIMARY KEY(cod_categoria)
    
) ENGINE = "InnoDB";

-- cria tabela categoria_produto
CREATE TABLE categoria_produto (
	categoria_cod_categoria 	INT, -- PK -- FK
	produto_cod_produto			INT, -- PK -- FK
        
	-- definição da chave primária
    CONSTRAINT pk_categoria_produto
		PRIMARY KEY(categoria_cod_categoria, produto_cod_produto),

    -- definição da chave estrangeira
    -- o código da categoria do protudo faz referencia à cod_categoria da tabela categoria
    CONSTRAINT fk_categoria_produto_categoria
		FOREIGN KEY (categoria_cod_categoria) REFERENCES categoria(cod_categoria),
    
    -- definição da chave estrangeira
    -- o código do produto faz referencia ao cod_produto da tabela produto
	CONSTRAINT fk_categoria_produto_produto
		FOREIGN KEY (produto_cod_produto) REFERENCES produto(cod_produto)
        
) ENGINE = "InnoDB";

-- cria tabela pedido
CREATE TABLE pedido (
    cod_pedido		INT,	-- PK
    usuario_num_cpf CHAR(11),

	-- definição da chave primária
    CONSTRAINT pk_pedido PRIMARY KEY(cod_pedido),

    -- definição da chave estrangeira
    CONSTRAINT fk_pedido_usuario
        FOREIGN KEY(usuario_num_cpf) REFERENCES usuario(num_cpf)
        
) ENGINE = "InnoDB";

-- cria tabela pedido_produto
CREATE TABLE pedido_produto (
    pedido_cod_pedido	INT,	-- PK
    produto_cod_produto	INT,	-- FK
    qtd_produto			INT,	-- FK
    
    CONSTRAINT pk_pedido_produto
		PRIMARY KEY(pedido_cod_pedido, produto_cod_produto),

    -- definição da chave estrangeira
    CONSTRAINT fk_pedido_produto_pedido
        FOREIGN KEY(pedido_cod_pedido) REFERENCES pedido(cod_pedido),

    -- definição da chave estrangeira
    CONSTRAINT fk_pedido_produto_produto
        FOREIGN KEY(produto_cod_produto) REFERENCES produto(cod_produto)    
        
) ENGINE = "InnoDB";

-- cria tabela situacao
CREATE TABLE situacao (
	cod_situacao TINYINT,	-- PK
    nom_status 	VARCHAR(90),

	CONSTRAINT pk_situacao PRIMARY KEY (cod_situacao)
    
) ENGINE = "InnoDB";

-- cria tabela pagamento
CREATE TABLE pagamento (
	pedido_cod_pedido		INT,	-- PK -- FK
	num_valor_total			DECIMAL(8,2),
	data_compra 			DATE,
	data_pagamento			DATE,
	nom_status				TINYINT,
	situacao_cod_situacao	TINYINT, -- FK

	CONSTRAINT pk_pagamento PRIMARY KEY (pedido_cod_pedido),

    -- definição da chave estrangeira
	CONSTRAINT fk_pagamento_pedido
		FOREIGN KEY (pedido_cod_pedido) REFERENCES	pedido(cod_pedido),

    -- definição da chave estrangeira
	CONSTRAINT fk_pagamento_situacao
		FOREIGN KEY (situacao_cod_situacao) REFERENCES	situacao(cod_situacao)
        
) ENGINE = "InnoDB";
