CREATE DATABASE Joins_pii_ex6;
USE Joins_pii_ex6;

CREATE TABLE Cliente (
	NIF INT,
    Nome VARCHAR (20),
    Data_Nascimmento DATE,
    PRIMARY KEY (Nif)
);

CREATE TABLE Veiculo (
	Matricula VARCHAR (8),
    Modelo_codMod INT,
    Cliente_NIF INT,
    PRIMARY KEY (Matricula),
    FOREIGN KEY (Modelo_codMod) REFERENCES Modelo (codMod),
    FOREIGN KEY (Cliente_NIF) REFERENCES Cliente (NIF),
    Cor VARCHAR (10)
);

CREATE TABLE Modelo (
	codMod INT,
    Nome VARCHAR (10),
    Marca VARCHAR (10),
    PRIMARY KEY (codMod)
);

CREATE TABLE estaciona (
	cod INT,
    estacionamento_Num INT,
    veiculo_Matricula VARCHAR (8),
    dataEntrega DATE,
    datasaida DATE,
    horaEntrada TIME,
    horasaida TIME,
    PRIMARY KEY (cod),
    FOREIGN KEY (estacionamento_Num) REFERENCES estacionamento (Num),
	FOREIGN KEY (veiculo_Matricula) REFERENCES veiculo (Matricula)
);

CREATE TABLE estacionamento (
	Num INT,
    Piso INT,
    Capacidade INT,
    PRIMARY KEY (Num)
);

INSERT INTO Cliente VALUES 
	(123456789, 'João Silva', '1990-05-15'),
	(987654321, 'Maria Oliveira', '1985-11-23'),
	(456789123, 'Carlos Pereira', '1992-07-30');
    
INSERT INTO Veiculo VALUES
	('ABC1234', 1, 123456789, 'Azul'),
	('XYZ5678', 2, 987654321, 'Preto'),
	('LMN9101', 3, 456789123, 'Branco');
    
INSERT INTO Veiculo VALUES
	('21-FC-41', 3, 987654321, 'Prata');
    

INSERT INTO Modelo VALUES 
	(1, 'Fusca', 'Volkswagen'),
	(2, 'Civic', 'Honda'),
	(3, 'Corolla', 'Toyota');
    
INSERT INTO estaciona VALUES
	(1, 1, 'ABC1234', '2024-11-01', '2024-11-02', '08:00:00', '18:00:00'),
	(2, 2, 'XYZ5678', '2024-11-05', '2024-11-06', '09:00:00', '19:00:00'),
	(3, 3, 'LMN9101', '2024-11-10', '2024-11-11', '07:00:00', '17:00:00');
    
INSERT INTO estacionamento VALUES 
	(1, 0, 50),
	(2, 1, 100),
	(3, 2, 75);

#EXERCÍCIO A
SELECT Matricula, Nome
FROM Veiculo
JOIN Cliente 
ON Cliente_NIF = Cliente_NIF;

#EXERCÍCIO B
SELECT Veiculo.Cliente_NIF
FROM Veiculo
WHERE Veiculo.Matricula = '21-FC-41';

#Exercício C

UPDATE  Veiculo
SET Num = 1
WHERE Matricula = 'ABC1234';

UPDATE Veiculo
SET Num = 2
WHERE Matricula ='LMN9101';

UPDATE Veiculo
SET Num = 3
WHERE Matricula ='21-FC-41';

 SELECT matricula, Cor 
 FROM veiculo
 INNER JOIN Estacionamento
 ON Estacionamento.Num = Veiculo.Num
 WHERE  Estacionamento.Num = 1;
 
 #Exercício D
ALTER TABLE veiculo
ADD COLUMN  Ano_veiculo INT;

UPDATE Veiculo
SET Ano_veiculo = '2000'
WHERE Matricula = 'ABC1234';


SELECT Matricula, Ano_veiculo
FROM Veiculo
INNER JOIN estacionamento
ON Estacionamento.Num = Veiculo.Num
WHERE Estacionamento.Num = 1;

#Exercício E

SELECT dataEntrega, datasaida, veiculo.matricula
FROM  estaciona
LEFT JOIN veiculo
ON  estaciona.veiculo_Matricula = veiculo.Matricula
WHERE  veiculo.matricula= '70-20-ZH';

 #Exercicio F
 SELECT Nome
 FROM cliente
 INNER JOIN veiculo
 ON cliente.NIF= veiculo.Cliente_NIF
 WHERE veiculo.Modelo_codMod = 1;
 
 
 
#Exercicio G
SELECT Matricula,horaentrada, horasaida
FROM estaciona
INNER JOIN veiculo
ON estaciona.cod = veiculo.Modelo_codMod
WHERE veiculo.cor = "verde" AND veiculo.matricula LIKE "%S%";

#Exercício H
SELECT Nome
FROM cliente
LEFT JOIN veiculo
ON Cliente.NIF = veiculo.Cliente_NIF
WHERE veiculo.cod_estacionamento = 2;
 
ALTER TABLE veiculo
ADD COLUMN cod_estacionamento INT;

#Exercicio I

SELECT NIF
FROM cliente
INNER JOIN veiculo
ON cliente.NIF = veiculo.Cliente_NIF
WHERE veiculo.cod_estacionamento = 3;

#Exercicio  J

SELECT matricula, modelo_codMod, cliente_NIF,cor,Num,Ano_veiculo
FROM veiculo
INNER JOIN estaciona
ON veiculo.matricula = estaciona.veiculo_Matricula
WHERE veiculo.cod_estacionamento = 2;

#Exercício K

SELECT cliente.nome,matricula,modelo_codMod, cliente_NIF,cor,Num,Ano_veiculo
FROM cliente
INNER JOIN veiculo
ON cliente.NIF = veiculo.Cliente_NIF 
INNER JOIN modelo
ON Modelo.codMod = veiculo.Modelo_codMod;











 