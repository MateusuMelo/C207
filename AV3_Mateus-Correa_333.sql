# 1 - Questao
# Garantir a integridade e segurança dos dados nele contido, através de permissoes para usuarios responsaveis pela manutencao e administracao do bd.

drop database if exists vingadores;

create database vingadores;
use vingadores;

#LUTAR é a tabela intermediária entre as tabelas Herói e Vilão

create table Heroi(
	id int not null,
    nome varchar(100) not null,
    idade int not null,
    primary key(id)
);

create table Vilao(
	id int not null,
    nome varchar(100) not null,
    tipo varchar(100) not null,
    primary key(id)
);

create table Poder(
	id int not null auto_increment,
    tipo varchar(50) not null,
    idHeroi int not null,
    primary key(id),
    CONSTRAINT fk3
    foreign key (idHeroi) 
    references Heroi (id) 
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

create table Lutar(
	idHeroi int not null,
    idVilao int not null,
	CONSTRAINT fk1
    foreign key (idHeroi) 
    references Heroi (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    CONSTRAINT fk2
    foreign key (idVilao) 
    references Vilao(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    PRIMARY KEY(idHeroi, idVilao)
);

#REALIZE A SEGUNDA QUESTÂO AQUI
alter table Heroi add ARMA varchar(45);
alter table Vilao change TIPO RACA varchar(45);
alter table Heroi drop IDADE;


#Terceira Questao
CREATE USER NickFury@localhost IDENTIFIED BY 'Nick Fury';
CREATE USER MariaHill@localhost IDENTIFIED BY 'Maria Hill';
CREATE USER PhilCoulson@localhost IDENTIFIED BY 'Phil Coulson';
#concedendo privilegios

grant insert, update on Heroi to NickFury;
grant delete on Vilao to MariaHill;
revoke select on tables from PhilCoulson;


insert into Heroi(id,nome,arma ) values ('1','Homem de Ferro','Armadura tecnologica');
insert into Heroi(id,nome,arma ) values ('2','Capitão América','Escudo');
insert into Heroi(id,nome,arma ) values ('3','Viúva Negra','Pistolas');
insert into Heroi(id,nome,arma ) values ('4','Hulk','Super força');
insert into Heroi(id,nome,arma ) values ('5','Gavião Arqueiro','Arco e flecha');
insert into Heroi(id,nome,arma ) values ('6','Thor','StormBreaker');
insert into Heroi(id,nome,arma ) values ('7','Feiticeira Escarlate','Poderes Misticos');
insert into Heroi(id,nome,arma ) values ('8','Homem Aranha','Teias');

insert into Vilao(id,nome,raca) values ('1','Thanos', 'Alienigina');
insert into Vilao(id,nome,raca) values ('2','Ultron', 'Robo');
insert into Vilao(id,nome,raca) values ('3','Loki', 'Deus');


insert into Lutar(idHeroi, idVilao) values
('1', '1'),
('1', '2'),
('1', '3'),
('2', '1'),
('2', '2'),
('2', '3'),
('3', '1'),
('3', '2'),
('3', '3'),
('4', '1'),
('4', '2'),
('4', '3'),
('5', '1'),
('5', '2'),
('5', '3'),
('6', '1'),
('6', '2'),
('6', '3'),
('7', '1'),
('7', '2'),
('8', '1');

insert into Poder(tipo, idHeroi) values
('Tecnologico','1'),
('Habilidades em Combate','2'),
('Habilidades em combate', '3'),
('Fator de cura', '4'),
('Habilidades em combate','5'),
('Controle e manipulação de raios','6'),
('Magia','7'),
('Manipulação de elementos fisicos','8');

#Quarta Questao
select h.nome,p.tipo from Heroi as h inner join Poder as p where h.id = p.idHeroi;

select h.nome from Lutar inner join Heroi as h on Lutar.idHeroi = h.id inner join Vilao as v on Lutar.idVilao = v.id and Lutar.idVilao = v.id and v.nome = 'Thanos';   
select h.nome, p.tipo from Lutar inner join Poder as p inner join Heroi as h on Lutar.idHeroi = h.id inner join Vilao as v on Lutar.idVilao = v.id and Lutar.idVilao = v.id and v.nome = 'Loki'and p.idHeroi = h.id;   





