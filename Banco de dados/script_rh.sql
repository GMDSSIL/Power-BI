/* ----------------------------------------------------------
   BANCO DE DADOS: RH
---------------------------------------------------------- */

CREATE DATABASE IF NOT EXISTS RH;
USE RH;

/* ----------------------------------------------------------
   TABELAS
---------------------------------------------------------- */

-- TABELA: DEPARTAMENTOS
CREATE TABLE DEPARTAMENTOS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

-- TABELA: FAIXA SALARIAL
CREATE TABLE RH_FAIXA_SALARIAL (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Vlr_Min DECIMAL(10,2) NOT NULL,
    Vlr_Max DECIMAL(10,2) NOT NULL,
    Faixa_Salarial VARCHAR(50) NOT NULL
);

-- TABELA: FUNCIONÁRIOS
CREATE TABLE RH_FUNCIONARIOS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    Data_de_Registro DATE NOT NULL,
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES DEPARTAMENTOS(ID)
);

/* ----------------------------------------------------------
   INSERINDO DADOS
---------------------------------------------------------- */

-- FAIXAS SALARIAIS
INSERT INTO RH_FAIXA_SALARIAL (Vlr_Min, Vlr_Max, Faixa_Salarial) VALUES
(1000.00, 3000.00, 'Júnior'),
(3001.00, 7000.00, 'Pleno'),
(7001.00, 15000.00, 'Sênior');

-- DEPARTAMENTOS
INSERT INTO DEPARTAMENTOS (Nome) VALUES
('Recursos Humanos'),
('Financeiro'),
('Tecnologia da Informação'),
('Marketing'),
('Vendas'),
('Inovação');

-- FUNCIONÁRIOS
INSERT INTO RH_FUNCIONARIOS (Nome, Salario, Data_de_Registro, DepartamentoID) VALUES
('Ana Souza', 2500.00, '2023-03-10', 1),
('Bruno Lima', 4800.00, '2022-11-05', 3),
('Carla Mendes', 7200.00, '2024-01-20', 2),
('Diego Ramos', 3200.00, '2023-07-15', 4),
('Fernanda Oliveira', 9500.00, '2023-09-01', 3),
('Gabriel Nunes', 2800.00, '2023-02-18', 5),
('Mariana Costa', 6800.00, '2022-09-10', 3),
('Ricardo Alves', 7400.00, '2023-12-01', 2),
('Juliana Prado', 2900.00, '2024-03-25', 4),
('Felipe Duarte', 3500.00, '2023-04-12', 1),
('Patrícia Melo', 12000.00, '2022-11-30', 3),
('Tiago Santos', 2500.00, '2024-05-18', 2),
('Luciana Ferreira', 4100.00, '2023-07-07', 4),
('André Vasconcelos', 8900.00, '2023-10-20', 5),
('Sofia Martins', 3100.00, '2024-06-09', 1),
('Paulo Henrique', 2700.00, '2023-01-22', 2),
('Natália Barbosa', 6300.00, '2024-02-11', 3),
('Vinícius Rocha', 15000.00, '2022-12-05', 5),
('Beatriz Faria', 2100.00, '2023-08-15', 4),
('Rodrigo Tavares', 5800.00, '2024-04-03', 3),
('Caroline Brito', 9600.00, '2023-06-28', 2),
('Hugo Pires', 1900.00, '2024-01-12', 1),
('Larissa Monteiro', 3300.00, '2023-09-02', 4),
('Eduardo Silva', 7200.00, '2022-10-25', 5),
('Amanda Ribeiro', 2800.00, '2024-03-17', 1),
('Rafael Nogueira', 5200.00, '2023-08-10', 5),
('Larissa Tavares', 6100.00, '2023-09-12', 5),
('Gabriel Farias', 4800.00, '2024-01-25', 5),
('Bruna Carvalho', 6550.00, '2024-02-19', 5),
('Felipe Andrade', 5800.00, '2024-03-30', 5);

/* ----------------------------------------------------------
   Listar todos os departamentos e seus funcionários,
   mesmo que o departamento não tenha funcionário.
---------------------------------------------------------- */

SELECT 
    d.ID AS ID_Departamento,
    d.Nome AS Nome_Departamento,
    f.ID AS ID_Funcionario,
    f.Nome AS Nome_Funcionario,
    f.Salario,
    f.Data_de_Registro
FROM DEPARTAMENTOS d
LEFT JOIN RH_FUNCIONARIOS f
    ON d.ID = f.DepartamentoID
ORDER BY d.ID;

/* ----------------------------------------------------------
   Listar o nome do funcionário, seu salário e
   a faixa salarial correspondente.
---------------------------------------------------------- */

SELECT 
    f.Nome AS Nome_Funcionario,
    f.Salario,
    s.Faixa_Salarial
FROM RH_FUNCIONARIOS f
JOIN RH_FAIXA_SALARIAL s
    ON f.Salario BETWEEN s.Vlr_Min AND s.Vlr_Max
ORDER BY f.Salario DESC;


SELECT 
    f.Nome AS Nome_Funcionario,
    d.Nome AS Departamento,
    s.Faixa_Salarial AS Nivel_Salarial
FROM Funcionarios f
JOIN Departamentos d
    ON f.DepartamentoID = d.ID
JOIN Faixa_Salarial s
    ON f.Salario BETWEEN s.Vlr_Min AND s.Vlr_Max
WHERE s.Faixa_Salarial = 'Pleno'
  AND d.Nome = 'Vendas'
ORDER BY f.Nome;


