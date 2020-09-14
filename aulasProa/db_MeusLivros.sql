create database if not exists db_MeusLivros;

use db_MeusLivros;

create table Livros(
	id_livro bigint auto_increment not null unique,
    ISBN varchar(13) not null unique,
    assunto_livro varchar(30) not null,
	nome_editora_livro varchar(80) not null,
    preco_livro float(6,2) not null,
    data_publicacao date, 
    numero_paginas int not null,
    primary key(id_livro)
) auto_increment = 100;

create table Autor(
	id_livro bigint not null,
    nome_autor varchar(30) not null,
    sobreome_autor varchar(80) not null,
    constraint autores_livros foreign key (id_livro) references Livros (id_livros)
);


