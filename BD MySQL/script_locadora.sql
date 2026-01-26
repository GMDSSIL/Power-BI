/* BANCO DE DADOS: LOCADORA DE VEÍCULOS */
CREATE DATABASE IF NOT EXISTS Locadora;
USE Locadora;

-- TABELA: CLIENTES
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    Endereco VARCHAR(150)
);

-- TABELA: CATEGORIAS
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY AUTO_INCREMENT,
    NomeCategoria VARCHAR(50) NOT NULL,
    ValorDiaria DECIMAL(10,2) NOT NULL
);

-- TABELA: VEÍCULOS
CREATE TABLE Veiculos (
    VeiculoID INT PRIMARY KEY AUTO_INCREMENT,
    Placa VARCHAR(10) UNIQUE NOT NULL,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano YEAR,
    CategoriaID INT,
    Status ENUM('Disponivel','Alugado','Manutencao') DEFAULT 'Disponivel',
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- TABELA: FUNCIONÁRIOS
CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Cargo ENUM('Atendente','Gerente','Mecanico') NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

-- TABELA: LOCAÇÃO
CREATE TABLE Locacao (
    LocacaoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    VeiculoID INT,
    FuncionarioID INT,
    DataLocacao DATE NOT NULL,
    DataDevolucaoPrevista DATE NOT NULL,
    DataDevolucaoReal DATE,
    ValorTotal DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculos(VeiculoID),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionarios(FuncionarioID)
);

-- TABELA: PAGAMENTOS
CREATE TABLE Pagamentos (
    PagamentoID INT PRIMARY KEY AUTO_INCREMENT,
    LocacaoID INT,
    DataPagamento DATE NOT NULL,
    ValorPago DECIMAL(10,2) NOT NULL,
    Metodo ENUM('Cartao','Dinheiro','Pix','Boleto'),
    FOREIGN KEY (LocacaoID) REFERENCES Locacao(LocacaoID)
);

INSERT INTO Clientes (Nome, CPF, Telefone, Email, Endereco) VALUES
('João Silva', '12345678901', '11987654321', 'joao.silva@email.com', 'Rua A, 100 - São Paulo'),
('Maria Souza', '23456789012', '11965432109', 'maria.souza@email.com', 'Av. B, 200 - Rio de Janeiro'),
('Carlos Pereira', '34567890123', '21988887777', 'carlos.pereira@email.com', 'Rua C, 300 - Belo Horizonte'),
('Ana Oliveira', '45678901234', '31977776666', 'ana.oliveira@email.com', 'Rua D, 400 - Curitiba'),
('Fernanda Lima', '56789012345', '41999998888', 'fernanda.lima@email.com', 'Av. E, 500 - Porto Alegre'),
('Carla Mendes', '22233344455', '11988765432', 'carla.mendes@email.com', 'Rua das Flores, 123 - Centro, São Paulo - SP' ),
('Lucas Pereira', '33344455566', '21976543210', 'lucas.pereira@email.com','Avenida Atlântica, 890 - Copacabana, Rio de Janeiro - RJ' ),
('Fernanda Oliveira', '44455566677', '41987659876', 'fernanda.oliveira@email.com', 'Rua XV de Novembro, 456 - Centro, Curitiba - PR' ),
('Roberto Silva', '55566677788', '31989891234', 'roberto.silva@email.com', 'Avenida Afonso Pena, 321 - Savassi, Belo Horizonte - MG'),
('Ana Costa', '66677788899', '19984442233', 'ana.costa@email.com', 'Rua das Palmeiras, 210 - Jardim Paulista, Campinas - SP' );
 
INSERT INTO Categorias (NomeCategoria, ValorDiaria) VALUES
('Econômico', 100.00),
('Sedan', 150.00),
('SUV', 200.00),
('Hatch', 120.00),
('Pick-up', 220.00),
('Elétrico', 300.00),
('Luxo', 400.00),
('Minivan', 180.00),
('Conversível', 350.00);
 
INSERT INTO Veiculos (Placa, Marca, Modelo, Ano, CategoriaID, Status) VALUES
('ABC1234', 'Fiat', 'Argo', 2020, 4, 'Disponivel'),
('DEF5678', 'Chevrolet', 'Onix', 2021, 4, 'Disponivel'),
('GHI9012', 'Toyota', 'Hilux', 2022, 5, 'Disponivel'),
('JKL3456', 'Honda', 'HR-V', 2021, 3, 'Alugado'),
('MNO7890', 'BMW', '320i', 2022, 2, 'Disponivel'),
('PQR2345', 'Jeep', 'Compass', 2021, 3, 'Disponivel'),
('ABC1D23','Chevrolet', 'Onix', 2021, 4, 'Disponivel'),     
('XYZ9E88','Toyota', 'Hilux',  2020, 5, 'Disponivel'),    
('TESL123','Tesla', 'Tesla Model 3', 2022, 6, 'Disponivel'),
('KLM5F67','Toyota', 'Corolla',  2022, 2, 'Disponivel'), 
( 'JHK8P90','Jeep', 'Compass', 2021, 3, 'Disponivel'),     
('GHJ3L45','Honda', 'Civic', 2023, 2, 'Disponivel'),    
('AAA9Z99','Fiat', 'Strada',  2021, 5, 'Disponivel');
 
INSERT INTO Funcionarios (Nome, Cargo, Telefone, Email) VALUES
('Paulo Mendes', 'Atendente', '11955554444', 'paulo.mendes@locadora.com'),
('Juliana Rocha', 'Gerente', '21944443333', 'juliana.rocha@locadora.com'),
('Roberto Alves', 'Mecânico', '31933332222', 'roberto.alves@locadora.com'),
('Patrícia Gomes', 'Atendente', '11977771122', 'patricia.gomes@locadora.com'),
('João Batista', 'Gerente', '21988883344', 'joao.batista@locadora.com' ),
('Sofia Martins', 'Mecânico', '31966665566', 'sofia.martins@locadora.com'),
('Bruno Ferreira', 'Atendente', '41955557788', 'bruno.ferreira@locadora.com');
 
INSERT INTO Locacao (ClienteID, VeiculoID, FuncionarioID, DataLocacao, DataDevolucaoPrevista, DataDevolucaoReal, ValorTotal) VALUES
(1, 1, 1, '2025-08-01', '2025-08-05', '2025-08-05', 480.00), -- João alugou Fiat Argo
(2, 4, 1, '2025-08-02', '2025-08-06', NULL, 880.00),         -- Maria alugou HR-V (ainda não devolveu)
(3, 3, 2, '2025-08-03', '2025-08-07', '2025-08-08', 900.00), -- Carlos alugou Hilux e devolveu com atraso
(4, 5, 2, '2025-08-04', '2025-08-06', '2025-08-06', 800.00), -- Ana alugou BMW 320i
(6, 7, 2, '2025-01-15', '2025-01-20', '2025-01-20', 500.00),   -- Lucas alugou Onix
(7, 8, 5, '2025-02-01', '2025-02-10', '2025-02-10', 1500.00),  -- Fernanda alugou Hilux
(8, 9, 6, '2025-02-05', '2025-02-07', '2025-02-07', 800.00),   -- Roberto alugou Tesla
(9, 10, 1, '2025-03-01', '2025-03-05', '2025-03-05', 700.00),  -- Ana alugou Corolla
(6, 11, 4, '2025-03-10', '2025-03-15', '2025-03-15', 1200.00); -- Lucas alugou Compass

INSERT INTO Pagamentos (LocacaoID, DataPagamento, ValorPago, Metodo) VALUES
(1, '2025-08-05', 480.00, 'Cartao'),
(2, '2025-08-02', 880.00, 'PIX'),
(3, '2025-08-08', 900.00, 'Dinheiro'),
(4, '2025-08-06', 800.00, 'Cartao'),
(5, '2025-01-15', 500.00, 'Cartão'),
(6, '2025-02-01', 1500.00,'Boleto' ),
(7, '2025-02-05', 800.00, 'Pix'),
(8, '2025-03-01', 700.00,'Cartão'),
(9, '2025-03-10', 1200.00, 'Pix');

SELECT * FROM Clientes;
SELECT * FROM Categorias;
SELECT * FROM Veiculos;
SELECT * FROM Funcionarios;
SELECT * FROM Locacao;
SELECT * FROM Pagamentos;

-- Listando todos os clientes cadastrados.
SELECT * FROM Clientes;

-- Mostrando apenas os veículos que estão disponíveis.
SELECT * FROM Veiculos
WHERE Status = 'Disponivel';

-- Exibindo os nomes e telefones dos funcionários que são Gerentes.
SELECT Nome, Telefone
FROM Funcionarios
WHERE Cargo = 'Gerente';

-- Listando os veículos da categoria SUV.
SELECT V.*
FROM Veiculos V
JOIN Categorias C ON V.CategoriaID = C.CategoriaID
WHERE C.NomeCategoria = 'SUV';

-- Listando todas as locações com: nome do cliente, veículo alugado e data da locação.
SELECT C.Nome AS Cliente, V.Modelo AS Veiculo, L.DataLocacao
FROM Locacao L
JOIN Clientes C ON L.ClienteID = C.ClienteID
JOIN Veiculos V ON L.VeiculoID = V.VeiculoID;

-- Mostrando todas as locações e o nome do funcionário responsável.
SELECT L.LocacaoID, C.Nome AS Cliente, F.Nome AS Funcionario, L.DataLocacao
FROM Locacao L
JOIN Clientes C ON L.ClienteID = C.ClienteID
JOIN Funcionarios F ON L.FuncionarioID = F.FuncionarioID;

-- Exibindo os pagamentos realizados, mostrando o cliente, o veículo e o método de pagamento.
SELECT C.Nome AS Cliente, V.Modelo AS Veiculo, P.Metodo
FROM Pagamentos P
JOIN Locacao L ON P.LocacaoID = L.LocacaoID
JOIN Clientes C ON L.ClienteID = C.ClienteID
JOIN Veiculos V ON L.VeiculoID = V.VeiculoID;

-- Mostrando a quantidade total de veículos cadastrados.
SELECT COUNT(*) AS TotalVeiculos
FROM Veiculos;

-- Contando quantas locações cada cliente já realizou.
SELECT C.Nome AS Cliente, COUNT(L.LocacaoID) AS TotalLocacoes
FROM Locacao L
JOIN Clientes C ON L.ClienteID = C.ClienteID
GROUP BY C.Nome;

-- Mostrando todos os clientes que moram em São Paulo.
SELECT *
FROM Clientes
WHERE Endereco LIKE '%São Paulo%';

-- Listando os veículos que já foram alugados pelo menos uma vez.
SELECT DISTINCT V.*
FROM Veiculos V
JOIN Locacao L ON V.VeiculoID = L.VeiculoID;

-- Calculando a média de valor das locações.
SELECT AVG(ValorTotal) AS MediaValorLocacoes
FROM Locacao;

-- Mostrando o faturamento total por categoria de veículo.
SELECT C.NomeCategoria, SUM(L.ValorTotal) AS FaturamentoTotal
FROM Locacao L
JOIN Veiculos V ON L.VeiculoID = V.VeiculoID
JOIN Categorias C ON V.CategoriaID = C.CategoriaID
GROUP BY C.NomeCategoria
ORDER BY FaturamentoTotal DESC;

-- Exibindo o funcionário que mais registrou locações.
SELECT F.Nome AS Funcionario, COUNT(L.LocacaoID) AS TotalLocacoes
FROM Locacao L
JOIN Funcionarios F ON L.FuncionarioID = F.FuncionarioID
GROUP BY F.Nome
ORDER BY TotalLocacoes DESC
LIMIT 1;

-- Criando uma consulta que mostre o ranking de categorias mais alugadas (em ordem decrescente).
SELECT C.NomeCategoria, COUNT(L.LocacaoID) AS TotalAlugueis
FROM Locacao L
JOIN Veiculos V ON L.VeiculoID = V.VeiculoID
JOIN Categorias C ON V.CategoriaID = C.CategoriaID
GROUP BY C.NomeCategoria
ORDER BY TotalAlugueis DESC;

-- FATURAMENTO MENSAL - MOSTRA O FATURAMENTO TOTAL AGRUPADO POR MÊS
CREATE VIEW FaturamentoMensal AS
SELECT 
    DATE_FORMAT(L.DataLocacao, '%Y-%m') AS MesAno,
    SUM(L.ValorTotal) AS FaturamentoTotal
FROM Locacao L
GROUP BY MesAno
ORDER BY MesAno;

-- Usando a view de faturamento mensal
SELECT * FROM FaturamentoMensal ORDER BY MesAno;

-- CLIENTES ATIVOS
CREATE VIEW VW_CLIENTESATIVOS AS
SELECT DISTINCT
    C.ClienteID,
    C.Nome,
    C.Telefone,
    C.Email,
    C.Endereco
FROM Clientes AS C
JOIN Locacao AS L
    ON C.ClienteID = L.ClienteID;

-- Usando a view de clientes ativos
SELECT * FROM VW_CLIENTESATIVOS;

-- procedure locação por cliente 
USE Locadora;

DELIMITER $$

CREATE PROCEDURE SP_LOCACOES_POR_CLIENTE 
(IN p_NomeCliente VARCHAR(100))

BEGIN
    SELECT 
        C.Nome AS Cliente,
        V.Modelo AS Veiculo,
        L.DataLocacao,
        L.DataDevolucaoPrevista,
        L.ValorTotal
    FROM Locacao L
    JOIN Clientes C ON L.ClienteID = C.ClienteID
    JOIN Veiculos V ON L.VeiculoID = V.VeiculoID
    WHERE C.Nome LIKE CONCAT('%', p_NomeCliente, '%');
END $$

DELIMITER ;

-- Chamada da procedure
CALL SP_LOCACOES_POR_CLIENTE('Bruno');







