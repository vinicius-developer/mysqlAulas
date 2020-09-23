create database if not exists db_Desafio1;

use db_Desafio1;

create table if not exists tbl_desafio(
	ID_NF tinyint not null,
    ID_ITEM tinyint not null,
    COD_PROD tinyint not null,
    VALOR_UNIT float not null,
	QUANTIDADE tinyint not null,
    DESCONTO tinyint,
    primary key(ID_NF, ID_ITEM)
);

drop table tbl_desafio;

insert into tbl_desafio(
	ID_NF,
    ID_ITEM,
    COD_PROD,
    VALOR_UNIT,
	QUANTIDADE,
    DESCONTO 
) values (
	1,
    1,
    1,
    25.00,
    10,
    5
), (
	1,
    2,
    2,
    13.50,
    3,
    null
), (
	1,
    3,
    3,
    15.00,
    2,
    null
), (
	1,
    4,
    4,
    10.00,
    1,
    null
), (
	1,
    5,
    5,
    30.00,
    1,
    null
), (
	2,
    1,
    3,
	15.00,
    4,
    null
), (
	2,
    2,
    4,
    10.00,
    5,
    null
), (
	2,
    3,
    5,
    30.00,
    7,
    null
), (
	3,
    1,
    1,
    25.00,
    5,
    null
), (
	3,
    2,
    4,
    10.00,
    4,
    null
), (
	3,
    3,
    5,
    30.00,
    5,
    null
), (
	3,
    4,
    2,
    13.50,
    7,
    null
), (
	4,
    1,
    5,
    30.00,
    10,
    15
), (
	4,
    2,
    4,
    10.00,
    12,
    5
), (
	4,
    3,
    1,
    25.00,
    13,
    5
), (
	4,
    4,
    2,
    13.50,
    15,
    5
), (
	5,
    1,
    3,
    15.00,
    3,
    null
), (
	5,
    2,
    5,
    30.00,
    6,
    null
), (
	6,
    1,
    1,
    25.00,
    22,
    15
), (
	6,
    2,
    3,
    15.00,
    25,
    20
), (
	7,
    1,
    1,
    25.00,
    10,
    3
), (
	7,
    2,
    2,
    13.50,
    10,
    4
), (
	7,
    3,
    3,
    15.00,
    10,
    4
), (
	7,
    4,
    5,
    30.00,
    10,
    1
);

# exercicio A

select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT 
from tbl_desafio 
where DESCONTO is null;

# exercicio B 

select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, 
round(VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100))) as VALOR_VENDIDO 
from tbl_desafio
where DESCONTO is not null;

select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, 
round(VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)), 2) as VALOR_VENDIDO 
from tbl_desafio
where DESCONTO > 0;

# exercicio C

update tbl_desafio 
set DESCONTO = 0 
where DESCONTO is null;

# exercicio D

select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, DESCONTO,
 QUANTIDADE * VALOR_UNIT as VALOR_TOTAL,  
 round(VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)),2) as VALOR_VENDIDO 
from tbl_desafio
where desconto is not null;

# exercicio E

/* 
Sigma é a 18ª letra do alfabeto grego
e ela significa (somatória) _
							\
                            /
                            -
*/

select ID_NF, SUM(QUANTIDADE  *  VALOR_UNIT) as VALOR_TOTAL
from tbl_desafio
group by ID_NF
order by VALOR_TOTAL DESC;

/* order by sempre será o ultimo comando */

# exercicio F

select ID_NF, sum(VALOR_UNIT*(VALOR_UNIT*(DESCONTO/100))) as VALOR_VENDIDO
from tbl_desafio
group by ID_NF
order by VALOR_VENDIDO desc;

# exercicio g

select COD_PROD, sum(QUANTIDADE) as QUANTIDADE
from tbl_desafio
group by COD_PROD
order by QUANTIDADE desc
limit 1;

# exercicio h

select ID_NF, COD_PROD, QUANTIDADE
from tbl_desafio 
where QUANTIDADE > 10
group by ID_NF and COD_PROD;

# versão mais correta

select ID_NF, sum(QUANTIDADE) as QUANTIDADE_TOTAL
from tbl_desafio 
where QUANTIDADE > 10
group by ID_NF;

# exercicio i 

select ID_NF, SUM(QUANTIDADE  *  VALOR_UNIT) as VALOR_TOT 
from tbl_desafio
group by ID_NF
having SUM(QUANTIDADE  *  VALOR_UNIT) > 500
order by VALOR_TOT desc;

# exercicio j

select COD_PROD, avg(DESCONTO) as MEDIA
from tbl_desafio
group by COD_PROD;

# exercicio k 

select COD_PROD, min(DESCONTO) as MENOR, 
max(DESCONTO) as MAIOR, avg(DESCONTO) as MEDIA
from tbl_desafio
group by COD_PROD;

# exericio l

select ID_NF, sum(QUANTIDADE) 
from tbl_desafio
where QUANTIDADE > 3
group by ID_NF;
