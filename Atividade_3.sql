SELECT * FROM Produtos;

#Exercício 1
SELECT ID_NF,ID_ITEM,COD_PROD,VALOR_UNIT
FROM Armazem.Produtos
WHERE DESCONTO IS NULL;

#Exercício 2
SET SQL_SAFE_UPDATES = 0 ;
UPDATE Produtos 
set desconto = 0
WHERE DESCONTO IS NULL;

#Exercício 3
SELECT COD_PROD, QUANTIDADE
FROM Produtos
WHERE DESCONTO >  10 AND DESCONTO < 20;

#Exercício 4
  SELECT QUANTIDADE , VALOR_UNIT
  FROM Produtos
  WHERE COD_PROD = 2 ;