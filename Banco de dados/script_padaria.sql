-- CRIAÇÃO DAS TABELAS
CREATE TABLE Produtos (
    id INT PRIMARY KEY,
    nome_produto VARCHAR(50),
    preco_unitario DECIMAL(10,2),
    estoque INT
);

CREATE TABLE Vendas (
    id INT PRIMARY KEY,
    produto_id INT,
    quantidade INT,
    data_venda DATE,
    valor_total DECIMAL(10,2)
);

CREATE TABLE Faixas_Preco (
    id INT PRIMARY KEY,
    categoria VARCHAR(20),
    preco_minimo DECIMAL(10,2),
    preco_maximo DECIMAL(10,2)
);

-- INSERÇÃO DE DADOS
INSERT INTO Produtos VALUES
(1, 'Pão Francês', 0.50, 100),
(2, 'Bolo de Chocolate', 25.00, 15),
(3, 'Queijo Mussarela', 18.00, 45),
(4, 'Croissant', 3.50, 25),
(5, 'Leite Integral', 5.00, 80),
(6, 'Café Especial', 35.00, 10),  
(7, 'Brigadeiro', 2.00, 60);

INSERT INTO Vendas VALUES
(1, 1, 10, '2024-01-15', 5.00),
(2, 2, 2, '2024-01-15', 50.00),
(3, 3, 5, '2024-01-16', 90.00),
(4, 4, 8, '2024-01-16', 28.00),
(5, 1, 15, '2024-01-17', 7.50),
(6, 5, 10, '2024-01-17', 50.00),
(7, 2, 1, '2024-01-18', 25.00);

INSERT INTO Faixas_Preco VALUES
(1, 'Barato', 0.00, 5.00),
(2, 'Intermediário', 5.01, 20.00),
(3, 'Caro', 20.01, 100.00);

-- PRODUTOS E VENDAS
SELECT 
    p.id AS id_produto,
    p.nome_produto,
    COUNT(v.id) AS total_vendas
FROM 
    Produtos p
LEFT JOIN 
    Vendas v ON p.id = v.produto_id
GROUP BY 
    p.id, p.nome_produto
ORDER BY 
    p.id;
    
    -- CLASSIFICAÇÃO POR PREÇO
SELECT 
    p.id AS id_produto,
    p.nome_produto,
    p.preco_unitario,
    f.categoria AS faixa_preco
FROM 
    Produtos p
JOIN 
    Faixas_Preco f
    ON p.preco_unitario BETWEEN f.preco_minimo AND f.preco_maximo
ORDER BY 
    p.preco_unitario;
    
    -- Consultas Usando Funções de Linha Única
    
SELECT 
    nome_produto,
    UPPER(nome_produto) AS Nome_Maiusculo,
    LOWER(nome_produto) AS Nome_Minusculo,
    LEN(nome_produto) AS Qtde_Letras,
    LEFT(nome_produto, 3) AS Primeiras_3_Letras,
    ROUND(preco_unitario, 0) AS Preco_Arredondado,
    GETDATE() AS Data_Atual
FROM Produtos;

