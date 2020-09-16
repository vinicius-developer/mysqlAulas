create database if not exists faculdade;

use faculdade;

# tabela alunos

create table if not exists tbl_alunos(
	ra_aluno bigint auto_increment primary key,
    nome_aluno varchar(20) not null,
    sobrenome_aluno varchar(60) not null,
    cpf_aluno varchar(11) not null unique,
    rg_aluno varchar(09) not null unique,
    fk_id_curso int not null,
    rua_aluno varchar(50) not null,
    numero_aluno int not null,
    bairro_aluno varchar(60) not null,
    ativo char(1) not null
);

# tabela prefessoras

create table if not exists tbl_professores(
	id_professor int auto_increment primary key,
    nome_professor varchar(20) not null,
    sobrenome_professor varchar(60) not null,
    cpf_professor varchar(11) not null unique,
    rg_professor varchar(09) not null unique,
    rua_professor varchar(80) not null,
    numero_professor int not null,
    bairro_professor varchar(80) not null,
    fk_id_disciplina_um int,
    fk_id_disciplina_dois int,
    fk_id_disciplina_tres int,
    fk_id_disciplina_quatro int
);

# tabela turmas 

create table if not exists tbl_turmas(
	id_turma int auto_increment primary key,
    fk_id_disciplina int not null,
    fk_id_professor int not null
);



create table if not exists tbl_disciplinas(
	id_disciplina int auto_increment primary key,
    nome_disciplina varchar(30)
);
