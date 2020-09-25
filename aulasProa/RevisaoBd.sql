create database if not exists campeonato;
use campeonato; 

create table tbl_time(
	cod int primary key auto_increment,
    nome varchar(40) not null,
    numero_de_socios int 
);

create table tbl_jogador(
	matricula int primary key auto_increment,
    nome varchar(40) not null,
    cpf char(11) unique,
    fk_cod int,
    constraint fk_cod_time 
    foreign key(fk_cod) 
    references tbl_time(cod)
);

create table tbl_telefone(
	cod int primary key auto_increment,
    numero char(9) not null,
    fk_matricula int not null,
    constraint fk_matricula_aluno
    foreign key(fk_matricula)
    references tbl_jogador(matricula)
);

insert into tbl_time(
    nome,
    numero_de_socios
) values (
	"Brasília FC",
    2
), (
	"Água Santa",
    7
);

insert into tbl_jogador(
	nome,
    cpf,
    fk_cod
) values (
	"Sergio Dias Almeida",
    '11111111111',
	null
), (
	"Mario de Andrade Souza",
    '22222222222',
	1
);

insert into tbl_telefone(
	numero,
    fk_matricula
) values (
	'111111111',
    1
), (
	'222222222',
    2
);






