create database if not exists db_clinica;

/* o auto complete é ativado manualmente com ctrl+space */
# drop database if exists db_clinica;

use db_clinica;

/* como ter certeza do banco em uso. Podemos usar esse comando */

select database(); -- função do banco de dados database()*

/* ver todos os bancos de dados */

show databases;

# criando tabelas 

create table if not exists tbl_cliente(
	id_cliente int auto_increment, -- não é necessário usar unique na pk, ai = auto_increment
    nome_cliente varchar(80) not null,
    cpf_cliente varchar(14) not null unique,
    celular_cliente varchar(15),
    id_depto int not null,
    primary key(id_cliente)
);

create table if not exists tbl_depto (
	id_depto int auto_increment primary key, -- não é necessário user not null em atributos AI,
    nome_depto varchar(30) not null
);

/* para gerear o mer vá em Database/reverse Engineer e next next next...*/

# relacionando as tabelas e alterando

alter table tbl_cliente 
add constraint fk_depto -- aqui adicionamos uma restrição
foreign key(id_depto) -- na table de cliente vou pegar este campo
references tbl_depto(id_depto); -- com este outro compo

#drop table if exists tbl_cliente; -- dropa toda a informação sem perdão 
#drop table if exists tbl_depto; 
