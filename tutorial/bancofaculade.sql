create database if not exists db_faculdade;

use db_faculdade;

# tabela alunos

create table if not exists tbl_alunos(
	ra_aluno int auto_increment primary key,
    nome_aluno varchar(20) not null,
    sobrenome_aluno varchar(60) not null,
    cpf_aluno varchar(11) not null unique,
    rg_aluno varchar(09) not null unique,
    fk_id_curso int not null,
    rua_aluno varchar(50) not null,
    numero_aluno smallint not null,
    bairro_aluno varchar(50) not null,
    ativo char(1) not null,
);




