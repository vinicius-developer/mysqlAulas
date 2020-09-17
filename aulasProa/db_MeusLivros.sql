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
    fk_id_categoria int not null
) auto_increment = 100;

/* tabela Autor */

create table if not exists tbl_autor(
	id_autor bigint auto_increment primary key,
    nome_autor varchar(30) not null,
    sobrenome_autor varchar(80) not null
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

alter table tbl_livro_autor
add constraint fklivro
foreign key(fk_id_livro)
references tbl_livro(id_livro);

alter table tbl_livro_autor
add constraint fkAutor
foreign key(fk_id_autor)
references tbl_autor(id_autor);

# Inserindo dados tbl_editora

insert into tbl_editora(nome_editora) 
values ('Pearson'), 
('RELX Gruop'), 
('ThomsonReuters'), 
('Bertelsmann');

#select * from tbl_editora;

# Inserindo dados tbl_categoria

insert into tbl_categoria(	
	nome_categoria
) values ('Auto-ajuda'),
('ficção'),
('historia'),
('aventura'),
('ciência');

#select * from tbl_categoria;

# Inserindo dados tbl_assunto

insert into tbl_assunto(
	assunto_livro
) values (
	'guerra de aliegina'
),
(
	'guerra de nações'
),
(
	'depressão'
),
( 	
	'criação do universo'
);

#select * from tbl_assunto;

# Inserindo dados tbl_autor

insert into tbl_autor(
	nome_autor,
    sobrenome_autor
) values (
	'Carlos',
    'Munhoz Silva'
), (
	'Rodrigo',
    'Mario Augusto'
), (
	'Sergio',
    'Duarte de Almeida'
), (
	'Mario',
    'Alberto Ruas'
);

#select * from tbl_autor;

insert into tbl_livro(
	ISBN,
    nome_livro,
    preco_livro,
    data_publicacao,
    fk_id_assunto,
	numero_paginas,
    fk_id_editora,
    fk_id_categoria
) values (
	"12312312",
    "daniel",
    '10.00',
    '1900-05-01',
    1,
    90,
    1,
    1
), (
	"32132132",
    "A morte do gigante",
    '60.00',
    '2010-09-30',
    2,
    90,
    2,
    2
);

#select * from tbl_livro;

# tabela liveo e autor

insert into tbl_livro_autor(
	fk_id_autor,
    fk_id_livro
) values (
	1,
    100
), (
	2,
    100
), (
	3,
    101
), (
	4,
    101
);

#select * from tbl_livro_autor;


#drop database db_MeusLivros;
#drop table tbl_livro;
#drop table tbl_autor;
#drop table tbl_livro_autor;
#drop table tbl_livro_autor;



 