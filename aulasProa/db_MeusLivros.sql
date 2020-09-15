create database if not exists db_MeusLivros;

use db_MeusLivros;

create table Livros(
	id_livro bigint auto_increment not null unique,
    ISBN varchar(13) not null unique,
    assunto_livro varchar(30) not null,
	nome_editora_livro varchar(80) not null,
    preco_livro float not null,
    data_publicacao date, 
    numero_paginas int not null,
    primary key(id_livro)
) auto_increment = 100;

/* Neste exemplo criamos uma fk */

create table Autor(
	fk_id_livro bigint not null,
    nome_autor varchar(30) not null,
    sobreome_autor varchar(80) not null,
	#foreign key(nome do campo que vai ser a FK) references NomeDaTabelaMae(nome Do campo na tabela mãe)
    foreign key(fk_id_livro) references Livros(id_livro)
);

alter table Autor
add foreign key(id_livro)
references Livros(id_livro);

# drop table Livros
drop table Autor 


 