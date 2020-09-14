CREATE DATABASE FACULDADE;

USE FACULDADE;

CREATE TABLE Aluno (
	Ra_Aluno BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
    Nome_Aluno VARCHAR(30) NOT NULL,
    Sobrenome_Aluno VARCHAR(80) NOT NULL,
    Cpf_Aluno VARCHAR(11) UNIQUE NOT NULL,
    Rg_Aluno VARCHAR(9) UNIQUE NOT NULL,
	Curso_Atual INT NOT NULL,
    Rua_Aluno VARCHAR(80) NOT NULL,
    Numero_Aluno VARCHAR(10) NOT NULL,
    Bairro_Aluno VARCHAR(80) NOT NULL,
    Ativo CHAR(1) NOT NULL,
    primary key(Ra_Aluno),
    foreign key(Curso_Atual) references Cursos(Id_Curso)
);

create table Cursos (
	Id_Curso int not null auto_increment unique,
    Id_Departamento int not null unique,  
	Nome_Curso varchar(80) not null,
    primary key(Id_curso),
    foreign key(Id_Departamento) references Departamento(Id_Departamento)
);

create table Departamento(
	Id_Departamento int not null auto_increment unique,
    Nome_Departamento varchar(80) not null unique,
    Professor_Vinculado int not null unique,
    primary key(Id_Departamento),
    foreign key(Id_Departamento) references Professor(Id_Professor)
);

create table Professor(
	Id_Professor int not null auto_increment unique,
    Nome_Professor varchar(30) not null,
    Sobrenome_Professor varchar(80) not null,
    Cpf_Professor varchar(11) not null unique,
    Rg_Professor varchar(9) not null unique,
    Rua_Professor varchar(80) not null,
    Numero_Professor varchar(10) not null,
    Bairro_Professor varchar(80) not null,

    
);

