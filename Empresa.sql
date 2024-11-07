CREATE DATABASE Empresa;
USE Empresa;

CREATE TABLE Funcionarios (
	ID_Funcionario INT,
     Nome VARCHAR(20),
     Morada VARCHAR(40),
     Contacto INT,
     PRIMARY KEY(ID_Funcionario)
	);

CREATE TABLE Clientes (
	ID_Cliente INT AUTO_INCREMENT,
    Nome VARCHAR(20),
    Morada VARCHAR(40),
    Contacto INT,
    ID_Funcionario INT,
    PRIMARY KEY(ID_Cliente),
    FOREIGN KEY(ID_Funcionario) REFERENCES Funcionarios(ID_Funcionario)
    );
     
SELECT * FROM Funcionarios, Clientes;

INSERT INTO Funcionarios
 VALUES (1, 'João Santos', 'Figueira', 924480172),
 (2, 'Gabriel Reis', 'Lisboa', 926440972),
 (3, 'João Sousa', 'Gaia', 923680102),
 (4, 'João Anjos', 'Barreiro', 922490172);
 
 INSERT INTO Clientes
 VALUES (1, 'Carlos Santos', 'Figueira', 924483172, 2),
 (2, 'Susana Reis', 'Lisboa', 926440472, 2),
 (3, 'Luís Sousa', 'Gaia', 923688102, 4),
 (4, 'Daniel Anjos', 'Barreiro', 922590172, 1);
 
 SELECT Funcionarios.nome
 FROM Funcionarios
 INNER JOIN Clientes 
 ON Funcionarios.ID_Funcionario = Clientes.ID_Funcionario;
 
 SELECT Funcionarios.nome
 FROM Funcionarios
 CROSS JOIN Clientes
 ON Funcionarios.ID_Funcionario = Clientes.ID_Funcionario;
 
 SELECT Funcionarios.nome
 FROM Funcionarios
 LEFT OUTER JOIN Clientes
 ON Funcionarios.ID_Funcionario = Clientes.ID_Funcionario;
 
 SELECT Funcionarios.nome
 FROM Funcionarios
 RIGHT OUTER JOIN Clientes
 ON Funcionarios.ID_Funcionario = Clientes.ID_Funcionario;