# Produto cartesiano 
Select * from empregado, departamento;

#JOIN 
Select distinct s.PNome from empregado as e, empregado as s where e.SSN_Supervisor = s.SSN;

#Busca textual
Select PNome from empregado where PNome like 'J%n';

#Simulações Matematica
Select PNome, Salario, Salario*1.1 from empregado;

#Funções pre-pronta do sql
Select avg(salario) from empregado;
Select min(salario) from empregado;
Select max(salario) from empregado;
Select count(salario) from empregado;
select sum(salario) from empregado;

