create database if not exists db_estoque;

use db_estoque;

create table if not exists tbl_fornecedor(
	cod_fornecedor smallint auto_increment primary key,
    local_fornec varchar(80) not null,
    tel_fornec varchar(15) not null
);     

create table if not exists tbl_pecas(
	cod_pecas varchar(20) primary key not null, 
    fk_cod_fornec smallint not null,
    qtde_estoque tinyint not null,
    constraint rel_fk_cod_fornec foreign key(fk_cod_fornec) references tbl_fornecedor(cod_fornecedor)
);

insert into tbl_fornecedor(
	local_fornec,
    tel_fornec
) values (
	'Lapa - São Paulo',
    '(11) 91234-1234'
);

insert into tbl_fornecedor(
	local_fornec,
    tel_fornec
) values (
	'Centro - Campinas',
    '(19) 94321-2356'
), (
	'Centro - Diadema',
    '(19) 94567-1234'
);

select * from tbl_fornecedor;


/*
	Para introduzir dados em um campo FK primeiro ele precisa existir 
    na outra tabela
*/

insert into tbl_pecas(
	cod_pecas,
    fk_cod_fornec,
    qtde_estoque
) values (
	'1234567890asdfghjklç',
    1,
    30
);

/*
 no caso abaixo vai dar errado pq código 6 não existe

insert into tbl_pecas(
	cod_pecas,
    fk_cod_fornec,
    qtde_estoque
) values (
	'1234567890asdfghjgkl',
    6,
    30
);
*/

# select * from tbl_pecas;

# alteração de registros 

# você fazer a alteração de registros é algo perigoso exige bastante alteração 
# para não acabar alterando as coisas erradas

# se tiver medo faça backup antes

update tbl_fornecedor 
set local_fornec = 'Rua Tito, 54 - Lapa - São Paulo' 
where cod_fornecedor = 1;

# esse comando não é permitido que seja alterado sem o where

update tbl_fornecedor 
set local_fornec = 'Av.Tiradentes, 1000 - Centro - Campinas' 
where cod_fornecedor = 2;

# para mudar mais de um campo ao mesmo tempo 

update tbl_fornecedor 
set local_fornec = 'Av.Tiradentes, 1000 - Centro - Campinas',
tel_fornec="(99) 1234-1234" 
where cod_fornecedor = 2;

# não é possivel alterar a chave primária 

# Exluir (deletar) registros tome cuidado

delete from tbl_fornecedor where cod_fornecedor=3;

# excluindo coluna da tabela

alter table tbl_fornecedor drop column local_fornec;

# inculindo coluna da tabela 

alter table tbl_fornecedor add column local_fornec varchar(80) not null;









