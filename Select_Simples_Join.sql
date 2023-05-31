# 1 - DATA QUERY LANGUAGE (DQL) - SELECT

SELECT dnome, dnumero From Departamento;
SELECT dnome, dnumero From Departamento WHERE dNumero = 1;

# 2 - Usando Join
# SOMENTE É POSSIVEL REALIZAR JOIN COM TABELAS QUE SE RELACIONAM!***

SELECT Pnome, Dnome from empregado, departamento Where dnumero_departamento = dnumero;

SELECT pnome, Dnome from empregado inner join departamento where Dnumero_departamento = Dnumero;

# Join com 3 taelas 

Select e.Pnome, p.Pnome from empregado as e, projeto as p, trabalha_em as te Where te.Pnumero_Projeto = p.pNumero and te.SSN_Empregado = e.SSN;
