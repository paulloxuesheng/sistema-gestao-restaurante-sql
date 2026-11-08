CREATE DATABASE restaurante;

USE restaurante;

CREATE TABLE funcionarios(
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    cargo VARCHAR(100),
    salario DECIMAL(10,2),
    data_admissao DATE
);

CREATE TABLE clientes(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE
);

CREATE TABLE produtos(
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10,2),
    categoria VARCHAR(100)
);

CREATE TABLE pedidos(
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_funcionario INT,
    id_produto INT,
    quantidade INT,
    preco DECIMAL(10,2),
    data_pedido DATE,
    status VARCHAR (50),

    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE info_produtos(
    id_info INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    ingredientes TEXT,
    fornecedor VARCHAR(255),

    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- SHOW TABLES;
-- DESC pedidos;

