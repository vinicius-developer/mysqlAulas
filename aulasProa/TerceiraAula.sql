# criação do banco de dados db_loja
create database if not exists db_loja;

 /*
 
	um erro para o processo todo
    
    uma sinal de attention permite que o cógigo continue
    
    erro = não executado
    
    attention = executado
 
*/
 
# colocando banco em uso
 use db_loja;
 
# criar tabela de tbl_pessoa 
create table if not exists tbl_pessoa(
	id_pessoa int auto_increment primary key, -- não é necessáio coloca not null
    nome_pessoa varchar(30) not null,
    rua_pessoa varchar(80) not null,
    bairro_pessoa varchar(40) not null,
    cidade_pessoa varchar(40) not null,
    uf_pessoa char(2) not null
);

#popular a tabela tbl_pessoa 
#inserir registros - linha 
#auto_incremento --> mysql 
insert into tbl_pessoa(
	nome_pessoa,
    rua_pessoa,
    bairro_pessoa,
    cidade_pessoa,
    uf_pessoa
) values (
	'Joyce',
    'Rua tito - 54',
    'Lapa',
    'São Paulo',
    'SP'
);

insert into tbl_pessoa(
	nome_pessoa,
    rua_pessoa,
    bairro_pessoa,
    cidade_pessoa,
    uf_pessoa
) values (
	'Rodigo',
    'Rua tito - 54',
    'Lapa',
    'São Paulo',
    'SP'
);

# isso pode ser repetido várias vezes para adicionar mais pessoas

#consultando o registro foi gravado
# * todos os campos (colunas);
select * from tbl_pessoa;

# mostrar todas as tabelas 
# esse comando só funciona em mysql
show tables;

-- simplificando um pocuo o insert 
insert into tbl_pessoa(
    nome_pessoa,
    rua_pessoa,
    bairro_pessoa,
    cidade_pessoa,
    uf_pessoa 
) 
values (
	"Maria Júlia", 
    "Av. Morumbi, 590 cobertura",
    "Morumbi",
    "São Paulo",
    "SP"
), (
	'Vinicius',
    'Av.Pinheiros, 200',
    'Pinheiros',
    'São Paulo',
    "SP"
);

/*
insert into tbl_pessoa 
values (
	"Maria Júlia", 
    "Av. Morumbi, 590 cobertura",
    "Morumbi",
    "São Paulo",
    "SP"
);
*/

#criar o banco carro

create table tbl_carro(
	id_carro integer auto_increment primary key,
    modelo_carro varchar(20) not null,
    ano_carro year not null,
    cor_carro varchar(10) not null,
    placa_carro varchar(7) not null unique,
    fk_id_pessoa int not null,
    constraint fk_id_pessoa foreign key (fk_id_pessoa) references tbl_pessoa(id_pessoa)
);



#  populando a tabela carro

insert into tbl_carro (
	modelo_carro,
    ano_carro,
    cor_carro,
    placa_carro,
    fk_id_pessoa
) values (
	'celer',
    '2015',
    'Vermelho',
    'ABC1234',
    4
);

/* 
	quando você faz uma incerção e da um erro de chave 
    estrageira ele queima o numero do id 
*/


#select * from tbl_pessoa; 


 