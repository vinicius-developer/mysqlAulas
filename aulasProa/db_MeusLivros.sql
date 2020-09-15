create database if not exists db_MeusLivros;

use db_MeusLivros;

/* Tabela livros */

create table if not exists tbl_livro(
	id_livro bigint auto_increment primary key, 
    ISBN varchar(13) not null unique,
	nome_livro varchar(40) not null,
    preco_livro float not null,
    data_publicacao date, 
    numero_paginas int not null,
    fk_id_assunto int not null,
    fk_id_editora int not null,
    fk_id_categoria int not null,
    fk_id_livro_autor int not null
) auto_increment = 100;

/* tabela Autor */

create table if not exists tbl_autor(
	id_autor bigint auto_increment primary key,
    nome_autor varchar(30) not null,
    sobreome_autor varchar(80) not null
);

/* tabela Editora */

create table if not exists tbl_editora(
	id_editora int auto_increment primary key,
    nome_editora varchar(80) not null
);

/* tabela Categoria */

create table if not exists tbl_categoria(
	id_categoria int auto_increment primary key,
    nome_categoria varchar(30)
);

/* tebela Assunto */

create table if not exists tbl_assunto(
	id_assunto int auto_increment primary key,
    assunto_livro varchar(30)
);

/* tabela de conexão entre livros e autor */

create table if not exists tbl_livro_autor(
	id_livro_autor int auto_increment primary key, 
    fk_id_autor bigint not null,
    fk_id_livro bigint not null
);

/* Neste exemplo vamos alterar tabelas para criar as FK */

alter table tbl_livro
add constraint fkAssunto 
foreign key(fk_id_assunto)
references tbl_assunto(id_assunto);

alter table tbl_livro
add constraint fkEditora
foreign key(fk_id_editora)
references tbl_editora(id_editora);

alter table tbl_livro
add constraint fkCategoria
foreign key(fk_id_categoria)
references tbl_categoria(id_categoria);

alter table tbl_livro
add constraint fkLivroAutor
foreign key(fk_id_livro_autor)
references tbl_livro_autor(id_livro_autor);

alter table tbl_livro_autor
add constraint fklivro
foreign key(fk_id_livro)
references tbl_livro(id_livro);

alter table tbl_livro_autor
add constraint fkAutor
foreign key(fk_id_autor)
references tbl_autor(id_autor);


#drop table tbl_livro;
#drop table tbl_autor;
#drop table tbl_livro_autor;
#drop table tbl_livro_autor;



 