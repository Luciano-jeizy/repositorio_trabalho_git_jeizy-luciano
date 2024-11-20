CREATE DATABASE Escola_EPFF;
USE Escola_EPFF;


CREATE TABLE Estudantes(
	ID_Estudante INT,
	Nome VARCHAR(40),
	Idade INT,
	Data_Nascimento DATE,
	PRIMARY KEY (ID_Estudante)
   );
   
INSERT INTO Estudantes VALUES(
	1,'Ana Castela',15,'2009-01-10'),
    (2,'Bruna Silva',19,'2005-02-10'),
    (3,'Fernanda Paula',36,'1988-05-09');
    
SELECT * FROM Estudantes;

UPDATE Estudantes
SET Idade = 12, Data_Nascimento = '2012-12-19'
WHERE Nome = "Ana Castela";

DELETE FROM Estudantes
WHERE Idade > 35;

CREATE TABLE Sum (
	Pedido_ID INT,
    Empresa VARCHAR(20),
    Quantidade int
    );
    
CREATE TABLE Min_Max (
	Pedido_ID int,
    Cliente VARCHAR(20),
    Data_Entrega DATE
);

INSERT INTO  Min_Max VALUES (
	1,'CO1','1986_12_20'),
    (2,'CO2','1989-12-19'),
    (3,'CO3','2012-08-02');



    
INSERT INTO Sum VALUES(
	1,'A',20),
	(2,'B',50),
	(3,'B',50);
        
INSERT INTO Sum VALUES(   
	4,'B',NULL);

INSERT INTO Sum VALUES(   
	5,'C',NULL);
    
INSERT INTO Sum VALUES(   
  6,'A',30),
  (7,'C',60);
  
  
        
SELECT *FROM  Sum;
        
SELECT SUM(Quantidade) 
As Sum_total 
FROM Sum;

SELECT Empresa , Sum(Quantidade)
AS Sum_total
FROM Sum
GROUP BY Empresa;

SELECT * FROM Sum;

SELECT SUM(Idade) 
As Idade_total 
FROM Estudantes;

SELECT SUM(Idade) 
As Total_Idade_Maior_18
FROM Estudantes
WHERE Idade >18;

SELECT COUNT(*) AS Total_Estudantes
FROM Estudantes;

SELECT COUNT(*)
AS Total_Estudantes_Maior_20
FROM Estudantes
WHERE Idade >20;

SELECT AVG(Quantidade)
AS Media_Quantidade
FROM Sum;

SELECT Empresa, AVG(Quantidade)
AS Media_Empresa
FROM Sum
GROUP BY Empresa;

SELECT MIN(Data_Entrega) FROM Min_Max;
SELECT MAX(Data_Entrega) FROM Min_Max;









