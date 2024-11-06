CREATE DATABASE Escola_INTEP;
USE  Escola_INTEP;

#Criar tabela Estudante
CREATE TABLE Estudantes(
Id_aluno INT  PRIMARY KEY,
Nome VARCHAR(20),
Idade INT NOT NULL,
Data_Nascimento DATE NOT NULL);

#Inserir dados na tabela
INSERT INTO Estudantes(Id_aluno, Nome, Idade, Data_Nascimento) VALUES
(1,'Ana Castela',15,'2008-10-22'),
(2,'Bianca Semedo',17,'2007-02-12'),
(3,'Caren Santos',19,'2005-08-21'),
(4,'Diego Lima',18,'2006-06-15'),
(5,"Jeizy Luciano",16,'2007-11-29');

#Selecionar a tabela Estudante
SELECT * FROM Estudantes;

#Selecionar Estudantes com maior de 18 anos
SELECT *FROM Estudantes 
WHERE Idade > 18;

#Selecionar por ordem decrescente
 SELECT Estudantes.Nome ,Estudantes.idade
 FROM Estudantes
 ORDER BY Estudantes.Idade DESC;
 
 #Mostrar os 3 Estudantes mais velhos
 SELECT Estudantes.Nome ,Estudantes.idade
 FROM Estudantes
 ORDER BY Estudantes.Idade DESC LIMIT 3;
  
#Contar quantos estudantes existem na tabela
SELECT COUNT(Estudantes.Nome)
AS Total_Estudante
FROM Estudantes;

#Encontrar a idade média dos Estudantes
SELECT AVG(Estudantes.Idade) 
AS Idade_Media
FROM Estudantes;

#Encontar a idade do estudante mais novo e do mais velho
SELECT MIN(Estudantes.Idade) 
AS idade_Minima,
MAX(Estudantes.Idade)
AS idade_Maxima
FROM Estudantes;

 


 
 








