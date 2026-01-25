CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    Clientestelefone VARCHAR(20)
);

INSERT INTO Clientes (id_cliente, nome, telefone)
VALUES (1, 'Ana Oliveira', '(11) 91234-5678');

INSERT INTO Clientes (id_cliente, nome, telefone)
VALUES (2, 'Paula Silva', '(11) 91234-4000');

SELECT * FROM Clientes;

CREATE TABLE Fornecedores (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

INSERT INTO Fornecedores (id_fornecedor, nome, telefone) VALUES
(1, 'Papelaria Central', '(11) 91234-5678'),
(2, 'Fornecedora ABC', '(21) 98888-1122'),
(3, 'Distribuidora XYZ', '(31) 97654-3210');

SELECT * FROM Fornecedores;

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

INSERT INTO Produtos (id_produto, nome, preco, id_fornecedor) VALUES
(1, 'Caderno Universitário', 19.90, 1),
(2, 'Caneta Azul', 2.50, 2),
(3, 'Lápis HB', 1.20, 3),
(4, 'Apontador', 3.00, 1);

SELECT * FROM Produtos;

CREATE TABLE Vendas (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

INSERT INTO Vendas (id_venda, id_produto, quantidade, data_venda) VALUES
(1, 1, 5, '2025-10-01'),
(2, 2, 20, '2025-10-02'),
(3, 3, 15, '2025-10-03'),
(4, 1, 2, '2025-10-05');

SELECT * FROM Vendas;
