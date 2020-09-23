create database if not exists db_Desafio2;
use db_Desafio2;

# criação de tabelas

#tabela Alunos

create table if not exists Alunos(
	MAT varchar(10) primary key,
    nome varchar(80) not null,
    endereco varchar(50) not null,
    cidade varchar(30) not null
);

create table if not exists Disciplinas(
	COD_DISC varchar(05) primary key,
    nome_disc varchar(80) not null unique,
	carga_hor smallint not null
);

create table if not exists Professores(
	COD_PROF varchar(07) primary key,
    nome varchar(80) not null,
    endereco varchar(50) not null,
    cidade varchar(30) not null
);

create table if not exists Turma(
	COD_DISC varchar(05) not null,
    COD_TURMA smallint not null,
    COD_PROF varchar(07) not null,
    ano year not null,
    horario varchar(07) not null,
    primary key (COD_DISC, COD_TURMA, COD_PROF, ano),
	constraint fk_id_disciplinas foreign key(COD_DISC) references Disciplinas(COD_DISC),
    constraint fk_id_professor foreign key(COD_PROF) references Professores(COD_PROF)
);

create table if not exists Historico(
	FK_MAT varchar(10) not null,
    FK_COD_DISC varchar(05) not null,
    FK_COD_TURMA smallint not null,
    FK_COD_PROF varchar(07) not null,
    FK_ANO year not null,
    frequencia float not null,
    nota float not null,
    primary key (FK_MAT, FK_COD_DISC,FK_COD_TURMA,FK_COD_PROF,FK_ANO),
    constraint fk_mat_historibo foreign key(FK_MAT)
    references Alunos(MAT),
    constraint fks_turma_hitorico foreign key(FK_COD_DISC, FK_COD_TURMA, FK_COD_PROF, FK_ANO) 
    references Turma(COD_DISC, COD_TURMA, COD_PROF, ano)
);

#drop table Historico;

# inserindo dados 

#tabela alunos

insert into Alunos (
	MAT,
    nome,
    endereco,
    cidade
) values ('2015010101', 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
('2015010102', 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
('2015010103', 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
('2015010104', 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
('2015010105', 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
('2015010106', 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

#select * from Alunos;

#tabela Disciplinas

insert into Disciplinas(
	COD_DISC,
    nome_disc,
	carga_hor
) values ('BD', 'BANCO DE DADOS', 100),
('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
('WEB', 'AUTORIA WEB', 50),
('ENG', 'ENGENHARIA DE SOFTWARE', 80);

#select * from Disciplinas;

#tabela Professores 

insert into Professores(
	COD_PROF,
    nome,
    endereco,
    cidade
) values ('212131', 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
('122135', 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
('192011', 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

#select * from Professores;

#tabela turma 

insert into Turma(
	COD_DISC,
    COD_TURMA,
    COD_PROF,
    ano,
    horario
) values ('BD', 1,'212131', 2015, '11H-12H'),
('BD', 2, '212131', 2015, '13H-14H'),
('POO', 1, '192011', 2015, '08H-09H'),
('WEB', 1, '192011', 2015, '07H-08H'),
('ENG', 1, '122135', 2015, '10H-11H');

#select * from Turma;



insert into Historico(
	FK_MAT,
    FK_COD_DISC,
    FK_COD_TURMA,
    FK_COD_PROF,
    FK_ANO,
    frequencia,
    nota
) values ('2015010101', 'BD', 1, '212131', 2015,100.0, 7.3),
('2015010101', 'POO', 1, '192011', 2015,70.0, 8.6),
('2015010101', 'WEB', 1, '192011', 2015,100.0, 6.5),
('2015010101', 'ENG', 1, '122135', 2015,100.0, 10.0),
('2015010102', 'BD', 2, '212131', 2015,100.0, 4.8), 
('2015010102', 'POO', 1, '192011', 2015,100.0, 8.2),
('2015010102', 'WEB', 1, '192011', 2015,100.0, 6.7),
('2015010102', 'ENG', 1, '122135', 2015,70.0, 10.0),
('2015010103', 'BD', 1, '212131', 2015,100.0, 5.9),
('2015010103', 'POO', 1, '192011', 2015,80.0, 10.7),
('2015010103', 'WEB', 1, '192011', 2015,40.0, 6.8),
('2015010103', 'ENG', 1, '122135', 2015,100.0, 4.3),
('2015010104', 'BD', 2, '212131', 2015,100.0, 8.2),
('2015010104', 'POO', 1, '192011', 2015,100.0, 6.1),
('2015010104', 'WEB', 1, '192011', 2015,100.0, 7.9),
('2015010104', 'ENG', 1, '122135', 2015,70.0, 8.3),
('2015010105', 'BD', 1, '212131', 2015,100.0, 4.7),
('2015010105', 'POO', 1, '192011', 2015,100.0, 6.4),
('2015010105', 'WEB', 1, '192011', 2015,100.0, 9.9),
('2015010105', 'ENG', 1, '122135', 2015,20.0, 3.7),
('2015010106', 'BD', 2, '212131', 2015,80.0, 7.0),
('2015010106', 'POO', 1, '192011', 2015,60.0, 6.3),
('2015010106', 'WEB', 1, '192011', 2015,80.0, 8.0),
('2015010106', 'ENG', 1, '122135', 2015,70.0, 9.1);

# pequisas de dados 

# exercicio a

select FK_MAT as MAT 
from historico 
where fk_cod_disc = 'BD' 
and fk_ano = 2015
and nota < 5.0;

# exercicio b 

/*
	fazer select numero de matricula 
 */
 
select fk_mat, fk_cod_disc 
from historico
where fk_ano = 2015 and fk_cod_disc = 'POO'
group by fk_mat;

select fk_mat as mat, round(avg(nota), 2) as media
from historico 
where fk_ano = 2015
group by fk_mat;

select round(avg(nota), 2) as media
from historico
where FK_COD_DISC = 'POO';

# exercicio c

select fk_mat as mat, round(avg(nota), 2) as media
from historico 
where fk_ano = 2015
group by fk_mat
having round(avg(nota), 2) > 6;

# exercicio e

select count(cidade) 
from alunos
where cidade <> 'Natal';