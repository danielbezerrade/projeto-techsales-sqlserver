-- Criando DATABASE
CREATE DATABASE TechSales;


-- Utilizando DATABASE 'TechSales'
USE TechSales;

-- TABELA CLIENTES
CREATE TABLE tabela_clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    cidade VARCHAR(25) NOT NULL,
    estado CHAR(2) NOT NULL,
    data_cadastro DATE NOT NULL DEFAULT GETDATE(),
    status_cliente VARCHAR(255) NOT NULL DEFAULT 'INATIVO',
    CONSTRAINT categoria_status_cliente CHECK (status_cliente IN ('ATIVO', 'INATIVO', 'BLOQUEADO'))
);

-- TABELA PRODUTOS (Já criada com os nomes definitivos)
CREATE TABLE produtos (
    id_produto INT IDENTITY(1,1) PRIMARY KEY,
    produto VARCHAR(255) NOT NULL,
    categoria_produto VARCHAR(255) NOT NULL,
    CONSTRAINT regra_categoria_produto CHECK (categoria_produto IN ('INFORMÁTICA', 'PERIFÉRICOS', 'MONITORES', 'ARMAZENAMENTO', 'ACESSÓRIOS')),
    preco MONEY NOT NULL,
    CONSTRAINT regra_preco CHECK (preco >= 0),
    estoque INT NOT NULL,
    CONSTRAINT regra_estoque CHECK (estoque >= 0),
    data_cadastro DATE NOT NULL DEFAULT GETDATE(),
    status_cadastro VARCHAR(255) NOT NULL DEFAULT 'ATIVO',
    CONSTRAINT regra_status_cadastro CHECK (status_cadastro IN ('ATIVO', 'INATIVO', 'PENDENTE'))
);

-- TABELA DE VENDAS (Sem a coluna valor_total)
CREATE TABLE tabela_vendas (
    id_venda INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_venda DATE NOT NULL DEFAULT GETDATE(),
    status_venda VARCHAR(255) NOT NULL DEFAULT 'PENDENTE',
    CONSTRAINT regra_status_venda CHECK (status_venda IN ('CONCLUÍDA', 'PENDENTE', 'CANCELADA')),
    CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente) REFERENCES tabela_clientes(id_cliente)
);

-- TABELA ITENS VENDAS
CREATE TABLE tabela_item_vendas (
    id_item_venda INT IDENTITY(1,1) PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT regra_quantidade CHECK (quantidade > 0),
    preco_unitario MONEY NOT NULL,
    CONSTRAINT regra_preco_unitario CHECK (preco_unitario >= 0),
    CONSTRAINT fk_id_venda FOREIGN KEY (id_venda) REFERENCES tabela_vendas(id_venda),
    CONSTRAINT fk_id_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);






