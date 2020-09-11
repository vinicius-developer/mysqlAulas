# criamos a base da dados 

# Criar Banco 
CREATE DATABASE PROJETO;

# Entrar Banco 
USE PROJETO;

# Criar table

CREATE TABLE cliente (
	nome varchar(30),
    sexo char(1),
    email varchar(30),
    cpf int,
    telefone varchar(30),
    endereco varchar(100)
);

# mostrar tabelas
show tables;

# descrição especifica dos campos
desc cliente;

# consultar tabela especifica
# * caractere global ou seja todas os atributos
select nome from cliente;

# apagar tabela
# drop table cliente

# Inserindo valores de forma que eu também estou omitindo as colunas

insert into cliente values(
	'João',
	'F',
    'asd@hotmail.com',
    '123123123',
    '1231qweqwe',
    'safsadfsad'
);

# Inserindo valores de forma que eu expondo os nomes das colunas

insert into cliente(nome,email,cpf,telefone,endereco) values (
	'João',
    'asd@hotmail.com',
    '123123123',
    '1231qweqwe',
    'safsadfsad'
);

# cadastrando mais de um registro ao mesmo tempo

insert into cliente values(
	'João',
	'r',
    'asd@hotmail.com',
    '123123123',
    '1231qweqwe',
    'safsadfsad'
), (
	'João',
	'Q',
    'asd@hotmail.com',
    '123123123',
    '1231qweqwe',
    'safsadfsad'
)






